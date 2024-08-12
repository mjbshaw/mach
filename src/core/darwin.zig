const std = @import("std");
const builtin = @import("builtin");
const mach = @import("../main.zig");
const Core = @import("../Core.zig");
const InputState = @import("InputState.zig");
const Frequency = @import("Frequency.zig");
const unicode = @import("unicode.zig");
const detectBackendType = @import("common.zig").detectBackendType;
const gpu = mach.gpu;
const InitOptions = Core.InitOptions;
const Event = Core.Event;
const KeyEvent = Core.KeyEvent;
const MouseButtonEvent = Core.MouseButtonEvent;
const MouseButton = Core.MouseButton;
const Size = Core.Size;
const DisplayMode = Core.DisplayMode;
const CursorShape = Core.CursorShape;
const VSyncMode = Core.VSyncMode;
const CursorMode = Core.CursorMode;
const Position = Core.Position;
const Key = Core.Key;
const KeyMods = Core.KeyMods;
const Joystick = Core.Joystick;
const objc = @import("objc");

const log = std.log.scoped(.mach);

const EventQueue = std.fifo.LinearFifo(Event, .Dynamic);
pub const EventIterator = struct {
    queue: *EventQueue,

    pub inline fn next(self: *EventIterator) ?Event {
        return self.queue.readItem();
    }
};

pub const Darwin = @This();

allocator: std.mem.Allocator,
core: *Core,

events: EventQueue,
input_state: InputState,
modifiers: KeyMods,

title: [:0]u8,
display_mode: DisplayMode,
vsync_mode: VSyncMode,
cursor_mode: CursorMode,
cursor_shape: CursorShape,
border: bool,
headless: bool,
refresh_rate: u32,
size: Size,
surface_descriptor: gpu.Surface.Descriptor,
init_options: InitOptions,

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

fn runBlock(block: *objc.system.BlockLiteral(*Darwin)) callconv(.C) void {
    const darwin = block.context;
    _ = darwin;

    while (true) {
        const timeout_seconds = 1.0;
        const mode = objc.core_foundation.RunLoop.Mode.default;
        switch (objc.core_foundation.RunLoop.runInMode(mode, timeout_seconds, false)) {
            .finished => {
                std.debug.print("Run loop finished (weird, right?)\n", .{});
                return;
            },
            .stopped => {
                std.debug.print("Run loop was stopped (weird, right?)\n", .{});
                return;
            },
            .timed_out => {
                std.debug.print("Nothing to do...\n", .{});
            },
            .handled_source => continue,
            _ => |result| {
                std.debug.print("CFRunLoopRunInMode returned {}, which is weird and shouldn't happen.\n", .{result});
                return;
            },
        }
    }
}

fn initDelegateUiKit(block: ?*anyopaque) callconv(.C) void {
    const app = objc.ui_kit.Application.sharedApplication();
    const delegate: *AppDelegate = @ptrCast(app.delegate());
    delegate.setRunBlock(@ptrCast(block));
}

// Called on the main thread
pub fn init(self: *Darwin, options: InitOptions) !void {
    self.init_options = options;

    const pool = objc.objc.autoreleasePoolPush();
    defer objc.objc.autoreleasePoolPop(pool);

    var block = objc.dispatch.stackBlockLiteral(runBlock, self, null, null);

    if (comptime builtin.os.tag == .macos) {
        const app = objc.app_kit.Application.sharedApplication();
        const delegate = AppDelegate.allocInit();
        defer delegate.release();
        delegate.setRunBlock(block.asBlock());
        app.setDelegate(delegate.as(objc.app_kit.ApplicationDelegate));
        app.run();
    } else {
        const main_queue = objc.dispatch.Queue.main;
        main_queue.dispatchAsyncF(block.asBlock(), initDelegateUiKit);
        const delegate_class_name = objc.foundation.String.literalWithUniqueId("AppDelegate", "0");
        const argc: c_int = @bitCast(@as(c_uint, @truncate(std.os.argv.len)));
        _ = objc.ui_kit.applicationMain(argc, @ptrCast(std.os.argv.ptr), null, delegate_class_name);
    }
}

pub fn deinit(_: *Darwin) void {
    return;
}

// Called on the main thread
pub fn update(_: *Darwin) !void {
    return;
}

// May be called from any thread.
pub inline fn pollEvents(n: *Darwin) EventIterator {
    return EventIterator{ .queue = &n.events };
}

// May be called from any thread.
pub fn setTitle(_: *Darwin, _: [:0]const u8) void {
    return;
}

// May be called from any thread.
pub fn setDisplayMode(_: *Darwin, _: DisplayMode) void {
    return;
}

// May be called from any thread.
pub fn setBorder(_: *Darwin, _: bool) void {
    return;
}

// May be called from any thread.
pub fn setHeadless(_: *Darwin, _: bool) void {
    return;
}

// May be called from any thread.
pub fn setVSync(_: *Darwin, _: VSyncMode) void {
    return;
}

// May be called from any thread.
pub fn setSize(_: *Darwin, _: Size) void {
    return;
}

// May be called from any thread.
pub fn size(_: *Darwin) Size {
    return Size{ .width = 100, .height = 100 };
}

// May be called from any thread.
pub fn setCursorMode(_: *Darwin, _: CursorMode) void {
    return;
}

// May be called from any thread.
pub fn setCursorShape(_: *Darwin, _: CursorShape) void {
    return;
}

// May be called from any thread.
pub fn joystickPresent(_: *Darwin, _: Joystick) bool {
    return false;
}

// May be called from any thread.
pub fn joystickName(_: *Darwin, _: Joystick) ?[:0]const u8 {
    return null;
}

// May be called from any thread.
pub fn joystickButtons(_: *Darwin, _: Joystick) ?[]const bool {
    return null;
}

// May be called from any thread.
pub fn joystickAxes(_: *Darwin, _: Joystick) ?[]const f32 {
    return null;
}

// May be called from any thread.
pub fn keyPressed(_: *Darwin, _: Key) bool {
    return false;
}

// May be called from any thread.
pub fn keyReleased(_: *Darwin, _: Key) bool {
    return true;
}

// May be called from any thread.
pub fn mousePressed(_: *Darwin, _: MouseButton) bool {
    return false;
}

// May be called from any thread.
pub fn mouseReleased(_: *Darwin, _: MouseButton) bool {
    return true;
}

// May be called from any thread.
pub fn mousePosition(_: *Darwin) Position {
    return Position{ .x = 0, .y = 0 };
}

comptime {
    asm (
        \\    .section __DATA,__objc_imageinfo,regular,no_dead_strip
        \\L_OBJC_IMAGE_INFO:
        \\    .long 0
        \\    .long 64
    );
}
