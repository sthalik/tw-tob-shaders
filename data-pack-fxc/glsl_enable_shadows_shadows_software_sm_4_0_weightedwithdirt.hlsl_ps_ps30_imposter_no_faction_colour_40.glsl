//
//
// Shader Model 4
// Fragment Shader
//
// id: 5738 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirt.hlsl_PS_ps30_imposter_no_faction_colour_40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*1*/	r0.xyzw = (texture(s_decal_dirt_map, r0.xyxx.st)).xyzw;
/*2*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*3*/	r0.x = r0.w * r1.w;
/*4*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r0.yzw = (r0.xxxx * r1.xxyz).yzw;
/*6*/	r0.yzw = (r0.yyzw * vec4(0.000000, -0.990000, -0.990000, -0.990000) + r1.xxyz).yzw;
/*7*/	r1.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*8*/	r1.xyz = (-r0.yzwy + r1.xxxx).xyz;
/*9*/	r0.yzw = (vsOut_T7.yyyy * r1.xxyz + r0.yyzw).yzw;
/*10*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r2.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*12*/	r1.xyz = (r0.xxxx * r2.xyzx + r1.xyzx).xyz;
/*13*/	r0.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*14*/	r2.xyz = (-r1.xyzx + r0.xxxx).xyz;
/*15*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*16*/	r2.xyz = (r1.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*17*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*18*/	r1.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r1.xyzx).xyz;
/*19*/	r0.xyz = (r0.yzwy + -r1.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*21*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*22*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*23*/	r0.xyz = saturate(r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*24*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*25*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*26*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*27*/	color0.w = 1.000000;
/*28*/	return;
}
