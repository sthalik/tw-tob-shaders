//
//
// Shader Model 4
// Fragment Shader
//
// id: 2415 - fxc/glsl_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_gbuffer_skin_noclip_no_faction_colour_slm.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
  vec4 r7;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r2.z = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r4.xy = (-cb1.data[3].xyxx + cb1.data[3].zwzz).xy;
/*11*/	r4.zw = (vsOut_T1.xxxy + -cb1.data[3].xxxy).zw;
/*12*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*13*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*14*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r5.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*18*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyxx.st)).xyzw;
/*19*/	r4.xyzw = (texture(s_decal_normal, r4.xyxx.st)).xyzw;
/*20*/	if(floatBitsToUint(r0.w) != 0u) {
/*21*/	  r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*24*/	  r0.w = -r0.w + 1.000000;
/*25*/	  r0.w = max(r0.w, 0.000000);
/*26*/	  r4.z = sqrt(r0.w);
/*27*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*29*/	  r0.w = r3.x * r7.w;
/*30*/	  r3.x = r0.w * -0.500000 + r3.x;
/*31*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*32*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*33*/	  r0.w = -r5.w * r6.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*35*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*36*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*37*/	}
/*38*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*39*/	if(r0.w != 0) discard;
/*40*/	r4.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*41*/	r4.xy = (r4.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*42*/	r4.xyzw = (texture(s_decal_blood_map, r4.xyxx.st)).xyzw;
/*43*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*44*/	r0.w = saturate(-r0.w + r4.w);
/*45*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*46*/	if(floatBitsToUint(r0.w) != 0u) {
/*47*/	  r0.w = -r4.w + 1.000000;
/*48*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*49*/	  r0.w = -r0.w + 1.000000;
/*50*/	  r0.w = -r0.w * r0.w + 1.000000;
/*51*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*52*/	  r4.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*53*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*54*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*55*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*56*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*57*/	  r0.xyz = (r0.wwww * r5.xyzx + r4.xyzx).xyz;
/*58*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*59*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*60*/	}
/*61*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r4.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*64*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*65*/	r0.w = inversesqrt(r0.w);
/*66*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*67*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*68*/	r0.w = inversesqrt(r0.w);
/*69*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*70*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*71*/	r2.xyw = (r2.xxxx * r4.xyxz + r5.xyxz).xyw;
/*72*/	r2.xyz = (r2.zzzz * r6.xyzx + r2.xywx).xyz;
/*73*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*74*/	r0.w = inversesqrt(r0.w);
/*75*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*76*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*77*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*78*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*79*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*80*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*81*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*82*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*83*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*84*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*85*/	color2.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*86*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*87*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*88*/	r1.w = 1.000000;
/*89*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*90*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*91*/	color3.x = r0.w / r1.x;
/*92*/	r0.w = max(abs(r2.z), abs(r2.y));
/*93*/	r0.w = max(r0.w, abs(r2.x));
/*94*/	r1.xyz = (r2.xyzx / r0.wwww).xyz;
/*95*/	r3.xzw = (r1.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*96*/	color0.xyzw = saturate(r3.xzwy);
/*97*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*98*/	color2.w = 0;
/*99*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*100*/	color4 = floatBitsToUint(vsOut_T9.z);
/*101*/	return;
}
