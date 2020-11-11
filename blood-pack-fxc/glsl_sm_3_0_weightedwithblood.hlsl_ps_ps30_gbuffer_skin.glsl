//
//
// Shader Model 4
// Fragment Shader
//
// id: 2101 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_gbuffer_skin.glsl
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
/*17*/	r0.w = sqrt(r0.w);
/*18*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*19*/	if(r1.z != 0) discard;
/*20*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*21*/	r1.zw = (r1.zzzw * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*22*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*23*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*24*/	r1.z = saturate(-r1.z + r2.w);
/*25*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*26*/	if(floatBitsToUint(r1.z) != 0u) {
/*27*/	  r1.z = -r2.w + 1.000000;
/*28*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*29*/	  r1.z = -r1.z + 1.000000;
/*30*/	  r1.z = -r1.z * r1.z + 1.000000;
/*31*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*32*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*33*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*34*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*35*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*36*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*37*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*38*/	  r2.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*39*/	} else {
/*40*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*41*/	}
/*42*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r1.z = inversesqrt(r1.z);
/*44*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*45*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*46*/	r1.z = inversesqrt(r1.z);
/*47*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*48*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r1.z = inversesqrt(r1.z);
/*50*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*51*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*52*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*53*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*57*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*58*/	r0.w = -vsOut_T4.z + 1.000000;
/*59*/	r4.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*60*/	r0.xyz = (r0.xyzx * r0.wwww + r4.xyzx).xyz;
/*61*/	r0.w = vsOut_T7.x * -r2.x + r2.x;
/*62*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*64*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*65*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*67*/	color1.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*68*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*69*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*70*/	r0.w = 1.000000;
/*71*/	r1.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*72*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*73*/	color3.x = r1.w / r0.x;
/*74*/	r0.x = max(abs(r1.z), abs(r1.y));
/*75*/	r0.x = max(r0.x, abs(r1.x));
/*76*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*77*/	r2.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*78*/	color0.xyzw = saturate(r2.xyzw);
/*79*/	color2.xyzw = r3.xyzz;
/*80*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*81*/	color4 = floatBitsToUint(vsOut_T9.z);
/*82*/	return;
}
