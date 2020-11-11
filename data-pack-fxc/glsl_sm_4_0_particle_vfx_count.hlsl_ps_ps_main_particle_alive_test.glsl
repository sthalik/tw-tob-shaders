//
//
// Shader Model 4
// Fragment Shader
//
// id: 1564 - fxc/glsl_SM_4_0_particle_vfx_count.hlsl_PS_ps_main_particle_alive_test.glsl
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

void main()
{
  color0 = vec4(0);
  vec4 r0;

/*0*/	r0.xy = (gl_FragCoord.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*1*/	r0.xy = (uintBitsToFloat(uvec4(r0.xyxx))).xy;
/*2*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*3*/	r0.xyzw = texelFetch(g_particle_instances, floatBitsToInt(r0.xyzw).stp, floatBitsToInt(r0.xyzw).a).xyzw;
/*4*/	r0.x = intBitsToFloat(int(r0.x));
/*5*/	r0.x = uintBitsToFloat((floatBitsToInt(r0.x) != int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*6*/	color0.x = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x3f800000u));
/*7*/	return;
}
