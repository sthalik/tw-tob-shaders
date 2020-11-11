//
//
// Shader Model 4
// Fragment Shader
//
// id: 5036 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps30_alpha_blend_40.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*19*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*20*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*21*/	r0.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*22*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*23*/	r0.x = saturate(vsOut_N0.w);
/*24*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*25*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*26*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*27*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*28*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*29*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*30*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*31*/	r0.xyz = (r0.xxxx * r7.xyzx + cb5.data[2].xyzx).xyz;
/*32*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*33*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*34*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*35*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*36*/	r0.xyz = (r0.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*37*/	r0.xyz = (r4.zzzz * r0.xyzx + r1.xyzx).xyz;
/*38*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r1.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*40*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	r2.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*42*/	r2.w = -r2.w + 1.000000;
/*43*/	r2.w = max(r2.w, 0.000000);
/*44*/	r1.z = sqrt(r2.w);
/*45*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*46*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*47*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*48*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*49*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*50*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*51*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*52*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*53*/	r2.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r2.w));
/*54*/	r4.z = vsOut_T6.x;
/*55*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*56*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*57*/	if(floatBitsToUint(r2.w) != 0u) {
/*58*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*59*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	  r2.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*61*/	  r2.w = -r2.w + 1.000000;
/*62*/	  r2.w = max(r2.w, 0.000000);
/*63*/	  r4.z = sqrt(r2.w);
/*64*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*65*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*66*/	  r2.w = r3.x * r7.w;
/*67*/	  r3.x = r2.w * -0.500000 + r3.x;
/*68*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*69*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*70*/	  r2.w = -r5.w * r6.w + 1.000000;
/*71*/	  r0.xyz = (r2.wwww * r0.xyzx + r7.xyzx).xyz;
/*72*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*73*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*74*/	}
/*75*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*76*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*77*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*78*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*79*/	r2.w = r4.w * r5.w;
/*80*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*81*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*82*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*83*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*84*/	r3.z = inversesqrt(r3.z);
/*85*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*86*/	r4.xyz = (r2.wwww * r2.xyzx).xyz;
/*87*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*88*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*89*/	r4.x = 0;
/*90*/	r4.y = cb0.data[26].x * 0.050000;
/*91*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*92*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*93*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*94*/	r2.w = saturate(r4.x * 5.000000);
/*95*/	r4.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*96*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*97*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*98*/	r3.z = log2(r5.z);
/*99*/	r3.z = r3.z * 1.800000;
/*100*/	r3.z = exp2(r3.z);
/*101*/	r3.z = r3.z * 10.000000;
/*102*/	r3.z = min(r3.z, 1.000000);
/*103*/	r2.w = r2.w + r3.z;
/*104*/	r2.w = r2.w * 0.500000;
/*105*/	r3.z = -r5.w + 1.000000;
/*106*/	r3.z = log2(r3.z);
/*107*/	r3.z = r3.z * vsOut_T7.x;
/*108*/	r3.z = exp2(r3.z);
/*109*/	r3.z = min(r3.z, 1.000000);
/*110*/	r3.z = r3.z * vsOut_T7.x;
/*111*/	r3.w = r5.z * 0.250000;
/*112*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*113*/	r4.xyz = (r2.wwww * r4.xyzx + r3.wwww).xyz;
/*114*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*115*/	r0.xyz = (r3.zzzz * r4.xyzx + r0.xyzx).xyz;
/*116*/	r2.w = vsOut_T7.x + -0.025000;
/*117*/	r2.w = max(r2.w, 0.000000);
/*118*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*119*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*120*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*121*/	r2.w = inversesqrt(r2.w);
/*122*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*123*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*124*/	r2.w = inversesqrt(r2.w);
/*125*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*126*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*127*/	r2.w = inversesqrt(r2.w);
/*128*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*129*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*130*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*131*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*132*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*133*/	r2.w = inversesqrt(r2.w);
/*134*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*135*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*136*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*137*/	if(floatBitsToUint(r0.w) != 0u) {
/*138*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*139*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*140*/	  r0.w = r3.w * cb0.data[26].x;
/*141*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*142*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*143*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*144*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*145*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*146*/	}
/*147*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*148*/	if(floatBitsToUint(r0.w) != 0u) {
/*149*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*150*/	  if(floatBitsToUint(r0.w) != 0u) {
/*151*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*152*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*153*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*154*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*155*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*156*/	    r0.w = -r0.w + 1.000000;
/*157*/	    r0.w = max(r0.w, 0.000000);
/*158*/	    r8.z = sqrt(r0.w);
/*159*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*160*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*161*/	    r0.w = inversesqrt(r0.w);
/*162*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*163*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*164*/	    r10.y = -1.000000;
/*165*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*166*/	    r0.w = inversesqrt(r0.w);
/*167*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*168*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*169*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*170*/	    r2.w = r2.w * 1.250000;
/*171*/	    r2.w = min(r2.w, 1.000000);
/*172*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*173*/	    r3.z = r3.z * 4.000000;
/*174*/	    r2.w = r2.w * 0.200000 + r3.z;
/*175*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*176*/	    r0.w = r0.w + -r2.w;
/*177*/	    r0.w = saturate(r0.w * 200.000000);
/*178*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*179*/	    r0.w = r0.w * r0.w;
/*180*/	    r0.w = r0.w * r2.w;
/*181*/	    r3.y = r0.w * -r3.y + r3.y;
/*182*/	    r2.w = -r3.x + 0.200000;
/*183*/	    r3.x = r0.w * r2.w + r3.x;
/*184*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*185*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*186*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*187*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*188*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*189*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*190*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*191*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*192*/	    r2.w = -r2.w + 1.000000;
/*193*/	    r2.w = max(r2.w, 0.000000);
/*194*/	    r7.z = sqrt(r2.w);
/*195*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*196*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*197*/	    r2.w = sqrt(r2.w);
/*198*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*199*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*200*/	    r2.w = inversesqrt(r2.w);
/*201*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*202*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*203*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*204*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*205*/	    r2.w = -r1.y + 1.000000;
/*206*/	    r0.w = min(r0.w, r2.w);
/*207*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*208*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*209*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*210*/	    r0.w = inversesqrt(r0.w);
/*211*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*212*/	  }
/*213*/	}
/*214*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*215*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*216*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*217*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*218*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*219*/	r3.xzw = (-r0.xxyz + r2.wwww).xzw;
/*220*/	r0.xyz = (vsOut_T7.zzzz * r3.xzwx + r0.xyzx).xyz;
/*221*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*222*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*223*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*224*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*225*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*226*/	r2.w = inversesqrt(r2.w);
/*227*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*228*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*229*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*230*/	r3.x = inversesqrt(r2.w);
/*231*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*232*/	r5.x = -r3.y + 1.000000;
/*233*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*234*/	r5.z = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*235*/	r5.z = r5.z + r5.z;
/*236*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*237*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*238*/	r5.z = r5.x * 1.539380;
/*239*/	r5.z = cos((r5.z));
/*240*/	r5.z = inversesqrt(r5.z);
/*241*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*242*/	r5.w = saturate(r0.w * 60.000000);
/*243*/	r5.w = -r0.w + r5.w;
/*244*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*245*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*246*/	r6.w = inversesqrt(r6.w);
/*247*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*248*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*249*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*250*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*251*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*252*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*253*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*254*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*255*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*256*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*257*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*258*/	r6.w = -r0.w + 1.000000;
/*259*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*260*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*261*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*262*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*263*/	  r6.w = max(r6.w, 0.000000);
/*264*/	  r6.w = log2(r6.w);
/*265*/	  r6.w = r6.w * 10.000000;
/*266*/	  r6.w = exp2(r6.w);
/*267*/	  r6.w = r5.z * r6.w;
/*268*/	  r6.w = r6.w * r5.w + r0.w;
/*269*/	  r7.y = r5.x * 8.000000;
/*270*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*271*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*272*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*273*/	}
/*274*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*275*/	r1.y = max(r1.x, 0.000000);
/*276*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*277*/	if(floatBitsToUint(r1.x) != 0u) {
/*278*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*279*/	  r1.x = max(r1.x, -1.000000);
/*280*/	  r1.x = min(r1.x, 1.000000);
/*281*/	  r1.z = -abs(r1.x) + 1.000000;
/*282*/	  r1.z = sqrt(r1.z);
/*283*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*284*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*285*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*286*/	  r6.y = r1.z * r6.x;
/*287*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*288*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*289*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*290*/	  r1.x = r6.x * r1.z + r1.x;
/*291*/	  r1.z = r3.y * r3.y;
/*292*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*293*/	  r1.z = r1.z * r3.y + r7.x;
/*294*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*295*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*296*/	  r3.y = -r1.z * r1.z + 1.000000;
/*297*/	  r3.y = max(r3.y, 0.001000);
/*298*/	  r3.y = log2(r3.y);
/*299*/	  r5.y = r3.y * 4.950617;
/*300*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*301*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*302*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*303*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*304*/	  r1.z = floatBitsToInt(r1.z);
/*305*/	  r5.y = r3.y * r3.y + -r5.y;
/*306*/	  r5.y = sqrt(r5.y);
/*307*/	  r3.y = -r3.y + r5.y;
/*308*/	  r3.y = max(r3.y, 0.000000);
/*309*/	  r3.y = sqrt(r3.y);
/*310*/	  r1.z = r1.z * r3.y;
/*311*/	  r1.z = r1.z * 1.414214;
/*312*/	  r1.z = 0.008727 / r1.z;
/*313*/	  r1.z = max(r1.z, 0.000100);
/*314*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*315*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*316*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*317*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*318*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*319*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*320*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*321*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*322*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*323*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*324*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*325*/	  r1.x = floatBitsToInt(r1.x);
/*326*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*327*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*328*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*329*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*330*/	  r1.x = r1.x * r6.x + 1.000000;
/*331*/	  r1.x = r1.x * 0.500000;
/*332*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*333*/	  r1.z = r1.z * r6.y + 1.000000;
/*334*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*335*/	  r1.z = min(r1.y, 1.000000);
/*336*/	  r3.y = r5.x * 1.570796;
/*337*/	  r3.y = sin(r3.y);
/*338*/	  r1.z = r1.z + -1.000000;
/*339*/	  r1.z = r3.y * r1.z + 1.000000;
/*340*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*341*/	  r3.x = max(r3.x, 0.000000);
/*342*/	  r3.x = log2(r3.x);
/*343*/	  r3.x = r3.x * 10.000000;
/*344*/	  r3.x = exp2(r3.x);
/*345*/	  r3.x = r5.z * r3.x;
/*346*/	  r3.x = r3.x * r5.w + r0.w;
/*347*/	  r1.x = r1.z * abs(r1.x);
/*348*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*349*/	} else {
/*350*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*351*/	}
/*352*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*353*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*354*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*355*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*356*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*357*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*358*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*359*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*360*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*361*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*362*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*363*/	r3.w = 1.000000;
/*364*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*365*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*366*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*367*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*368*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*369*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*370*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*371*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*372*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*373*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*374*/	if(r0.w != 0) discard;
/*375*/	r0.w = sqrt(r2.w);
/*376*/	r1.x = saturate(cb2.data[0].w)/**/;
/*377*/	r1.x = -r1.x + 1.000000;
/*378*/	r1.x = r1.x * 8.000000 + -4.000000;
/*379*/	r1.y = saturate(cb2.data[1].x)/**/;
/*380*/	r1.y = -r1.y + 1.000000;
/*381*/	r1.y = r1.y * 1000.000000;
/*382*/	r0.w = r0.w / r1.y;
/*383*/	r0.w = r0.w + r1.x;
/*384*/	r0.w = r0.w * 1.442695;
/*385*/	r0.w = exp2(r0.w);
/*386*/	r0.w = cb2.data[1].y / r0.w;
/*387*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*388*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*389*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*390*/	r1.x = r1.x + -cb2.data[1].z;
/*391*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*392*/	r1.x = saturate(r1.y * r1.x);
/*393*/	r1.y = r1.x * -2.000000 + 3.000000;
/*394*/	r1.x = r1.x * r1.x;
/*395*/	r1.x = r1.x * r1.y;
/*396*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*397*/	r1.y = sqrt(r1.y);
/*398*/	r1.z = max(cb2.data[2].z, 0.001000);
/*399*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*400*/	r1.y = r1.z * r1.y;
/*401*/	r1.y = min(r1.y, 1.000000);
/*402*/	r1.z = r1.y * -2.000000 + 3.000000;
/*403*/	r1.y = r1.y * r1.y;
/*404*/	r1.y = r1.y * r1.z;
/*405*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*406*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*407*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*408*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*409*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*410*/	r4.w = max(r4.y, 0.000000);
/*411*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*412*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*413*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*414*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*415*/	r0.w = saturate(r0.w * r1.y);
/*416*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*417*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*418*/	color0.w = r1.w;
/*419*/	return;
}
