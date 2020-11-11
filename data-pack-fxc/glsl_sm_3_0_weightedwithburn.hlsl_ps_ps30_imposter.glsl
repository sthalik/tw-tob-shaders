//
//
// Shader Model 4
// Fragment Shader
//
// id: 2645 - fxc/glsl_SM_3_0_weightedwithburn.hlsl_PS_ps30_imposter.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_fire_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
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
  vec4 r3;

/*0*/	r0.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*1*/	r1.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*2*/	r1.xyz = (r1.xyzx + -cb2.data[0].xyzx).xyz;
/*3*/	r0.x = saturate(vsOut_P1.w);
/*4*/	r1.xyz = (r0.xxxx * r1.xyzx + cb2.data[0].xyzx).xyz;
/*5*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*6*/	r1.xyz = (r1.xyzx * r2.xyzx + -r2.xyzx).xyz;
/*7*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*8*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*9*/	r2.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*10*/	r0.yzw = (mix(vec4(0, 1.000000, 1.000000, 1.000000), vsOut_P1.xxyz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).yzw;
/*11*/	r0.yzw = (r0.yyzw + -cb2.data[2].xxyz).yzw;
/*12*/	r0.yzw = (r0.xxxx * r0.yyzw + cb2.data[2].xxyz).yzw;
/*13*/	r2.xyz = (r2.xyzx + -cb2.data[1].xyzx).xyz;
/*14*/	r2.xyz = (r0.xxxx * r2.xyzx + cb2.data[1].xyzx).xyz;
/*15*/	r2.xyz = (r2.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*16*/	r1.xyz = (r3.yyyy * r2.xyzx + r1.xyzx).xyz;
/*17*/	r0.xyz = (r0.yzwy * r1.xyzx + -r1.xyzx).xyz;
/*18*/	r0.xyz = (r3.zzzz * r0.xyzx + r1.xyzx).xyz;
/*19*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*20*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*21*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*22*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*23*/	r1.z = log2(r2.z);
/*24*/	r1.z = r1.z * 1.800000;
/*25*/	r1.z = exp2(r1.z);
/*26*/	r1.z = r1.z * 10.000000;
/*27*/	r1.z = min(r1.z, 1.000000);
/*28*/	r0.w = r0.w + r1.z;
/*29*/	r0.w = r0.w * 0.500000;
/*30*/	r1.y = cb1.data[26].x * 0.050000 + r1.y;
/*31*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*32*/	r1.x = saturate(r1.x * 5.000000);
/*33*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*34*/	r1.w = r2.z * 0.250000;
/*35*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*36*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*37*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*38*/	r0.w = -r2.w + 1.000000;
/*39*/	r0.w = log2(r0.w);
/*40*/	r0.w = r0.w * vsOut_T7.z;
/*41*/	r0.w = exp2(r0.w);
/*42*/	r0.w = min(r0.w, 1.000000);
/*43*/	r0.w = r0.w * vsOut_T7.z;
/*44*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*45*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*46*/	r0.w = vsOut_T7.z + -0.025000;
/*47*/	r0.w = max(r0.w, 0.000000);
/*48*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*49*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*50*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*51*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*52*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*53*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*55*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*56*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*57*/	r2.xyz = (-r1.xyzx + r0.wwww).xyz;
/*58*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*59*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*60*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*62*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*63*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*64*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*65*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*66*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*67*/	color0.w = 1.000000;
/*68*/	return;
}
