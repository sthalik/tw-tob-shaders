//
//
// Shader Model 4
// Fragment Shader
//
// id: 10290 - fxc/glsl_SM_3_0_WaterRefraction.hlsl_PS_ps30_main_4_channel.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D s_light_accumulation_buffer;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xy = (cb0.data[27].xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*1*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*2*/	r0.xy = (r0.zwzz / r0.xyxx).xy;
/*3*/	color0.xyzw = (textureLod(s_light_accumulation_buffer, r0.xyxx.st, r0.y)).xyzw;
/*4*/	return;
}
