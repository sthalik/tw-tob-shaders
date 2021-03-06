//
//
// Shader Model 4
// Fragment Shader
//
// id: 333 - fxc/glsl_SM_3_0_indicator.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C0;

layout(location = 0) out vec4 color0;

uniform sampler2D indicator_texture_sampler;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyzw = (texture(indicator_texture_sampler, vsOut_T0.xyxx.st)).xyzw;
/*1*/	r1.x = r0.w * vsOut_C0.w + -0.003922;
/*2*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*3*/	color0.xyzw = r0.xyzw;
/*4*/	r0.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*5*/	if(r0.x != 0) discard;
/*6*/	return;
}
