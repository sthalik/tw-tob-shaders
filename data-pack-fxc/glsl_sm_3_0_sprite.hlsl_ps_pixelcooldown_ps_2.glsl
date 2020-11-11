//
//
// Shader Model 4
// Fragment Shader
//
// id: 129 - fxc/glsl_SM_3_0_sprite.hlsl_PS_PixelCooldown_ps_2.glsl
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

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = r0.w * vsOut_C0.w + -0.003922;
/*2*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r1.x != 0) discard;
/*4*/	r1.xy = (vsOut_T0.wzww * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r1.z = max(abs(r1.y), abs(r1.x));
/*6*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*7*/	r1.w = min(abs(r1.y), abs(r1.x));
/*8*/	r1.z = r1.z * r1.w;
/*9*/	r1.w = r1.z * r1.z;
/*10*/	r2.x = r1.w * 0.020835 + -0.085133;
/*11*/	r2.x = r1.w * r2.x + 0.180141;
/*12*/	r2.x = r1.w * r2.x + -0.330299;
/*13*/	r1.w = r1.w * r2.x + 0.999866;
/*14*/	r2.x = r1.w * r1.z;
/*15*/	r2.x = r2.x * -2.000000 + 1.570796;
/*16*/	r2.y = uintBitsToFloat((abs(r1.y) < abs(r1.x)) ? 0xffffffffu : 0x00000000u);
/*17*/	r2.x = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r2.x));
/*18*/	r1.z = r1.z * r1.w + r2.x;
/*19*/	r1.w = uintBitsToFloat((r1.y < -r1.y) ? 0xffffffffu : 0x00000000u);
/*20*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0xc0490fdbu));
/*21*/	r1.z = r1.w + r1.z;
/*22*/	r1.w = min(r1.y, r1.x);
/*23*/	r1.x = max(r1.y, r1.x);
/*24*/	r1.x = uintBitsToFloat((r1.x >= -r1.x) ? 0xffffffffu : 0x00000000u);
/*25*/	r1.y = uintBitsToFloat((r1.w < -r1.w) ? 0xffffffffu : 0x00000000u);
/*26*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.y));
/*27*/	r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? -r1.z : r1.z;
/*28*/	r1.x = r1.x + -vsOut_T3.x;
/*29*/	r1.x = uintBitsToFloat((0.000000 >= r1.x) ? 0xffffffffu : 0x00000000u);
/*30*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*31*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xz;
/*32*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*33*/	r1.yzw = (r0.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000)).yzw;
/*34*/	r0.xyz = saturate(mix(r0.xyzx, r1.yzwy, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*35*/	color0.w = r0.w;
/*36*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*37*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*38*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*39*/	return;
}
