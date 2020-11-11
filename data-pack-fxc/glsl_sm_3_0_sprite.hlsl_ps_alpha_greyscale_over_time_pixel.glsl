//
//
// Shader Model 4
// Fragment Shader
//
// id: 36 - fxc/glsl_SM_3_0_sprite.hlsl_PS_alpha_greyscale_over_time_pixel.glsl
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
/*6*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*7*/	r1.x = saturate(r0.x);
/*8*/	r1.x = log2(r1.x);
/*9*/	r1.x = r1.x * cb0.data[0].z;
/*10*/	r1.w = exp2(r1.x);
/*11*/	r1.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*12*/	r2.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.000000, 0.000000), cb1.data[0].zwzz)) * 0xffffffffu)).xy;
/*13*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xz;
/*14*/	r0.xyzw = mix(r0.xyzw, r1.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*15*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*16*/	r1.x = r0.w * vsOut_T1.x + -0.003922;
/*17*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*18*/	if(r1.x != 0) discard;
/*19*/	r1.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*20*/	r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*21*/	r1.y = r1.x * cb1.data[0].y;
/*22*/	r1.y = fract(r1.y);
/*23*/	r1.x = r1.y * r1.x;
/*24*/	r1.x = r1.x * 3.141593;
/*25*/	r1.x = sin(r1.x);
/*26*/	r0.x = dot(vec3(r0.xyzx), vec3(vec4(0.300000, 0.590000, 0.110000, 0.000000)));
/*27*/	r0.y = r0.w * vsOut_T1.x;
/*28*/	color0.w = r0.y;
/*29*/	r0.yz = (r0.xxxx * vec4(0.000000, 3.000000, 0.250000, 0.000000)).yz;
/*30*/	r0.y = saturate(r0.y);
/*31*/	r0.y = -r0.x * 0.250000 + r0.y;
/*32*/	r0.y = r1.x * r0.y + r0.z;
/*33*/	r0.z = uintBitsToFloat((0.500000 < vsOut_T0.z) ? 0xffffffffu : 0x00000000u);
/*34*/	r0.x = (floatBitsToUint(r0.z) > 0x00000000u) ? saturate(r0.y) : saturate(r0.x);
/*35*/	r0.x = log2(r0.x);
/*36*/	r0.x = r0.x * cb0.data[0].z;
/*37*/	color0.xyz = (exp2(r0.xxxx)).xyz;
/*38*/	return;
}
