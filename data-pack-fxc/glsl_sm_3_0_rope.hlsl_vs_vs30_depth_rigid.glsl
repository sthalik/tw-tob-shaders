// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1380 - fxc/glsl_SM_3_0_rope.hlsl_VS_vs30_depth_rigid.glsl
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
in vec4 vsIn_T1;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;

out vec4 vsOut_T0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = dot(vec3(vsIn_N0.xyzx), vec3(vsIn_N0.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsIn_N0.xyzx).xyz;
/*3*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*4*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*5*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*6*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*7*/	r0.x = inversesqrt(r0.x);
/*8*/	r0.xyz = (r0.xxxx * r1.xyzx).xyz;
/*9*/	r1.y = dot(vec3(r0.xyzx), vec3(cb0.data[1].xyzx));
/*10*/	r1.z = dot(vec3(r0.xyzx), vec3(cb0.data[2].xyzx));
/*11*/	r0.x = dot(vec2(r1.yzyy), vec2(r1.yzyy));
/*12*/	r0.x = inversesqrt(r0.x);
/*13*/	r0.yz = (r0.xxxx * r1.yyzy).yz;
/*14*/	r1.xz = (r0.zzyz * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xz;
/*15*/	r1.yw = (vec4(0, 0, 0, 1.000000)).yw;
/*16*/	r0.xyz = (-r0.xyzx * vec4(0.000000, 1.000000, 0.000000, 0.000000) + r1.xyzx).xyz;
/*17*/	r0.w = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*18*/	r0.w = inversesqrt(r0.w);
/*19*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*20*/	r0.xyz = (r0.xyzx * vsIn_T1.xxxx).xyz;
/*21*/	r1.x = vsIn_P1.x;
/*22*/	r1.y = vsIn_P2.x;
/*23*/	r1.z = vsIn_P3.x;
/*24*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*25*/	r0.w = sqrt(r0.w);
/*26*/	r1.xyz = (vsIn_P0.xyzx).xyz;
/*27*/	r2.x = dot(r1.xyzw, vsIn_P1.xyzw);
/*28*/	r2.y = dot(r1.xyzw, vsIn_P2.xyzw);
/*29*/	r2.z = dot(r1.xyzw, vsIn_P3.xyzw);
/*30*/	r2.w = 1.000000;
/*31*/	r1.x = dot(r2.xyzw, cb0.data[1].xyzw);
/*32*/	r1.y = dot(r2.xyzw, cb0.data[2].xyzw);
/*33*/	r1.z = dot(r2.xyzw, cb0.data[3].xyzw);
/*34*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*35*/	r0.w = dot(r2.xyzw, cb0.data[4].xyzw);
/*36*/	vsOut_T0.xyzw = r2.xyzw;
/*37*/	gl_Position.x = dot(r0.xyzw, cb0.data[5].xyzw);
/*38*/	gl_Position.y = dot(r0.xyzw, cb0.data[6].xyzw);
/*39*/	gl_Position.z = dot(r0.xyzw, cb0.data[7].xyzw);
/*40*/	gl_Position.w = dot(r0.xyzw, cb0.data[8].xyzw);
/*41*/	return;
}
