// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 122 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_local_texture_coords_vertex.glsl
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
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;
in vec4 vsIn_T6;

out vec4 vsOut_C0;
out vec4 vsOut_T0;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;

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
vsOut_T2 = vec4(0);
vsOut_T3 = vec4(0);
vsOut_T4 = vec4(0);
vsOut_T5 = vec4(0);
  vec4 r0;

/*0*/	gl_Position.z = vsIn_P0.z;
/*1*/	gl_Position.w = 1.000000;
/*2*/	r0.xy = (vsIn_P0.xyxx * cb1.data[1].xyxx + cb1.data[1].zwzz).xy;
/*3*/	gl_Position.xy = (r0.xyxx).xy;
/*4*/	vsOut_T5.xy = (r0.xyxx).xy;
/*5*/	r0.xyz = saturate(vsIn_C0.zyxz).xyz;
/*6*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*7*/	r0.xyz = (r0.xyzx * cb0.data[0].yyyy).xyz;
/*8*/	vsOut_C0.xyz = (exp2(r0.xyzx)).xyz;
/*9*/	vsOut_C0.w = vsIn_C0.w;
/*10*/	r0.x = fract(vsIn_T1.y);
/*11*/	r0.x = -r0.x + vsIn_T1.y;
/*12*/	r0.xyz = (uintBitsToFloat(uvec4(lessThan(r0.xxxx, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*13*/	r0.zw = (mix(vec4(0, 0, 0, 1.000000), vec4(0, 0, 1.000000, 1.000000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*14*/	r0.yz = (mix(r0.zzwz, vec4(0, 1.000000, 0, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).yz;
/*15*/	vsOut_T0.zw = (mix(r0.yyyz, vec4(0, 0, 0, 0), greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).zw;
/*16*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*17*/	vsOut_T2.xyzw = vsIn_T6.xyzw;
/*18*/	vsOut_T3.xyzw = vsIn_T2.xyzw;
/*19*/	vsOut_T4.xyzw = vsIn_T3.xyzw * cb1.data[1].xyxy + cb1.data[1].zwzw;
/*20*/	vsOut_T5.z = vsIn_P0.w;
/*21*/	return;
}
