//
//
// Shader Model 4
// Fragment Shader
//
// id: 2108 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps30_gbuffer_skin_noclip_no_faction_colour_40.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r0.w = sqrt(r0.w);
/*8*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*9*/	if(r1.z != 0) discard;
/*10*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*11*/	r1.zw = (r1.zzzw * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*13*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*14*/	r1.z = saturate(-r1.z + r2.w);
/*15*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*16*/	if(floatBitsToUint(r1.z) != 0u) {
/*17*/	  r1.z = -r2.w + 1.000000;
/*18*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*19*/	  r1.z = -r1.z + 1.000000;
/*20*/	  r1.z = -r1.z * r1.z + 1.000000;
/*21*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*22*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*23*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*24*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*25*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*26*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*27*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*28*/	  r2.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*29*/	} else {
/*30*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*31*/	}
/*32*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*33*/	r1.z = inversesqrt(r1.z);
/*34*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*35*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*36*/	r1.z = inversesqrt(r1.z);
/*37*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*38*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*39*/	r1.z = inversesqrt(r1.z);
/*40*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*41*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*42*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*43*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*47*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*48*/	r0.w = vsOut_T7.x * -r2.x + r2.x;
/*49*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*50*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*52*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*54*/	color1.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*55*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*56*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*57*/	r0.w = 1.000000;
/*58*/	r1.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*59*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*60*/	color3.x = r1.w / r0.x;
/*61*/	r0.x = max(abs(r1.z), abs(r1.y));
/*62*/	r0.x = max(r0.x, abs(r1.x));
/*63*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*64*/	r2.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*65*/	color0.xyzw = saturate(r2.xyzw);
/*66*/	color2.xyzw = r3.xyzz;
/*67*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*68*/	color4 = floatBitsToUint(vsOut_T9.z);
/*69*/	return;
}
