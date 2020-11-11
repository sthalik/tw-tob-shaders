//
//
// Shader Model 4
// Fragment Shader
//
// id: 2788 - fxc/glsl_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
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
  vec4 r3;

/*0*/	r0.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*1*/	r0.xyzw = (texture(s_decal_dirt_map, r0.xyxx.st)).xyzw;
/*2*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*3*/	r0.x = r0.w * r1.w;
/*4*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r0.yzw = (-r1.xxyz + vec4(0.000000, 0.030000, 0.025000, 0.020000)).yzw;
/*6*/	r0.yzw = (r0.xxxx * r0.yyzw + r1.xxyz).yzw;
/*7*/	r1.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*8*/	r1.x = saturate(-r1.x * 15.000000 + 1.000000);
/*9*/	r1.yz = (vsOut_T1.xxyx * vec4(0.000000, 1.200000, 1.500000, 0.000000)).yz;
/*10*/	r2.xyzw = (texture(s_fire_map, r1.yzyy.st)).xyzw;
/*11*/	r1.w = log2(r2.z);
/*12*/	r1.w = r1.w * 1.800000;
/*13*/	r1.w = exp2(r1.w);
/*14*/	r1.w = r1.w * 10.000000;
/*15*/	r1.w = min(r1.w, 1.000000);
/*16*/	r1.x = r1.w + r1.x;
/*17*/	r1.x = r1.x * 0.500000;
/*18*/	r1.z = cb1.data[26].x * 0.050000 + r1.z;
/*19*/	r3.xyzw = (texture(s_fire_map, r1.yzyy.st)).xyzw;
/*20*/	r1.y = saturate(r3.x * 5.000000);
/*21*/	r1.yzw = (r1.yyyy * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*22*/	r2.x = r2.z * 0.250000;
/*23*/	r1.yzw = (r1.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r2.xxxx).yzw;
/*24*/	r1.xyz = (r1.xxxx * r1.yzwy + r2.xxxx).xyz;
/*25*/	r1.xyz = (-r0.yzwy + r1.xyzx).xyz;
/*26*/	r1.w = -r2.w + 1.000000;
/*27*/	r1.w = log2(r1.w);
/*28*/	r1.w = r1.w * vsOut_T7.z;
/*29*/	r1.w = exp2(r1.w);
/*30*/	r1.w = min(r1.w, 1.000000);
/*31*/	r1.w = r1.w * vsOut_T7.z;
/*32*/	r0.yzw = (r1.wwww * r1.xxyz + r0.yyzw).yzw;
/*33*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.yzwy).xyz;
/*34*/	r1.w = vsOut_T7.z + -0.025000;
/*35*/	r1.w = max(r1.w, 0.000000);
/*36*/	r0.yzw = (r1.wwww * r1.xxyz + r0.yyzw).yzw;
/*37*/	r1.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r1.xyz = (-r0.yzwy + r1.xxxx).xyz;
/*39*/	r0.yzw = (vsOut_T7.yyyy * r1.xxyz + r0.yyzw).yzw;
/*40*/	r1.xyz = (r0.yzwy * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*41*/	r1.xyz = (-r0.yzwy + r1.xyzx).xyz;
/*42*/	r0.yzw = saturate(vsOut_T7.xxxx * r1.xxyz + r0.yyzw).yzw;
/*43*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*44*/	r2.xyz = (r0.xxxx * r1.xyzx).xyz;
/*45*/	r1.xyz = (r2.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*46*/	r0.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*47*/	r2.xyz = (-r1.xyzx + r0.xxxx).xyz;
/*48*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*49*/	r1.xyz = (-r0.yzwy + r1.xyzx).xyz;
/*50*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*51*/	r0.x = vsOut_T7.y * -r2.y + r2.y;
/*52*/	r0.x = saturate(vsOut_T7.x * -r0.x + r0.x);
/*53*/	r0.xyz = saturate(r0.xxxx * r1.xyzx + r0.yzwy).xyz;
/*54*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*55*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*56*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*57*/	color0.w = 1.000000;
/*58*/	return;
}
