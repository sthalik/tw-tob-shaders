// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 143 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_vertex_3d.glsl
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

void main()
{
vsOut_C0 = vec4(0);
vsOut_T0 = vec4(0);
vsOut_T1 = vec4(0);
vsOut_T2 = vec4(0);
vsOut_T3 = vec4(0);
/*0*/	gl_Position.xyz = (vsIn_P0.xyzx * vec4(1.000000, 1.000000, 2.000000, 0.000000) + vec4(0.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*1*/	gl_Position.w = 1.000000;
/*2*/	vsOut_C0.xyzw = vsIn_C0.zyxw;
/*3*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*4*/	vsOut_T0.z = vsIn_P0.w;
/*5*/	vsOut_T1.xyzw = vsIn_T2.xyzw;
/*6*/	vsOut_T2.xyzw = vsIn_T3.xyzw;
/*7*/	vsOut_T3.xyz = (vsIn_P0.xyzx).xyz;
/*8*/	return;
}
