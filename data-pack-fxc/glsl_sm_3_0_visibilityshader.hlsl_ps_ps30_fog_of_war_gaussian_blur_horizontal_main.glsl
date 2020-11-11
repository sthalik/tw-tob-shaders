//
//
// Shader Model 4
// Fragment Shader
//
// id: 3919 - fxc/glsl_SM_3_0_VisibilityShader.hlsl_PS_ps30_fog_of_war_gaussian_blur_horizontal_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D s_fog_of_war_source;
uniform sampler2D s_always_visible_source;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform fog_of_war_PS
{
  vec4 data[8];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx / cb1.data[0].xxxx).xy;
/*2*/	r1.xyzw = vec4(0, 0, 0, 0);
/*3*/	r0.z = intBitsToFloat(int(-3));
/*4*/	while(true) {
/*5*/	  r0.w = uintBitsToFloat((int(3) < floatBitsToInt(r0.z)) ? 0xffffffffu : 0x00000000u) /**/;
/*6*/	  if(r0.w != 0) break;
/*7*/	  r0.w = floatBitsToInt(r0.z);
/*8*/	  r2.xy = (r0.wwww * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xy;
/*9*/	  r2.xy = (r2.xyxx / cb1.data[0].xxxx).xy;
/*10*/	  r2.xy = (r0.xyxx + r2.xyxx).xy;
/*11*/	  r0.w = abs(r0.w) * abs(r0.w);
/*12*/	  r0.w = r0.w * -0.080150;
/*13*/	  r0.w = exp2(r0.w);
/*14*/	  r0.w = r0.w * 0.132981;
/*15*/	  r3.xyzw = (textureLod(s_fog_of_war_source, r2.xyxx.st, 0.000000)).xyzw;
/*16*/	  r2.xyzw = (textureLod(s_always_visible_source, r2.xyxx.st, 0.000000)).xyzw;
/*17*/	  r2.x = max(r2.x, r3.x);
/*18*/	  r2.yzw = (r3.xxxx).yzw;
/*19*/	  r1.xyzw = r2.xyzw * r0.wwww + r1.xyzw;
/*20*/	  r0.z = intBitsToFloat(floatBitsToInt(r0.z) + int(1));
/*21*/	}
/*22*/	color0.xyzw = r1.xyzw * vec4(1.317786, 1.317786, 1.317786, 1.317786);
/*23*/	return;
}
