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
input_state: InputState = .{},
// modifiers: KeyMods,

title: [:0]const u8,
display_mode: DisplayMode,
vsync_mode: VSyncMode = .none,
cursor_mode: CursorMode = .normal,
cursor_shape: CursorShape = .arrow,
border: bool,
headless: bool,
refresh_rate: u32,
size: Size,
surface_descriptor: gpu.Surface.Descriptor,
window: ?*objc.app_kit.Window,

// Called on the main thread
pub fn init(darwin: *Darwin, options: InitOptions) !void {
    var surface_descriptor = gpu.Surface.Descriptor{};
    var window: ?*objc.app_kit.Window = null;
    if (!options.headless) {
        const metal_descriptor = try options.allocator.create(gpu.Surface.DescriptorFromMetalLayer);
        const layer = objc.quartz_core.MetalLayer.allocInit();
        defer layer.release();
        metal_descriptor.* = .{
            .layer = layer,
        };
        surface_descriptor.next_in_chain = .{ .from_metal_layer = metal_descriptor };

        const screen = objc.app_kit.Screen.mainScreen();
        const rect = objc.foundation.Rect{ // TODO: use a meaningful rect
            .origin = .{ .x = 100, .y = 100 },
            .size = .{ .width = 540, .height = 960 },
        };
        const window_style = objc.app_kit.WindowStyleMask{
            .full_screen = options.display_mode == .fullscreen,
            .titled = options.display_mode == .windowed,
            .closable = options.display_mode == .windowed,
            .miniaturizable = options.display_mode == .windowed,
            .resizable = options.display_mode == .windowed,
        };
        window = objc.app_kit.Window.alloc().initWithContentRect_styleMask_backing_defer_screen(rect, window_style, .buffered, true, screen);
        window.?.setReleasedWhenClosed(false);
        window.?.contentView().setLayer(layer.as(objc.quartz_core.Layer));
        window.?.setIsVisible(true);
        window.?.makeKeyAndOrderFront(null);
    }

    var events = EventQueue.init(options.allocator);
    try events.ensureTotalCapacity(2048);

    darwin.* = .{
        .allocator = options.allocator,
        .core = @fieldParentPtr("platform", darwin),
        .events = events,
        .title = options.title,
        .display_mode = options.display_mode,
        .border = options.border,
        .headless = options.headless,
        .refresh_rate = 60, // TODO: set to something meaningful
        .size = options.size,
        .surface_descriptor = surface_descriptor,
        .window = window,
    };
}

pub fn deinit(darwin: *Darwin) void {
    if (darwin.window) |w| w.release();
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
