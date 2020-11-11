//
//
// Shader Model 4
// Fragment Shader
//
// id: 3846 - fxc/glsl_SM_3_0_MLAA_PS_3_0.hlsl_PS_MLAA_PixelShader_SeperatingLines.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D s_txInitialImage_9;

layout(std140) uniform cbData
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = gl_FragCoord.xyxy + cb1.data[28].xxxx;
/*1*/	r0.xyzw = r0.xyzw * cb1.data[27].zwzw;
/*2*/	r1.xyzw = cb1.data[27].zwzw * vec4(0.000000, -1.000000, 1.000000, 0.000000) + r0.xyzw;
/*3*/	r0.xyzw = (textureLod(s_txInitialImage_9, r0.zwzz.st, 0.000000)).xyzw;
/*4*/	r0.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*5*/	r2.xyzw = (textureLod(s_txInitialImage_9, r1.zwzz.st, 0.000000)).xyzw;
/*6*/	r1.xyzw = (textureLod(s_txInitialImage_9, r1.xyxx.st, 0.000000)).xyzw;
/*7*/	r0.y = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*8*/	r0.y = -r0.y + r0.x;
/*9*/	r0.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*10*/	r0.x = -r0.z + r0.x;
/*11*/	r0.xy = (uintBitsToFloat(uvec4(lessThan(cb0.data[0].xxxx, abs(r0.xyxx))) * 0xffffffffu)).xy;
/*12*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.y) & uint(0x3f800000u));
/*13*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 3.000000 : 2.000000;
/*14*/	color0.xyzw = mix(r0.zzzz, r0.yyyy, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)));
/*15*/	return;
}
