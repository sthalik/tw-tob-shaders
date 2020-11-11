// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 3946 - fxc/glsl_SM_4_0_VAF_BYTE_4_SWIZZLE_TextureDebug.hlsl_VS_vs_quad_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_T0;

out vec4 vsOut_T0;

layout(std140) uniform cbTextureDebug
{
  vec4 data[3];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xy = (vsIn_P0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[0].zwzz).xy;
/*2*/	r0.xy = (r0.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000) + cb0.data[0].xyxx).xy;
/*3*/	gl_Position.x = r0.x * 2.000000 + -1.000000;
/*4*/	gl_Position.y = -r0.y * 2.000000 + 1.000000;
/*5*/	gl_Position.zw = (vec4(0, 0, 0, 1.000000)).zw;
/*6*/	vsOut_T0.xy = (vsIn_T0.xyxx * vec4(1.000000, -1.000000, 0.000000, 0.000000) + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xy;
/*7*/	return;
}
