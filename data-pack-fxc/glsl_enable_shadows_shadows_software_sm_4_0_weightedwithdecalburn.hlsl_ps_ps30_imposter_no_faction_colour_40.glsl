//
//
// Shader Model 4
// Fragment Shader
//
// id: 6986 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalburn.hlsl_PS_ps30_imposter_no_faction_colour_40.glsl
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
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2DArray s_decal_diffuse;

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
  vec4 r5;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*3*/	r2.yz = (-cb2.data[3].xxyx + cb2.data[3].zzwz).yz;
/*4*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
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
/*23*/	r2.yz = (vsOut_T1.xxyx * vec4(0.000000, 1.200000, 1.500000, 0.000000)).yz;
/*24*/	r3.x = r2.y;
/*25*/	r3.y = cb1.data[26].x * 0.050000 + r2.z;
/*26*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*27*/	r4.xyzw = (texture(s_fire_map, r2.yzyy.st)).xyzw;
/*28*/	r0.w = saturate(r3.x * 5.000000);
/*29*/	r2.yzw = (r0.wwww * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*30*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*31*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*32*/	r1.w = log2(r4.z);
/*33*/	r1.w = r1.w * 1.800000;
/*34*/	r1.w = exp2(r1.w);
/*35*/	r1.w = r1.w * 10.000000;
/*36*/	r1.w = min(r1.w, 1.000000);
/*37*/	r0.w = r0.w + r1.w;
/*38*/	r0.w = r0.w * 0.500000;
/*39*/	r1.w = -r4.w + 1.000000;
/*40*/	r1.w = log2(r1.w);
/*41*/	r1.w = r1.w * vsOut_T7.z;
/*42*/	r1.w = exp2(r1.w);
/*43*/	r1.w = min(r1.w, 1.000000);
/*44*/	r1.w = r1.w * vsOut_T7.z;
/*45*/	r3.x = r4.z * 0.250000;
/*46*/	r2.yzw = (r2.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r3.xxxx).yzw;
/*47*/	r2.yzw = (r0.wwww * r2.yyzw + r3.xxxx).yzw;
/*48*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*49*/	r0.xyz = (r1.wwww * r2.yzwy + r0.xyzx).xyz;
/*50*/	r0.w = vsOut_T7.z + -0.025000;
/*51*/	r0.w = max(r0.w, 0.000000);
/*52*/	r2.yzw = (r4.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*53*/	r0.xyz = (r0.wwww * r2.yzwy + r0.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*55*/	r2.yzw = (-r0.xxyz + r0.wwww).yzw;
/*56*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*57*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r2.yzw = (-r1.xxyz + r0.wwww).yzw;
/*59*/	r1.xyz = (vsOut_T7.yyyy * r2.yzwy + r1.xyzx).xyz;
/*60*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*61*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*62*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*64*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*65*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*66*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*67*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*68*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*69*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*70*/	color0.w = 1.000000;
/*71*/	return;
}
