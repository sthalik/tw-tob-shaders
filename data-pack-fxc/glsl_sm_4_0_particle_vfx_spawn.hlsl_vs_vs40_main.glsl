// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 53 - fxc/glsl_SM_4_0_particle_vfx_spawn.hlsl_VS_vs40_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_C0;
in vec4 vsIn_C1;
in vec4 vsIn_C2;

out vec4 vsOut_EID0;
out vec4 vsOut_Pos0;
out vec4 vsOut_V0;

uniform sampler2D g_tex_sorted_data;

layout(std140) uniform cb_vfx_shared
{
  vec4 data[2];
} cb0;

void main()
{
  vsOut_EID0 = vec4(0);
  vsOut_Pos0 = vec4(0);
  vsOut_V0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = cb0.data[0].z * cb0.data[0].z + -1.000000;
/*1*/	r0.x = uintBitsToFloat(uint(r0.x));
/*2*/	r0.x = intBitsToFloat(floatBitsToInt(r0.x) + -gl_VertexID);
/*3*/	r0.x = floatBitsToUint(r0.x);
/*4*/	r0.y = r0.x * cb0.data[0].z;
/*5*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*6*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? cb0.data[0].z : -cb0.data[0].z/**/;
/*7*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).z;
/*8*/	r0.z = r0.z * r0.x;
/*9*/	r0.x = r0.x / cb0.data[0].z;
/*10*/	r1.y = uintBitsToFloat(uint(r0.x));
/*11*/	r0.x = fract(r0.z);
/*12*/	r0.x = r0.x * r0.y;
/*13*/	r1.x = uintBitsToFloat(uint(r0.x));
/*14*/	r1.zw = (vec4(0, 0, 0, 0)).zw;
/*15*/	r0.xyzw = texelFetch(g_tex_sorted_data, floatBitsToInt(r1.xyzw).st, floatBitsToInt(r1.xyzw).a).xyzw;
/*16*/	r0.x = uintBitsToFloat(uint(r0.y));
/*17*/	r0.x = floatBitsToUint(r0.x);
/*18*/	r0.y = r0.x * cb0.data[0].y;
/*19*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*20*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? cb0.data[0].y : -cb0.data[0].y/**/;
/*21*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).z;
/*22*/	r0.z = r0.z * r0.x;
/*23*/	r0.x = r0.x / cb0.data[0].y;
/*24*/	r1.x = uintBitsToFloat(uint(r0.x));
/*25*/	r0.x = fract(r0.z);
/*26*/	r0.x = r0.x * r0.y;
/*27*/	r1.y = uintBitsToFloat(uint(r0.x));
/*28*/	r0.xy = (floatBitsToUint(r1.xyxx)).xy;
/*29*/	r0.x = -r0.x + cb0.data[0].y;
/*30*/	r0.x = r0.x + -1.000000;
/*31*/	r0.x = uintBitsToFloat(uint(r0.x));
/*32*/	r0.x = floatBitsToUint(r0.x);
/*33*/	r1.xy = (r0.yxyy + r0.yxyy).xy;
/*34*/	r0.x = cb0.data[0].y + -1.000000;
/*35*/	gl_Position.xy = (-r0.xxxx + r1.xyxx).xy;
/*36*/	gl_Position.z = 0;
/*37*/	gl_Position.w = cb0.data[0].y/**/;
/*38*/	vsOut_EID0.xyzw = vsIn_C0.xyzw;
/*39*/	vsOut_Pos0.xyzw = vsIn_C1.xyzw;
/*40*/	vsOut_V0.xyzw = vsIn_C2.xyzw;
/*41*/	return;
}
