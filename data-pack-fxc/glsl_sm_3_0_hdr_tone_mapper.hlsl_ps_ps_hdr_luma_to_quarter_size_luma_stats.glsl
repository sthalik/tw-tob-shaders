//
//
// Shader Model 4
// Fragment Shader
//
// id: 3863 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_hdr_luma_to_quarter_size_luma_stats.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D g_luma_values_texture_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform luma_stats_buffer
{
  vec4 data[2];
} cb1;
layout(std140) uniform render_target_dims_buffer
{
  vec4 data[1];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb2.data[0].xxxy).zw;
/*2*/	r0.zw = (cb2.data[0].xxxy * vec4(0.000000, 0.000000, -0.250000, 0.250000) + r0.zzzw).zw;
/*3*/	r1.xyzw = (textureLod(g_luma_values_texture_sampler, r0.zwzz.st, 0.000000)).xyzw;
/*4*/	r2.xyzw = cb2.data[0].xyxy * vec4(0.250000, 0.250000, 0.250000, -0.250000);
/*5*/	r0.zw = (r0.xxxy * cb2.data[0].xxxy + -r2.xxxy).zw;
/*6*/	r2.xyzw = r0.xyxy * cb2.data[0].xyxy + r2.xyzw;
/*7*/	r0.xyzw = (textureLod(g_luma_values_texture_sampler, r0.zwzz.st, 0.000000)).xyzw;
/*8*/	r1.x = max(r0.w, r1.w);
/*9*/	r0.z = r1.w;
/*10*/	r3.xyzw = (textureLod(g_luma_values_texture_sampler, r2.zwzz.st, 0.000000)).xyzw;
/*11*/	r2.xyzw = (textureLod(g_luma_values_texture_sampler, r2.xyxx.st, 0.000000)).xyzw;
/*12*/	r1.x = max(r1.x, r3.w);
/*13*/	r0.y = r3.w;
/*14*/	color0.w = max(r1.x, r2.w);
/*15*/	r0.x = r2.w;
/*16*/	r0.xyzw = max(r0.xyzw, cb1.data[0].xxxx);
/*17*/	r0.xyzw = min(r0.xyzw, cb1.data[0].wwww);
/*18*/	r1.x = r0.y + r0.x;
/*19*/	r1.x = r0.z + r1.x;
/*20*/	r1.x = r0.w + r1.x;
/*21*/	color0.z = r1.x * 0.250000;
/*22*/	r1.x = min(r0.w, r0.z);
/*23*/	r1.x = min(r0.y, r1.x);
/*24*/	color0.x = min(r0.x, r1.x);
/*25*/	r0.z = max(r0.w, r0.z);
/*26*/	r0.y = max(r0.z, r0.y);
/*27*/	color0.y = max(r0.y, r0.x);
/*28*/	return;
}
