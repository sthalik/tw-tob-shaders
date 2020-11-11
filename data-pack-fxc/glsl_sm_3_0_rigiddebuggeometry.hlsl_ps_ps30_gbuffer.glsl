//
//
// Shader Model 4
// Fragment Shader
//
// id: 594 - fxc/glsl_SM_3_0_rigiddebuggeometry.hlsl_PS_ps30_gbuffer.glsl
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
in vec4 vsOut_T5;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T1.xyzx).xyz;
/*3*/	r0.w = max(abs(r0.z), abs(r0.y));
/*4*/	r0.w = max(r0.w, abs(r0.x));
/*5*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*6*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*7*/	color0.w = 0;
/*8*/	r0.xyz = (vsOut_T5.xyzx * vsOut_C1.xyzx).xyz;
/*9*/	r0.xyz = (sqrt(r0.xyzx)).xyz;
/*10*/	color1.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*11*/	color1.w = 0;
/*12*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*13*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*14*/	r0.w = 1.000000;
/*15*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*16*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*17*/	color3.x = r1.x / r0.x;
/*18*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*19*/	color4 = uint(0);
/*20*/	return;
}
