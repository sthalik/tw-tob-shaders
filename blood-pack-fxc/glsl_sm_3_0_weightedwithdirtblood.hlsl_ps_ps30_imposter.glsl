//
//
// Shader Model 4
// Fragment Shader
//
// id: 2731 - fxc/glsl_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_imposter.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
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
  vec4 r4;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*3*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*4*/	r0.w = saturate(vsOut_P1.w);
/*5*/	r3.xyz = (r3.xyzx + -cb2.data[0].xyzx).xyz;
/*6*/	r3.xyz = (r0.wwww * r3.xyzx + cb2.data[0].xyzx).xyz;
/*7*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*8*/	r2.xyw = (r2.xyxw + -cb2.data[1].xyxz).xyw;
/*9*/	r2.xyw = (r0.wwww * r2.xyxw + cb2.data[1].xyxz).xyw;
/*10*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*11*/	r4.xyz = (r4.xyzx + -cb2.data[2].xyzx).xyz;
/*12*/	r4.xyz = (r0.wwww * r4.xyzx + cb2.data[2].xyzx).xyz;
/*13*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*14*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*18*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*19*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r1.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*21*/	r2.xyzw = (texture(s_decal_dirt_map, r1.xyxx.st)).xyzw;
/*22*/	r0.w = r1.w * r2.w;
/*23*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*24*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*25*/	r1.x = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*26*/	if(r1.x != 0) discard;
/*27*/	r1.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*28*/	r1.xy = (r1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*29*/	r1.xyzw = (texture(s_decal_blood_map, r1.xyxx.st)).xyzw;
/*30*/	r1.x = saturate(r1.w + -1.000000);
/*31*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*32*/	if(floatBitsToUint(r1.x) != 0u) {
/*33*/	  r1.x = -r1.w + 1.000000;
/*34*/	  r1.x = saturate(-r1.x);
/*35*/	  r1.x = -r1.x + 1.000000;
/*36*/	  r1.x = -r1.x * r1.x + 1.000000;
/*37*/	  r1.x = r1.x * -0.600000 + 1.000000;
/*38*/	  r1.xyz = (r1.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*39*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*40*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*41*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*42*/	  r2.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r1.xzzx).xyz;
/*43*/	  r0.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*44*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*45*/	  r2.x = 0.020000;
/*46*/	} else {
/*47*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*48*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*49*/	  r2.yzw = (r0.wwww * r3.xxyz).yzw;
/*50*/	  r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r3.xyzx).xyz;
/*51*/	}
/*52*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r2.yzw = (-r0.xxyz + r0.wwww).yzw;
/*54*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*55*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r2.yzw = (-r1.xxyz + r0.wwww).yzw;
/*57*/	r1.xyz = (vsOut_T7.yyyy * r2.yzwy + r1.xyzx).xyz;
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
