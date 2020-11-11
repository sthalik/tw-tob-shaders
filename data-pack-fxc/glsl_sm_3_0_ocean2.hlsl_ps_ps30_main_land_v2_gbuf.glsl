//
//
// Shader Model 4
// Fragment Shader
//
// id: 6827 - fxc/glsl_SM_3_0_ocean2.hlsl_PS_ps30_main_land_v2_gbuf.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T4;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_land_colors_sampler;

layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	color0.xyzw = vec4(0, 0, 0, 0);
/*1*/	r0.xy = (vsOut_T4.zwzz * vec4(16.000000, 16.000000, 0.000000, 0.000000)).xy;
/*2*/	r0.xyzw = (texture(s_land_colors_sampler, r0.xyxx.st)).xyzw;
/*3*/	r0.xyz = (r0.xyzx * r0.xyzx).xyz;
/*4*/	r1.xyzw = (texture(s_land_colors_sampler, vsOut_T4.zwzz.st)).xyzw;
/*5*/	r0.xyz = (r0.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r1.xyzx).xyz;
/*6*/	r0.w = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*7*/	r0.w = inversesqrt(r0.w);
/*8*/	r1.xyz = (r0.wwww * vsOut_T1.xyzx).xyz;
/*9*/	r0.w = saturate(dot(vec3(r1.xyzx), vec3(-cb0.data[0].yzwy)));
/*10*/	color1.xyz = saturate(r0.xyzx * r0.wwww).xyz;
/*11*/	color1.w = 0;
/*12*/	color2.xyzw = vec4(0, 0, 0, 0);
/*13*/	color3.xyzw = vec4(0, 0, 0, 0);
/*14*/	return;
}
