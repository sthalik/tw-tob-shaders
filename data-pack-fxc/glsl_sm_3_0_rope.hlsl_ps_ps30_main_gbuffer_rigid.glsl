//
//
// Shader Model 4
// Fragment Shader
//
// id: 1385 - fxc/glsl_SM_3_0_rope.hlsl_PS_ps30_main_gbuffer_rigid.glsl
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
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_normal_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T3.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.329412;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r0.w = vsOut_T3.x + -0.500000;
/*5*/	r0.w = r0.w + r0.w;
/*6*/	r1.x = -r0.w * r0.w + 1.000000;
/*7*/	r1.x = sqrt(r1.x);
/*8*/	r1.xyz = (r1.xxxx * vsOut_T0.xyzx).xyz;
/*9*/	r1.xyz = (r0.wwww * vsOut_T1.xyzx + r1.xyzx).xyz;
/*10*/	r2.xyz = (r1.yzxy * vsOut_T2.zxyz).xyz;
/*11*/	r2.xyz = (vsOut_T2.yzxy * r1.zxyz + -r2.xyzx).xyz;
/*12*/	r3.xyzw = (texture(s_normal_map, vsOut_T3.xyxx.st)).xyzw;
/*13*/	r3.xyz = (r3.xwzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*14*/	r2.xyz = (-r2.xyzx * r3.yyyy).xyz;
/*15*/	r2.xyz = (r3.xxxx * vsOut_T2.xyzx + r2.xyzx).xyz;
/*16*/	r1.xyz = (r3.zzzz * r1.xyzx + r2.xyzx).xyz;
/*17*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*18*/	r0.w = inversesqrt(r0.w);
/*19*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*20*/	r0.w = max(abs(r1.z), abs(r1.y));
/*21*/	r0.w = max(r0.w, abs(r1.x));
/*22*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*23*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*24*/	color0.w = 0;
/*25*/	r1.xy = (vsOut_T3.yxyy * vec4(0.030000, 0.060000, 0.000000, 0.000000)).xy;
/*26*/	r2.x = r1.x;
/*27*/	r2.y = cb0.data[26].x * 0.050000 + r1.y;
/*28*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*29*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*30*/	r0.w = saturate(r2.x * 5.000000);
/*31*/	r2.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*32*/	r0.w = r1.z * 0.250000;
/*33*/	r2.xyz = (r2.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r0.wwww).xyz;
/*34*/	r1.x = log2(r1.z);
/*35*/	r1.x = r1.x * 1.800000;
/*36*/	r1.x = exp2(r1.x);
/*37*/	r1.x = r1.x * 10.000000;
/*38*/	r1.x = min(r1.x, 1.000000);
/*39*/	r1.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r1.y = saturate(-r1.y * 15.000000 + 1.000000);
/*41*/	r1.x = r1.x + r1.y;
/*42*/	r1.x = r1.x * 0.500000;
/*43*/	r2.xyz = (r1.xxxx * r2.xyzx + r0.wwww).xyz;
/*44*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*45*/	r0.w = -r1.w + 1.000000;
/*46*/	r0.w = log2(r0.w);
/*47*/	r0.w = r0.w * vsOut_T0.w;
/*48*/	r0.w = exp2(r0.w);
/*49*/	r0.w = min(r0.w, 1.000000);
/*50*/	r0.w = r0.w * vsOut_T0.w;
/*51*/	r0.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*52*/	r1.xyz = (r1.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*53*/	r0.w = vsOut_T0.w + -0.025000;
/*54*/	r0.w = max(r0.w, 0.000000);
/*55*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*56*/	r0.xyz = (sqrt(r0.xyzx)).xyz;
/*57*/	color1.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*58*/	color1.w = 0;
/*59*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*60*/	r0.xyz = (vsOut_T5.xyzx).xyz;
/*61*/	r0.w = 1.000000;
/*62*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*63*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*64*/	color3.x = r1.x / r0.x;
/*65*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*66*/	color4 = uint(0);
/*67*/	return;
}
