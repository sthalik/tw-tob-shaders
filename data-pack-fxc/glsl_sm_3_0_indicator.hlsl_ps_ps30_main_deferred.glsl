//
//
// Shader Model 4
// Fragment Shader
//
// id: 339 - fxc/glsl_SM_3_0_indicator.hlsl_PS_ps30_main_deferred.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C0;
in vec4 vsOut_T2;

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D indicator_texture_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (texture(indicator_texture_sampler, vsOut_T0.xyxx.st)).xyzw;
/*1*/	r1.x = r0.w * vsOut_C0.w + -0.003922;
/*2*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*3*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.x != 0) discard;
/*5*/	r1.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*6*/	r1.xy = (r1.xyxx * cb0.data[27].zwzz).xy;
/*7*/	r2.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.xyxx.st, 0.000000)).yzxw;
/*8*/	r2.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*9*/	r2.w = 1.000000;
/*10*/	r1.x = dot(r2.xyzw, cb0.data[19].xyzw);
/*11*/	r1.y = dot(r2.xyzw, cb0.data[20].xyzw);
/*12*/	r1.x = r1.x / r1.y;
/*13*/	r1.y = vsOut_T2.z / vsOut_T2.w;
/*14*/	r1.z = -r1.x + r1.y;
/*15*/	r1.x = uintBitsToFloat((r1.x < r1.y) ? 0xffffffffu : 0x00000000u);
/*16*/	r1.yz = (uintBitsToFloat(uvec4(lessThan(r1.zzzz, vec4(0.000000, 0.500000, 5.000000, 0.000000))) * 0xffffffffu)).yz;
/*17*/	r1.z = (floatBitsToUint(r1.z) > 0x00000000u) ? 1.000000 : 0.070000;
/*18*/	r1.y = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.y));
/*19*/	r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? r1.y : 1.000000;
/*20*/	r0.w = r0.w * r1.x;
/*21*/	color0.w = r0.w * 0.500000;
/*22*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*23*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 30.000000 : 1.000000;
/*24*/	color0.xyz = (r0.wwww * r0.xyzx).xyz;
/*25*/	return;
}
