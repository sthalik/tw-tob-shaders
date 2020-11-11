//
//
// Shader Model 4
// Fragment Shader
//
// id: 620 - fxc/glsl_SM_3_0_rigidleafcommon_v3.hlsl_PS_ps30_gbuffer_zprefill.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_diffuse_burn_map;
uniform sampler2D s_dissolve_map;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = saturate(vsOut_T1.w);
/*1*/	r1.xyzw = (texture(s_diffuse_burn_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*2*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*3*/	r0.y = r1.w + -r2.w;
/*4*/	r0.x = saturate(r0.x * r0.y + r2.w);
/*5*/	r0.yz = (vsOut_T1.xxyx * vec4(0.000000, 10.000000, 10.000000, 0.000000)).yz;
/*6*/	r1.xyzw = (texture(s_dissolve_map, r0.yzyy.st)).xyzw;
/*7*/	r0.y = saturate(r1.x + vsOut_T2.w);
/*8*/	r0.y = -r0.y * vsOut_T2.w + r0.x;
/*9*/	r0.y = r0.y + -0.500000;
/*10*/	r0.z = vsOut_T1.w * vsOut_T1.w + 0.050000;
/*11*/	r0.x = r1.x * r0.x + -r0.z;
/*12*/	r0.x = min(r0.y, r0.x);
/*13*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*14*/	if(r0.x != 0) discard;
/*15*/	color0.xyzw = vec4(0, 0, 0, 0);
/*16*/	return;
}
