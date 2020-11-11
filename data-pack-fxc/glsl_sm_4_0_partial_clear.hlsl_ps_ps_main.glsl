//
//
// Shader Model 4
// Fragment Shader
//
// id: 264 - fxc/glsl_SM_4_0_partial_clear.hlsl_PS_ps_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

layout(std140) uniform clear_PS
{
  vec4 data[2];
} cb0;

void main()
{
/*0*/	color0.xyzw = cb0.data[0].xyzw/**/;
/*1*/	gl_FragDepth = (cb0.data[1].x)/**/;
/*2*/	return;
}
