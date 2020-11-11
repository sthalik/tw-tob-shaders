//
//
// Shader Model 4
// Fragment Shader
//
// id: 591 - fxc/glsl_SM_3_0_rigiddebuggeometry.hlsl_PS_ps30_alpha_overlay.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T5;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;

uniform samplerCube s_sky;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.x = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T1.xyzx).xyz;
/*3*/	r1.xyz = (r0.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*4*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb1.data[0].yzwy));
/*5*/	r0.x = max(r0.x, 0.000000);
/*6*/	r0.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*7*/	r0.y = inversesqrt(r0.y);
/*8*/	r0.yzw = (r0.yyyy * r1.xxyz).yzw;
/*9*/	r1.xyz = (uintBitsToFloat(uvec4(lessThan(r0.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*10*/	r0.yzw = (r0.yyzw * r0.yyzw).yzw;
/*11*/	r2.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz/**/;
/*12*/	r1.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyw/**/;
/*13*/	r3.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r1.zzzz), uvec4(0)))).xyz/**/;
/*14*/	r1.xyz = (r0.zzzz * r1.xywx).xyz;
/*15*/	r1.xyz = (r0.yyyy * r2.xyzx + r1.xyzx).xyz;
/*16*/	r0.yzw = (r0.wwww * r3.xxyz + r1.xxyz).yzw;
/*17*/	r1.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*18*/	r1.xy = (mix(vec4(1.000000, 1.000000, 0, 0), vec4(0.004000, 360.000000, 0, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xy;
/*19*/	r0.yzw = (r0.yyzw * r1.yyyy).yzw;
/*20*/	r1.yzw = (vsOut_T5.xxyz * vsOut_C1.xxyz).yzw;
/*21*/	r0.yzw = (r0.yyzw * r1.yyzw).yzw;
/*22*/	r1.yzw = (r0.xxxx * r1.yyzw).yzw;
/*23*/	r1.yzw = (r1.yyzw * cb1.data[1].xxyz).yzw;
/*24*/	r1.yzw = (r1.xxxx * r1.yyzw).yzw;
/*25*/	r0.xyz = (r0.yzwy * r1.xxxx + r1.yzwy).xyz;
/*26*/	r0.w = -vsOut_T0.y + cb2.data[1].w;
/*27*/	r0.w = r0.w + -cb2.data[1].z;
/*28*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*29*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*30*/	r0.w = saturate(r0.w * r1.y);
/*31*/	r1.y = r0.w * -2.000000 + 3.000000;
/*32*/	r0.w = r0.w * r0.w;
/*33*/	r0.w = r0.w * r1.y;
/*34*/	r1.y = saturate(cb2.data[0].w)/**/;
/*35*/	r1.y = -r1.y + 1.000000;
/*36*/	r1.y = r1.y * 8.000000 + -4.000000;
/*37*/	r1.z = saturate(cb2.data[1].x)/**/;
/*38*/	r1.z = -r1.z + 1.000000;
/*39*/	r1.z = r1.z * 1000.000000;
/*40*/	r2.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*41*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*42*/	r1.w = sqrt(r1.w);
/*43*/	r1.z = r1.w / r1.z;
/*44*/	r1.y = r1.z + r1.y;
/*45*/	r1.y = r1.y * 1.442695;
/*46*/	r1.y = exp2(r1.y);
/*47*/	r1.y = cb2.data[1].y / r1.y;
/*48*/	r1.y = saturate(-r1.y + cb2.data[1].y);
/*49*/	r0.w = cb2.data[2].x * r0.w + r1.y;
/*50*/	r1.y = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*51*/	r3.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*52*/	r3.xyz = (r3.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*53*/	r3.xyz = (r3.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*54*/	r4.xyz = (r1.xxxx * r3.xyzx).xyz;
/*55*/	r2.w = max(r2.y, 0.000000);
/*56*/	r5.xyzw = (texture(s_sky, r2.xwzx.stp)).xyzw;
/*57*/	r1.z = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*58*/	r1.z = sqrt(r1.z);
/*59*/	r2.xyz = (-r3.xyzx * r1.xxxx + r5.xyzx).xyz;
/*60*/	r1.xyw = (r1.yyyy * r2.xyxz + r4.xyxz).xyw;
/*61*/	r1.xyw = (-r0.xyxz + r1.xyxw).xyw;
/*62*/	r2.x = max(cb2.data[2].z, 0.001000);
/*63*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*64*/	r1.z = r1.z * r2.x;
/*65*/	r1.z = min(r1.z, 1.000000);
/*66*/	r2.x = r1.z * -2.000000 + 3.000000;
/*67*/	r1.z = r1.z * r1.z;
/*68*/	r1.z = r1.z * r2.x;
/*69*/	r0.w = saturate(r0.w * r1.z);
/*70*/	color0.xyz = (r0.wwww * r1.xywx + r0.xyzx).xyz;
/*71*/	r0.x = floor(vsOut_T5.w);
/*72*/	color0.w = r0.x * 0.001000;
/*73*/	return;
}
