//
//
// Shader Model 4
// Fragment Shader
//
// id: 1006 - fxc/glsl_SM_3_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps30_alpha_test.glsl
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
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
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
uniform sampler2D s_decal_dirt_mask;

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
/*78*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*79*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*80*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*81*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*82*/	r2.w = r4.w * r5.w;
/*83*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*84*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*85*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*86*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*87*/	r3.z = inversesqrt(r3.z);
/*88*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*89*/	r4.xyz = (r2.wwww * r2.xyzx).xyz;
/*90*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*91*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*92*/	r4.x = 0;
/*93*/	r4.y = cb0.data[26].x * 0.050000;
/*94*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*95*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*96*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*97*/	r2.w = saturate(r4.x * 5.000000);
/*98*/	r4.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*99*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*100*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*101*/	r3.z = log2(r5.z);
/*102*/	r3.z = r3.z * 1.800000;
/*103*/	r3.z = exp2(r3.z);
/*104*/	r3.z = r3.z * 10.000000;
/*105*/	r3.z = min(r3.z, 1.000000);
/*106*/	r2.w = r2.w + r3.z;
/*107*/	r2.w = r2.w * 0.500000;
/*108*/	r3.z = -r5.w + 1.000000;
/*109*/	r3.z = log2(r3.z);
/*110*/	r3.z = r3.z * vsOut_T7.x;
/*111*/	r3.z = exp2(r3.z);
/*112*/	r3.z = min(r3.z, 1.000000);
/*113*/	r3.z = r3.z * vsOut_T7.x;
/*114*/	r3.w = r5.z * 0.250000;
/*115*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*116*/	r4.xyz = (r2.wwww * r4.xyzx + r3.wwww).xyz;
/*117*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*118*/	r0.xyz = (r3.zzzz * r4.xyzx + r0.xyzx).xyz;
/*119*/	r2.w = vsOut_T7.x + -0.025000;
/*120*/	r2.w = max(r2.w, 0.000000);
/*121*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*122*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*123*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*124*/	r2.w = inversesqrt(r2.w);
/*125*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*126*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*127*/	r2.w = inversesqrt(r2.w);
/*128*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*129*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*130*/	r2.w = inversesqrt(r2.w);
/*131*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*132*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*133*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*134*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*135*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*136*/	r2.w = inversesqrt(r2.w);
/*137*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*138*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*139*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*140*/	if(floatBitsToUint(r0.w) != 0u) {
/*141*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*142*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*143*/	  r0.w = r3.w * cb0.data[26].x;
/*144*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*145*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*146*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*147*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*148*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*149*/	}
/*150*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*151*/	if(floatBitsToUint(r0.w) != 0u) {
/*152*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*153*/	  if(floatBitsToUint(r0.w) != 0u) {
/*154*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*155*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*156*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*157*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*158*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*159*/	    r0.w = -r0.w + 1.000000;
/*160*/	    r0.w = max(r0.w, 0.000000);
/*161*/	    r8.z = sqrt(r0.w);
/*162*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*163*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*164*/	    r0.w = inversesqrt(r0.w);
/*165*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*166*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*167*/	    r10.y = -1.000000;
/*168*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*169*/	    r0.w = inversesqrt(r0.w);
/*170*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*171*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*172*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*173*/	    r2.w = r2.w * 1.250000;
/*174*/	    r2.w = min(r2.w, 1.000000);
/*175*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*176*/	    r3.z = r3.z * 4.000000;
/*177*/	    r2.w = r2.w * 0.200000 + r3.z;
/*178*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*179*/	    r0.w = r0.w + -r2.w;
/*180*/	    r0.w = saturate(r0.w * 200.000000);
/*181*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*182*/	    r0.w = r0.w * r0.w;
/*183*/	    r0.w = r0.w * r2.w;
/*184*/	    r3.y = r0.w * -r3.y + r3.y;
/*185*/	    r2.w = -r3.x + 0.200000;
/*186*/	    r3.x = r0.w * r2.w + r3.x;
/*187*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*188*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*189*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*190*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*191*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*192*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*193*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*194*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*195*/	    r2.w = -r2.w + 1.000000;
/*196*/	    r2.w = max(r2.w, 0.000000);
/*197*/	    r7.z = sqrt(r2.w);
/*198*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*199*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*200*/	    r2.w = sqrt(r2.w);
/*201*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*202*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*203*/	    r2.w = inversesqrt(r2.w);
/*204*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*205*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*206*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*207*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*208*/	    r2.w = -r1.y + 1.000000;
/*209*/	    r0.w = min(r0.w, r2.w);
/*210*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*211*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*212*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*213*/	    r0.w = inversesqrt(r0.w);
/*214*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*215*/	  }
/*216*/	}
/*217*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*218*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*219*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*220*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*221*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*222*/	r3.xzw = (-r0.xxyz + r2.wwww).xzw;
/*223*/	r0.xyz = (vsOut_T7.zzzz * r3.xzwx + r0.xyzx).xyz;
/*224*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*225*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*226*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*227*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*228*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*229*/	r2.w = inversesqrt(r2.w);
/*230*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*231*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*232*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*233*/	r3.x = inversesqrt(r2.w);
/*234*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*235*/	r5.x = -r3.y + 1.000000;
/*236*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*237*/	r5.z = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*238*/	r5.z = r5.z + r5.z;
/*239*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*240*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*241*/	r5.z = r5.x * 1.539380;
/*242*/	r5.z = cos((r5.z));
/*243*/	r5.z = inversesqrt(r5.z);
/*244*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*245*/	r5.w = saturate(r0.w * 60.000000);
/*246*/	r5.w = -r0.w + r5.w;
/*247*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*248*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*249*/	r6.w = inversesqrt(r6.w);
/*250*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*251*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*252*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*253*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*254*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*255*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*256*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*257*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*258*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*259*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*260*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*261*/	r6.w = -r0.w + 1.000000;
/*262*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*263*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*264*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*265*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*266*/	  r6.w = max(r6.w, 0.000000);
/*267*/	  r6.w = log2(r6.w);
/*268*/	  r6.w = r6.w * 10.000000;
/*269*/	  r6.w = exp2(r6.w);
/*270*/	  r6.w = r5.z * r6.w;
/*271*/	  r6.w = r6.w * r5.w + r0.w;
/*272*/	  r7.y = r5.x * 8.000000;
/*273*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*274*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*275*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*276*/	}
/*277*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*278*/	r1.y = max(r1.x, 0.000000);
/*279*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*280*/	if(floatBitsToUint(r1.x) != 0u) {
/*281*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*282*/	  r1.x = max(r1.x, -1.000000);
/*283*/	  r1.x = min(r1.x, 1.000000);
/*284*/	  r1.z = -abs(r1.x) + 1.000000;
/*285*/	  r1.z = sqrt(r1.z);
/*286*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*287*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*288*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*289*/	  r6.y = r1.z * r6.x;
/*290*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*291*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*292*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*293*/	  r1.x = r6.x * r1.z + r1.x;
/*294*/	  r1.z = r3.y * r3.y;
/*295*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*296*/	  r1.z = r1.z * r3.y + r7.x;
/*297*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*298*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*299*/	  r3.y = -r1.z * r1.z + 1.000000;
/*300*/	  r3.y = max(r3.y, 0.001000);
/*301*/	  r3.y = log2(r3.y);
/*302*/	  r5.y = r3.y * 4.950617;
/*303*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*304*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*305*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*306*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*307*/	  r1.z = floatBitsToInt(r1.z);
/*308*/	  r5.y = r3.y * r3.y + -r5.y;
/*309*/	  r5.y = sqrt(r5.y);
/*310*/	  r3.y = -r3.y + r5.y;
/*311*/	  r3.y = max(r3.y, 0.000000);
/*312*/	  r3.y = sqrt(r3.y);
/*313*/	  r1.z = r1.z * r3.y;
/*314*/	  r1.z = r1.z * 1.414214;
/*315*/	  r1.z = 0.008727 / r1.z;
/*316*/	  r1.z = max(r1.z, 0.000100);
/*317*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*318*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*319*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*320*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*321*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*322*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*323*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*324*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*325*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*326*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*327*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*328*/	  r1.x = floatBitsToInt(r1.x);
/*329*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*330*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*331*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*332*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*333*/	  r1.x = r1.x * r6.x + 1.000000;
/*334*/	  r1.x = r1.x * 0.500000;
/*335*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*336*/	  r1.z = r1.z * r6.y + 1.000000;
/*337*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*338*/	  r1.z = min(r1.y, 1.000000);
/*339*/	  r3.y = r5.x * 1.570796;
/*340*/	  r3.y = sin(r3.y);
/*341*/	  r1.z = r1.z + -1.000000;
/*342*/	  r1.z = r3.y * r1.z + 1.000000;
/*343*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*344*/	  r3.x = max(r3.x, 0.000000);
/*345*/	  r3.x = log2(r3.x);
/*346*/	  r3.x = r3.x * 10.000000;
/*347*/	  r3.x = exp2(r3.x);
/*348*/	  r3.x = r5.z * r3.x;
/*349*/	  r3.x = r3.x * r5.w + r0.w;
/*350*/	  r1.x = r1.z * abs(r1.x);
/*351*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*352*/	} else {
/*353*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*354*/	}
/*355*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*356*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*357*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*358*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*359*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*360*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*361*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*362*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*363*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*364*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*365*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*366*/	r3.w = 1.000000;
/*367*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*368*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*369*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*370*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*371*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*372*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*373*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*374*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*375*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*376*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*377*/	if(r0.w != 0) discard;
/*378*/	r0.w = sqrt(r2.w);
/*379*/	r1.x = saturate(cb2.data[0].w)/**/;
/*380*/	r1.x = -r1.x + 1.000000;
/*381*/	r1.x = r1.x * 8.000000 + -4.000000;
/*382*/	r1.y = saturate(cb2.data[1].x)/**/;
/*383*/	r1.y = -r1.y + 1.000000;
/*384*/	r1.y = r1.y * 1000.000000;
/*385*/	r0.w = r0.w / r1.y;
/*386*/	r0.w = r0.w + r1.x;
/*387*/	r0.w = r0.w * 1.442695;
/*388*/	r0.w = exp2(r0.w);
/*389*/	r0.w = cb2.data[1].y / r0.w;
/*390*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*391*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*392*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*393*/	r1.x = r1.x + -cb2.data[1].z;
/*394*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*395*/	r1.x = saturate(r1.y * r1.x);
/*396*/	r1.y = r1.x * -2.000000 + 3.000000;
/*397*/	r1.x = r1.x * r1.x;
/*398*/	r1.x = r1.x * r1.y;
/*399*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*400*/	r1.y = sqrt(r1.y);
/*401*/	r1.z = max(cb2.data[2].z, 0.001000);
/*402*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*403*/	r1.y = r1.z * r1.y;
/*404*/	r1.y = min(r1.y, 1.000000);
/*405*/	r1.z = r1.y * -2.000000 + 3.000000;
/*406*/	r1.y = r1.y * r1.y;
/*407*/	r1.y = r1.y * r1.z;
/*408*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*409*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*410*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*411*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*412*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*413*/	r4.w = max(r4.y, 0.000000);
/*414*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*415*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*416*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*417*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*418*/	r0.w = saturate(r0.w * r1.y);
/*419*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*420*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*421*/	color0.w = r1.w;
/*422*/	return;
}
