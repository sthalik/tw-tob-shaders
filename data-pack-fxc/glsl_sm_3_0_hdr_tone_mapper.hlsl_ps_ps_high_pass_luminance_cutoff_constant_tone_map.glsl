//
//
// Shader Model 4
// Fragment Shader
//
// id: 3871 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_high_pass_luminance_cutoff_constant_tone_map.glsl
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
layout(std140) uniform constant_tone_mapping_buffer
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

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb2.data[0].xyxx).xy;
/*2*/	r0.xyzw = (textureLod(g_hdr_rgb_texture_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*3*/	r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*4*/	r1.xyz = (r1.xyzx / cb1.data[0].zzzz).xyz;
/*5*/	r0.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*6*/	r0.w = uintBitsToFloat((r0.w >= cb1.data[0].z) ? 0xffffffffu : 0x00000000u);
/*7*/	r1.xyz = (r0.xyzx * vec4(25.000000, 25.000000, 25.000000, 0.000000)).xyz;
/*8*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*9*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*10*/	r1.w = uintBitsToFloat((25.000000 >= r1.w) ? 0xffffffffu : 0x00000000u);
/*11*/	r0.xyz = (mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*12*/	r0.xyz = (max(r0.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xyz;
/*13*/	color0.xyz = (uintBitsToFloat(floatBitsToUint(r0.xyzx) & floatBitsToUint(r0.wwww))).xyz;
/*14*/	color0.w = 1.000000;
/*15*/	return;
}
