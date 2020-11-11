// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3911 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_VisibilityShader.hlsl_VS_vs30_box_main.glsl
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
in vec4 vsIn_C0;
in vec4 vsIn_P2;
in vec4 vsIn_P3;

out vec4 vsOut_T0;
out vec4 vsOut_C0;

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

/*0*/	r0.xyz = (vsIn_P0.xyzx * vsIn_P3.xyzx).xyz;
/*1*/	r0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*2*/	r1.y = r0.y;
/*3*/	r2.x = sin(vsIn_P2.w); r3.x = cos(vsIn_P2.w);
/*4*/	r4.z = r2.x;
/*5*/	r4.y = r3.x;
/*6*/	r4.x = -r2.x;
/*7*/	r1.x = dot(vec2(r0.xzxx), vec2(r4.yzyy));
/*8*/	r2.x = dot(vec2(vsIn_P1.xzxx), vec2(r4.yzyy));
/*9*/	r1.z = dot(vec2(r0.xzxx), vec2(r4.xyxx));
/*10*/	r2.z = dot(vec2(vsIn_P1.xzxx), vec2(r4.xyxx));
/*11*/	r0.xyz = (r1.xyzx + vsIn_P2.xyzx).xyz;
/*12*/	r0.w = vsIn_P0.w;
/*13*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*14*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*15*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*16*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*17*/	r2.y = vsIn_P1.y;
/*18*/	r0.x = dot(vec3(r2.xyzx), vec3(r0.xyzx));
/*19*/	r2.w = -r0.x;
/*20*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*21*/	r0.x = sqrt(r0.x);
/*22*/	vsOut_T0.xyzw = r2.xyzw / r0.xxxx;
/*23*/	vsOut_C0.xyzw = vsIn_C0.zyxw;
/*24*/	return;
}
