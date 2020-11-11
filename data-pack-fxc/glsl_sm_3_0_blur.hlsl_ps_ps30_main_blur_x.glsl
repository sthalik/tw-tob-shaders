//
//
// Shader Model 4
// Fragment Shader
//
// id: 303 - fxc/glsl_SM_3_0_blur.hlsl_PS_ps30_main_blur_x.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D input_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform blur_PS
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xyzw = cb0.data[27].xyxy * vec4(0.250000, 0.250000, 0.250000, 0.250000);
/*1*/	r1.xyzw = gl_FragCoord.xyxy + cb0.data[28].xxxx;
/*2*/	r0.xyzw = r1.xyzw / r0.xyzw;
/*3*/	r1.xyzw = cb1.data[0].xyxy * vec4(-12.000000, -0.000000, -8.000000, -0.000000) + r0.zwzw;
/*4*/	r2.xyzw = (textureLod(input_sampler, r1.zwzz.st, r1.w)).xyzw;
/*5*/	r1.xyzw = (textureLod(input_sampler, r1.xyxx.st, r1.y)).xyzw;
/*6*/	r2.xyz = (r2.xyzx * vec4(0.187500, 0.187500, 0.187500, 0.000000)).xyz;
/*7*/	r1.xyz = (r1.xyzx * vec4(0.031250, 0.031250, 0.031250, 0.000000) + r2.xyzx).xyz;
/*8*/	r2.xyzw = cb1.data[0].xyxy * vec4(-4.000000, -0.000000, 4.000000, 0.000000) + r0.zwzw;
/*9*/	r3.xyzw = (textureLod(input_sampler, r2.xyxx.st, r2.y)).xyzw;
/*10*/	r2.xyzw = (textureLod(input_sampler, r2.zwzz.st, r2.w)).xyzw;
/*11*/	r1.xyz = (r3.xyzx * vec4(0.468750, 0.468750, 0.468750, 0.000000) + r1.xyzx).xyz;
/*12*/	r3.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*13*/	r0.xyzw = cb1.data[0].xyxy * vec4(8.000000, 0.000000, 12.000000, 0.000000) + r0.xyzw;
/*14*/	r1.xyz = (r3.xyzx * vec4(0.625000, 0.625000, 0.625000, 0.000000) + r1.xyzx).xyz;
/*15*/	r1.xyz = (r2.xyzx * vec4(0.468750, 0.468750, 0.468750, 0.000000) + r1.xyzx).xyz;
/*16*/	r2.xyzw = (textureLod(input_sampler, r0.xyxx.st, r0.y)).xyzw;
/*17*/	r0.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*18*/	r1.xyz = (r2.xyzx * vec4(0.187500, 0.187500, 0.187500, 0.000000) + r1.xyzx).xyz;
/*19*/	color0.xyz = saturate(r0.xyzx * vec4(0.031250, 0.031250, 0.031250, 0.000000) + r1.xyzx).xyz;
/*20*/	color0.w = 1.000000;
/*21*/	return;
}
