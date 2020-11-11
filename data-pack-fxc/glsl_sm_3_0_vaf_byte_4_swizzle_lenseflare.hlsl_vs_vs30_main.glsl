// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 354 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_LenseFlare.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_T0;

out vec4 vsOut_T0;

layout(std140) uniform lense_flare_VS
{
  vec4 data[3];
} cb0;

void main()
{
/*0*/	gl_Position.xy = (vsIn_P0.xyxx * cb0.data[2].xyxx + cb0.data[2].zwzz).xy;
/*1*/	gl_Position.zw = (vec4(0, 0, 0, 1.000000)).zw;
/*2*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*3*/	return;
}
