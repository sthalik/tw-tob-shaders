//
//
// Shader Model 4
// Fragment Shader
//
// id: 1280 - fxc/glsl_SM_3_0_rigidwithdirtburnmesh.hlsl_PS_ps30_imposter_no_faction_colour.glsl
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
/*3*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r1.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*5*/	r2.xyzw = (texture(s_decal_dirt_map, r1.xyxx.st)).xyzw;
/*6*/	r1.x = r1.w * r2.w;
/*7*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*8*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*9*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*10*/	r3.x = r1.x;
/*11*/	r3.y = cb1.data[26].x * 0.050000 + r1.y;
/*12*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*13*/	r4.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*14*/	r1.x = saturate(r3.x * 5.000000);
/*15*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*16*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*17*/	r2.z = saturate(-r2.z * 15.000000 + 1.000000);
/*18*/	r2.w = log2(r4.z);
/*19*/	r2.w = r2.w * 1.800000;
/*20*/	r2.w = exp2(r2.w);
/*21*/	r2.w = r2.w * 10.000000;
/*22*/	r2.w = min(r2.w, 1.000000);
/*23*/	r2.z = r2.w + r2.z;
/*24*/	r2.z = r2.z * 0.500000;
/*25*/	r2.w = -r4.w + 1.000000;
/*26*/	r2.w = log2(r2.w);
/*27*/	r2.w = r2.w * vsOut_T7.x;
/*28*/	r2.w = exp2(r2.w);
/*29*/	r2.w = min(r2.w, 1.000000);
/*30*/	r2.w = r2.w * vsOut_T7.x;
/*31*/	r3.x = r4.z * 0.250000;
/*32*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.xxxx).xyz;
/*33*/	r1.xyz = (r2.zzzz * r1.xyzx + r3.xxxx).xyz;
/*34*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*35*/	r0.xyz = (r2.wwww * r1.xyzx + r0.xyzx).xyz;
/*36*/	r1.x = vsOut_T7.x + -0.025000;
/*37*/	r1.x = max(r1.x, 0.000000);
/*38*/	r3.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*40*/	r1.x = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*41*/	if(floatBitsToUint(r1.x) != 0u) {
/*42*/	  r1.x = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*43*/	  if(floatBitsToUint(r1.x) != 0u) {
/*44*/	    r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*45*/	    r1.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*46*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*47*/	    r2.z = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*48*/	    r2.z = -r2.z + 1.000000;
/*49*/	    r2.z = max(r2.z, 0.000000);
/*50*/	    r1.z = sqrt(r2.z);
/*51*/	    r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*52*/	    r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*53*/	    r1.xy = (r2.xyxx * r1.wwww + r1.xyxx).xy;
/*54*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*55*/	    r1.w = inversesqrt(r1.w);
/*56*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*57*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*58*/	    r1.w = inversesqrt(r1.w);
/*59*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*60*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*61*/	    r1.w = inversesqrt(r1.w);
/*62*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*63*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*64*/	    r1.w = inversesqrt(r1.w);
/*65*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*66*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*67*/	    r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*68*/	    r2.xyz = (r1.zzzz * r4.xyzx + r2.xyzx).xyz;
/*69*/	    r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*70*/	    r1.w = inversesqrt(r1.w);
/*71*/	    r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*72*/	    r1.xyz = (mix(r2.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*73*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*74*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*75*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*76*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*77*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*78*/	    r0.w = -r0.w + 1.000000;
/*79*/	    r0.w = max(r0.w, 0.000000);
/*80*/	    r2.y = sqrt(r0.w);
/*81*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*82*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*83*/	    r0.w = inversesqrt(r0.w);
/*84*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*85*/	    r2.xz = (cb2.data[0].xxyx).xz/**/;
/*86*/	    r2.y = -1.000000;
/*87*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*88*/	    r0.w = inversesqrt(r0.w);
/*89*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*90*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*91*/	    r1.x = cb2.data[1].x * cb2.data[1].x;
/*92*/	    r1.x = r1.x * 1.250000;
/*93*/	    r1.x = min(r1.x, 1.000000);
/*94*/	    r1.y = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*95*/	    r1.y = r1.y * 4.000000;
/*96*/	    r1.x = r1.x * 0.200000 + r1.y;
/*97*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*98*/	    r0.w = r0.w + -r1.x;
/*99*/	    r0.w = saturate(r0.w * 200.000000);
/*100*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*101*/	    r0.w = r0.w * r0.w;
/*102*/	    r0.w = r0.w * r1.x;
/*103*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*104*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*105*/	  }
/*106*/	}
/*107*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*108*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*109*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*110*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*111*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*112*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*113*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*114*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*115*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*116*/	color0.w = 1.000000;
/*117*/	return;
}
