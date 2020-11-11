//
//
// Shader Model 4
// Fragment Shader
//
// id: 1848 - fxc/glsl_SM_3_0_weighted.hlsl_PS_ps30_gbuffer_skin_noclip_no_faction_colour_slm.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_T9;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*3*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*4*/	r0.w = inversesqrt(r0.w);
/*5*/	r1.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*6*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*7*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*8*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*9*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*10*/	r0.xyz = (r2.xxxx * r0.xyzx + r1.xyzx).xyz;
/*11*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r0.w = sqrt(r0.w);
/*15*/	r1.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*16*/	r1.x = inversesqrt(r1.x);
/*17*/	r1.xyz = (r1.xxxx * vsOut_T2.xyzx).xyz;
/*18*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*19*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*20*/	r0.w = inversesqrt(r0.w);
/*21*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*22*/	r0.w = max(abs(r0.z), abs(r0.y));
/*23*/	r0.w = max(r0.w, abs(r0.x));
/*24*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*25*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*26*/	r0.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*27*/	color0.w = saturate(r0.x);
/*28*/	r0.x = vsOut_T7.x * -r0.y + r0.y;
/*29*/	color1.w = saturate(vsOut_T7.y * -r0.x + r0.x);
/*30*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*32*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*33*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*34*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*36*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*37*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*38*/	r0.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*41*/	color2.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*42*/	color2.w = 0;
/*43*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*44*/	r0.w = 1.000000;
/*45*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*46*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*47*/	color3.x = r1.x / r0.x;
/*48*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*49*/	color4 = floatBitsToUint(vsOut_T9.z);
/*50*/	return;
}
