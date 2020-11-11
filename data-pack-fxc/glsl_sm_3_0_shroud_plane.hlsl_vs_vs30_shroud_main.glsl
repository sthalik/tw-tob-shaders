// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 233 - fxc/glsl_SM_3_0_shroud_plane.hlsl_VS_vs30_shroud_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;

out vec4 vsOut_T0;

uniform sampler2D s_low_res_height_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb1;
layout(std140) uniform shroud_plane_buffer
{
  vec4 data[1];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xy = (vsIn_P0.xzxx + cb2.data[0].xyxx).xy;
/*1*/	r0.xz = trunc((r0.xxyx).xz);
/*2*/	r0.y = -r0.z + cb1.data[3].y;
/*3*/	r1.xy = (r0.xyxx / cb1.data[3].xyxx).xy;
/*4*/	r1.xy = (max(r1.xyxx, vec4(0.001000, 0.001000, 0.000000, 0.000000))).xy;
/*5*/	r1.zw = (min(r1.xxxy, vec4(0.000000, 0.000000, 0.999000, 0.999000))).zw;
/*6*/	r1.xy = (r1.zwzz + cb1.data[2].zwzz).xy;
/*7*/	r2.xyzw = (textureLod(s_low_res_height_map, r1.zyzz.st, 0.000000)).xyzw;
/*8*/	r3.xyzw = (textureLod(s_low_res_height_map, r1.xyxx.st, 0.000000)).xyzw;
/*9*/	r4.xyzw = (textureLod(s_low_res_height_map, r1.xwxx.st, 0.000000)).xyzw;
/*10*/	r1.x = -r2.x + r3.x;
/*11*/	r2.yz = (r1.zzwz * cb1.data[2].xxyx).yz;
/*12*/	r3.xyzw = (textureLod(s_low_res_height_map, r1.zwzz.st, 0.000000)).xyzw;
/*13*/	r1.yz = (fract(r2.yyzy)).yz;
/*14*/	r1.x = r1.y * r1.x + r2.x;
/*15*/	r1.w = -r3.x + r4.x;
/*16*/	r1.y = r1.y * r1.w + r3.x;
/*17*/	r1.x = -r1.y + r1.x;
/*18*/	r1.x = r1.z * r1.x + r1.y;
/*19*/	r1.x = r1.x * cb1.data[0].x + 1.000000;
/*20*/	r1.x = r1.x + -cb1.data[0].z;
/*21*/	r0.y = r1.x + 0.100000;
/*22*/	r0.w = 1.000000;
/*23*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*24*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*25*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*26*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*27*/	vsOut_T0.xyzw = r0.xyzw;
/*28*/	return;
}
