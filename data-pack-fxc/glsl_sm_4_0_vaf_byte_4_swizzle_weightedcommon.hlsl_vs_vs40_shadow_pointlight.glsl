// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1617 - fxc/glsl_SM_4_0_VAF_BYTE_4_SWIZZLE_weightedcommon.hlsl_VS_vs40_shadow_pointlight.glsl
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
in vec4 vsIn_P3;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;

out vec4 vsOut_T0;

uniform sampler2D t_animation_map;

layout(std140) uniform variant_animation_size
{
  vec4 data[2];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.x = -vsIn_P1.z + 1.000000;
/*1*/	r0.yz = (vsIn_P1.xxyx * vec4(0.000000, 255.009995, 255.009995, 0.000000)).yz;
/*2*/	r0.yz = floor((r0.yyzy).yz);
/*3*/	r0.yz = (intBitsToFloat(ivec4(r0.yyzy))).yz;
/*4*/	r0.yz = intBitsToFloat((floatBitsToInt(r0.yyzy) * ivec4(ivec4(0, 3, 3, 0))).yz) /**/;
/*5*/	r0.yz = (floatBitsToInt(r0.yyzy)).yz;
/*6*/	r0.w = vsIn_T3.x + 0.500000;
/*7*/	r0.w = floor(r0.w);
/*8*/	r0.yz = (r0.yyzy + r0.wwww).yz;
/*9*/	r0.w = cb0.data[0].z + 0.500000;
/*10*/	r0.w = floor(r0.w);
/*11*/	r0.yzw = (intBitsToFloat(ivec4(r0.yyzw))).yzw;
/*12*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r0.wwww) ^ floatBitsToUint(r0.yzyy))).xy;
/*13*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r1.xyxx) & uvec4(vec4(0x80000000u, 0x80000000u, 0, 0)))).xy;
/*14*/	r1.zw = (intBitsToFloat(max(floatBitsToInt(r0.yyyz), 1 + ~floatBitsToInt(r0.yyyz))).zw) /**/;
/*15*/	r2.x = intBitsToFloat(max(floatBitsToInt(r0.w), 1 + ~floatBitsToInt(r0.w))) /**/;
/*16*/	r1.zw = (uintBitsToFloat(floatBitsToUint(r1.zzzw) / floatBitsToUint(r2.xxxx))).zw;
/*17*/	r2.xy = (intBitsToFloat(1 - ~floatBitsToInt(r1.zwzz))).xy;
/*18*/	r1.xy = (mix(r1.zwzz, r2.xyxx, greaterThan(floatBitsToUint(r1.xyxx), uvec4(0)))).xy;
/*19*/	r2.xw = intBitsToFloat(((1 + ~floatBitsToInt(r1.xxxy)) * (floatBitsToInt(r0.wwww)) + floatBitsToInt(r0.yyyz)).xw);
/*20*/	r2.z = 0;
/*21*/	r1.zw = (r2.zzzw).zw;
/*22*/	r3.xyzw = texelFetch(t_animation_map, floatBitsToInt(r1.wyzz).st, floatBitsToInt(r1.wyzz).a).xyzw;
/*23*/	r2.y = r1.x;
/*24*/	r4.xyz = (vsIn_P0.xyzx).xyz;
/*25*/	r4.w = 1.000000;
/*26*/	r3.x = dot(r4.xyzw, r3.xyzw);
/*27*/	r5.xyzw = intBitsToFloat(floatBitsToInt(r2.xxww) + ivec4(ivec4(1, 2, 1, 2)));
/*28*/	r6.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw;
/*29*/	r6.x = dot(r4.xyzw, r6.xyzw);
/*30*/	r1.xw = (r5.zzzw).xw;
/*31*/	r2.xw = (r5.xxxy).xw;
/*32*/	r5.xyzw = texelFetch(t_animation_map, floatBitsToInt(r1.xyzz).st, floatBitsToInt(r1.xyzz).a).xyzw;
/*33*/	r1.xyzw = texelFetch(t_animation_map, floatBitsToInt(r1.wyzz).st, floatBitsToInt(r1.wyzz).a).xyzw;
/*34*/	r3.z = dot(r4.xyzw, r1.xyzw);
/*35*/	r3.y = dot(r4.xyzw, r5.xyzw);
/*36*/	r0.xyz = (r0.xxxx * r3.xyzx).xyz;
/*37*/	r1.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw;
/*38*/	r2.xyzw = texelFetch(t_animation_map, floatBitsToInt(r2.wyzz).st, floatBitsToInt(r2.wyzz).a).xyzw;
/*39*/	r6.z = dot(r4.xyzw, r2.xyzw);
/*40*/	r6.y = dot(r4.xyzw, r1.xyzw);
/*41*/	r0.xyz = (vsIn_P1.zzzz * r6.xyzx + r0.xyzx).xyz;
/*42*/	r0.w = 1.000000;
/*43*/	gl_Position.x = dot(r0.xyzw, vsIn_T0.xyzw);
/*44*/	gl_Position.y = dot(r0.xyzw, vsIn_T1.xyzw);
/*45*/	gl_Position.z = dot(r0.xyzw, vsIn_T2.xyzw);
/*46*/	gl_Position.w = 1.000000;
/*47*/	vsOut_T0.xy = (vsIn_P3.xyxx).xy;
/*48*/	return;
}
