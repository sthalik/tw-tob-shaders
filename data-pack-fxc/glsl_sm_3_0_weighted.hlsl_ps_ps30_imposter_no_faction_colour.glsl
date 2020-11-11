//
//
// Shader Model 4
// Fragment Shader
//
// id: 1614 - fxc/glsl_SM_3_0_weighted.hlsl_PS_ps30_imposter_no_faction_colour.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*2*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*3*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*4*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*6*/	r2.xyz = (-r1.xyzx + r0.wwww).xyz;
/*7*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*8*/	r2.xyz = (r1.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*9*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*10*/	r1.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r1.xyzx).xyz;
/*11*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*12*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*14*/	r0.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*15*/	r0.xyz = saturate(r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*16*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*17*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*18*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*19*/	color0.w = 1.000000;
/*20*/	return;
}
