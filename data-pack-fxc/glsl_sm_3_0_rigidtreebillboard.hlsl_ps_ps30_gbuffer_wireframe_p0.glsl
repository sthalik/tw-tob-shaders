//
//
// Shader Model 4
// Fragment Shader
//
// id: 1346 - fxc/glsl_SM_3_0_rigidtreebillboard.hlsl_PS_ps30_gbuffer_wireframe_p0.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

void main()
{
/*0*/	color0.xyzw = vec4(0, 0, 0, 0);
/*1*/	color1.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*2*/	color2.xyzw = vec4(0, 0, 0, 0);
/*3*/	color3.xyzw = vec4(0, 0, 0, 0);
/*4*/	return;
}
