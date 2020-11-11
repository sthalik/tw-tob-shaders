//
//
// Shader Model 4
// Fragment Shader
//
// id: 272 - fxc/glsl_SM_3_0_DirectionalLight.hlsl_PS_ps30_skinlm_lowdef.glsl
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
uniform sampler2D s_ssao;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform directional_light_PS
{
  vec4 data[5];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[29].zzzw).zw;
/*2*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*3*/	r1.xy = (r0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r2.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, r0.y)).xyzw;
/*5*/	r1.z = r2.x;
/*6*/	r1.w = 1.000000;
/*7*/	r2.x = dot(r1.xyzw, cb0.data[21].xyzw);
/*8*/	r2.y = dot(r1.xyzw, cb0.data[22].xyzw);
/*9*/	r2.z = dot(r1.xyzw, cb0.data[23].xyzw);
/*10*/	r0.z = dot(r1.xyzw, cb0.data[24].xyzw);
/*11*/	r1.xyz = (r2.xyzx / r0.zzzz).xyz;
/*12*/	r2.xyz = (r1.xyzx + -cb0.data[0].xyzx).xyz;
/*13*/	r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*14*/	r0.z = inversesqrt(r0.z);
/*15*/	r2.xyz = (r0.zzzz * r2.xyzx).xyz;
/*16*/	r0.z = saturate(dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy)));
/*17*/	r0.z = r0.z * r0.z;
/*18*/	r0.z = r0.z * r0.z;
/*19*/	r3.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.xyxx.st, r0.y)).xyzw;
/*20*/	r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*21*/	r0.w = r3.w * r3.w;
/*22*/	r0.w = r0.w * 127.000000 + 1.600000;
/*23*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*24*/	r2.w = inversesqrt(r2.w);
/*25*/	r4.xyz = (r2.wwww * r3.xyzx).xyz;
/*26*/	r3.xyz = (r3.xyzx * r2.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*27*/	r2.w = dot(vec3(r4.xyzx), vec3(cb1.data[0].yzwy));
/*28*/	r3.w = saturate(r2.w);
/*29*/	r2.w = r2.w + r2.w;
/*30*/	r5.xyz = (r4.xyzx * -r2.wwww + cb1.data[0].yzwy).xyz;
/*31*/	r2.w = dot(vec3(r5.xyzx), vec3(-r2.xyzx));
/*32*/	r2.w = max(r2.w, 0.000000);
/*33*/	r2.w = log2(r2.w);
/*34*/	r0.w = r0.w * r2.w;
/*35*/	r0.w = exp2(r0.w);
/*36*/	r0.w = min(r0.w, 1.000000);
/*37*/	r2.w = r3.w * r3.w;
/*38*/	r0.z = r0.z * r2.w;
/*39*/	r5.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.xyxx.st, r0.y)).xyzw;
/*40*/	r6.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.xyxx.st, r0.y)).xyzw;
/*41*/	r0.x = r0.z * r5.z;
/*42*/	r7.xyz = (r5.yyyy * cb1.data[1].xyzx).xyz;
/*43*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*44*/	r0.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*45*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*46*/	r7.xyz = (r7.xyzx * r8.xxxx).xyz;
/*47*/	r0.xyz = (r0.xxxx * r7.xyzx).xyz;
/*48*/	r0.xyzw = r0.xyzw * r6.xyzw;
/*49*/	r0.xyz = (r0.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000)).xyz;
/*50*/	r2.w = dot(vec3(r4.xyzx), vec3(-cb1.data[0].yzwy));
/*51*/	r7.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*52*/	r7.xyz = saturate(r7.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*53*/	r3.w = r2.w * r7.x + 0.300000;
/*54*/	r3.w = saturate(-r3.w + 1.000000);
/*55*/	r9.xyz = (r7.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*56*/	r10.xyz = (r3.wwww * r9.xyzx).xyz;
/*57*/	r9.xyz = (-r9.xyzx * r3.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*58*/	r10.xyz = (r2.wwww * r7.xxxx + r10.xyzx).xyz;
/*59*/	r3.w = -r2.w * r7.x + 1.000000;
/*60*/	r7.xyz = (r7.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*61*/	r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*62*/	r7.xyz = (r7.xyzx * r9.xyzx + r10.xyzx).xyz;
/*63*/	r7.xyz = (-r2.wwww + r7.xyzx).xyz;
/*64*/	r5.yzw = saturate(r5.yyyy * r7.xxyz + r2.wwww).yzw;
/*65*/	r5.yzw = (r5.yyzw * r6.xxyz).yzw;
/*66*/	r5.yzw = (r5.yyzw * cb1.data[1].xxyz).yzw;
/*67*/	r5.yzw = (r8.xxxx * r5.yyzw).yzw;
/*68*/	r0.xyz = (r5.yzwy * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r0.xyzx).xyz;
/*69*/	r5.yzw = (r0.wwww * cb1.data[1].xxyz).yzw;
/*70*/	r5.yzw = (r8.xxxx * r5.yyzw).yzw;
/*71*/	r0.xyz = (r5.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r0.xyzx).xyz;
/*72*/	r0.w = dot(vec3(-r2.xyzx), vec3(r4.xyzx));
/*73*/	r2.w = r0.w + r0.w;
/*74*/	r0.w = saturate(-r0.w + 1.000000);
/*75*/	r0.w = r0.w * r0.w;
/*76*/	r0.w = r5.x * r0.w;
/*77*/	r0.w = r0.w * 1.500000;
/*78*/	r0.w = r8.w * r0.w;
/*79*/	r2.xyz = (r4.xyzx * -r2.wwww + -r2.xyzx).xyz;
/*80*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*81*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*82*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*83*/	r2.w = inversesqrt(r2.w);
/*84*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*85*/	r5.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*86*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*87*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz/**/;
/*88*/	r5.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyw/**/;
/*89*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r5.zzzz), uvec4(0)))).xyz/**/;
/*90*/	r5.xyz = (r2.yyyy * r5.xywx).xyz;
/*91*/	r2.xyw = (r2.xxxx * r7.xyxz + r5.xyxz).xyw;
/*92*/	r2.xyz = (r2.zzzz * r9.xyzx + r2.xywx).xyz;
/*93*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*94*/	r2.w = inversesqrt(r2.w);
/*95*/	r2.w = r2.w * r3.y;
/*96*/	r2.w = max(r2.w, 0.000000);
/*97*/	r0.w = r0.w * r2.w;
/*98*/	r2.xyz = (r2.xyzx * r0.wwww).xyz;
/*99*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*100*/	r0.w = inversesqrt(r0.w);
/*101*/	r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*102*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*103*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*104*/	r5.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*105*/	r4.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*106*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*107*/	r4.xyz = (r3.yyyy * r4.xywx).xyz;
/*108*/	r3.xyw = (r3.xxxx * r5.xyxz + r4.xyxz).xyw;
/*109*/	r3.xyz = (r3.zzzz * r7.xyzx + r3.xywx).xyz;
/*110*/	r3.xyz = (r3.xyzx * r6.xyzx).xyz;
/*111*/	r3.xyz = (r8.yyyy * r3.xyzx).xyz;
/*112*/	r0.w = r8.z * r8.x;
/*113*/	r2.xyz = (r3.xyzx * r0.wwww + r2.xyzx).xyz;
/*114*/	r1.w = 1.000000;
/*115*/	r3.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*116*/	r3.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*117*/	r0.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*118*/	r1.xz = (r3.xxyx / r0.wwww).xz;
/*119*/	r3.xy = (r1.xzxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*120*/	r3.z = -r3.y + 1.000000;
/*121*/	r3.xyzw = (texture(s_ssao, r3.xzxx.st)).xyzw;
/*122*/	color0.xyz = saturate(r3.xxxx * r2.xyzx + r0.xyzx).xyz;
/*123*/	r0.x = uintBitsToFloat((2.000000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*124*/	r0.y = saturate(-r1.y * cb2.data[4].x);
/*125*/	color0.w = (floatBitsToUint(r0.x) > 0x00000000u) ? saturate(1.000000) : saturate(r0.y);
/*126*/	return;
}
