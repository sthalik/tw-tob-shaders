//
//
// Shader Model 4
// Fragment Shader
//
// id: 2271 - fxc/glsl_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_gbuffer_skin_noclip_no_faction_colour_slm.glsl
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
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;

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
  vec4 r6;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r2.z = sqrt(r0.w);
/*8*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*10*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*11*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*12*/	r0.w = r3.w * r4.w;
/*13*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*14*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*16*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r1.x = inversesqrt(r1.x);
/*18*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*19*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r1.w != 0) discard;
/*21*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*23*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*25*/	r1.w = saturate(-r1.w + r2.w);
/*26*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r1.w) != 0u) {
/*28*/	  r1.w = -r2.w + 1.000000;
/*29*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*30*/	  r1.w = -r1.w + 1.000000;
/*31*/	  r1.w = -r1.w * r1.w + 1.000000;
/*32*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*33*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*37*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*38*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*39*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*40*/	  r3.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*41*/	} else {
/*42*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*44*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*45*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*46*/	}
/*47*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*48*/	r0.w = inversesqrt(r0.w);
/*49*/	r4.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*50*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*53*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*54*/	r0.w = inversesqrt(r0.w);
/*55*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*56*/	r5.xyz = (r1.yyyy * r5.xyzx).xyz;
/*57*/	r1.xyw = (r1.xxxx * r4.xyxz + r5.xyxz).xyw;
/*58*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*59*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*62*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*63*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*64*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*66*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*68*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*69*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*70*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*71*/	color2.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*72*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*73*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*74*/	r2.w = 1.000000;
/*75*/	r0.w = dot(r2.xyzw, cb0.data[11].xyzw);
/*76*/	r1.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*77*/	color3.x = r0.w / r1.w;
/*78*/	r0.w = max(abs(r1.z), abs(r1.y));
/*79*/	r0.w = max(r0.w, abs(r1.x));
/*80*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*81*/	r3.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*82*/	color0.xyzw = saturate(r3.xyzw);
/*83*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*84*/	color2.w = 0;
/*85*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*86*/	color4 = floatBitsToUint(vsOut_T9.z);
/*87*/	return;
}
