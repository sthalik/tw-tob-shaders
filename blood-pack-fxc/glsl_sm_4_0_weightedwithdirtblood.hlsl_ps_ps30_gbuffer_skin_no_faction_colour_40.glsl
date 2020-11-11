//
//
// Shader Model 4
// Fragment Shader
//
// id: 2257 - fxc/glsl_SM_4_0_weightedwithdirtblood.hlsl_PS_ps30_gbuffer_skin_no_faction_colour_40.glsl
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
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r2.z = sqrt(r0.w);
/*11*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r1.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*13*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*14*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*15*/	r0.w = r3.w * r4.w;
/*16*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*17*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*19*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*20*/	r0.w = inversesqrt(r0.w);
/*21*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*22*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*23*/	if(r0.w != 0) discard;
/*24*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*27*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*28*/	r0.w = saturate(-r0.w + r2.w);
/*29*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*30*/	if(floatBitsToUint(r0.w) != 0u) {
/*31*/	  r0.w = -r2.w + 1.000000;
/*32*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*33*/	  r0.w = -r0.w + 1.000000;
/*34*/	  r0.w = -r0.w * r0.w + 1.000000;
/*35*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*36*/	  r2.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*37*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*38*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*39*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*40*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*41*/	  r0.xyz = (r0.wwww * r3.xyzx + r2.xyzx).xyz;
/*42*/	  r2.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*43*/	} else {
/*44*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*45*/	}
/*46*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*47*/	r0.w = inversesqrt(r0.w);
/*48*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*49*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*52*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*53*/	r0.w = inversesqrt(r0.w);
/*54*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*55*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*56*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*57*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*58*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*59*/	r0.w = inversesqrt(r0.w);
/*60*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*61*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	r0.w = vsOut_T7.x * -r2.x + r2.x;
/*63*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*64*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*66*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*68*/	color1.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*69*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*70*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*71*/	r0.w = 1.000000;
/*72*/	r1.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*73*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*74*/	color3.x = r1.w / r0.x;
/*75*/	r0.x = max(abs(r1.z), abs(r1.y));
/*76*/	r0.x = max(r0.x, abs(r1.x));
/*77*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*78*/	r2.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*79*/	color0.xyzw = saturate(r2.xyzw);
/*80*/	color2.xyzw = r3.xyzz;
/*81*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*82*/	color4 = floatBitsToUint(vsOut_T9.z);
/*83*/	return;
}
