//
//
// Shader Model 4
// Fragment Shader
//
// id: 19 - fxc/glsl_SM_3_0_sprite.hlsl_PS_red_pulse_pixel.glsl
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
/*18*/	r1.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*19*/	r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*20*/	r1.y = r1.x * cb1.data[0].y;
/*21*/	r1.y = fract(r1.y);
/*22*/	r1.x = r1.y * r1.x;
/*23*/	r1.x = r1.x * 3.141593;
/*24*/	r1.x = sin(r1.x);
/*25*/	r1.y = -vsOut_T1.x + vsOut_T1.y;
/*26*/	r1.y = vsOut_T1.z * r1.y + vsOut_T1.x;
/*27*/	r2.x = r0.x * vsOut_C0.x + r1.y;
/*28*/	r2.yz = (r0.yyzy * vsOut_C0.yyzy + -r1.yyyy).yz;
/*29*/	r0.x = r0.w * vsOut_C0.w;
/*30*/	color0.w = r0.x;
/*31*/	r0.xyz = saturate(r2.xyzx * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*32*/	r0.xyz = (-r2.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r0.xyzx).xyz;
/*33*/	r1.yzw = (r2.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000)).yzw;
/*34*/	r0.xyz = (r1.xxxx * r0.xyzx + r1.yzwy).xyz;
/*35*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T0.z) ? 0xffffffffu : 0x00000000u);
/*36*/	r0.xyz = saturate(mix(r2.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*37*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*38*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*39*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*40*/	return;
}
