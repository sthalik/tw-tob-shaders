//
//
// Shader Model 4
// Fragment Shader
//
// id: 3923 - fxc/glsl_SM_3_0_VisibilityShader.hlsl_PS_ps30_fog_of_war_cross_fade_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D s_fog_of_war_source;
uniform sampler2D s_fog_of_war_current;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform fog_of_war_PS
{
  vec4 data[8];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx / cb1.data[0].xxxx).xy;
/*2*/	r1.xyzw = (textureLod(s_fog_of_war_source, r0.xyxx.st, 0.000000)).xyzw;
/*3*/	r0.xyzw = (textureLod(s_fog_of_war_current, r0.xyxx.st, 0.000000)).xyzw;
/*4*/	r0.y = -r0.x + r1.x;
/*5*/	color0.xyzw = cb1.data[6].zzzz * r0.yyyy + r0.xxxx;
/*6*/	return;
}
