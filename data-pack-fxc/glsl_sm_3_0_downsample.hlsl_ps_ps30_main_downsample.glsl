//
//
// Shader Model 4
// Fragment Shader
//
// id: 308 - fxc/glsl_SM_3_0_downsample.hlsl_PS_ps30_main_downsample.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D input_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform downsample_PS
{
  vec4 data[17];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (cb0.data[27].xyxx * cb1.data[15].zzzz).xy;
/*1*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*2*/	r0.xy = (r0.zwzz / r0.xyxx).xy;
/*3*/	r0.zw = (cb1.data[0].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*4*/	r1.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*5*/	r0.zw = (cb1.data[1].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*6*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*7*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*8*/	r0.zw = (cb1.data[2].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*9*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*10*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*11*/	r0.zw = (cb1.data[3].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*12*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*13*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*14*/	r0.zw = (cb1.data[4].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*15*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*16*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*17*/	r0.zw = (cb1.data[5].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*18*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*19*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*20*/	r0.zw = (cb1.data[6].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*21*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*22*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*23*/	r0.zw = (cb1.data[7].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*24*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*25*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*26*/	r0.zw = (cb1.data[8].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*27*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*28*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*29*/	r0.zw = (cb1.data[9].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*30*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*31*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*32*/	r0.zw = (cb1.data[10].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*33*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*34*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*35*/	r0.zw = (cb1.data[11].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*36*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*37*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*38*/	r0.zw = (cb1.data[12].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*39*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*40*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*41*/	r0.zw = (cb1.data[13].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*42*/	r2.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*43*/	r1.xyzw = r1.xyzw + r2.xyzw;
/*44*/	r0.zw = (cb1.data[14].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*45*/	r0.xy = (cb1.data[15].xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*46*/	r2.xyzw = (texture(input_sampler, r0.xyxx.st)).xyzw;
/*47*/	r0.xyzw = (texture(input_sampler, r0.zwzz.st)).xyzw;
/*48*/	r0.xyzw = r0.xyzw + r1.xyzw;
/*49*/	r0.xyzw = r2.xyzw + r0.xyzw;
/*50*/	color0.xyzw = r0.xyzw * vec4(0.062500, 0.062500, 0.062500, 0.062500);
/*51*/	return;
}
