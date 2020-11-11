//
//
// Shader Model 4
// Fragment Shader
//
// id: 756 - fxc/glsl_SM_3_0_rigidstandardblood.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*3*/	r1.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*4*/	r1.xy = (r1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*5*/	r1.xyzw = (texture(s_decal_blood_map, r1.xyxx.st)).xyzw;
/*6*/	r1.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*7*/	r1.x = saturate(-r1.x + r1.w);
/*8*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*9*/	if(floatBitsToUint(r1.x) != 0u) {
/*10*/	  r1.x = -r1.w + 1.000000;
/*11*/	  r1.x = saturate(vsOut_T7.w * 0.900000 + -r1.x);
/*12*/	  r1.x = -r1.x + 1.000000;
/*13*/	  r1.x = -r1.x * r1.x + 1.000000;
/*14*/	  r1.x = r1.x * -0.600000 + 1.000000;
/*15*/	  r1.xyz = (r1.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*16*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*17*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*18*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*19*/	  r2.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r1.xzzx).xyz;
/*20*/	  r0.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*21*/	}
/*22*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*23*/	if(floatBitsToUint(r1.x) != 0u) {
/*24*/	  r1.x = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*25*/	  if(floatBitsToUint(r1.x) != 0u) {
/*26*/	    r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*27*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*28*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*29*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*30*/	    r1.w = -r1.w + 1.000000;
/*31*/	    r1.w = max(r1.w, 0.000000);
/*32*/	    r1.z = sqrt(r1.w);
/*33*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*34*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*35*/	    r1.w = inversesqrt(r1.w);
/*36*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*37*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*38*/	    r1.w = inversesqrt(r1.w);
/*39*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*40*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*41*/	    r1.w = inversesqrt(r1.w);
/*42*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*43*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*44*/	    r1.xyw = (r1.xxxx * r2.xyxz + r3.xyxz).xyw;
/*45*/	    r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*46*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*47*/	    r1.w = inversesqrt(r1.w);
/*48*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*49*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*50*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*51*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*52*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*53*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*54*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*55*/	    r0.w = -r0.w + 1.000000;
/*56*/	    r0.w = max(r0.w, 0.000000);
/*57*/	    r2.y = sqrt(r0.w);
/*58*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*59*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*60*/	    r0.w = inversesqrt(r0.w);
/*61*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*62*/	    r2.xz = (cb1.data[0].xxyx).xz/**/;
/*63*/	    r2.y = -1.000000;
/*64*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	    r0.w = inversesqrt(r0.w);
/*66*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*67*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*68*/	    r1.x = cb1.data[1].x * cb1.data[1].x;
/*69*/	    r1.x = r1.x * 1.250000;
/*70*/	    r1.x = min(r1.x, 1.000000);
/*71*/	    r1.y = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*72*/	    r1.y = r1.y * 4.000000;
/*73*/	    r1.x = r1.x * 0.200000 + r1.y;
/*74*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*75*/	    r0.w = r0.w + -r1.x;
/*76*/	    r0.w = saturate(r0.w * 200.000000);
/*77*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*78*/	    r0.w = r0.w * r0.w;
/*79*/	    r0.w = r0.w * r1.x;
/*80*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*81*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*82*/	  }
/*83*/	}
/*84*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*85*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*86*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*87*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*88*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*89*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*90*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*91*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*92*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*93*/	color0.w = 1.000000;
/*94*/	return;
}
