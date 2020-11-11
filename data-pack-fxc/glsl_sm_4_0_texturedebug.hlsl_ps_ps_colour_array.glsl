//
//
// Shader Model 4
// Fragment Shader
//
// id: 3945 - fxc/glsl_SM_4_0_TextureDebug.hlsl_PS_ps_colour_array.glsl
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

uniform sampler2DArray g_debug_texture_array;

layout(std140) uniform cbTextureDebug
{
  vec4 data[3];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xyzw = vec4(intBitsToFloat(textureSize(g_debug_texture_array, 0)), 1.f);
/*1*/	r0.xy = (floatBitsToUint(r0.xyxx)).xy;
/*2*/	r0.zw = (vsOut_T0.xxxy * vec4(0.000000, 0.000000, 1.000000, -1.000000) + vec4(0.000000, 0.000000, 0.000000, 1.000000)).zw;
/*3*/	r0.xy = (r0.xyxx * r0.zwzz).xy;
/*4*/	r0.xy = (uintBitsToFloat(uvec4(r0.xyxx))).xy;
/*5*/	r0.z = intBitsToFloat(int(cb0.data[1].x));
/*6*/	r0.w = 0;
/*7*/	color0.xyzw = texelFetch(g_debug_texture_array, floatBitsToInt(r0.xyzw).stp, floatBitsToInt(r0.xyzw).a).xyzw;
/*8*/	return;
}
