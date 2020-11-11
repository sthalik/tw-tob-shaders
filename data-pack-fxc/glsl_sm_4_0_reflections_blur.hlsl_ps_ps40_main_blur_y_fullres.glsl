//
//
// Shader Model 4
// Fragment Shader
//
// id: 193 - fxc/glsl_SM_4_0_reflections_blur.hlsl_PS_ps40_main_blur_y_fullres.glsl
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
uniform sampler2D gbuffer_channel_3_sampler;
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
  vec4 r7;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.xyxx.st, r0.y)).xyzw;
/*3*/	r2.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.xyxx.st, r0.y)).xyzw;
/*4*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*5*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*6*/	r0.z = inversesqrt(r0.z);
/*7*/	r1.xyz = (r0.zzzz * r1.xyzx).xyz;
/*8*/	r0.z = uintBitsToFloat(floatBitsToUint(cb1.data[0].x) & uint(8));
/*9*/	r0.z = (floatBitsToUint(r0.z) > 0x00000000u) ? 1.000000 : 0;
/*10*/	r3.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*11*/	r2.xyz = (r0.zzzz * r3.xyzx + r2.xyzx).xyz;
/*12*/	r3.xyzw = (textureLod(s_blur_parameters_buffer, r0.xyxx.st, 0.000000)).xyzw;
/*13*/	r0.z = r3.x * 1.900000 + 0.100000;
/*14*/	r0.zw = (r0.zzzz * cb0.data[27].zzzw).zw;
/*15*/	r3.xz = (cb0.data[27].zzwz * vec4(0.500000, 0.000000, 0.500000, 0.000000)).xz;
/*16*/	r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, 1.000000, 0.000000)).zw;
/*17*/	r1.w = -cb1.data[0].y + 1.000000;
/*18*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*19*/	r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*20*/	r2.w = 0;
/*21*/	r3.w = 0;
/*22*/	while(true) {
/*23*/	  r4.w = uintBitsToFloat((floatBitsToInt(r3.w) >= int(9)) ? 0xffffffffu : 0x00000000u);
/*24*/	  if(r4.w != 0) break;
/*25*/	  r5.xy = intBitsToFloat((floatBitsToInt(r3.wwww) + ivec4(ivec4(-4, 1, 0, 0))).xy);
/*26*/	  r4.w = floatBitsToInt(r5.x);
/*27*/	  r5.zw = (r0.zzzw * r4.wwww + r0.xxxy).zw;
/*28*/	  r4.w = intBitsToFloat(max(floatBitsToInt(r5.x), int(-1))) /**/;
/*29*/	  r4.w = intBitsToFloat(min(floatBitsToInt(r4.w), int(1))) /**/;
/*30*/	  r4.w = floatBitsToInt(r4.w);
/*31*/	  r5.xz = (r3.xxzx * r4.wwww + r5.zzwz).xz;
/*32*/	  r6.xyzw = (textureLod(gbuffer_channel_1_sampler, r5.xzxx.st, 0.000000)).xyzw;
/*33*/	  r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*34*/	  r4.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*35*/	  r4.w = inversesqrt(r4.w);
/*36*/	  r6.xyz = (r4.wwww * r6.xyzx).xyz;
/*37*/	  r7.xyzw = (textureLod(s_reflection_buffer, r5.xzxx.st, 0.000000)).xyzw;
/*38*/	  r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(4)) ? 0xffffffffu : 0x00000000u) /**/;
/*39*/	  r5.x = dot(vec3(r6.xyzx), vec3(r1.xyzx));
/*40*/	  r5.x = r5.x + -cb1.data[0].y;
/*41*/	  r5.x = saturate(r1.w * r5.x);
/*42*/	  r5.z = r5.x * -2.000000 + 3.000000;
/*43*/	  r5.x = r5.x * r5.x;
/*44*/	  r5.x = r5.x * r5.z;
/*45*/	    r4.w = (floatBitsToUint(r4.w) > 0x00000000u) ? 1.000000 : r5.x;
/*46*/	  r5.x = r4.w * c[uint(floatBitsToInt(r3.w))].x;
/*47*/	  r4.xyz = (r7.xyzx * r5.xxxx + r4.xyzx).xyz;
/*48*/	  r2.w = c[uint(floatBitsToInt(r3.w))].x * r4.w + r2.w;
/*49*/	  r3.w = r5.y;
/*50*/	}
/*51*/	r0.xyz = (r4.xyzx / r2.wwww).xyz;
/*52*/	r1.xyz = (r2.xyzx * r3.yyyy).xyz;
/*53*/	color0.xyz = (r0.xyzx * r1.xyzx).xyz;
/*54*/	return;
}
