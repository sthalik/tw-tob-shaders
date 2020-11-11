//
//
// Shader Model 4
// Fragment Shader
//
// id: 1116 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdecalburnmesh.hlsl_PS_ps30_alpha_test.glsl
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
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.y = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb4.data[0].x))) * 0xffffffffu)).x;
/*14*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*15*/	  r1.x = r0.x * r1.x;
/*16*/	}
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r0.x = r1.w + -0.500000;
/*20*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(r0.x != 0) discard;
/*22*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*23*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*24*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r1.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*26*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*27*/	r1.x = saturate(vsOut_N0.w);
/*28*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*29*/	r5.xyz = (r1.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*30*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyz;
/*31*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*32*/	r6.xyz = (r1.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*33*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r1.zzzz), uvec4(0)))).xyz;
/*34*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*35*/	r1.xyz = (r1.xxxx * r7.xyzx + cb5.data[2].xyzx).xyz;
/*36*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r4.xxxx * r5.xyzx + r0.xyzx).xyz;
/*38*/	r5.xyz = (r6.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r4.yyyy * r5.xyzx + r0.xyzx).xyz;
/*40*/	r1.xyz = (r1.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*41*/	r0.xyz = (r4.zzzz * r1.xyzx + r0.xyzx).xyz;
/*42*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r1.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*44*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	r2.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*46*/	r2.w = -r2.w + 1.000000;
/*47*/	r2.w = max(r2.w, 0.000000);
/*48*/	r1.z = sqrt(r2.w);
/*49*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*50*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*51*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*52*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*53*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*54*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*55*/	r2.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*56*/	r2.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r2.w));
/*57*/	r2.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r2.w));
/*58*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*59*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*60*/	if(floatBitsToUint(r2.w) != 0u) {
/*61*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*62*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*63*/	  r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*64*/	  r2.w = -r2.w + 1.000000;
/*65*/	  r2.w = max(r2.w, 0.000000);
/*66*/	  r5.z = sqrt(r2.w);
/*67*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*68*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*69*/	  r2.w = r3.x * r7.w;
/*70*/	  r3.x = r2.w * -0.500000 + r3.x;
/*71*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*72*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*73*/	  r2.w = -r4.w * r6.w + 1.000000;
/*74*/	  r0.xyz = (r2.wwww * r0.xyzx + r7.xyzx).xyz;
/*75*/	  r4.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*76*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*77*/	}
/*78*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*79*/	r4.x = 0;
/*80*/	r4.y = cb0.data[26].x * 0.050000;
/*81*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*82*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*83*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*84*/	r2.w = saturate(r4.x * 5.000000);
/*85*/	r4.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*86*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*87*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*88*/	r3.z = log2(r5.z);
/*89*/	r3.z = r3.z * 1.800000;
/*90*/	r3.z = exp2(r3.z);
/*91*/	r3.z = r3.z * 10.000000;
/*92*/	r3.z = min(r3.z, 1.000000);
/*93*/	r2.w = r2.w + r3.z;
/*94*/	r2.w = r2.w * 0.500000;
/*95*/	r3.z = -r5.w + 1.000000;
/*96*/	r3.z = log2(r3.z);
/*97*/	r3.z = r3.z * vsOut_T7.x;
/*98*/	r3.z = exp2(r3.z);
/*99*/	r3.z = min(r3.z, 1.000000);
/*100*/	r3.z = r3.z * vsOut_T7.x;
/*101*/	r3.w = r5.z * 0.250000;
/*102*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*103*/	r4.xyz = (r2.wwww * r4.xyzx + r3.wwww).xyz;
/*104*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*105*/	r0.xyz = (r3.zzzz * r4.xyzx + r0.xyzx).xyz;
/*106*/	r2.w = vsOut_T7.x + -0.025000;
/*107*/	r2.w = max(r2.w, 0.000000);
/*108*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*109*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*110*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*111*/	r2.w = inversesqrt(r2.w);
/*112*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*113*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*114*/	r2.w = inversesqrt(r2.w);
/*115*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*116*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*117*/	r2.w = inversesqrt(r2.w);
/*118*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*119*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*120*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*121*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*122*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*123*/	r2.w = inversesqrt(r2.w);
/*124*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*125*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*126*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*127*/	if(floatBitsToUint(r0.w) != 0u) {
/*128*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*129*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*130*/	  r0.w = r3.w * cb0.data[26].x;
/*131*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*132*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*133*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*134*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*135*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*136*/	}
/*137*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*138*/	if(floatBitsToUint(r0.w) != 0u) {
/*139*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*140*/	  if(floatBitsToUint(r0.w) != 0u) {
/*141*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*142*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*143*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*144*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*145*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*146*/	    r0.w = -r0.w + 1.000000;
/*147*/	    r0.w = max(r0.w, 0.000000);
/*148*/	    r8.z = sqrt(r0.w);
/*149*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*150*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*151*/	    r0.w = inversesqrt(r0.w);
/*152*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*153*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*154*/	    r10.y = -1.000000;
/*155*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*156*/	    r0.w = inversesqrt(r0.w);
/*157*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*158*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*159*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*160*/	    r2.w = r2.w * 1.250000;
/*161*/	    r2.w = min(r2.w, 1.000000);
/*162*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*163*/	    r3.z = r3.z * 4.000000;
/*164*/	    r2.w = r2.w * 0.200000 + r3.z;
/*165*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*166*/	    r0.w = r0.w + -r2.w;
/*167*/	    r0.w = saturate(r0.w * 200.000000);
/*168*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*169*/	    r0.w = r0.w * r0.w;
/*170*/	    r0.w = r0.w * r2.w;
/*171*/	    r3.y = r0.w * -r3.y + r3.y;
/*172*/	    r2.w = -r3.x + 0.200000;
/*173*/	    r3.x = r0.w * r2.w + r3.x;
/*174*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*175*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*176*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*177*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*178*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*179*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*180*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*181*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*182*/	    r2.w = -r2.w + 1.000000;
/*183*/	    r2.w = max(r2.w, 0.000000);
/*184*/	    r7.z = sqrt(r2.w);
/*185*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*186*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*187*/	    r2.w = sqrt(r2.w);
/*188*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*189*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*190*/	    r2.w = inversesqrt(r2.w);
/*191*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*192*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*193*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*194*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*195*/	    r2.w = -r1.y + 1.000000;
/*196*/	    r0.w = min(r0.w, r2.w);
/*197*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*198*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*199*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*200*/	    r0.w = inversesqrt(r0.w);
/*201*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*202*/	  }
/*203*/	}
/*204*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*205*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*206*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*207*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*208*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*209*/	r3.xzw = (-r0.xxyz + r2.wwww).xzw;
/*210*/	r0.xyz = (vsOut_T7.zzzz * r3.xzwx + r0.xyzx).xyz;
/*211*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*212*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*213*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*214*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*215*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*216*/	r2.w = inversesqrt(r2.w);
/*217*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*218*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*219*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*220*/	r3.x = inversesqrt(r2.w);
/*221*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*222*/	r5.x = -r3.y + 1.000000;
/*223*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*224*/	r5.z = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*225*/	r5.z = r5.z + r5.z;
/*226*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*227*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*228*/	r5.z = r5.x * 1.539380;
/*229*/	r5.z = cos((r5.z));
/*230*/	r5.z = inversesqrt(r5.z);
/*231*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*232*/	r5.w = saturate(r0.w * 60.000000);
/*233*/	r5.w = -r0.w + r5.w;
/*234*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*235*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*236*/	r6.w = inversesqrt(r6.w);
/*237*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*238*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*239*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*240*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*241*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*242*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*243*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*244*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*245*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*246*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*247*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*248*/	r6.w = -r0.w + 1.000000;
/*249*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*250*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*251*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*252*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*253*/	  r6.w = max(r6.w, 0.000000);
/*254*/	  r6.w = log2(r6.w);
/*255*/	  r6.w = r6.w * 10.000000;
/*256*/	  r6.w = exp2(r6.w);
/*257*/	  r6.w = r5.z * r6.w;
/*258*/	  r6.w = r6.w * r5.w + r0.w;
/*259*/	  r7.y = r5.x * 8.000000;
/*260*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*261*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*262*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*263*/	}
/*264*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*265*/	r1.y = max(r1.x, 0.000000);
/*266*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*267*/	if(floatBitsToUint(r1.x) != 0u) {
/*268*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*269*/	  r1.x = max(r1.x, -1.000000);
/*270*/	  r1.x = min(r1.x, 1.000000);
/*271*/	  r1.z = -abs(r1.x) + 1.000000;
/*272*/	  r1.z = sqrt(r1.z);
/*273*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*274*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*275*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*276*/	  r6.y = r1.z * r6.x;
/*277*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*278*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*279*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*280*/	  r1.x = r6.x * r1.z + r1.x;
/*281*/	  r1.z = r3.y * r3.y;
/*282*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*283*/	  r1.z = r1.z * r3.y + r7.x;
/*284*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*285*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*286*/	  r3.y = -r1.z * r1.z + 1.000000;
/*287*/	  r3.y = max(r3.y, 0.001000);
/*288*/	  r3.y = log2(r3.y);
/*289*/	  r5.y = r3.y * 4.950617;
/*290*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*291*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*292*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*293*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*294*/	  r1.z = floatBitsToInt(r1.z);
/*295*/	  r5.y = r3.y * r3.y + -r5.y;
/*296*/	  r5.y = sqrt(r5.y);
/*297*/	  r3.y = -r3.y + r5.y;
/*298*/	  r3.y = max(r3.y, 0.000000);
/*299*/	  r3.y = sqrt(r3.y);
/*300*/	  r1.z = r1.z * r3.y;
/*301*/	  r1.z = r1.z * 1.414214;
/*302*/	  r1.z = 0.008727 / r1.z;
/*303*/	  r1.z = max(r1.z, 0.000100);
/*304*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*305*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*306*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*307*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*308*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*309*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*310*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*311*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*312*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*313*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*314*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*315*/	  r1.x = floatBitsToInt(r1.x);
/*316*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*317*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*318*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*319*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*320*/	  r1.x = r1.x * r6.x + 1.000000;
/*321*/	  r1.x = r1.x * 0.500000;
/*322*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*323*/	  r1.z = r1.z * r6.y + 1.000000;
/*324*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*325*/	  r1.z = min(r1.y, 1.000000);
/*326*/	  r3.y = r5.x * 1.570796;
/*327*/	  r3.y = sin(r3.y);
/*328*/	  r1.z = r1.z + -1.000000;
/*329*/	  r1.z = r3.y * r1.z + 1.000000;
/*330*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*331*/	  r3.x = max(r3.x, 0.000000);
/*332*/	  r3.x = log2(r3.x);
/*333*/	  r3.x = r3.x * 10.000000;
/*334*/	  r3.x = exp2(r3.x);
/*335*/	  r3.x = r5.z * r3.x;
/*336*/	  r3.x = r3.x * r5.w + r0.w;
/*337*/	  r1.x = r1.z * abs(r1.x);
/*338*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*339*/	} else {
/*340*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*341*/	}
/*342*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*343*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*344*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*345*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*346*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*347*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*348*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*349*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*350*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*351*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*352*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*353*/	r3.w = 1.000000;
/*354*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*355*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*356*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*357*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*358*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*359*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*360*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*361*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*362*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*363*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*364*/	if(r0.w != 0) discard;
/*365*/	r0.w = sqrt(r2.w);
/*366*/	r1.x = saturate(cb2.data[0].w)/**/;
/*367*/	r1.x = -r1.x + 1.000000;
/*368*/	r1.x = r1.x * 8.000000 + -4.000000;
/*369*/	r1.y = saturate(cb2.data[1].x)/**/;
/*370*/	r1.y = -r1.y + 1.000000;
/*371*/	r1.y = r1.y * 1000.000000;
/*372*/	r0.w = r0.w / r1.y;
/*373*/	r0.w = r0.w + r1.x;
/*374*/	r0.w = r0.w * 1.442695;
/*375*/	r0.w = exp2(r0.w);
/*376*/	r0.w = cb2.data[1].y / r0.w;
/*377*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*378*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*379*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*380*/	r1.x = r1.x + -cb2.data[1].z;
/*381*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*382*/	r1.x = saturate(r1.y * r1.x);
/*383*/	r1.y = r1.x * -2.000000 + 3.000000;
/*384*/	r1.x = r1.x * r1.x;
/*385*/	r1.x = r1.x * r1.y;
/*386*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*387*/	r1.y = sqrt(r1.y);
/*388*/	r1.z = max(cb2.data[2].z, 0.001000);
/*389*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*390*/	r1.y = r1.z * r1.y;
/*391*/	r1.y = min(r1.y, 1.000000);
/*392*/	r1.z = r1.y * -2.000000 + 3.000000;
/*393*/	r1.y = r1.y * r1.y;
/*394*/	r1.y = r1.y * r1.z;
/*395*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*396*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*397*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*398*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*399*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*400*/	r4.w = max(r4.y, 0.000000);
/*401*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*402*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*403*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*404*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*405*/	r0.w = saturate(r0.w * r1.y);
/*406*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*407*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*408*/	color0.w = r1.w;
/*409*/	return;
}
