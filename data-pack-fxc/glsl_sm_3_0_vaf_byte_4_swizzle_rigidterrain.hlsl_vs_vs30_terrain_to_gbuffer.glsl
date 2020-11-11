// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1498 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidterrain.hlsl_VS_vs30_terrain_to_gbuffer.glsl
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

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vsOut_T0 = vec4(0);
  vsOut_T1 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	gl_Position.xyw = (vsIn_P0.xyxw).xyw;
/*1*/	gl_Position.z = 1.000000;
/*2*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*3*/	r0.xy = (vsIn_P0.xyxx).xy;
/*4*/	r0.zw = (vec4(0, 0, 1.000000, 1.000000)).zw;
/*5*/	r1.x = dot(r0.xyww, cb0.data[21].xyzw);
/*6*/	r1.y = dot(r0.xyww, cb0.data[22].xyzw);
/*7*/	r1.z = dot(r0.xyww, cb0.data[23].xyzw);
/*8*/	r0.x = dot(r0.xyzw, cb0.data[24].xyzw);
/*9*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*10*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*11*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*12*/	r0.w = inversesqrt(r0.w);
/*13*/	vsOut_T1.xyz = (r0.wwww * r0.xyzx).xyz;
/*14*/	return;
}
