// Flat Varyings: 1 2 3

//
// Shader Model 4
// Vertex Shader
//
// id: 1495 - fxc/glsl_SM_4_0_rigidterrain.hlsl_VS_vs30_far_blend.glsl
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
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;

out vec4 vsOut_T0;
flat out vec4 vsOut_T1;
flat out vec4 vsOut_T2;
flat out vec4 vsOut_T3;

layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb0;
layout(std140) uniform ps_height_map_cb
{
  vec4 data[9];
} cb1;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  vsOut_T2 = vec4(0);
  vsOut_T3 = vec4(0);
  vec4 r0;

/*0*/	r0.xy = (vsIn_T2.xzxx).xy;
/*1*/	r0.zw = (vsIn_T1.xxxz).zw;
/*2*/	r0.xy = (-r0.zwzz + r0.xyxx).xy;
/*3*/	r0.xy = (vsIn_P0.xzxx * r0.xyxx + r0.zwzz).xy;
/*4*/	r0.zw = (r0.xxxy / cb0.data[5].xxxy).zw;
/*5*/	vsOut_T0.xy = (r0.xyxx).xy;
/*6*/	r0.xy = (r0.zwzz + -cb1.data[6].xyxx).xy;
/*7*/	gl_Position.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + -cb1.data[6].zwzz).xy;
/*8*/	gl_Position.z = -vsIn_P0.y + 0.500000;
/*9*/	gl_Position.w = 1.000000;
/*10*/	vsOut_T1.xy = (vsIn_T1.xzxx).xy;
/*11*/	vsOut_T1.zw = (vsIn_T2.xxxz).zw;
/*12*/	vsOut_T2.xy = (vsIn_T3.xyxx).xy;
/*13*/	vsOut_T3.xyzw = vsIn_T0.xyzw;
/*14*/	return;
}
