//
//
// Shader Model 4
// Fragment Shader
//
// id: 1544 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_particle_vfx_main.hlsl_PS_ps_shadowmap.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 gsOut_T2;

layout(location = 0) out vec4 color0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyz = (gsOut_T2.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*3*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*4*/	color0.x = r1.x / r0.x;
/*5*/	color0.yzw = (vec4(0, 0, 0, 1.000000)).yzw;
/*6*/	return;
}
