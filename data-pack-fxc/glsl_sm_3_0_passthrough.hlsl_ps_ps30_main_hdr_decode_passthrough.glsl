//
//
// Shader Model 4
// Fragment Shader
//
// id: 401 - fxc/glsl_SM_3_0_passthrough.hlsl_PS_ps30_main_hdr_decode_passthrough.glsl
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

uniform sampler2D input_sampler;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform passthrough_PS
{
  vec4 data[5];
} cb1;

void main()
{
  vec4 r0;

/*0*/	r0.xy = (vsOut_T0.xyxx + cb1.data[0].xyxx).xy;
/*1*/	r0.xyzw = (texture(input_sampler, r0.xyxx.st)).xyzw;
/*2*/	color0.w = r0.w;
/*3*/	r0.xyz = saturate(r0.xyzx).xyz;
/*4*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*5*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*6*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*7*/	r0.w = 1.000000;
/*8*/	color0.x = dot(r0.xyzw, cb1.data[1].xyzw);
/*9*/	color0.y = dot(r0.xyzw, cb1.data[2].xyzw);
/*10*/	color0.z = dot(r0.xyzw, cb1.data[3].xyzw);
/*11*/	return;
}
