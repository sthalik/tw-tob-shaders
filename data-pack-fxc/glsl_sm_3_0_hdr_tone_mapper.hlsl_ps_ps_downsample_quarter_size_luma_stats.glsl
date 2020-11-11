//
//
// Shader Model 4
// Fragment Shader
//
// id: 3865 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_downsample_quarter_size_luma_stats.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D g_luma_stats_texture_sampler;

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

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb1.data[0].xxxy).zw;
/*2*/	r0.zw = (cb1.data[0].xxxy * vec4(0.000000, 0.000000, -0.250000, 0.250000) + r0.zzzw).zw;
/*3*/	r1.xyzw = (textureLod(g_luma_stats_texture_sampler, r0.zwzz.st, 0.000000)).xyzw;
/*4*/	r2.xyzw = cb1.data[0].xyxy * vec4(0.250000, 0.250000, 0.250000, -0.250000);
/*5*/	r3.xyzw = r0.xyxy * cb1.data[0].xyxy + r2.xyzw;
/*6*/	r0.xy = (r0.xyxx * cb1.data[0].xyxx + -r2.xyxx).xy;
/*7*/	r0.xyzw = (textureLod(g_luma_stats_texture_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*8*/	r2.xyzw = (textureLod(g_luma_stats_texture_sampler, r3.xyxx.st, 0.000000)).xyzw;
/*9*/	r3.xyzw = (textureLod(g_luma_stats_texture_sampler, r3.zwzz.st, 0.000000)).xyzw;
/*10*/	r2.z = r2.z + r3.z;
/*11*/	r1.z = r1.z + r2.z;
/*12*/	r0.z = r0.z + r1.z;
/*13*/	color0.z = r0.z * 0.250000;
/*14*/	r0.x = min(r0.x, r1.x);
/*15*/	r0.yz = (max(r0.yywy, r1.yywy)).yz;
/*16*/	r0.yz = (max(r0.yyzy, r3.yywy)).yz;
/*17*/	r0.x = min(r0.x, r3.x);
/*18*/	color0.x = min(r0.x, r2.x);
/*19*/	color0.yw = (max(r0.yyyz, r2.yyyw)).yw;
/*20*/	return;
}
