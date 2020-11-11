//
//
// Shader Model 4
// Fragment Shader
//
// id: 6342 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtblood.hlsl_PS_ps30_imposter_skin_no_faction_colour_40.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
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

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r1.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*3*/	r2.xyzw = (texture(s_decal_dirt_map, r1.xyxx.st)).xyzw;
/*4*/	r0.w = r1.w * r2.w;
/*5*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*6*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*7*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r0.w != 0) discard;
/*9*/	r1.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*11*/	r1.xyzw = (texture(s_decal_blood_map, r1.xyxx.st)).xyzw;
/*12*/	r0.w = saturate(r1.w + -1.000000);
/*13*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*14*/	if(floatBitsToUint(r0.w) != 0u) {
/*15*/	  r0.w = -r1.w + 1.000000;
/*16*/	  r0.w = saturate(-r0.w);
/*17*/	  r0.w = -r0.w + 1.000000;
/*18*/	  r0.w = -r0.w * r0.w + 1.000000;
/*19*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*20*/	  r1.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*21*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*22*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*23*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*24*/	  r2.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r1.xzzx).xyz;
/*25*/	  r0.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*26*/	}
/*27*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*28*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*29*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*30*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*31*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*32*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*33*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*34*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*35*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*36*/	color0.w = 1.000000;
/*37*/	return;
}
