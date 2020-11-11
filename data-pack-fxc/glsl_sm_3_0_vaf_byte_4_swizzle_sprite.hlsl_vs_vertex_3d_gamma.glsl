// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 140 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_vertex_3d_gamma.glsl
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

out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;

void main()
{
vsOut_C0 = vec4(0);
vsOut_T0 = vec4(0);
vsOut_T1 = vec4(0);
vsOut_T2 = vec4(0);
vsOut_T3 = vec4(0);
  vec4 r0;

/*0*/	gl_Position.xyz = (vsIn_P0.xyzx * vec4(1.000000, 1.000000, 2.000000, 0.000000) + vec4(0.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*1*/	gl_Position.w = 1.000000;
/*2*/	r0.xyz = saturate(vsIn_C0.zyxz).xyz;
/*3*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*4*/	r0.xyz = (r0.xyzx * cb0.data[0].yyyy).xyz;
/*5*/	vsOut_C0.xyz = (exp2(r0.xyzx)).xyz;
/*6*/	vsOut_C0.w = vsIn_C0.w;
/*7*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*8*/	vsOut_T0.z = vsIn_P0.w;
/*9*/	vsOut_T1.xyzw = vsIn_T2.xyzw;
/*10*/	vsOut_T2.xyzw = vsIn_T3.xyzw;
/*11*/	vsOut_T3.xyz = (vsIn_P0.xyzx).xyz;
/*12*/	return;
}
