// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 99 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_VS_vs30_main_far.glsl
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

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;

layout(std140) uniform projected_decal_PS
{
  vec4 data[5];
} cb0;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  vsOut_T2 = vec4(0);
  vsOut_T3 = vec4(0);
  vsOut_T4 = vec4(0);
  vsOut_T5 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyz = (vsIn_P0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, vsIn_P1.xyzw);
/*3*/	r1.y = dot(r0.xyzw, vsIn_P3.xyzw);
/*4*/	r0.xy = (r1.xyxx / cb0.data[4].xyxx).xy;
/*5*/	r0.xy = (r0.xyxx + -cb0.data[3].xyxx).xy;
/*6*/	gl_Position.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + -cb0.data[3].zwzz).xy;
/*7*/	gl_Position.zw = (vec4(0, 0, 0, 1.000000)).zw;
/*8*/	vsOut_T0.xyzw = vsIn_P1.xyzw;
/*9*/	vsOut_T1.xyzw = vsIn_P2.xyzw;
/*10*/	vsOut_T2.xyzw = vsIn_P3.xyzw;
/*11*/	vsOut_T3.xyzw = vsIn_P4.xyzw;
/*12*/	vsOut_T4.xyz = (vsIn_P5.xyzx).xyz;
/*13*/	vsOut_T5.xy = (vsIn_P0.xzxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*14*/	return;
}
