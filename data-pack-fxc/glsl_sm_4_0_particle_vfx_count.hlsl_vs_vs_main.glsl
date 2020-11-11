// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1565 - fxc/glsl_SM_4_0_particle_vfx_count.hlsl_VS_vs_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


out vec4 vsOut_T0;

void main()
{
  vsOut_T0 = vec4(0);
  vec4 r0;

/*0*/	r0.x = uintBitsToFloat(uint(gl_VertexID) >> uint(1));
/*1*/	r0.x = floatBitsToUint(r0.x);
/*2*/	gl_Position.x = r0.x * 4.000000 + -1.000000;
/*3*/	vsOut_T0.x = r0.x + r0.x;
/*4*/	r0.x = uintBitsToFloat(uint(gl_VertexID) & uint(1));
/*5*/	r0.x = floatBitsToUint(r0.x);
/*6*/	gl_Position.y = r0.x * 4.000000 + -1.000000;
/*7*/	vsOut_T0.y = -r0.x * 2.000000 + 1.000000;
/*8*/	gl_Position.zw = (vec4(0, 0, 0, 1.000000)).zw;
/*9*/	return;
}
