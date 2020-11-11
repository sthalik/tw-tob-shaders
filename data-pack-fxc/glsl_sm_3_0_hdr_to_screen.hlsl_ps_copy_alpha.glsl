//
//
// Shader Model 4
// Fragment Shader
//
// id: 221 - fxc/glsl_SM_3_0_HDR_To_Screen.hlsl_PS_copy_alpha.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D frame_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xy = (gl_FragCoord.xyxx / cb0.data[27].xyxx).xy;
/*1*/	color0.xyzw = (textureLod(frame_sampler, r0.xyxx.st, r0.y)).xyzw;
/*2*/	return;
}
