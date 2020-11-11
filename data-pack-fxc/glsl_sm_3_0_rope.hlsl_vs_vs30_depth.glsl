// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1378 - fxc/glsl_SM_3_0_rope.hlsl_VS_vs30_depth.glsl
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

out vec4 vsOut_T0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyz = (-vsIn_P0.zxyz + cb0.data[0].zxyz).xyz;
/*1*/	r1.xyz = (r0.xyzx * vsIn_N0.yzxy).xyz;
/*2*/	r0.xyz = (r0.zxyz * vsIn_N0.zxyz + -r1.xyzx).xyz;
/*3*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*4*/	r0.w = inversesqrt(r0.w);
/*5*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*6*/	r0.xyz = (r0.xyzx * vsIn_T1.xxxx + vsIn_P0.xyzx).xyz;
/*7*/	r0.w = 1.000000;
/*8*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*9*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*10*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*11*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*12*/	vsOut_T0.xyzw = r0.xyzw;
/*13*/	return;
}
