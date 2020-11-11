//
//
// Shader Model 4
// Fragment Shader
//
// id: 7073 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_mask;
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
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*3*/	r2.yz = (-cb1.data[3].xxyx + cb1.data[3].zzwz).yz;
/*4*/	r3.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*5*/	r2.yz = (r3.xxyx / r2.yyzy).yz;
/*6*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.yzyy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*7*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.yyyz)) * 0xffffffffu)).zw;
/*8*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*9*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*10*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*11*/	r3.xyzw = (texture(s_decal_diffuse, r2.yzyy.st)).xyzw;
/*12*/	if(floatBitsToUint(r0.w) != 0u) {
/*13*/	  r4.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*14*/	  r5.xyzw = r3.xyzw * r4.wwww;
/*15*/	  r0.w = r2.x * r5.w;
/*16*/	  r2.x = r0.w * -0.500000 + r2.x;
/*17*/	  r2.yzw = (r3.xxyz * r4.wwww + -r1.xxyz).yzw;
/*18*/	  r1.xyz = (r5.wwww * r2.yzwy + r1.xyzx).xyz;
/*19*/	  r0.w = -r3.w * r4.w + 1.000000;
/*20*/	  r0.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*21*/	}
/*22*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*23*/	r2.yz = (vsOut_T1.xxyx * cb1.data[2].xxyx + vsOut_T6.xxyx).yz;
/*24*/	r4.xyzw = (texture(s_decal_dirt_map, r2.yzyy.st)).xyzw;
/*25*/	r0.w = r3.w * r4.w;
/*26*/	r2.yzw = (-r0.xxyz + vec4(0.000000, 0.030000, 0.025000, 0.020000)).yzw;
/*27*/	r0.xyz = (r0.wwww * r2.yzwy + r0.xyzx).xyz;
/*28*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*29*/	if(r1.w != 0) discard;
/*30*/	r2.yz = (vsOut_T1.xxyx * vec4(0.000000, 0.750000, 0.750000, 0.000000)).yz;
/*31*/	r2.yz = (r2.yyzy * cb1.data[2].xxyx + vsOut_T6.xxyx).yz;
/*32*/	r3.xyzw = (texture(s_decal_blood_map, r2.yzyy.st)).xyzw;
/*33*/	r1.w = saturate(r3.w + -1.000000);
/*34*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*35*/	if(floatBitsToUint(r1.w) != 0u) {
/*36*/	  r1.w = -r3.w + 1.000000;
/*37*/	  r1.w = saturate(-r1.w);
/*38*/	  r1.w = -r1.w + 1.000000;
/*39*/	  r1.w = -r1.w * r1.w + 1.000000;
/*40*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*41*/	  r2.yzw = (r1.wwww * vec4(0.000000, 0.240000, 0.000000, 0.000000)).yzw;
/*42*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*43*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*44*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*45*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.ywwy).xyz;
/*46*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.yzwy).xyz;
/*47*/	  r2.xyzw = vec4(0.020000, 1.000000, 0.800000, 0.800000);
/*48*/	} else {
/*49*/	  r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*50*/	  r2.yzw = (r3.xxyz * vec4(0.000000, -0.990000, -0.990000, -0.990000) + r1.xxyz).yzw;
/*51*/	}
/*52*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*54*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*55*/	r0.w = dot(vec3(r2.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r1.xyz = (-r2.yzwy + r0.wwww).xyz;
/*57*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r2.yzwy).xyz;
/*58*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*59*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*60*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*61*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*62*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*63*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*64*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*65*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*66*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*67*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*68*/	color0.w = 1.000000;
/*69*/	return;
}
