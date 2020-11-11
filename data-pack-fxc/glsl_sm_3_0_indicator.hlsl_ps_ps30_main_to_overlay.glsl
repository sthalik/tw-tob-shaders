//
//
// Shader Model 4
// Fragment Shader
//
// id: 336 - fxc/glsl_SM_3_0_indicator.hlsl_PS_ps30_main_to_overlay.glsl
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
in vec4 vsOut_C0;

layout(location = 0) out vec4 color0;

uniform sampler2D indicator_texture_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = -vsOut_T1.y + cb0.data[0].y;
/*1*/	r0.x = r0.x * r0.x;
/*2*/	r0.x = r0.x * 0.000400;
/*3*/	r0.x = min(r0.x, 1.000000);
/*4*/	r0.x = max(r0.x, 0.300000);
/*5*/	r1.xyzw = (texture(indicator_texture_sampler, vsOut_T0.xyxx.st)).xyzw;
/*6*/	r1.xyzw = r1.xyzw * vsOut_C0.xyzw;
/*7*/	r0.y = r1.w * r0.x + -0.003922;
/*8*/	r0.x = r0.x * r1.w;
/*9*/	color0.xyz = (r1.xyzx).xyz;
/*10*/	color0.w = r0.x;
/*11*/	r0.x = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*12*/	if(r0.x != 0) discard;
/*13*/	return;
}
