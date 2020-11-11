//
//
// Shader Model 4
// Fragment Shader
//
// id: 188 - fxc/glsl_SM_4_0_reflections_blur.hlsl_PS_ps40_main_blur_x.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_1_sampler;
uniform sampler2D s_reflection_buffer;
uniform sampler2D s_blur_parameters_buffer;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform parameters
{
  vec4 data[2];
} cb1;

void main()
{
  const vec4 c[9] = vec4[9](
    vec4(0.05000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.09000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.12000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.15000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.16000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.15000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.12000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.09000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.05000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000)
  );
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb1.data[0].w)).z;
/*3*/	r1.xy = (r0.zzzz * r0.xyxx).xy;
/*4*/	r2.xyzw = (textureLod(gbuffer_channel_1_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*5*/	r2.xyz = (r2.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*6*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*7*/	r0.w = inversesqrt(r0.w);
/*8*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*9*/	r1.xyzw = (textureLod(s_blur_parameters_buffer, r1.xyxx.st, 0.000000)).xyzw;
/*10*/	r0.w = r1.x * 1.900000 + 0.100000;
/*11*/	r1.xy = (r0.wwww * cb0.data[27].zwzz).xy;
/*12*/	r1.zw = (cb0.data[27].zzzw * vec4(0.000000, 0.000000, 0.500000, 0.500000)).zw;
/*13*/	r1.xy = (r1.xyxx * vec4(0.000000, 1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = -cb1.data[0].y + 1.000000;
/*15*/	r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*16*/	r2.w = 0;
/*17*/	r3.xyzw = vec4(0, 0, 0, 0);
/*18*/	while(true) {
/*19*/	  r4.x = uintBitsToFloat((floatBitsToInt(r3.w) >= int(9)) ? 0xffffffffu : 0x00000000u);
/*20*/	  if(r4.x != 0) break;
/*21*/	  r4.xy = intBitsToFloat((floatBitsToInt(r3.wwww) + ivec4(ivec4(-4, 1, 0, 0))).xy);
/*22*/	  r4.z = floatBitsToInt(r4.x);
/*23*/	  r4.zw = (r1.xxxy * r4.zzzz + r0.xxxy).zw;
/*24*/	  r4.x = intBitsToFloat(max(floatBitsToInt(r4.x), int(-1))) /**/;
/*25*/	  r4.x = intBitsToFloat(min(floatBitsToInt(r4.x), int(1))) /**/;
/*26*/	  r4.x = floatBitsToInt(r4.x);
/*27*/	  r4.xz = (r1.zzwz * r4.xxxx + r4.zzwz).xz;
/*28*/	  r4.xz = (r0.zzzz * r4.xxzx).xz;
/*29*/	  r5.xyzw = (textureLod(gbuffer_channel_1_sampler, r4.xzxx.st, 0.000000)).xyzw;
/*30*/	  r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*31*/	  r4.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*32*/	  r4.w = inversesqrt(r4.w);
/*33*/	  r5.xyz = (r4.wwww * r5.xyzx).xyz;
/*34*/	  r6.xyzw = (textureLod(s_reflection_buffer, r4.xzxx.st, 0.000000)).xyzw;
/*35*/	  r4.x = uintBitsToFloat((floatBitsToInt(r3.w) == int(4)) ? 0xffffffffu : 0x00000000u) /**/;
/*36*/	  r4.z = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*37*/	  r4.z = r4.z + -cb1.data[0].y;
/*38*/	  r4.z = saturate(r0.w * r4.z);
/*39*/	  r4.w = r4.z * -2.000000 + 3.000000;
/*40*/	  r4.z = r4.z * r4.z;
/*41*/	  r4.z = r4.z * r4.w;
/*42*/	    r4.x = (floatBitsToUint(r4.x) > 0x00000000u) ? 1.000000 : r4.z;
/*43*/	  r4.z = r4.x * c[uint(floatBitsToInt(r3.w))].x;
/*44*/	  r3.xyz = (r6.xyzx * r4.zzzz + r3.xyzx).xyz;
/*45*/	  r2.w = c[uint(floatBitsToInt(r3.w))].x * r4.x + r2.w;
/*46*/	  r3.w = r4.y;
/*47*/	}
/*48*/	color0.xyz = (r3.xyzx / r2.wwww).xyz;
/*49*/	return;
}
