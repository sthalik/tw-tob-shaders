// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 592 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigiddebuggeometry.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_N0;
in vec4 vsIn_C0;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T5;
out vec4 vsOut_T6;
out vec4 vsOut_T7;
out vec4 vsOut_C0;
out vec4 vsOut_C1;

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
/*6*/	r0.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*7*/	r0.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*8*/	r0.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*9*/	r0.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*10*/	gl_Position.xyzw = r0.xyzw;
/*11*/	vsOut_T7.xyzw = r0.xyzw;
/*12*/	vsOut_T6.xyz = (r0.xywx).xyz;
/*13*/	vsOut_T0.xyzw = r1.xyzw;
/*14*/	r0.x = dot(vec3(vsIn_N0.xyzx), vec3(vsIn_P1.xyzx));
/*15*/	r0.y = dot(vec3(vsIn_N0.xyzx), vec3(vsIn_P2.xyzx));
/*16*/	r0.z = dot(vec3(vsIn_N0.xyzx), vec3(vsIn_P3.xyzx));
/*17*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*18*/	r0.w = inversesqrt(r0.w);
/*19*/	vsOut_T1.xyz = (r0.wwww * r0.xyzx).xyz;
/*20*/	vsOut_T5.xyzw = vsIn_P4.xyzw;
/*21*/	vsOut_C0.x = dot(r1.xyzw, cb0.data[1].xyzw);
/*22*/	vsOut_C0.y = dot(r1.xyzw, cb0.data[2].xyzw);
/*23*/	vsOut_C0.z = dot(r1.xyzw, cb0.data[3].xyzw);
/*24*/	vsOut_C0.w = dot(r1.xyzw, cb0.data[4].xyzw);
/*25*/	vsOut_C1.xyzw = vsIn_C0.zyxw;
/*26*/	return;
}
