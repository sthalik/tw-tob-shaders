//
//
// Shader Model 4
// Fragment Shader
//
// id: 115 - fxc/glsl_SM_3_0_sprite.hlsl_PS_angular_exclusion_pixel.glsl
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
  vec4 r4;

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*2*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xz;
/*3*/	r1.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*4*/	r0.y = r0.w * vsOut_C0.w + -0.003922;
/*5*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*6*/	if(r0.y != 0) discard;
/*7*/	r0.yz = (vsOut_T0.wwzw * vec4(0.000000, 2.000000, 2.000000, 0.000000) + vec4(0.000000, -1.000000, -1.000000, 0.000000)).yz;
/*8*/	r2.xy = (uintBitsToFloat(uvec4(notEqual(r0.zyzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*9*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r2.x));
/*10*/	if(floatBitsToUint(r0.w) != 0u) {
/*11*/	  r2.xy = (r0.zyzz * r0.zyzz).xy;
/*12*/	  r0.w = r2.y + r2.x;
/*13*/	  r0.w = sqrt(r0.w);
/*14*/	  r2.x = uintBitsToFloat((r0.w < 0.750000) ? 0xffffffffu : 0x00000000u);
/*15*/	  r2.y = min(abs(r0.z), abs(r0.y));
/*16*/	  r2.z = max(abs(r0.z), abs(r0.y));
/*17*/	  r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).z;
/*18*/	  r2.y = r2.z * r2.y;
/*19*/	  r2.z = r2.y * r2.y;
/*20*/	  r2.w = r2.z * 0.020835 + -0.085133;
/*21*/	  r2.w = r2.z * r2.w + 0.180141;
/*22*/	  r2.w = r2.z * r2.w + -0.330299;
/*23*/	  r2.z = r2.z * r2.w + 0.999866;
/*24*/	  r2.w = r2.z * r2.y;
/*25*/	  r3.x = uintBitsToFloat((abs(r0.z) < abs(r0.y)) ? 0xffffffffu : 0x00000000u);
/*26*/	  r2.w = r2.w * -2.000000 + 1.570796;
/*27*/	  r2.w = uintBitsToFloat(floatBitsToUint(r3.x) & floatBitsToUint(r2.w));
/*28*/	  r2.y = r2.y * r2.z + r2.w;
/*29*/	  r2.z = uintBitsToFloat((r0.z < -r0.z) ? 0xffffffffu : 0x00000000u);
/*30*/	  r2.z = uintBitsToFloat(floatBitsToUint(r2.z) & uint(0xc0490fdbu));
/*31*/	  r2.y = r2.z + r2.y;
/*32*/	  r2.z = min(r0.z, r0.y);
/*33*/	  r0.y = max(r0.z, r0.y);
/*34*/	  r0.z = uintBitsToFloat((r2.z < -r2.z) ? 0xffffffffu : 0x00000000u);
/*35*/	  r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*36*/	  r0.y = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.z));
/*37*/	    r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? -r2.y : r2.y;
/*38*/	  r0.y = r0.y + -vsOut_T3.x;
/*39*/	  r0.z = uintBitsToFloat((0.000000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*40*/	  r0.x = -r0.x * vsOut_C0.x + 1.000000;
/*41*/	  r0.x = r0.x * vsOut_T3.y;
/*42*/	  r3.x = r0.x * r0.w + r1.x;
/*43*/	  r0.x = uintBitsToFloat((r0.y < 0.196350) ? 0xffffffffu : 0x00000000u);
/*44*/	  r3.yz = (r1.yyzy).yz;
/*45*/	  r2.yzw = (r3.xxyz * vec4(0.000000, 1.250000, 1.250000, 1.250000)).yzw;
/*46*/	  r0.y = r0.y * 5.092958;
/*47*/	  r4.xyz = (r0.yyyy * r3.xyzx).xyz;
/*48*/	  r4.xyz = (r4.xyzx * vec4(0.750000, 0.750000, 0.750000, 0.000000)).xyz;
/*49*/	  r3.xyz = (r3.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + r4.xyzx).xyz;
/*50*/	  r0.xyw = (mix(r2.yzyw, r3.xyxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyw;
/*51*/	  r2.yzw = (r1.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000)).yzw;
/*52*/	  r0.xyz = (mix(r2.yzwy, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*53*/	  r1.xyz = (mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*54*/	}
/*55*/	r1.xyz = saturate(r1.xyzx).xyz;
/*56*/	r0.xyz = (log2(r1.xyzx)).xyz;
/*57*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*58*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*59*/	color0.w = r1.w;
/*60*/	return;
}
