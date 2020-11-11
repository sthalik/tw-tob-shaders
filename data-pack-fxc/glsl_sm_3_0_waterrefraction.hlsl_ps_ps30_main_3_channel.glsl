//
//
// Shader Model 4
// Fragment Shader
//
// id: 10287 - fxc/glsl_SM_3_0_WaterRefraction.hlsl_PS_ps30_main_3_channel.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D s_light_accumulation_buffer;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform water_refraction_PS
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (cb0.data[27].xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*1*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*2*/	r0.xy = (r0.zwzz / r0.xyxx).xy;
/*3*/	r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, r0.y)).yzxw;
/*4*/	r1.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.xyzw = (textureLod(s_light_accumulation_buffer, r0.xyxx.st, r0.y)).xyzw;
/*6*/	color0.xyz = (r0.xyzx).xyz;
/*7*/	r1.w = 1.000000;
/*8*/	r0.x = dot(r1.xyzw, cb0.data[22].xyzw);
/*9*/	r0.y = dot(r1.xyzw, cb0.data[24].xyzw);
/*10*/	r0.x = r0.x / r0.y;
/*11*/	r0.y = uintBitsToFloat((2.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*12*/	r0.x = saturate(-r0.x * cb1.data[0].x);
/*13*/	color0.w = (floatBitsToUint(r0.y) > 0x00000000u) ? 1.000000 : r0.x;
/*14*/	return;
}
