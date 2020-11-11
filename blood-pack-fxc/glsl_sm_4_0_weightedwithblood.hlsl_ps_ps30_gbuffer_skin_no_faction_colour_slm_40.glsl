//
//
// Shader Model 4
// Fragment Shader
//
// id: 2128 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps30_gbuffer_skin_no_faction_colour_slm_40.glsl
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r0.w = sqrt(r0.w);
/*11*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*12*/	if(r1.z != 0) discard;
/*13*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*14*/	r1.zw = (r1.zzzw * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*16*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*17*/	r1.z = saturate(-r1.z + r2.w);
/*18*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*19*/	if(floatBitsToUint(r1.z) != 0u) {
/*20*/	  r1.z = -r2.w + 1.000000;
/*21*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*22*/	  r1.z = -r1.z + 1.000000;
/*23*/	  r1.z = -r1.z * r1.z + 1.000000;
/*24*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*25*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*26*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*27*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*28*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*29*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*30*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*31*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*32*/	  r3.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*33*/	} else {
/*34*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*35*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*36*/	}
/*37*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*38*/	r1.z = inversesqrt(r1.z);
/*39*/	r4.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*40*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*41*/	r1.z = inversesqrt(r1.z);
/*42*/	r5.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*43*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*44*/	r1.z = inversesqrt(r1.z);
/*45*/	r6.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*46*/	r1.yzw = (r1.yyyy * r5.xxyz).yzw;
/*47*/	r1.xyz = (r1.xxxx * r4.xyzx + r1.yzwy).xyz;
/*48*/	r1.xyz = (r0.wwww * r6.xyzx + r1.xyzx).xyz;
/*49*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*52*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*53*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*54*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*55*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*56*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*57*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*58*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*59*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*61*/	color2.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*62*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*63*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*64*/	r2.w = 1.000000;
/*65*/	r0.w = dot(r2.xyzw, cb0.data[11].xyzw);
/*66*/	r1.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*67*/	color3.x = r0.w / r1.w;
/*68*/	r0.w = max(abs(r1.z), abs(r1.y));
/*69*/	r0.w = max(r0.w, abs(r1.x));
/*70*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*71*/	r3.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*72*/	color0.xyzw = saturate(r3.xyzw);
/*73*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*74*/	color2.w = 0;
/*75*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*76*/	color4 = floatBitsToUint(vsOut_T9.z);
/*77*/	return;
}
