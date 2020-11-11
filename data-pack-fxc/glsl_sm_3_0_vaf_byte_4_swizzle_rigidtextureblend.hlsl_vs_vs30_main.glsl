// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1309 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidtextureblend.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_T0;
in vec4 vsIn_N0;
in vec4 vsIn_N1;
in vec4 vsIn_N2;
in vec4 vsIn_C0;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_T1;

out vec4 vsOut_T0;
out vec4 vsOut_C3;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_C0;
out vec4 vsOut_C1;
out vec4 vsOut_C2;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform texture_blend_PS
{
  vec4 data[25];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyz = (vsIn_P0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, vsIn_P1.xyzw);
/*3*/	r1.y = dot(r0.xyzw, vsIn_P2.xyzw);
/*4*/	r1.z = dot(r0.xyzw, vsIn_P3.xyzw);
/*5*/	r1.w = 1.000000;
/*6*/	gl_Position.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*7*/	gl_Position.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*8*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*9*/	gl_Position.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*10*/	vsOut_T0.xyzw = r1.xyzw;
/*11*/	vsOut_T3.w = dot(r1.xyzw, cb0.data[3].xyzw);
/*12*/	r0.xyz = (vsIn_N0.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*13*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*14*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*15*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*16*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*17*/	r0.x = inversesqrt(r0.x);
/*18*/	vsOut_T1.xyz = (r0.xxxx * r1.xyzx).xyz;
/*19*/	vsOut_T1.w = vsIn_T0.y;
/*20*/	r0.xyz = (vsIn_N1.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*21*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*22*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*23*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*24*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*25*/	r0.x = inversesqrt(r0.x);
/*26*/	vsOut_T2.xyz = (r0.xxxx * r1.xyzx).xyz;
/*27*/	vsOut_T2.w = vsIn_T1.y;
/*28*/	r0.xyz = (vsIn_N2.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*29*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*30*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*31*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*32*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*33*/	r0.x = inversesqrt(r0.x);
/*34*/	vsOut_T3.xyz = (r0.xxxx * r1.xyzx).xyz;
/*35*/	vsOut_T4.xy = (vsIn_T0.xyxx).xy;
/*36*/	vsOut_T5.xy = (vsIn_C0.wzww).xy;
/*37*/	vsOut_T5.zw = (vsIn_T1.zzzw).zw;
/*38*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[17].xyxx).xy;
/*39*/	vsOut_C0.xy = (r0.xyxx / cb1.data[17].zwzz).xy;
/*40*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[18].xyxx).xy;
/*41*/	vsOut_C0.zw = (r0.xxxy / cb1.data[18].zzzw).zw;
/*42*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[19].xyxx).xy;
/*43*/	vsOut_C1.xy = (r0.xyxx / cb1.data[19].zwzz).xy;
/*44*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[20].xyxx).xy;
/*45*/	vsOut_C1.zw = (r0.xxxy / cb1.data[20].zzzw).zw;
/*46*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[21].xyxx).xy;
/*47*/	vsOut_C2.xy = (r0.xyxx / cb1.data[21].zwzz).xy;
/*48*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[22].xyxx).xy;
/*49*/	vsOut_C2.zw = (r0.xxxy / cb1.data[22].zzzw).zw;
/*50*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[23].xyxx).xy;
/*51*/	vsOut_C3.xy = (r0.xyxx / cb1.data[23].zwzz).xy;
/*52*/	r0.xy = (vsIn_T0.xyxx + -cb1.data[24].xyxx).xy;
/*53*/	vsOut_C3.zw = (r0.xxxy / cb1.data[24].zzzw).zw;
/*54*/	return;
}
