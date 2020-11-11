//
//
// Shader Model 4
// Fragment Shader
//
// id: 6928 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalblood.hlsl_PS_ps30_imposter_no_faction_colour_40.glsl
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
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2DArray s_decal_diffuse;

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
/*5*/	r3.xy = (r3.xyxx / r2.yzyy).xy;
/*6*/	r2.yz = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).yz;
/*7*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*8*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r4.x));
/*9*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r0.w));
/*10*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*11*/	r3.z = vsOut_T6.z;
/*12*/	r3.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*13*/	if(floatBitsToUint(r0.w) != 0u) {
/*14*/	  r4.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*15*/	  r5.xyzw = r3.xyzw * r4.wwww;
/*16*/	  r0.w = r2.x * r5.w;
/*17*/	  r2.x = r0.w * -0.500000 + r2.x;
/*18*/	  r2.yzw = (r3.xxyz * r4.wwww + -r1.xxyz).yzw;
/*19*/	  r1.xyz = (r5.wwww * r2.yzwy + r1.xyzx).xyz;
/*20*/	  r0.w = -r3.w * r4.w + 1.000000;
/*21*/	  r0.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*22*/	}
/*23*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*24*/	if(r0.w != 0) discard;
/*25*/	r2.yz = (vsOut_T1.xxyx * vec4(0.000000, 0.750000, 0.750000, 0.000000)).yz;
/*26*/	r2.yz = (r2.yyzy * cb1.data[2].xxyx + vsOut_T6.xxyx).yz;
/*27*/	r3.xyzw = (texture(s_decal_blood_map, r2.yzyy.st)).xyzw;
/*28*/	r0.w = saturate(r3.w + -1.000000);
/*29*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*30*/	if(floatBitsToUint(r0.w) != 0u) {
/*31*/	  r0.w = -r3.w + 1.000000;
/*32*/	  r0.w = saturate(-r0.w);
/*33*/	  r0.w = -r0.w + 1.000000;
/*34*/	  r0.w = -r0.w * r0.w + 1.000000;
/*35*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*36*/	  r2.yzw = (r0.wwww * vec4(0.000000, 0.240000, 0.000000, 0.000000)).yzw;
/*37*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*38*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*39*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*40*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.ywwy).xyz;
/*41*/	  r0.xyz = (r0.wwww * r3.xyzx + r2.yzwy).xyz;
/*42*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*43*/	  r2.x = 0.020000;
/*44*/	}
/*45*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*46*/	r2.yzw = (-r0.xxyz + r0.wwww).yzw;
/*47*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*48*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r2.yzw = (-r1.xxyz + r0.wwww).yzw;
/*50*/	r1.xyz = (vsOut_T7.yyyy * r2.yzwy + r1.xyzx).xyz;
/*51*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*52*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*53*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*54*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*55*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*56*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*57*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*58*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*59*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*60*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*61*/	color0.w = 1.000000;
/*62*/	return;
}
