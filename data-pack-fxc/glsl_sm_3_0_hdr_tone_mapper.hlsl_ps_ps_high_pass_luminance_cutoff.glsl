//
//
// Shader Model 4
// Fragment Shader
//
// id: 3869 - fxc/glsl_SM_3_0_hdr_tone_mapper.hlsl_PS_ps_high_pass_luminance_cutoff.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D g_black_and_white_points_sampler;
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

/*0*/	r0.xyzw = (textureLod(g_black_and_white_points_sampler, vec4(0.500000, 0.500000, 0.000000, 0.000000).st, 0.000000)).xyzw;
/*1*/	r0.x = -r0.x + r0.y;
/*2*/	r0.x = r0.x * -0.340000 + r0.y;
/*3*/	r0.yz = (gl_FragCoord.xxyx + cb0.data[28].xxxx).yz;
/*4*/	r0.yz = (r0.yyzy * cb1.data[0].xxyx).yz;
/*5*/	r1.xyzw = (textureLod(g_hdr_rgb_texture_sampler, r0.yzyy.st, 0.000000)).xyzw;
/*6*/	r0.yzw = (r1.wwww * r1.xxyz).yzw;
/*7*/	r0.yzw = (r0.yyzw / r0.xxxx).yzw;
/*8*/	r0.x = uintBitsToFloat((r1.w >= r0.x) ? 0xffffffffu : 0x00000000u);
/*9*/	r0.yzw = (-r1.xxyz + r0.yyzw).yzw;
/*10*/	r1.xyz = (r0.yzwy * vec4(25.000000, 25.000000, 25.000000, 0.000000)).xyz;
/*11*/	r1.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	r1.w = uintBitsToFloat((25.000000 >= r1.w) ? 0xffffffffu : 0x00000000u);
/*14*/	r0.yzw = (mix(r1.xxyz, r0.yyzw, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).yzw;
/*15*/	r0.yzw = (max(r0.yyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))).yzw;
/*16*/	color0.xyz = (uintBitsToFloat(floatBitsToUint(r0.yzwy) & floatBitsToUint(r0.xxxx))).xyz;
/*17*/	color0.w = 1.000000;
/*18*/	return;
}
