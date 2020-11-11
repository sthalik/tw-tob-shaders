//
//
// Shader Model 4
// Fragment Shader
//
// id: 1567 - fxc/glsl_SM_4_0_particle_vfx_count.hlsl_PS_ps_main_particle_alive_gather.glsl
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

uniform sampler2D g_tex_particle_count;

layout(std140) uniform cb_vfx_particle_count
{
  vec4 data[1];
} cb0;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = vsOut_T0.xyxy * cb0.data[0].xxxx + vec4(-0.500000, -0.500000, 0.500000, -0.500000);
/*1*/	r0.xyzw = intBitsToFloat(ivec4(r0.zwxy));
/*2*/	r1.xy = (r0.zwzz).xy;
/*3*/	r1.zw = (vec4(0, 0, 0, 0)).zw;
/*4*/	r1.xyzw = texelFetch(g_tex_particle_count, floatBitsToInt(r1.xyzw).st, floatBitsToInt(r1.xyzw).a).xyzw;
/*5*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*6*/	r0.xyzw = texelFetch(g_tex_particle_count, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw;
/*7*/	r0.x = r0.x + r1.x;
/*8*/	r1.xyzw = vsOut_T0.xyxy * cb0.data[0].xxxx + vec4(-0.500000, 0.500000, 0.500000, 0.500000);
/*9*/	r1.xyzw = intBitsToFloat(ivec4(r1.zwxy));
/*10*/	r2.xy = (r1.zwzz).xy;
/*11*/	r2.zw = (vec4(0, 0, 0, 0)).zw;
/*12*/	r2.xyzw = texelFetch(g_tex_particle_count, floatBitsToInt(r2.xyzw).st, floatBitsToInt(r2.xyzw).a).xyzw;
/*13*/	r0.x = r0.x + r2.x;
/*14*/	r1.zw = (vec4(0, 0, 0, 0)).zw;
/*15*/	r1.xyzw = texelFetch(g_tex_particle_count, floatBitsToInt(r1.xyzw).st, floatBitsToInt(r1.xyzw).a).xyzw;
/*16*/	color0.x = r0.x + r1.x;
/*17*/	return;
}
