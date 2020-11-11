//
//
// Shader Model 4
// Fragment Shader
//
// id: 786 - fxc/glsl_SM_3_0_rigidterrainblend.hlsl_PS_ps30_geom.glsl
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

void main()
{
  color0 = vec4(0);
/*0*/	color0.x = vsOut_T0.x;
/*1*/	return;
}
