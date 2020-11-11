//
//
// Shader Model 4
// Fragment Shader
//
// id: 3849 - fxc/glsl_SM_4_0_MLAA_PS_4_0.hlsl_PS_MLAA_PixelShader_SeperatingLines.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out uint color0;

uniform sampler2D g_txInitialImage_10;

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

/*0*/	r0.xyzw = cb1.data[27].xyxy + vec4(-1.000000, -1.000000, -1.000000, -1.000000);
/*1*/	r0.xyzw = floor(r0.xyzw);
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(r0.xyzw));
/*3*/	r1.xyzw = intBitsToFloat(ivec4(gl_FragCoord.xyxy));
/*4*/	r2.xyzw = intBitsToFloat(floatBitsToInt(r1.xyzw) + ivec4(ivec4(0, -1, 1, 0)));
/*5*/	r1.xy = (intBitsToFloat(max(floatBitsToInt(r1.zwzz), ivec4(vec4(0, 0, 0, 0)))).xy) /**/;
/*6*/	r1.xy = (intBitsToFloat(min(floatBitsToInt(r0.xyxx), floatBitsToInt(r1.xyxx))).xy) /**/;
/*7*/	r2.xyzw = intBitsToFloat(max(floatBitsToInt(r2.xyzw), ivec4(vec4(0, 0, 0, 0)))) /**/;
/*8*/	r0.xyzw = intBitsToFloat(min(floatBitsToInt(r0.xyzw), floatBitsToInt(r2.xyzw))) /**/;
/*9*/	r2.xy = (r0.zwzz).xy;
/*10*/	r2.zw = (vec4(0, 0, 0, 0)).zw;
/*11*/	r2.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r2.xyzw).st, floatBitsToInt(r2.xyzw).a).xyzw;
/*12*/	r2.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*13*/	r1.zw = (vec4(0, 0, 0, 0)).zw;
/*14*/	r1.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r1.xyzw).st, floatBitsToInt(r1.xyzw).a).xyzw;
/*15*/	r1.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*16*/	r1.y = -r2.x + r1.x;
/*17*/	r1.y = uintBitsToFloat((cb0.data[0].x < abs(r1.y)) ? 0xffffffffu : 0x00000000u);
/*18*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*19*/	r0.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw;
/*20*/	r0.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*21*/	r0.x = -r0.x + r1.x;
/*22*/	r0.x = uintBitsToFloat((cb0.data[0].x < abs(r0.x)) ? 0xffffffffu : 0x00000000u);
/*23*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.x) & uint(1));
/*24*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*25*/	color0 = (floatBitsToUint(r1.y) > 0x00000000u) ? floatBitsToUint(r0.x) : floatBitsToUint(r0.y);
/*26*/	return;
}
