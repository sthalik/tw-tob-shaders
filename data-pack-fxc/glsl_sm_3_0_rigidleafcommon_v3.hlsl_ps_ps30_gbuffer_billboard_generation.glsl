//
//
// Shader Model 4
// Fragment Shader
//
// id: 618 - fxc/glsl_SM_3_0_rigidleafcommon_v3.hlsl_PS_ps30_gbuffer_billboard_generation.glsl
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
uniform sampler2D s_dissolve_map;
uniform sampler2D s_normal_map;

layout(std140) uniform vegetation_tint_colours
{
  vec4 data[4];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xy = (vsOut_T1.xyxx * vec4(10.000000, 10.000000, 0.000000, 0.000000)).xy;
/*1*/	r0.xyzw = (texture(s_dissolve_map, r0.xyxx.st)).xyzw;
/*2*/	r0.y = vsOut_T1.w * vsOut_T1.w + 0.050000;
/*3*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r0.x = r0.x * r1.w + -r0.y;
/*5*/	r0.y = r1.w + -0.500000;
/*6*/	r0.x = min(r0.y, r0.x);
/*7*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r0.x != 0) discard;
/*9*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*10*/	r0.x = inversesqrt(r0.x);
/*11*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*12*/	r0.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*13*/	r0.w = inversesqrt(r0.w);
/*14*/	r2.xyz = (r0.wwww * vsOut_T4.xyzx).xyz;
/*15*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*19*/	r0.xyz = (r3.xxxx * r0.xyzx + r2.xyzx).xyz;
/*20*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*21*/	r0.w = -r0.w + 1.000000;
/*22*/	r0.w = max(r0.w, 0.000000);
/*23*/	r0.w = sqrt(r0.w);
/*24*/	r2.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*25*/	r2.x = inversesqrt(r2.x);
/*26*/	r2.xyz = (r2.xxxx * vsOut_T2.xyzx).xyz;
/*27*/	r0.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*28*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*29*/	r0.w = inversesqrt(r0.w);
/*30*/	r2.xyz = (r0.wwww * r0.xyzx).xyz;
/*31*/	r0.xyz = (-r0.xyzx * r0.wwww + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*32*/	r0.xyz = (r0.xyzx * vec4(0.650000, 0.650000, 0.650000, 0.000000) + r2.xyzx).xyz;
/*33*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*36*/	r0.xyz = (r0.xyzx * vec4(-1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*37*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*38*/	r0.w = inversesqrt(r0.w);
/*39*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*40*/	r0.w = max(abs(r0.z), abs(r0.y));
/*41*/	r0.w = max(r0.w, abs(r0.x));
/*42*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*43*/	r0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*44*/	r2.x = max(vsOut_T0.z, -cb0.data[3].x);
/*45*/	r2.x = min(r2.x, cb0.data[3].x);
/*46*/	r2.x = r2.x / cb0.data[3].x;
/*47*/	r0.w = saturate(r2.x * 0.500000 + 0.500000);
/*48*/	color0.xyzw = r0.xyzw;
/*49*/	color2.xyz = (r0.wwww).xyz;
/*50*/	r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).x;
/*51*/	r0.xyz = (r0.xxxx * r1.xyzx).xyz;
/*52*/	r0.w = vsOut_T3.w + -1.000000;
/*53*/	r0.w = r0.w * 0.700000 + 1.000000;
/*54*/	r0.w = -r0.w + 1.000000;
/*55*/	r0.w = log2(r0.w);
/*56*/	r0.w = r0.w * 1.500000;
/*57*/	r0.w = exp2(r0.w);
/*58*/	r0.w = -r0.w + 1.000000;
/*59*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*60*/	r1.xyz = (log2(r0.xyzx)).xyz;
/*61*/	r1.xyz = (r1.xyzx * vec4(0.416667, 0.416667, 0.416667, 0.000000)).xyz;
/*62*/	r1.xyz = (exp2(r1.xyzx)).xyz;
/*63*/	r1.xyz = (r1.xyzx * vec4(1.055000, 1.055000, 1.055000, 0.000000) + vec4(-0.055000, -0.055000, -0.055000, 0.000000)).xyz;
/*64*/	r2.xyz = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.003131, 0.003131, 0.003131, 0.000000), r0.xyzx)) * 0xffffffffu)).xyz;
/*65*/	r0.xyz = (r0.xyzx * vec4(12.920000, 12.920000, 12.920000, 0.000000)).xyz;
/*66*/	color1.xyz = (mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r2.xyzx), uvec4(0)))).xyz;
/*67*/	color1.w = 1.000000;
/*68*/	color2.w = 1.000000;
/*69*/	color3.xyzw = vec4(0, 0, 0, 0);
/*70*/	return;
}
