// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1507 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidterrain.hlsl_VS_vs_normalize.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;

out vec4 vsOut_T0;
out vec4 vsOut_T1;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
/*0*/	gl_Position.xyzw = vsIn_P0.xyzw;
/*1*/	vsOut_T0.xy = (vec4(0, 0, 0, 0)).xy;
/*2*/	vsOut_T1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*3*/	return;
}
