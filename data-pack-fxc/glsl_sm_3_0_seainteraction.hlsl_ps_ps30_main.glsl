//
//
// Shader Model 4
// Fragment Shader
//
// id: 1400 - fxc/glsl_SM_3_0_seainteraction.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_sampler;
uniform sampler2D s_diffuse2_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = cb0.data[26].x * -0.030000 + vsOut_T1.x;
/*1*/	r0.y = vsOut_T1.y;
/*2*/	r0.xyzw = (texture(s_diffuse2_sampler, r0.xyxx.st)).xyzw;
/*3*/	r1.x = cb0.data[26].x * -0.075000 + vsOut_C0.y;
/*4*/	r1.y = vsOut_C0.z;
/*5*/	r1.xyzw = (texture(s_diffuse_sampler, r1.xyxx.st)).xyzw;
/*6*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*7*/	r0.w = r0.w + r1.w;
/*8*/	color0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + r1.xyzx).xyz;
/*9*/	color0.w = r0.w * vsOut_C0.x;
/*10*/	return;
}
