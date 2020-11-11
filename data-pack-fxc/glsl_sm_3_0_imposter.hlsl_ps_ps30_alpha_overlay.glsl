//
//
// Shader Model 4
// Fragment Shader
//
// id: 328 - fxc/glsl_SM_3_0_imposter.hlsl_PS_ps30_alpha_overlay.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T6;
in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.x = r0.w + -0.376471;
/*2*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r1.x != 0) discard;
/*4*/	r1.xyz = saturate(vsOut_T6.xyzx).xyz;
/*5*/	r1.xyz = (log2(r1.xyzx)).xyz;
/*6*/	r1.xyz = (r1.xyzx * cb1.data[0].yyyy).xyz;
/*7*/	r1.xyz = (exp2(r1.xyzx)).xyz;
/*8*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*9*/	r0.xyz = (vsOut_T6.wwww * r1.xyzx + r0.xyzx).xyz;
/*10*/	color0.w = r0.w * vsOut_T7.z;
/*11*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*12*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*13*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*14*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*15*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*16*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*17*/	r0.w = dot(vec3(-cb0.data[3].xyzx), vec3(-cb0.data[3].xyzx));
/*18*/	r0.w = inversesqrt(r0.w);
/*19*/	r1.xyz = (r0.wwww * -cb0.data[3].xyzx).xyz;
/*20*/	r2.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*21*/	r0.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*22*/	r0.w = max(r0.w, 0.000000);
/*23*/	r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*24*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*25*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*26*/	r0.w = inversesqrt(r0.w);
/*27*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*28*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*29*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*30*/	r4.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*31*/	r3.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*32*/	r5.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*33*/	r3.xyz = (r2.yyyy * r3.xywx).xyz;
/*34*/	r2.xyw = (r2.xxxx * r4.xyxz + r3.xyxz).xyw;
/*35*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*36*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*37*/	r3.xy = (mix(vec4(1.000000, 1.000000, 0, 0), vec4(0.004000, 360.000000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*38*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*39*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*40*/	r1.xyz = (r1.xyzx * r3.xxxx).xyz;
/*41*/	r0.xyz = (r0.xyzx * r3.xxxx + r1.xyzx).xyz;
/*42*/	r0.w = -vsOut_T2.y + cb3.data[1].w;
/*43*/	r0.w = r0.w + -cb3.data[1].z;
/*44*/	r1.x = -cb3.data[1].z + cb3.data[1].w;
/*45*/	r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.x)).x;
/*46*/	r0.w = saturate(r0.w * r1.x);
/*47*/	r1.x = r0.w * -2.000000 + 3.000000;
/*48*/	r0.w = r0.w * r0.w;
/*49*/	r0.w = r0.w * r1.x;
/*50*/	r1.x = saturate(cb3.data[0].w)/**/;
/*51*/	r1.x = -r1.x + 1.000000;
/*52*/	r1.x = r1.x * 8.000000 + -4.000000;
/*53*/	r1.y = saturate(cb3.data[1].x)/**/;
/*54*/	r1.y = -r1.y + 1.000000;
/*55*/	r1.y = r1.y * 1000.000000;
/*56*/	r2.xyz = (vsOut_T2.xyzx + -cb0.data[0].xyzx).xyz;
/*57*/	r1.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*58*/	r1.z = sqrt(r1.z);
/*59*/	r1.y = r1.z / r1.y;
/*60*/	r1.x = r1.y + r1.x;
/*61*/	r1.x = r1.x * 1.442695;
/*62*/	r1.x = exp2(r1.x);
/*63*/	r1.x = cb3.data[1].y / r1.x;
/*64*/	r1.x = saturate(-r1.x + cb3.data[1].y);
/*65*/	r0.w = cb3.data[2].x * r0.w + r1.x;
/*66*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*67*/	r1.yzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).yzw;
/*68*/	r1.yzw = (r1.yyzw * vec4(0.000000, 1.500000, 1.500000, 1.500000)).yzw;
/*69*/	r1.yzw = (r1.yyzw * abs(cb2.data[0].zzzz)).yzw;
/*70*/	r3.yzw = (r3.xxxx * r1.yyzw).yzw;
/*71*/	r2.w = max(r2.y, 0.000000);
/*72*/	r4.xyzw = (texture(s_sky, r2.xwzx.stp)).xyzw;
/*73*/	r2.x = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*74*/	r2.x = sqrt(r2.x);
/*75*/	r1.yzw = (-r1.yyzw * r3.xxxx + r4.xxyz).yzw;
/*76*/	r1.xyz = (r1.xxxx * r1.yzwy + r3.yzwy).xyz;
/*77*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*78*/	r1.w = max(cb3.data[2].z, 0.001000);
/*79*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*80*/	r1.w = r1.w * r2.x;
/*81*/	r1.w = min(r1.w, 1.000000);
/*82*/	r2.x = r1.w * -2.000000 + 3.000000;
/*83*/	r1.w = r1.w * r1.w;
/*84*/	r1.w = r1.w * r2.x;
/*85*/	r0.w = saturate(r0.w * r1.w);
/*86*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*87*/	return;
}
