// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 54 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_mask_vertex.glsl
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
in vec4 vsIn_T2;
in vec4 vsIn_T3;
in vec4 vsIn_P1;
in vec4 vsIn_T5;

out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;
out vec4 vsOut_T8;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform sprite_VS
{
  vec4 data[3];
} cb1;

void main()
{
vsOut_C0 = vec4(0);
vsOut_T0 = vec4(0);
vsOut_T3 = vec4(0);
vsOut_T4 = vec4(0);
vsOut_T5 = vec4(0);
vsOut_T6 = vec4(0);
vsOut_T8 = vec4(0);
  vec4 r0;

/*0*/	gl_Position.zw = (vec4(0, 0, 0, 1.000000)).zw;
/*1*/	r0.xy = (vsIn_P0.xyxx * cb1.data[1].xyxx + cb1.data[1].zwzz).xy;
/*2*/	gl_Position.xy = (r0.xyxx).xy;
/*3*/	vsOut_T5.xy = (r0.xyxx).xy;
/*4*/	r0.xyz = saturate(vsIn_C0.zyxz).xyz;
/*5*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*6*/	r0.xyz = (r0.xyzx * cb0.data[0].yyyy).xyz;
/*7*/	vsOut_C0.xyz = (exp2(r0.xyzx)).xyz;
/*8*/	vsOut_C0.w = vsIn_C0.w;
/*9*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*10*/	vsOut_T0.zw = (vsIn_T5.xxxy).zw;
/*11*/	vsOut_T3.xyzw = vsIn_T2.xyzw;
/*12*/	vsOut_T4.xyzw = vsIn_T3.xyzw * cb1.data[1].xyxy + cb1.data[1].zwzw;
/*13*/	vsOut_T5.z = vsIn_P0.w;
/*14*/	vsOut_T6.xyz = (vsIn_P1.xyzx).xyz;
/*15*/	return;
}
