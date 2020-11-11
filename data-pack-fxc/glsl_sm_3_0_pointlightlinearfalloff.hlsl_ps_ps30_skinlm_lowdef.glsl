//
//
// Shader Model 4
// Fragment Shader
//
// id: 407 - fxc/glsl_SM_3_0_PointLightLinearFalloff.hlsl_PS_ps30_skinlm_lowdef.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_P1;
in vec4 vsOut_P2;

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_1_sampler;
uniform sampler2D gbuffer_channel_2_sampler;
uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform point_light_PS
{
  vec4 data[1];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw + -cb2.data[0].xxxy).zw;
/*2*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*3*/	r0.zw = (r0.zzzw / cb2.data[0].zzzw).zw;
/*4*/	r1.xy = (r0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r2.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, r0.y)).xyzw;
/*6*/	r1.z = r2.x;
/*7*/	r1.w = 1.000000;
/*8*/	r2.x = dot(r1.xyzw, cb0.data[21].xyzw);
/*9*/	r2.y = dot(r1.xyzw, cb0.data[22].xyzw);
/*10*/	r2.z = dot(r1.xyzw, cb0.data[23].xyzw);
/*11*/	r0.z = dot(r1.xyzw, cb0.data[24].xyzw);
/*12*/	r1.xyz = (r2.xyzx / r0.zzzz).xyz;
/*13*/	r2.xyz = (r1.xyzx + -cb0.data[0].xyzx).xyz;
/*14*/	r1.xyz = (r1.xyzx + -vsOut_P2.xyzx).xyz;
/*15*/	r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*16*/	r0.z = inversesqrt(r0.z);
/*17*/	r2.xyz = (r0.zzzz * r2.xyzx).xyz;
/*18*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*19*/	r0.w = inversesqrt(r0.z);
/*20*/	r0.z = sqrt(r0.z);
/*21*/	r0.z = saturate(r0.z / vsOut_P2.w);
/*22*/	r0.z = -r0.z + 1.000000;
/*23*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*24*/	r3.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.xyxx.st, r0.y)).xyzw;
/*25*/	r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*26*/	r0.w = r3.w * 63.000000 + 1.600000;
/*27*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*28*/	r1.w = inversesqrt(r1.w);
/*29*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*30*/	r1.w = dot(vec3(r1.xyzx), vec3(r3.xyzx));
/*31*/	r1.w = r1.w + r1.w;
/*32*/	r4.xyz = (r3.xyzx * -r1.wwww + r1.xyzx).xyz;
/*33*/	r1.x = dot(vec3(r3.xyzx), vec3(-r1.xyzx));
/*34*/	r1.y = dot(vec3(r4.xyzx), vec3(-r2.xyzx));
/*35*/	r1.y = max(r1.y, 0.000000);
/*36*/	r1.y = log2(r1.y);
/*37*/	r0.w = r0.w * r1.y;
/*38*/	r0.w = exp2(r0.w);
/*39*/	r0.w = min(r0.w, 1.000000);
/*40*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.xyxx.st, r0.y)).xyzw;
/*41*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.xyxx.st, r0.y)).xyzw;
/*42*/	r0.x = r0.w * r2.w;
/*43*/	r0.y = max(r1.x, 0.000000);
/*44*/	r0.x = r0.y * r0.x;
/*45*/	r0.xyw = (r0.xxxx * vsOut_P1.xyxz).xyw;
/*46*/	r1.yzw = (r1.xxxx * vec4(0.000000, 0.800000, 0.900000, 0.300000) + vec4(0.000000, 0.300000, 0.500000, 0.300000)).yzw;
/*47*/	r1.yzw = saturate(r1.yyzw * vec4(0.000000, 0.694444, 0.694444, 0.444444)).yzw;
/*48*/	r2.w = r1.x * r1.y + 0.300000;
/*49*/	r2.w = saturate(-r2.w + 1.000000);
/*50*/	r3.xzw = (r1.zzzz * vec4(0.800000, 0.000000, 0.700000, 0.200000)).xzw;
/*51*/	r4.xyz = (r2.wwww * r3.xzwx).xyz;
/*52*/	r3.xzw = (-r3.xxzw * r2.wwww + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*53*/	r4.xyz = (r1.xxxx * r1.yyyy + r4.xyzx).xyz;
/*54*/	r1.y = -r1.x * r1.y + 1.000000;
/*55*/	r5.xyz = (r1.wwww * vec4(0.600000, 0.200000, 0.100000, 0.000000)).xyz;
/*56*/	r1.yzw = (r1.yyyy * r5.xxyz).yzw;
/*57*/	r1.yzw = (r1.yyzw * r3.xxzw + r4.xxyz).yzw;
/*58*/	r1.yzw = (-r1.xxxx + r1.yyzw).yzw;
/*59*/	r1.xyz = saturate(r3.yyyy * r1.yzwy + r1.xxxx).xyz;
/*60*/	r1.xyz = (r1.xyzx * r2.xyzx).xyz;
/*61*/	r1.xyz = (r1.xyzx * vsOut_P1.xyzx).xyz;
/*62*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r1.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*64*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*65*/	r1.xyz = (r1.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000)).xyz;
/*66*/	r0.xyw = (r0.xyxw * r1.wwww + r1.xyxz).xyw;
/*67*/	color0.xyz = saturate(r0.xywx * r0.zzzz).xyz;
/*68*/	color0.w = 1.000000;
/*69*/	return;
}
