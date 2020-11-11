//
//
// Shader Model 4
// Fragment Shader
//
// id: 2625 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps30_gbuffer_40.glsl
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*5*/	r0.w = inversesqrt(r0.w);
/*6*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*7*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*8*/	r0.w = inversesqrt(r0.w);
/*9*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*10*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*11*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*12*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*13*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*14*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*15*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*16*/	r0.w = -r0.w + 1.000000;
/*17*/	r0.w = max(r0.w, 0.000000);
/*18*/	r0.w = sqrt(r0.w);
/*19*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*20*/	r1.w = inversesqrt(r1.w);
/*21*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*22*/	r1.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*23*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*26*/	r0.w = max(abs(r1.z), abs(r1.y));
/*27*/	r0.w = max(r0.w, abs(r1.x));
/*28*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*29*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*30*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	color0.w = saturate(r1.x);
/*32*/	r0.w = vsOut_T7.y * -r1.y + r1.y;
/*33*/	color1.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*34*/	r1.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*35*/	r2.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*36*/	r2.xyz = (r2.xyzx + -cb2.data[0].xyzx).xyz;
/*37*/	r0.w = saturate(vsOut_P1.w);
/*38*/	r2.xyz = (r0.wwww * r2.xyzx + cb2.data[0].xyzx).xyz;
/*39*/	r2.xyz = (r2.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*40*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*41*/	r0.xyz = (r3.xxxx * r2.xyzx + r0.xyzx).xyz;
/*42*/	r1.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyw;
/*43*/	r2.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r1.zzzz), uvec4(0)))).xyz;
/*44*/	r2.xyz = (r2.xyzx + -cb2.data[2].xyzx).xyz;
/*45*/	r2.xyz = (r0.wwww * r2.xyzx + cb2.data[2].xyzx).xyz;
/*46*/	r1.xyz = (r1.xywx + -cb2.data[1].xyzx).xyz;
/*47*/	r1.xyz = (r0.wwww * r1.xyzx + cb2.data[1].xyzx).xyz;
/*48*/	r1.xyz = (r1.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*49*/	r0.xyz = (r3.yyyy * r1.xyzx + r0.xyzx).xyz;
/*50*/	r1.xyz = (r2.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*51*/	r0.xyz = (r3.zzzz * r1.xyzx + r0.xyzx).xyz;
/*52*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*54*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*55*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*56*/	r1.z = log2(r2.z);
/*57*/	r1.z = r1.z * 1.800000;
/*58*/	r1.z = exp2(r1.z);
/*59*/	r1.z = r1.z * 10.000000;
/*60*/	r1.z = min(r1.z, 1.000000);
/*61*/	r0.w = r0.w + r1.z;
/*62*/	r0.w = r0.w * 0.500000;
/*63*/	r1.y = cb0.data[26].x * 0.050000 + r1.y;
/*64*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*65*/	r1.x = saturate(r1.x * 5.000000);
/*66*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*67*/	r1.w = r2.z * 0.250000;
/*68*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*69*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*70*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*71*/	r0.w = -r2.w + 1.000000;
/*72*/	r0.w = log2(r0.w);
/*73*/	r0.w = r0.w * vsOut_T7.z;
/*74*/	r0.w = exp2(r0.w);
/*75*/	r0.w = min(r0.w, 1.000000);
/*76*/	r0.w = r0.w * vsOut_T7.z;
/*77*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*78*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*79*/	r0.w = vsOut_T7.z + -0.025000;
/*80*/	r0.w = max(r0.w, 0.000000);
/*81*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*83*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*84*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*85*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*86*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*87*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*88*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*89*/	r0.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*90*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*91*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*92*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*93*/	r1.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*94*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & uint(0x3c008081u));
/*95*/	color2.xyzw = saturate(r0.xyzw);
/*96*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*97*/	r0.w = 1.000000;
/*98*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*99*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*100*/	color3.x = r1.x / r0.x;
/*101*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*102*/	color4 = floatBitsToUint(vsOut_T9.z);
/*103*/	return;
}
