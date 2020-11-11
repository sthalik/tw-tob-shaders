// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 635 - fxc/glsl_SM_3_0_rigidriver.hlsl_VS_vs30_main_battle_river.glsl
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
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;
in vec4 vsIn_P5;

out vec4 vsOut_T0;
out vec4 vsOut_T2;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;
out vec4 vsOut_T1;
out vec4 vsOut_T7;

uniform sampler2D s_low_res_height_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb1;
layout(std140) uniform river_CB
{
  vec4 data[2];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xy = (-cb1.data[2].zwzz + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*1*/	r0.xy = (max(r0.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xy;
/*2*/	r1.xzw = (vec4(-0.000000, 0, -0.000000, 1.000000)).xzw;
/*3*/	r1.y = -cb2.data[0].w/**/;
/*4*/	r1.xyz = (r1.xyzx + vsIn_P0.xyzx).xyz;
/*5*/	r2.x = dot(r1.xyzw, vsIn_P2.xyzw);
/*6*/	r2.z = dot(r1.xyzw, vsIn_P4.xyzw);
/*7*/	r0.z = dot(r1.xyzw, vsIn_P3.xyzw);
/*8*/	r0.z = r0.z * cb1.data[0].y;
/*9*/	r1.xy = (r2.xzxx / cb1.data[3].xyxx).xy;
/*10*/	r1.xy = (r1.xyxx + cb1.data[4].xxxx).xy;
/*11*/	r1.z = -r1.y + 1.000000;
/*12*/	r1.zw = (min(r0.xxxy, r1.xxxz)).zw;
/*13*/	r1.xy = (r1.zwzz + cb1.data[2].zwzz).xy;
/*14*/	r3.xyzw = (textureLod(s_low_res_height_map, r1.zyzz.st, 0.000000)).xyzw;
/*15*/	r4.xyzw = (textureLod(s_low_res_height_map, r1.xyxx.st, 0.000000)).xyzw;
/*16*/	r5.xyzw = (textureLod(s_low_res_height_map, r1.xwxx.st, 0.000000)).xyzw;
/*17*/	r0.x = -r3.x + r4.x;
/*18*/	r0.yw = (r1.zzzw * cb1.data[2].xxxy).yw;
/*19*/	r1.xyzw = (textureLod(s_low_res_height_map, r1.zwzz.st, 0.000000)).xyzw;
/*20*/	r0.yw = (fract(r0.yyyw)).yw;
/*21*/	r0.x = r0.y * r0.x + r3.x;
/*22*/	r1.y = -r1.x + r5.x;
/*23*/	r0.y = r0.y * r1.y + r1.x;
/*24*/	r0.x = -r0.y + r0.x;
/*25*/	r0.x = r0.w * r0.x + r0.y;
/*26*/	r0.x = r0.x * cb1.data[0].x + r0.z;
/*27*/	r2.y = r0.x + -cb1.data[0].z;
/*28*/	r2.w = 1.000000;
/*29*/	gl_Position.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*30*/	gl_Position.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*31*/	gl_Position.z = dot(r2.xyzw, cb0.data[11].xyzw);
/*32*/	r0.x = dot(r2.xyzw, cb0.data[12].xyzw);
/*33*/	vsOut_T0.xyz = (r2.xyzx).xyz;
/*34*/	gl_Position.w = r0.x;
/*35*/	vsOut_T0.w = r0.x;
/*36*/	vsOut_T2.xyz = (vec4(0, 1.000000, 0, 0)).xyz;
/*37*/	vsOut_T4.xyzw = vsIn_P1.xyzw;
/*38*/	r0.xy = (vsIn_P1.xyxx * vec4(0.010000, 0.001000, 0.000000, 0.000000)).xy;
/*39*/	r0.z = uintBitsToFloat((vsIn_P5.x >= 1.000000) ? 0xffffffffu : 0x00000000u);
/*40*/	r1.xy = (-vsIn_P1.xyxx * vec4(0.010000, 0.001000, 0.000000, 0.000000) + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*41*/	vsOut_T5.xy = (mix(r0.xyxx, r1.xyxx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xy;
/*42*/	vsOut_T5.z = vsIn_P1.w;
/*43*/	vsOut_T5.w = vsIn_P0.w;
/*44*/	vsOut_T7.x = vsIn_P1.z;
/*45*/	vsOut_T7.y = vsIn_P0.w;
/*46*/	return;
}
