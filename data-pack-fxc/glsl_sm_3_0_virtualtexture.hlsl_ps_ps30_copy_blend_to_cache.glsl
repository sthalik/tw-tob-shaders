//
//
// Shader Model 4
// Fragment Shader
//
// id: 1512 - fxc/glsl_SM_3_0_VirtualTexture.hlsl_PS_ps30_copy_blend_to_cache.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D land_albedo_sampler;
uniform sampler2D land_normal_sampler;

layout(std140) uniform cbCopyBlendToCache
{
  vec4 data[5];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.y = -gl_FragCoord.y + cb0.data[4].x;
/*1*/	r0.x = gl_FragCoord.x;
/*2*/	r0.xy = (r0.xyxx + -cb0.data[1].xxxx).xy;
/*3*/	r0.xy = (r0.xyxx + -cb0.data[0].xyxx).xy;
/*4*/	r0.xy = (r0.xyxx * cb0.data[0].zwzz).xy;
/*5*/	r1.xyzw = (texture(land_albedo_sampler, r0.xyxx.st)).xyzw;
/*6*/	r0.xyzw = (texture(land_normal_sampler, r0.xyxx.st)).xyzw;
/*7*/	color0.xyz = (r1.xyzx / r1.wwww).xyz;
/*8*/	color0.w = r1.w;
/*9*/	r0.xyz = (r0.xyzx / r1.wwww).xyz;
/*10*/	color1.w = r0.w;
/*11*/	r0.xyz = (r0.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*12*/	color1.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*13*/	return;
}
