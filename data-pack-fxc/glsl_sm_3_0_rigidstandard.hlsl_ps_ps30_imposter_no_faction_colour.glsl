//
//
// Shader Model 4
// Fragment Shader
//
// id: 662 - fxc/glsl_SM_3_0_rigidstandard.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*4*/	if(floatBitsToUint(r1.x) != 0u) {
/*5*/	  r1.x = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*6*/	  if(floatBitsToUint(r1.x) != 0u) {
/*7*/	    r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*9*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*10*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*11*/	    r1.w = -r1.w + 1.000000;
/*12*/	    r1.w = max(r1.w, 0.000000);
/*13*/	    r1.z = sqrt(r1.w);
/*14*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*15*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*16*/	    r1.w = inversesqrt(r1.w);
/*17*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*18*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*19*/	    r1.w = inversesqrt(r1.w);
/*20*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*21*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*22*/	    r1.w = inversesqrt(r1.w);
/*23*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*24*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*25*/	    r1.xyw = (r1.xxxx * r2.xyxz + r3.xyxz).xyw;
/*26*/	    r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*27*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*28*/	    r1.w = inversesqrt(r1.w);
/*29*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*30*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*31*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*32*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*33*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*34*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*35*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*36*/	    r0.w = -r0.w + 1.000000;
/*37*/	    r0.w = max(r0.w, 0.000000);
/*38*/	    r2.y = sqrt(r0.w);
/*39*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*40*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*41*/	    r0.w = inversesqrt(r0.w);
/*42*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*43*/	    r2.xz = (cb1.data[0].xxyx).xz/**/;
/*44*/	    r2.y = -1.000000;
/*45*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*46*/	    r0.w = inversesqrt(r0.w);
/*47*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*48*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*49*/	    r1.x = cb1.data[1].x * cb1.data[1].x;
/*50*/	    r1.x = r1.x * 1.250000;
/*51*/	    r1.x = min(r1.x, 1.000000);
/*52*/	    r1.y = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*53*/	    r1.y = r1.y * 4.000000;
/*54*/	    r1.x = r1.x * 0.200000 + r1.y;
/*55*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*56*/	    r0.w = r0.w + -r1.x;
/*57*/	    r0.w = saturate(r0.w * 200.000000);
/*58*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*59*/	    r0.w = r0.w * r0.w;
/*60*/	    r0.w = r0.w * r1.x;
/*61*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*62*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*63*/	  }
/*64*/	}
/*65*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*66*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*67*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*68*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*70*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*71*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*72*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*73*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*74*/	color0.w = 1.000000;
/*75*/	return;
}
