//
//
// Shader Model 4
// Fragment Shader
//
// id: 1516 - fxc/glsl_SM_3_0_VirtualTexture.hlsl_PS_ps30_page_table_replace.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D page_table_sampler;

layout(std140) uniform cbPageTableReplace
{
  vec4 data[3];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (gl_FragCoord.xyxx * cb0.data[1].xyxx + cb0.data[1].zwzz).xy;
/*1*/	r0.xyzw = (textureLod(page_table_sampler, r0.xyxx.st, cb0.data[2].z)).xyzw;
/*2*/	r1.xy = (r0.xyxx + -cb0.data[2].xyxx).xy;
/*3*/	r1.xy = (uintBitsToFloat(uvec4(lessThan(abs(r1.xyxx), vec4(0.001000, 0.001000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*4*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*5*/	color0.xyzw = mix(r0.xyzw, cb0.data[0].xyzw, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))/**/;
/*6*/	return;
}
