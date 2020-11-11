//
//
// Shader Model 4
// Fragment Shader
//
// id: 274 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_DirectionalLight.hlsl_PS_ps30_ulm_lowdef.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_2_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  color0 = vec4(0);
  vec4 r0;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r0.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.xyxx.st, r0.y)).xyzw;
/*3*/	color0.xyz = saturate(r0.xyzx).xyz;
/*4*/	color0.w = 0;
/*5*/	return;
}
