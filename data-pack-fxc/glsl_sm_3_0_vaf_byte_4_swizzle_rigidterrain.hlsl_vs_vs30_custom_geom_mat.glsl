// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1475 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidterrain.hlsl_VS_vs30_custom_geom_mat.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_N0;
in vec4 vsIn_N1;
in vec4 vsIn_N2;
in vec4 vsIn_T0;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;

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
  vsOut_T2 = vec4(0);
  vsOut_T4 = vec4(0);
  vsOut_T5 = vec4(0);
  vsOut_T6 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xy = (-cb1.data[2].zwzz + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*1*/	r0.xy = (max(r0.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xy;
/*2*/	r1.xyz = (vsIn_P0.xyzx * vec4(1.000000, 2.000000, -1.000000, 0.000000)).xyz;
/*3*/	r1.w = 1.000000;
/*4*/	r2.x = dot(r1.xyzw, vsIn_P1.xyzw);
/*5*/	r2.z = dot(r1.xyzw, vsIn_P3.xyzw);
/*6*/	r0.z = dot(r1.xyzw, vsIn_P2.xyzw);
/*7*/	r0.z = r0.z * cb1.data[0].y;
/*8*/	r1.xy = (r2.xzxx / cb1.data[3].xyxx).xy;
/*9*/	r1.xy = (r1.xyxx + cb1.data[4].xxxx).xy;
/*10*/	r1.z = -r1.y + 1.000000;
/*11*/	r0.xy = (min(r0.xyxx, r1.xzxx)).xy;
/*12*/	r0.xy = (r0.xyxx * cb1.data[2].xyxx).xy;
/*13*/	r1.xy = (uintBitsToFloat(uvec4(r0.xyxx))).xy;
/*14*/	r0.xy = (fract(r0.xyxx)).xy;
/*15*/	r3.xy = intBitsToFloat((floatBitsToInt(r1.xyxx) + ivec4(ivec4(1, 1, 0, 0))).xy);
/*16*/	r1.w = r3.y;
/*17*/	r1.z = 0;
/*18*/	r4.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r1.xwzz).st, floatBitsToInt(r1.xwzz).a).xyzw;
/*19*/	r3.zw = (r1.yyyz).zw;
/*20*/	r1.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r1.xyzz).st, floatBitsToInt(r1.xyzz).a).xyzw;
/*21*/	r5.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r3.xyww).st, floatBitsToInt(r3.xyww).a).xyzw;
/*22*/	r3.xyzw = texelFetch(t_low_res_height_map, floatBitsToInt(r3.xzww).st, floatBitsToInt(r3.xzww).a).xyzw;
/*23*/	r0.w = -r1.x + r3.x;
/*24*/	r0.w = r0.x * r0.w + r1.x;
/*25*/	r1.x = -r4.x + r5.x;
/*26*/	r0.x = r0.x * r1.x + r4.x;
/*27*/	r0.x = -r0.w + r0.x;
/*28*/	r0.x = r0.y * r0.x + r0.w;
/*29*/	r0.x = r0.x * cb1.data[0].x + r0.z;
/*30*/	r0.x = r0.x + -cb1.data[0].z;
/*31*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*32*/	r0.z = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*33*/	r0.y = intBitsToFloat(1 + ~floatBitsToInt(r0.y) + floatBitsToInt(r0.z));
/*34*/	r0.y = floatBitsToInt(r0.y);
/*35*/	r0.zw = (r2.xxxz + -cb0.data[0].xxxz).zw;
/*36*/	r0.z = dot(vec2(r0.zwzz), vec2(r0.zwzz));
/*37*/	r0.z = sqrt(r0.z);
/*38*/	r0.z = r0.z + -20.000000;
/*39*/	r0.z = saturate(r0.z * 0.100000);
/*40*/	r0.y = r0.y * r0.z;
/*41*/	r2.y = r0.y * 0.090000 + r0.x;
/*42*/	r2.w = 1.000000;
/*43*/	gl_Position.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*44*/	gl_Position.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*45*/	gl_Position.z = dot(r2.xyzw, cb0.data[11].xyzw);
/*46*/	gl_Position.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*47*/	vsOut_T0.xyzw = r2.xyzw;
/*48*/	vsOut_T1.xyzw = vsIn_T0.xyzw;
/*49*/	vsOut_T2.x = vsIn_N0.w;
/*50*/	vsOut_T2.yz = (vsIn_T0.xxyx).yz;
/*51*/	r0.xyz = (vsIn_N0.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*52*/	r0.xyz = (r0.xyzx * vec4(1.000000, 1.000000, -1.000000, 0.000000)).xyz;
/*53*/	vsOut_T4.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*54*/	vsOut_T4.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*55*/	vsOut_T4.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*56*/	r0.xyz = (vsIn_N1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*57*/	vsOut_T5.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*58*/	vsOut_T5.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*59*/	vsOut_T5.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*60*/	r0.xyz = (vsIn_N2.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*61*/	vsOut_T6.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*62*/	vsOut_T6.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*63*/	vsOut_T6.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*64*/	return;
}
