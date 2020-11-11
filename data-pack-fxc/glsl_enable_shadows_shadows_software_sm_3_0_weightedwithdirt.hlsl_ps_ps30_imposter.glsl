//
//
// Shader Model 4
// Fragment Shader
//
// id: 5736 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirt.hlsl_PS_ps30_imposter.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

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
/*19*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*20*/	r2.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*21*/	r2.xyzw = (texture(s_decal_dirt_map, r2.xyxx.st)).xyzw;
/*22*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*23*/	r0.w = r2.w * r3.w;
/*24*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*25*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*26*/	r1.xyz = (-r0.xyzx + r1.xxxx).xyz;
/*27*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*28*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*29*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*30*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*31*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*33*/	r1.xyz = (r2.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*34*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r2.xyz = (-r1.xyzx + r0.wwww).xyz;
/*36*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*37*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*38*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*40*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*41*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*42*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*43*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*44*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*45*/	color0.w = 1.000000;
/*46*/	return;
}
