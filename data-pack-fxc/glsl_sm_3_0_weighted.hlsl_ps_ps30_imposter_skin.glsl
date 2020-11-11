//
//
// Shader Model 4
// Fragment Shader
//
// id: 1856 - fxc/glsl_SM_3_0_weighted.hlsl_PS_ps30_imposter_skin.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T4;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyz = (cb1.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*4*/	r1.xyz = (cb1.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyz = (cb1.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*7*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*8*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*9*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*10*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*11*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*12*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*13*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*14*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*15*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*16*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*17*/	color0.w = 1.000000;
/*18*/	return;
}
