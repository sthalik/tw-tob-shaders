//
//
// Shader Model 4
// Fragment Shader
//
// id: 6415 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtburn.hlsl_PS_ps30_imposter_skin_no_faction_colour_40.glsl
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
uniform sampler2D s_fire_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*1*/	r0.xyzw = (texture(s_decal_dirt_map, r0.xyxx.st)).xyzw;
/*2*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*3*/	r0.x = r0.w * r1.w;
/*4*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r0.yzw = (-r1.xxyz + vec4(0.000000, 0.030000, 0.025000, 0.020000)).yzw;
/*6*/	r0.xyz = (r0.xxxx * r0.yzwy + r1.xyzx).xyz;
/*7*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*8*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*9*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*10*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*11*/	r1.z = log2(r2.z);
/*12*/	r1.z = r1.z * 1.800000;
/*13*/	r1.z = exp2(r1.z);
/*14*/	r1.z = r1.z * 10.000000;
/*15*/	r1.z = min(r1.z, 1.000000);
/*16*/	r0.w = r0.w + r1.z;
/*17*/	r0.w = r0.w * 0.500000;
/*18*/	r1.y = cb1.data[26].x * 0.050000 + r1.y;
/*19*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*20*/	r1.x = saturate(r1.x * 5.000000);
/*21*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*22*/	r1.w = r2.z * 0.250000;
/*23*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*24*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*25*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*26*/	r0.w = -r2.w + 1.000000;
/*27*/	r0.w = log2(r0.w);
/*28*/	r0.w = r0.w * vsOut_T7.z;
/*29*/	r0.w = exp2(r0.w);
/*30*/	r0.w = min(r0.w, 1.000000);
/*31*/	r0.w = r0.w * vsOut_T7.z;
/*32*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*33*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*34*/	r0.w = vsOut_T7.z + -0.025000;
/*35*/	r0.w = max(r0.w, 0.000000);
/*36*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*37*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*38*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*39*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*40*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*41*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*42*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*43*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*44*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*45*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*46*/	color0.w = 1.000000;
/*47*/	return;
}
