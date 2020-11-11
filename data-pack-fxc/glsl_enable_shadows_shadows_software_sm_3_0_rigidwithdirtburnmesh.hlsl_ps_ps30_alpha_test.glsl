//
//
// Shader Model 4
// Fragment Shader
//
// id: 5319 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdirtburnmesh.hlsl_PS_ps30_alpha_test.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*23*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
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
/*50*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*51*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*52*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*53*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*54*/	r2.w = r4.w * r5.w;
/*55*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*56*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*57*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*58*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*59*/	r3.z = inversesqrt(r3.z);
/*60*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*61*/	r4.xyz = (r2.wwww * r2.xyzx).xyz;
/*62*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*63*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*64*/	r4.x = 0;
/*65*/	r4.y = cb0.data[26].x * 0.050000;
/*66*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*67*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*68*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*69*/	r2.w = saturate(r4.x * 5.000000);
/*70*/	r4.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*71*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*72*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*73*/	r3.z = log2(r5.z);
/*74*/	r3.z = r3.z * 1.800000;
/*75*/	r3.z = exp2(r3.z);
/*76*/	r3.z = r3.z * 10.000000;
/*77*/	r3.z = min(r3.z, 1.000000);
/*78*/	r2.w = r2.w + r3.z;
/*79*/	r2.w = r2.w * 0.500000;
/*80*/	r3.z = -r5.w + 1.000000;
/*81*/	r3.z = log2(r3.z);
/*82*/	r3.z = r3.z * vsOut_T7.x;
/*83*/	r3.z = exp2(r3.z);
/*84*/	r3.z = min(r3.z, 1.000000);
/*85*/	r3.z = r3.z * vsOut_T7.x;
/*86*/	r3.w = r5.z * 0.250000;
/*87*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*88*/	r4.xyz = (r2.wwww * r4.xyzx + r3.wwww).xyz;
/*89*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*90*/	r0.xyz = (r3.zzzz * r4.xyzx + r0.xyzx).xyz;
/*91*/	r2.w = vsOut_T7.x + -0.025000;
/*92*/	r2.w = max(r2.w, 0.000000);
/*93*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*94*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*95*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*96*/	r2.w = inversesqrt(r2.w);
/*97*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*98*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*99*/	r2.w = inversesqrt(r2.w);
/*100*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*101*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*102*/	r2.w = inversesqrt(r2.w);
/*103*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*104*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*105*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*106*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*107*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*108*/	r2.w = inversesqrt(r2.w);
/*109*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*110*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*111*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*112*/	if(floatBitsToUint(r0.w) != 0u) {
/*113*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*114*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*115*/	  r0.w = r3.w * cb0.data[26].x;
/*116*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*117*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*118*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*119*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*120*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*121*/	}
/*122*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*123*/	if(floatBitsToUint(r0.w) != 0u) {
/*124*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*125*/	  if(floatBitsToUint(r0.w) != 0u) {
/*126*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*127*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*128*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*129*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*130*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*131*/	    r0.w = -r0.w + 1.000000;
/*132*/	    r0.w = max(r0.w, 0.000000);
/*133*/	    r8.z = sqrt(r0.w);
/*134*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*135*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*136*/	    r0.w = inversesqrt(r0.w);
/*137*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*138*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*139*/	    r10.y = -1.000000;
/*140*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*141*/	    r0.w = inversesqrt(r0.w);
/*142*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*143*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*144*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*145*/	    r2.w = r2.w * 1.250000;
/*146*/	    r2.w = min(r2.w, 1.000000);
/*147*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*148*/	    r3.z = r3.z * 4.000000;
/*149*/	    r2.w = r2.w * 0.200000 + r3.z;
/*150*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*151*/	    r0.w = r0.w + -r2.w;
/*152*/	    r0.w = saturate(r0.w * 200.000000);
/*153*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*154*/	    r0.w = r0.w * r0.w;
/*155*/	    r0.w = r0.w * r2.w;
/*156*/	    r3.x = r0.w * -r3.x + r3.x;
/*157*/	    r2.w = -r3.y + 0.200000;
/*158*/	    r3.y = r0.w * r2.w + r3.y;
/*159*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*160*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*161*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*162*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*163*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*164*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*165*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*166*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*167*/	    r2.w = -r2.w + 1.000000;
/*168*/	    r2.w = max(r2.w, 0.000000);
/*169*/	    r7.z = sqrt(r2.w);
/*170*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*171*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*172*/	    r2.w = sqrt(r2.w);
/*173*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*174*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*175*/	    r2.w = inversesqrt(r2.w);
/*176*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*177*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*178*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*179*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*180*/	    r2.w = -r1.y + 1.000000;
/*181*/	    r0.w = min(r0.w, r2.w);
/*182*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*183*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*184*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*185*/	    r0.w = inversesqrt(r0.w);
/*186*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*187*/	  }
/*188*/	}
/*189*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*190*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*191*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*192*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*193*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*194*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*195*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*196*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*197*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*198*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*199*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*200*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*201*/	r2.w = inversesqrt(r2.w);
/*202*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*203*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*204*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*205*/	r3.y = inversesqrt(r2.w);
/*206*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*207*/	r5.x = -r3.x + 1.000000;
/*208*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*209*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*210*/	r5.z = r5.z + r5.z;
/*211*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*212*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*213*/	r5.z = r5.x * 1.539380;
/*214*/	r5.z = cos((r5.z));
/*215*/	r5.z = inversesqrt(r5.z);
/*216*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*217*/	r5.w = saturate(r0.w * 60.000000);
/*218*/	r5.w = -r0.w + r5.w;
/*219*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*220*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*221*/	r6.w = inversesqrt(r6.w);
/*222*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*223*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*224*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*225*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*226*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*227*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*228*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*229*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*230*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*231*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*232*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*233*/	r6.w = -r0.w + 1.000000;
/*234*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*235*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*236*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*237*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*238*/	  r6.w = max(r6.w, 0.000000);
/*239*/	  r6.w = log2(r6.w);
/*240*/	  r6.w = r6.w * 10.000000;
/*241*/	  r6.w = exp2(r6.w);
/*242*/	  r6.w = r5.z * r6.w;
/*243*/	  r6.w = r6.w * r5.w + r0.w;
/*244*/	  r7.y = r5.x * 8.000000;
/*245*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*246*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*247*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*248*/	}
/*249*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*250*/	r1.y = max(r1.x, 0.000000);
/*251*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*252*/	if(floatBitsToUint(r1.x) != 0u) {
/*253*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*254*/	  r1.x = max(r1.x, -1.000000);
/*255*/	  r1.x = min(r1.x, 1.000000);
/*256*/	  r1.z = -abs(r1.x) + 1.000000;
/*257*/	  r1.z = sqrt(r1.z);
/*258*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*259*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*260*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*261*/	  r6.y = r1.z * r6.x;
/*262*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*263*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*264*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*265*/	  r1.x = r6.x * r1.z + r1.x;
/*266*/	  r1.z = r3.x * r3.x;
/*267*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*268*/	  r1.z = r1.z * r3.x + r7.x;
/*269*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*270*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*271*/	  r3.x = -r1.z * r1.z + 1.000000;
/*272*/	  r3.x = max(r3.x, 0.001000);
/*273*/	  r3.x = log2(r3.x);
/*274*/	  r5.y = r3.x * 4.950617;
/*275*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*276*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*277*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*278*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*279*/	  r1.z = floatBitsToInt(r1.z);
/*280*/	  r5.y = r3.x * r3.x + -r5.y;
/*281*/	  r5.y = sqrt(r5.y);
/*282*/	  r3.x = -r3.x + r5.y;
/*283*/	  r3.x = max(r3.x, 0.000000);
/*284*/	  r3.x = sqrt(r3.x);
/*285*/	  r1.z = r1.z * r3.x;
/*286*/	  r1.z = r1.z * 1.414214;
/*287*/	  r1.z = 0.008727 / r1.z;
/*288*/	  r1.z = max(r1.z, 0.000100);
/*289*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*290*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*291*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*292*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*293*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*294*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*295*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*296*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*297*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*298*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*299*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*300*/	  r1.x = floatBitsToInt(r1.x);
/*301*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*302*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*303*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*304*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*305*/	  r1.x = r1.x * r6.x + 1.000000;
/*306*/	  r1.x = r1.x * 0.500000;
/*307*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*308*/	  r1.z = r1.z * r6.y + 1.000000;
/*309*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*310*/	  r1.z = min(r1.y, 1.000000);
/*311*/	  r3.x = r5.x * 1.570796;
/*312*/	  r3.x = sin(r3.x);
/*313*/	  r1.z = r1.z + -1.000000;
/*314*/	  r1.z = r3.x * r1.z + 1.000000;
/*315*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*316*/	  r3.x = max(r3.x, 0.000000);
/*317*/	  r3.x = log2(r3.x);
/*318*/	  r3.x = r3.x * 10.000000;
/*319*/	  r3.x = exp2(r3.x);
/*320*/	  r3.x = r5.z * r3.x;
/*321*/	  r3.x = r3.x * r5.w + r0.w;
/*322*/	  r1.x = r1.z * abs(r1.x);
/*323*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*324*/	} else {
/*325*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*326*/	}
/*327*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*328*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*329*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*330*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*331*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*332*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*333*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*334*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*335*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*336*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*337*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*338*/	r3.w = 1.000000;
/*339*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*340*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*341*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*342*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*343*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*344*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*345*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*346*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*347*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*348*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*349*/	if(r0.w != 0) discard;
/*350*/	r0.w = sqrt(r2.w);
/*351*/	r1.x = saturate(cb2.data[0].w)/**/;
/*352*/	r1.x = -r1.x + 1.000000;
/*353*/	r1.x = r1.x * 8.000000 + -4.000000;
/*354*/	r1.y = saturate(cb2.data[1].x)/**/;
/*355*/	r1.y = -r1.y + 1.000000;
/*356*/	r1.y = r1.y * 1000.000000;
/*357*/	r0.w = r0.w / r1.y;
/*358*/	r0.w = r0.w + r1.x;
/*359*/	r0.w = r0.w * 1.442695;
/*360*/	r0.w = exp2(r0.w);
/*361*/	r0.w = cb2.data[1].y / r0.w;
/*362*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*363*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*364*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*365*/	r1.x = r1.x + -cb2.data[1].z;
/*366*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*367*/	r1.x = saturate(r1.y * r1.x);
/*368*/	r1.y = r1.x * -2.000000 + 3.000000;
/*369*/	r1.x = r1.x * r1.x;
/*370*/	r1.x = r1.x * r1.y;
/*371*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*372*/	r1.y = sqrt(r1.y);
/*373*/	r1.z = max(cb2.data[2].z, 0.001000);
/*374*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*375*/	r1.y = r1.z * r1.y;
/*376*/	r1.y = min(r1.y, 1.000000);
/*377*/	r1.z = r1.y * -2.000000 + 3.000000;
/*378*/	r1.y = r1.y * r1.y;
/*379*/	r1.y = r1.y * r1.z;
/*380*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*381*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*382*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*383*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*384*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*385*/	r4.w = max(r4.y, 0.000000);
/*386*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*387*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*388*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*389*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*390*/	r0.w = saturate(r0.w * r1.y);
/*391*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*392*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*393*/	color0.w = r1.w;
/*394*/	return;
}
