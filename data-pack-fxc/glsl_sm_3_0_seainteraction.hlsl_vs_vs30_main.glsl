// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1401 - fxc/glsl_SM_3_0_seainteraction.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_C0;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;

out vec4 vsOut_C0;
out vec4 vsOut_T1;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform sea_interaction_VS
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

/*0*/	r0.y = vsIn_P0.y;
/*1*/	r1.xy = (vsIn_P0.xzxx * vsIn_T3.xyxx).xy;
/*2*/	r2.x = sin(vsIn_T3.z); r3.x = cos(vsIn_T3.z);
/*3*/	r4.z = r2.x;
/*4*/	r4.y = r3.x;
/*5*/	r4.x = -r2.x;
/*6*/	r0.z = dot(vec2(r1.xyxx), vec2(r4.xyxx));
/*7*/	r0.x = dot(vec2(r1.xyxx), vec2(r4.yzyy));
/*8*/	r0.xyz = (r0.xyzx + vsIn_T2.xyzx).xyz;
/*9*/	r0.w = dot(vec3(r0.xyzx), vec3(cb1.data[0].xyzx));
/*10*/	r0.w = r0.w + cb1.data[0].w;
/*11*/	r1.xyz = (r0.wwww * cb1.data[1].xyzx).xyz;
/*12*/	r0.w = dot(vec3(cb1.data[0].xyzx), vec3(cb1.data[1].xyzx));
/*13*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*14*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*15*/	r0.w = 1.000000;
/*16*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*17*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*18*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*19*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*20*/	vsOut_C0.x = vsIn_C0.x * vsIn_T3.w;
/*21*/	vsOut_C0.yz = (vsIn_T0.xxyx).yz;
/*22*/	vsOut_T1.xy = (vsIn_T1.xyxx).xy;
/*23*/	return;
}
