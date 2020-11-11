//
//
// Shader Model 4
// Fragment Shader
//
// id: 2641 - fxc/glsl_SM_3_0_weightedwithburn.hlsl_PS_ps30_gbuffer_unlit.glsl
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
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;

void main()
{
  vec4 r0;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	color1.xyz = saturate(r0.xyzx).xyz;
/*3*/	r0.x = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.x != 0) discard;
/*5*/	color0.xyzw = vec4(0, 0, 0, 0);
/*6*/	color1.w = 0;
/*7*/	color2.xyzw = vec4(0, 0, 0, 0);
/*8*/	color3.xyzw = vec4(0, 0, 0, 0);
/*9*/	return;
}
