//
//
// Shader Model 4
// Fragment Shader
//
// id: 1550 - fxc/glsl_SM_4_0_particle_vfx_main.hlsl_PS_ps_main_wireframe.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 gsOut_T1;

layout(location = 0) out vec4 color0;

void main()
{
  color0 = vec4(0);
  vec4 r0;

/*0*/	r0.xy = (gsOut_T1.zwzz + gsOut_T1.zwzz).xy;
/*1*/	r0.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.990000, 0.990000, 0.000000, 0.000000), abs(r0.xyxx))) * 0xffffffffu)).xy;
/*2*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*3*/	color0.xyzw = uintBitsToFloat(floatBitsToUint(r0.xxxx) & uvec4(vec4(0x41200000u, 0x41200000u, 0x41200000u, 0x3f400000u)));
/*4*/	return;
}
