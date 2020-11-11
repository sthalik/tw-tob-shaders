// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 31 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_sprite.hlsl_VS_alpha_over_time_vertex.glsl
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
/*12*/	r0.x = -vsIn_T2.z + cb1.data[0].y;
/*13*/	r0.yz = (-vsIn_T2.zzxz + vsIn_T2.wwyw).yz;
/*14*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*15*/	r0.x = saturate(r0.y * r0.x);
/*16*/	r0.y = r0.x * -2.000000 + 3.000000;
/*17*/	r0.x = r0.x * r0.x;
/*18*/	r0.x = r0.x * r0.y;
/*19*/	vsOut_T1.x = r0.x * r0.z + vsIn_T2.x;
/*20*/	vsOut_T1.yzw = (vsIn_T2.yyzw).yzw;
/*21*/	vsOut_T2.xyzw = vsIn_T3.xyzw * cb1.data[1].xyxy + cb1.data[1].zwzw;
/*22*/	return;
}
