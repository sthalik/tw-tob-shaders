//
//
// Shader Model 4
// Fragment Shader
//
// id: 6982 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalburn.hlsl_PS_ps30_imposter_40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

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
  vec4 r5;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*21*/	r2.yz = (-cb2.data[3].xxyx + cb2.data[3].zzwz).yz;
/*22*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*23*/	r3.xy = (r3.xyxx / r2.yzyy).xy;
/*24*/	r2.yz = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).yz;
/*25*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r4.x));
/*27*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r0.w));
/*28*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*29*/	r3.z = vsOut_T6.z;
/*30*/	r3.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*31*/	if(floatBitsToUint(r0.w) != 0u) {
/*32*/	  r4.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*33*/	  r5.xyzw = r3.xyzw * r4.wwww;
/*34*/	  r0.w = r2.x * r5.w;
/*35*/	  r2.x = r0.w * -0.500000 + r2.x;
/*36*/	  r2.yzw = (r3.xxyz * r4.wwww + -r1.xxyz).yzw;
/*37*/	  r1.xyz = (r5.wwww * r2.yzwy + r1.xyzx).xyz;
/*38*/	  r0.w = -r3.w * r4.w + 1.000000;
/*39*/	  r0.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*40*/	}
/*41*/	r2.yz = (vsOut_T1.xxyx * vec4(0.000000, 1.200000, 1.500000, 0.000000)).yz;
/*42*/	r3.x = r2.y;
/*43*/	r3.y = cb1.data[26].x * 0.050000 + r2.z;
/*44*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*45*/	r4.xyzw = (texture(s_fire_map, r2.yzyy.st)).xyzw;
/*46*/	r0.w = saturate(r3.x * 5.000000);
/*47*/	r2.yzw = (r0.wwww * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*48*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*50*/	r1.w = log2(r4.z);
/*51*/	r1.w = r1.w * 1.800000;
/*52*/	r1.w = exp2(r1.w);
/*53*/	r1.w = r1.w * 10.000000;
/*54*/	r1.w = min(r1.w, 1.000000);
/*55*/	r0.w = r0.w + r1.w;
/*56*/	r0.w = r0.w * 0.500000;
/*57*/	r1.w = -r4.w + 1.000000;
/*58*/	r1.w = log2(r1.w);
/*59*/	r1.w = r1.w * vsOut_T7.z;
/*60*/	r1.w = exp2(r1.w);
/*61*/	r1.w = min(r1.w, 1.000000);
/*62*/	r1.w = r1.w * vsOut_T7.z;
/*63*/	r3.x = r4.z * 0.250000;
/*64*/	r2.yzw = (r2.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r3.xxxx).yzw;
/*65*/	r2.yzw = (r0.wwww * r2.yyzw + r3.xxxx).yzw;
/*66*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*67*/	r0.xyz = (r1.wwww * r2.yzwy + r0.xyzx).xyz;
/*68*/	r0.w = vsOut_T7.z + -0.025000;
/*69*/	r0.w = max(r0.w, 0.000000);
/*70*/	r2.yzw = (r4.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*71*/	r0.xyz = (r0.wwww * r2.yzwy + r0.xyzx).xyz;
/*72*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r2.yzw = (-r0.xxyz + r0.wwww).yzw;
/*74*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*75*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r2.yzw = (-r1.xxyz + r0.wwww).yzw;
/*77*/	r1.xyz = (vsOut_T7.yyyy * r2.yzwy + r1.xyzx).xyz;
/*78*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*79*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*80*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*81*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*82*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*83*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*84*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*85*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*86*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*87*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*88*/	color0.w = 1.000000;
/*89*/	return;
}
