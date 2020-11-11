// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 20 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_pulse_vertex.glsl
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

/*0*/	gl_Position.w = 1.000000;
/*1*/	r0.xy = (vsIn_P0.xyxx * cb1.data[1].xyxx + cb1.data[1].zwzz).xy;
/*2*/	r0.z = vsIn_P0.z;
/*3*/	gl_Position.xyz = (r0.xyzx).xyz;
/*4*/	vsOut_T3.xyz = (r0.xyzx).xyz;
/*5*/	r0.xyz = saturate(vsIn_C0.zyxz).xyz;
/*6*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*7*/	r0.xyz = (r0.xyzx * cb0.data[0].yyyy).xyz;
/*8*/	vsOut_C0.xyz = (exp2(r0.xyzx)).xyz;
/*9*/	vsOut_C0.w = vsIn_C0.w;
/*10*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*11*/	vsOut_T0.z = vsIn_P0.w;
/*12*/	r0.x = uintBitsToFloat((0.000000 < vsIn_T2.w) ? 0xffffffffu : 0x00000000u);
/*13*/	r0.y = uintBitsToFloat((vsIn_T2.w >= cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*14*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*15*/	r0.y = uintBitsToFloat((vsIn_T2.z == 0.000000) ? 0xffffffffu : 0x00000000u);
/*16*/	r1.xyz = (mix(vsIn_T2.xyzx, vec4(1.000000, 2.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*17*/	r0.y = r1.z * cb1.data[0].x;
/*18*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*19*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? r1.z : -r1.z;
/*20*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).z;
/*21*/	r0.z = r0.z * cb1.data[0].x;
/*22*/	r0.z = fract(r0.z);
/*23*/	r0.y = r0.z * r0.y;
/*24*/	r0.y = r0.y / r1.z;
/*25*/	r0.y = r0.y * 6.283185;
/*26*/	r0.y = cos((r0.y));
/*27*/	r0.y = r0.y + 1.000000;
/*28*/	r2.yz = (r0.yyyy * vec4(0.000000, 0.500000, 0.250000, 0.000000)).yz;
/*29*/	r1.w = r2.y;
/*30*/	r2.x = r1.y + r1.y;
/*31*/	vsOut_T1.yz = (mix(r1.yywy, r2.xxzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).yz;
/*32*/	vsOut_T1.x = r1.x;
/*33*/	vsOut_T1.w = vsIn_T2.w;
/*34*/	vsOut_T2.xyzw = vsIn_T3.xyzw * cb1.data[1].xyxy + cb1.data[1].zwzw;
/*35*/	return;
}
