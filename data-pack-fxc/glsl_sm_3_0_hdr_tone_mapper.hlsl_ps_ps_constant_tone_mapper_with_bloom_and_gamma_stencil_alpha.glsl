//
//
// Shader Model 4
// Fragment Shader
//
// id: 196 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_constant_tone_mapper_with_bloom_and_gamma_stencil_alpha.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D g_hdr_rgb_texture_sampler;
uniform sampler2D g_hdr_rgb_bloom_texture_sampler;
uniform sampler2D g_scurve_texture_sampler;
uniform sampler2D g_stencil_texture;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb1;
layout(std140) uniform constant_tone_mapping_buffer
{
  vec4 data[2];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(g_hdr_rgb_texture_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*3*/	r0.xyzw = (textureLod(g_hdr_rgb_bloom_texture_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*4*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*5*/	r1.w = -cb2.data[0].x + cb2.data[0].y;
/*6*/	r2.x = r1.w * -0.340000 + cb2.data[0].y;
/*7*/	r2.y = r2.x / r0.w;
/*8*/	r0.w = uintBitsToFloat((r2.x < r0.w) ? 0xffffffffu : 0x00000000u);
/*9*/	r2.xyz = (r1.xyzx * r2.yyyy).xyz;
/*10*/	r1.xyz = (mix(r1.xyzx, r2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*11*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*12*/	r0.w = max(r0.y, r0.x);
/*13*/	r0.w = max(r0.z, r0.w);
/*14*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*15*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*16*/	r0.w = r0.w + -cb2.data[0].x;
/*17*/	r0.w = r0.w / r1.w;
/*18*/	r0.w = r0.w + -1.000000;
/*19*/	r0.w = saturate(r0.w * 1.176471);
/*20*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*21*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*22*/	r1.x = max(r0.w, cb2.data[0].x);
/*23*/	r1.x = min(r1.x, cb2.data[0].y);
/*24*/	r1.x = r1.x + -cb2.data[0].x;
/*25*/	r1.x = r1.x / r1.w;
/*26*/	r1.y = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*27*/	r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*28*/	r0.w = (floatBitsToUint(r1.y) > 0x00000000u) ? r0.w : 1.000000;
/*29*/	r0.w = r0.w * r1.x;
/*30*/	r0.xyz = saturate(r0.wwww * r0.xyzx).xyz;
/*31*/	r0.w = 0.500000;
/*32*/	r1.xyzw = (texture(g_scurve_texture_sampler, r0.xwxx.st)).xyzw;
/*33*/	r1.x = saturate(r1.x);
/*34*/	r2.xyzw = (texture(g_scurve_texture_sampler, r0.ywyy.st)).xyzw;
/*35*/	r0.xyzw = (texture(g_scurve_texture_sampler, r0.zwzz.st)).xyzw;
/*36*/	r1.z = saturate(r0.z);
/*37*/	r1.y = saturate(r2.y);
/*38*/	r0.xyz = (log2(r1.xyzx)).xyz;
/*39*/	r0.xyz = (r0.xyzx * cb1.data[0].zzzz).xyz;
/*40*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*41*/	r0.xy = (intBitsToFloat(ivec4(gl_FragCoord.xyxx))).xy;
/*42*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*43*/	r0.xyzw = texelFetch(g_stencil_texture, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw;
/*44*/	color0.w = r0.x;
/*45*/	return;
}
