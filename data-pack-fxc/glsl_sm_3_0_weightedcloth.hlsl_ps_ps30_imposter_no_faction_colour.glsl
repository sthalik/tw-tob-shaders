//
//
// Shader Model 4
// Fragment Shader
//
// id: 3786 - fxc/glsl_SM_3_0_WeightedCloth.hlsl_PS_ps30_imposter_no_faction_colour.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

flat in vec4 vsOut_T9;
in vec4 vsOut_T1;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_diffuse_damage_map;
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
  vec4 r4;

/*0*/	r0.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -vsOut_T9.x;
/*2*/	r0.xyz = (r0.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*3*/	r0.xyz = (vsOut_T9.xxxx * r0.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*4*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*5*/	if(r0.w != 0) discard;
/*6*/	r0.w = vsOut_T9.y * 1.700000 + -0.700000;
/*7*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.w = -r0.w + r1.w;
/*9*/	r0.w = vsOut_T9.y * 1.700000 + -r0.w;
/*10*/	r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*11*/	r0.w = saturate(r0.w * r1.w);
/*12*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*13*/	if(r1.w != 0) discard;
/*14*/	r2.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*15*/	r3.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*16*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*17*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.w = r3.w * r4.w;
/*19*/	r1.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*20*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*21*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*22*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*23*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*24*/	r4.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*25*/	r3.z = log2(r4.z);
/*26*/	r3.z = r3.z * 1.800000;
/*27*/	r3.z = exp2(r3.z);
/*28*/	r3.z = r3.z * 10.000000;
/*29*/	r3.z = min(r3.z, 1.000000);
/*30*/	r2.w = r2.w + r3.z;
/*31*/	r2.w = r2.w * 0.500000;
/*32*/	r3.y = cb1.data[26].x * 0.050000 + r3.y;
/*33*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*34*/	r3.x = saturate(r3.x * 5.000000);
/*35*/	r3.xyz = (r3.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*36*/	r3.w = r4.z * 0.250000;
/*37*/	r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*38*/	r3.xyz = (r2.wwww * r3.xyzx + r3.wwww).xyz;
/*39*/	r0.xyz = (-r1.xyzx * r0.xyzx + r3.xyzx).xyz;
/*40*/	r1.x = r0.w * -2.000000 + 3.000000;
/*41*/	r0.w = r0.w * r0.w;
/*42*/	r1.xy = (-r1.xxxx * r0.wwww + vec4(1.000000, 0.975000, 0.000000, 0.000000)).xy;
/*43*/	r0.w = -r4.w + 1.000000;
/*44*/	r0.w = log2(r0.w);
/*45*/	r0.w = r0.w * r1.x;
/*46*/	r0.w = exp2(r0.w);
/*47*/	r0.w = min(r0.w, 1.000000);
/*48*/	r0.w = r1.x * r0.w;
/*49*/	r1.x = max(r1.y, 0.000000);
/*50*/	r0.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*51*/	r2.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*52*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*53*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*54*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*55*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*56*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*57*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*58*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*59*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r1.xyz = (r1.wwww * r2.xyzx).xyz;
/*61*/	r1.xyz = (r1.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*62*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r2.xyz = (-r1.xyzx + r0.wwww).xyz;
/*64*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*65*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*66*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*67*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*68*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*69*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*70*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*71*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*72*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*73*/	color0.w = 1.000000;
/*74*/	return;
}
