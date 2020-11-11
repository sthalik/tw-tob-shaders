//
//
// Shader Model 4
// Fragment Shader
//
// id: 6340 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_imposter_skin.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb2.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*10*/	r2.xyzw = (texture(s_decal_dirt_map, r1.xyxx.st)).xyzw;
/*11*/	r0.w = r1.w * r2.w;
/*12*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*13*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*14*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*15*/	if(r0.w != 0) discard;
/*16*/	r1.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*17*/	r1.xy = (r1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*18*/	r1.xyzw = (texture(s_decal_blood_map, r1.xyxx.st)).xyzw;
/*19*/	r0.w = saturate(r1.w + -1.000000);
/*20*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*21*/	if(floatBitsToUint(r0.w) != 0u) {
/*22*/	  r0.w = -r1.w + 1.000000;
/*23*/	  r0.w = saturate(-r0.w);
/*24*/	  r0.w = -r0.w + 1.000000;
/*25*/	  r0.w = -r0.w * r0.w + 1.000000;
/*26*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*27*/	  r1.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*28*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*29*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*30*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*31*/	  r2.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r1.xzzx).xyz;
/*32*/	  r0.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*33*/	}
/*34*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*35*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*36*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*37*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*39*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*40*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*41*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*42*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*43*/	color0.w = 1.000000;
/*44*/	return;
}
