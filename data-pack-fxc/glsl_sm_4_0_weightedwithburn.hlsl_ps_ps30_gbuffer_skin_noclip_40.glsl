//
//
// Shader Model 4
// Fragment Shader
//
// id: 2177 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps30_gbuffer_skin_noclip_40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_T9;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_skin_mask_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
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

/*0*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*3*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*4*/	r0.w = inversesqrt(r0.w);
/*5*/	r1.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*6*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*7*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*8*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*9*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*10*/	r0.xyz = (r2.xxxx * r0.xyzx + r1.xyzx).xyz;
/*11*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r0.w = sqrt(r0.w);
/*15*/	r1.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*16*/	r1.x = inversesqrt(r1.x);
/*17*/	r1.xyz = (r1.xxxx * vsOut_T2.xyzx).xyz;
/*18*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*19*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*20*/	r0.w = inversesqrt(r0.w);
/*21*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*22*/	r0.w = max(abs(r0.z), abs(r0.y));
/*23*/	r0.w = max(r0.w, abs(r0.x));
/*24*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*25*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*26*/	r0.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*27*/	color0.w = saturate(r0.x);
/*28*/	r0.x = vsOut_T7.x * -r0.y + r0.y;
/*29*/	color1.w = saturate(vsOut_T7.y * -r0.x + r0.x);
/*30*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r1.xyz = (cb1.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*32*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*33*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*34*/	r1.xyz = (cb1.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*35*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*36*/	r1.xyz = (cb1.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*38*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*39*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*40*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*41*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*42*/	r1.z = log2(r2.z);
/*43*/	r1.z = r1.z * 1.800000;
/*44*/	r1.z = exp2(r1.z);
/*45*/	r1.z = r1.z * 10.000000;
/*46*/	r1.z = min(r1.z, 1.000000);
/*47*/	r0.w = r0.w + r1.z;
/*48*/	r0.w = r0.w * 0.500000;
/*49*/	r1.y = cb0.data[26].x * 0.050000 + r1.y;
/*50*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*51*/	r1.x = saturate(r1.x * 5.000000);
/*52*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*53*/	r1.w = r2.z * 0.250000;
/*54*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*55*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*56*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*57*/	r0.w = -r2.w + 1.000000;
/*58*/	r0.w = log2(r0.w);
/*59*/	r0.w = r0.w * vsOut_T7.z;
/*60*/	r0.w = exp2(r0.w);
/*61*/	r0.w = min(r0.w, 1.000000);
/*62*/	r0.w = r0.w * vsOut_T7.z;
/*63*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*64*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*65*/	r0.w = vsOut_T7.z + -0.025000;
/*66*/	r0.w = max(r0.w, 0.000000);
/*67*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*68*/	r0.w = -vsOut_T4.z + 1.000000;
/*69*/	r1.xyz = (vsOut_T4.zzzz * cb1.data[3].xyzx).xyz;
/*70*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*71*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*72*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*73*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*74*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*75*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*76*/	color1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*77*/	r0.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*78*/	color2.xyzw = r0.xyzz;
/*79*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*80*/	r0.w = 1.000000;
/*81*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*82*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*83*/	color3.x = r1.x / r0.x;
/*84*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*85*/	color4 = floatBitsToUint(vsOut_T9.z);
/*86*/	return;
}
