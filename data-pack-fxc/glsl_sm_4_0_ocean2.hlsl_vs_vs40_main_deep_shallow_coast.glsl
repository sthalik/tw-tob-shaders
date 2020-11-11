// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 6815 - fxc/glsl_SM_4_0_ocean2.hlsl_VS_vs40_main_deep_shallow_coast.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_T0;

out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;
out vec4 vsOut_T7;
out vec4 vsOut_T8;

uniform sampler2D s_deep_grad_sampler;
uniform sampler2D s_deep_displace_sampler;
uniform sampler2D s_land_heights_sampler;
uniform sampler2D s_shallow_displace_sampler;
uniform sampler2D s_shallow_grad_sampler;
uniform sampler2D s_coast_waves_displace_sampler;
uniform sampler2D s_coast_waves_grad_sampler;
uniform sampler2D s_coast_distance_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform ocean_v2_tile
{
  vec4 data[4];
} cb1;
layout(std140) uniform ocean_v2_water
{
  vec4 data[12];
} cb2;
layout(std140) uniform ocean_v2_coast
{
  vec4 data[6];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;

/*0*/	r0.x = cb3.data[2].x * 2.000000 + cb3.data[2].y;
/*1*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.x)).y;
/*2*/	r0.y = r0.y * cb3.data[2].x;
/*3*/	r0.zw = trunc((abs(vsIn_P0.xxxz)).zw);
/*4*/	r1.xy = (cb1.data[0].xyxx + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r1.zw = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r1.xxxy).zw;
/*6*/	r1.xy = (r1.xyxx / r0.xxxx).xy;
/*7*/	r0.xz = (r0.zzwz * r1.zzwz).xz;
/*8*/	r1.zw = (r1.zzzw * abs(vsIn_P0.xxxz)).zw;
/*9*/	r0.xy = (r0.xzxx * r1.xyxx + r0.yyyy).xy;
/*10*/	r2.xyzw = (textureLod(s_coast_distance_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*11*/	r0.z = r2.y + -cb2.data[0].x;
/*12*/	r0.z = max(r0.z, 0.000000);
/*13*/	r0.z = min(r0.z, cb3.data[0].x);
/*14*/	r0.z = saturate(r0.z / cb3.data[0].x);
/*15*/	r0.w = r0.z * -2.000000 + 3.000000;
/*16*/	r0.z = r0.z * r0.z;
/*17*/	r0.z = r0.z * r0.w;
/*18*/	r3.xyzw = (textureLod(s_coast_waves_displace_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*19*/	r4.xyzw = (textureLod(s_deep_displace_sampler, r1.zwzz.st, 0.000000)).xyzw;
/*20*/	r5.xyzw = (textureLod(s_shallow_displace_sampler, r1.zwzz.st, 0.000000)).xyzw;
/*21*/	r1.xy = (r4.xzxx + -r5.xzxx).xy;
/*22*/	r2.zw = (vsIn_T0.xxxy * cb1.data[1].zzzw).zw;
/*23*/	r2.zw = (vsIn_P0.xxxz * cb1.data[1].xxxy + r2.zzzw).zw;
/*24*/	r4.xz = (r2.zzwz + -cb1.data[2].xxyx).xz;
/*25*/	r6.xy = (r4.xzxx * cb1.data[2].zwzz).xy;
/*26*/	r6.z = -r6.y;
/*27*/	r7.xyzw = (textureLod(s_land_heights_sampler, r6.xzxx.st, 0.000000)).xyzw;
/*28*/	r4.xz = (-r7.zzxz + cb2.data[0].xxxx).xz;
/*29*/	r4.xz = saturate(r4.xxzx / cb2.data[4].xxyx).xz;
/*30*/	r0.w = r4.x * r4.x;
/*31*/	vsOut_T8.w = r4.z;
/*32*/	r1.xy = (r0.wwww * r1.xyxx + r5.xzxx).xy;
/*33*/	r3.w = r5.y * cb2.data[6].y;
/*34*/	r5.xz = (r1.xxyx + r2.zzwz).xz;
/*35*/	r1.x = r4.y * cb2.data[3].y + -r3.w;
/*36*/	r1.x = r0.w * r1.x + r3.w;
/*37*/	r5.y = cb2.data[0].x * cb2.data[3].w + r1.x;
/*38*/	r3.xyz = (r3.xyzx * cb3.data[1].xyzx + r5.xyzx).xyz;
/*39*/	r1.x = cb2.data[0].x * cb2.data[3].w + -r3.y;
/*40*/	r1.x = r0.z * r1.x + r3.y;
/*41*/	r3.y = r0.z * cb3.data[0].y + r1.x;
/*42*/	r1.xy = (-r2.zwzz + r3.xzxx).xy;
/*43*/	r3.w = 1.000000;
/*44*/	gl_Position.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*45*/	gl_Position.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*46*/	gl_Position.z = dot(r3.xyzw, cb0.data[11].xyzw);
/*47*/	gl_Position.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*48*/	vsOut_T1.xyz = (r3.xyzx).xyz;
/*49*/	r3.xyz = (r3.xyzx + -cb0.data[0].xyzx).xyz;
/*50*/	vsOut_T2.zw = (r0.xxxy).zw;
/*51*/	r4.xyzw = (textureLod(s_coast_waves_grad_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*52*/	vsOut_T2.xy = (r1.zwzz * cb2.data[0].yyyy).xy;
/*53*/	r0.xy = (r4.xyxx * cb3.data[1].wwww).xy;
/*54*/	r5.xyzw = (textureLod(s_shallow_grad_sampler, r1.zwzz.st, 0.000000)).xyzw;
/*55*/	r2.zw = (-r4.xxxy * cb3.data[1].wwww + r5.xxxy).zw;
/*56*/	vsOut_T8.y = r4.z;
/*57*/	r0.xz = (r2.xxxx * r2.zzwz + r0.xxyx).xz;
/*58*/	vsOut_T4.zw = (r2.xxxy).zw;
/*59*/	r0.y = 2.000000;
/*60*/	r2.xyz = (r0.xyzx * cb2.data[5].xyzx).xyz;
/*61*/	r0.y = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*62*/	r0.y = inversesqrt(r0.y);
/*63*/	r2.xyz = (r0.yyyy * r2.xyzx).xyz;
/*64*/	r4.xyzw = (textureLod(s_deep_grad_sampler, r1.zwzz.st, 0.000000)).xzyw;
/*65*/	vsOut_T5.xy = (r1.zwzz).xy;
/*66*/	r1.zw = (-r0.xxxz + r4.xxxz).zw;
/*67*/	vsOut_T4.xy = (r0.wwww * r1.zwzz + r0.xzxx).xy;
/*68*/	r4.y = 2.000000;
/*69*/	r0.xyz = (r4.xyzx * cb2.data[1].xyzx).xyz;
/*70*/	r1.z = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*71*/	r1.z = inversesqrt(r1.z);
/*72*/	r0.xyz = (r0.xyzx * r1.zzzz + -r2.xyzx).xyz;
/*73*/	vsOut_T3.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*74*/	vsOut_T8.z = r0.w;
/*75*/	r0.xy = (cb1.data[1].zwzz * cb1.data[3].xxxx).xy;
/*76*/	r0.xy = (r1.xyxx / r0.xyxx).xy;
/*77*/	r0.z = -r0.y;
/*78*/	vsOut_T5.zw = (r0.xxxz + r6.xxxz).zw;
/*79*/	vsOut_T6.xyzw = vsIn_P0.xzxz * cb2.data[2].xxyy;
/*80*/	r0.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*81*/	r0.x = sqrt(r0.x);
/*82*/	vsOut_T7.xyz = (r3.xyzx / r0.xxxx).xyz;
/*83*/	vsOut_T7.w = r0.x;
/*84*/	r0.x = saturate(r0.x / cb2.data[0].z);
/*85*/	r0.x = log2(r0.x);
/*86*/	r0.x = r0.x * cb2.data[0].w;
/*87*/	vsOut_T8.x = exp2(r0.x);
/*88*/	return;
}
