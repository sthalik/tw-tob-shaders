//
//
// Shader Model 4
// Fragment Shader
//
// id: 2407 - fxc/glsl_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_gbuffer_skin_slm.glsl
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
uniform sampler2D s_colour_mask_map;
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
  vec4 r7;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*7*/	r0.xyz = (r2.xxxx * r3.xyzx + r0.xyzx).xyz;
/*8*/	r3.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*9*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*10*/	r2.xyw = (cb2.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*11*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*12*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*13*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*14*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*15*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*16*/	r0.w = -r0.w + 1.000000;
/*17*/	r0.w = max(r0.w, 0.000000);
/*18*/	r2.z = sqrt(r0.w);
/*19*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*20*/	r4.xy = (-cb1.data[3].xyxx + cb1.data[3].zwzz).xy;
/*21*/	r4.zw = (vsOut_T1.xxxy + -cb1.data[3].xxxy).zw;
/*22*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*23*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*24*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r5.x));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*27*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*28*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyxx.st)).xyzw;
/*29*/	r4.xyzw = (texture(s_decal_normal, r4.xyxx.st)).xyzw;
/*30*/	if(floatBitsToUint(r0.w) != 0u) {
/*31*/	  r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*32*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*34*/	  r0.w = -r0.w + 1.000000;
/*35*/	  r0.w = max(r0.w, 0.000000);
/*36*/	  r4.z = sqrt(r0.w);
/*37*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*38*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*39*/	  r0.w = r3.x * r7.w;
/*40*/	  r3.x = r0.w * -0.500000 + r3.x;
/*41*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*42*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*43*/	  r0.w = -r5.w * r6.w + 1.000000;
/*44*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*45*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*46*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*47*/	}
/*48*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*49*/	if(r0.w != 0) discard;
/*50*/	r4.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*51*/	r4.xy = (r4.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*52*/	r4.xyzw = (texture(s_decal_blood_map, r4.xyxx.st)).xyzw;
/*53*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*54*/	r0.w = saturate(-r0.w + r4.w);
/*55*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*56*/	if(floatBitsToUint(r0.w) != 0u) {
/*57*/	  r0.w = -r4.w + 1.000000;
/*58*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*59*/	  r0.w = -r0.w + 1.000000;
/*60*/	  r0.w = -r0.w * r0.w + 1.000000;
/*61*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*62*/	  r4.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*63*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*64*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*65*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*66*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*67*/	  r0.xyz = (r0.wwww * r5.xyzx + r4.xyzx).xyz;
/*68*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*69*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*70*/	}
/*71*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*72*/	r0.w = inversesqrt(r0.w);
/*73*/	r4.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*74*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*75*/	r0.w = inversesqrt(r0.w);
/*76*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*77*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*78*/	r0.w = inversesqrt(r0.w);
/*79*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*80*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*81*/	r2.xyw = (r2.xxxx * r4.xyxz + r5.xyxz).xyw;
/*82*/	r2.xyz = (r2.zzzz * r6.xyzx + r2.xywx).xyz;
/*83*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*84*/	r0.w = inversesqrt(r0.w);
/*85*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*86*/	r0.w = -vsOut_T4.z + 1.000000;
/*87*/	r4.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*88*/	r0.xyz = (r0.xyzx * r0.wwww + r4.xyzx).xyz;
/*89*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*90*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*91*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*92*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*93*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*94*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*95*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*96*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*97*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*98*/	color2.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*99*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*100*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*101*/	r1.w = 1.000000;
/*102*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*103*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*104*/	color3.x = r0.w / r1.x;
/*105*/	r0.w = max(abs(r2.z), abs(r2.y));
/*106*/	r0.w = max(r0.w, abs(r2.x));
/*107*/	r1.xyz = (r2.xyzx / r0.wwww).xyz;
/*108*/	r3.xzw = (r1.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*109*/	color0.xyzw = saturate(r3.xzwy);
/*110*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*111*/	color2.w = 0;
/*112*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*113*/	color4 = floatBitsToUint(vsOut_T9.z);
/*114*/	return;
}
