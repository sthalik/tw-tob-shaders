//
//
// Shader Model 4
// Fragment Shader
//
// id: 288 - fxc/glsl_SM_3_0_gridspline.hlsl_PS_ps30_main_fire_arc.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse;

layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb0;
layout(std140) uniform grid_spline_PS
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = uintBitsToFloat((0.000000 < cb0.data[11].x) ? 0xffffffffu : 0x00000000u);
/*1*/	r0.xyz = (mix(vec4(0.400000, 0.400000, 0.400000, 0), vec4(12.000000, 12.000000, 12.000000, 0), greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*2*/	r0.w = 1.000000;
/*3*/	r0.xyzw = r0.xyzw * cb1.data[0].xyzw;
/*4*/	r1.xyzw = (texture(s_diffuse, vsOut_T0.xyxx.st)).xyzw;
/*5*/	color0.xyzw = r0.xyzw * r1.xyzw;
/*6*/	return;
}
