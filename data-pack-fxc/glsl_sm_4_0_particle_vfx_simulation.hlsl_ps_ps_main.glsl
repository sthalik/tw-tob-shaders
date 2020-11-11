//
//
// Shader Model 4
// Fragment Shader
//
// id: 1 - fxc/glsl_SM_4_0_particle_vfx_simulation.hlsl_PS_ps_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2DArray g_particle_instances;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform cb_vfx_shared
{
  vec4 data[2];
} cb1;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (gl_FragCoord.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*1*/	r0.z = -r0.y + cb1.data[0].y;
/*2*/	r0.z = r0.z + -1.000000;
/*3*/	r1.zw = (intBitsToFloat(ivec4(ivec4(0, 0, 1, 0)))).zw;
/*4*/	r1.xy = (uintBitsToFloat(uvec4(r0.xzxx))).xy;
/*5*/	r0.x = r0.y * cb1.data[0].y + r0.x;
/*6*/	r0.x = uintBitsToFloat(uint(r0.x));
/*7*/	color0.y = floatBitsToUint(r0.x);
/*8*/	r0.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyzw).stp, floatBitsToInt(r1.xyzw).a).xyzw;
/*9*/	r1.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r1.xyww).stp, floatBitsToInt(r1.xyww).a).xyzw;
/*10*/	r0.w = intBitsToFloat(int(r1.x));
/*11*/	r0.w = uintBitsToFloat((floatBitsToInt(r0.w) != int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*12*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*13*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*14*/	r0.x = sqrt(r0.x);
/*15*/	color0.x = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.x : 1000000.000000;
/*16*/	color0.zw = (vec4(0, 0, 0, 0)).zw;
/*17*/	return;
}
