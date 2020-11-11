// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1454 - fxc/glsl_SM_3_0_rigidterrain.hlsl_VS_vs30_geom_editor.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;
in vec4 vsIn_P5;

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

/*0*/	r0.xy = (-cb1.data[2].zwzz + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*1*/	r0.xy = (max(r0.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xy;
/*2*/	r1.y = vsIn_P2.z * vsIn_P2.x;
/*3*/	r1.xz = (vsIn_P0.xxyx).xz;
/*4*/	r1.w = 1.000000;
/*5*/	r2.x = dot(r1.xyzw, vsIn_P3.xyzw);
/*6*/	r2.z = dot(r1.xyzw, vsIn_P5.xyzw);
/*7*/	r0.z = dot(r1.xyzw, vsIn_P4.xyzw);
/*8*/	r0.z = r0.z * cb1.data[0].y;
/*9*/	r1.xy = (r2.xzxx / cb1.data[3].xyxx).xy;
/*10*/	r1.xy = (r1.xyxx + cb1.data[4].xxxx).xy;
/*11*/	r1.z = -r1.y + 1.000000;
/*12*/	r0.xy = (min(r0.xyxx, r1.xzxx)).xy;
/*13*/	r0.xy = (r0.xyxx * cb1.data[2].xyxx).xy;
/*14*/	r1.xy = (uintBitsToFloat(uvec4(r0.xyxx))).xy;
/*15*/	r0.xy = (fract(r0.xyxx)).xy;
/*16*/	r3.xy = intBitsToFloat((floatBitsToInt(r1.xyxx) + ivec4(ivec4(1, 1, 0, 0))).xy);
/*17*/	r1.w = r3.y;
/*18*/	r1.z = 0;
/*19*/	r4.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r1.xwzz).st, floatBitsToInt(r1.xwzz).a).xyzw;
/*20*/	r3.zw = (r1.yyyz).zw;
/*21*/	r1.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r1.xyzz).st, floatBitsToInt(r1.xyzz).a).xyzw;
/*22*/	r5.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r3.xyww).st, floatBitsToInt(r3.xyww).a).xyzw;
/*23*/	r3.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r3.xzww).st, floatBitsToInt(r3.xzww).a).xyzw;
/*24*/	r0.w = -r1.x + r3.x;
/*25*/	r0.w = r0.x * r0.w + r1.x;
/*26*/	r1.x = -r4.x + r5.x;
/*27*/	r0.x = r0.x * r1.x + r4.x;
/*28*/	r0.x = -r0.w + r0.x;
/*29*/	r0.x = r0.y * r0.x + r0.w;
/*30*/	r0.x = r0.x * cb1.data[0].x + r0.z;
/*31*/	r2.y = r0.x + -cb1.data[0].z;
/*32*/	r2.w = 1.000000;
/*33*/	gl_Position.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*34*/	gl_Position.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*35*/	gl_Position.z = dot(r2.xyzw, cb0.data[11].xyzw);
/*36*/	gl_Position.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*37*/	vsOut_T0.xyzw = r2.xyzw;
/*38*/	vsOut_T1.x = dot(r2.xyzw, cb0.data[3].xyzw);
/*39*/	return;
}
