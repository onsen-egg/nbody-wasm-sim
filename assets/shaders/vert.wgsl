struct CameraUniform {
    view_proj: mat4x4<f32>,
};
@group(0) @binding(0)
var<uniform> camera: CameraUniform;

struct Input {
    @location(0) position: vec3<f32>,
    @location(1) uv: vec2<f32>,
}

struct Output {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

// Vertex shader
@vertex
fn vs_main(
    model: Input,
) -> Output {
    var out: Output;
    out.uv = model.uv;
    out.clip_position = camera.view_proj * vec4<f32>(model.position, 1.0);
    return out;
}