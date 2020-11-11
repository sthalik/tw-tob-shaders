//
//
// Shader Model 4
// Fragment Shader
//
// id: 2391 - fxc/glsl_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_gbuffer_skin.glsl
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
  vec4 r6;

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
/*17*/	r1.z = sqrt(r0.w);
/*18*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*19*/	r3.xy = (-cb1.data[3].xyxx + cb1.data[3].zwzz).xy;
/*20*/	r3.zw = (vsOut_T1.xxxy + -cb1.data[3].xxxy).zw;
/*21*/	r3.xy = (r3.zwzz / r3.xyxx).xy;
/*22*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*23*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*24*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r4.x));
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*27*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyxx.st)).xyzw;
/*28*/	r3.xyzw = (texture(s_decal_normal, r3.xyxx.st)).xyzw;
/*29*/	if(floatBitsToUint(r0.w) != 0u) {
/*30*/	  r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	  r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*33*/	  r0.w = -r0.w + 1.000000;
/*34*/	  r0.w = max(r0.w, 0.000000);
/*35*/	  r3.z = sqrt(r0.w);
/*36*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*37*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*38*/	  r0.w = r2.x * r6.w;
/*39*/	  r2.x = r0.w * -0.500000 + r2.x;
/*40*/	  r0.w = -r4.w * r5.w + 1.000000;
/*41*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*42*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*43*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*44*/	}
/*45*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*46*/	if(r0.w != 0) discard;
/*47*/	r3.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*48*/	r3.xy = (r3.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*49*/	r3.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*50*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*51*/	r0.w = saturate(-r0.w + r3.w);
/*52*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*53*/	if(floatBitsToUint(r0.w) != 0u) {
/*54*/	  r0.w = -r3.w + 1.000000;
/*55*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*56*/	  r0.w = -r0.w + 1.000000;
/*57*/	  r0.w = -r0.w * r0.w + 1.000000;
/*58*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*59*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*60*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*61*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*62*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*63*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*64*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*65*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*66*/	}
/*67*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*68*/	r0.w = inversesqrt(r0.w);
/*69*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*70*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*71*/	r0.w = inversesqrt(r0.w);
/*72*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*73*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*74*/	r0.w = inversesqrt(r0.w);
/*75*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*76*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*77*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*78*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*79*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*80*/	r0.w = inversesqrt(r0.w);
/*81*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*82*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*83*/	r0.w = -vsOut_T4.z + 1.000000;
/*84*/	r4.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*85*/	r0.xyz = (r0.xyzx * r0.wwww + r4.xyzx).xyz;
/*86*/	r0.w = vsOut_T7.x * -r2.x + r2.x;
/*87*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*88*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*89*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*90*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*91*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*92*/	color1.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*93*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*94*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*95*/	r0.w = 1.000000;
/*96*/	r1.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*97*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*98*/	color3.x = r1.w / r0.x;
/*99*/	r0.x = max(abs(r1.z), abs(r1.y));
/*100*/	r0.x = max(r0.x, abs(r1.x));
/*101*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*102*/	r2.xzw = (r0.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*103*/	color0.xyzw = saturate(r2.xzwy);
/*104*/	color2.xyzw = r3.xyzz;
/*105*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*106*/	color4 = floatBitsToUint(vsOut_T9.z);
/*107*/	return;
}
