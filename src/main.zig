const build_options = @import("build-options");
const builtin = @import("builtin");
const std = @import("std");
const objc = @import("objc");

// Core
pub const Core = if (build_options.want_core) @import("Core.zig") else struct {};
pub const Timer = if (build_options.want_core) Core.Timer else struct {};
pub const sysjs = if (build_options.want_core) @import("mach-sysjs") else struct {};

// Mach standard library
// gamemode requires libc on linux
pub const gamemode = if (builtin.os.tag != .linux or builtin.link_libc) @import("gamemode.zig");
pub const gfx = if (build_options.want_mach) @import("gfx/main.zig") else struct {};
pub const Audio = if (build_options.want_sysaudio) @import("Audio.zig") else struct {};
pub const math = @import("math/main.zig");
pub const testing = @import("testing.zig");

pub const sysaudio = if (build_options.want_sysaudio) @import("sysaudio/main.zig") else struct {};
pub const sysgpu = if (build_options.want_sysgpu) @import("sysgpu/main.zig") else struct {};
pub const gpu = sysgpu.sysgpu;

// Module system
pub const modules = blk: {
    if (!@hasDecl(@import("root"), "modules")) {
        @compileError("expected `pub const modules = .{};` in root file");
    }
    break :blk merge(.{
        builtin_modules,
        @import("root").modules,
    });
};
pub const ModSet = @import("module/main.zig").ModSet;
pub const Modules = @import("module/main.zig").Modules(modules);
pub const Mod = ModSet(modules).Mod;
pub const ModuleName = @import("module/main.zig").ModuleName(modules);
pub const EntityID = @import("module/main.zig").EntityID; // TODO: rename to just Entity?
pub const Archetype = @import("module/main.zig").Archetype;

pub const ModuleID = @import("module/main.zig").ModuleID;
pub const SystemID = @import("module/main.zig").SystemID;
pub const AnySystem = @import("module/main.zig").AnySystem;
pub const merge = @import("module/main.zig").merge;
pub const builtin_modules = @import("module/main.zig").builtin_modules;
pub const Entities = @import("module/main.zig").Entities;

pub const is_debug = builtin.mode == .Debug;

const AppDelegate = opaque {
    pub const InternalInfo = objc.objc.ExternClass("AppDelegate", AppDelegate, objc.foundation.Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub fn as(self: *AppDelegate, comptime T: type) *T {
        if (T == objc.app_kit.ApplicationDelegate) return @ptrCast(self);
        return InternalInfo.as(self, T);
    }

    pub const allocInit = InternalInfo.allocInit;

    pub fn setRunBlock(self: *AppDelegate, block: *objc.dispatch.Block) void {
        method(self, block);
    }
    const method = @extern(
        *const fn (*AppDelegate, *objc.dispatch.Block) callconv(.C) void,
        .{ .name = "\x01-[AppDelegate setRunBlock:]" },
    );
};

fn mainRunLoopBlock(block: *objc.system.BlockLiteral(*App)) callconv(.C) void {
    var stack_space: [8 * 1024 * 1024]u8 = undefined;

    const app = block.context;

    std.debug.print("Starting run loop...\n", .{});
    // Main loop
    while (!app.mods.mod.mach_core.state().should_close) {
        // Dispatch events until queue is empty
        app.mods.dispatch(&stack_space, .{}) catch return; // TODO: report the error
        // Run `update` when `init` and all other systems are exectued
        app.mods.schedule(app.main_mod, .update);

        // Drain the `CFRunLoop`
        while (true) {
            const mode = objc.core_foundation.RunLoop.Mode.default.*;
            const status = objc.core_foundation.RunLoop.runInMode(mode, 0.0, false);
            if (status == .handled_source) {
                // Keep running the `CFRunLoop` while there is work to be done
                continue;
            }
            if (status == .timed_out) {
                // `CFRunLoop` has been drained, switch back to running Mach's run loop
                break;
            }

            // This is unexpected and shouldn't happen
            std.debug.print("Run loop unexpectedly returned {} (weird, right?)\n", .{status});
            app.mods.mod.mach_core.state().should_close = true;
            break;
        }
    }

    // Final Dispatch to deinitalize resources
    app.mods.schedule(app.main_mod, .deinit);
    app.mods.dispatch(&stack_space, .{}) catch return; // TODO: report the error
    app.mods.schedule(.mach_core, .deinit);
    app.mods.dispatch(&stack_space, .{}) catch return; // TODO: report the error
}

fn initDelegateUiKit(block: ?*anyopaque) callconv(.C) void {
    const app = objc.ui_kit.Application.sharedApplication();
    const delegate: *AppDelegate = @ptrCast(app.delegate());
    delegate.setRunBlock(@ptrCast(block));
}

pub const App = struct {
    mods: *Modules,
    comptime main_mod: ModuleName = .app,

    pub fn init(allocator: std.mem.Allocator, comptime main_mod: ModuleName) !App {
        var mods: *Modules = try allocator.create(Modules);
        try mods.init(allocator);

        return .{
            .mods = mods,
            .main_mod = main_mod,
        };
    }

    pub fn deinit(app: *App, allocator: std.mem.Allocator) void {
        app.mods.deinit(allocator);
        allocator.destroy(app.mods);
    }

    pub fn run(app: *App, core_options: Core.InitOptions) !void {
        app.mods.mod.mach_core.init(undefined); // TODO
        app.mods.scheduleWithArgs(.mach_core, .init, .{core_options});
        app.mods.schedule(app.main_mod, .init);

        const pool = objc.objc.autoreleasePoolPush();
        defer objc.objc.autoreleasePoolPop(pool);

        var block = objc.dispatch.stackBlockLiteral(mainRunLoopBlock, app, null, null);

        if (comptime builtin.os.tag == .macos) {
            const ns_app = objc.app_kit.Application.sharedApplication();
            const delegate = AppDelegate.allocInit();
            defer delegate.release();
            delegate.setRunBlock(block.asBlock());
            ns_app.setDelegate(delegate.as(objc.app_kit.ApplicationDelegate));
            ns_app.run();
        } else {
            const main_queue = objc.dispatch.Queue.main;
            main_queue.dispatchAsyncF(block.asBlock(), initDelegateUiKit);
            const delegate_class_name = objc.foundation.String.literalWithUniqueId("AppDelegate", "0");
            const argc: c_int = @bitCast(@as(c_uint, @truncate(std.os.argv.len)));
            _ = objc.ui_kit.applicationMain(argc, @ptrCast(std.os.argv.ptr), null, delegate_class_name);
        }
    }
};

test {
    // TODO: refactor code so we can use this here:
    // std.testing.refAllDeclsRecursive(@This());
    _ = Core;
    _ = gpu;
    _ = sysaudio;
    _ = sysgpu;
    _ = gfx;
    _ = math;
    _ = testing;
    std.testing.refAllDeclsRecursive(@import("module/Archetype.zig"));
    std.testing.refAllDeclsRecursive(@import("module/entities.zig"));
    // std.testing.refAllDeclsRecursive(@import("module/main.zig"));
    std.testing.refAllDeclsRecursive(@import("module/module.zig"));
    std.testing.refAllDeclsRecursive(@import("module/StringTable.zig"));
    std.testing.refAllDeclsRecursive(gamemode);
    std.testing.refAllDeclsRecursive(math);
}

comptime {
    asm (
        \\    .section __DATA,__objc_imageinfo,regular,no_dead_strip
        \\L_OBJC_IMAGE_INFO:
        \\    .long 0
        \\    .long 64
    );
}
