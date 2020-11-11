// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 496 - fxc/glsl_SM_4_0_VAF_BYTE_4_SWIZZLE_rigidcommon.hlsl_VS_vs40_shadow_pointlight.glsl
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
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;

out vec4 vsOut_T0;

void main()
{
  vec4 r0;

/*0*/	gl_Position.w = 1.000000;
/*1*/	r0.xyz = (vsIn_P0.xyzx).xyz;
/*2*/	r0.w = 1.000000;
/*3*/	gl_Position.x = dot(r0.xyzw, vsIn_P1.xyzw);
/*4*/	gl_Position.y = dot(r0.xyzw, vsIn_P2.xyzw);
/*5*/	gl_Position.z = dot(r0.xyzw, vsIn_P3.xyzw);
/*6*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*7*/	return;
}
