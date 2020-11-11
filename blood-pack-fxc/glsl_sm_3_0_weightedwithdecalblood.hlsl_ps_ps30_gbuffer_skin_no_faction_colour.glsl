//
//
// Shader Model 4
// Fragment Shader
//
// id: 2403 - fxc/glsl_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_gbuffer_skin_no_faction_colour.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*10*/	r1.z = sqrt(r0.w);
/*11*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*12*/	r3.xy = (-cb1.data[3].xyxx + cb1.data[3].zwzz).xy;
/*13*/	r3.zw = (vsOut_T1.xxxy + -cb1.data[3].xxxy).zw;
/*14*/	r3.xy = (r3.zwzz / r3.xyxx).xy;
/*15*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r4.x));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*20*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyxx.st)).xyzw;
/*21*/	r3.xyzw = (texture(s_decal_normal, r3.xyxx.st)).xyzw;
/*22*/	if(floatBitsToUint(r0.w) != 0u) {
/*23*/	  r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	  r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*26*/	  r0.w = -r0.w + 1.000000;
/*27*/	  r0.w = max(r0.w, 0.000000);
/*28*/	  r3.z = sqrt(r0.w);
/*29*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*31*/	  r0.w = r2.x * r6.w;
/*32*/	  r2.x = r0.w * -0.500000 + r2.x;
/*33*/	  r0.w = -r4.w * r5.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*35*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*36*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*37*/	}
/*38*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*39*/	if(r0.w != 0) discard;
/*40*/	r3.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*41*/	r3.xy = (r3.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*42*/	r3.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*43*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*44*/	r0.w = saturate(-r0.w + r3.w);
/*45*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*46*/	if(floatBitsToUint(r0.w) != 0u) {
/*47*/	  r0.w = -r3.w + 1.000000;
/*48*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*49*/	  r0.w = -r0.w + 1.000000;
/*50*/	  r0.w = -r0.w * r0.w + 1.000000;
/*51*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*52*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*53*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*54*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*55*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*56*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*57*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*58*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*59*/	}
/*60*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*63*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*66*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*70*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*71*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*72*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*73*/	r0.w = inversesqrt(r0.w);
/*74*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*75*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*76*/	r0.w = vsOut_T7.x * -r2.x + r2.x;
/*77*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*78*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*79*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*80*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*81*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*82*/	color1.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*83*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*84*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*85*/	r0.w = 1.000000;
/*86*/	r1.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*87*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*88*/	color3.x = r1.w / r0.x;
/*89*/	r0.x = max(abs(r1.z), abs(r1.y));
/*90*/	r0.x = max(r0.x, abs(r1.x));
/*91*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*92*/	r2.xzw = (r0.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*93*/	color0.xyzw = saturate(r2.xzwy);
/*94*/	color2.xyzw = r3.xyzz;
/*95*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*96*/	color4 = floatBitsToUint(vsOut_T9.z);
/*97*/	return;
}
