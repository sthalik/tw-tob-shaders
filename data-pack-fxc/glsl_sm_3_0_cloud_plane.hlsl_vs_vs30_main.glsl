// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 242 - fxc/glsl_SM_3_0_cloud_plane.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;
in vec4 vsIn_T4;
in vec4 vsIn_T5;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T5;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform cloud_plane_VS
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

/*0*/	r0.xy = (vsIn_P0.xyxx * vsIn_T3.zzzz).xy;
/*1*/	r0.xy = sin(vec2(r0.xyxx));
/*2*/	r0.xy = (r0.xyxx * vsIn_T2.zzzz).xy;
/*3*/	r1.x = sin(vsIn_T3.y); r2.x = cos(vsIn_T3.y);
/*4*/	r3.x = -r1.x;
/*5*/	r3.y = r2.x;
/*6*/	r3.z = r1.x;
/*7*/	r1.y = dot(vec2(r0.yxyy), vec2(r3.yzyy));
/*8*/	r1.x = dot(vec2(r0.yxyy), vec2(r3.xyxx));
/*9*/	r0.xy = (r1.xyxx + vsIn_T4.xzxx).xy;
/*10*/	r1.x = sin(vsIn_T3.w); r2.x = cos(vsIn_T3.w);
/*11*/	r3.x = -r1.x;
/*12*/	r3.y = r2.x;
/*13*/	r3.z = r1.x;
/*14*/	r1.z = dot(vec2(r0.yxyy), vec2(r3.yzyy));
/*15*/	r1.y = dot(vec2(r0.yxyy), vec2(r3.xyxx));
/*16*/	r0.x = r1.y * r1.y;
/*17*/	r0.x = vsIn_T2.z * vsIn_T2.z + -r0.x;
/*18*/	r0.x = -r1.z * r1.z + r0.x;
/*19*/	r0.x = sqrt(r0.x);
/*20*/	r1.x = r0.x + vsIn_T4.y;
/*21*/	r0.x = sin(vsIn_T2.y); r2.x = cos(vsIn_T2.y);
/*22*/	r3.x = -r0.x;
/*23*/	r3.y = r2.x;
/*24*/	r4.z = dot(vec2(r1.xzxx), vec2(r3.xyxx));
/*25*/	r3.z = r0.x;
/*26*/	r1.w = dot(vec2(r1.xzxx), vec2(r3.yzyy));
/*27*/	r0.xy = (r1.yzyy / vsIn_T5.yyyy).xy;
/*28*/	r0.xy = (r0.xyxx * cb1.data[0].yyyy).xy;
/*29*/	r0.xy = (max(r0.xyxx, vec4(-0.500000, -0.500000, 0.000000, 0.000000))).xy;
/*30*/	r0.xz = (min(r0.xxyx, vec4(0.500000, 0.000000, 0.500000, 0.000000))).xz;
/*31*/	r1.x = sin(vsIn_T2.x); r5.x = cos(vsIn_T2.x);
/*32*/	r6.x = -r1.x;
/*33*/	r6.y = r5.x;
/*34*/	r0.w = dot(vec2(r1.ywyy), vec2(r6.xyxx));
/*35*/	r0.w = r0.w + vsIn_T2.w;
/*36*/	r4.y = r0.w * cb1.data[0].z;
/*37*/	r6.z = r1.x;
/*38*/	r4.x = dot(vec2(r1.ywyy), vec2(r6.yzyy));
/*39*/	r4.w = 1.000000;
/*40*/	r7.x = dot(r4.xyzw, cb0.data[1].xyzw);
/*41*/	r7.y = dot(r4.xyzw, cb0.data[2].xyzw);
/*42*/	r7.z = dot(r4.xyzw, cb0.data[3].xyzw);
/*43*/	r7.w = dot(r4.xyzw, cb0.data[4].xyzw);
/*44*/	vsOut_T3.xyz = (r4.xyzx).xyz;
/*45*/	r0.w = dot(r7.xyzw, cb0.data[8].xyzw);
/*46*/	gl_Position.zw = (r0.wwww * vec4(0.000000, 0.000000, 0.999980, 1.000000)).zw;
/*47*/	gl_Position.x = dot(r7.xyzw, cb0.data[5].xyzw);
/*48*/	gl_Position.y = dot(r7.xyzw, cb0.data[6].xyzw);
/*49*/	r0.w = vsIn_T2.z + vsIn_T4.y;
/*50*/	r1.y = r2.x * r0.w;
/*51*/	r2.z = r3.x * r0.w;
/*52*/	r0.w = r1.y * r5.x + vsIn_T2.w;
/*53*/	r2.x = r1.x * r1.y;
/*54*/	r2.y = r0.w * cb1.data[0].z;
/*55*/	vsOut_T0.xyz = (r2.xyzx).xyz;
/*56*/	vsOut_T1.xy = (vsIn_T0.xyxx * vsIn_T1.zwzz + vsIn_T1.xyxx).xy;
/*57*/	vsOut_T1.z = vsIn_T5.x;
/*58*/	vsOut_T1.w = vsIn_T2.w;
/*59*/	r0.w = -r0.x * r0.x + 0.707000;
/*60*/	r0.w = -r0.z * r0.z + r0.w;
/*61*/	r0.y = sqrt(r0.w);
/*62*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*63*/	r0.w = inversesqrt(r0.w);
/*64*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*65*/	r0.w = dot(vec2(r0.yzyy), vec2(r3.yzyy));
/*66*/	r1.z = dot(vec2(r0.yzyy), vec2(r3.xyxx));
/*67*/	r1.x = dot(vec2(r0.xwxx), vec2(r6.yzyy));
/*68*/	r1.y = dot(vec2(r0.xwxx), vec2(r6.xyxx));
/*69*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*70*/	r0.x = inversesqrt(r0.x);
/*71*/	vsOut_T2.xyz = (r0.xxxx * r1.xyzx).xyz;
/*72*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*73*/	r0.x = inversesqrt(r0.x);
/*74*/	vsOut_T5.xyz = (r0.xxxx * r2.xyzx).xyz;
/*75*/	return;
}
