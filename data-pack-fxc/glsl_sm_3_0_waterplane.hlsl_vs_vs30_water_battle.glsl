// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 7804 - fxc/glsl_SM_3_0_waterplane.hlsl_VS_vs30_water_battle.glsl
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

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T3;
out vec4 vsOut_T4;

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
/*2*/	r1.y = dot(r0.xyzw, vsIn_P2.xyzw);
/*3*/	r1.w = 1.000000;
/*4*/	r1.x = dot(r0.xyzw, vsIn_P1.xyzw);
/*5*/	r1.z = dot(r0.xyzw, vsIn_P3.xyzw);
/*6*/	r0.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*7*/	gl_Position.w = r0.x;
/*8*/	vsOut_T3.w = r0.x;
/*9*/	gl_Position.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*10*/	gl_Position.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*11*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*12*/	vsOut_T4.xyzw = r1.xyzw;
/*13*/	vsOut_T3.xyz = (r1.xyzx).xyz;
/*14*/	r0.xyzw = r1.xzxz * vec4(0.010000, 0.010000, 0.010000, 0.010000);
/*15*/	r1.xyzw = cb0.data[26].xxxx * vec4(0.000000, -0.003750, -0.015000, 0.000000) + r0.zwzw;
/*16*/	r0.xyzw = cb0.data[26].xxxx * vec4(0.000000, 0.007500, 0.003750, 0.000000) + r0.xyzw;
/*17*/	r1.xy = (r1.xyxx + vec4(0.400000, 0.400000, 0.000000, 0.000000)).xy;
/*18*/	vsOut_T0.xyzw = r1.xyzw + r1.xyzw;
/*19*/	r0.xy = (r0.xyxx + vec4(0.400000, 0.400000, 0.000000, 0.000000)).xy;
/*20*/	vsOut_T1.xyzw = r0.xyzw + r0.xyzw;
/*21*/	return;
}
