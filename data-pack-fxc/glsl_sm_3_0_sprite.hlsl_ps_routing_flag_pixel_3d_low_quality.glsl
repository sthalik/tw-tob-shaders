//
//
// Shader Model 4
// Fragment Shader
//
// id: 147 - fxc/glsl_SM_3_0_sprite.hlsl_PS_routing_flag_pixel_3d_low_quality.glsl
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
in vec4 vsOut_T1;

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
/*4*/	r1.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*5*/	r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*6*/	r1.y = r1.x * cb1.data[0].y;
/*7*/	r1.y = fract(r1.y);
/*8*/	r1.x = r1.y * r1.x;
/*9*/	r1.x = r1.x * 3.141593;
/*10*/	r1.x = sin(r1.x);
/*11*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*12*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xz;
/*13*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*14*/	r1.yzw = saturate(r0.xxyz * vsOut_T1.yyyy).yzw;
/*15*/	r0.xyz = saturate(r0.xyzx * vsOut_T1.xxxx).xyz;
/*16*/	color0.w = r0.w;
/*17*/	r1.yzw = (-r0.xxyz + r1.yyzw).yzw;
/*18*/	r0.xyz = (vsOut_T1.zzzz * r1.yzwy + r0.xyzx).xyz;
/*19*/	r1.yzw = saturate(r0.xxyz * vec4(0.000000, 3.000000, 3.000000, 3.000000)).yzw;
/*20*/	r1.yzw = (-r0.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + r1.yyzw).yzw;
/*21*/	r2.xyz = (r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*22*/	r1.xyz = (r1.xxxx * r1.yzwy + r2.xyzx).xyz;
/*23*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T0.z) ? 0xffffffffu : 0x00000000u);
/*24*/	r0.xyz = saturate(mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*26*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*27*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*28*/	return;
}
