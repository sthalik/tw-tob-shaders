// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1470 - fxc/glsl_SM_3_0_rigidterrain.hlsl_VS_vs30_geom_new.glsl
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

out vec4 vsOut_T0;
out vec4 vsOut_T1;

uniform sampler2D t_low_res_height_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb1;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.z = 0;
/*1*/	r1.xy = (-cb1.data[2].zwzz + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*2*/	r1.xy = (max(r1.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xy;
/*3*/	r2.xyz = (vsIn_P0.xyzx).xyz;
/*4*/	r2.w = 1.000000;
/*5*/	r3.x = dot(r2.xyzw, vsIn_P1.xyzw);
/*6*/	r3.z = dot(r2.xyzw, vsIn_P3.xyzw);
/*7*/	r1.z = dot(r2.xyzw, vsIn_P2.xyzw);
/*8*/	r1.z = r1.z * cb1.data[0].y;
/*9*/	r2.xy = (r3.xzxx / cb1.data[3].xyxx).xy;
/*10*/	r2.xy = (r2.xyxx + cb1.data[4].xxxx).xy;
/*11*/	r2.z = -r2.y + 1.000000;
/*12*/	r1.xy = (min(r1.xyxx, r2.xzxx)).xy;
/*13*/	r1.xy = (r1.xyxx * cb1.data[2].xyxx).xy;
/*14*/	r0.xy = (uintBitsToFloat(uvec4(r1.xyxx))).xy;
/*15*/	r1.xy = (fract(r1.xyxx)).xy;
/*16*/	r2.xy = intBitsToFloat((floatBitsToInt(r0.xyxx) + ivec4(ivec4(1, 1, 0, 0))).xy);
/*17*/	r0.w = r2.y;
/*18*/	r4.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r0.xwzz).st, floatBitsToInt(r0.xwzz).a).xyzw;
/*19*/	r2.zw = (r0.yyyz).zw;
/*20*/	r0.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r0.xyzz).st, floatBitsToInt(r0.xyzz).a).xyzw;
/*21*/	r5.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r2.xyww).st, floatBitsToInt(r2.xyww).a).xyzw;
/*22*/	r2.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r2.xzww).st, floatBitsToInt(r2.xzww).a).xyzw;
/*23*/	r0.y = -r0.x + r2.x;
/*24*/	r0.x = r1.x * r0.y + r0.x;
/*25*/	r0.y = -r4.x + r5.x;
/*26*/	r0.y = r1.x * r0.y + r4.x;
/*27*/	r0.y = -r0.x + r0.y;
/*28*/	r0.x = r1.y * r0.y + r0.x;
/*29*/	r0.x = r0.x * cb1.data[0].x + r1.z;
/*30*/	r0.x = r0.x + -cb1.data[0].z;
/*31*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*32*/	r0.z = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*33*/	r0.y = intBitsToFloat(1 + ~floatBitsToInt(r0.y) + floatBitsToInt(r0.z));
/*34*/	r0.y = floatBitsToInt(r0.y);
/*35*/	r0.zw = (r3.xxxz + -cb0.data[0].xxxz).zw;
/*36*/	r0.z = dot(vec2(r0.zwzz), vec2(r0.zwzz));
/*37*/	r0.z = sqrt(r0.z);
/*38*/	r0.z = r0.z + -20.000000;
/*39*/	r0.z = saturate(r0.z * 0.100000);
/*40*/	r0.y = r0.y * r0.z;
/*41*/	r3.y = r0.y * 0.090000 + r0.x;
/*42*/	r3.w = 1.000000;
/*43*/	gl_Position.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*44*/	gl_Position.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*45*/	gl_Position.z = dot(r3.xyzw, cb0.data[11].xyzw);
/*46*/	gl_Position.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*47*/	vsOut_T0.xyzw = r3.xyzw;
/*48*/	vsOut_T1.x = dot(r3.xyzw, cb0.data[3].xyzw);
/*49*/	return;
}
