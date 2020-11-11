//
//
// Shader Model 4
// Fragment Shader
//
// id: 295 - fxc/glsl_SM_3_0_gridspline.hlsl_PS_ps30_main_border.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform grid_spline_PS
{
  vec4 data[2];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (-vsOut_T1.xzxx + cb0.data[0].xzxx).xy;
/*1*/	r0.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*2*/	r0.x = sqrt(r0.x);
/*3*/	r0.x = -r0.x * 0.005000 + 1.000000;
/*4*/	r0.yz = (-vsOut_T1.xxzx + cb2.data[1].xxzx).yz;
/*5*/	r0.y = dot(vec2(r0.yzyy), vec2(r0.yzyy));
/*6*/	r0.y = sqrt(r0.y);
/*7*/	r0.y = -r0.y * 0.005000 + 1.000000;
/*8*/	r0.xy = (max(r0.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).xy;
/*9*/	r0.x = max(r0.y, r0.x);
/*10*/	r0.y = vsOut_T0.x + -0.500000;
/*11*/	r0.y = -abs(r0.y) * 3.000000 + 1.000000;
/*12*/	r0.y = max(r0.y, 0.000000);
/*13*/	r0.x = r0.x * r0.y;
/*14*/	r1.xyzw = (texture(s_diffuse, vsOut_T0.xyxx.st)).xyzw;
/*15*/	r1.xyzw = r1.xyzw * cb2.data[0].xyzw;
/*16*/	color0.w = r0.x * r1.w;
/*17*/	r0.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*18*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 12.000000 : 0.400000;
/*19*/	color0.xyz = (r0.xxxx * r1.xyzx).xyz;
/*20*/	return;
}
