//
//
// Shader Model 4
// Fragment Shader
//
// id: 1419 - fxc/glsl_SM_3_0_skydome.hlsl_PS_ps30_gbuffer_skygen.glsl
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
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;

/*0*/	color0.xyzw = vec4(0, 0, 0, 0);
/*1*/	r0.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*2*/	r0.w = max(r0.y, 0.000000);
/*3*/	r0.xyzw = (texture(s_sky, r0.xwzx.stp)).xyzw;
/*4*/	color1.xyz = saturate(r0.xyzx).xyz;
/*5*/	color1.w = 0;
/*6*/	color2.xyzw = vec4(0, 0, 0, 0);
/*7*/	color3.xyzw = vec4(0, 0, 0, 0);
/*8*/	return;
}
