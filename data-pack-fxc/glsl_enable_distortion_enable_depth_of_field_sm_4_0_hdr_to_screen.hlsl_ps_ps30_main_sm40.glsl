//
//
// Shader Model 4
// Fragment Shader
//
// id: 4276 - fxc/glsl_ENABLE_DISTORTION_ENABLE_DEPTH_OF_FIELD_SM_4_0_HDR_To_Screen.hlsl_PS_ps30_main_sm40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D frame_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D s_fog_of_war_mask;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb1;
layout(std140) uniform shared_fog_of_war_PS
{
  vec4 data[2];
} cb2;
layout(std140) uniform hdr_to_screen_PS
{
  vec4 data[122];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(frame_sampler, r0.xyxx.st, r0.y)).xyzw;
/*3*/	r2.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, r0.y)).yzxw;
/*4*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r2.w = 1.000000;
/*6*/	r0.x = dot(r2.xyzw, cb0.data[21].xyzw);
/*7*/	r0.w = dot(r2.xyzw, cb0.data[23].xyzw);
/*8*/	r0.y = dot(r2.xyzw, cb0.data[24].xyzw);
/*9*/	r0.xy = (r0.xwxx / r0.yyyy).xy;
/*10*/	r0.xw = (r0.xxxy * vec4(0.000488, 0.000000, 0.000000, 0.000488) + vec4(0.500000, 0.000000, 0.000000, 0.500000)).xw;
/*11*/	r2.x = -r0.w + 1.000000;
/*12*/	r2.y = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*13*/	r2.z = uintBitsToFloat((1.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*14*/	r2.y = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.y));
/*15*/	r2.z = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*16*/	r2.y = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.y));
/*17*/	r2.x = uintBitsToFloat((1.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*18*/	r2.x = uintBitsToFloat(floatBitsToUint(r2.x) | floatBitsToUint(r2.y));
/*19*/	if(floatBitsToUint(r2.x) == 0u) {
/*20*/	  r0.yz = (-r0.xxwx + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*21*/	  r2.xyzw = (textureLod(s_fog_of_war_mask, r0.xzxx.st, 0.000000)).xyzw;
/*22*/	  r2.y = uintBitsToFloat((cb2.data[0].y < 1.000000) ? 0xffffffffu : 0x00000000u);
/*23*/	  r0.xyzw = r0.xyzw * vec4(50.000000, 50.000000, 50.000000, 50.000000);
/*24*/	  r0.xyzw = min(r0.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*25*/	  r0.xy = (min(r0.ywyy, r0.xzxx)).xy;
/*26*/	  r0.x = min(r0.y, r0.x);
/*27*/	  r0.x = -r0.x + 1.000000;
/*28*/	  r0.x = max(r0.x, r2.x);
/*29*/	    r0.x = (floatBitsToUint(r2.y) > 0x00000000u) ? r0.x : r2.x;
/*30*/	  r0.y = -cb2.data[0].x + 1.000000;
/*31*/	  r0.x = max(r0.y, r0.x);
/*32*/	} else {
/*33*/	  r0.x = -cb2.data[0].y * cb2.data[0].x + 1.000000;
/*34*/	}
/*35*/	r0.y = dot(vec3(r1.xyzx), vec3(vec4(0.270000, 0.670000, 0.060000, 0.000000)));
/*36*/	r2.xyz = (r0.yyyy * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*37*/	r2.w = r1.w;
/*38*/	r1.xyzw = r1.xyzw + -r2.zzzw;
/*39*/	r0.xyzw = r0.xxxx * r1.xyzw + r2.xyzw;
/*40*/	r0.xyz = saturate(r0.xyzx * cb1.data[0].xxxx).xyz;
/*41*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*42*/	r0.xyz = (r0.xyzx * cb1.data[0].zzzz).xyz;
/*43*/	r1.xyz = (exp2(r0.xyzx)).xyz;
/*44*/	r1.w = 1.000000;
/*45*/	color0.x = dot(r1.xyzw, cb3.data[2].xyzw);
/*46*/	color0.y = dot(r1.xyzw, cb3.data[3].xyzw);
/*47*/	color0.z = dot(r1.xyzw, cb3.data[4].xyzw);
/*48*/	color0.w = r0.w;
/*49*/	return;
}
