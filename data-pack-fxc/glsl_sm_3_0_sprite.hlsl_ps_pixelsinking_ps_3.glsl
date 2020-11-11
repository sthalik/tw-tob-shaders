//
//
// Shader Model 4
// Fragment Shader
//
// id: 125 - fxc/glsl_SM_3_0_sprite.hlsl_PS_PixelSinking_ps_3.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;

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

  vec4 x0[9];

/*0*/	x0[0].xy = (vec4(0.020000, 0.900000, 0, 0)).xy;
/*1*/	x0[1].xy = (vec4(0.030000, 1.000000, 0, 0)).xy;
/*2*/	x0[2].xy = (vec4(0.035000, 1.300000, 0, 0)).xy;
/*3*/	x0[3].xy = (vec4(0.020000, 1.000000, 0, 0)).xy;
/*4*/	x0[4].xy = (vec4(0.010000, 0.800000, 0, 0)).xy;
/*5*/	x0[5].xy = (vec4(0.020000, 0.700000, 0, 0)).xy;
/*6*/	x0[6].xy = (vec4(0.010000, 0.500000, 0, 0)).xy;
/*7*/	x0[7].xy = (vec4(0.020000, 0.600000, 0, 0)).xy;
/*8*/	x0[8].xy = (vec4(0.030000, 0.900000, 0, 0)).xy;
/*9*/	r0.x = trunc(cb1.data[0].y);
/*10*/	r0.y = cb1.data[0].y + 1.000000;
/*11*/	r0.y = trunc(r0.y);
/*12*/	r0.y = -r0.x + r0.y;
/*13*/	r0.x = -r0.x + cb1.data[0].y;
/*14*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*15*/	r0.x = saturate(r0.y * r0.x);
/*16*/	r0.y = r0.x * -2.000000 + 3.000000;
/*17*/	r0.x = r0.x * r0.x;
/*18*/	r0.x = r0.x * r0.y;
/*19*/	r0.yz = (cb1.data[0].yyyy * vec4(0.000000, 9.000000, 0.500000, 0.000000)).yz;
/*20*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*21*/	r0.yw = (mix(vec4(0, -9.000000, 0, -0.111111), vec4(0, 9.000000, 0, 0.111111), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).yw;
/*22*/	r0.w = r0.w * cb1.data[0].y;
/*23*/	r0.zw = (fract(r0.zzzw)).zw;
/*24*/	r0.y = r0.w * r0.y;
/*25*/	r0.y = trunc(r0.y);
/*26*/	r0.y = intBitsToFloat(int(r0.y));
/*27*/	r0.w = intBitsToFloat(floatBitsToInt(r0.y) + int(-1));
/*28*/	r1.x = uintBitsToFloat((floatBitsToInt(r0.w) < int(0)) ? 0xffffffffu : 0x00000000u) /**/;
/*29*/	r0.w = (floatBitsToUint(r1.x) > 0x00000000u) ? intBitsToFloat(8) : r0.w;
/*30*/	r1.xy = (x0[floatBitsToInt(r0.y)].xyxx).xy;
/*31*/	r0.yw = (x0[floatBitsToInt(r0.w)].xxxy).yw;
/*32*/	r1.xy = (-r0.ywyy + r1.xyxx).xy;
/*33*/	r0.xy = (r0.xxxx * r1.xyxx + r0.ywyy).xy;
/*34*/	r0.z = r0.z * 6.283185;
/*35*/	r0.w = r0.y * vsOut_T0.z;
/*36*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*37*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.y : -r0.y;
/*38*/	r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).x;
/*39*/	r1.x = r1.x * vsOut_T0.z;
/*40*/	r1.x = fract(r1.x);
/*41*/	r0.w = r0.w * r1.x;
/*42*/	r0.y = r0.w / r0.y;
/*43*/	r0.y = r0.y * 6.283185 + r0.z;
/*44*/	r0.y = cos((r0.y));
/*45*/	r0.x = r0.x * r0.y + vsOut_T3.x;
/*46*/	r0.y = -r0.x + vsOut_T0.w;
/*47*/	r0.w = uintBitsToFloat((0.000000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r0.w) != 0u) {
/*49*/	  r1.xy = (vsOut_T0.zwzz * vec4(3.141593, 3.141593, 0.000000, 0.000000)).xy;
/*50*/	  r1.xy = sin(vec2(r1.xyxx));
/*51*/	  r2.x = sin(r0.z);   r3.x = cos(r0.z);
/*52*/	  r0.z = r1.x * r2.x;
/*53*/	  r0.z = r0.z * 0.004000 + vsOut_T0.z;
/*54*/	  r0.w = r1.y * r3.x;
/*55*/	  r0.w = r0.w * 0.004000 + vsOut_T0.w;
/*56*/	  r1.x = r0.z * vsOut_T2.z + vsOut_T2.x;
/*57*/	  r1.y = r0.w * vsOut_T2.w + vsOut_T2.y;
/*58*/	  r1.xyzw = (textureLod(s_diffuse_map, r1.xyxx.st, r1.y)).xyzw;
/*59*/	  r0.z = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*60*/	  r0.zw = (mix(r1.xxxz, r1.zzzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*61*/	  r0.x = -r0.x + 1.000000;
/*62*/	  r0.x = r0.y / r0.x;
/*63*/	  r0.x = -r0.x + 1.000000;
/*64*/	  r0.y = r0.z * 0.750000;
/*65*/	  r2.x = r1.y * 0.500000;
/*66*/	  r2.y = -r0.w + 1.000000;
/*67*/	  r1.x = -r0.y * r0.x + r0.z;
/*68*/	  r1.y = -r2.x * r0.x + r1.y;
/*69*/	  r1.z = r2.y * r0.x + r0.w;
/*70*/	} else {
/*71*/	  r0.xy = (vsOut_T0.zwzz * vsOut_T2.zwzz + vsOut_T2.xyxx).xy;
/*72*/	  r1.xyzw = (textureLod(s_diffuse_map, r0.xyxx.st, r0.y)).xyzw;
/*73*/	  r0.x = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*74*/	  r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*75*/	}
/*76*/	r0.x = r1.w + -0.003922;
/*77*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*78*/	if(r0.x != 0) discard;
/*79*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*80*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*81*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*82*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*83*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*84*/	if(r0.x != 0) discard;
/*85*/	r0.x = vsOut_T3.y + 1.000000;
/*86*/	r0.xyz = saturate(r0.xxxx * r1.xyzx).xyz;
/*87*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*88*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*89*/	r1.xyz = (exp2(r0.xyzx)).xyz;
/*90*/	color0.xyzw = r1.xyzw;
/*91*/	return;
}
