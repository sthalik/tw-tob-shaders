//
//
// Shader Model 4
// Fragment Shader
//
// id: 2569 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps30_gbuffer_40.glsl
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
flat in vec4 vsOut_P1;
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*6*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*7*/	r0.w = saturate(vsOut_P1.w);
/*8*/	r3.xyz = (r3.xyzx + -cb2.data[0].xyzx).xyz;
/*9*/	r3.xyz = (r0.wwww * r3.xyzx + cb2.data[0].xyzx).xyz;
/*10*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*11*/	r2.xyw = (r2.xyxw + -cb2.data[1].xyxz).xyw;
/*12*/	r2.xyw = (r0.wwww * r2.xyxw + cb2.data[1].xyxz).xyw;
/*13*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*14*/	r4.xyz = (r4.xyzx + -cb2.data[2].xyzx).xyz;
/*15*/	r4.xyz = (r0.wwww * r4.xyzx + cb2.data[2].xyzx).xyz;
/*16*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*19*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*21*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*22*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*23*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*26*/	r0.w = -r0.w + 1.000000;
/*27*/	r0.w = max(r0.w, 0.000000);
/*28*/	r0.w = sqrt(r0.w);
/*29*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*30*/	if(r1.z != 0) discard;
/*31*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*32*/	r1.zw = (r1.zzzw * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*34*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*35*/	r1.z = saturate(-r1.z + r2.w);
/*36*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r1.z) != 0u) {
/*38*/	  r1.z = -r2.w + 1.000000;
/*39*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*40*/	  r1.z = -r1.z + 1.000000;
/*41*/	  r1.z = -r1.z * r1.z + 1.000000;
/*42*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*43*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*44*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*47*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*48*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*49*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*50*/	  r3.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*51*/	} else {
/*52*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*53*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*54*/	}
/*55*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*57*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*58*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*60*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*61*/	r1.z = vsOut_T7.y * -r3.x + r3.x;
/*62*/	color1.w = saturate(vsOut_T7.x * -r1.z + r1.z);
/*63*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*64*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*66*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	r1.z = inversesqrt(r1.z);
/*68*/	r4.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*69*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*70*/	r1.z = inversesqrt(r1.z);
/*71*/	r5.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*72*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	r1.z = inversesqrt(r1.z);
/*74*/	r6.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*75*/	r1.yzw = (r1.yyyy * r5.xxyz).yzw;
/*76*/	r1.xyz = (r1.xxxx * r4.xyzx + r1.yzwy).xyz;
/*77*/	r1.xyz = (r0.wwww * r6.xyzx + r1.xyzx).xyz;
/*78*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*81*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*82*/	r4.w = 1.000000;
/*83*/	r0.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*84*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*85*/	r4.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*86*/	color3.x = r0.w / r1.w;
/*87*/	r0.w = max(abs(r1.z), abs(r1.y));
/*88*/	r0.w = max(r0.w, abs(r1.x));
/*89*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*90*/	r3.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*91*/	color0.xyzw = saturate(r3.xyzw);
/*92*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*93*/	r2.w = uintBitsToFloat(floatBitsToUint(r4.x) & uint(0x3c008081u));
/*94*/	color2.xyzw = saturate(r2.xyzw);
/*95*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*96*/	color4 = floatBitsToUint(vsOut_T9.z);
/*97*/	return;
}
