// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 239 - fxc/glsl_SM_3_0_Cloth.hlsl_VS_vs30_main.glsl
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

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform cloth_VS
{
  vec4 data[4];
} cb1;

void main()
{
  vec4 r0;

/*0*/	gl_Position.x = dot(vsIn_P0.xyzw, cb0.data[9].xyzw);
/*1*/	gl_Position.y = dot(vsIn_P0.xyzw, cb0.data[10].xyzw);
/*2*/	gl_Position.z = dot(vsIn_P0.xyzw, cb0.data[11].xyzw);
/*3*/	gl_Position.w = dot(vsIn_P0.xyzw, cb0.data[12].xyzw);
/*4*/	r0.xyz = (-vsIn_P0.xyzx + cb0.data[0].xyzx).xyz;
/*5*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*6*/	r0.w = inversesqrt(r0.w);
/*7*/	vsOut_T0.xyz = (r0.wwww * r0.xyzx).xyz;
/*8*/	vsOut_T1.xyzw = vsIn_P0.xyzw;
/*9*/	r0.x = dot(vec3(vsIn_T0.xyzx), vec3(vsIn_T0.xyzx));
/*10*/	r0.x = inversesqrt(r0.x);
/*11*/	r0.xyz = (r0.xxxx * vsIn_T0.xyzx).xyz;
/*12*/	vsOut_T2.x = dot(vec3(r0.xyzx), vec3(cb1.data[0].xyzx));
/*13*/	vsOut_T2.y = dot(vec3(r0.xyzx), vec3(cb1.data[1].xyzx));
/*14*/	vsOut_T2.z = dot(vec3(r0.xyzx), vec3(cb1.data[2].xyzx));
/*15*/	vsOut_T3.xy = (vsIn_T1.xyxx).xy;
/*16*/	return;
}
