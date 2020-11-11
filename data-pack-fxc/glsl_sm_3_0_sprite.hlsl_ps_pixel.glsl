//
//
// Shader Model 4
// Fragment Shader
//
// id: 8 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel.glsl
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

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = saturate(r0.x);
/*2*/	r1.x = log2(r1.x);
/*3*/	r1.x = r1.x * cb0.data[0].z;
/*4*/	r1.w = exp2(r1.x);
/*5*/	r1.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*6*/	r2.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.000000, 0.000000), cb1.data[0].zwzz)) * 0xffffffffu)).xy;
/*7*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xz;
/*8*/	r0.xyzw = mix(r0.xyzw, r1.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*9*/	r1.x = r0.w * vsOut_C0.w + -0.003922;
/*10*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*11*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*12*/	if(r1.x != 0) discard;
/*13*/	r1.xy = (-vsOut_T2.xwxx + vsOut_T3.xyxx).xy;
/*14*/	r1.zw = (vsOut_T2.zzzy + -vsOut_T3.xxxy).zw;
/*15*/	r1.xyzw = uintBitsToFloat(uvec4(lessThan(r1.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*16*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r1.zwzz) | floatBitsToUint(r1.xyxx))).xy;
/*17*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r1.x));
/*18*/	if(r1.x != 0) discard;
/*19*/	r1.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*20*/	r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*21*/	r1.y = r1.x * cb1.data[0].y;
/*22*/	r1.y = fract(r1.y);
/*23*/	r1.x = r1.y * r1.x;
/*24*/	r1.x = r1.x * 3.141593;
/*25*/	r1.x = sin(r1.x);
/*26*/	r1.yzw = saturate(r0.xxyz * vec4(0.000000, 3.000000, 3.000000, 3.000000)).yzw;
/*27*/	r1.yzw = (-r0.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + r1.yyzw).yzw;
/*28*/	r2.xyz = (r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*29*/	r1.xyz = (r1.xxxx * r1.yzwy + r2.xyzx).xyz;
/*30*/	r1.w = uintBitsToFloat((0.500000 < vsOut_T0.z) ? 0xffffffffu : 0x00000000u);
/*31*/	r0.xyz = saturate(mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*32*/	color0.w = r0.w;
/*33*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*34*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*35*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*36*/	return;
}
