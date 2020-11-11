// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3839 - fxc/glsl_SM_3_0_wake.hlsl_VS_vs30_main.glsl
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

out vec4 vsOut_C0;
out vec4 vsOut_T1;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
/*0*/	gl_Position.x = dot(vec3(vsIn_P0.xzwx), vec3(cb0.data[9].xzwx));
/*1*/	gl_Position.y = dot(vec3(vsIn_P0.xzwx), vec3(cb0.data[10].xzwx));
/*2*/	gl_Position.z = dot(vec3(vsIn_P0.xzwx), vec3(cb0.data[11].xzwx));
/*3*/	gl_Position.w = dot(vec3(vsIn_P0.xzwx), vec3(cb0.data[12].xzwx));
/*4*/	vsOut_C0.x = vsIn_C0.x;
/*5*/	vsOut_C0.yz = (vsIn_T0.xxyx).yz;
/*6*/	vsOut_T1.xzw = (vsIn_P0.xxzw).xzw;
/*7*/	vsOut_T1.y = 0;
/*8*/	return;
}
