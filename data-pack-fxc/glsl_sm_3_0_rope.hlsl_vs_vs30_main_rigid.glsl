// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1386 - fxc/glsl_SM_3_0_rope.hlsl_VS_vs30_main_rigid.glsl
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
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;

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

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.x = vsIn_P1.x;
/*1*/	r0.y = vsIn_P2.x;
/*2*/	r0.z = vsIn_P3.x;
/*3*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*4*/	r0.x = sqrt(r0.x);
/*5*/	r0.y = dot(vec3(vsIn_N0.xyzx), vec3(vsIn_N0.xyzx));
/*6*/	r0.y = inversesqrt(r0.y);
/*7*/	r0.yzw = (r0.yyyy * vsIn_N0.xxyz).yzw;
/*8*/	r1.x = dot(vec3(r0.yzwy), vec3(vsIn_P1.xyzx));
/*9*/	r1.y = dot(vec3(r0.yzwy), vec3(vsIn_P2.xyzx));
/*10*/	r1.z = dot(vec3(r0.yzwy), vec3(vsIn_P3.xyzx));
/*11*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*12*/	r1.w = inversesqrt(r1.w);
/*13*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*14*/	r2.y = dot(vec3(r1.xyzx), vec3(cb0.data[1].xyzx));
/*15*/	r2.z = dot(vec3(r1.xyzx), vec3(cb0.data[2].xyzx));
/*16*/	r1.x = dot(vec2(r2.yzyy), vec2(r2.yzyy));
/*17*/	r1.x = inversesqrt(r1.x);
/*18*/	r1.yz = (r1.xxxx * r2.yyzy).yz;
/*19*/	r2.xz = (r1.zzyz * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xz;
/*20*/	r2.yw = (vec4(0, 0, 0, 1.000000)).yw;
/*21*/	r1.xyz = (-r1.xyzx * vec4(0.000000, 1.000000, 0.000000, 0.000000) + r2.xyzx).xyz;
/*22*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*23*/	r1.w = inversesqrt(r1.w);
/*24*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*25*/	r1.xyz = (r1.xyzx * vsIn_T1.xxxx).xyz;
/*26*/	r2.xyz = (vsIn_P0.xyzx).xyz;
/*27*/	r3.x = dot(r2.xyzw, vsIn_P1.xyzw);
/*28*/	r3.y = dot(r2.xyzw, vsIn_P2.xyzw);
/*29*/	r3.z = dot(r2.xyzw, vsIn_P3.xyzw);
/*30*/	r3.w = 1.000000;
/*31*/	r2.x = dot(r3.xyzw, cb0.data[1].xyzw);
/*32*/	r2.y = dot(r3.xyzw, cb0.data[2].xyzw);
/*33*/	r2.z = dot(r3.xyzw, cb0.data[3].xyzw);
/*34*/	r1.xyz = (r1.xyzx * r0.xxxx + r2.xyzx).xyz;
/*35*/	r1.w = dot(r3.xyzw, cb0.data[4].xyzw);
/*36*/	vsOut_T5.xyzw = r3.xyzw;
/*37*/	r2.xyz = (r3.yzxy + -cb0.data[0].yzxy).xyz;
/*38*/	gl_Position.x = dot(r1.xyzw, cb0.data[5].xyzw);
/*39*/	gl_Position.y = dot(r1.xyzw, cb0.data[6].xyzw);
/*40*/	gl_Position.z = dot(r1.xyzw, cb0.data[7].xyzw);
/*41*/	gl_Position.w = dot(r1.xyzw, cb0.data[8].xyzw);
/*42*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*43*/	r0.x = inversesqrt(r0.x);
/*44*/	r1.xyz = (r0.xxxx * r2.xyzx).xyz;
/*45*/	r2.xyz = (r0.wyzw * r1.xyzx).xyz;
/*46*/	r1.xyz = (r0.zwyz * r1.yzxy + -r2.xyzx).xyz;
/*47*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*48*/	r0.x = inversesqrt(r0.x);
/*49*/	r1.xyz = (r0.xxxx * r1.xyzx).xyz;
/*50*/	r2.xyz = (r0.zwyz * r1.zxyz).xyz;
/*51*/	r2.xyz = (r1.yzxy * r0.wyzw + -r2.xyzx).xyz;
/*52*/	vsOut_T1.xyz = (r1.xyzx).xyz;
/*53*/	vsOut_T2.xyz = (-r0.yzwy).xyz;
/*54*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*55*/	r0.x = inversesqrt(r0.x);
/*56*/	vsOut_T0.xyz = (r0.xxxx * r2.xyzx).xyz;
/*57*/	vsOut_T0.w = vsIn_P4.w;
/*58*/	vsOut_T3.xy = (vsIn_T0.xyxx).xy;
/*59*/	return;
}
