// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 632 - fxc/glsl_SM_3_0_rigidriver.hlsl_VS_vs30_main_river.glsl
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
in vec4 vsIn_P4;
in vec4 vsIn_P5;

out vec4 vsOut_T0;
out vec4 vsOut_T2;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;
out vec4 vsOut_T1;
out vec4 vsOut_T7;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform river_CB
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xzw = (vec4(-0.000000, 0, -0.000000, 1.000000)).xzw;
/*1*/	r0.y = -cb1.data[0].w/**/;
/*2*/	r0.xyz = (r0.xyzx + vsIn_P0.xyzx).xyz;
/*3*/	r1.x = dot(r0.xyzw, vsIn_P2.xyzw);
/*4*/	r1.y = dot(r0.xyzw, vsIn_P4.xyzw);
/*5*/	r1.z = 1.000000;
/*6*/	r0.x = dot(vec3(r1.xyzx), vec3(cb0.data[12].xzwx));
/*7*/	gl_Position.w = r0.x;
/*8*/	vsOut_T0.w = r0.x;
/*9*/	gl_Position.x = dot(vec3(r1.xyzx), vec3(cb0.data[9].xzwx));
/*10*/	gl_Position.y = dot(vec3(r1.xyzx), vec3(cb0.data[10].xzwx));
/*11*/	gl_Position.z = dot(vec3(r1.xyzx), vec3(cb0.data[11].xzwx));
/*12*/	vsOut_T0.xz = (r1.xxyx).xz;
/*13*/	vsOut_T0.y = 0;
/*14*/	vsOut_T2.xyz = (vec4(0, 1.000000, 0, 0)).xyz;
/*15*/	vsOut_T4.xyzw = vsIn_P1.xyzw;
/*16*/	r0.xy = (vsIn_P1.xyxx * vec4(0.010000, 0.001000, 0.000000, 0.000000)).xy;
/*17*/	r0.z = uintBitsToFloat((vsIn_P5.x >= 1.000000) ? 0xffffffffu : 0x00000000u);
/*18*/	r1.xy = (-vsIn_P1.xyxx * vec4(0.010000, 0.001000, 0.000000, 0.000000) + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*19*/	vsOut_T5.xy = (mix(r0.xyxx, r1.xyxx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xy;
/*20*/	vsOut_T5.z = vsIn_P1.w;
/*21*/	vsOut_T5.w = vsIn_P0.w;
/*22*/	vsOut_T7.x = vsIn_P1.z;
/*23*/	vsOut_T7.y = vsIn_P0.w;
/*24*/	return;
}
