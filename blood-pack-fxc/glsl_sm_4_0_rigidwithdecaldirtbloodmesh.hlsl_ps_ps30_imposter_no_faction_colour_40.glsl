//
//
// Shader Model 4
// Fragment Shader
//
// id: 976 - fxc/glsl_SM_4_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_imposter_no_faction_colour_40.glsl
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
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_snow_normals;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*5*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*6*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*7*/	r1.w = -r1.w + 1.000000;
/*8*/	r1.w = max(r1.w, 0.000000);
/*9*/	r1.z = sqrt(r1.w);
/*10*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*11*/	r2.xy = (-cb2.data[3].xyxx + cb2.data[3].zwzz).xy;
/*12*/	r2.zw = (vsOut_T1.xxxy + -cb2.data[3].xxxy).zw;
/*13*/	r2.xy = (r2.zwzz / r2.xyxx).xy;
/*14*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*15*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.xxxy)) * 0xffffffffu)).zw;
/*16*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*17*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r1.w));
/*18*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*19*/	r2.z = vsOut_T6.x;
/*20*/	r3.xyzw = (texture(s_decal_diffuse, r2.xyzx.stp)).xyzw;
/*21*/	r2.xyzw = (texture(s_decal_normal, r2.xyzx.stp)).xyzw;
/*22*/	if(floatBitsToUint(r1.w) != 0u) {
/*23*/	  r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	  r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	  r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*26*/	  r1.w = -r1.w + 1.000000;
/*27*/	  r1.w = max(r1.w, 0.000000);
/*28*/	  r2.z = sqrt(r1.w);
/*29*/	  r4.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	  r5.xyzw = r3.xyzw * r4.wwww;
/*31*/	  r1.w = -r3.w * r4.w + 1.000000;
/*32*/	  r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*33*/	  r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*34*/	  r1.xyz = (r5.wwww * r2.xyzx + r1.xyzx).xyz;
/*35*/	}
/*36*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*37*/	r2.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*38*/	r3.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*39*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*40*/	r1.w = r2.w * r3.w;
/*41*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*42*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*43*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*44*/	r4.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*45*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*46*/	r1.w = saturate(-r1.w + r4.w);
/*47*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r1.w) != 0u) {
/*49*/	  r1.w = -r4.w + 1.000000;
/*50*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*51*/	  r1.w = -r1.w + 1.000000;
/*52*/	  r1.w = -r1.w * r1.w + 1.000000;
/*53*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*54*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*55*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*56*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*57*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*58*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*59*/	  r0.xyz = (r1.wwww * r4.xyzx + r2.xyzx).xyz;
/*60*/	}
/*61*/	r1.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*62*/	if(floatBitsToUint(r1.w) != 0u) {
/*63*/	  r1.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*64*/	  if(floatBitsToUint(r1.w) != 0u) {
/*65*/	    r2.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*66*/	    r1.xy = (r2.xyxx * r2.wwww + r1.xyxx).xy;
/*67*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*68*/	    r1.w = inversesqrt(r1.w);
/*69*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*70*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*71*/	    r1.w = inversesqrt(r1.w);
/*72*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*73*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*74*/	    r1.w = inversesqrt(r1.w);
/*75*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*76*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*77*/	    r1.w = inversesqrt(r1.w);
/*78*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*79*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*80*/	    r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*81*/	    r2.xyz = (r1.zzzz * r4.xyzx + r2.xyzx).xyz;
/*82*/	    r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*83*/	    r1.w = inversesqrt(r1.w);
/*84*/	    r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*85*/	    r1.xyz = (mix(r2.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*86*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*87*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*88*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*89*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*90*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*91*/	    r0.w = -r0.w + 1.000000;
/*92*/	    r0.w = max(r0.w, 0.000000);
/*93*/	    r2.y = sqrt(r0.w);
/*94*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*95*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*96*/	    r0.w = inversesqrt(r0.w);
/*97*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*98*/	    r2.xz = (cb1.data[0].xxyx).xz/**/;
/*99*/	    r2.y = -1.000000;
/*100*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*101*/	    r0.w = inversesqrt(r0.w);
/*102*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*103*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*104*/	    r1.x = cb1.data[1].x * cb1.data[1].x;
/*105*/	    r1.x = r1.x * 1.250000;
/*106*/	    r1.x = min(r1.x, 1.000000);
/*107*/	    r1.y = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*108*/	    r1.y = r1.y * 4.000000;
/*109*/	    r1.x = r1.x * 0.200000 + r1.y;
/*110*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*111*/	    r0.w = r0.w + -r1.x;
/*112*/	    r0.w = saturate(r0.w * 200.000000);
/*113*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*114*/	    r0.w = r0.w * r0.w;
/*115*/	    r0.w = r0.w * r1.x;
/*116*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*117*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*118*/	  }
/*119*/	}
/*120*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*121*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*122*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*123*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*124*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*125*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*126*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*127*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*128*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*129*/	color0.w = 1.000000;
/*130*/	return;
}
