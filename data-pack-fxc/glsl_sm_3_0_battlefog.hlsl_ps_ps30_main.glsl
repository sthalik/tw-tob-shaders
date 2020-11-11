//
//
// Shader Model 4
// Fragment Shader
//
// id: 198 - fxc/glsl_SM_3_0_BattleFog.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_4_sampler;
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

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, r0.y)).yzxw;
/*3*/	r1.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r1.w = 1.000000;
/*5*/	r0.x = dot(r1.xyzw, cb0.data[21].xyzw);
/*6*/	r0.y = dot(r1.xyzw, cb0.data[22].xyzw);
/*7*/	r0.z = dot(r1.xyzw, cb0.data[23].xyzw);
/*8*/	r0.w = dot(r1.xyzw, cb0.data[24].xyzw);
/*9*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*10*/	r0.w = -r0.y + cb2.data[1].w;
/*11*/	r1.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*12*/	r0.x = r0.w + -cb2.data[1].z;
/*13*/	r0.y = -cb2.data[1].z + cb2.data[1].w;
/*14*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*15*/	r0.x = saturate(r0.y * r0.x);
/*16*/	r0.y = r0.x * -2.000000 + 3.000000;
/*17*/	r0.x = r0.x * r0.x;
/*18*/	r0.x = r0.x * r0.y;
/*19*/	r0.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*20*/	r0.y = sqrt(r0.y);
/*21*/	r0.z = saturate(cb2.data[1].x)/**/;
/*22*/	r0.z = -r0.z + 1.000000;
/*23*/	r0.z = r0.z * 1000.000000;
/*24*/	r0.y = r0.y / r0.z;
/*25*/	r0.z = saturate(cb2.data[0].w)/**/;
/*26*/	r0.z = -r0.z + 1.000000;
/*27*/	r0.z = r0.z * 8.000000 + -4.000000;
/*28*/	r0.y = r0.y + r0.z;
/*29*/	r0.y = r0.y * 1.442695;
/*30*/	r0.y = exp2(r0.y);
/*31*/	r0.y = cb2.data[1].y / r0.y;
/*32*/	r0.y = saturate(-r0.y + cb2.data[1].y);
/*33*/	r0.x = cb2.data[2].x * r0.x + r0.y;
/*34*/	r0.y = saturate(dot(vec2(r0.xxxx), vec2(cb2.data[2].yyyy)));
/*35*/	r1.w = max(r1.y, 0.000000);
/*36*/	r2.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*37*/	r0.z = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*38*/	r0.z = sqrt(r0.z);
/*39*/	r1.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*40*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*41*/	r1.xyz = (r1.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*42*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*43*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*44*/	r2.xyz = (-r1.xyzx * r0.wwww + r2.xyzx).xyz;
/*45*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*46*/	color0.xyz = (r0.yyyy * r2.xyzx + r1.xyzx).xyz;
/*47*/	r0.y = max(cb2.data[2].z, 0.001000);
/*48*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*49*/	r0.y = r0.y * r0.z;
/*50*/	r0.y = min(r0.y, 1.000000);
/*51*/	r0.z = r0.y * -2.000000 + 3.000000;
/*52*/	r0.y = r0.y * r0.y;
/*53*/	r0.y = r0.y * r0.z;
/*54*/	color0.w = saturate(r0.x * r0.y);
/*55*/	return;
}
