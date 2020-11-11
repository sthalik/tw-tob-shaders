// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 284 - fxc/glsl_SM_3_0_EditorDynamicGeometry.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_C0;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_C0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform editor_dynamic_geometry_VS
{
  vec4 data[4];
} cb1;

void main()
{
  vec4 r0;

/*0*/	r0.x = dot(vsIn_P0.xyzw, cb0.data[9].xyzw);
/*1*/	r0.y = dot(vsIn_P0.xyzw, cb0.data[10].xyzw);
/*2*/	r0.z = dot(vsIn_P0.xyzw, cb0.data[11].xyzw);
/*3*/	r0.w = dot(vsIn_P0.xyzw, cb0.data[12].xyzw);
/*4*/	gl_Position.xyzw = r0.xyzw;
/*5*/	vsOut_T4.xyzw = r0.xyzw;
/*6*/	r0.xyz = (-vsIn_P0.xyzx + cb0.data[0].xyzx).xyz;
/*7*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*8*/	r0.w = inversesqrt(r0.w);
/*9*/	vsOut_T0.xyz = (r0.wwww * r0.xyzx).xyz;
/*10*/	vsOut_T1.xyzw = vsIn_P0.xyzw;
/*11*/	r0.x = dot(vec3(vsIn_T0.xyzx), vec3(vsIn_T0.xyzx));
/*12*/	r0.x = inversesqrt(r0.x);
/*13*/	r0.xyz = (r0.xxxx * vsIn_T0.xyzx).xyz;
/*14*/	vsOut_T2.x = dot(vec3(r0.xyzx), vec3(cb1.data[0].xyzx));
/*15*/	vsOut_T2.y = dot(vec3(r0.xyzx), vec3(cb1.data[1].xyzx));
/*16*/	vsOut_T2.z = dot(vec3(r0.xyzx), vec3(cb1.data[2].xyzx));
/*17*/	vsOut_T3.xy = (vsIn_T1.xyxx).xy;
/*18*/	vsOut_T5.x = dot(vsIn_P0.xyzw, cb0.data[1].xyzw);
/*19*/	vsOut_T5.y = dot(vsIn_P0.xyzw, cb0.data[2].xyzw);
/*20*/	vsOut_T5.z = dot(vsIn_P0.xyzw, cb0.data[3].xyzw);
/*21*/	vsOut_T5.w = dot(vsIn_P0.xyzw, cb0.data[4].xyzw);
/*22*/	vsOut_C0.xyzw = vsIn_C0.xyzw;
/*23*/	return;
}
