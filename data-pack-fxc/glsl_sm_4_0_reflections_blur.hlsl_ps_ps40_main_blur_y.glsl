//
//
// Shader Model 4
// Fragment Shader
//
// id: 191 - fxc/glsl_SM_4_0_reflections_blur.hlsl_PS_ps40_main_blur_y.glsl
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
uniform sampler2D gbuffer_channel_2_sampler;
uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
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
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*2*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.zwzz.st, r0.w)).xyzw;
/*3*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.zwzz.st, r0.w)).xyzw;
/*4*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.zwzz.st, r0.w)).xyzw;
/*5*/	r4.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, r0.w)).yzxw;
/*6*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*7*/	r2.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*8*/	r2.x = inversesqrt(r2.x);
/*9*/	r1.xyz = (r1.xyzx * r2.xxxx).xyz;
/*10*/	r2.x = uintBitsToFloat(floatBitsToUint(cb1.data[0].x) & uint(8));
/*11*/	r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? 1.000000 : 0;
/*12*/	r5.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*13*/	r2.xyz = (r2.xxxx * r5.xyzx + r3.xyzx).xyz;
/*14*/	r3.xyzw = (textureLod(s_blur_parameters_buffer, r0.zwzz.st, 0.000000)).xyzw;
/*15*/	r3.x = r3.x * 1.900000 + 0.100000;
/*16*/	r3.xz = (r3.xxxx * cb0.data[27].zzwz).xz;
/*17*/	r5.xy = (cb0.data[27].zwzz * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*18*/	r3.xz = (r3.xxzx * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xz;
/*19*/	r3.w = -cb1.data[0].y + 1.000000;
/*20*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*21*/	r6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*22*/	r5.zw = (vec4(0, 0, 0, 0)).zw;
/*23*/	while(true) {
/*24*/	  r6.w = uintBitsToFloat((floatBitsToInt(r5.w) >= int(9)) ? 0xffffffffu : 0x00000000u);
/*25*/	  if(r6.w != 0) break;
/*26*/	  r7.xy = intBitsToFloat((floatBitsToInt(r5.wwww) + ivec4(ivec4(-4, 1, 0, 0))).xy);
/*27*/	  r6.w = floatBitsToInt(r7.x);
/*28*/	  r7.zw = (r3.xxxz * r6.wwww + r0.zzzw).zw;
/*29*/	  r6.w = intBitsToFloat(max(floatBitsToInt(r7.x), int(-1))) /**/;
/*30*/	  r6.w = intBitsToFloat(min(floatBitsToInt(r6.w), int(1))) /**/;
/*31*/	  r6.w = floatBitsToInt(r6.w);
/*32*/	  r7.xz = (r5.xxyx * r6.wwww + r7.zzwz).xz;
/*33*/	  r8.xyzw = (textureLod(gbuffer_channel_1_sampler, r7.xzxx.st, 0.000000)).xyzw;
/*34*/	  r8.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*35*/	  r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*36*/	  r6.w = inversesqrt(r6.w);
/*37*/	  r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*38*/	  r9.xyzw = (textureLod(s_reflection_buffer, r7.xzxx.st, 0.000000)).xyzw;
/*39*/	  r6.w = uintBitsToFloat((floatBitsToInt(r5.w) == int(4)) ? 0xffffffffu : 0x00000000u) /**/;
/*40*/	  r7.x = dot(vec3(r8.xyzx), vec3(r1.xyzx));
/*41*/	  r7.x = r7.x + -cb1.data[0].y;
/*42*/	  r7.x = saturate(r3.w * r7.x);
/*43*/	  r7.z = r7.x * -2.000000 + 3.000000;
/*44*/	  r7.x = r7.x * r7.x;
/*45*/	  r7.x = r7.x * r7.z;
/*46*/	    r6.w = (floatBitsToUint(r6.w) > 0x00000000u) ? 1.000000 : r7.x;
/*47*/	  r7.x = r6.w * c[uint(floatBitsToInt(r5.w))].x;
/*48*/	  r6.xyz = (r9.xyzx * r7.xxxx + r6.xyzx).xyz;
/*49*/	  r5.z = c[uint(floatBitsToInt(r5.w))].x * r6.w + r5.z;
/*50*/	  r5.w = r7.y;
/*51*/	}
/*52*/	r3.xzw = (r6.xxyz / r5.zzzz).xzw;
/*53*/	r0.xy = (r0.xyxx * cb0.data[29].zwzz).xy;
/*54*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*55*/	r4.w = 1.000000;
/*56*/	r0.x = dot(r4.xyzw, cb0.data[21].xyzw);
/*57*/	r0.y = dot(r4.xyzw, cb0.data[22].xyzw);
/*58*/	r0.z = dot(r4.xyzw, cb0.data[23].xyzw);
/*59*/	r0.w = dot(r4.xyzw, cb0.data[24].xyzw);
/*60*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*61*/	r0.xyz = (-r0.xyzx + cb0.data[0].xyzx).xyz;
/*62*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*63*/	r0.w = inversesqrt(r0.w);
/*64*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*65*/	r0.w = dot(vec3(-r0.xyzx), vec3(r1.xyzx));
/*66*/	r0.w = r0.w + r0.w;
/*67*/	r1.xyz = (r1.xyzx * -r0.wwww + -r0.xyzx).xyz;
/*68*/	r0.w = -r1.w + 1.000000;
/*69*/	r0.x = dot(vec3(r1.xyzx), vec3(-r0.xyzx));
/*70*/	r0.x = max(r0.x, 0.000000);
/*71*/	r0.x = log2(r0.x);
/*72*/	r0.xy = (r0.xwxx * vec4(10.000000, 1.539380, 0.000000, 0.000000)).xy;
/*73*/	r0.x = exp2(r0.x);
/*74*/	r0.y = cos((r0.y));
/*75*/	r0.y = inversesqrt(r0.y);
/*76*/	r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*77*/	r0.z = saturate(r2.w * 60.000000);
/*78*/	r0.x = r0.y * r0.x;
/*79*/	r0.y = -r2.w + r0.z;
/*80*/	r0.x = r0.x * r0.y + r2.w;
/*81*/	r0.x = r0.x * r3.y;
/*82*/	r0.xyz = (r2.xyzx * r0.xxxx).xyz;
/*83*/	color0.xyz = (r0.xyzx * r3.xzwx).xyz;
/*84*/	return;
}
