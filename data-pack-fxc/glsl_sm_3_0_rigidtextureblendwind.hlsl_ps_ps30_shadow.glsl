//
//
// Shader Model 4
// Fragment Shader
//
// id: 1323 - fxc/glsl_SM_3_0_rigidtextureblendwind.hlsl_PS_ps30_shadow.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C3;
in vec4 vsOut_C0;
in vec4 vsOut_C1;
in vec4 vsOut_C2;

layout(location = 0) out vec4 color0;

uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;
uniform sampler2D sampler4;
uniform sampler2D sampler5;
uniform sampler2D sampler6;
uniform sampler2D sampler7;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform texture_scale
{
  vec4 data[9];
} cb1;
layout(std140) uniform texture_blend_PS
{
  vec4 data[25];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*1*/	r1.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C0.xyzw)) * 0xffffffffu);
/*2*/	r0.xz = (uintBitsToFloat(floatBitsToUint(r0.xxzx) | floatBitsToUint(r1.xxzx))).xz;
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.ywyy) | floatBitsToUint(r0.xzxx))).xy;
/*4*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r1.ywyy) | floatBitsToUint(r0.xyxx))).xy;
/*5*/	r0.zw = (cb1.data[0].zzzw * vsOut_C0.xxxy + cb1.data[0].xxxy).zw;
/*6*/	r1.xyzw = (texture(sampler0, r0.zwzz.st)).xyzw;
/*7*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 0 : r1.w;
/*8*/	r0.z = -cb2.data[11].w + 1.000000;
/*9*/	r0.x = max(r0.x, r0.z);
/*10*/	r0.zw = (cb1.data[1].zzzw * vsOut_C0.zzzw + cb1.data[1].xxxy).zw;
/*11*/	r1.xyzw = (texture(sampler1, r0.zwzz.st)).xyzw;
/*12*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0 : r1.w;
/*13*/	r1.xyzw = -cb2.data[12].xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*14*/	r0.y = max(r0.y, r1.x);
/*15*/	r0.x = r0.y * r0.x;
/*16*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C1.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*17*/	r3.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C1.xyzw)) * 0xffffffffu);
/*18*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r2.xxzx) | floatBitsToUint(r3.xxzx))).yz;
/*19*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r2.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*20*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r3.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*21*/	r2.xy = (cb1.data[2].zwzz * vsOut_C1.xyxx + cb1.data[2].xyxx).xy;
/*22*/	r2.xyzw = (texture(sampler2, r2.xyxx.st)).xyzw;
/*23*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0 : r2.w;
/*24*/	r0.y = max(r0.y, r1.y);
/*25*/	r0.x = r0.y * r0.x;
/*26*/	r0.yw = (cb1.data[3].zzzw * vsOut_C1.zzzw + cb1.data[3].xxxy).yw;
/*27*/	r2.xyzw = (texture(sampler3, r0.ywyy.st)).xyzw;
/*28*/	r0.y = (floatBitsToUint(r0.z) > 0x00000000u) ? 0 : r2.w;
/*29*/	r0.y = max(r0.y, r1.z);
/*30*/	r0.x = r0.y * r0.x;
/*31*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C2.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*32*/	r3.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C2.xyzw)) * 0xffffffffu);
/*33*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r2.xxzx) | floatBitsToUint(r3.xxzx))).yz;
/*34*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r2.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*35*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r3.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*36*/	r1.xy = (cb1.data[4].zwzz * vsOut_C2.xyxx + cb1.data[4].xyxx).xy;
/*37*/	r2.xyzw = (texture(sampler4, r1.xyxx.st)).xyzw;
/*38*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0 : r2.w;
/*39*/	r0.y = max(r0.y, r1.w);
/*40*/	r0.x = r0.y * r0.x;
/*41*/	r0.yw = (cb1.data[5].zzzw * vsOut_C2.zzzw + cb1.data[5].xxxy).yw;
/*42*/	r1.xyzw = (texture(sampler5, r0.ywyy.st)).xyzw;
/*43*/	r0.y = (floatBitsToUint(r0.z) > 0x00000000u) ? 0 : r1.w;
/*44*/	r1.xyz = (-cb2.data[13].xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*45*/	r0.y = max(r0.y, r1.x);
/*46*/	r0.x = r0.y * r0.x;
/*47*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C3.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*48*/	r3.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C3.xyzw)) * 0xffffffffu);
/*49*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r2.xxzx) | floatBitsToUint(r3.xxzx))).yz;
/*50*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r2.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*51*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r3.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*52*/	r1.xw = (cb1.data[6].zzzw * vsOut_C3.xxxy + cb1.data[6].xxxy).xw;
/*53*/	r2.xyzw = (texture(sampler6, r1.xwxx.st)).xyzw;
/*54*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 0 : r2.w;
/*55*/	r0.y = max(r0.y, r1.y);
/*56*/	r0.x = r0.y * r0.x;
/*57*/	r0.yw = (cb1.data[7].zzzw * vsOut_C3.zzzw + cb1.data[7].xxxy).yw;
/*58*/	r2.xyzw = (texture(sampler7, r0.ywyy.st)).xyzw;
/*59*/	r0.y = (floatBitsToUint(r0.z) > 0x00000000u) ? 0 : r2.w;
/*60*/	r0.y = max(r0.y, r1.z);
/*61*/	r0.x = r0.x * r0.y + -0.500000;
/*62*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*63*/	if(r0.x != 0) discard;
/*64*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*65*/	r0.w = 1.000000;
/*66*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*67*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*68*/	color0.x = r1.x / r0.x;
/*69*/	color0.yzw = (vec4(0, 0, 0, 1.000000)).yzw;
/*70*/	return;
}
