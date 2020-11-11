// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3913 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_VisibilityShader.hlsl_VS_vs30_billboard_main.glsl
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
in vec4 vsIn_C0;
in vec4 vsIn_T0;

out vec4 vsOut_T0;
out vec4 vsOut_C0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform visibility_VS
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.y = 0;
/*1*/	r0.w = vsIn_P1.x * vsIn_T0.x;
/*2*/	r1.xyz = (vsIn_P0.xyzx + -cb0.data[0].xyzx).xyz;
/*3*/	r1.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*4*/	r1.w = inversesqrt(r1.w);
/*5*/	r2.xzw = (r1.wwww * r1.xxzx).xzw;
/*6*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*7*/	r1.x = sqrt(r1.x);
/*8*/	r1.x = uintBitsToFloat((r1.x < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*9*/	r0.x = r0.w * r2.z;
/*10*/	r0.z = r0.w * -r2.w;
/*11*/	r0.xyz = (r0.xyzx + vsIn_P0.xyzx).xyz;
/*12*/	r0.w = vsIn_P2.x * vsIn_T0.y;
/*13*/	r0.xyz = (r0.wwww * vec4(0.000000, 1.000000, 0.000000, 0.000000) + r0.xyzx).xyz;
/*14*/	r0.xyz = (mix(cb0.data[0].xyzx, r0.xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz/**/;
/*15*/	r0.w = vsIn_P0.w;
/*16*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*17*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*18*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*19*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*20*/	r0.x = dot(vec2(-r2.xzxx), vec2(r0.xzxx));
/*21*/	r2.w = -r0.x;
/*22*/	r0.x = dot(vec2(-r2.xzxx), vec2(-r2.xzxx));
/*23*/	r0.x = sqrt(r0.x);
/*24*/	r2.y = 0;
/*25*/	r2.xyz = (-r2.xyzx).xyz;
/*26*/	vsOut_T0.xyzw = r2.xyzw / r0.xxxx;
/*27*/	vsOut_C0.xyzw = vsIn_C0.zyxw;
/*28*/	return;
}
