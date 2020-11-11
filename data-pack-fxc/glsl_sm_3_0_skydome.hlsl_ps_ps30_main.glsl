//
//
// Shader Model 4
// Fragment Shader
//
// id: 1411 - fxc/glsl_SM_3_0_skydome.hlsl_PS_ps30_main.glsl
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

uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*1*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*2*/	r0.w = inversesqrt(r0.w);
/*3*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*4*/	r0.w = max(r0.y, 0.000000);
/*5*/	r0.xyzw = (texture(s_sky, r0.xwzx.stp)).xyzw;
/*6*/	color0.xyz = (r0.xyzx).xyz;
/*7*/	color0.w = 1.000000;
/*8*/	return;
}
