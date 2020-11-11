//
//
// Shader Model 4
// Fragment Shader
//
// id: 2577 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_gbuffer_noclip.glsl
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*3*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*4*/	r0.w = saturate(vsOut_P1.w);
/*5*/	r3.xyz = (r3.xyzx + -cb2.data[0].xyzx).xyz;
/*6*/	r3.xyz = (r0.wwww * r3.xyzx + cb2.data[0].xyzx).xyz;
/*7*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*8*/	r2.xyw = (r2.xyxw + -cb2.data[1].xyxz).xyw;
/*9*/	r2.xyw = (r0.wwww * r2.xyxw + cb2.data[1].xyxz).xyw;
/*10*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*11*/	r4.xyz = (r4.xyzx + -cb2.data[2].xyzx).xyz;
/*12*/	r4.xyz = (r0.wwww * r4.xyzx + cb2.data[2].xyzx).xyz;
/*13*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*14*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*18*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*19*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*21*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*23*/	r0.w = -r0.w + 1.000000;
/*24*/	r0.w = max(r0.w, 0.000000);
/*25*/	r0.w = sqrt(r0.w);
/*26*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*27*/	if(r1.z != 0) discard;
/*28*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*29*/	r1.zw = (r1.zzzw * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*31*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*32*/	r1.z = saturate(-r1.z + r2.w);
/*33*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*34*/	if(floatBitsToUint(r1.z) != 0u) {
/*35*/	  r1.z = -r2.w + 1.000000;
/*36*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*37*/	  r1.z = -r1.z + 1.000000;
/*38*/	  r1.z = -r1.z * r1.z + 1.000000;
/*39*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*40*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*41*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*42*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*43*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*44*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*45*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*46*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*47*/	  r3.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*48*/	} else {
/*49*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*51*/	}
/*52*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*54*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*55*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*57*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*58*/	r1.z = vsOut_T7.y * -r3.x + r3.x;
/*59*/	color1.w = saturate(vsOut_T7.x * -r1.z + r1.z);
/*60*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*61*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*62*/	r0.xyz = saturate(vsOut_T7.xxxx * r4.xyzx + r0.xyzx).xyz;
/*63*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r1.z = inversesqrt(r1.z);
/*65*/	r4.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*66*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*67*/	r1.z = inversesqrt(r1.z);
/*68*/	r5.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*69*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*70*/	r1.z = inversesqrt(r1.z);
/*71*/	r6.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*72*/	r1.yzw = (r1.yyyy * r5.xxyz).yzw;
/*73*/	r1.xyz = (r1.xxxx * r4.xyzx + r1.yzwy).xyz;
/*74*/	r1.xyz = (r0.wwww * r6.xyzx + r1.xyzx).xyz;
/*75*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*76*/	r0.w = inversesqrt(r0.w);
/*77*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*78*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*79*/	r4.w = 1.000000;
/*80*/	r0.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*81*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*82*/	r4.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*83*/	color3.x = r0.w / r1.w;
/*84*/	r0.w = max(abs(r1.z), abs(r1.y));
/*85*/	r0.w = max(r0.w, abs(r1.x));
/*86*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*87*/	r3.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*88*/	color0.xyzw = saturate(r3.xyzw);
/*89*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*90*/	r2.w = uintBitsToFloat(floatBitsToUint(r4.x) & uint(0x3c008081u));
/*91*/	color2.xyzw = saturate(r2.xyzw);
/*92*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*93*/	color4 = floatBitsToUint(vsOut_T9.z);
/*94*/	return;
}
