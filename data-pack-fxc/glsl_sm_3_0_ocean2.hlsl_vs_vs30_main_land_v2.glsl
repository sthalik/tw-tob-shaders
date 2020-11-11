// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 6828 - fxc/glsl_SM_3_0_ocean2.hlsl_VS_vs30_main_land_v2.glsl
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

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;

uniform sampler2D s_land_heights_sampler;

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
/*1*/	r0.xz = (vsIn_P0.xxzx * cb1.data[1].xxyx + r0.xxyx).xz;
/*2*/	r1.xy = (r0.xzxx + -cb1.data[2].xyxx).xy;
/*3*/	r2.xy = (r1.xyxx * cb1.data[2].zwzz).xy;
/*4*/	r2.w = r1.x * cb1.data[2].z + -0.003906;
/*5*/	r2.z = -r2.y;
/*6*/	r1.xyzw = (textureLod(s_land_heights_sampler, r2.xzxx.st, 0.000000)).xyzw;
/*7*/	r0.y = r1.x * cb2.data[3].w;
/*8*/	r0.w = 1.000000;
/*9*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*10*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*11*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*12*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*13*/	r1.xy = (abs(vsIn_P0.xzxx) * cb1.data[0].zwzz).xy;
/*14*/	vsOut_T0.xy = (r1.xyxx * vec4(10.000000, 10.000000, 0.000000, 0.000000)).xy;
/*15*/	r1.xyzw = r2.xzxz;
/*16*/	vsOut_T0.zw = (r1.zzzw).zw;
/*17*/	vsOut_T4.xyzw = r1.xyzw;
/*18*/	r1.xy = (r2.xzxx + vec4(0.003906, 0.000000, 0.000000, 0.000000)).xy;
/*19*/	r3.xyzw = r2.xyxy * vec4(1.000000, -1.000000, 1.000000, -1.000000) + vec4(0.000000, -0.003906, 0.000000, 0.003906);
/*20*/	r2.xyzw = (textureLod(s_land_heights_sampler, r2.wzww.st, 0.000000)).xyzw;
/*21*/	r1.xyzw = (textureLod(s_land_heights_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*22*/	r1.xy = (-r2.xyxx + r1.xyxx).xy;
/*23*/	r1.xy = (r1.xyxx * vec4(-8.000000, -8.000000, 0.000000, 0.000000)).xy;
/*24*/	r2.xyzw = (textureLod(s_land_heights_sampler, r3.xyxx.st, 0.000000)).xyzw;
/*25*/	r3.xyzw = (textureLod(s_land_heights_sampler, r3.zwzz.st, 0.000000)).xyzw;
/*26*/	r2.xy = (-r2.xyxx + r3.xyxx).xy;
/*27*/	r2.xy = (r2.xyxx * vec4(-8.000000, -8.000000, 0.000000, 0.000000)).xy;
/*28*/	r1.w = r2.x;
/*29*/	r1.z = 2.000000;
/*30*/	r0.w = dot(vec3(r1.xzwx), vec3(r1.xzwx));
/*31*/	r0.w = inversesqrt(r0.w);
/*32*/	vsOut_T1.xyz = (r0.wwww * r1.xzwx).xyz;
/*33*/	r2.zw = (r1.yyyz).zw;
/*34*/	r0.y = vsIn_P0.y;
/*35*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*36*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*37*/	r0.w = sqrt(r0.w);
/*38*/	vsOut_T2.xyz = (r0.xyzx / r0.wwww).xyz;
/*39*/	vsOut_T2.w = r0.w;
/*40*/	r0.x = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*41*/	r0.x = inversesqrt(r0.x);
/*42*/	vsOut_T3.xyz = (r0.xxxx * r2.zwyz).xyz;
/*43*/	return;
}
