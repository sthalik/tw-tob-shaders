// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 398 - fxc/glsl_SM_3_0_outline.hlsl_VS_vs30_main.glsl
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

out vec4 vsOut_T0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform outline_VS
{
  vec4 data[5];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (cb1.data[4].xzxx * vec4(0.250000, 0.250000, 0.000000, 0.000000) + vsIn_P0.xyxx).xy;
/*1*/	r0.z = 1.000000;
/*2*/	r1.x = dot(vec3(r0.xyzx), vec3(cb1.data[0].xzwx));
/*3*/	r1.y = dot(vec3(r0.xyzx), vec3(cb1.data[2].xzwx));
/*4*/	r1.z = 1.000000;
/*5*/	gl_Position.x = dot(vec3(r1.xyzx), vec3(cb0.data[9].xzwx));
/*6*/	gl_Position.y = dot(vec3(r1.xyzx), vec3(cb0.data[10].xzwx));
/*7*/	gl_Position.z = dot(vec3(r1.xyzx), vec3(cb0.data[11].xzwx));
/*8*/	gl_Position.w = dot(vec3(r1.xyzx), vec3(cb0.data[12].xzwx));
/*9*/	vsOut_T0.x = vsIn_T0.x;
/*10*/	return;
}
