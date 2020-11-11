//
//
// Shader Model 4
// Fragment Shader
//
// id: 2633 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps30_gbuffer_noclip_no_faction_colour_40.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_fire_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
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
/*28*/	r0.x = vsOut_T7.y * -r0.y + r0.y;
/*29*/	color1.w = saturate(vsOut_T7.x * -r0.x + r0.x);
/*30*/	r0.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*31*/	r1.x = r0.x;
/*32*/	r1.y = cb0.data[26].x * 0.050000 + r0.y;
/*33*/	r0.xyzw = (texture(s_fire_map, r0.xyxx.st)).xyzw;
/*34*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*35*/	r0.x = saturate(r1.x * 5.000000);
/*36*/	r1.xyz = (r0.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*37*/	r0.x = r0.z * 0.250000;
/*38*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r0.xxxx).xyz;
/*39*/	r0.y = log2(r0.z);
/*40*/	r0.y = r0.y * 1.800000;
/*41*/	r0.y = exp2(r0.y);
/*42*/	r0.y = r0.y * 10.000000;
/*43*/	r0.y = min(r0.y, 1.000000);
/*44*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*45*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*46*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*47*/	r0.y = r0.y + r1.w;
/*48*/	r0.y = r0.y * 0.500000;
/*49*/	r1.xyz = (r0.yyyy * r1.xyzx + r0.xxxx).xyz;
/*50*/	r1.xyz = (-r2.xyzx + r1.xyzx).xyz;
/*51*/	r0.x = -r0.w + 1.000000;
/*52*/	r0.x = log2(r0.x);
/*53*/	r0.x = r0.x * vsOut_T7.z;
/*54*/	r0.x = exp2(r0.x);
/*55*/	r0.x = min(r0.x, 1.000000);
/*56*/	r0.x = r0.x * vsOut_T7.z;
/*57*/	r0.xyw = (r0.xxxx * r1.xyxz + r2.xyxz).xyw;
/*58*/	r1.xyz = (r0.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*59*/	r0.z = vsOut_T7.z + -0.025000;
/*60*/	r0.z = max(r0.z, 0.000000);
/*61*/	r0.xyz = (r0.zzzz * r1.xyzx + r0.xywx).xyz;
/*62*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*64*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*65*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*66*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*67*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*68*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*69*/	r0.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*71*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*72*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*73*/	r1.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*74*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & uint(0x3c008081u));
/*75*/	color2.xyzw = saturate(r0.xyzw);
/*76*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*77*/	r0.w = 1.000000;
/*78*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*79*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*80*/	color3.x = r1.x / r0.x;
/*81*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*82*/	color4 = floatBitsToUint(vsOut_T9.z);
/*83*/	return;
}
