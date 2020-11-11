//
//
// Shader Model 4
// Fragment Shader
//
// id: 578 - fxc/glsl_SM_3_0_rigidbranchcommon_v3.hlsl_PS_ps30_gbuffer_billboard_generation.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_diffuse_burn_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_normal_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform vegetation_tint_colours
{
  vec4 data[4];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*3*/	r0.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*4*/	r0.w = inversesqrt(r0.w);
/*5*/	r1.xyz = (r0.wwww * vsOut_T4.xyzx).xyz;
/*6*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
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
/*22*/	r0.xyz = (r0.xyzx * vec4(-1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*23*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*26*/	r0.w = max(abs(r0.z), abs(r0.y));
/*27*/	r0.w = max(r0.w, abs(r0.x));
/*28*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*29*/	r0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*30*/	r1.x = max(vsOut_T0.z, -cb1.data[3].x);
/*31*/	r1.x = min(r1.x, cb1.data[3].x);
/*32*/	r1.x = r1.x / cb1.data[3].x;
/*33*/	r0.w = saturate(r1.x * 0.500000 + 0.500000);
/*34*/	color0.xyzw = r0.xyzw;
/*35*/	color2.xyz = (r0.wwww).xyz;
/*36*/	r0.xyzw = (texture(s_diffuse_burn_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*37*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*38*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*39*/	r0.xyz = (vsOut_T1.zzzz * r0.xyzx + r1.xyzx).xyz;
/*40*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*41*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*42*/	r1.xy = (vsOut_T1.xyxx * vec4(0.600000, 0.600000, 0.000000, 0.000000)).xy;
/*43*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*44*/	r1.z = log2(r2.z);
/*45*/	r1.z = r1.z * 1.800000;
/*46*/	r1.z = exp2(r1.z);
/*47*/	r1.z = r1.z * 10.000000;
/*48*/	r1.z = min(r1.z, 1.000000);
/*49*/	r0.w = r0.w + r1.z;
/*50*/	r0.w = r0.w * 0.500000;
/*51*/	r1.y = cb0.data[26].x * 0.050000 + r1.y;
/*52*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*53*/	r1.x = saturate(r1.x * 5.000000);
/*54*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*55*/	r1.w = r2.z * 0.250000;
/*56*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*57*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*58*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*59*/	r0.w = -r2.w + 1.000000;
/*60*/	r0.w = log2(r0.w);
/*61*/	r0.w = r0.w * vsOut_T1.z;
/*62*/	r0.w = exp2(r0.w);
/*63*/	r0.w = min(r0.w, 1.000000);
/*64*/	r0.w = r0.w * vsOut_T1.z;
/*65*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*66*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*67*/	r0.w = vsOut_T1.z + -0.025000;
/*68*/	r0.w = max(r0.w, 0.000000);
/*69*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*70*/	r1.xyz = (log2(r0.xyzx)).xyz;
/*71*/	r1.xyz = (r1.xyzx * vec4(0.416667, 0.416667, 0.416667, 0.000000)).xyz;
/*72*/	r1.xyz = (exp2(r1.xyzx)).xyz;
/*73*/	r1.xyz = (r1.xyzx * vec4(1.055000, 1.055000, 1.055000, 0.000000) + vec4(-0.055000, -0.055000, -0.055000, 0.000000)).xyz;
/*74*/	r2.xyz = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.003131, 0.003131, 0.003131, 0.000000), r0.xyzx)) * 0xffffffffu)).xyz;
/*75*/	r0.xyz = (r0.xyzx * vec4(12.920000, 12.920000, 12.920000, 0.000000)).xyz;
/*76*/	color1.xyz = (mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r2.xyzx), uvec4(0)))).xyz;
/*77*/	color1.w = 1.000000;
/*78*/	color2.w = 1.000000;
/*79*/	color3.xyzw = vec4(0, 0, 0, 0);
/*80*/	return;
}
