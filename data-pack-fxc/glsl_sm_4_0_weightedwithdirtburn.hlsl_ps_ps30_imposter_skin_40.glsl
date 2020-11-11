//
//
// Shader Model 4
// Fragment Shader
//
// id: 2349 - fxc/glsl_SM_4_0_weightedwithdirtburn.hlsl_PS_ps30_imposter_skin_40.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*5*/	r0.yzw = (cb3.data[0].xxyz * r1.xxyz + -r1.xxyz).yzw;
/*6*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*7*/	r0.yzw = (r2.xxxx * r0.yyzw + r1.xxyz).yzw;
/*8*/	r1.xyz = (cb3.data[1].xyzx * r0.yzwy + -r0.yzwy).xyz;
/*9*/	r0.yzw = (r2.yyyy * r1.xxyz + r0.yyzw).yzw;
/*10*/	r1.xyz = (cb3.data[2].xyzx * r0.yzwy + -r0.yzwy).xyz;
/*11*/	r0.yzw = (r2.zzzz * r1.xxyz + r0.yyzw).yzw;
/*12*/	r1.xyz = (-r0.yzwy + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*13*/	r0.xyz = (r0.xxxx * r1.xyzx + r0.yzwy).xyz;
/*14*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*15*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*16*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*17*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*18*/	r1.z = log2(r2.z);
/*19*/	r1.z = r1.z * 1.800000;
/*20*/	r1.z = exp2(r1.z);
/*21*/	r1.z = r1.z * 10.000000;
/*22*/	r1.z = min(r1.z, 1.000000);
/*23*/	r0.w = r0.w + r1.z;
/*24*/	r0.w = r0.w * 0.500000;
/*25*/	r1.y = cb1.data[26].x * 0.050000 + r1.y;
/*26*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*27*/	r1.x = saturate(r1.x * 5.000000);
/*28*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*29*/	r1.w = r2.z * 0.250000;
/*30*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*31*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*32*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*33*/	r0.w = -r2.w + 1.000000;
/*34*/	r0.w = log2(r0.w);
/*35*/	r0.w = r0.w * vsOut_T7.z;
/*36*/	r0.w = exp2(r0.w);
/*37*/	r0.w = min(r0.w, 1.000000);
/*38*/	r0.w = r0.w * vsOut_T7.z;
/*39*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*40*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*41*/	r0.w = vsOut_T7.z + -0.025000;
/*42*/	r0.w = max(r0.w, 0.000000);
/*43*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*44*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*45*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*46*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*47*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*49*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*50*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*51*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*52*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*53*/	color0.w = 1.000000;
/*54*/	return;
}
