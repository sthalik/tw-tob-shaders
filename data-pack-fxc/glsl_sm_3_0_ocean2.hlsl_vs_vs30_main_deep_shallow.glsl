// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 6812 - fxc/glsl_SM_3_0_ocean2.hlsl_VS_vs30_main_deep_shallow.glsl
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

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xy = (vsIn_T0.xyxx * cb1.data[1].zwzz).xy;
/*1*/	r0.xy = (vsIn_P0.xzxx * cb1.data[1].xyxx + r0.xyxx).xy;
/*2*/	r0.zw = (r0.xxxy + -cb1.data[2].xxxy).zw;
/*3*/	r1.xy = (r0.zwzz * cb1.data[2].zwzz).xy;
/*4*/	r1.z = -r1.y;
/*5*/	r2.xyzw = (textureLod(s_land_heights_sampler, r1.xzxx.st, 0.000000)).xyzw;
/*6*/	r0.zw = (-r2.zzzx + cb2.data[0].xxxx).zw;
/*7*/	r0.zw = saturate(r0.zzzw / cb2.data[4].xxxy).zw;
/*8*/	r0.z = r0.z * r0.z;
/*9*/	vsOut_T8.w = r0.w;
/*10*/	r1.yw = (cb1.data[0].xxxy + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*11*/	r1.yw = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r1.yyyw).yw;
/*12*/	r1.yw = (r1.yyyw * abs(vsIn_P0.xxxz)).yw;
/*13*/	r2.xyzw = (textureLod(s_deep_displace_sampler, r1.ywyy.st, 0.000000)).xyzw;
/*14*/	r3.xyzw = (textureLod(s_shallow_displace_sampler, r1.ywyy.st, 0.000000)).xyzw;
/*15*/	r0.w = r3.y * cb2.data[6].y;
/*16*/	r2.y = r2.y * cb2.data[3].y + -r0.w;
/*17*/	r2.xz = (r2.xxzx + -r3.xxzx).xz;
/*18*/	r2.xz = (r0.zzzz * r2.xxzx + r3.xxzx).xz;
/*19*/	r0.w = r0.z * r2.y + r0.w;
/*20*/	r3.y = cb2.data[0].x * cb2.data[3].w + r0.w;
/*21*/	r3.xz = (r0.xxyx + r2.xxzx).xz;
/*22*/	r3.w = 1.000000;
/*23*/	gl_Position.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*24*/	gl_Position.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*25*/	gl_Position.z = dot(r3.xyzw, cb0.data[11].xyzw);
/*26*/	gl_Position.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*27*/	vsOut_T1.xyz = (r3.xyzx).xyz;
/*28*/	r0.xyw = (r3.xyxz + -cb0.data[0].xyxz).xyw;
/*29*/	vsOut_T2.xy = (r1.ywyy * cb2.data[0].yyyy).xy;
/*30*/	vsOut_T2.zw = (vec4(0, 0, 0, 0)).zw;
/*31*/	r3.xyzw = (textureLod(s_deep_grad_sampler, r1.ywyy.st, 0.000000)).xzyw;
/*32*/	vsOut_T5.xy = (r1.ywyy).xy;
/*33*/	vsOut_T4.xy = (r3.xzxx).xy;
/*34*/	r3.y = 2.000000;
/*35*/	r4.xyz = (r3.xyzx * cb2.data[5].xyzx).xyz;
/*36*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*37*/	r1.y = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*38*/	r1.y = inversesqrt(r1.y);
/*39*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*40*/	r1.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*41*/	r1.y = inversesqrt(r1.y);
/*42*/	r3.xyz = (r3.xyzx * r1.yyyy + -r4.xyzx).xyz;
/*43*/	vsOut_T3.xyz = (r0.zzzz * r3.xyzx + r4.xyzx).xyz;
/*44*/	vsOut_T8.z = r0.z;
/*45*/	vsOut_T4.zw = (vec4(0, 0, 0, 0)).zw;
/*46*/	r1.yw = (cb1.data[1].zzzw * cb1.data[3].xxxx).yw;
/*47*/	r2.xy = (r2.xzxx / r1.ywyy).xy;
/*48*/	r2.z = -r2.y;
/*49*/	vsOut_T5.zw = (r1.xxxz + r2.xxxz).zw;
/*50*/	vsOut_T6.xyzw = vsIn_P0.xzxz * cb2.data[2].xxyy;
/*51*/	r0.z = dot(vec3(r0.xywx), vec3(r0.xywx));
/*52*/	r0.z = sqrt(r0.z);
/*53*/	vsOut_T7.xyz = (r0.xywx / r0.zzzz).xyz;
/*54*/	vsOut_T7.w = r0.z;
/*55*/	r0.x = saturate(r0.z / cb2.data[0].z);
/*56*/	r0.x = log2(r0.x);
/*57*/	r0.x = r0.x * cb2.data[0].w;
/*58*/	vsOut_T8.x = exp2(r0.x);
/*59*/	vsOut_T8.y = 0;
/*60*/	return;
}
