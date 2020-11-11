// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 6806 - fxc/glsl_SM_3_0_ocean2.hlsl_VS_vs30_main_deep.glsl
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

/*0*/	r0.xy = (vsIn_T0.xyxx * cb1.data[1].zwzz).xy;
/*1*/	r0.xy = (vsIn_P0.xzxx * cb1.data[1].xyxx + r0.xyxx).xy;
/*2*/	r0.zw = (cb1.data[0].xxxy + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*3*/	r0.zw = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / r0.zzzw).zw;
/*4*/	r0.zw = (r0.zzzw * abs(vsIn_P0.xxxz)).zw;
/*5*/	r1.xyzw = (textureLod(s_deep_displace_sampler, r0.zwzz.st, 0.000000)).xyzw;
/*6*/	r2.xz = (r0.xxyx + r1.xxzx).xz;
/*7*/	r0.x = r1.y * cb2.data[3].y;
/*8*/	r2.y = cb2.data[0].x * cb2.data[3].w + r0.x;
/*9*/	r2.w = 1.000000;
/*10*/	gl_Position.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*11*/	gl_Position.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*12*/	gl_Position.z = dot(r2.xyzw, cb0.data[11].xyzw);
/*13*/	gl_Position.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*14*/	vsOut_T1.xyz = (r2.xyzx).xyz;
/*15*/	r2.xyz = (r2.xyzx + -cb0.data[0].xyzx).xyz;
/*16*/	vsOut_T2.xy = (r0.zwzz * cb2.data[0].yyyy).xy;
/*17*/	vsOut_T2.zw = (vec4(0, 0, 0, 0)).zw;
/*18*/	r3.xyzw = (textureLod(s_deep_grad_sampler, r0.zwzz.st, 0.000000)).xzyw;
/*19*/	vsOut_T5.xy = (r0.zwzz).xy;
/*20*/	vsOut_T4.xy = (r3.xzxx).xy;
/*21*/	r3.y = 2.000000;
/*22*/	r0.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*23*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	vsOut_T3.xyz = (r0.wwww * r0.xyzx).xyz;
/*26*/	vsOut_T4.zw = (vec4(0, 0, 0, 0)).zw;
/*27*/	r0.xy = (cb1.data[1].zwzz * cb1.data[3].xxxx).xy;
/*28*/	r0.xy = (r1.xzxx / r0.xyxx).xy;
/*29*/	vsOut_T5.zw = (r0.xxxy * vec4(0.000000, 0.000000, 1.000000, -1.000000)).zw;
/*30*/	vsOut_T6.xyzw = vsIn_P0.xzxz * cb2.data[2].xxyy;
/*31*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*32*/	r0.x = sqrt(r0.x);
/*33*/	vsOut_T7.xyz = (r2.xyzx / r0.xxxx).xyz;
/*34*/	vsOut_T7.w = r0.x;
/*35*/	r0.x = saturate(r0.x / cb2.data[0].z);
/*36*/	r0.x = log2(r0.x);
/*37*/	r0.x = r0.x * cb2.data[0].w;
/*38*/	vsOut_T8.x = exp2(r0.x);
/*39*/	vsOut_T8.yzw = (vec4(0, 0, 1.000000, 1.000000)).yzw;
/*40*/	return;
}
