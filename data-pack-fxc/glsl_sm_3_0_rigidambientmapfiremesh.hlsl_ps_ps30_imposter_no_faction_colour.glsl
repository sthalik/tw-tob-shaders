//
//
// Shader Model 4
// Fragment Shader
//
// id: 544 - fxc/glsl_SM_3_0_rigidambientmapfiremesh.hlsl_PS_ps30_imposter_no_faction_colour.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C2;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_ambient_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb3.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*4*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*5*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*6*/	r4.x = r3.x;
/*7*/	r4.y = cb1.data[26].x * 0.050000 + r3.y;
/*8*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*9*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*10*/	r1.w = saturate(r4.x * 5.000000);
/*11*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*12*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*13*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*14*/	r2.w = log2(r3.z);
/*15*/	r2.w = r2.w * 1.800000;
/*16*/	r2.w = exp2(r2.w);
/*17*/	r2.w = r2.w * 10.000000;
/*18*/	r2.w = min(r2.w, 1.000000);
/*19*/	r1.w = r1.w + r2.w;
/*20*/	r1.w = r1.w * 0.500000;
/*21*/	r2.w = -r3.w + 1.000000;
/*22*/	r2.w = log2(r2.w);
/*23*/	r2.w = r2.w * vsOut_T7.x;
/*24*/	r2.w = exp2(r2.w);
/*25*/	r2.w = min(r2.w, 1.000000);
/*26*/	r2.w = r2.w * vsOut_T7.x;
/*27*/	r3.x = r3.z * 0.250000;
/*28*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.xxxx).xyz;
/*29*/	r3.xyw = (r1.wwww * r4.xyxz + r3.xxxx).xyw;
/*30*/	r0.xyz = (-r0.xyzx * r1.xyzx + r3.xywx).xyz;
/*31*/	r0.xyz = (r2.wwww * r0.xyzx + r2.xyzx).xyz;
/*32*/	r1.x = vsOut_T7.x + -0.025000;
/*33*/	r1.x = max(r1.x, 0.000000);
/*34*/	r1.yzw = (r3.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*35*/	r0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*36*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r1.x) != 0u) {
/*38*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*39*/	  if(floatBitsToUint(r1.x) != 0u) {
/*40*/	    r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*41*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*42*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*43*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*44*/	    r1.w = -r1.w + 1.000000;
/*45*/	    r1.w = max(r1.w, 0.000000);
/*46*/	    r1.z = sqrt(r1.w);
/*47*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*48*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*49*/	    r1.w = inversesqrt(r1.w);
/*50*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*51*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*52*/	    r1.w = inversesqrt(r1.w);
/*53*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*54*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*55*/	    r1.w = inversesqrt(r1.w);
/*56*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*57*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*58*/	    r1.xyw = (r1.xxxx * r2.xyxz + r3.xyxz).xyw;
/*59*/	    r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*60*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*61*/	    r1.w = inversesqrt(r1.w);
/*62*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*63*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*64*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*65*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*66*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*67*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*68*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*69*/	    r0.w = -r0.w + 1.000000;
/*70*/	    r0.w = max(r0.w, 0.000000);
/*71*/	    r2.y = sqrt(r0.w);
/*72*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*73*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*74*/	    r0.w = inversesqrt(r0.w);
/*75*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*76*/	    r2.xz = (cb2.data[0].xxyx).xz/**/;
/*77*/	    r2.y = -1.000000;
/*78*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*79*/	    r0.w = inversesqrt(r0.w);
/*80*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*81*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*82*/	    r1.x = cb2.data[1].x * cb2.data[1].x;
/*83*/	    r1.x = r1.x * 1.250000;
/*84*/	    r1.x = min(r1.x, 1.000000);
/*85*/	    r1.y = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*86*/	    r1.y = r1.y * 4.000000;
/*87*/	    r1.x = r1.x * 0.200000 + r1.y;
/*88*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*89*/	    r0.w = r0.w + -r1.x;
/*90*/	    r0.w = saturate(r0.w * 200.000000);
/*91*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*92*/	    r0.w = r0.w * r0.w;
/*93*/	    r0.w = r0.w * r1.x;
/*94*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*95*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*96*/	  }
/*97*/	}
/*98*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*99*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*100*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*101*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*102*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*103*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*104*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*105*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*106*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*107*/	color0.w = 1.000000;
/*108*/	return;
}
