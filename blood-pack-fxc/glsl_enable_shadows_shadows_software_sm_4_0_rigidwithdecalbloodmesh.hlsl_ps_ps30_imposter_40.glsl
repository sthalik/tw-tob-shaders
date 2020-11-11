//
//
// Shader Model 4
// Fragment Shader
//
// id: 5178 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_imposter_40.glsl
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
uniform sampler2D s_decal_mask;
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
/*32*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*33*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.xxxy)) * 0xffffffffu)).zw;
/*34*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*35*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r1.w));
/*36*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r1.w));
/*37*/	r2.z = vsOut_T6.x;
/*38*/	r3.xyzw = (texture(s_decal_diffuse, r2.xyzx.stp)).xyzw;
/*39*/	r2.xyzw = (texture(s_decal_normal, r2.xyzx.stp)).xyzw;
/*40*/	if(floatBitsToUint(r1.w) != 0u) {
/*41*/	  r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*42*/	  r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*43*/	  r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*44*/	  r1.w = -r1.w + 1.000000;
/*45*/	  r1.w = max(r1.w, 0.000000);
/*46*/	  r2.z = sqrt(r1.w);
/*47*/	  r4.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*48*/	  r5.xyzw = r3.xyzw * r4.wwww;
/*49*/	  r1.w = -r3.w * r4.w + 1.000000;
/*50*/	  r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*51*/	  r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*52*/	  r1.xyz = (r5.wwww * r2.xyzx + r1.xyzx).xyz;
/*53*/	}
/*54*/	r2.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*55*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*56*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*57*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*58*/	r1.w = saturate(-r1.w + r2.w);
/*59*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*60*/	if(floatBitsToUint(r1.w) != 0u) {
/*61*/	  r1.w = -r2.w + 1.000000;
/*62*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*63*/	  r1.w = -r1.w + 1.000000;
/*64*/	  r1.w = -r1.w * r1.w + 1.000000;
/*65*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*66*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*67*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*68*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*69*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*70*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*71*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*72*/	}
/*73*/	r1.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*74*/	if(floatBitsToUint(r1.w) != 0u) {
/*75*/	  r1.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*76*/	  if(floatBitsToUint(r1.w) != 0u) {
/*77*/	    r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*78*/	    r1.w = inversesqrt(r1.w);
/*79*/	    r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*80*/	    r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*81*/	    r1.w = inversesqrt(r1.w);
/*82*/	    r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*83*/	    r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*84*/	    r1.w = inversesqrt(r1.w);
/*85*/	    r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*86*/	    r3.xyz = (r1.yyyy * r3.xyzx).xyz;
/*87*/	    r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*88*/	    r2.xyz = (r1.zzzz * r4.xyzx + r2.xyzx).xyz;
/*89*/	    r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*90*/	    r1.w = inversesqrt(r1.w);
/*91*/	    r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*92*/	    r1.xyz = (mix(r2.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*93*/	    r2.xy = (vsOut_T0.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*94*/	    r2.xyzw = (texture(s_snow_normals, r2.xyxx.st)).xyzw;
/*95*/	    r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*96*/	    r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*97*/	    r0.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*98*/	    r0.w = -r0.w + 1.000000;
/*99*/	    r0.w = max(r0.w, 0.000000);
/*100*/	    r2.y = sqrt(r0.w);
/*101*/	    r1.xyz = (r2.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*102*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*103*/	    r0.w = inversesqrt(r0.w);
/*104*/	    r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*105*/	    r2.xz = (cb1.data[0].xxyx).xz/**/;
/*106*/	    r2.y = -1.000000;
/*107*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*108*/	    r0.w = inversesqrt(r0.w);
/*109*/	    r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*110*/	    r0.w = saturate(dot(vec3(-r2.xyzx), vec3(r1.xyzx)));
/*111*/	    r1.x = cb1.data[1].x * cb1.data[1].x;
/*112*/	    r1.x = r1.x * 1.250000;
/*113*/	    r1.x = min(r1.x, 1.000000);
/*114*/	    r1.y = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*115*/	    r1.y = r1.y * 4.000000;
/*116*/	    r1.x = r1.x * 0.200000 + r1.y;
/*117*/	    r1.x = r1.x * -0.700000 + 1.000000;
/*118*/	    r0.w = r0.w + -r1.x;
/*119*/	    r0.w = saturate(r0.w * 200.000000);
/*120*/	    r1.x = r0.w * -2.000000 + 3.000000;
/*121*/	    r0.w = r0.w * r0.w;
/*122*/	    r0.w = r0.w * r1.x;
/*123*/	    r1.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*124*/	    r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*125*/	  }
/*126*/	}
/*127*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*128*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*129*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*130*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*131*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*132*/	r0.xyz = saturate(vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*133*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*134*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*135*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*136*/	color0.w = 1.000000;
/*137*/	return;
}
