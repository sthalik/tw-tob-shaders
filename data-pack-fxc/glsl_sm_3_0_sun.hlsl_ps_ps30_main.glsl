//
//
// Shader Model 4
// Fragment Shader
//
// id: 1526 - fxc/glsl_SM_3_0_sun.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse;

layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xyzw = (texture(s_diffuse, vsOut_T0.xyxx.st)).xyzw;
/*1*/	color0.xyz = (r0.xyzx * cb0.data[1].xyzx).xyz;
/*2*/	color0.w = r0.w;
/*3*/	return;
}
