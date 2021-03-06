//
//
// Shader Model 4
// Fragment Shader
//
// id: 350 - fxc/glsl_SM_3_0_LenseFlare.hlsl_PS_ps30_flare_3.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;

uniform sampler2D lense_flare_3_sampler;

layout(std140) uniform lense_flare_PS
{
  vec4 data[2];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xy = (vsOut_T0.yxyy + cb0.data[0].zyzz).xy;
/*1*/	r0.xy = (r0.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*2*/	r0.xy = (r0.xyxx * vec4(-1.000000, 1.000000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*3*/	r0.xyzw = (texture(lense_flare_3_sampler, r0.xyxx.st)).xyzw;
/*4*/	color0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*5*/	return;
}
