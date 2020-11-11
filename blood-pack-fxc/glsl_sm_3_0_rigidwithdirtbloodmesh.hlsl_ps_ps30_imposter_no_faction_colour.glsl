//
//
// Shader Model 4
// Fragment Shader
//
// id: 1233 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*3*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r1.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*5*/	r2.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*6*/	r2.xyzw = (texture(s_decal_dirt_map, r2.xyxx.st)).xyzw;
/*7*/	r1.z = r1.w * r2.w;
/*8*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*9*/	r0.xyz = (r1.zzzz * r3.xyzx + r0.xyzx).xyz;
/*10*/	r1.xy = (r1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*11*/	r3.xyzw = (texture(s_decal_blood_map, r1.xyxx.st)).xyzw;
/*12*/	r1.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*13*/	r1.x = saturate(-r1.x + r3.w);
/*14*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*15*/	if(floatBitsToUint(r1.x) != 0u) {
/*16*/	  r1.x = -r3.w + 1.000000;
/*17*/	  r1.x = saturate(vsOut_T7.w * 0.900000 + -r1.x);
/*18*/	  r1.x = -r1.x + 1.000000;
/*19*/	  r1.x = -r1.x * r1.x + 1.000000;
/*20*/	  r1.x = r1.x * -0.600000 + 1.000000;
/*21*/	  r1.xyz = (r1.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*22*/	  r2.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*23*/	  r2.z = uintBitsToFloat((r2.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*24*/	  r2.z = uintBitsToFloat(floatBitsToUint(r2.z) & uint(0x3f800000u));
/*25*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r1.xzzx).xyz;
/*26*/	  r0.xyz = (r2.zzzz * r3.xyzx + r1.xyzx).xyz;
/*27*/	}
/*28*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*29*/	if(floatBitsToUint(r1.x) != 0u) {
/*30*/	  r1.x = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*31*/	  if(floatBitsToUint(r1.x) != 0u) {
/*32*/	    r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*33*/	    r1.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*34*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*35*/	    r2.z = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*36*/	    r2.z = -r2.z + 1.000000;
/*37*/	    r2.z = max(r2.z, 0.000000);
/*38*/	    r1.z = sqrt(r2.z);
/*39*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*40*/	    r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	    r1.xy = (r2.xyxx * r1.wwww + r1.xyxx).xy;
/*42*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*43*/	    r1.w = inversesqrt(r1.w);
/*44*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
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
/*55*/	    r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*56*/	    r2.xyz = (r1.zzzz * r4.xyzx + r2.xyzx).xyz;
/*57*/	    r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*58*/	    r1.w = inversesqrt(r1.w);
/*59*/	    r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*60*/	    r1.xyz = (mix(r2.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
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
/*73*/	    r2.xz = (cb1.data[0].xxyx).xz/**/;
/*74*/	    r2.y = -1.000000;
/*75*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*76*/	    r0.w = inversesqrt(r0.w);
/*77*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*78*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*79*/	    r1.x = cb1.data[1].x * cb1.data[1].x;
/*80*/	    r1.x = r1.x * 1.250000;
/*81*/	    r1.x = min(r1.x, 1.000000);
/*82*/	    r1.y = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
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
