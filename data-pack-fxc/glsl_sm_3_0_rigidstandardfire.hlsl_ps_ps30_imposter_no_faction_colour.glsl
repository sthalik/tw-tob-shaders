//
//
// Shader Model 4
// Fragment Shader
//
// id: 709 - fxc/glsl_SM_3_0_rigidstandardfire.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
/*3*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*4*/	r2.x = r1.x;
/*5*/	r2.y = cb1.data[26].x * 0.050000 + r1.y;
/*6*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*7*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*8*/	r1.x = saturate(r2.x * 5.000000);
/*9*/	r2.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*10*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*11*/	r1.x = saturate(-r1.x * 15.000000 + 1.000000);
/*12*/	r1.y = log2(r1.z);
/*13*/	r1.y = r1.y * 1.800000;
/*14*/	r1.y = exp2(r1.y);
/*15*/	r1.y = r1.y * 10.000000;
/*16*/	r1.y = min(r1.y, 1.000000);
/*17*/	r1.x = r1.y + r1.x;
/*18*/	r1.y = -r1.w + 1.000000;
/*19*/	r1.y = log2(r1.y);
/*20*/	r1.y = r1.y * vsOut_T7.x;
/*21*/	r1.y = exp2(r1.y);
/*22*/	r1.y = min(r1.y, 1.000000);
/*23*/	r1.y = r1.y * vsOut_T7.x;
/*24*/	r1.xw = (r1.xxxz * vec4(0.500000, 0.000000, 0.000000, 0.250000)).xw;
/*25*/	r2.xyz = (r2.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*26*/	r2.xyz = (r1.xxxx * r2.xyzx + r1.wwww).xyz;
/*27*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*28*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*29*/	r1.x = vsOut_T7.x + -0.025000;
/*30*/	r1.x = max(r1.x, 0.000000);
/*31*/	r1.yzw = (r1.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*32*/	r0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*33*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*34*/	if(floatBitsToUint(r1.x) != 0u) {
/*35*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*36*/	  if(floatBitsToUint(r1.x) != 0u) {
/*37*/	    r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*38*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*39*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*40*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*41*/	    r1.w = -r1.w + 1.000000;
/*42*/	    r1.w = max(r1.w, 0.000000);
/*43*/	    r1.z = sqrt(r1.w);
/*44*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*45*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*46*/	    r1.w = inversesqrt(r1.w);
/*47*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*48*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*49*/	    r1.w = inversesqrt(r1.w);
/*50*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*51*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*52*/	    r1.w = inversesqrt(r1.w);
/*53*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*54*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*55*/	    r1.xyw = (r1.xxxx * r2.xyxz + r3.xyxz).xyw;
/*56*/	    r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*57*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*58*/	    r1.w = inversesqrt(r1.w);
/*59*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*60*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*61*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*62*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*63*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*64*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*65*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*66*/	    r0.w = -r0.w + 1.000000;
/*67*/	    r0.w = max(r0.w, 0.000000);
/*68*/	    r2.y = sqrt(r0.w);
/*69*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*70*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*71*/	    r0.w = inversesqrt(r0.w);
/*72*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*73*/	    r2.xz = (cb2.data[0].xxyx).xz/**/;
/*74*/	    r2.y = -1.000000;
/*75*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*76*/	    r0.w = inversesqrt(r0.w);
/*77*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*78*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*79*/	    r1.x = cb2.data[1].x * cb2.data[1].x;
/*80*/	    r1.x = r1.x * 1.250000;
/*81*/	    r1.x = min(r1.x, 1.000000);
/*82*/	    r1.y = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*83*/	    r1.y = r1.y * 4.000000;
/*84*/	    r1.x = r1.x * 0.200000 + r1.y;
/*85*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*86*/	    r0.w = r0.w + -r1.x;
/*87*/	    r0.w = saturate(r0.w * 200.000000);
/*88*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*89*/	    r0.w = r0.w * r0.w;
/*90*/	    r0.w = r0.w * r1.x;
/*91*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*92*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*93*/	  }
/*94*/	}
/*95*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*96*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*97*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*98*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*99*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*100*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*101*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*102*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*103*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*104*/	color0.w = 1.000000;
/*105*/	return;
}
