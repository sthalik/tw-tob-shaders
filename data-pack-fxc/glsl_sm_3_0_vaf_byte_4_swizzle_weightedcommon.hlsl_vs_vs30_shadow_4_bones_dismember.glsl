// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 2557 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_weightedcommon.hlsl_VS_vs30_shadow_4_bones_dismember.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_P1;
in vec4 vsIn_T3;
in vec4 vsIn_P2;
in vec4 vsIn_P4;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;

out vec4 vsOut_T1;
out vec4 vsOut_T2;

uniform sampler2D t_animation_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform variant_animation_size
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;

/*0*/	r0.xyzw = vsIn_P1.xyzw * vec4(255.009995, 255.009995, 255.009995, 255.009995);
/*1*/	r0.xyzw = floor(r0.xyzw);
/*2*/	r0.xyzw = intBitsToFloat(ivec4(r0.xyzw));
/*3*/	r0.xyzw = intBitsToFloat(floatBitsToInt(r0.xyzw) * ivec4(ivec4(3, 3, 3, 3))) /**/;
/*4*/	r0.xyzw = floatBitsToInt(r0.xyzw);
/*5*/	r1.x = vsIn_T3.x + 0.500000;
/*6*/	r1.x = floor(r1.x);
/*7*/	r0.xyzw = r0.xyzw + r1.xxxx;
/*8*/	r0.xyzw = intBitsToFloat(ivec4(r0.xyzw));
/*9*/	r1.x = cb1.data[0].z + 0.500000;
/*10*/	r1.x = floor(r1.x);
/*11*/	r1.x = intBitsToFloat(int(r1.x));
/*12*/	r2.xyzw = uintBitsToFloat(floatBitsToUint(r0.xyzw) ^ floatBitsToUint(r1.xxxx));
/*13*/	r2.xyzw = uintBitsToFloat(floatBitsToUint(r2.xyzw) & uvec4(vec4(0x80000000u, 0x80000000u, 0x80000000u, 0x80000000u)));
/*14*/	r3.xyzw = intBitsToFloat(max(floatBitsToInt(r0.xyzw), 1 + ~floatBitsToInt(r0.xyzw))) /**/;
/*15*/	r1.y = intBitsToFloat(max(floatBitsToInt(r1.x), 1 + ~floatBitsToInt(r1.x))) /**/;
/*16*/	r3.xyzw = uintBitsToFloat(floatBitsToUint(r3.xyzw) / floatBitsToUint(r1.yyyy));
/*17*/	r4.xyzw = intBitsToFloat(1 - ~floatBitsToInt(r3.xyzw));
/*18*/	r2.xyzw = mix(r3.xzyw, r4.xzyw, greaterThan(floatBitsToUint(r2.xzyw), uvec4(0)));
/*19*/	r3.y = r2.z;
/*20*/	r0.xyzw = intBitsToFloat((1 + ~floatBitsToInt(r2.wxzy)) * (floatBitsToInt(r1.xxxx)) + floatBitsToInt(r0.wxyz));
/*21*/	r3.x = r0.z;
/*22*/	r3.z = 0;
/*23*/	r1.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.xyzz).st, floatBitsToInt(r3.xyzz).a).xyzw;
/*24*/	r4.xyz = (vsIn_P0.xyzx).xyz;
/*25*/	r4.w = 1.000000;
/*26*/	r1.x = dot(r4.xyzw, r1.xyzw);
/*27*/	r5.yzw = (r3.yyzz).yzw;
/*28*/	r6.xyzw = intBitsToFloat(floatBitsToInt(r0.yyzz) + ivec4(ivec4(1, 2, 1, 2)));
/*29*/	r5.x = r6.w;
/*30*/	r5.xyzw = texelFetch(t_animation_map, floatBitsToInt(r5.xyzw).st, floatBitsToInt(r5.xyzw).a).xyzw;
/*31*/	r1.z = dot(r4.xyzw, r5.xyzw);
/*32*/	r3.w = r6.z;
/*33*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.wyzz).st, floatBitsToInt(r3.wyzz).a).xyzw;
/*34*/	r1.y = dot(r4.xyzw, r3.xyzw);
/*35*/	r1.xyz = (r1.xyzx * vsIn_P2.yyyy).xyz;
/*36*/	r3.y = r2.x;
/*37*/	r3.x = r0.y;
/*38*/	r3.z = 0;
/*39*/	r5.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.xyzz).st, floatBitsToInt(r3.xyzz).a).xyzw;
/*40*/	r5.x = dot(r4.xyzw, r5.xyzw);
/*41*/	r7.yzw = (r3.yyzz).yzw;
/*42*/	r7.x = r6.y;
/*43*/	r3.w = r6.x;
/*44*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r3.wyzz).st, floatBitsToInt(r3.wyzz).a).xyzw;
/*45*/	r5.y = dot(r4.xyzw, r3.xyzw);
/*46*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*47*/	r5.z = dot(r4.xyzw, r3.xyzw);
/*48*/	r1.xyz = (vsIn_P2.xxxx * r5.xyzx + r1.xyzx).xyz;
/*49*/	r0.y = r2.w;
/*50*/	r2.x = r0.w;
/*51*/	r2.z = 0;
/*52*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw;
/*53*/	r3.x = dot(r4.xyzw, r3.xyzw);
/*54*/	r5.yzw = (r2.yyzz).yzw;
/*55*/	r6.xyzw = intBitsToFloat(floatBitsToInt(r0.xwwx) + ivec4(ivec4(2, 1, 2, 1)));
/*56*/	r5.x = r6.z;
/*57*/	r5.xyzw = texelFetch(t_animation_map, floatBitsToInt(r5.xyzw).st, floatBitsToInt(r5.xyzw).a).xyzw;
/*58*/	r3.z = dot(r4.xyzw, r5.xyzw);
/*59*/	r2.w = r6.y;
/*60*/	r2.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.wyzz).st, floatBitsToInt(r2.wyzz).a).xyzw;
/*61*/	r3.y = dot(r4.xyzw, r2.xyzw);
/*62*/	r1.xyz = (vsIn_P2.zzzz * r3.xyzx + r1.xyzx).xyz;
/*63*/	r1.w = vsIn_P2.y + vsIn_P2.x;
/*64*/	r1.w = r1.w + vsIn_P2.z;
/*65*/	r1.w = -r1.w + 1.000000;
/*66*/	r0.z = 0;
/*67*/	r2.xyzw = texelFetch(t_animation_map, floatBitsToInt(r0.xyzz).st, floatBitsToInt(r0.xyzz).a).xyzw;
/*68*/	r2.x = dot(r4.xyzw, r2.xyzw);
/*69*/	r0.w = r6.w;
/*70*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r0.wyzz).st, floatBitsToInt(r0.wyzz).a).xyzw;
/*71*/	r6.yzw = (r0.yyzz).yzw;
/*72*/	r0.xyzw = texelFetch(t_animation_map, floatBitsToInt(r6.xyzw).st, floatBitsToInt(r6.xyzw).a).xyzw;
/*73*/	r2.z = dot(r4.xyzw, r0.xyzw);
/*74*/	r2.y = dot(r4.xyzw, r3.xyzw);
/*75*/	r0.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*76*/	r0.w = 1.000000;
/*77*/	r1.x = dot(r0.xyzw, vsIn_T0.xyzw);
/*78*/	r1.y = dot(r0.xyzw, vsIn_T1.xyzw);
/*79*/	r1.z = dot(r0.xyzw, vsIn_T2.xyzw);
/*80*/	r1.w = 1.000000;
/*81*/	gl_Position.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*82*/	gl_Position.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*83*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*84*/	gl_Position.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*85*/	vsOut_T2.xyzw = r1.xyzw;
/*86*/	vsOut_T1.xy = (vsIn_P4.xyxx).xy;
/*87*/	return;
}
