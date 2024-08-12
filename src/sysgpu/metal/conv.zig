const mtl = @import("objc").metal;
const sysgpu = @import("../sysgpu/main.zig");

pub fn metalBlendFactor(factor: sysgpu.BlendFactor, color: bool) mtl.BlendFactor {
    return switch (factor) {
        .zero => .zero,
        .one => .one,
        .src => .source_color,
        .one_minus_src => .one_minus_source_color,
        .src_alpha => .source_alpha,
        .one_minus_src_alpha => .one_minus_source_alpha,
        .dst => .destination_color,
        .one_minus_dst => .one_minus_destination_color,
        .dst_alpha => .destination_alpha,
        .one_minus_dst_alpha => .one_minus_destination_alpha,
        .src_alpha_saturated => .source_alpha_saturated,
        .constant => if (color) .blend_color else .blend_alpha,
        .one_minus_constant => if (color) .one_minus_blend_color else .one_minus_blend_alpha,
        .src1 => .source1_color,
        .one_minus_src1 => .one_minus_source1_color,
        .src1_alpha => .source1_alpha,
        .one_minus_src1_alpha => .one_minus_source1_alpha,
    };
}

pub fn metalBlendOperation(op: sysgpu.BlendOperation) mtl.BlendOperation {
    return switch (op) {
        .add => .add,
        .subtract => .subtract,
        .reverse_subtract => .reverse_subtract,
        .min => .min,
        .max => .max,
    };
}

pub fn metalColorWriteMask(mask: sysgpu.ColorWriteMaskFlags) mtl.ColorWriteMask {
    return .{
        .red = mask.red,
        .green = mask.green,
        .blue = mask.blue,
        .alpha = mask.alpha,
    };
}

pub fn metalCommonCounter(name: sysgpu.PipelineStatisticName) mtl.CommonCounter {
    return switch (name) {
        .vertex_shader_invocations => mtl.CommonCounter.vertex_invocations,
        .clipper_invocations => mtl.CommonCounter.clipper_invocations,
        .clipper_primitives_out => mtl.CommonCounter.clipper_primitives_out,
        .fragment_shader_invocations => mtl.CommonCounter.fragment_invocations,
        .compute_shader_invocations => mtl.CommonCounter.compute_kernel_invocations,
    };
}

pub fn metalCompareFunction(func: sysgpu.CompareFunction) mtl.CompareFunction {
    return switch (func) {
        .undefined => unreachable,
        .never => .never,
        .less => .less,
        .less_equal => .less_equal,
        .greater => .greater,
        .greater_equal => .greater_equal,
        .equal => .equal,
        .not_equal => .not_equal,
        .always => .always,
    };
}

pub fn metalCullMode(mode: sysgpu.CullMode) mtl.CullMode {
    return switch (mode) {
        .none => .none,
        .front => .front,
        .back => .back,
    };
}

pub fn metalIndexType(format: sysgpu.IndexFormat) mtl.IndexType {
    return switch (format) {
        .undefined => unreachable,
        .uint16 => .uint16,
        .uint32 => .uint32,
    };
}

pub fn metalIndexElementSize(format: sysgpu.IndexFormat) usize {
    return switch (format) {
        .undefined => unreachable,
        .uint16 => 2,
        .uint32 => 4,
    };
}

pub fn metalLoadAction(op: sysgpu.LoadOp) mtl.LoadAction {
    return switch (op) {
        .undefined => .dont_care,
        .load => .load,
        .clear => .clear,
    };
}

pub fn metalPixelFormat(format: sysgpu.Texture.Format) mtl.PixelFormat {
    return switch (format) {
        .undefined => .invalid,
        .r8_unorm => .r8_unorm,
        .r8_snorm => .r8_snorm,
        .r8_uint => .r8_uint,
        .r8_sint => .r8_sint,
        .r16_uint => .r16_uint,
        .r16_sint => .r16_sint,
        .r16_float => .r16_float,
        .rg8_unorm => .rg8_unorm,
        .rg8_snorm => .rg8_snorm,
        .rg8_uint => .rg8_uint,
        .rg8_sint => .rg8_sint,
        .r32_float => .r32_float,
        .r32_uint => .r32_uint,
        .r32_sint => .r32_sint,
        .rg16_uint => .rg16_uint,
        .rg16_sint => .rg16_sint,
        .rg16_float => .rg16_float,
        .rgba8_unorm => .rgba8_unorm,
        .rgba8_unorm_srgb => .rgba8_unorm_srgb,
        .rgba8_snorm => .rgba8_snorm,
        .rgba8_uint => .rgba8_uint,
        .rgba8_sint => .rgba8_sint,
        .bgra8_unorm => .bgra8_unorm,
        .bgra8_unorm_srgb => .bgra8_unorm_srgb,
        .rgb10_a2_unorm => .rgb10_a2_unorm,
        .rg11_b10_ufloat => .rg11_b10_float,
        .rgb9_e5_ufloat => .rgb9_e5_float,
        .rg32_float => .rg32_float,
        .rg32_uint => .rg32_uint,
        .rg32_sint => .rg32_sint,
        .rgba16_uint => .rgba16_uint,
        .rgba16_sint => .rgba16_sint,
        .rgba16_float => .rgba16_float,
        .rgba32_float => .rgba32_float,
        .rgba32_uint => .rgba32_uint,
        .rgba32_sint => .rgba32_sint,
        .stencil8 => .stencil8,
        .depth16_unorm => .depth16_unorm,
        .depth24_plus => .depth32_float, // depth24_unorm_stencil8 only for non-Apple Silicon
        .depth24_plus_stencil8 => .depth32_float_stencil8, // depth24_unorm_stencil8 only for non-Apple Silicon
        .depth32_float => .depth32_float,
        .depth32_float_stencil8 => .depth32_float_stencil8,
        .bc1_rgba_unorm => .bc1_rgba,
        .bc1_rgba_unorm_srgb => .bc1_rgba_srgb,
        .bc2_rgba_unorm => .bc2_rgba,
        .bc2_rgba_unorm_srgb => .bc2_rgba_srgb,
        .bc3_rgba_unorm => .bc3_rgba,
        .bc3_rgba_unorm_srgb => .bc3_rgba_srgb,
        .bc4_runorm => .bc4_r_unorm,
        .bc4_rsnorm => .bc4_r_snorm,
        .bc5_rg_unorm => .bc5_rg_unorm,
        .bc5_rg_snorm => .bc5_rg_snorm,
        .bc6_hrgb_ufloat => .bc6_h_rgb_ufloat,
        .bc6_hrgb_float => .bc6_h_rgb_float,
        .bc7_rgba_unorm => .bc7_rgba_unorm,
        .bc7_rgba_unorm_srgb => .bc7_rgba_unorm_srgb,
        .etc2_rgb8_unorm => .etc2_rgb8,
        .etc2_rgb8_unorm_srgb => .etc2_rgb8_srgb,
        .etc2_rgb8_a1_unorm => .etc2_rgb8_a1,
        .etc2_rgb8_a1_unorm_srgb => .etc2_rgb8_a1_srgb,
        .etc2_rgba8_unorm => .eac_rgba8,
        .etc2_rgba8_unorm_srgb => .eac_rgba8_srgb,
        .eacr11_unorm => .eac_r11_unorm,
        .eacr11_snorm => .eac_r11_snorm,
        .eacrg11_unorm => .eac_rg11_unorm,
        .eacrg11_snorm => .eac_rg11_snorm,
        .astc4x4_unorm => .astc_4x4_ldr,
        .astc4x4_unorm_srgb => .astc_4x4_srgb,
        .astc5x4_unorm => .astc_5x4_ldr,
        .astc5x4_unorm_srgb => .astc_5x4_srgb,
        .astc5x5_unorm => .astc_5x5_ldr,
        .astc5x5_unorm_srgb => .astc_5x5_srgb,
        .astc6x5_unorm => .astc_6x5_ldr,
        .astc6x5_unorm_srgb => .astc_6x5_srgb,
        .astc6x6_unorm => .astc_6x6_ldr,
        .astc6x6_unorm_srgb => .astc_6x6_srgb,
        .astc8x5_unorm => .astc_8x5_ldr,
        .astc8x5_unorm_srgb => .astc_8x5_srgb,
        .astc8x6_unorm => .astc_8x6_ldr,
        .astc8x6_unorm_srgb => .astc_8x6_srgb,
        .astc8x8_unorm => .astc_8x8_ldr,
        .astc8x8_unorm_srgb => .astc_8x8_srgb,
        .astc10x5_unorm => .astc_10x5_ldr,
        .astc10x5_unorm_srgb => .astc_10x5_srgb,
        .astc10x6_unorm => .astc_10x6_ldr,
        .astc10x6_unorm_srgb => .astc_10x6_srgb,
        .astc10x8_unorm => .astc_10x8_ldr,
        .astc10x8_unorm_srgb => .astc_10x8_srgb,
        .astc10x10_unorm => .astc_10x10_ldr,
        .astc10x10_unorm_srgb => .astc_10x10_srgb,
        .astc12x10_unorm => .astc_12x10_ldr,
        .astc12x10_unorm_srgb => .astc_12x10_srgb,
        .astc12x12_unorm => .astc_12x12_ldr,
        .astc12x12_unorm_srgb => .astc_12x12_srgb,
        .r8_bg8_biplanar420_unorm => unreachable,
    };
}

pub fn metalPixelFormatForView(viewFormat: sysgpu.Texture.Format, textureFormat: mtl.PixelFormat, aspect: sysgpu.Texture.Aspect) mtl.PixelFormat {
    // TODO - depth/stencil only views
    _ = aspect;
    _ = textureFormat;

    return metalPixelFormat(viewFormat);
}

pub fn metalPrimitiveTopologyClass(topology: sysgpu.PrimitiveTopology) mtl.PrimitiveTopologyClass {
    return switch (topology) {
        .point_list => .point,
        .line_list => .line,
        .line_strip => .line,
        .triangle_list => .triangle,
        .triangle_strip => .triangle,
    };
}

pub fn metalPrimitiveType(topology: sysgpu.PrimitiveTopology) mtl.PrimitiveType {
    return switch (topology) {
        .point_list => .point,
        .line_list => .line,
        .line_strip => .line_strip,
        .triangle_list => .triangle,
        .triangle_strip => .triangle_strip,
    };
}

pub fn metalResourceOptionsForBuffer(usage: sysgpu.Buffer.UsageFlags) mtl.ResourceOptions {
    return .{
        .cpu_cache_mode = if (usage.map_write and !usage.map_read) .write_combined else .default_cache,
        .storage_mode = .shared, // optimizing for UMA only
        .hazard_tracking_mode = .default,
    };
}

pub fn metalSamplerAddressMode(mode: sysgpu.Sampler.AddressMode) mtl.SamplerAddressMode {
    return switch (mode) {
        .repeat => .repeat,
        .mirror_repeat => .mirror_repeat,
        .clamp_to_edge => .clamp_to_edge,
    };
}

pub fn metalSamplerMinMagFilter(mode: sysgpu.FilterMode) mtl.SamplerMinMagFilter {
    return switch (mode) {
        .nearest => .nearest,
        .linear => .linear,
    };
}

pub fn metalSamplerMipFilter(mode: sysgpu.MipmapFilterMode) mtl.SamplerMipFilter {
    return switch (mode) {
        .nearest => .nearest,
        .linear => .linear,
    };
}

pub fn metalStencilOperation(op: sysgpu.StencilOperation) mtl.StencilOperation {
    return switch (op) {
        .keep => .keep,
        .zero => .zero,
        .replace => .replace,
        .invert => .invert,
        .increment_clamp => .increment_clamp,
        .decrement_clamp => .decrement_clamp,
        .increment_wrap => .increment_wrap,
        .decrement_wrap => .decrement_wrap,
    };
}

pub fn metalStorageModeForTexture(usage: sysgpu.Texture.UsageFlags) mtl.StorageMode {
    if (usage.transient_attachment) {
        return .memoryless;
    } else {
        return .private;
    }
}

pub fn metalStoreAction(op: sysgpu.StoreOp, has_resolve_target: bool) mtl.StoreAction {
    return switch (op) {
        .undefined => unreachable,
        .store => if (has_resolve_target) .store_and_multisample_resolve else .store,
        .discard => if (has_resolve_target) .multisample_resolve else .dont_care,
    };
}

pub fn metalTextureType(dimension: sysgpu.Texture.Dimension, size: sysgpu.Extent3D, sample_count: u32) mtl.TextureType {
    return switch (dimension) {
        .dimension_1d => if (size.depth_or_array_layers > 1) .one_d_array else .one_d,
        .dimension_2d => if (sample_count > 1)
            if (size.depth_or_array_layers > 1)
                .two_d_multisample_array
            else
                .two_d_multisample
        else if (size.depth_or_array_layers > 1)
            .two_d_array
        else
            .two_d,
        .dimension_3d => .three_d,
    };
}

pub fn metalTextureTypeForView(dimension: sysgpu.TextureView.Dimension) mtl.TextureType {
    return switch (dimension) {
        .dimension_undefined => unreachable,
        .dimension_1d => .one_d,
        .dimension_2d => .two_d,
        .dimension_2d_array => .two_d_array,
        .dimension_cube => .cube,
        .dimension_cube_array => .cube_array,
        .dimension_3d => .three_d,
    };
}

pub fn metalTextureUsage(usage: sysgpu.Texture.UsageFlags, view_format_count: usize) mtl.TextureUsage {
    return .{
        .shader_read = usage.texture_binding,
        .shader_write = usage.storage_binding,
        .render_target = usage.render_attachment,
        .pixel_format_view = view_format_count > 0,
    };
}

pub fn metalVertexFormat(format: sysgpu.VertexFormat) mtl.VertexFormat {
    return switch (format) {
        .undefined => .invalid,
        .uint8x2 => .uchar2,
        .uint8x4 => .uchar4,
        .sint8x2 => .char2,
        .sint8x4 => .char4,
        .unorm8x2 => .uchar2_normalized,
        .unorm8x4 => .uchar4_normalized,
        .snorm8x2 => .char2_normalized,
        .snorm8x4 => .char4_normalized,
        .uint16x2 => .ushort2,
        .uint16x4 => .ushort4,
        .sint16x2 => .short2,
        .sint16x4 => .short4,
        .unorm16x2 => .ushort2_normalized,
        .unorm16x4 => .ushort4_normalized,
        .snorm16x2 => .short2_normalized,
        .snorm16x4 => .short4_normalized,
        .float16x2 => .half2,
        .float16x4 => .half4,
        .float32 => .float,
        .float32x2 => .float2,
        .float32x3 => .float3,
        .float32x4 => .float4,
        .uint32 => .uint,
        .uint32x2 => .uint2,
        .uint32x3 => .uint3,
        .uint32x4 => .uint4,
        .sint32 => .int,
        .sint32x2 => .int2,
        .sint32x3 => .int3,
        .sint32x4 => .int4,
    };
}

pub fn metalVertexStepFunction(mode: sysgpu.VertexStepMode) mtl.VertexStepFunction {
    return switch (mode) {
        .vertex => .per_vertex,
        .instance => .per_instance,
        .vertex_buffer_not_used => undefined,
    };
}

pub fn metalWinding(face: sysgpu.FrontFace) mtl.Winding {
    return switch (face) {
        .ccw => .counter_clockwise,
        .cw => .clockwise,
    };
}
