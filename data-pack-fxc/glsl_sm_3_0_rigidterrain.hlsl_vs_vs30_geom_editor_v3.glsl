// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1456 - fxc/glsl_SM_3_0_rigidterrain.hlsl_VS_vs30_geom_editor_v3.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_P3;
in vec4 vsIn_P5;

out vec4 vsOut_T0;
out vec4 vsOut_T1;

uniform sampler2D s_editor_hf_height_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform vs_height_map_cb
{
  vec4 data[6];
} cb1;
layout(std140) uniform ps_editor_vis_cb
{
  vec4 data[1];
} cb2;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xy = (cb2.data[0].zzzz * cb2.data[0].xyxx).xy;
/*1*/	r1.xy = (vsIn_P0.xyxx).xy;
/*2*/	r1.z = 1.000000;
/*3*/	r2.x = dot(vec3(r1.xyzx), vec3(vsIn_P3.xzwx));
/*4*/	r2.z = dot(vec3(r1.xyzx), vec3(vsIn_P5.xzwx));
/*5*/	r0.zw = (r2.xxxz + cb2.data[0].zzzz).zw;
/*6*/	r0.zw = (r0.zzzw / r0.xxxy).zw;
/*7*/	r0.xy = (r0.zwzz + cb1.data[2].zwzz).xy;
/*8*/	r1.xyzw = (textureLod(s_editor_hf_height_map, r0.zyzz.st, 0.000000)).xyzw;
/*9*/	r3.xyzw = (textureLod(s_editor_hf_height_map, r0.xyxx.st, 0.000000)).xyzw;
/*10*/	r4.xyzw = (textureLod(s_editor_hf_height_map, r0.xwxx.st, 0.000000)).xyzw;
/*11*/	r0.x = -r1.x + r3.x;
/*12*/	r1.yz = (r0.zzwz * cb1.data[2].xxyx).yz;
/*13*/	r3.xyzw = (textureLod(s_editor_hf_height_map, r0.zwzz.st, 0.000000)).xyzw;
/*14*/	r0.yz = (fract(r1.yyzy)).yz;
/*15*/	r0.x = r0.y * r0.x + r1.x;
/*16*/	r0.w = -r3.x + r4.x;
/*17*/	r0.y = r0.y * r0.w + r3.x;
/*18*/	r0.x = -r0.y + r0.x;
/*19*/	r2.y = r0.z * r0.x + r0.y;
/*20*/	r2.w = 1.000000;
/*21*/	gl_Position.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*22*/	gl_Position.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*23*/	gl_Position.z = dot(r2.xyzw, cb0.data[11].xyzw);
/*24*/	gl_Position.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*25*/	vsOut_T0.xyzw = r2.xyzw;
/*26*/	return;
}
