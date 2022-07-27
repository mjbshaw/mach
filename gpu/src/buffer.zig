const std = @import("std");
const ChainedStruct = @import("types.zig").ChainedStruct;
const MapModeFlags = @import("types.zig").MapModeFlags;
const impl = @import("interface.zig").impl;

pub const Buffer = *opaque {
    pub inline fn destroy(buffer: Buffer) void {
        impl.bufferDestroy(buffer);
    }

    pub inline fn bufferGetConstMappedRange(buffer: Buffer, offset: usize, size: usize) ?*const anyopaque {
        return impl.bufferGetConstMappedRange(buffer, offset, size);
    }

    pub inline fn bufferGetMappedRange(buffer: Buffer, offset: usize, size: usize) ?*anyopaque {
        return impl.bufferGetMappedRange(buffer, offset, size);
    }

    pub inline fn bufferGetSize(buffer: Buffer) u64 {
        return impl.bufferGetSize(buffer);
    }

    pub inline fn bufferGetUsage(buffer: Buffer) BufferUsage {
        return impl.bufferGetUsage(buffer);
    }

    pub inline fn bufferMapAsync(buffer: Buffer, mode: MapModeFlags, offset: usize, size: usize, callback: BufferMapCallback, userdata: *anyopaque) void {
        impl.bufferMapAsync(buffer, mode, offset, size, callback, userdata);
    }

    pub inline fn bufferSetLabel(buffer: Buffer, label: [*:0]const u8) void {
        impl.bufferSetLabel(buffer, label);
    }

    pub inline fn bufferUnmap(buffer: Buffer) void {
        impl.bufferUnmap(buffer);
    }

    pub inline fn bufferReference(buffer: Buffer) void {
        impl.bufferReference(buffer);
    }

    pub inline fn bufferRelease(buffer: Buffer) void {
        impl.bufferRelease(buffer);
    }
};

pub const BufferMapCallback = fn (status: BufferMapAsyncStatus, userdata: *anyopaque) callconv(.C) void;

pub const BufferBindingType = enum(u32) {
    undef = 0x00000000,
    uniform = 0x00000001,
    storage = 0x00000002,
    read_only_storage = 0x00000003,
};

pub const BufferMapAsyncStatus = enum(u32) {
    success = 0x00000000,
    err = 0x00000001,
    unknown = 0x00000002,
    device_lost = 0x00000003,
    destroyed_before_callback = 0x00000004,
    unmapped_before_callback = 0x00000005,
};

pub const BufferUsage = packed struct {
    map_read: bool = false,
    map_write: bool = false,
    copy_src: bool = false,
    copy_dst: bool = false,
    index: bool = false,
    vertex: bool = false,
    uniform: bool = false,
    storage: bool = false,
    indirect: bool = false,
    query_resolve: bool = false,

    _padding: u22 = 0,

    comptime {
        std.debug.assert(
            @sizeOf(@This()) == @sizeOf(u32) and
                @bitSizeOf(@This()) == @bitSizeOf(u32),
        );
    }

    pub const none = BufferUsage{};

    pub fn equal(a: BufferUsage, b: BufferUsage) bool {
        return @truncate(u10, @bitCast(u32, a)) == @truncate(u10, @bitCast(u32, b));
    }
};

pub const BufferBindingLayout = extern struct {
    next_in_chain: *const ChainedStruct,
    type: BufferBindingType,
    has_dynamic_offset: bool = false,
    min_binding_size: u64 = 0,
};

pub const BufferDescriptor = extern struct {
    next_in_chain: *const ChainedStruct,
    label: ?[*:0]const u8 = null,
    usage: BufferUsage,
    size: u64,
    mapped_at_creation: bool,
};
