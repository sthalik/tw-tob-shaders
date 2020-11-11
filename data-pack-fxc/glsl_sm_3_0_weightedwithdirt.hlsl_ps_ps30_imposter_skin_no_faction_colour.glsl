//
//
// Shader Model 4
// Fragment Shader
//
// id: 1927 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_imposter_skin_no_faction_colour.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*1*/	r0.xyzw = (texture(s_decal_dirt_map, r0.xyxx.st)).xyzw;
/*2*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*3*/	r0.x = r0.w * r1.w;
/*4*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r0.yzw = (-r1.xxyz + vec4(0.000000, 0.030000, 0.025000, 0.020000)).yzw;
/*6*/	r0.xyz = (r0.xxxx * r0.yzwy + r1.xyzx).xyz;
/*7*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*8*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*9*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*10*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*11*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*12*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*13*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*14*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*15*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*16*/	color0.w = 1.000000;
/*17*/	return;
}
