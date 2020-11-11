//
//
// Shader Model 4
// Fragment Shader
//
// id: 16 - fxc/glsl_SM_3_0_sprite.hlsl_PS_grey_over_time_pixel.glsl
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
/*10*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r1.x != 0) discard;
/*12*/	r1.xy = (-vsOut_T2.xwxx + vsOut_T3.xyxx).xy;
/*13*/	r1.zw = (vsOut_T2.zzzy + -vsOut_T3.xxxy).zw;
/*14*/	r1.xyzw = uintBitsToFloat(uvec4(lessThan(r1.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*15*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r1.zwzz) | floatBitsToUint(r1.xyxx))).xy;
/*16*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r1.x));
/*17*/	if(r1.x != 0) discard;
/*18*/	r1.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*19*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.300000, 0.590000, 0.110000, 0.000000)));
/*20*/	r0.xyz = (-r0.xyzx * vsOut_C0.xyzx + r0.wwww).xyz;
/*21*/	r0.xyz = (vsOut_T1.xxxx * r0.xyzx + r1.xyzx).xyz;
/*22*/	color0.w = r1.w;
/*23*/	r1.xyz = saturate(r0.xyzx * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*24*/	r1.xyz = (-r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r1.xyzx).xyz;
/*25*/	r0.w = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*26*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*27*/	r1.w = r0.w * cb1.data[0].y;
/*28*/	r1.w = fract(r1.w);
/*29*/	r0.w = r0.w * r1.w;
/*30*/	r0.w = r0.w * 3.141593;
/*31*/	r0.w = sin(r0.w);
/*32*/	r2.xyz = (r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*33*/	r1.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*34*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T0.z) ? 0xffffffffu : 0x00000000u);
/*35*/	r0.xyz = saturate(mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*36*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*37*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*38*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*39*/	return;
}
