//
//
// Shader Model 4
// Fragment Shader
//
// id: 311 - fxc/glsl_SM_3_0_high_pass.hlsl_PS_ps30_main.glsl
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
layout(std140) uniform high_pass_PS
{
  vec4 data[17];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (cb0.data[27].xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*1*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*2*/	r0.xy = (r0.zwzz / r0.xyxx).xy;
/*3*/	r0.zw = (cb1.data[1].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*4*/	r1.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*5*/	r0.zw = (cb1.data[2].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*6*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*7*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*8*/	r0.zw = (cb1.data[3].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*9*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*10*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*11*/	r0.zw = (cb1.data[4].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*12*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*13*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*14*/	r0.zw = (cb1.data[5].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*15*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*16*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*17*/	r0.zw = (cb1.data[6].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*18*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*19*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*20*/	r0.zw = (cb1.data[7].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*21*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*22*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*23*/	r0.zw = (cb1.data[8].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*24*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*25*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*26*/	r0.zw = (cb1.data[9].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*27*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*28*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*29*/	r0.zw = (cb1.data[10].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*30*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*31*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*32*/	r0.zw = (cb1.data[11].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*33*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*34*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*35*/	r0.zw = (cb1.data[12].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*36*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*37*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*38*/	r0.zw = (cb1.data[13].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*39*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*40*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*41*/	r0.zw = (cb1.data[14].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*42*/	r2.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*43*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*44*/	r0.zw = (cb1.data[15].xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.xxxy).zw;
/*45*/	r0.xy = (cb1.data[16].xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*46*/	r2.xyzw = (textureLod(input_sampler, r0.xyxx.st, r0.y)).xyzw;
/*47*/	r0.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*48*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*49*/	r0.xyz = (r2.xyzx + r0.xyzx).xyz;
/*50*/	r0.xyz = (r0.xyzx * vec4(0.062500, 0.062500, 0.062500, 0.000000)).xyz;
/*51*/	r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*52*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*53*/	color0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*54*/	color0.w = 1.000000;
/*55*/	return;
}
