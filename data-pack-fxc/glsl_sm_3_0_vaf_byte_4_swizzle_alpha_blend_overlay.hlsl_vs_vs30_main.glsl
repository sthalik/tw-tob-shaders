// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 196 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_alpha_blend_overlay.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;

void main()
{
/*0*/	gl_Position.xyz = (vsIn_P0.xyzx).xyz;
/*1*/	gl_Position.w = 1.000000;
/*2*/	return;
}
