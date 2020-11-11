// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3935 - fxc/glsl_SM_3_0_RigidCampaignVegetation.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_P1;

out vec4 vsOut_T0;
out vec4 vsOut_T1;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyzw = -vsIn_P1.yxyz + cb0.data[0].yxyz;
/*1*/	r0.y = dot(vec3(r0.yzwy), vec3(r0.yzwy));
/*2*/	r0.y = inversesqrt(r0.y);
/*3*/	r0.y = r0.y * r0.z;
/*4*/	r0.xy = (max(r0.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xy;
/*5*/	r0.y = r0.y * r0.y;
/*6*/	r0.y = r0.y * 0.450000;
/*7*/	r0.x = r0.x * r0.y;
/*8*/	r0.x = r0.x * 0.022500;
/*9*/	r0.x = sin(r0.x); r1.x = cos(r0.x);
/*10*/	r1.y = -r0.x;
/*11*/	r0.yzw = (vsIn_P0.xxyz * vec4(0.000000, 0.400000, 0.400000, 0.400000)).yzw;
/*12*/	r2.y = dot(vec2(r0.zwzz), vec2(r1.xyxx));
/*13*/	vsOut_T1.y = dot(vec2(vsIn_N0.yzyy), vec2(r1.xyxx));
/*14*/	r3.x = sin(vsIn_P1.w); r4.x = cos(vsIn_P1.w);
/*15*/	r4.y = r0.x * r3.x;
/*16*/	r4.z = r1.x * r3.x;
/*17*/	r2.x = dot(vec3(r0.yzwy), vec3(r4.xyzx));
/*18*/	vsOut_T1.x = dot(vec3(vsIn_N0.xyzx), vec3(r4.xyzx));
/*19*/	r5.y = r0.x * r4.x;
/*20*/	r5.z = r1.x * r4.x;
/*21*/	r5.x = -r3.x;
/*22*/	r2.z = dot(vec3(r0.yzwy), vec3(r5.xyzx));
/*23*/	vsOut_T1.z = dot(vec3(vsIn_N0.xyzx), vec3(r5.xyzx));
/*24*/	r0.xyz = (r2.xyzx + vsIn_P1.xyzx).xyz;
/*25*/	r0.w = 1.000000;
/*26*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*27*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*28*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*29*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*30*/	vsOut_T0.xyz = (r0.xyzx).xyz;
/*31*/	vsOut_T0.w = vsIn_P0.w;
/*32*/	vsOut_T1.w = vsIn_N0.w;
/*33*/	return;
}
