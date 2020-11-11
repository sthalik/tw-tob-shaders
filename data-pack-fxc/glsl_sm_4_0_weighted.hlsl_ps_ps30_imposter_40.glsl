//
//
// Shader Model 4
// Fragment Shader
//
// id: 1608 - fxc/glsl_SM_4_0_weighted.hlsl_PS_ps30_imposter_40.glsl
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

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*1*/	r1.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*2*/	r1.xyz = (r1.xyzx + -cb1.data[0].xyzx).xyz;
/*3*/	r0.x = saturate(vsOut_P1.w);
/*4*/	r1.xyz = (r0.xxxx * r1.xyzx + cb1.data[0].xyzx).xyz;
/*5*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*6*/	r1.xyz = (r1.xyzx * r2.xyzx + -r2.xyzx).xyz;
/*7*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*8*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*9*/	r2.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*10*/	r0.yzw = (mix(vec4(0, 1.000000, 1.000000, 1.000000), vsOut_P1.xxyz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).yzw;
/*11*/	r0.yzw = (r0.yyzw + -cb1.data[2].xxyz).yzw;
/*12*/	r0.yzw = (r0.xxxx * r0.yyzw + cb1.data[2].xxyz).yzw;
/*13*/	r2.xyz = (r2.xyzx + -cb1.data[1].xyzx).xyz;
/*14*/	r2.xyz = (r0.xxxx * r2.xyzx + cb1.data[1].xyzx).xyz;
/*15*/	r2.xyz = (r2.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*16*/	r1.xyz = (r3.yyyy * r2.xyzx + r1.xyzx).xyz;
/*17*/	r0.xyz = (r0.yzwy * r1.xyzx + -r1.xyzx).xyz;
/*18*/	r0.xyz = (r3.zzzz * r0.xyzx + r1.xyzx).xyz;
/*19*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*20*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*21*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*22*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*23*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*24*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*25*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*26*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*27*/	r2.xyz = (-r1.xyzx + r0.wwww).xyz;
/*28*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*29*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*30*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*32*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*33*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*34*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*35*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*36*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*37*/	color0.w = 1.000000;
/*38*/	return;
}
