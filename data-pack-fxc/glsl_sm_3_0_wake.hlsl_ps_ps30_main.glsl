//
//
// Shader Model 4
// Fragment Shader
//
// id: 3838 - fxc/glsl_SM_3_0_wake.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D foam_texture_sampler;
uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.x = -vsOut_T1.y + cb2.data[1].w;
/*1*/	r0.x = r0.x + -cb2.data[1].z;
/*2*/	r0.y = -cb2.data[1].z + cb2.data[1].w;
/*3*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*4*/	r0.x = saturate(r0.y * r0.x);
/*5*/	r0.y = r0.x * -2.000000 + 3.000000;
/*6*/	r0.x = r0.x * r0.x;
/*7*/	r0.x = r0.x * r0.y;
/*8*/	r0.y = saturate(cb2.data[0].w)/**/;
/*9*/	r0.y = -r0.y + 1.000000;
/*10*/	r0.y = r0.y * 8.000000 + -4.000000;
/*11*/	r0.z = saturate(cb2.data[1].x)/**/;
/*12*/	r0.z = -r0.z + 1.000000;
/*13*/	r0.z = r0.z * 1000.000000;
/*14*/	r1.xyz = (vsOut_T1.xyzx + -cb0.data[0].xyzx).xyz;
/*15*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*16*/	r0.w = sqrt(r0.w);
/*17*/	r0.z = r0.w / r0.z;
/*18*/	r0.y = r0.z + r0.y;
/*19*/	r0.y = r0.y * 1.442695;
/*20*/	r0.y = exp2(r0.y);
/*21*/	r0.y = cb2.data[1].y / r0.y;
/*22*/	r0.y = saturate(-r0.y + cb2.data[1].y);
/*23*/	r0.x = cb2.data[2].x * r0.x + r0.y;
/*24*/	r0.y = saturate(dot(vec2(r0.xxxx), vec2(cb2.data[2].yyyy)));
/*25*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*26*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*27*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*28*/	r0.z = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*29*/	r0.z = (floatBitsToUint(r0.z) > 0x00000000u) ? 0.004000 : 1.000000;
/*30*/	r3.xyz = (r0.zzzz * r2.xyzx).xyz;
/*31*/	r1.w = max(r1.y, 0.000000);
/*32*/	r4.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*33*/	r0.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*34*/	r0.w = sqrt(r0.w);
/*35*/	r1.xyz = (-r2.xyzx * r0.zzzz + r4.xyzx).xyz;
/*36*/	r1.xyz = (r0.yyyy * r1.xyzx + r3.xyzx).xyz;
/*37*/	r2.xyzw = (texture(foam_texture_sampler, vsOut_C0.yzyy.st)).xyzw;
/*38*/	r1.xyz = (-r2.xyzx * vsOut_C0.xxxx + r1.xyzx).xyz;
/*39*/	r2.xyzw = r2.xyzw * vsOut_C0.xxxx;
/*40*/	r0.y = max(cb2.data[2].z, 0.001000);
/*41*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*42*/	r0.y = r0.y * r0.w;
/*43*/	r0.y = min(r0.y, 1.000000);
/*44*/	r0.z = r0.y * -2.000000 + 3.000000;
/*45*/	r0.y = r0.y * r0.y;
/*46*/	r0.y = r0.y * r0.z;
/*47*/	r0.x = saturate(r0.x * r0.y);
/*48*/	color0.xyz = (r0.xxxx * r1.xyzx + r2.xyzx).xyz;
/*49*/	color0.w = r2.w;
/*50*/	return;
}
