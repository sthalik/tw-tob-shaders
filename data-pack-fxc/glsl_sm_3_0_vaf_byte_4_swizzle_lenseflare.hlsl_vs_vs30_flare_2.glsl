// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 348 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_LenseFlare.hlsl_VS_vs30_flare_2.glsl
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

out vec4 vsOut_C0;
out vec4 vsOut_T0;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lense_flare_VS
{
  vec4 data[3];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = dot(vec3(cb1.data[0].yzwy), vec3(cb1.data[0].yzwy));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * cb1.data[0].yzwy).xyz;
/*3*/	r0.x = dot(vec3(cb0.data[3].xyzx), vec3(r0.xyzx));
/*4*/	r0.y = abs(r0.x) * -0.018729 + 0.074261;
/*5*/	r0.y = r0.y * abs(r0.x) + -0.212114;
/*6*/	r0.y = r0.y * abs(r0.x) + 1.570729;
/*7*/	r0.z = -abs(r0.x) + 1.000000;
/*8*/	r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*9*/	r0.z = sqrt(r0.z);
/*10*/	r0.w = r0.z * r0.y;
/*11*/	r0.w = r0.w * -2.000000 + 3.141593;
/*12*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.w));
/*13*/	r0.x = r0.y * r0.z + r0.x;
/*14*/	r0.x = r0.x * 1.637022;
/*15*/	r0.x = min(r0.x, 1.000000);
/*16*/	r0.x = -r0.x + 1.000000;
/*17*/	r0.x = r0.x * 0.600000 + 0.400000;
/*18*/	r0.x = r0.x * cb1.data[0].x;
/*19*/	r0.y = r0.x * 1.500000 + 0.500000;
/*20*/	r0.x = r0.x * cb1.data[1].x;
/*21*/	vsOut_C0.xyz = (r0.xxxx * vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*22*/	r0.xy = (r0.yyyy * vsIn_P0.xyxx).xy;
/*23*/	r1.xyz = (cb1.data[0].yzwy).xyz/**/;
/*24*/	r1.w = 1.000000;
/*25*/	r2.x = dot(r1.xyzw, cb0.data[1].xyzw);
/*26*/	r2.y = dot(r1.xyzw, cb0.data[2].xyzw);
/*27*/	r1.z = dot(r1.xyzw, cb0.data[3].xyzw);
/*28*/	r1.xy = (r0.xyxx * vec4(3600.000000, 3600.000000, 0.000000, 0.000000) + r2.xyxx).xy;
/*29*/	r1.w = 1.000000;
/*30*/	gl_Position.x = dot(r1.xyzw, cb0.data[5].xyzw);
/*31*/	gl_Position.y = dot(r1.xyzw, cb0.data[6].xyzw);
/*32*/	gl_Position.z = dot(r1.xyzw, cb0.data[7].xyzw);
/*33*/	gl_Position.w = dot(r1.xyzw, cb0.data[8].xyzw);
/*34*/	vsOut_C0.w = 1.000000;
/*35*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*36*/	return;
}
