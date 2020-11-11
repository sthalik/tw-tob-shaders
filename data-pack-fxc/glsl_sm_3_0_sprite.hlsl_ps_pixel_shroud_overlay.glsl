//
//
// Shader Model 4
// Fragment Shader
//
// id: 181 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_shroud_overlay.glsl
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
in vec4 vsOut_T4;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_shroud_map;

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

/*0*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*1*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
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
/*16*/	r1.xy = (vsOut_T0.zwzz * vsOut_T3.xxxx + vsOut_T3.yyyy).xy;
/*17*/	r1.xyzw = (textureLod(s_shroud_map, r1.xyxx.st, r1.y)).xyzw;
/*18*/	r1.x = (floatBitsToUint(r2.y) > 0x00000000u) ? r1.x : r1.z;
/*19*/	r1.x = -r1.x + 1.000000;
/*20*/	r1.y = r0.w * r1.x + -0.003922;
/*21*/	r0.w = r0.w * r1.x;
/*22*/	color0.w = r0.w;
/*23*/	r0.w = uintBitsToFloat((r1.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*24*/	if(r0.w != 0) discard;
/*25*/	r1.xyz = saturate(r0.xyzx * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*26*/	r1.xyz = (-r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r1.xyzx).xyz;
/*27*/	r0.w = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*28*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*29*/	r1.w = r0.w * cb1.data[0].y;
/*30*/	r1.w = fract(r1.w);
/*31*/	r0.w = r0.w * r1.w;
/*32*/	r0.w = r0.w * 3.141593;
/*33*/	r0.w = sin(r0.w);
/*34*/	r2.xyz = (r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*35*/	r1.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*36*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T5.z) ? 0xffffffffu : 0x00000000u);
/*37*/	r0.xyz = saturate(mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*38*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*39*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*40*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*41*/	return;
}
