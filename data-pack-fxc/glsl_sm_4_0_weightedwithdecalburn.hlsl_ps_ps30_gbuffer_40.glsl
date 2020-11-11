//
//
// Shader Model 4
// Fragment Shader
//
// id: 2907 - fxc/glsl_SM_4_0_weightedwithdecalburn.hlsl_PS_ps30_gbuffer_40.glsl
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
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb2.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb2.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb2.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb2.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb2.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb2.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r2.z = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb1.data[3].xxxy + cb1.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*33*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*34*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*35*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*36*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*37*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*38*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*39*/	r4.z = vsOut_T6.z;
/*40*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*41*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*42*/	if(floatBitsToUint(r0.w) != 0u) {
/*43*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*44*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*46*/	  r0.w = -r0.w + 1.000000;
/*47*/	  r0.w = max(r0.w, 0.000000);
/*48*/	  r4.z = sqrt(r0.w);
/*49*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*51*/	  r0.w = r3.x * r7.w;
/*52*/	  r3.x = r0.w * -0.500000 + r3.x;
/*53*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*54*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*55*/	  r0.w = -r5.w * r6.w + 1.000000;
/*56*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*57*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*58*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*59*/	}
/*60*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*61*/	r4.x = r3.z;
/*62*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*63*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*64*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*65*/	r0.w = saturate(r4.x * 5.000000);
/*66*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*67*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*68*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*69*/	r1.w = log2(r5.z);
/*70*/	r1.w = r1.w * 1.800000;
/*71*/	r1.w = exp2(r1.w);
/*72*/	r1.w = r1.w * 10.000000;
/*73*/	r1.w = min(r1.w, 1.000000);
/*74*/	r0.w = r0.w + r1.w;
/*75*/	r0.w = r0.w * 0.500000;
/*76*/	r1.w = -r5.w + 1.000000;
/*77*/	r1.w = log2(r1.w);
/*78*/	r1.w = r1.w * vsOut_T7.z;
/*79*/	r1.w = exp2(r1.w);
/*80*/	r1.w = min(r1.w, 1.000000);
/*81*/	r1.w = r1.w * vsOut_T7.z;
/*82*/	r2.w = r5.z * 0.250000;
/*83*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*84*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*85*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*86*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*87*/	r0.w = vsOut_T7.z + -0.025000;
/*88*/	r0.w = max(r0.w, 0.000000);
/*89*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*90*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*91*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*92*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*93*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*94*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*95*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*96*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*97*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*98*/	color1.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*99*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*100*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*101*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*102*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*103*/	r0.w = inversesqrt(r0.w);
/*104*/	r3.xzw = (r0.wwww * vsOut_T3.xxyz).xzw;
/*105*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*106*/	r0.w = inversesqrt(r0.w);
/*107*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*108*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*109*/	r0.w = inversesqrt(r0.w);
/*110*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*111*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*112*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*113*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*114*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*115*/	r0.w = inversesqrt(r0.w);
/*116*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*117*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*118*/	r4.w = 1.000000;
/*119*/	r0.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*120*/	r2.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*121*/	r3.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*122*/	color3.x = r0.w / r2.w;
/*123*/	r0.w = max(abs(r2.z), abs(r2.y));
/*124*/	r0.w = max(r0.w, abs(r2.x));
/*125*/	r2.xyz = (r2.xyzx / r0.wwww).xyz;
/*126*/	color0.xyz = saturate(r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*127*/	color0.w = saturate(r3.y);
/*128*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*129*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3c008081u));
/*130*/	color2.xyzw = saturate(r1.xyzw);
/*131*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*132*/	color4 = floatBitsToUint(vsOut_T9.z);
/*133*/	return;
}
