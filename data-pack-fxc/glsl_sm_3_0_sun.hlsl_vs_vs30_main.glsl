// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1527 - fxc/glsl_SM_3_0_sun.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_T0;

out vec4 vsOut_T0;

layout(std140) uniform sun_VS
{
  vec4 data[9];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.x = vsIn_P0.x * cb0.data[8].x + cb0.data[0].w;
/*1*/	r0.y = vsIn_P0.y * cb0.data[8].x + cb0.data[1].w;
/*2*/	r0.z = cb0.data[2].w/**/;
/*3*/	r0.w = cb0.data[3].w/**/;
/*4*/	gl_Position.x = dot(r0.xyzw, cb0.data[4].xyzw);
/*5*/	gl_Position.y = dot(r0.xyzw, cb0.data[5].xyzw);
/*6*/	gl_Position.z = dot(r0.xyzw, cb0.data[6].xyzw);
/*7*/	gl_Position.w = dot(r0.xyzw, cb0.data[7].xyzw);
/*8*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*9*/	return;
}
