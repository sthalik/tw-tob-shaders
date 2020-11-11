//
//
// Shader Model 4
// Fragment Shader
//
// id: 6790 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtblood.hlsl_PS_ps30_imposter_no_faction_colour_40.glsl
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
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
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
  vec4 r3;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r1.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*3*/	r2.xyzw = (texture(s_decal_dirt_map, r1.xyxx.st)).xyzw;
/*4*/	r0.w = r1.w * r2.w;
/*5*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*6*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*7*/	r1.x = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r1.x != 0) discard;
/*9*/	r1.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*11*/	r1.xyzw = (texture(s_decal_blood_map, r1.xyxx.st)).xyzw;
/*12*/	r1.x = saturate(r1.w + -1.000000);
/*13*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*14*/	if(floatBitsToUint(r1.x) != 0u) {
/*15*/	  r1.x = -r1.w + 1.000000;
/*16*/	  r1.x = saturate(-r1.x);
/*17*/	  r1.x = -r1.x + 1.000000;
/*18*/	  r1.x = -r1.x * r1.x + 1.000000;
/*19*/	  r1.x = r1.x * -0.600000 + 1.000000;
/*20*/	  r1.xyz = (r1.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*21*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*22*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*23*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*24*/	  r2.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r1.xzzx).xyz;
/*25*/	  r0.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*26*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*27*/	  r2.x = 0.020000;
/*28*/	} else {
/*29*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	  r2.yzw = (r0.wwww * r3.xxyz).yzw;
/*32*/	  r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r3.xyzx).xyz;
/*33*/	}
/*34*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r2.yzw = (-r0.xxyz + r0.wwww).yzw;
/*36*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*37*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r2.yzw = (-r1.xxyz + r0.wwww).yzw;
/*39*/	r1.xyz = (vsOut_T7.yyyy * r2.yzwy + r1.xyzx).xyz;
/*40*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*41*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*42*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*43*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*44*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*45*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*46*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*47*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*48*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*49*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*50*/	color0.w = 1.000000;
/*51*/	return;
}
