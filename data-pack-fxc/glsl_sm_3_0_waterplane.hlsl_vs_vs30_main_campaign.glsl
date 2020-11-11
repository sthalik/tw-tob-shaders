// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 6652 - fxc/glsl_SM_3_0_waterplane.hlsl_VS_vs30_main_campaign.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T3;
out vec4 vsOut_T4;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform waterplane_VS
{
  vec4 data[8];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyz = (vsIn_P0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, cb1.data[1].xyzw);
/*3*/	r1.y = r1.x + -0.010000;
/*4*/	r1.w = dot(r0.xyzw, cb1.data[3].xyzw);
/*5*/	r1.x = dot(r0.xyzw, cb1.data[0].xyzw);
/*6*/	r1.z = dot(r0.xyzw, cb1.data[2].xyzw);
/*7*/	gl_Position.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*8*/	gl_Position.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*9*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*10*/	gl_Position.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*11*/	vsOut_T3.xyzw = r1.xyzw;
/*12*/	r0.xyzw = r1.xzxz * vec4(0.010000, 0.010000, 0.010000, 0.010000);
/*13*/	r2.xyzw = cb0.data[26].xxxx * vec4(0.000000, -0.005000, -0.020000, 0.000000) + r0.zwzw;
/*14*/	r0.xyzw = cb0.data[26].xxxx * vec4(0.000000, 0.010000, 0.005000, 0.000000) + r0.xyzw;
/*15*/	r2.xy = (r2.xyxx + vec4(0.400000, 0.400000, 0.000000, 0.000000)).xy;
/*16*/	vsOut_T0.xyzw = r2.xyzw + r2.xyzw;
/*17*/	r0.xy = (r0.xyxx + vec4(0.400000, 0.400000, 0.000000, 0.000000)).xy;
/*18*/	vsOut_T1.xyzw = r0.xyzw + r0.xyzw;
/*19*/	r1.w = 1.000000;
/*20*/	vsOut_T4.x = dot(r1.xyzw, cb1.data[4].xyzw);
/*21*/	vsOut_T4.y = dot(r1.xyzw, cb1.data[5].xyzw);
/*22*/	vsOut_T4.z = dot(r1.xyzw, cb1.data[6].xyzw);
/*23*/	vsOut_T4.w = dot(r1.xyzw, cb1.data[7].xyzw);
/*24*/	return;
}
