//
//
// Shader Model 4
// Fragment Shader
//
// id: 1131 - fxc/glsl_SM_3_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_gbuffer_unlit.glsl
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

layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*1*/	r1.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb0.data[0].y))) * 0xffffffffu)).x;
/*2*/	if(floatBitsToUint(r1.x) != 0u) {
/*3*/	  r0.x = 1.000000;
/*4*/	}
/*5*/	r0.x = r0.x + -0.500000;
/*6*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*7*/	if(r0.x != 0) discard;
/*8*/	color1.xyz = saturate(r0.yzwy).xyz;
/*9*/	color1.w = 0;
/*10*/	color0.xyzw = vec4(0, 0, 0, 0);
/*11*/	color2.xyzw = vec4(0, 0, 0, 0);
/*12*/	color3.xyzw = vec4(0, 0, 0, 0);
/*13*/	return;
}
