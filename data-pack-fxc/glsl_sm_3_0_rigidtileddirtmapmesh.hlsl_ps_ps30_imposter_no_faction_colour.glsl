//
//
// Shader Model 4
// Fragment Shader
//
// id: 817 - fxc/glsl_SM_3_0_rigidtileddirtmapmesh.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
uniform sampler2D s_snow_normals;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*4*/	r1.xyzw = (texture(s_detail_map, r1.xyxx.st)).xyzw;
/*5*/	r2.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r1.w = r1.w + -1.000000;
/*7*/	r1.w = r2.x * r1.w + 1.000000;
/*8*/	r1.w = saturate(r1.w * r2.x);
/*9*/	r2.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*10*/	r1.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*11*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*12*/	r1.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*13*/	if(floatBitsToUint(r1.w) != 0u) {
/*14*/	  r1.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*15*/	  if(floatBitsToUint(r1.w) != 0u) {
/*16*/	    r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*17*/	    r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*18*/	    r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*19*/	    r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*20*/	    r1.w = -r1.w + 1.000000;
/*21*/	    r1.w = max(r1.w, 0.000000);
/*22*/	    r3.z = sqrt(r1.w);
/*23*/	    r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*24*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*25*/	    r1.w = inversesqrt(r1.w);
/*26*/	    r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*27*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*28*/	    r1.w = inversesqrt(r1.w);
/*29*/	    r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*30*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*31*/	    r1.w = inversesqrt(r1.w);
/*32*/	    r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*33*/	    r5.xyz = (r3.yyyy * r5.xyzx).xyz;
/*34*/	    r3.xyw = (r3.xxxx * r4.xyxz + r5.xyxz).xyw;
/*35*/	    r3.xyz = (r3.zzzz * r6.xyzx + r3.xywx).xyz;
/*36*/	    r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	    r1.w = inversesqrt(r1.w);
/*38*/	    r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*39*/	    r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*40*/	    r4.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*41*/	    r4.xyzw = (texture(s_snow_normals, r4.xyxx.st)).xyzw;
/*42*/	    r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*43*/	    r4.xz = (r4.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*44*/	    r0.w = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*45*/	    r0.w = -r0.w + 1.000000;
/*46*/	    r0.w = max(r0.w, 0.000000);
/*47*/	    r4.y = sqrt(r0.w);
/*48*/	    r3.xyz = (r4.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*49*/	    r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*50*/	    r0.w = inversesqrt(r0.w);
/*51*/	    r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*52*/	    r4.xz = (cb1.data[0].xxyx).xz/**/;
/*53*/	    r4.y = -1.000000;
/*54*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*55*/	    r0.w = inversesqrt(r0.w);
/*56*/	    r4.xyz = (r0.wwww * r4.xyzx).xyz;
/*57*/	    r0.w = saturate(dot(vec3(-r4.xyzx), vec3(r3.xyzx)));
/*58*/	    r1.w = cb1.data[1].x * cb1.data[1].x;
/*59*/	    r1.w = r1.w * 1.250000;
/*60*/	    r1.w = min(r1.w, 1.000000);
/*61*/	    r2.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*62*/	    r2.w = r2.w * 4.000000;
/*63*/	    r1.w = r1.w * 0.200000 + r2.w;
/*64*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*65*/	    r0.w = r0.w + -r1.w;
/*66*/	    r0.w = saturate(r0.w * 200.000000);
/*67*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*68*/	    r0.w = r0.w * r0.w;
/*69*/	    r0.w = r0.w * r1.w;
/*70*/	    r0.xyz = (-r0.xyzx * r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*71*/	    r2.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*72*/	  }
/*73*/	}
/*74*/	r0.xyz = (r2.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*75*/	r0.xyz = (-r2.xyzx + r0.xyzx).xyz;
/*76*/	r0.xyz = saturate(vsOut_T7.yyyy * r0.xyzx + r2.xyzx).xyz;
/*77*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*78*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*79*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*80*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*81*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*82*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*83*/	color0.w = 1.000000;
/*84*/	return;
}
