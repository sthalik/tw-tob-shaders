//
//
// Shader Model 4
// Fragment Shader
//
// id: 1112 - fxc/glsl_SM_3_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_alpha_test.glsl
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
uniform sampler2D s_decal_blood_map;

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
/*69*/	  r2.w = r3.y * r7.w;
/*70*/	  r3.y = r2.w * -0.500000 + r3.y;
/*71*/	  r4.xyz = (r4.xyzx * r6.wwww + -r2.xyzx).xyz;
/*72*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*73*/	  r2.w = -r4.w * r6.w + 1.000000;
/*74*/	  r0.xyz = (r2.wwww * r0.xyzx + r7.xyzx).xyz;
/*75*/	  r4.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*76*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*77*/	}
/*78*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*79*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*80*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*81*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*82*/	r2.w = saturate(-r2.w + r4.w);
/*83*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*84*/	if(floatBitsToUint(r2.w) != 0u) {
/*85*/	  r2.w = -r4.w + 1.000000;
/*86*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*87*/	  r2.w = -r2.w + 1.000000;
/*88*/	  r2.w = -r2.w * r2.w + 1.000000;
/*89*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*90*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*91*/	  r2.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*92*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*93*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*94*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*95*/	  r0.xyz = (r2.wwww * r5.xyzx + r4.xyzx).xyz;
/*96*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*97*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*98*/	}
/*99*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*100*/	r2.w = inversesqrt(r2.w);
/*101*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*102*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*103*/	r2.w = inversesqrt(r2.w);
/*104*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*105*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*106*/	r2.w = inversesqrt(r2.w);
/*107*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*108*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*109*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*110*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*111*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*112*/	r2.w = inversesqrt(r2.w);
/*113*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*114*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*115*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*116*/	if(floatBitsToUint(r0.w) != 0u) {
/*117*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*118*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*119*/	  r0.w = r3.w * cb0.data[26].x;
/*120*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*121*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*122*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*123*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*124*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*125*/	}
/*126*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*127*/	if(floatBitsToUint(r0.w) != 0u) {
/*128*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*129*/	  if(floatBitsToUint(r0.w) != 0u) {
/*130*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*131*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*132*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*133*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*134*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*135*/	    r0.w = -r0.w + 1.000000;
/*136*/	    r0.w = max(r0.w, 0.000000);
/*137*/	    r8.z = sqrt(r0.w);
/*138*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*139*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*140*/	    r0.w = inversesqrt(r0.w);
/*141*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*142*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*143*/	    r10.y = -1.000000;
/*144*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*145*/	    r0.w = inversesqrt(r0.w);
/*146*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*147*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*148*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*149*/	    r2.w = r2.w * 1.250000;
/*150*/	    r2.w = min(r2.w, 1.000000);
/*151*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*152*/	    r3.z = r3.z * 4.000000;
/*153*/	    r2.w = r2.w * 0.200000 + r3.z;
/*154*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*155*/	    r0.w = r0.w + -r2.w;
/*156*/	    r0.w = saturate(r0.w * 200.000000);
/*157*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*158*/	    r0.w = r0.w * r0.w;
/*159*/	    r0.w = r0.w * r2.w;
/*160*/	    r3.x = r0.w * -r3.x + r3.x;
/*161*/	    r2.w = -r3.y + 0.200000;
/*162*/	    r3.y = r0.w * r2.w + r3.y;
/*163*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*164*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*165*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*166*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*167*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*168*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*169*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*170*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*171*/	    r2.w = -r2.w + 1.000000;
/*172*/	    r2.w = max(r2.w, 0.000000);
/*173*/	    r7.z = sqrt(r2.w);
/*174*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*175*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*176*/	    r2.w = sqrt(r2.w);
/*177*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*178*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*179*/	    r2.w = inversesqrt(r2.w);
/*180*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*181*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*182*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*183*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*184*/	    r2.w = -r1.y + 1.000000;
/*185*/	    r0.w = min(r0.w, r2.w);
/*186*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*187*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*188*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*189*/	    r0.w = inversesqrt(r0.w);
/*190*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*191*/	  }
/*192*/	}
/*193*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*194*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*195*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*196*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*197*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*198*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*199*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*200*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*201*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*202*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*203*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*204*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*205*/	r2.w = inversesqrt(r2.w);
/*206*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*207*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*208*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*209*/	r3.y = inversesqrt(r2.w);
/*210*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*211*/	r5.x = -r3.x + 1.000000;
/*212*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*213*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*214*/	r5.z = r5.z + r5.z;
/*215*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*216*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*217*/	r5.z = r5.x * 1.539380;
/*218*/	r5.z = cos((r5.z));
/*219*/	r5.z = inversesqrt(r5.z);
/*220*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*221*/	r5.w = saturate(r0.w * 60.000000);
/*222*/	r5.w = -r0.w + r5.w;
/*223*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*224*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*225*/	r6.w = inversesqrt(r6.w);
/*226*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*227*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*228*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*229*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*230*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*231*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*232*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*233*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*234*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*235*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*236*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*237*/	r6.w = -r0.w + 1.000000;
/*238*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*239*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*240*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*241*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*242*/	  r6.w = max(r6.w, 0.000000);
/*243*/	  r6.w = log2(r6.w);
/*244*/	  r6.w = r6.w * 10.000000;
/*245*/	  r6.w = exp2(r6.w);
/*246*/	  r6.w = r5.z * r6.w;
/*247*/	  r6.w = r6.w * r5.w + r0.w;
/*248*/	  r7.y = r5.x * 8.000000;
/*249*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*250*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*251*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*252*/	}
/*253*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*254*/	r1.y = max(r1.x, 0.000000);
/*255*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*256*/	if(floatBitsToUint(r1.x) != 0u) {
/*257*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*258*/	  r1.x = max(r1.x, -1.000000);
/*259*/	  r1.x = min(r1.x, 1.000000);
/*260*/	  r1.z = -abs(r1.x) + 1.000000;
/*261*/	  r1.z = sqrt(r1.z);
/*262*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*263*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*264*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*265*/	  r6.y = r1.z * r6.x;
/*266*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*267*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*268*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*269*/	  r1.x = r6.x * r1.z + r1.x;
/*270*/	  r1.z = r3.x * r3.x;
/*271*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*272*/	  r1.z = r1.z * r3.x + r7.x;
/*273*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*274*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*275*/	  r3.x = -r1.z * r1.z + 1.000000;
/*276*/	  r3.x = max(r3.x, 0.001000);
/*277*/	  r3.x = log2(r3.x);
/*278*/	  r5.y = r3.x * 4.950617;
/*279*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*280*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*281*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*282*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*283*/	  r1.z = floatBitsToInt(r1.z);
/*284*/	  r5.y = r3.x * r3.x + -r5.y;
/*285*/	  r5.y = sqrt(r5.y);
/*286*/	  r3.x = -r3.x + r5.y;
/*287*/	  r3.x = max(r3.x, 0.000000);
/*288*/	  r3.x = sqrt(r3.x);
/*289*/	  r1.z = r1.z * r3.x;
/*290*/	  r1.z = r1.z * 1.414214;
/*291*/	  r1.z = 0.008727 / r1.z;
/*292*/	  r1.z = max(r1.z, 0.000100);
/*293*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*294*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*295*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*296*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*297*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*298*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*299*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*300*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*301*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*302*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*303*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*304*/	  r1.x = floatBitsToInt(r1.x);
/*305*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*306*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*307*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*308*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*309*/	  r1.x = r1.x * r6.x + 1.000000;
/*310*/	  r1.x = r1.x * 0.500000;
/*311*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*312*/	  r1.z = r1.z * r6.y + 1.000000;
/*313*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*314*/	  r1.z = min(r1.y, 1.000000);
/*315*/	  r3.x = r5.x * 1.570796;
/*316*/	  r3.x = sin(r3.x);
/*317*/	  r1.z = r1.z + -1.000000;
/*318*/	  r1.z = r3.x * r1.z + 1.000000;
/*319*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*320*/	  r3.x = max(r3.x, 0.000000);
/*321*/	  r3.x = log2(r3.x);
/*322*/	  r3.x = r3.x * 10.000000;
/*323*/	  r3.x = exp2(r3.x);
/*324*/	  r3.x = r5.z * r3.x;
/*325*/	  r3.x = r3.x * r5.w + r0.w;
/*326*/	  r1.x = r1.z * abs(r1.x);
/*327*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*328*/	} else {
/*329*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*330*/	}
/*331*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*332*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*333*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*334*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*335*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*336*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*337*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*338*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*339*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*340*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*341*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*342*/	r3.w = 1.000000;
/*343*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*344*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*345*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*346*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*347*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*348*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*349*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*350*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*351*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*352*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*353*/	if(r0.w != 0) discard;
/*354*/	r0.w = sqrt(r2.w);
/*355*/	r1.x = saturate(cb2.data[0].w)/**/;
/*356*/	r1.x = -r1.x + 1.000000;
/*357*/	r1.x = r1.x * 8.000000 + -4.000000;
/*358*/	r1.y = saturate(cb2.data[1].x)/**/;
/*359*/	r1.y = -r1.y + 1.000000;
/*360*/	r1.y = r1.y * 1000.000000;
/*361*/	r0.w = r0.w / r1.y;
/*362*/	r0.w = r0.w + r1.x;
/*363*/	r0.w = r0.w * 1.442695;
/*364*/	r0.w = exp2(r0.w);
/*365*/	r0.w = cb2.data[1].y / r0.w;
/*366*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*367*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*368*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*369*/	r1.x = r1.x + -cb2.data[1].z;
/*370*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*371*/	r1.x = saturate(r1.y * r1.x);
/*372*/	r1.y = r1.x * -2.000000 + 3.000000;
/*373*/	r1.x = r1.x * r1.x;
/*374*/	r1.x = r1.x * r1.y;
/*375*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*376*/	r1.y = sqrt(r1.y);
/*377*/	r1.z = max(cb2.data[2].z, 0.001000);
/*378*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*379*/	r1.y = r1.z * r1.y;
/*380*/	r1.y = min(r1.y, 1.000000);
/*381*/	r1.z = r1.y * -2.000000 + 3.000000;
/*382*/	r1.y = r1.y * r1.y;
/*383*/	r1.y = r1.y * r1.z;
/*384*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*385*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*386*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*387*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*388*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*389*/	r4.w = max(r4.y, 0.000000);
/*390*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*391*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*392*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*393*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*394*/	r0.w = saturate(r0.w * r1.y);
/*395*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*396*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*397*/	color0.w = r1.w;
/*398*/	return;
}
