//
//
// Shader Model 4
// Fragment Shader
//
// id: 81 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_a.glsl
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

void main()
{
color0 = vec4(0);
  vec4 r0;

/*0*/	r0.x = vsOut_T0.y + -0.003922;
/*1*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*2*/	if(r0.x != 0) discard;
/*3*/	color0.xyz = (vsOut_C0.xyzx).xyz;
/*4*/	color0.w = vsOut_T0.y;
/*5*/	return;
}
