//
//
// Shader Model 4
// Fragment Shader
//
// id: 440 - fxc/glsl_SM_3_0_projectiletrail.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;
in vec4 vsOut_T4;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_normal_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform projectile_trail_PS
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = saturate(vsOut_T0.y / vsOut_T0.z);
/*1*/	r0.y = -abs(vsOut_T0.x) + 1.000000;
/*2*/	r0.z = vsOut_T0.z + -vsOut_T5.x;
/*3*/	r0.z = saturate(r0.z / vsOut_T5.y);
/*4*/	r0.w = uintBitsToFloat((cb1.data[0].x != 0.000000) ? 0xffffffffu : 0x00000000u);
/*5*/	if(floatBitsToUint(r0.w) != 0u) {
/*6*/	  r0.w = cb0.data[26].x * 0.050000;
/*7*/	  r1.x = -0.000000;
/*8*/	  r1.y = -r0.w;
/*9*/	  r1.xy = (vsOut_T4.xyxx * vec4(0.033333, 0.033333, 0.000000, 0.000000) + r1.xyxx).xy;
/*10*/	  r1.xyzw = (texture(s_normal_map, r1.xyxx.st)).xyzw;
/*11*/	  r0.z = -r0.z + 1.000000;
/*12*/	  color0.xyz = (r1.xyzx).xyz;
/*13*/	} else {
/*14*/	  color0.xyz = (vsOut_C0.xyzx).xyz;
/*15*/	}
/*16*/	r0.x = r0.x * r0.y;
/*17*/	r0.x = r0.z * r0.x;
/*18*/	color0.w = r0.x * vsOut_C0.w;
/*19*/	return;
}
