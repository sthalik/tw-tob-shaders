//
//
// Shader Model 4
// Fragment Shader
//
// id: 2772 - fxc/glsl_SM_4_0_weightedwithdirtburn.hlsl_PS_ps30_gbuffer_noclip_no_faction_colour_40.glsl
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
flat in vec4 vsOut_T6;
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*3*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*4*/	r0.w = inversesqrt(r0.w);
/*5*/	r1.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*6*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*7*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*8*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*9*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*10*/	r0.w = -r0.w + 1.000000;
/*11*/	r0.w = max(r0.w, 0.000000);
/*12*/	r3.z = sqrt(r0.w);
/*13*/	r2.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*14*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*15*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*16*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*17*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*18*/	r0.w = r4.w * r5.w;
/*19*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*20*/	r1.w = inversesqrt(r1.w);
/*21*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*22*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*23*/	r0.xyz = (r2.xxxx * r0.xyzx + r1.xyzx).xyz;
/*24*/	r1.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*25*/	r1.x = inversesqrt(r1.x);
/*26*/	r1.xyz = (r1.xxxx * vsOut_T2.xyzx).xyz;
/*27*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*28*/	r1.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*29*/	r1.x = inversesqrt(r1.x);
/*30*/	r0.xyz = (r0.xyzx * r1.xxxx).xyz;
/*31*/	r1.x = max(abs(r0.z), abs(r0.y));
/*32*/	r1.x = max(abs(r0.x), r1.x);
/*33*/	r0.xyz = (r0.xyzx / r1.xxxx).xyz;
/*34*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*35*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*36*/	color0.w = saturate(r1.x);
/*37*/	r0.x = vsOut_T7.y * -r1.y + r1.y;
/*38*/	color1.w = saturate(vsOut_T7.x * -r0.x + r0.x);
/*39*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*40*/	r0.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*41*/	r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*42*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*43*/	r1.x = saturate(-r1.x * 15.000000 + 1.000000);
/*44*/	r1.yz = (vsOut_T1.xxyx * vec4(0.000000, 1.200000, 1.500000, 0.000000)).yz;
/*45*/	r2.xyzw = (texture(s_fire_map, r1.yzyy.st)).xyzw;
/*46*/	r1.w = log2(r2.z);
/*47*/	r1.w = r1.w * 1.800000;
/*48*/	r1.w = exp2(r1.w);
/*49*/	r1.w = r1.w * 10.000000;
/*50*/	r1.w = min(r1.w, 1.000000);
/*51*/	r1.x = r1.w + r1.x;
/*52*/	r1.x = r1.x * 0.500000;
/*53*/	r1.z = cb0.data[26].x * 0.050000 + r1.z;
/*54*/	r3.xyzw = (texture(s_fire_map, r1.yzyy.st)).xyzw;
/*55*/	r1.y = saturate(r3.x * 5.000000);
/*56*/	r1.yzw = (r1.yyyy * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*57*/	r2.x = r2.z * 0.250000;
/*58*/	r1.yzw = (r1.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r2.xxxx).yzw;
/*59*/	r1.xyz = (r1.xxxx * r1.yzwy + r2.xxxx).xyz;
/*60*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*61*/	r1.w = -r2.w + 1.000000;
/*62*/	r1.w = log2(r1.w);
/*63*/	r1.w = r1.w * vsOut_T7.z;
/*64*/	r1.w = exp2(r1.w);
/*65*/	r1.w = min(r1.w, 1.000000);
/*66*/	r1.w = r1.w * vsOut_T7.z;
/*67*/	r0.xyz = (r1.wwww * r1.xyzx + r0.xyzx).xyz;
/*68*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*69*/	r1.w = vsOut_T7.z + -0.025000;
/*70*/	r1.w = max(r1.w, 0.000000);
/*71*/	r0.xyz = (r1.wwww * r1.xyzx + r0.xyzx).xyz;
/*72*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r1.xyz = (-r0.xyzx + r1.xxxx).xyz;
/*74*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*75*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*76*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*77*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*78*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*79*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*80*/	r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*81*/	r0.xyz = (r0.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*83*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*84*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*85*/	r1.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*86*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & uint(0x3c008081u));
/*87*/	color2.xyzw = saturate(r0.xyzw);
/*88*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*89*/	r0.w = 1.000000;
/*90*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*91*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*92*/	color3.x = r1.x / r0.x;
/*93*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*94*/	color4 = floatBitsToUint(vsOut_T9.z);
/*95*/	return;
}
