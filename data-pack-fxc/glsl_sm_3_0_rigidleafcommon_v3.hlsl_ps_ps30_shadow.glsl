//
//
// Shader Model 4
// Fragment Shader
//
// id: 606 - fxc/glsl_SM_3_0_rigidleafcommon_v3.hlsl_PS_ps30_shadow.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T2;

layout(location = 0) out vec4 color0;

uniform sampler2D s_dissolve_map;
uniform sampler2D s_diffuse_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (vsOut_T1.xyxx * vec4(10.000000, 10.000000, 0.000000, 0.000000)).xy;
/*1*/	r0.xyzw = (texture(s_dissolve_map, r0.xyxx.st)).xyzw;
/*2*/	r0.x = saturate(r0.x + vsOut_T1.z);
/*3*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r0.x = -r0.x * vsOut_T1.z + r1.w;
/*5*/	r0.x = r0.x + -0.500000;
/*6*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*7*/	if(r0.x != 0) discard;
/*8*/	r0.xyz = (vsOut_T2.xyzx).xyz;
/*9*/	r0.w = 1.000000;
/*10*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*11*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*12*/	color0.x = r1.x / r0.x;
/*13*/	color0.yzw = (vec4(0, 0, 0, 1.000000)).yzw;
/*14*/	return;
}
