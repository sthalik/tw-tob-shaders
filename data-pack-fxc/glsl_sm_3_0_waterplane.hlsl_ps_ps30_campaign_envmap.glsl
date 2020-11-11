//
//
// Shader Model 4
// Fragment Shader
//
// id: 230 - fxc/glsl_SM_3_0_waterplane.hlsl_PS_ps30_campaign_envmap.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D s_normal;
uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (vsOut_T0.xyxx * vec4(-1.100000, -1.200000, 0.000000, 0.000000) + vec4(0.100000, 0.200000, 0.000000, 0.000000)).xy;
/*1*/	r0.z = cb0.data[26].x * 0.001000;
/*2*/	r0.xy = (r0.xyxx * vec4(4.000000, 4.000000, 0.000000, 0.000000) + r0.zzzz).xy;
/*3*/	r0.xy = (r0.xyxx * vec4(1.700000, 1.700000, 0.000000, 0.000000)).xy;
/*4*/	r1.xyzw = (texture(s_normal, r0.xyxx.st)).xyzw;
/*5*/	r0.xyw = (r1.xwxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + vec4(-1.000000, -1.000000, 0.000000, -1.000000)).xyw;
/*6*/	r1.xy = (vsOut_T1.xyxx * vec4(0.900000, 0.900000, 0.000000, 0.000000) + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*7*/	r1.xy = (r1.xyxx * vec4(4.000000, 4.000000, 0.000000, 0.000000) + r0.zzzz).xy;
/*8*/	r1.xy = (r1.xyxx * vec4(2.600000, 2.600000, 0.000000, 0.000000)).xy;
/*9*/	r1.xyzw = (texture(s_normal, r1.xyxx.st)).xyzw;
/*10*/	r0.xyz = (r1.xwzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r0.xywx).xyz;
/*11*/	r0.xyz = (r0.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*12*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*13*/	r0.w = inversesqrt(r0.w);
/*14*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*15*/	r1.x = max(abs(r0.z), abs(r0.y));
/*16*/	r1.x = max(abs(r0.x), r1.x);
/*17*/	r1.xyz = (r0.xyzx / r1.xxxx).xyz;
/*18*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*19*/	color0.w = 0.120000;
/*20*/	color1.xyzw = vec4(0, 0, 0, 0.100000);
/*21*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*22*/	r0.w = max(r0.y, 0.000000);
/*23*/	r0.xyzw = (texture(s_sky, r0.xwzx.stp)).xyzw;
/*24*/	color3.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.076000, 0.080000, 0.100000, 0.000000)).xyz;
/*25*/	color3.w = 1.000000;
/*26*/	return;
}
