//
//
// Shader Model 4
// Fragment Shader
//
// id: 580 - fxc/glsl_SM_3_0_rigidbranchcommon_v3.hlsl_PS_ps30_gbuffer_zprefill.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_diffuse_burn_map;
uniform sampler2D s_fire_map;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (vsOut_T1.xyxx * vec4(0.600000, 0.600000, 0.000000, 0.000000)).xy;
/*1*/	r0.xyzw = (texture(s_fire_map, r0.xyxx.st)).xyzw;
/*2*/	r0.x = log2(r0.z);
/*3*/	r0.y = -r0.w + 1.000000;
/*4*/	r0.y = log2(r0.y);
/*5*/	r0.y = r0.y * vsOut_T1.z;
/*6*/	r0.y = exp2(r0.y);
/*7*/	r0.y = min(r0.y, 1.000000);
/*8*/	r0.y = r0.y * vsOut_T1.z;
/*9*/	r0.x = r0.x * 1.800000;
/*10*/	r0.x = exp2(r0.x);
/*11*/	r0.x = r0.x * 10.000000;
/*12*/	r0.x = min(r0.x, 1.000000);
/*13*/	r1.xyzw = (texture(s_diffuse_burn_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*14*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*15*/	r1.xyzw = r1.xyzw + -r2.xyzw;
/*16*/	r1.xyzw = vsOut_T1.zzzz * r1.xyzw + r2.xyzw;
/*17*/	r0.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*18*/	r0.z = saturate(-r0.z * 15.000000 + 1.000000);
/*19*/	r0.x = r0.x + r0.z;
/*20*/	r0.x = r0.x * 0.500000 + 1.000000;
/*21*/	r0.x = -r1.w + r0.x;
/*22*/	r0.x = r0.y * r0.x + r1.w;
/*23*/	r0.y = -r0.x + 1.000000;
/*24*/	r0.z = vsOut_T1.z + -0.025000;
/*25*/	r0.z = max(r0.z, 0.000000);
/*26*/	r0.x = r0.z * r0.y + r0.x;
/*27*/	r0.x = r0.x + -0.500000;
/*28*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*29*/	if(r0.x != 0) discard;
/*30*/	color0.xyzw = vec4(0, 0, 0, 0);
/*31*/	return;
}
