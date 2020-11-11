//
//
// Shader Model 4
// Fragment Shader
//
// id: 1414 - fxc/glsl_SM_3_0_skydome.hlsl_PS_ps30_skygen.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform skydome_PS
{
  vec4 data[7];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*1*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*2*/	r0.w = inversesqrt(r0.w);
/*3*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*4*/	r0.w = dot(vec2(r0.xzxx), vec2(r0.xzxx));
/*5*/	r0.w = inversesqrt(r0.w);
/*6*/	r1.xz = (r0.wwww * r0.xxzx).xz;
/*7*/	r1.y = 0;
/*8*/	r0.w = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*9*/	r0.xyz = (mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*10*/	r0.w = abs(r0.y) * -0.018729 + 0.074261;
/*11*/	r0.w = r0.w * abs(r0.y) + -0.212114;
/*12*/	r0.w = r0.w * abs(r0.y) + 1.570729;
/*13*/	r1.y = -abs(r0.y) + 1.000000;
/*14*/	r1.y = sqrt(r1.y);
/*15*/	r1.w = r0.w * r1.y;
/*16*/	r1.w = r1.w * -2.000000 + 3.141593;
/*17*/	r2.x = uintBitsToFloat((r0.y < -r0.y) ? 0xffffffffu : 0x00000000u);
/*18*/	r0.x = dot(vec3(r0.xyzx), vec3(cb1.data[6].xyzx));
/*19*/	r0.y = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r2.x));
/*20*/	r0.y = r0.w * r1.y + r0.y;
/*21*/	r0.y = cos((r0.y));
/*22*/	r0.y = cb1.data[4].w / r0.y;
/*23*/	r0.y = r0.y * 1.442695;
/*24*/	r0.y = exp2(r0.y);
/*25*/	r0.z = abs(r0.x) * -0.018729 + 0.074261;
/*26*/	r0.z = r0.z * abs(r0.x) + -0.212114;
/*27*/	r0.z = r0.z * abs(r0.x) + 1.570729;
/*28*/	r0.w = -abs(r0.x) + 1.000000;
/*29*/	r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*30*/	r0.w = sqrt(r0.w);
/*31*/	r1.y = r0.w * r0.z;
/*32*/	r1.y = r1.y * -2.000000 + 3.141593;
/*33*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r1.y));
/*34*/	r0.x = r0.z * r0.w + r0.x;
/*35*/	r0.xz = (r0.xxxx * cb1.data[5].yyxy).xz;
/*36*/	r0.z = r0.z * 1.442695;
/*37*/	r0.x = cos((r0.x));
/*38*/	r0.x = r0.x * r0.x;
/*39*/	r0.z = exp2(r0.z);
/*40*/	r0.yz = (min(r0.yyzy, vec4(0.000000, 1.000000, 1.000000, 0.000000))).yz;
/*41*/	r2.xyz = (-cb1.data[0].xyzx + cb1.data[1].xyzx).xyz;
/*42*/	r2.xyz = (r0.zzzz * r2.xyzx + cb1.data[0].xyzx).xyz;
/*43*/	r0.z = dot(vec2(cb1.data[6].xzxx), vec2(cb1.data[6].xzxx));
/*44*/	r0.z = inversesqrt(r0.z);
/*45*/	r0.zw = (r0.zzzz * cb1.data[6].xxxz).zw;
/*46*/	r0.z = dot(vec2(r1.xzxx), vec2(r0.zwzz));
/*47*/	r0.z = r0.z + 1.000000;
/*48*/	r0.z = r0.z * 0.500000;
/*49*/	r1.xyz = (cb1.data[2].xyzx + -cb1.data[3].xyzx).xyz;
/*50*/	r1.xyz = (r0.zzzz * r1.xyzx + cb1.data[3].xyzx).xyz;
/*51*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*52*/	r0.yzw = (r0.yyyy * r2.xxyz + r1.xxyz).yzw;
/*53*/	color0.xyz = (r0.xxxx * cb1.data[4].xyzx + r0.yzwy).xyz;
/*54*/	color0.w = 1.000000;
/*55*/	return;
}
