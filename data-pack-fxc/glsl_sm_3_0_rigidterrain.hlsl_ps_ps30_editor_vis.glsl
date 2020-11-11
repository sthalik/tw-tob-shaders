//
//
// Shader Model 4
// Fragment Shader
//
// id: 1453 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_editor_vis.glsl
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

uniform sampler2D s_editor_vis;

layout(std140) uniform ps_editor_vis_cb
{
  vec4 data[1];
} cb0;

void main()
{
  color0 = vec4(0);
  vec4 r0;

/*0*/	r0.xy = (vsOut_T0.xzxx + cb0.data[0].zzzz).xy;
/*1*/	r0.zw = (cb0.data[0].zzzz * cb0.data[0].xxxy).zw;
/*2*/	r0.xy = (r0.xyxx / r0.zwzz).xy;
/*3*/	r0.xyzw = (texture(s_editor_vis, r0.xyxx.st)).xyzw;
/*4*/	color0.xyz = (r0.xyzx).xyz;
/*5*/	color0.w = 1.000000;
/*6*/	return;
}
