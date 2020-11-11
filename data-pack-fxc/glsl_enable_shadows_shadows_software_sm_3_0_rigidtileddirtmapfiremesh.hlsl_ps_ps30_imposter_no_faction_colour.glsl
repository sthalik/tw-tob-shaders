//
//
// Shader Model 4
// Fragment Shader
//
// id: 4882 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidtileddirtmapfiremesh.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
/*3*/	r1.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx).xy;
/*4*/	r1.xyzw = (texture(s_detail_map, r1.xyxx.st)).xyzw;
/*5*/	r2.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r1.w = r1.w + -1.000000;
/*7*/	r1.w = r2.x * r1.w + 1.000000;
/*8*/	r1.w = saturate(r1.w * r2.x);
/*9*/	r2.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*10*/	r1.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*11*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*12*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*13*/	r4.x = r3.x;
/*14*/	r4.y = cb1.data[26].x * 0.050000 + r3.y;
/*15*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*16*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*17*/	r1.w = saturate(r4.x * 5.000000);
/*18*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*19*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*20*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*21*/	r2.w = log2(r3.z);
/*22*/	r2.w = r2.w * 1.800000;
/*23*/	r2.w = exp2(r2.w);
/*24*/	r2.w = r2.w * 10.000000;
/*25*/	r2.w = min(r2.w, 1.000000);
/*26*/	r1.w = r1.w + r2.w;
/*27*/	r1.w = r1.w * 0.500000;
/*28*/	r2.w = -r3.w + 1.000000;
/*29*/	r2.w = log2(r2.w);
/*30*/	r2.w = r2.w * vsOut_T7.x;
/*31*/	r2.w = exp2(r2.w);
/*32*/	r2.w = min(r2.w, 1.000000);
/*33*/	r2.w = r2.w * vsOut_T7.x;
/*34*/	r3.x = r3.z * 0.250000;
/*35*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.xxxx).xyz;
/*36*/	r3.xyw = (r1.wwww * r4.xyxz + r3.xxxx).xyw;
/*37*/	r0.xyz = (-r0.xyzx * r1.xyzx + r3.xywx).xyz;
/*38*/	r0.xyz = (r2.wwww * r0.xyzx + r2.xyzx).xyz;
/*39*/	r1.x = vsOut_T7.x + -0.025000;
/*40*/	r1.x = max(r1.x, 0.000000);
/*41*/	r1.yzw = (r3.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*42*/	r0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*43*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*44*/	if(floatBitsToUint(r1.x) != 0u) {
/*45*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*46*/	  if(floatBitsToUint(r1.x) != 0u) {
/*47*/	    r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*48*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*49*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*50*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*51*/	    r1.w = -r1.w + 1.000000;
/*52*/	    r1.w = max(r1.w, 0.000000);
/*53*/	    r1.z = sqrt(r1.w);
/*54*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*55*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	    r1.w = inversesqrt(r1.w);
/*57*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*58*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*59*/	    r1.w = inversesqrt(r1.w);
/*60*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*61*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	    r1.w = inversesqrt(r1.w);
/*63*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*64*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*65*/	    r1.xyw = (r1.xxxx * r2.xyxz + r3.xyxz).xyw;
/*66*/	    r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*67*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*68*/	    r1.w = inversesqrt(r1.w);
/*69*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*70*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*71*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*72*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*73*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*74*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*75*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*76*/	    r0.w = -r0.w + 1.000000;
/*77*/	    r0.w = max(r0.w, 0.000000);
/*78*/	    r2.y = sqrt(r0.w);
/*79*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*80*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*81*/	    r0.w = inversesqrt(r0.w);
/*82*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*83*/	    r2.xz = (cb2.data[0].xxyx).xz/**/;
/*84*/	    r2.y = -1.000000;
/*85*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*86*/	    r0.w = inversesqrt(r0.w);
/*87*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*88*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*89*/	    r1.x = cb2.data[1].x * cb2.data[1].x;
/*90*/	    r1.x = r1.x * 1.250000;
/*91*/	    r1.x = min(r1.x, 1.000000);
/*92*/	    r1.y = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*93*/	    r1.y = r1.y * 4.000000;
/*94*/	    r1.x = r1.x * 0.200000 + r1.y;
/*95*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*96*/	    r0.w = r0.w + -r1.x;
/*97*/	    r0.w = saturate(r0.w * 200.000000);
/*98*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*99*/	    r0.w = r0.w * r0.w;
/*100*/	    r0.w = r0.w * r1.x;
/*101*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*102*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*103*/	  }
/*104*/	}
/*105*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*106*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*107*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*108*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*109*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*110*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*111*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*112*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*113*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*114*/	color0.w = 1.000000;
/*115*/	return;
}
