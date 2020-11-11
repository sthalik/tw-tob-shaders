//
//
// Shader Model 4
// Fragment Shader
//
// id: 3867 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_determine_black_and_white_points.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D g_prev_black_and_white_points_sampler;
uniform sampler2D g_luma_stats_texture_sampler;

layout(std140) uniform luma_stats_buffer
{
  vec4 data[2];
} cb0;
layout(std140) uniform auto_exposure_buffer
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (textureLod(g_luma_stats_texture_sampler, vec4(0.500000, 0.500000, 0.000000, 0.000000).st, 0.000000)).xyzw;
/*1*/	r1.xy = (-r0.zxzz + r0.yzyy).xy;
/*2*/	r0.w = max(r1.y, r1.x);
/*3*/	r1.x = min(r1.y, r1.x);
/*4*/	r0.w = r0.w + -r1.x;
/*5*/	r1.y = r0.z + r1.x;
/*6*/	r1.y = r0.w * 0.860000 + r1.y;
/*7*/	r1.y = r1.x * 1.230000 + r1.y;
/*8*/	r0.y = r1.x * 1.230000 + r0.y;
/*9*/	r0.z = r0.z + -r1.x;
/*10*/	r0.z = -r0.w * 0.860000 + r0.z;
/*11*/	r0.x = max(r0.x, r0.z);
/*12*/	r0.x = max(r0.x, cb0.data[0].x);
/*13*/	r2.x = min(r0.x, cb0.data[0].y);
/*14*/	r0.x = min(r0.y, r1.y);
/*15*/	r0.x = max(r0.x, cb0.data[0].z);
/*16*/	r2.y = min(r0.x, cb0.data[0].w);
/*17*/	r0.xyzw = (textureLod(g_prev_black_and_white_points_sampler, vec4(0.500000, 0.500000, 0.000000, 0.000000).st, 0.000000)).xyzw;
/*18*/	r0.zw = (-r0.xxxy + r2.xxxy).zw;
/*19*/	r1.x = -cb1.data[0].x + 1.000000;
/*20*/	r1.x = log2(r1.x);
/*21*/	r1.y = cb1.data[0].y * 30.000000;
/*22*/	r1.x = r1.x * r1.y;
/*23*/	r1.x = exp2(r1.x);
/*24*/	r1.x = -r1.x + 1.000000;
/*25*/	color0.xy = (r0.zwzz * r1.xxxx + r0.xyxx).xy;
/*26*/	color0.zw = (vec4(0, 0, 0, 0)).zw;
/*27*/	return;
}
