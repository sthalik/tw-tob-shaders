//
//
// Shader Model 4
// Fragment Shader
//
// id: 1135 - fxc/glsl_SM_3_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_imposter.glsl
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
flat in vec4 vsOut_N0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*3*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*5*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*6*/	r1.w = saturate(vsOut_N0.w);
/*7*/	r3.xyz = (r3.xyzx + -cb3.data[0].xyzx).xyz;
/*8*/	r3.xyz = (r1.wwww * r3.xyzx + cb3.data[0].xyzx).xyz;
/*9*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*10*/	r2.xyw = (r2.xyxw + -cb3.data[1].xyxz).xyw;
/*11*/	r2.xyw = (r1.wwww * r2.xyxw + cb3.data[1].xyxz).xyw;
/*12*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*13*/	r4.xyz = (r4.xyzx + -cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[2].xyzx).xyz;
/*15*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*17*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*20*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*21*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*22*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*23*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*25*/	r1.w = -r1.w + 1.000000;
/*26*/	r1.w = max(r1.w, 0.000000);
/*27*/	r1.z = sqrt(r1.w);
/*28*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*29*/	r2.xy = (-cb2.data[3].xyxx + cb2.data[3].zwzz).xy;
/*30*/	r2.zw = (vsOut_T1.xxxy + -cb2.data[3].xxxy).zw;
/*31*/	r2.xy = (r2.zwzz / r2.xyxx).xy;
/*32*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r2.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*33*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r2.xyxx)) * 0xffffffffu)).xy;
/*34*/	r1.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r3.x));
/*35*/	r1.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r1.w));
/*36*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r1.w));
/*37*/	r3.xyzw = (texture(s_decal_diffuse, r2.xyxx.st)).xyzw;
/*38*/	r2.xyzw = (texture(s_decal_normal, r2.xyxx.st)).xyzw;
/*39*/	if(floatBitsToUint(r1.w) != 0u) {
/*40*/	  r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*41*/	  r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	  r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*43*/	  r1.w = -r1.w + 1.000000;
/*44*/	  r1.w = max(r1.w, 0.000000);
/*45*/	  r2.z = sqrt(r1.w);
/*46*/	  r4.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r5.xyzw = r3.xyzw * r4.wwww;
/*48*/	  r1.w = -r3.w * r4.w + 1.000000;
/*49*/	  r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*50*/	  r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*51*/	  r1.xyz = (r5.wwww * r2.xyzx + r1.xyzx).xyz;
/*52*/	}
/*53*/	r2.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*54*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*55*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*56*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*57*/	r1.w = saturate(-r1.w + r2.w);
/*58*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*59*/	if(floatBitsToUint(r1.w) != 0u) {
/*60*/	  r1.w = -r2.w + 1.000000;
/*61*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*62*/	  r1.w = -r1.w + 1.000000;
/*63*/	  r1.w = -r1.w * r1.w + 1.000000;
/*64*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*65*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*66*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*67*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*68*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*69*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*70*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*71*/	}
/*72*/	r1.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*73*/	if(floatBitsToUint(r1.w) != 0u) {
/*74*/	  r1.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*75*/	  if(floatBitsToUint(r1.w) != 0u) {
/*76*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	    r1.w = inversesqrt(r1.w);
/*78*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*79*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*80*/	    r1.w = inversesqrt(r1.w);
/*81*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*82*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	    r1.w = inversesqrt(r1.w);
/*84*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*85*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*86*/	    r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*87*/	    r2.xyz = (r1.zzzz * r4.xyzx + r2.xyzx).xyz;
/*88*/	    r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*89*/	    r1.w = inversesqrt(r1.w);
/*90*/	    r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*91*/	    r1.xyz = (mix(r2.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*92*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*93*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*94*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*95*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*96*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*97*/	    r0.w = -r0.w + 1.000000;
/*98*/	    r0.w = max(r0.w, 0.000000);
/*99*/	    r2.y = sqrt(r0.w);
/*100*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*101*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*102*/	    r0.w = inversesqrt(r0.w);
/*103*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*104*/	    r2.xz = (cb1.data[0].xxyx).xz/**/;
/*105*/	    r2.y = -1.000000;
/*106*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*107*/	    r0.w = inversesqrt(r0.w);
/*108*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*109*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*110*/	    r1.x = cb1.data[1].x * cb1.data[1].x;
/*111*/	    r1.x = r1.x * 1.250000;
/*112*/	    r1.x = min(r1.x, 1.000000);
/*113*/	    r1.y = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*114*/	    r1.y = r1.y * 4.000000;
/*115*/	    r1.x = r1.x * 0.200000 + r1.y;
/*116*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*117*/	    r0.w = r0.w + -r1.x;
/*118*/	    r0.w = saturate(r0.w * 200.000000);
/*119*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*120*/	    r0.w = r0.w * r0.w;
/*121*/	    r0.w = r0.w * r1.x;
/*122*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*123*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*124*/	  }
/*125*/	}
/*126*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*127*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*128*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*129*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*131*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*132*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*133*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*134*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*135*/	color0.w = 1.000000;
/*136*/	return;
}