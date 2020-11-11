//
//
// Shader Model 4
// Fragment Shader
//
// id: 3780 - fxc/glsl_SM_4_0_WeightedCloth.hlsl_PS_ps30_imposter_40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

flat in vec4 vsOut_T9;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*14*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*15*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*16*/	r3.xyz = (r3.xyzx + -cb3.data[0].xyzx).xyz;
/*17*/	r1.w = saturate(vsOut_P1.w);
/*18*/	r3.xyz = (r1.wwww * r3.xyzx + cb3.data[0].xyzx).xyz;
/*19*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*20*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*21*/	r1.xyz = (r4.xxxx * r3.xyzx + r1.xyzx).xyz;
/*22*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*23*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*24*/	r3.xyz = (r3.xyzx + -cb3.data[2].xyzx).xyz;
/*25*/	r3.xyz = (r1.wwww * r3.xyzx + cb3.data[2].xyzx).xyz;
/*26*/	r2.xyz = (r2.xywx + -cb3.data[1].xyzx).xyz;
/*27*/	r2.xyz = (r1.wwww * r2.xyzx + cb3.data[1].xyzx).xyz;
/*28*/	r2.xyz = (r2.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*29*/	r1.xyz = (r4.yyyy * r2.xyzx + r1.xyzx).xyz;
/*30*/	r2.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*31*/	r1.xyz = (r4.zzzz * r2.xyzx + r1.xyzx).xyz;
/*32*/	r2.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*33*/	r3.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*34*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*35*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r1.w = r3.w * r4.w;
/*37*/	r1.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*38*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*39*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*41*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*42*/	r4.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*43*/	r3.z = log2(r4.z);
/*44*/	r3.z = r3.z * 1.800000;
/*45*/	r3.z = exp2(r3.z);
/*46*/	r3.z = r3.z * 10.000000;
/*47*/	r3.z = min(r3.z, 1.000000);
/*48*/	r2.w = r2.w + r3.z;
/*49*/	r2.w = r2.w * 0.500000;
/*50*/	r3.y = cb1.data[26].x * 0.050000 + r3.y;
/*51*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*52*/	r3.x = saturate(r3.x * 5.000000);
/*53*/	r3.xyz = (r3.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*54*/	r3.w = r4.z * 0.250000;
/*55*/	r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*56*/	r3.xyz = (r2.wwww * r3.xyzx + r3.wwww).xyz;
/*57*/	r0.xyz = (-r1.xyzx * r0.xyzx + r3.xyzx).xyz;
/*58*/	r1.x = r0.w * -2.000000 + 3.000000;
/*59*/	r0.w = r0.w * r0.w;
/*60*/	r1.xy = (-r1.xxxx * r0.wwww + vec4(1.000000, 0.975000, 0.000000, 0.000000)).xy;
/*61*/	r0.w = -r4.w + 1.000000;
/*62*/	r0.w = log2(r0.w);
/*63*/	r0.w = r0.w * r1.x;
/*64*/	r0.w = exp2(r0.w);
/*65*/	r0.w = min(r0.w, 1.000000);
/*66*/	r0.w = r1.x * r0.w;
/*67*/	r1.x = max(r1.y, 0.000000);
/*68*/	r0.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*69*/	r2.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*70*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*71*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*72*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*73*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*74*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*75*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*76*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*77*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*78*/	r1.xyz = (r1.wwww * r2.xyzx).xyz;
/*79*/	r1.xyz = (r1.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*80*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*81*/	r2.xyz = (-r1.xyzx + r0.wwww).xyz;
/*82*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*83*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*84*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*85*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*86*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*87*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*88*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*89*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*90*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*91*/	color0.w = 1.000000;
/*92*/	return;
}
