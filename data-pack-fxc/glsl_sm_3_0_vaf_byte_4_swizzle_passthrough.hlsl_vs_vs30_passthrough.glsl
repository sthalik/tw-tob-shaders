// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 402 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_passthrough.hlsl_VS_vs30_passthrough.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_C0;

out vec4 vsOut_C0;
out vec4 vsOut_T0;

layout(std140) uniform passthrough_VS
{
  vec4 data[1];
} cb0;

void main()
{
  vec4 r0;

/*0*/	gl_Position.xyz = (vsIn_P0.xyzx).xyz;
/*1*/	gl_Position.w = 1.000000;
/*2*/	vsOut_C0.xyzw = vsIn_C0.xxxx;
/*3*/	r0.xy = (vsIn_P0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.x = r0.x * cb0.data[0].x;
/*5*/	r0.y = -r0.y * 0.500000 + 1.000000;
/*6*/	vsOut_T0.y = r0.y * cb0.data[0].y;
/*7*/	vsOut_T0.x = r0.x * 0.500000;
/*8*/	return;
}
