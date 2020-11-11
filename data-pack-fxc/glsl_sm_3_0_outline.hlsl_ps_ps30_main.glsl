//
//
// Shader Model 4
// Fragment Shader
//
// id: 397 - fxc/glsl_SM_3_0_outline.hlsl_PS_ps30_main.glsl
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

layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb0;
layout(std140) uniform outline_PS
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;

/*0*/	r0.x = uintBitsToFloat((0.000000 < cb0.data[11].x) ? 0xffffffffu : 0x00000000u);
/*1*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 0.004000 : 1.000000;
/*2*/	r0.yzw = (cb0.data[1].xxyz * cb1.data[1].xxyz).yzw;
/*3*/	color0.xyz = (r0.xxxx * r0.yzwy).xyz;
/*4*/	r0.x = vsOut_T0.x * cb1.data[0].x;
/*5*/	color0.w = saturate(r0.x * 10.000000);
/*6*/	return;
}
