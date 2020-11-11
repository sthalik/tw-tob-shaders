//
//
// Shader Model 4
// Fragment Shader
//
// id: 179 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_shrouded_palettized.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_diffuse_map_point_sample;
uniform sampler2D s_alt_map;
uniform sampler2D s_campaign_shroud_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform sprite_PS
{
  vec4 data[3];
} cb1;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.yw = (vsOut_T0.wwww).yw;
/*1*/	r1.xyzw = vsOut_T0.xyxy + vec4(-0.000500, -0.000500, 0.000000, -0.000500);
/*2*/	r2.xyzw = (textureLod(s_diffuse_map_point_sample, r1.xyxx.st, r1.y)).xyzw;
/*3*/	r1.xyzw = (textureLod(s_diffuse_map_point_sample, r1.zwzz.st, r1.w)).xyzw;
/*4*/	r1.x = -vsOut_T3.z + vsOut_T3.w;
/*5*/	r0.x = r2.w * r1.x + vsOut_T3.z;
/*6*/	r2.xyzw = (textureLod(s_alt_map, r0.xyxx.st, vsOut_T0.w)).xyzw;
/*7*/	r3.yw = (vsOut_T0.wwww).yw;
/*8*/	r4.xyzw = (textureLod(s_diffuse_map_point_sample, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*9*/	r3.x = r4.w * r1.x + vsOut_T3.z;
/*10*/	r4.xyzw = (textureLod(s_alt_map, r3.xyxx.st, vsOut_T0.w)).xyzw;
/*11*/	r0.x = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*12*/	r2.xz = (mix(r2.xxzx, r2.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*13*/	r4.xz = (mix(r4.xxzx, r4.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*14*/	r2.xyzw = r2.xyzw + r4.xyzw;
/*15*/	r0.z = r1.w * r1.x + vsOut_T3.z;
/*16*/	r4.xyzw = (textureLod(s_alt_map, r0.zwzz.st, vsOut_T0.w)).xyzw;
/*17*/	r4.xz = (mix(r4.xxzx, r4.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*18*/	r2.xyzw = r2.xyzw + r4.xyzw;
/*19*/	r4.yw = (vsOut_T0.wwww).yw;
/*20*/	r5.xyzw = vsOut_T0.xyxy + vec4(0.000500, -0.000500, -0.000500, 0.000000);
/*21*/	r6.xyzw = (textureLod(s_diffuse_map_point_sample, r5.xyxx.st, r5.y)).xyzw;
/*22*/	r5.xyzw = (textureLod(s_diffuse_map_point_sample, r5.zwzz.st, r5.w)).xyzw;
/*23*/	r4.z = r5.w * r1.x + vsOut_T3.z;
/*24*/	r5.xyzw = (textureLod(s_alt_map, r4.zwzz.st, vsOut_T0.w)).xyzw;
/*25*/	r4.x = r6.w * r1.x + vsOut_T3.z;
/*26*/	r4.xyzw = (textureLod(s_alt_map, r4.xyxx.st, vsOut_T0.w)).xyzw;
/*27*/	r4.xz = (mix(r4.xxzx, r4.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*28*/	r2.xyzw = r2.xyzw + r4.xyzw;
/*29*/	r5.xz = (mix(r5.xxzx, r5.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*30*/	r2.xyzw = r2.xyzw + r5.xyzw;
/*31*/	r4.xyzw = vsOut_T0.xyxy + vec4(0.000500, 0.000000, -0.000500, 0.000500);
/*32*/	r5.xyzw = (textureLod(s_diffuse_map_point_sample, r4.xyxx.st, r4.y)).xyzw;
/*33*/	r4.xyzw = (textureLod(s_diffuse_map_point_sample, r4.zwzz.st, r4.w)).xyzw;
/*34*/	r4.x = r4.w * r1.x + vsOut_T3.z;
/*35*/	r3.z = r5.w * r1.x + vsOut_T3.z;
/*36*/	r3.xyzw = (textureLod(s_alt_map, r3.zwzz.st, vsOut_T0.w)).xyzw;
/*37*/	r3.xz = (mix(r3.xxzx, r3.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*38*/	r2.xyzw = r2.xyzw + r3.xyzw;
/*39*/	r4.yw = (vsOut_T0.wwww).yw;
/*40*/	r3.xyzw = (textureLod(s_alt_map, r4.xyxx.st, vsOut_T0.w)).xyzw;
/*41*/	r3.xz = (mix(r3.xxzx, r3.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*42*/	r2.xyzw = r2.xyzw + r3.xyzw;
/*43*/	r3.xyzw = vsOut_T0.xyxy + vec4(0.000000, 0.000500, 0.000500, 0.000500);
/*44*/	r5.xyzw = (textureLod(s_diffuse_map_point_sample, r3.xyxx.st, r3.y)).xyzw;
/*45*/	r3.xyzw = (textureLod(s_diffuse_map_point_sample, r3.zwzz.st, r3.w)).xyzw;
/*46*/	r3.x = r3.w * r1.x + vsOut_T3.z;
/*47*/	r4.z = r5.w * r1.x + vsOut_T3.z;
/*48*/	r1.xyzw = (textureLod(s_alt_map, r4.zwzz.st, vsOut_T0.w)).xyzw;
/*49*/	r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*50*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*51*/	r3.y = vsOut_T0.w;
/*52*/	r2.xyzw = (textureLod(s_alt_map, r3.xyxx.st, vsOut_T0.w)).xyzw;
/*53*/	r2.xz = (mix(r2.xxzx, r2.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*54*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*55*/	r1.xyzw = r1.xyzw * vec4(0.111111, 0.111111, 0.111111, 0.111111);
/*56*/	r0.y = vsOut_T0.y * 0.200000 + vsOut_T0.z;
/*57*/	r0.yz = (r0.yyyy * vec4(0.000000, 500.000000, 1000.000000, 0.000000)).yz;
/*58*/	r0.z = uintBitsToFloat((r0.z >= -r0.z) ? 0xffffffffu : 0x00000000u);
/*59*/	r0.zw = (mix(vec4(0, 0, -2.000000, -0.500000), vec4(0, 0, 2.000000, 0.500000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*60*/	r0.y = r0.w * r0.y;
/*61*/	r0.y = fract(r0.y);
/*62*/	r0.y = r0.y * r0.z;
/*63*/	r0.y = uintBitsToFloat((1.000000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*64*/	r0.zw = (uintBitsToFloat(uvec4(equal(vsOut_T3.xxxy, vec4(0.000000, 0.000000, 1.000000, 1.000000))) * 0xffffffffu)).zw;
/*65*/	r0.y = uintBitsToFloat((floatBitsToInt(r0.w) == floatBitsToInt(r0.y)) ? 0xffffffffu : 0x00000000u) /**/;
/*66*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0 : r1.w;
/*67*/	r0.y = (floatBitsToUint(r0.z) > 0x00000000u) ? r0.y : r1.w;
/*68*/	r1.xyz = saturate(r1.xyzx).xyz;
/*69*/	r1.xyz = (log2(r1.xyzx)).xyz;
/*70*/	r1.xyz = (r1.xyzx * cb0.data[0].zzzz).xyz;
/*71*/	color0.xyz = (exp2(r1.xyzx)).xyz;
/*72*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*73*/	r0.z = (floatBitsToUint(r0.x) > 0x00000000u) ? r1.z : r1.x;
/*74*/	r0.z = r0.z * vsOut_C0.w;
/*75*/	r0.y = r0.z * r0.y;
/*76*/	r0.zw = (-cb1.data[1].zzzw * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, 1.000000, 1.000000)).zw;
/*77*/	r1.yz = (vsOut_T8.xxyx * r0.zzwz + cb1.data[1].zzwz).yz;
/*78*/	r1.xw = (-r1.zzzz + vec4(1.000000, 0.000000, 0.000000, 1.000000)).xw;
/*79*/	r1.xyzw = (textureLod(s_campaign_shroud_map, r1.ywyy.st, r1.x)).xyzw;
/*80*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? r1.x : r1.z;
/*81*/	r0.x = r0.x + -0.500000;
/*82*/	r0.xz = (r0.xxxx * vec4(1.500000, 0.000000, 1.500000, 0.000000) + vec4(0.500000, 0.000000, 0.200000, 0.000000)).xz;
/*83*/	r0.w = r0.z * 5.263158;
/*84*/	r1.xy = (uintBitsToFloat(uvec4(lessThan(r0.xzxx, vec4(0.300000, 0.038000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*85*/	r0.x = uintBitsToFloat((0.490000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*86*/	r0.z = (floatBitsToUint(r1.y) > 0x00000000u) ? 0.200000 : r0.w;
/*87*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.z;
/*88*/	r0.x = (floatBitsToUint(r1.x) > 0x00000000u) ? 0 : r0.x;
/*89*/	r0.z = r0.y * r0.x + -0.003922;
/*90*/	r0.x = r0.x * r0.y;
/*91*/	color0.w = r0.x;
/*92*/	r0.x = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*93*/	if(r0.x != 0) discard;
/*94*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*95*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*96*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*97*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*98*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*99*/	if(r0.x != 0) discard;
/*100*/	return;
}
