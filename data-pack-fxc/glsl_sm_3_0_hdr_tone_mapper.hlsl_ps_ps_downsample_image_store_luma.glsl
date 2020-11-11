//
//
// Shader Model 4
// Fragment Shader
//
// id: 3860 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_downsample_image_store_luma.glsl
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

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform render_target_dims_buffer
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xy = (cb1.data[0].yxyy * vec4(0.250000, 0.250000, 0.000000, 0.000000)).xy;
/*1*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*2*/	r1.zw = (r0.wwwz * cb1.data[0].yyyx + r0.xxxy).zw;
/*3*/	r1.xy = (r0.zwzz * cb1.data[0].xyxx + -r0.yxyy).xy;
/*4*/	r0.yz = (r0.wwzw * cb1.data[0].yyxy).yz;
/*5*/	r0.xw = (r1.zzzx).xw;
/*6*/	r2.xyzw = (texture(g_hdr_rgb_texture_sampler, r0.zxzz.st)).xyzw;
/*7*/	r3.xyzw = (texture(g_hdr_rgb_texture_sampler, r0.wyww.st)).xyzw;
/*8*/	r4.xyzw = (texture(g_hdr_rgb_texture_sampler, r1.xzxx.st)).xyzw;
/*9*/	r2.xyz = (r2.xyzx + r4.xyzx).xyz;
/*10*/	r4.xyzw = (texture(g_hdr_rgb_texture_sampler, r1.wzww.st)).xyzw;
/*11*/	r2.xyz = (r2.xyzx + r4.xyzx).xyz;
/*12*/	r2.xyz = (r3.xyzx + r2.xyzx).xyz;
/*13*/	r3.xyzw = (texture(g_hdr_rgb_texture_sampler, r0.zyzz.st)).xyzw;
/*14*/	r2.xyz = (r2.xyzx + r3.xyzx).xyz;
/*15*/	r0.xw = (r1.wwwy).xw;
/*16*/	r3.xyzw = (texture(g_hdr_rgb_texture_sampler, r1.wyww.st)).xyzw;
/*17*/	r1.xyzw = (texture(g_hdr_rgb_texture_sampler, r1.xyxx.st)).xyzw;
/*18*/	r4.xyzw = (texture(g_hdr_rgb_texture_sampler, r0.xyxx.st)).xyzw;
/*19*/	r0.xyzw = (texture(g_hdr_rgb_texture_sampler, r0.zwzz.st)).xyzw;
/*20*/	r2.xyz = (r2.xyzx + r4.xyzx).xyz;
/*21*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*22*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*23*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*24*/	r0.xyz = (r0.xyzx * vec4(0.111111, 0.111111, 0.111111, 0.000000)).xyz;
/*25*/	color0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*26*/	color0.xyz = (r0.xyzx).xyz;
/*27*/	return;
}
