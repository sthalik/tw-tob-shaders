//
//
// Shader Model 4
// Fragment Shader
//
// id: 7131 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtburn.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_mask;
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
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*3*/	r2.yz = (-cb2.data[3].xxyx + cb2.data[3].zzwz).yz;
/*4*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
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
/*23*/	r2.yz = (vsOut_T1.xxyx * cb2.data[2].xxyx + vsOut_T6.xxyx).yz;
/*24*/	r4.xyzw = (texture(s_decal_dirt_map, r2.yzyy.st)).xyzw;
/*25*/	r0.w = r3.w * r4.w;
/*26*/	r2.yzw = (-r0.xxyz + vec4(0.000000, 0.030000, 0.025000, 0.020000)).yzw;
/*27*/	r0.xyz = (r0.wwww * r2.yzwy + r0.xyzx).xyz;
/*28*/	r2.yzw = (r0.wwww * r1.xxyz).yzw;
/*29*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*30*/	r2.yz = (vsOut_T1.xxyx * vec4(0.000000, 1.200000, 1.500000, 0.000000)).yz;
/*31*/	r3.x = r2.y;
/*32*/	r3.y = cb1.data[26].x * 0.050000 + r2.z;
/*33*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*34*/	r4.xyzw = (texture(s_fire_map, r2.yzyy.st)).xyzw;
/*35*/	r0.w = saturate(r3.x * 5.000000);
/*36*/	r2.yzw = (r0.wwww * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*37*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*39*/	r1.w = log2(r4.z);
/*40*/	r1.w = r1.w * 1.800000;
/*41*/	r1.w = exp2(r1.w);
/*42*/	r1.w = r1.w * 10.000000;
/*43*/	r1.w = min(r1.w, 1.000000);
/*44*/	r0.w = r0.w + r1.w;
/*45*/	r0.w = r0.w * 0.500000;
/*46*/	r1.w = -r4.w + 1.000000;
/*47*/	r1.w = log2(r1.w);
/*48*/	r1.w = r1.w * vsOut_T7.z;
/*49*/	r1.w = exp2(r1.w);
/*50*/	r1.w = min(r1.w, 1.000000);
/*51*/	r1.w = r1.w * vsOut_T7.z;
/*52*/	r3.x = r4.z * 0.250000;
/*53*/	r2.yzw = (r2.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r3.xxxx).yzw;
/*54*/	r2.yzw = (r0.wwww * r2.yyzw + r3.xxxx).yzw;
/*55*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*56*/	r0.xyz = (r1.wwww * r2.yzwy + r0.xyzx).xyz;
/*57*/	r0.w = vsOut_T7.z + -0.025000;
/*58*/	r0.w = max(r0.w, 0.000000);
/*59*/	r2.yzw = (r4.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*60*/	r0.xyz = (r0.wwww * r2.yzwy + r0.xyzx).xyz;
/*61*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*62*/	r2.yzw = (-r0.xxyz + r0.wwww).yzw;
/*63*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*64*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*65*/	r2.yzw = (-r1.xxyz + r0.wwww).yzw;
/*66*/	r1.xyz = (vsOut_T7.yyyy * r2.yzwy + r1.xyzx).xyz;
/*67*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*68*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*69*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*70*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*71*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*72*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*73*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*74*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*75*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*76*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*77*/	color0.w = 1.000000;
/*78*/	return;
}
