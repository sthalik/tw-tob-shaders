// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 162 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_vertex_italic.glsl
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
in vec4 vsIn_P2;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
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
layout(std140) uniform sprite_VS
{
  vec4 data[3];
} cb1;

void main()
{
vsOut_C0 = vec4(0);
vsOut_T0 = vec4(0);
vsOut_T1 = vec4(0);
vsOut_T2 = vec4(0);
vsOut_T3 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (uintBitsToFloat(uvec4(equal(vsIn_T1.yyyy, vec4(0.000000, 2.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*1*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*2*/	r1.xy = (vsIn_P0.xyxx * cb1.data[1].xyxx + cb1.data[1].zwzz).xy;
/*3*/	r0.y = -vsIn_P2.y * 0.267949 + r1.x;
/*4*/	r1.x = (floatBitsToUint(r0.x) > 0x00000000u) ? r0.y : r1.x;
/*5*/	r1.z = vsIn_P0.z;
/*6*/	gl_Position.xyz = (r1.xyzx).xyz;
/*7*/	vsOut_T3.xyz = (r1.xyzx).xyz;
/*8*/	gl_Position.w = 1.000000;
/*9*/	r0.xyz = saturate(vsIn_C0.zyxz).xyz;
/*10*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*11*/	r0.xyz = (r0.xyzx * cb0.data[0].yyyy).xyz;
/*12*/	vsOut_C0.xyz = (exp2(r0.xyzx)).xyz;
/*13*/	vsOut_C0.w = vsIn_C0.w;
/*14*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*15*/	vsOut_T0.z = vsIn_P0.w;
/*16*/	vsOut_T1.xyzw = vsIn_T2.xyzw;
/*17*/	vsOut_T2.xyzw = vsIn_T3.xyzw * cb1.data[1].xyxy + cb1.data[1].zwzw;
/*18*/	return;
}
