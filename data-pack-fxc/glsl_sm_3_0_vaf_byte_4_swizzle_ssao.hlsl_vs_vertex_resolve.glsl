// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1431 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_ssao.hlsl_VS_vertex_resolve.glsl
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

layout(std140) uniform ssao_resolve_VS
{
  vec4 data[2];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	gl_Position.xyzw = vsIn_P0.xyzw;
/*1*/	r0.x = cb0.data[0].z * 0.500000;
/*2*/	r0.x = sin(r0.x); r1.x = cos(r0.x);
/*3*/	r0.x = r0.x / r1.x;
/*4*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.x)).y;
/*5*/	r0.z = cb0.data[0].y / cb0.data[0].x;
/*6*/	r0.x = r0.z * r0.y;
/*7*/	vsOut_T0.xy = (vsIn_P0.xyxx / r0.xyxx).xy;
/*8*/	vsOut_T0.zw = (vsIn_T0.xxxy).zw;
/*9*/	return;
}
