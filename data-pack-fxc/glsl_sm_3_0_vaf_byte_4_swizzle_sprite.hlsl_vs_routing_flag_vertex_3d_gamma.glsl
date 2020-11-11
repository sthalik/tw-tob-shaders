// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 148 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_routing_flag_vertex_3d_gamma.glsl
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
  vec4 r2;

/*0*/	gl_Position.xyz = (vsIn_P0.xyzx * vec4(1.000000, 1.000000, 2.000000, 0.000000) + vec4(0.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*1*/	gl_Position.w = 1.000000;
/*2*/	r0.xyz = saturate(vsIn_C0.zyxz).xyz;
/*3*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*4*/	r0.xyz = (r0.xyzx * cb0.data[0].yyyy).xyz;
/*5*/	vsOut_C0.xyz = (exp2(r0.xyzx)).xyz;
/*6*/	vsOut_C0.w = vsIn_C0.w;
/*7*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*8*/	vsOut_T0.z = vsIn_P0.w;
/*9*/	r0.x = uintBitsToFloat((0.000000 < vsIn_T2.w) ? 0xffffffffu : 0x00000000u);
/*10*/	r0.y = uintBitsToFloat((vsIn_T2.w >= cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*11*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*12*/	r0.y = uintBitsToFloat((vsIn_T2.z == 0.000000) ? 0xffffffffu : 0x00000000u);
/*13*/	r1.xyz = (mix(vsIn_T2.xyzx, vec4(1.000000, 2.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*14*/	r0.y = r1.z * cb1.data[0].x;
/*15*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*16*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? r1.z : -r1.z;
/*17*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).z;
/*18*/	r0.z = r0.z * cb1.data[0].x;
/*19*/	r0.z = fract(r0.z);
/*20*/	r0.y = r0.z * r0.y;
/*21*/	r0.y = r0.y / r1.z;
/*22*/	r0.y = r0.y * 6.283185;
/*23*/	r0.y = cos((r0.y));
/*24*/	r0.y = r0.y + 1.000000;
/*25*/	r2.yz = (r0.yyyy * vec4(0.000000, 0.500000, 0.250000, 0.000000)).yz;
/*26*/	r1.w = r2.y;
/*27*/	r2.x = r1.y + r1.y;
/*28*/	vsOut_T1.yz = (mix(r1.yywy, r2.xxzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).yz;
/*29*/	vsOut_T1.x = r1.x;
/*30*/	vsOut_T1.w = vsIn_T2.w;
/*31*/	vsOut_T2.xyzw = vsIn_T3.xyzw;
/*32*/	vsOut_T3.xyz = (vsIn_P0.xyzx * vec4(1.000000, 1.000000, 2.000000, 0.000000) + vec4(0.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*33*/	return;
}
