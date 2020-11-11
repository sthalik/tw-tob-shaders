//
//
// Shader Model 4
// Fragment Shader
//
// id: 2629 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps30_gbuffer_noclip_40.glsl
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
flat in vec4 vsOut_P1;
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
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
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
/*30*/	r0.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*31*/	r1.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*32*/	r1.xyz = (r1.xyzx + -cb2.data[0].xyzx).xyz;
/*33*/	r0.x = saturate(vsOut_P1.w);
/*34*/	r1.xyz = (r0.xxxx * r1.xyzx + cb2.data[0].xyzx).xyz;
/*35*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r1.xyz = (r1.xyzx * r2.xyzx + -r2.xyzx).xyz;
/*37*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*38*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*39*/	r2.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*40*/	r0.yzw = (mix(vec4(0, 1.000000, 1.000000, 1.000000), vsOut_P1.xxyz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).yzw;
/*41*/	r0.yzw = (r0.yyzw + -cb2.data[2].xxyz).yzw;
/*42*/	r0.yzw = (r0.xxxx * r0.yyzw + cb2.data[2].xxyz).yzw;
/*43*/	r2.xyz = (r2.xyzx + -cb2.data[1].xyzx).xyz;
/*44*/	r2.xyz = (r0.xxxx * r2.xyzx + cb2.data[1].xyzx).xyz;
/*45*/	r2.xyz = (r2.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*46*/	r1.xyz = (r3.yyyy * r2.xyzx + r1.xyzx).xyz;
/*47*/	r0.xyz = (r0.yzwy * r1.xyzx + -r1.xyzx).xyz;
/*48*/	r0.xyz = (r3.zzzz * r0.xyzx + r1.xyzx).xyz;
/*49*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*50*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*51*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*52*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*53*/	r1.z = log2(r2.z);
/*54*/	r1.z = r1.z * 1.800000;
/*55*/	r1.z = exp2(r1.z);
/*56*/	r1.z = r1.z * 10.000000;
/*57*/	r1.z = min(r1.z, 1.000000);
/*58*/	r0.w = r0.w + r1.z;
/*59*/	r0.w = r0.w * 0.500000;
/*60*/	r1.y = cb0.data[26].x * 0.050000 + r1.y;
/*61*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*62*/	r1.x = saturate(r1.x * 5.000000);
/*63*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*64*/	r1.w = r2.z * 0.250000;
/*65*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*66*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*67*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*68*/	r0.w = -r2.w + 1.000000;
/*69*/	r0.w = log2(r0.w);
/*70*/	r0.w = r0.w * vsOut_T7.z;
/*71*/	r0.w = exp2(r0.w);
/*72*/	r0.w = min(r0.w, 1.000000);
/*73*/	r0.w = r0.w * vsOut_T7.z;
/*74*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*75*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*76*/	r0.w = vsOut_T7.z + -0.025000;
/*77*/	r0.w = max(r0.w, 0.000000);
/*78*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*79*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*81*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*82*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*83*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*84*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*85*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*86*/	r0.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*87*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*88*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*89*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*90*/	r1.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*91*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & uint(0x3c008081u));
/*92*/	color2.xyzw = saturate(r0.xyzw);
/*93*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*94*/	r0.w = 1.000000;
/*95*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*96*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*97*/	color3.x = r1.x / r0.x;
/*98*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*99*/	color4 = floatBitsToUint(vsOut_T9.z);
/*100*/	return;
}
