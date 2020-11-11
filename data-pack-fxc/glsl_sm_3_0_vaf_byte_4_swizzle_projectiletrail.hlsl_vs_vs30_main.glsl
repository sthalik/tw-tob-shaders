// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 441 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_projectiletrail.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;
in vec4 vsIn_T4;
in vec4 vsIn_T5;
in vec4 vsIn_T6;

out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T4;
out vec4 vsOut_T5;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyz = (-vsIn_P0.xyzx + cb0.data[0].xyzx).xyz;
/*1*/	r1.xyz = (r0.zxyz * vsIn_N0.yzxy).xyz;
/*2*/	r1.xyz = (r0.yzxy * vsIn_N0.zxyz + -r1.xyzx).xyz;
/*3*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*4*/	r0.x = sqrt(r0.x);
/*5*/	r0.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*6*/	r0.y = inversesqrt(r0.y);
/*7*/	r0.yzw = (r0.yyyy * r1.xxyz).yzw;
/*8*/	r1.x = min(r0.x, vsIn_T3.x);
/*9*/	r1.x = vsIn_T0.x / r1.x;
/*10*/	r1.x = r0.x * r1.x;
/*11*/	vsOut_T0.z = r0.x;
/*12*/	r0.x = -vsIn_T1.x + 1.000000;
/*13*/	r0.x = r0.x * r1.x;
/*14*/	r0.x = r0.x * 0.250000;
/*15*/	r0.xyz = (r0.xxxx * r0.yzwy).xyz;
/*16*/	r0.xyz = (r0.xyzx * vsIn_T2.xxxx + vsIn_P0.xyzx).xyz;
/*17*/	r0.w = vsIn_P0.w;
/*18*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*19*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*20*/	r1.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*21*/	r1.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*22*/	gl_Position.xyzw = r1.xyzw;
/*23*/	vsOut_T4.xyzw = r1.xyzw;
/*24*/	r0.x = -vsIn_T1.x * 20.000000 + 1.000000;
/*25*/	r0.x = r0.x * -vsIn_C0.w + vsIn_C0.w;
/*26*/	r0.y = vsIn_T1.x * -vsIn_C0.w + vsIn_C0.w;
/*27*/	vsOut_C0.w = r0.x * r0.y;
/*28*/	vsOut_C0.xyz = (vsIn_C0.zyxz).xyz;
/*29*/	vsOut_T0.x = vsIn_T2.x;
/*30*/	vsOut_T0.y = vsIn_T4.x;
/*31*/	vsOut_T0.w = vsIn_T1.x;
/*32*/	vsOut_T5.x = vsIn_T5.x;
/*33*/	vsOut_T5.y = vsIn_T6.x;
/*34*/	return;
}
