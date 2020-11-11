//
//
// Shader Model 4
// Fragment Shader
//
// id: 241 - fxc/glsl_SM_3_0_cloud_plane.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_cloud_maps_0;
uniform sampler2D s_diffuse_cloud_maps_1;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform cloud_plane_PS
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.x = vsOut_T1.z + 0.500000;
/*1*/	r0.x = floor(r0.x);
/*2*/	r0.x = intBitsToFloat(int(r0.x));
/*3*/	r1.xyzw = (texture(s_diffuse_cloud_maps_0, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r2.xyzw = (texture(s_diffuse_cloud_maps_1, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r0.xyzw = mix(r1.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)));
/*6*/	r1.x = r0.w + -0.003922;
/*7*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r1.x != 0) discard;
/*9*/	r1.x = -cb2.data[4].y + cb2.data[4].z;
/*10*/	r1.x = max(r1.x, 0.000100);
/*11*/	r1.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*12*/	r1.y = inversesqrt(r1.y);
/*13*/	r1.yzw = (r1.yyyy * vsOut_T3.xxyz).yzw;
/*14*/	r2.x = dot(vec2(-r1.ywyy), vec2(-r1.ywyy));
/*15*/	r2.x = inversesqrt(r2.x);
/*16*/	r2.xy = (-r1.ywyy * r2.xxxx).xy;
/*17*/	r2.x = dot(vec2(-r1.ywyy), vec2(r2.xyxx));
/*18*/	r1.y = dot(vec3(cb2.data[0].xyzx), vec3(-r1.yzwy));
/*19*/	r1.z = abs(r2.x) + -cb2.data[4].y;
/*20*/	r1.w = uintBitsToFloat((cb2.data[4].y < abs(r2.x)) ? 0xffffffffu : 0x00000000u);
/*21*/	r1.x = r1.z / r1.x;
/*22*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.w));
/*23*/	r1.x = saturate(-r1.x + 1.000000);
/*24*/	r1.z = r0.w * r1.x + -0.003922;
/*25*/	r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*26*/	if(r1.z != 0) discard;
/*27*/	r1.z = cb2.data[2].w * 2.000000 + -1.000000;
/*28*/	r1.y = -r1.y * r1.z + 1.000000;
/*29*/	r1.y = r1.y * 0.500000;
/*30*/	r2.xyz = (-cb2.data[1].xyzx + cb2.data[2].xyzx).xyz;
/*31*/	r1.yzw = (r1.yyyy * r2.xxyz + cb2.data[1].xxyz).yzw;
/*32*/	r2.xyz = (-r0.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*33*/	r0.xyz = (cb2.data[3].xxxx * r2.xyzx + r0.xyzx).xyz;
/*34*/	r0.xyz = (r1.yzwy * r0.xyzx).xyz;
/*35*/	r1.yzw = (cb1.data[1].xxyz * vec4(0.000000, 0.000100, 0.000100, 0.000100) + cb1.data[4].xxyz).yzw;
/*36*/	r1.yzw = (r1.yyzw * vec4(0.000000, 0.500000, 0.500000, 0.500000)).yzw;
/*37*/	r2.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*38*/	r2.xy = (mix(vec4(1.000000, 1.000000, 0, 0), vec4(360.000000, 0.004000, 0, 0), greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xy;
/*39*/	r1.yzw = (r1.yyzw * r2.xxxx).yzw;
/*40*/	r1.yzw = (r2.yyyy * r1.yyzw).yzw;
/*41*/	r2.xyz = (r2.yyyy * cb1.data[1].xyzx).xyz;
/*42*/	r2.xyz = (r2.xyzx * vec4(0.350000, 0.350000, 0.350000, 0.000000)).xyz;
/*43*/	r3.xyz = (-vsOut_T3.xyzx + cb0.data[0].xyzx).xyz;
/*44*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*45*/	r2.w = inversesqrt(r2.w);
/*46*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*47*/	r2.w = dot(vec3(r3.xyzx), vec3(cb2.data[0].xyzx));
/*48*/	r3.x = saturate(r2.w * 0.500000 + 0.600000);
/*49*/	r2.w = saturate(-r2.w);
/*50*/	r3.xyz = (r2.xyzx * r3.xxxx).xyz;
/*51*/	r1.yzw = (r1.yyzw * vec4(0.000000, 0.650000, 0.650000, 0.650000) + r3.xxyz).yzw;
/*52*/	r3.x = r2.w * r2.w;
/*53*/	r2.w = log2(r2.w);
/*54*/	r3.x = r3.x * r3.x;
/*55*/	r3.x = r3.x * cb2.data[4].x;
/*56*/	r1.yzw = (r3.xxxx * r2.xxyz + r1.yyzw).yzw;
/*57*/	r3.x = -r0.w * r1.x + 1.000000;
/*58*/	r0.w = r0.w * r1.x;
/*59*/	color0.w = r0.w;
/*60*/	r0.w = log2(r3.x);
/*61*/	r3.xyz = (cb2.data[3].ywzy + vec4(0.010000, 0.065000, 0.010000, 0.000000)).xyz;
/*62*/	r3.xyz = (r3.xyzx * vec4(40.000000, 16.000000, 64.000000, 0.000000)).xyz;
/*63*/	r0.w = r0.w * r3.y;
/*64*/	r0.w = exp2(r0.w);
/*65*/	r0.w = r3.x * r0.w;
/*66*/	r1.x = r2.w * r3.z;
/*67*/	r1.x = exp2(r1.x);
/*68*/	r2.xyz = (r2.xyzx * r0.wwww).xyz;
/*69*/	r1.xyz = (r2.xyzx * r1.xxxx + r1.yzwy).xyz;
/*70*/	color0.xyz = (r0.xyzx * r1.xyzx).xyz;
/*71*/	return;
}
