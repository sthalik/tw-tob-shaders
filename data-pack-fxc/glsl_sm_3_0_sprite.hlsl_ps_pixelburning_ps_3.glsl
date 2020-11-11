//
//
// Shader Model 4
// Fragment Shader
//
// id: 121 - fxc/glsl_SM_3_0_sprite.hlsl_PS_PixelBurning_ps_3.glsl
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

  vec4 x0[19];

/*0*/	x0[0].xy = (vec4(0.250000, 0.500000, 0, 0)).xy;
/*1*/	x0[1].xy = (vec4(0.300000, 0.400000, 0, 0)).xy;
/*2*/	x0[2].xy = (vec4(0.250000, 0.500000, 0, 0)).xy;
/*3*/	x0[3].xy = (vec4(0.600000, 0.100000, 0, 0)).xy;
/*4*/	x0[4].xy = (vec4(0.550000, 0.200000, 0, 0)).xy;
/*5*/	x0[5].xy = (vec4(0.500000, 0.200000, 0, 0)).xy;
/*6*/	x0[6].xy = (vec4(0.450000, 0.300000, 0, 0)).xy;
/*7*/	x0[7].xy = (vec4(0.400000, 0.300000, 0, 0)).xy;
/*8*/	x0[8].xy = (vec4(0.350000, 0.400000, 0, 0)).xy;
/*9*/	x0[9].xy = (vec4(0.300000, 0.400000, 0, 0)).xy;
/*10*/	x0[10].xy = (vec4(0.250000, 0.500000, 0, 0)).xy;
/*11*/	x0[11].xy = (vec4(0.200000, 0.500000, 0, 0)).xy;
/*12*/	x0[12].xy = (vec4(0.250000, 0.400000, 0, 0)).xy;
/*13*/	x0[13].xy = (vec4(0.300000, 0.400000, 0, 0)).xy;
/*14*/	x0[14].xy = (vec4(0.350000, 0.300000, 0, 0)).xy;
/*15*/	x0[15].xy = (vec4(0.400000, 0.300000, 0, 0)).xy;
/*16*/	x0[16].xy = (vec4(0.450000, 0.200000, 0, 0)).xy;
/*17*/	x0[17].xy = (vec4(0.500000, 0.200000, 0, 0)).xy;
/*18*/	x0[18].xy = (vec4(0.550000, 0.100000, 0, 0)).xy;
/*19*/	r0.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*20*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*21*/	r0.y = r0.x * cb1.data[0].y;
/*22*/	r0.y = fract(r0.y);
/*23*/	r0.x = r0.y * r0.x;
/*24*/	r0.y = r0.x * 0.500000;
/*25*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*26*/	r0.yz = (mix(vec4(0, -0.500000, -2.000000, 0), vec4(0, 0.500000, 2.000000, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).yz;
/*27*/	r0.z = r0.z * r0.x;
/*28*/	r0.z = fract(r0.z);
/*29*/	r0.y = r0.z * r0.y;
/*30*/	r0.xz = (r0.xxyx + r0.xxyx).xz;
/*31*/	r0.x = trunc(r0.x);
/*32*/	r0.x = r0.x + 1.000000;
/*33*/	r0.x = intBitsToFloat(int(r0.x));
/*34*/	r1.xy = (x0[floatBitsToInt(r0.x)].xyxx).xy;
/*35*/	r0.x = intBitsToFloat(floatBitsToInt(r0.x) + int(-1));
/*36*/	r0.xw = (x0[floatBitsToInt(r0.x)].xxxy).xw;
/*37*/	r1.xy = (-r0.xwxx + r1.xyxx).xy;
/*38*/	r0.xz = (r0.zzzz * r1.xxyx + r0.xxwx).xz;
/*39*/	r0.w = vsOut_T0.w * 6.283185;
/*40*/	r0.w = sin(r0.w);
/*41*/	r0.w = r0.z * r0.w;
/*42*/	r0.yw = (r0.yyyw * vec4(0.000000, 12.566371, 0.000000, 0.100000)).yw;
/*43*/	r0.y = sin(r0.y);
/*44*/	r0.y = r0.w * r0.y + vsOut_T0.z;
/*45*/	r0.w = r0.z * r0.y;
/*46*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*47*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.z : -r0.z;
/*48*/	r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).x;
/*49*/	r0.y = r0.y * r1.x;
/*50*/	r0.y = fract(r0.y);
/*51*/	r0.y = r0.y * r0.w;
/*52*/	r0.y = r0.y / r0.z;
/*53*/	r0.z = r0.y * 3.141593;
/*54*/	r0.y = r0.y * 6.283185 + 3.141593;
/*55*/	r0.y = cos((r0.y));
/*56*/	r0.y = r0.x * r0.y + vsOut_T3.x;
/*57*/	r0.w = vsOut_T0.w + cb1.data[0].y;
/*58*/	r0.w = fract(r0.w);
/*59*/	r0.w = r0.w * 6.283185;
/*60*/	r0.zw = sin(vec2(r0.zzzw));
/*61*/	r0.z = r0.z * r0.w;
/*62*/	r0.y = r0.z * 0.250000 + r0.y;
/*63*/	r0.y = -r0.y + vsOut_T0.w;
/*64*/	r0.z = uintBitsToFloat((0.000000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r0.z) != 0u) {
/*66*/	  r0.zw = (vsOut_T0.zzzw * vec4(0.000000, 0.000000, 3.141593, 3.141593)).zw;
/*67*/	  r0.zw = sin(vec2(r0.zzzw));
/*68*/	  r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, -0.000000, -0.010000) + vsOut_T0.zzzw).zw;
/*69*/	  r0.zw = (r0.zzzw * vsOut_T2.zzzw + vsOut_T2.xxxy).zw;
/*70*/	  r1.xyzw = (textureLod(s_diffuse_map, r0.zwzz.st, r0.w)).xyzw;
/*71*/	  r0.z = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*72*/	  r2.zw = (mix(r1.xxxz, r1.zzzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*73*/	  r0.x = r0.y / r0.x;
/*74*/	  r0.y = -r2.z + 1.000000;
/*75*/	  r0.z = -r1.y + 1.000000;
/*76*/	  r0.y = r0.x * r0.y;
/*77*/	  r2.x = r0.y * 0.800000 + r2.z;
/*78*/	  r0.x = r0.x * r0.x;
/*79*/	  r0.x = r0.z * r0.x;
/*80*/	  r2.y = r0.x * 0.075000 + r1.y;
/*81*/	  r1.xyz = (r2.xywx).xyz;
/*82*/	} else {
/*83*/	  r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*84*/	  r0.x = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*85*/	  r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*86*/	}
/*87*/	r0.x = r1.w + -0.003922;
/*88*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*89*/	if(r0.x != 0) discard;
/*90*/	r0.x = vsOut_T3.y + 1.000000;
/*91*/	r0.xyz = saturate(r0.xxxx * r1.xyzx).xyz;
/*92*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*93*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*94*/	r1.xyz = (exp2(r0.xyzx)).xyz;
/*95*/	color0.xyzw = r1.xyzw;
/*96*/	return;
}
