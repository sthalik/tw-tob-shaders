//
//
// Shader Model 4
// Fragment Shader
//
// id: 14 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_border_alpha_blend.glsl
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
  vec4 r3;

/*0*/	r0.xyz = (-vsOut_T2.xwyx + vsOut_T3.xyyx).xyz;
/*1*/	r1.xy = (r0.xyxx).xy;
/*2*/	r0.xyw = (vsOut_T2.zyzw + -vsOut_T3.xyxy).xyw;
/*3*/	r1.zw = (r0.xxxy).zw;
/*4*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(r1.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*5*/	r1.yz = (uintBitsToFloat(floatBitsToUint(r2.zzwz) | floatBitsToUint(r2.xxyx))).yz;
/*6*/	r0.y = uintBitsToFloat(floatBitsToUint(r1.z) | floatBitsToUint(r1.y));
/*7*/	if(r0.y != 0) discard;
/*8*/	r1.yz = (cb1.data[1].xxyx * vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*9*/	r1.yz = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r1.yyzy).yz;
/*10*/	r1.zw = (r1.zzzz * -vsOut_T1.yyyw).zw;
/*11*/	r2.xy = (r1.yyyy * vsOut_T1.xzxx).xy;
/*12*/	r0.y = r0.z / r1.z;
/*13*/	r0.z = r0.w / r1.w;
/*14*/	r0.x = r0.x / r2.y;
/*15*/	r0.w = r1.x / r2.x;
/*16*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*17*/	r2.x = saturate(r1.x);
/*18*/	r2.x = log2(r2.x);
/*19*/	r2.x = r2.x * cb0.data[0].z;
/*20*/	r2.w = exp2(r2.x);
/*21*/	r2.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*22*/	r3.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.000000, 0.000000), cb1.data[0].zwzz)) * 0xffffffffu)).xy;
/*23*/	r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xz;
/*24*/	r1.xyzw = mix(r1.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)));
/*25*/	r1.xyzw = r1.xyzw * vsOut_C0.xyzw;
/*26*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), vsOut_T1.xyzw)) * 0xffffffffu);
/*27*/	r0.w = (floatBitsToUint(r2.x) > 0x00000000u) ? r0.w : r1.w;
/*28*/	r0.y = min(r0.y, r0.w);
/*29*/	r0.y = (floatBitsToUint(r2.y) > 0x00000000u) ? r0.y : r0.w;
/*30*/	r0.x = min(r0.x, r0.y);
/*31*/	r0.x = (floatBitsToUint(r2.z) > 0x00000000u) ? r0.x : r0.y;
/*32*/	r0.y = min(r0.z, r0.x);
/*33*/	color0.w = (floatBitsToUint(r2.w) > 0x00000000u) ? r0.y : r0.x;
/*34*/	r0.xyz = saturate(r1.xyzx * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*35*/	r0.xyz = (-r1.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r0.xyzx).xyz;
/*36*/	r0.w = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*37*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*38*/	r1.w = r0.w * cb1.data[0].y;
/*39*/	r1.w = fract(r1.w);
/*40*/	r0.w = r0.w * r1.w;
/*41*/	r0.w = r0.w * 3.141593;
/*42*/	r0.w = sin(r0.w);
/*43*/	r2.xyz = (r1.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*44*/	r0.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*45*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T0.z) ? 0xffffffffu : 0x00000000u);
/*46*/	r0.xyz = saturate(mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*47*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*48*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*49*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*50*/	return;
}
