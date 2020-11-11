//
//
// Shader Model 4
// Fragment Shader
//
// id: 4273 - fxc/glsl_ENABLE_DISTORTION_ENABLE_DEPTH_OF_FIELD_SM_3_0_HDR_To_Screen.hlsl_PS_ps30_main_high.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D distortion_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D frame_sampler;
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
  vec4 r3;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(distortion_sampler, r0.xyxx.st, r0.y)).xyzw;
/*3*/	r0.zw = (r1.xxxy + vec4(0.000000, 0.000000, -0.498039, -0.498039)).zw;
/*4*/	r0.xy = (r0.zwzz * vec4(0.020000, 0.020000, 0.000000, 0.000000) + r0.xyxx).xy;
/*5*/	r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, 0.000000)).yzxw;
/*6*/	r1.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r1.w = 1.000000;
/*8*/	r0.z = dot(r1.xyzw, cb0.data[19].xyzw);
/*9*/	r0.w = dot(r1.xyzw, cb0.data[20].xyzw);
/*10*/	r0.z = r0.z / r0.w;
/*11*/	r0.w = uintBitsToFloat((0.000000 >= r0.z) ? 0xffffffffu : 0x00000000u);
/*12*/	r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : r0.z;
/*13*/	r0.w = min(cb3.data[0].w, 500.000000);
/*14*/	r0.z = -r0.w + r0.z;
/*15*/	r0.z = r0.z * r0.z;
/*16*/	r0.w = dot(vec2(cb3.data[1].xxxx), vec2(cb3.data[1].xxxx));
/*17*/	r0.z = r0.z / r0.w;
/*18*/	r0.z = r0.z * -1.442695;
/*19*/	r0.z = exp2(r0.z);
/*20*/	r0.z = -r0.z + 1.000000;
/*21*/	r2.xyzw = vec4(0, 0, 0, 0);
/*22*/	r0.w = 0;
/*23*/	r1.z = 0;
/*24*/	while(true) {
/*25*/	  r3.x = uintBitsToFloat((floatBitsToInt(r1.z) >= int(25)) ? 0xffffffffu : 0x00000000u);
/*26*/	  if(r3.x != 0) break;
/*27*/	  r3.xy = (-cb3.data[floatBitsToUint(r1.z)+88u].xyxx * r0.zzzz + r0.xyxx).xy;
/*28*/	  r3.xyzw = (textureLod(frame_sampler, r3.xyxx.st, r3.y)).xyzw;
/*29*/	  r3.xyzw = saturate(r3.xyzw * cb3.data[floatBitsToUint(r1.z)+88u].zzzz);
/*30*/	  r2.xyzw = r2.xyzw + r3.xyzw;
/*31*/	  r0.w = r0.w + cb3.data[floatBitsToUint(r1.z)+88u].z;
/*32*/	  r1.z = intBitsToFloat(floatBitsToInt(r1.z) + int(1));
/*33*/	}
/*34*/	r3.xyzw = (textureLod(frame_sampler, r0.xyxx.st, r0.y)).xyzw;
/*35*/	r2.xyzw = r2.xyzw / r0.wwww;
/*36*/	r2.xyzw = -r3.xyzw + r2.xyzw;
/*37*/	r2.xyzw = cb3.data[1].yyyy * r2.xyzw + r3.xyzw;
/*38*/	r0.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, r0.y)).yzxw;
/*39*/	r0.xyw = (r1.xyxw).xyw;
/*40*/	r1.x = dot(r0.xyzw, cb0.data[21].xyzw);
/*41*/	r1.w = dot(r0.xyzw, cb0.data[23].xyzw);
/*42*/	r0.x = dot(r0.xyzw, cb0.data[24].xyzw);
/*43*/	r0.xy = (r1.xwxx / r0.xxxx).xy;
/*44*/	r0.xw = (r0.xxxy * vec4(0.000488, 0.000000, 0.000000, 0.000488) + vec4(0.500000, 0.000000, 0.000000, 0.500000)).xw;
/*45*/	r1.x = -r0.w + 1.000000;
/*46*/	r1.y = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*47*/	r1.z = uintBitsToFloat((1.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*48*/	r1.y = uintBitsToFloat(floatBitsToUint(r1.z) | floatBitsToUint(r1.y));
/*49*/	r1.z = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*50*/	r1.y = uintBitsToFloat(floatBitsToUint(r1.z) | floatBitsToUint(r1.y));
/*51*/	r1.x = uintBitsToFloat((1.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*52*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) | floatBitsToUint(r1.y));
/*53*/	if(floatBitsToUint(r1.x) == 0u) {
/*54*/	  r0.yz = (-r0.xxwx + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*55*/	  r1.xyzw = (textureLod(s_fog_of_war_mask, r0.xzxx.st, 0.000000)).xyzw;
/*56*/	  r1.y = uintBitsToFloat((cb2.data[0].y < 1.000000) ? 0xffffffffu : 0x00000000u);
/*57*/	  r0.xyzw = r0.xyzw * vec4(50.000000, 50.000000, 50.000000, 50.000000);
/*58*/	  r0.xyzw = min(r0.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*59*/	  r0.xy = (min(r0.ywyy, r0.xzxx)).xy;
/*60*/	  r0.x = min(r0.y, r0.x);
/*61*/	  r0.x = -r0.x + 1.000000;
/*62*/	  r0.x = max(r0.x, r1.x);
/*63*/	    r0.x = (floatBitsToUint(r1.y) > 0x00000000u) ? r0.x : r1.x;
/*64*/	  r0.y = -cb2.data[0].x + 1.000000;
/*65*/	  r0.x = max(r0.y, r0.x);
/*66*/	} else {
/*67*/	  r0.x = -cb2.data[0].y * cb2.data[0].x + 1.000000;
/*68*/	}
/*69*/	r0.y = dot(vec3(r2.xyzx), vec3(vec4(0.270000, 0.670000, 0.060000, 0.000000)));
/*70*/	r1.xyz = (r0.yyyy * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*71*/	r1.w = r2.w;
/*72*/	r2.xyzw = -r1.zzzw + r2.xyzw;
/*73*/	r0.xyzw = r0.xxxx * r2.xyzw + r1.xyzw;
/*74*/	r0.xyz = saturate(r0.xyzx * cb1.data[0].xxxx).xyz;
/*75*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*76*/	r0.xyz = (r0.xyzx * cb1.data[0].zzzz).xyz;
/*77*/	r1.xyz = (exp2(r0.xyzx)).xyz;
/*78*/	r1.w = 1.000000;
/*79*/	color0.x = dot(r1.xyzw, cb3.data[2].xyzw);
/*80*/	color0.y = dot(r1.xyzw, cb3.data[3].xyzw);
/*81*/	color0.z = dot(r1.xyzw, cb3.data[4].xyzw);
/*82*/	color0.w = r0.w;
/*83*/	return;
}
