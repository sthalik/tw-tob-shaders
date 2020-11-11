//
//
// Shader Model 4
// Fragment Shader
//
// id: 1421 - fxc/glsl_SM_3_0_spline.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse1;

layout(std140) uniform spline_PS
{
  vec4 data[2];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.x = -cb0.data[0].x * vsOut_T0.x + cb0.data[0].x;
/*1*/	r0.y = cb0.data[0].x * 0.500000;
/*2*/	r0.y = min(r0.y, 1.000000);
/*3*/	r0.x = r0.x / r0.y;
/*4*/	r0.x = -r0.x * 0.500000 + 1.000000;
/*5*/	r0.z = -r0.y + cb0.data[0].x;
/*6*/	r0.w = vsOut_T0.x * cb0.data[0].x;
/*7*/	r0.z = uintBitsToFloat((r0.z < r0.w) ? 0xffffffffu : 0x00000000u);
/*8*/	r0.x = (floatBitsToUint(r0.z) > 0x00000000u) ? r0.x : 0.500000;
/*9*/	r0.z = r0.w / r0.y;
/*10*/	r0.y = uintBitsToFloat((r0.w < r0.y) ? 0xffffffffu : 0x00000000u);
/*11*/	r0.z = r0.z * 0.500000;
/*12*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.z : r0.x;
/*13*/	r0.y = uintBitsToFloat((1.000000 < cb0.data[0].x) ? 0xffffffffu : 0x00000000u);
/*14*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : vsOut_T0.x;
/*15*/	r0.y = vsOut_T0.y;
/*16*/	r0.xyzw = (texture(s_diffuse1, r0.xyxx.st)).xyzw;
/*17*/	r0.xyzw = r0.xyzw * cb0.data[1].xyzw;
/*18*/	r0.xyz = (r0.xyzx * vec4(20.000000, 20.000000, 20.000000, 0.000000)).xyz;
/*19*/	color0.w = saturate(r0.w * 20.000000 + -0.100000);
/*20*/	color0.xyz = (r0.xyzx).xyz;
/*21*/	return;
}
