//
//
// Shader Model 4
// Fragment Shader
//
// id: 2247 - fxc/glsl_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_gbuffer_skin.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;

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
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb2.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r2.z = sqrt(r0.w);
/*18*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r1.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*20*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*21*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*22*/	r0.w = r3.w * r4.w;
/*23*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*24*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*25*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*26*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*27*/	r0.w = inversesqrt(r0.w);
/*28*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*29*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*30*/	if(r0.w != 0) discard;
/*31*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*32*/	r2.xy = (r2.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*33*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*34*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*35*/	r0.w = saturate(-r0.w + r2.w);
/*36*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r0.w) != 0u) {
/*38*/	  r0.w = -r2.w + 1.000000;
/*39*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*40*/	  r0.w = -r0.w + 1.000000;
/*41*/	  r0.w = -r0.w * r0.w + 1.000000;
/*42*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*43*/	  r2.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*44*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*47*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*48*/	  r0.xyz = (r0.wwww * r3.xyzx + r2.xyzx).xyz;
/*49*/	  r2.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*50*/	} else {
/*51*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*52*/	}
/*53*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*54*/	r0.w = inversesqrt(r0.w);
/*55*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*56*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*59*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*62*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*63*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*64*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*65*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*66*/	r0.w = inversesqrt(r0.w);
/*67*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*68*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*69*/	r0.w = -vsOut_T4.z + 1.000000;
/*70*/	r4.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*71*/	r0.xyz = (r0.xyzx * r0.wwww + r4.xyzx).xyz;
/*72*/	r0.w = vsOut_T7.x * -r2.x + r2.x;
/*73*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*74*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*75*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*76*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*78*/	color1.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*79*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*80*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*81*/	r0.w = 1.000000;
/*82*/	r1.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*83*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*84*/	color3.x = r1.w / r0.x;
/*85*/	r0.x = max(abs(r1.z), abs(r1.y));
/*86*/	r0.x = max(r0.x, abs(r1.x));
/*87*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*88*/	r2.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*89*/	color0.xyzw = saturate(r2.xyzw);
/*90*/	color2.xyzw = r3.xyzz;
/*91*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*92*/	color4 = floatBitsToUint(vsOut_T9.z);
/*93*/	return;
}
