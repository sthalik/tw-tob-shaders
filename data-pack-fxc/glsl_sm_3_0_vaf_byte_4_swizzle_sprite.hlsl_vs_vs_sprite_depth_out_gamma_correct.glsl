// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 133 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_vs_sprite_depth_out_gamma_correct.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_C0;
in vec4 vsIn_T0;
in vec4 vsIn_T3;

out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform sprite_VS
{
  vec4 data[3];
} cb2;

void main()
{
vsOut_C0 = vec4(0);
vsOut_T0 = vec4(0);
vsOut_T1 = vec4(0);
vsOut_T2 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.w = 1.000000;
/*1*/	r0.xy = (vsIn_P0.xyxx * cb2.data[1].xyxx + cb2.data[1].zwzz).xy;
/*2*/	r0.z = vsIn_P0.z;
/*3*/	gl_Position.xyzw = r0.xyzw;
/*4*/	r1.xyz = saturate(vsIn_C0.zyxz).xyz;
/*5*/	r1.xyz = (log2(r1.xyzx)).xyz;
/*6*/	r1.xyz = (r1.xyzx * cb0.data[0].yyyy).xyz;
/*7*/	vsOut_C0.xyz = (exp2(r1.xyzx)).xyz;
/*8*/	vsOut_C0.w = vsIn_C0.w;
/*9*/	r1.x = dot(r0.xyzw, cb1.data[19].xyzw);
/*10*/	r0.w = dot(r0.xyzw, cb1.data[20].xyzw);
/*11*/	vsOut_T2.xyz = (r0.xyzx).xyz;
/*12*/	vsOut_T0.z = r1.x / r0.w;
/*13*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*14*/	vsOut_T1.xyzw = vsIn_T3.xyzw * cb2.data[1].xyxy + cb2.data[1].zwzw;
/*15*/	return;
}
