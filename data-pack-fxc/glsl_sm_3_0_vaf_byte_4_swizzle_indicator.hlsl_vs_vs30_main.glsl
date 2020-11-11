// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 334 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_indicator.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_C0;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_C0;
out vec4 vsOut_T2;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
/*0*/	gl_Position.x = dot(vsIn_P0.xyzw, cb0.data[9].xyzw);
/*1*/	gl_Position.y = dot(vsIn_P0.xyzw, cb0.data[10].xyzw);
/*2*/	gl_Position.z = dot(vsIn_P0.xyzw, cb0.data[11].xyzw);
/*3*/	gl_Position.w = dot(vsIn_P0.xyzw, cb0.data[12].xyzw);
/*4*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*5*/	vsOut_T1.xyz = (vsIn_P0.xyzx).xyz;
/*6*/	vsOut_C0.xyzw = vsIn_C0.zyxw;
/*7*/	vsOut_T2.x = dot(vsIn_P0.xyzw, cb0.data[1].xyzw);
/*8*/	vsOut_T2.y = dot(vsIn_P0.xyzw, cb0.data[2].xyzw);
/*9*/	vsOut_T2.z = dot(vsIn_P0.xyzw, cb0.data[3].xyzw);
/*10*/	vsOut_T2.w = dot(vsIn_P0.xyzw, cb0.data[4].xyzw);
/*11*/	return;
}
