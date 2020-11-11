//
//
// Shader Model 4
// Fragment Shader
//
// id: 3903 - fxc/glsl_SM_3_0_GaussianBlur.hlsl_PS_ps30_gaussian_horizontal_blur_R_channel.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D s_input_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform gaussian_blur
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.z = -cb1.data[0].z/**/;
/*1*/	r0.yw = (vec4(0, 0, 0, 0)).yw;
/*2*/	r1.xy = floor((gl_FragCoord.xyxx).xy);
/*3*/	r1.xy = (r1.xyxx + cb0.data[28].xxxx).xy;
/*4*/	r0.zw = (r1.xxxy * cb0.data[27].zzzw + r0.zzzw).zw;
/*5*/	r2.xyzw = (textureLod(s_input_sampler, r0.zwzz.st, 0.000000)).xyzw;
/*6*/	r0.z = r2.x * 0.125794;
/*7*/	r0.x = cb1.data[0].z * -2.000000;
/*8*/	r0.xy = (r1.xyxx * cb0.data[27].zwzz + r0.xyxx).xy;
/*9*/	r2.xyzw = (textureLod(s_input_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*10*/	r0.x = r2.x * 0.106483 + r0.z;
/*11*/	r0.yz = (r1.xxyx * cb0.data[27].zzwz).yz;
/*12*/	r2.xyzw = (textureLod(s_input_sampler, r0.yzyy.st, 0.000000)).xyzw;
/*13*/	r0.x = r2.x * 0.132981 + r0.x;
/*14*/	color0.yz = (r2.yyzy).yz;
/*15*/	r2.x = cb1.data[0].z/**/;
/*16*/	r2.yw = (vec4(0, 0, 0, 0)).yw;
/*17*/	r0.yz = (r1.xxyx * cb0.data[27].zzwz + r2.xxyx).yz;
/*18*/	r3.xyzw = (textureLod(s_input_sampler, r0.yzyy.st, 0.000000)).xyzw;
/*19*/	r0.x = r3.x * 0.125794 + r0.x;
/*20*/	r2.z = cb1.data[0].z * 2.000000;
/*21*/	r0.yz = (r1.xxyx * cb0.data[27].zzwz + r2.zzwz).yz;
/*22*/	r1.xyzw = (textureLod(s_input_sampler, r0.yzyy.st, 0.000000)).xyzw;
/*23*/	r0.x = r1.x * 0.106483 + r0.x;
/*24*/	color0.x = r0.x * 1.673542;
/*25*/	color0.w = 0;
/*26*/	return;
}
