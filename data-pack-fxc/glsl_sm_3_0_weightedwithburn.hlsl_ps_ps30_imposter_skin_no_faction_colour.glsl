//
//
// Shader Model 4
// Fragment Shader
//
// id: 2211 - fxc/glsl_SM_3_0_weightedwithburn.hlsl_PS_ps30_imposter_skin_no_faction_colour.glsl
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
uniform sampler2D s_fire_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*1*/	r1.x = r0.x;
/*2*/	r1.y = cb1.data[26].x * 0.050000 + r0.y;
/*3*/	r0.xyzw = (texture(s_fire_map, r0.xyxx.st)).xyzw;
/*4*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*5*/	r0.x = saturate(r1.x * 5.000000);
/*6*/	r1.xyz = (r0.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*7*/	r0.x = r0.z * 0.250000;
/*8*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r0.xxxx).xyz;
/*9*/	r0.y = log2(r0.z);
/*10*/	r0.y = r0.y * 1.800000;
/*11*/	r0.y = exp2(r0.y);
/*12*/	r0.y = r0.y * 10.000000;
/*13*/	r0.y = min(r0.y, 1.000000);
/*14*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*16*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*17*/	r0.y = r0.y + r1.w;
/*18*/	r0.y = r0.y * 0.500000;
/*19*/	r1.xyz = (r0.yyyy * r1.xyzx + r0.xxxx).xyz;
/*20*/	r1.xyz = (-r2.xyzx + r1.xyzx).xyz;
/*21*/	r0.x = -r0.w + 1.000000;
/*22*/	r0.x = log2(r0.x);
/*23*/	r0.x = r0.x * vsOut_T7.z;
/*24*/	r0.x = exp2(r0.x);
/*25*/	r0.x = min(r0.x, 1.000000);
/*26*/	r0.x = r0.x * vsOut_T7.z;
/*27*/	r0.xyw = (r0.xxxx * r1.xyxz + r2.xyxz).xyw;
/*28*/	r1.xyz = (r0.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*29*/	r0.z = vsOut_T7.z + -0.025000;
/*30*/	r0.z = max(r0.z, 0.000000);
/*31*/	r0.xyz = (r0.zzzz * r1.xyzx + r0.xywx).xyz;
/*32*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*33*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*34*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*35*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*36*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*37*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*38*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*39*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*40*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*41*/	color0.w = 1.000000;
/*42*/	return;
}
