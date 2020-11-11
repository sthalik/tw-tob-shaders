//
//
// Shader Model 4
// Fragment Shader
//
// id: 1514 - fxc/glsl_SM_3_0_VirtualTexture.hlsl_PS_ps30_copy_blend_with_coastline_to_cache.glsl
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

uniform sampler2D sea_albedo_sampler;
uniform sampler2D sea_normal_sampler;
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
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.y = -gl_FragCoord.y + cb0.data[4].x;
/*1*/	r0.x = gl_FragCoord.x;
/*2*/	r0.xy = (r0.xyxx + -cb0.data[1].xxxx).xy;
/*3*/	r0.xy = (r0.xyxx + -cb0.data[0].xyxx).xy;
/*4*/	r0.xy = (r0.xyxx * cb0.data[0].zwzz).xy;
/*5*/	r1.xyzw = (texture(sea_albedo_sampler, r0.xyxx.st)).xyzw;
/*6*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*7*/	r2.xyzw = (texture(land_albedo_sampler, r0.xyxx.st)).xyzw;
/*8*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*9*/	r0.z = uintBitsToFloat((r2.w != 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	color0.xyzw = mix(r1.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*11*/	r3.xyzw = (texture(sea_normal_sampler, r0.xyxx.st)).xyzw;
/*12*/	r4.xyzw = (texture(land_normal_sampler, r0.xyxx.st)).xyzw;
/*13*/	r3.xyz = (r3.xyzx / r1.wwww).xyz;
/*14*/	r4.xyz = (r4.xyzx / r2.wwww).xyz;
/*15*/	r0.xyzw = mix(r3.xyzw, r4.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*16*/	color1.xyzw = r0.xyzw * vec4(0.500000, 0.500000, 0.500000, 1.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000);
/*17*/	return;
}
