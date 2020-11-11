//
//
// Shader Model 4
// Fragment Shader
//
// id: 33 - fxc/glsl_SM_3_0_sprite.hlsl_PS_alpha_over_time_pixel_no_tex_alpha.glsl
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

/*0*/	r0.xy = (-vsOut_T2.xwxx + vsOut_T3.xyxx).xy;
/*1*/	r0.zw = (vsOut_T2.zzzy + -vsOut_T3.xxxy).zw;
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*5*/	if(r0.x != 0) discard;
/*6*/	r0.x = -vsOut_T0.y + 1.000000;
/*7*/	r0.yz = (vsOut_T0.xxyx * vec4(0.000000, 1.000000, -1.000000, 0.000000) + vec4(0.000000, 0.000000, 1.000000, 0.000000)).yz;
/*8*/	r0.xyzw = (textureLod(s_diffuse_map, r0.yzyy.st, r0.x)).xyzw;
/*9*/	r1.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.000000, 0.000000), cb1.data[0].zwzz)) * 0xffffffffu)).xy;
/*10*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xz;
/*11*/	r0.xyz = (mix(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*12*/	r0.w = 1.000000;
/*13*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*14*/	r1.x = r0.w * vsOut_T1.x + -0.003922;
/*15*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*16*/	if(r1.x != 0) discard;
/*17*/	r1.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*18*/	r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*19*/	r1.y = r1.x * cb1.data[0].y;
/*20*/	r1.y = fract(r1.y);
/*21*/	r1.x = r1.y * r1.x;
/*22*/	r1.x = r1.x * 3.141593;
/*23*/	r1.x = sin(r1.x);
/*24*/	r1.yzw = saturate(r0.xxyz * vec4(0.000000, 3.000000, 3.000000, 3.000000)).yzw;
/*25*/	r1.yzw = (-r0.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + r1.yyzw).yzw;
/*26*/	r2.xyz = (r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*27*/	r1.xyz = (r1.xxxx * r1.yzwy + r2.xyzx).xyz;
/*28*/	r1.w = uintBitsToFloat((0.500000 < vsOut_T0.z) ? 0xffffffffu : 0x00000000u);
/*29*/	r0.xyz = saturate(mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*30*/	r0.w = r0.w * vsOut_T1.x;
/*31*/	color0.w = r0.w;
/*32*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*33*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*34*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*35*/	return;
}
