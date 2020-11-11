// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 600 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidgrass.hlsl_VS_vs30_main_grass.glsl
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
in vec4 vsIn_C0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;
in vec4 vsIn_T4;

out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform wind_VS
{
  vec4 data[3];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.x = vsIn_T1.w;
/*1*/	r0.y = vsIn_T2.w;
/*2*/	r0.z = vsIn_T3.w;
/*3*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*4*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*5*/	r0.x = sqrt(r0.x);
/*6*/	r0.x = r0.x * 0.010000;
/*7*/	r0.x = min(r0.x, 1.000000);
/*8*/	r0.y = saturate(vsIn_C0.w);
/*9*/	r0.x = r0.y * -r0.x + 1.000000;
/*10*/	r0.y = vsIn_P0.y + 0.600000;
/*11*/	r0.y = r0.x * r0.y + -0.600000;
/*12*/	r0.xz = (vsIn_P0.xxzx).xz;
/*13*/	r0.w = 1.000000;
/*14*/	r1.z = dot(vsIn_T3.xyzw, r0.xyzw);
/*15*/	r1.x = dot(vsIn_T1.xyzw, r0.xyzw);
/*16*/	r1.y = dot(vsIn_T2.xyzw, r0.xyzw);
/*17*/	r0.xy = (r1.xzxx * vec4(0.250000, 0.250000, 0.000000, 0.000000) + cb0.data[26].xxxx).xy;
/*18*/	r0.z = r0.y * 0.300000;
/*19*/	r0.xyz = sin(vec3(r0.xyzx));
/*20*/	r0.z = r0.z * cb1.data[1].y;
/*21*/	r0.w = r1.x + cb0.data[26].x;
/*22*/	r0.w = r0.w * 5.000000;
/*23*/	r0.w = cos((r0.w));
/*24*/	r0.z = r0.w * r0.z;
/*25*/	r0.w = saturate(vsIn_C0.w + -0.700000);
/*26*/	r0.w = r0.w * cb1.data[0].w;
/*27*/	r0.z = r0.z * r0.w;
/*28*/	r0.w = cb0.data[26].x * 3.000000;
/*29*/	r0.w = sin(r0.w);
/*30*/	r0.w = r0.w * r0.y;
/*31*/	r0.x = r0.y + r0.x;
/*32*/	r0.y = r0.w * cb1.data[1].x;
/*33*/	r0.y = r0.y * 0.500000 + 0.500000;
/*34*/	r0.y = r0.y * cb1.data[1].x;
/*35*/	r0.w = vsIn_C0.w * cb1.data[0].w;
/*36*/	r2.xy = (r0.wwww * cb1.data[0].xyxx).xy;
/*37*/	r0.yw = (r0.yyyy * r2.xxxy).yw;
/*38*/	r2.xz = (r0.yywy * vec4(0.500000, 0.000000, 0.500000, 0.000000)).xz;
/*39*/	r2.y = 0;
/*40*/	r0.yzw = (r0.zzzz * vec4(0.000000, 0.000000, 2.333333, 0.000000) + r2.xxyz).yzw;
/*41*/	r1.xyz = (r0.yzwy + r1.xyzx).xyz;
/*42*/	r1.w = 1.000000;
/*43*/	gl_Position.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*44*/	gl_Position.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*45*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*46*/	r1.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*47*/	gl_Position.w = r1.w;
/*48*/	vsOut_C0.xyzw = vsIn_C0.zyxw;
/*49*/	vsOut_T0.xyzw = r1.xyzw;
/*50*/	r1.xyz = (r1.xyzx + -cb0.data[0].xyzx).xyz;
/*51*/	vsOut_T1.xy = (vsIn_T0.xyxx).xy;
/*52*/	vsOut_T1.zw = (vsIn_T4.xxxy).zw;
/*53*/	r1.w = sin(cb0.data[26].x);
/*54*/	r0.x = r0.x * r1.w;
/*55*/	r0.x = r0.x * 0.300000;
/*56*/	r2.xyz = (vsIn_N0.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*57*/	r3.x = dot(vec3(vsIn_T1.xyzx), vec3(r2.xyzx));
/*58*/	r3.y = dot(vec3(vsIn_T2.xyzx), vec3(r2.xyzx));
/*59*/	r3.z = dot(vec3(vsIn_T3.xyzx), vec3(r2.xyzx));
/*60*/	r0.xyz = (r0.yzwy * r0.xxxx + r3.xyzx).xyz;
/*61*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	vsOut_T2.xyz = (r0.wwww * r0.xyzx).xyz;
/*64*/	r0.xyz = (vsIn_N1.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*65*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*66*/	r0.w = inversesqrt(r0.w);
/*67*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*68*/	vsOut_T3.x = dot(vec3(vsIn_T1.xyzx), vec3(r0.xyzx));
/*69*/	vsOut_T3.y = dot(vec3(vsIn_T2.xyzx), vec3(r0.xyzx));
/*70*/	vsOut_T3.z = dot(vec3(vsIn_T3.xyzx), vec3(r0.xyzx));
/*71*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*72*/	r0.y = inversesqrt(r0.x);
/*73*/	vsOut_T4.w = sqrt(r0.x);
/*74*/	vsOut_T4.xyz = (r0.yyyy * r1.xyzx).xyz;
/*75*/	vsOut_T5.x = vsIn_T1.w;
/*76*/	vsOut_T5.y = vsIn_T2.w;
/*77*/	vsOut_T5.z = vsIn_T3.w;
/*78*/	vsOut_T5.w = 1.000000;
/*79*/	return;
}
