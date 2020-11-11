// Flat Varyings: 1 2 3

//
// Shader Model 4
// Vertex Shader
//
// id: 1484 - fxc/glsl_SM_4_0_rigidterrain.hlsl_VS_vs30_blend.glsl
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

out vec4 vsOut_T0;
flat out vec4 vsOut_T1;
flat out vec4 vsOut_T2;
flat out vec4 vsOut_T3;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  vsOut_T2 = vec4(0);
  vsOut_T3 = vec4(0);
  vec4 r0;

/*0*/	r0.xyz = (-vsIn_T1.xyzx + vsIn_T2.xyzx).xyz;
/*1*/	r0.xyz = (vsIn_P0.xyzx * r0.xyzx + vsIn_T1.xyzx).xyz;
/*2*/	r0.w = 1.000000;
/*3*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*4*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*5*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*6*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*7*/	vsOut_T0.xy = (r0.xzxx).xy;
/*8*/	vsOut_T1.xy = (vsIn_T1.xzxx).xy;
/*9*/	vsOut_T1.zw = (vsIn_T2.xxxz).zw;
/*10*/	vsOut_T2.xy = (vsIn_T3.xyxx).xy;
/*11*/	vsOut_T3.xyzw = vsIn_T0.xyzw;
/*12*/	return;
}
