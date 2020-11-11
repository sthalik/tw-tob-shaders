//
//
// Shader Model 4
// Fragment Shader
//
// id: 2913 - fxc/glsl_SM_3_0_weightedwithdecalburn.hlsl_PS_ps30_gbuffer_noclip.glsl
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
flat in vec4 vsOut_T7;

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
uniform sampler2D s_fire_map;

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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb2.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb2.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb2.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb2.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb2.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb2.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r2.z = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb1.data[3].xxxy + cb1.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*30*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*31*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*32*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*33*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*34*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*35*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*36*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*38*/	if(floatBitsToUint(r0.w) != 0u) {
/*39*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*40*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*42*/	  r0.w = -r0.w + 1.000000;
/*43*/	  r0.w = max(r0.w, 0.000000);
/*44*/	  r5.z = sqrt(r0.w);
/*45*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*47*/	  r0.w = r3.x * r7.w;
/*48*/	  r3.x = r0.w * -0.500000 + r3.x;
/*49*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*50*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*51*/	  r0.w = -r4.w * r6.w + 1.000000;
/*52*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*53*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*54*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*55*/	}
/*56*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*57*/	r4.x = r3.z;
/*58*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*59*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*60*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*61*/	r0.w = saturate(r4.x * 5.000000);
/*62*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*65*/	r1.w = log2(r5.z);
/*66*/	r1.w = r1.w * 1.800000;
/*67*/	r1.w = exp2(r1.w);
/*68*/	r1.w = r1.w * 10.000000;
/*69*/	r1.w = min(r1.w, 1.000000);
/*70*/	r0.w = r0.w + r1.w;
/*71*/	r0.w = r0.w * 0.500000;
/*72*/	r1.w = -r5.w + 1.000000;
/*73*/	r1.w = log2(r1.w);
/*74*/	r1.w = r1.w * vsOut_T7.z;
/*75*/	r1.w = exp2(r1.w);
/*76*/	r1.w = min(r1.w, 1.000000);
/*77*/	r1.w = r1.w * vsOut_T7.z;
/*78*/	r2.w = r5.z * 0.250000;
/*79*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*80*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*81*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*82*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*83*/	r0.w = vsOut_T7.z + -0.025000;
/*84*/	r0.w = max(r0.w, 0.000000);
/*85*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*86*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*87*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*88*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*89*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*90*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*91*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*92*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*93*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*94*/	color1.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*95*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*96*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*97*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*98*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*99*/	r0.w = inversesqrt(r0.w);
/*100*/	r3.xzw = (r0.wwww * vsOut_T3.xxyz).xzw;
/*101*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*102*/	r0.w = inversesqrt(r0.w);
/*103*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*104*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*105*/	r0.w = inversesqrt(r0.w);
/*106*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*107*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*108*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*109*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*110*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*111*/	r0.w = inversesqrt(r0.w);
/*112*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*113*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*114*/	r4.w = 1.000000;
/*115*/	r0.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*116*/	r2.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*117*/	r3.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*118*/	color3.x = r0.w / r2.w;
/*119*/	r0.w = max(abs(r2.z), abs(r2.y));
/*120*/	r0.w = max(r0.w, abs(r2.x));
/*121*/	r2.xyz = (r2.xyzx / r0.wwww).xyz;
/*122*/	color0.xyz = saturate(r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*123*/	color0.w = saturate(r3.y);
/*124*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*125*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3c008081u));
/*126*/	color2.xyzw = saturate(r1.xyzw);
/*127*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*128*/	color4 = floatBitsToUint(vsOut_T9.z);
/*129*/	return;
}
