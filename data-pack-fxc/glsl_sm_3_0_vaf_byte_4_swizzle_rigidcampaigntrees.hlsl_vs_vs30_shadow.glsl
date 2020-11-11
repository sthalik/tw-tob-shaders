// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3926 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidcampaigntrees.hlsl_VS_vs30_shadow.glsl
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
in vec4 vsIn_T1;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;

out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;
out vec4 vsOut_T7;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.w = vsIn_P0.w;
/*1*/	r0.x = dot(vsIn_P1.xyzw, vsIn_P0.xyzw);
/*2*/	r0.y = dot(vsIn_P2.xyzw, vsIn_P0.xyzw);
/*3*/	r0.z = dot(vsIn_P3.xyzw, vsIn_P0.xyzw);
/*4*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*5*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*6*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*7*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*8*/	vsOut_T0.xyzw = r0.xyzw;
/*9*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*10*/	vsOut_C0.xyzw = vsIn_C0.zyxw;
/*11*/	vsOut_T1.xy = (vsIn_T0.xyxx).xy;
/*12*/	r1.xyz = (vsIn_N0.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*13*/	r2.x = dot(vec3(vsIn_P1.xyzx), vec3(r1.xyzx));
/*14*/	r2.y = dot(vec3(vsIn_P2.xyzx), vec3(r1.xyzx));
/*15*/	r2.z = dot(vec3(vsIn_P3.xyzx), vec3(r1.xyzx));
/*16*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r0.w = inversesqrt(r0.w);
/*18*/	vsOut_T2.xyz = (r0.wwww * r2.xyzx).xyz;
/*19*/	r1.xyz = (vsIn_N1.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*20*/	r2.xyz = (r1.yyyy * vsIn_P2.xyzx).xyz;
/*21*/	r1.xyw = (r1.xxxx * vsIn_P1.xyxz + r2.xyxz).xyw;
/*22*/	r1.xyz = (r1.zzzz * vsIn_P3.xyzx + r1.xywx).xyz;
/*23*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	vsOut_T3.xyz = (r0.wwww * r1.xyzx).xyz;
/*26*/	r1.xyz = (vsIn_N2.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*27*/	r2.xyz = (r1.yyyy * vsIn_P2.xyzx).xyz;
/*28*/	r1.xyw = (r1.xxxx * vsIn_P1.xyxz + r2.xyxz).xyw;
/*29*/	r1.xyz = (r1.zzzz * vsIn_P3.xyzx + r1.xywx).xyz;
/*30*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*31*/	r0.w = inversesqrt(r0.w);
/*32*/	vsOut_T4.xyz = (r0.wwww * r1.xyzx).xyz;
/*33*/	r1.xyz = (vsIn_T1.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*34*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*35*/	r0.w = inversesqrt(r0.w);
/*36*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*37*/	vsOut_T5.x = dot(vec3(vsIn_P1.xyzx), vec3(r1.xyzx));
/*38*/	vsOut_T5.y = dot(vec3(vsIn_P2.xyzx), vec3(r1.xyzx));
/*39*/	vsOut_T5.z = dot(vec3(vsIn_P3.xyzx), vec3(r1.xyzx));
/*40*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*41*/	r1.x = inversesqrt(r0.w);
/*42*/	vsOut_T6.w = sqrt(r0.w);
/*43*/	vsOut_T6.xyz = (r0.xyzx * r1.xxxx).xyz;
/*44*/	vsOut_T7.x = vsIn_P1.w;
/*45*/	vsOut_T7.y = vsIn_P2.w;
/*46*/	vsOut_T7.z = vsIn_P3.w;
/*47*/	vsOut_T7.w = 1.000000;
/*48*/	return;
}
