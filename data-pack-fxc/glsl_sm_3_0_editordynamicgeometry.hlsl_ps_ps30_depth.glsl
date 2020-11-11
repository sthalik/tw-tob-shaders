//
//
// Shader Model 4
// Fragment Shader
//
// id: 280 - fxc/glsl_SM_3_0_EditorDynamicGeometry.hlsl_PS_ps30_depth.glsl
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

void main()
{
  vec4 r0;

/*0*/	r0.xyzw = (texture(s_diffuse, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.x = r0.w + -0.501961;
/*2*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.x != 0) discard;
/*4*/	color0.x = vsOut_T0.z / vsOut_T0.w;
/*5*/	color0.yzw = (vec4(0, 0, 0, 1.000000)).yzw;
/*6*/	return;
}
