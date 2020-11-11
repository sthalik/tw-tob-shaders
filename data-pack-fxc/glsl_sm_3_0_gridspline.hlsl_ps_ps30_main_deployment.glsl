//
//
// Shader Model 4
// Fragment Shader
//
// id: 291 - fxc/glsl_SM_3_0_gridspline.hlsl_PS_ps30_main_deployment.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform grid_spline_PS
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (-vsOut_T1.xzxx + cb0.data[0].xzxx).xy;
/*1*/	r0.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*2*/	r0.x = sqrt(r0.x);
/*3*/	r0.x = -r0.x * 0.000500 + 1.000000;
/*4*/	r0.x = max(r0.x, 0.000000);
/*5*/	r1.xyzw = (texture(s_diffuse, vsOut_T0.xyxx.st)).xyzw;
/*6*/	color0.w = r0.x * r1.w;
/*7*/	color0.xyz = (cb1.data[0].xyzx * vec4(20.000000, 20.000000, 20.000000, 0.000000)).xyz;
/*8*/	return;
}
