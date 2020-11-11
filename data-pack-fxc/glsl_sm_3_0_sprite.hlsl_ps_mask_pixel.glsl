//
//
// Shader Model 4
// Fragment Shader
//
// id: 53 - fxc/glsl_SM_3_0_sprite.hlsl_PS_mask_pixel.glsl
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
in vec4 vsOut_T4;
in vec4 vsOut_T5;

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

/*0*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*1*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*5*/	if(r0.x != 0) discard;
/*6*/	r0.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*7*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*8*/	r0.y = r0.x * cb1.data[0].y;
/*9*/	r0.y = fract(r0.y);
/*10*/	r0.x = r0.y * r0.x;
/*11*/	r0.x = r0.x * 3.141593;
/*12*/	r0.x = sin(r0.x);
/*13*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*14*/	r0.y = saturate(r1.x);
/*15*/	r0.y = log2(r0.y);
/*16*/	r0.y = r0.y * cb0.data[0].z;
/*17*/	r2.w = exp2(r0.y);
/*18*/	r2.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*19*/	r0.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.500000, 0.500000, 0.000000), cb1.data[0].zzwz)) * 0xffffffffu)).yz;
/*20*/	r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xz;
/*21*/	r1.xyzw = mix(r1.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*22*/	r1.xyzw = r1.xyzw * vsOut_C0.xyzw;
/*23*/	r0.yz = (uintBitsToFloat(uvec4(equal(vsOut_T0.xxyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).yz;
/*24*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.y));
/*25*/	r1.xyzw = mix(r1.xyzw, vsOut_C0.xyzw, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*26*/	r0.yzw = saturate(r1.xxyz * vec4(0.000000, 3.000000, 3.000000, 3.000000)).yzw;
/*27*/	r0.yzw = (-r1.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + r0.yyzw).yzw;
/*28*/	r2.xyz = (r1.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*29*/	r0.xyz = (r0.xxxx * r0.yzwy + r2.xyzx).xyz;
/*30*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T5.z) ? 0xffffffffu : 0x00000000u);
/*31*/	r0.xyz = saturate(mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*32*/	color0.w = r1.w;
/*33*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*34*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*35*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*36*/	return;
}
