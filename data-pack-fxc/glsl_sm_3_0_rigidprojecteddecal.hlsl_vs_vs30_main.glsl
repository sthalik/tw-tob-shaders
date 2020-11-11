// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3885 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_P6;

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
/*10*/	vsOut_T0.xyzw = vsIn_P1.xyzw;
/*11*/	vsOut_T1.xyzw = vsIn_P2.xyzw;
/*12*/	vsOut_T2.xyzw = vsIn_P3.xyzw;
/*13*/	vsOut_T3.xyzw = vsIn_P4.xyzw;
/*14*/	vsOut_T4.xyz = (vsIn_P5.xyzx).xyz;
/*15*/	vsOut_T5.xyzw = vsIn_P6.xyzw;
/*16*/	return;
}
