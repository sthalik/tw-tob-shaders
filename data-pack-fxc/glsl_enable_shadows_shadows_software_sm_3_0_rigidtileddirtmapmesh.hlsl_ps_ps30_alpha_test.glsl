//
//
// Shader Model 4
// Fragment Shader
//
// id: 4809 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidtileddirtmapmesh.hlsl_PS_ps30_alpha_test.glsl
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
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
  vec4 r12;
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
/*50*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*51*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*52*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*53*/	r2.w = r4.w + -1.000000;
/*54*/	r2.w = r5.x * r2.w + 1.000000;
/*55*/	r2.w = saturate(r2.w * r5.x);
/*56*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*57*/	r4.xyz = (r2.wwww * r5.xyzx + r4.xyzx).xyz;
/*58*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*59*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*60*/	r2.w = inversesqrt(r2.w);
/*61*/	r6.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*62*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*63*/	r2.w = inversesqrt(r2.w);
/*64*/	r7.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*65*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*66*/	r2.w = inversesqrt(r2.w);
/*67*/	r8.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*68*/	r9.xyz = (r1.yyyy * r7.xyzx).xyz;
/*69*/	r9.xyz = (r1.xxxx * r6.xyzx + r9.xyzx).xyz;
/*70*/	r1.xyz = (r1.zzzz * r8.xyzx + r9.xyzx).xyz;
/*71*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*72*/	r2.w = inversesqrt(r2.w);
/*73*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*74*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*75*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*76*/	if(floatBitsToUint(r0.w) != 0u) {
/*77*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*78*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*79*/	  r0.w = r3.w * cb0.data[26].x;
/*80*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*81*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*82*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*83*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*84*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*85*/	}
/*86*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*87*/	if(floatBitsToUint(r0.w) != 0u) {
/*88*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*89*/	  if(floatBitsToUint(r0.w) != 0u) {
/*90*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*91*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*92*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*93*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*94*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*95*/	    r0.w = -r0.w + 1.000000;
/*96*/	    r0.w = max(r0.w, 0.000000);
/*97*/	    r10.z = sqrt(r0.w);
/*98*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*99*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*100*/	    r0.w = inversesqrt(r0.w);
/*101*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*102*/	    r12.xz = (cb3.data[0].xxyx).xz/**/;
/*103*/	    r12.y = -1.000000;
/*104*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*105*/	    r0.w = inversesqrt(r0.w);
/*106*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*107*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*108*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*109*/	    r2.w = r2.w * 1.250000;
/*110*/	    r2.w = min(r2.w, 1.000000);
/*111*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*112*/	    r3.z = r3.z * 4.000000;
/*113*/	    r2.w = r2.w * 0.200000 + r3.z;
/*114*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*115*/	    r0.w = r0.w + -r2.w;
/*116*/	    r0.w = saturate(r0.w * 200.000000);
/*117*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*118*/	    r0.w = r0.w * r0.w;
/*119*/	    r0.w = r0.w * r2.w;
/*120*/	    r3.x = r0.w * -r3.x + r3.x;
/*121*/	    r2.w = -r3.y + 0.200000;
/*122*/	    r3.y = r0.w * r2.w + r3.y;
/*123*/	    r0.xyz = (-r0.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*124*/	    r5.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*125*/	    r0.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*126*/	    r2.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*127*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*128*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*129*/	    r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*130*/	    r2.w = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*131*/	    r2.w = -r2.w + 1.000000;
/*132*/	    r2.w = max(r2.w, 0.000000);
/*133*/	    r0.z = sqrt(r2.w);
/*134*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*135*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*136*/	    r2.w = sqrt(r2.w);
/*137*/	    r0.xyz = (r4.xyzx * r2.wwww + r0.xyzx).xyz;
/*138*/	    r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*139*/	    r2.w = inversesqrt(r2.w);
/*140*/	    r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*141*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*142*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*143*/	    r0.xyz = (r0.zzzz * r8.xyzx + r4.xyzx).xyz;
/*144*/	    r2.w = -r1.y + 1.000000;
/*145*/	    r0.w = min(r0.w, r2.w);
/*146*/	    r0.xyz = (-r1.xyzx + r0.xyzx).xyz;
/*147*/	    r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*148*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*149*/	    r0.w = inversesqrt(r0.w);
/*150*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*151*/	  }
/*152*/	}
/*153*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*154*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*155*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*156*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*157*/	r2.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*158*/	r3.yzw = (-r0.yyzw + r2.wwww).yzw;
/*159*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*160*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*161*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*162*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*163*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*164*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*165*/	r2.w = inversesqrt(r2.w);
/*166*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*167*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*168*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*169*/	r3.y = inversesqrt(r2.w);
/*170*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*171*/	r5.x = -r3.x + 1.000000;
/*172*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*173*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*174*/	r5.z = r5.z + r5.z;
/*175*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*176*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*177*/	r5.z = r5.x * 1.539380;
/*178*/	r5.z = cos((r5.z));
/*179*/	r5.z = inversesqrt(r5.z);
/*180*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*181*/	r5.w = saturate(r0.x * 60.000000);
/*182*/	r5.w = -r0.x + r5.w;
/*183*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*184*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*185*/	r6.w = inversesqrt(r6.w);
/*186*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*187*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*188*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*189*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*190*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*191*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*192*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*193*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*194*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*195*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*196*/	r8.xyz = (r0.yzwy * r8.xyzx).xyz;
/*197*/	r6.w = -r0.x + 1.000000;
/*198*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*199*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*200*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*201*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*202*/	  r6.w = max(r6.w, 0.000000);
/*203*/	  r6.w = log2(r6.w);
/*204*/	  r6.w = r6.w * 10.000000;
/*205*/	  r6.w = exp2(r6.w);
/*206*/	  r6.w = r5.z * r6.w;
/*207*/	  r6.w = r6.w * r5.w + r0.x;
/*208*/	  r7.y = r5.x * 8.000000;
/*209*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*210*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*211*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*212*/	}
/*213*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*214*/	r1.y = max(r1.x, 0.000000);
/*215*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*216*/	if(floatBitsToUint(r1.x) != 0u) {
/*217*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*218*/	  r1.x = max(r1.x, -1.000000);
/*219*/	  r1.x = min(r1.x, 1.000000);
/*220*/	  r1.z = -abs(r1.x) + 1.000000;
/*221*/	  r1.z = sqrt(r1.z);
/*222*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*223*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*224*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*225*/	  r6.y = r1.z * r6.x;
/*226*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*227*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*228*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*229*/	  r1.x = r6.x * r1.z + r1.x;
/*230*/	  r1.z = r3.x * r3.x;
/*231*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*232*/	  r1.z = r1.z * r3.x + r7.x;
/*233*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*234*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*235*/	  r3.x = -r1.z * r1.z + 1.000000;
/*236*/	  r3.x = max(r3.x, 0.001000);
/*237*/	  r3.x = log2(r3.x);
/*238*/	  r5.y = r3.x * 4.950617;
/*239*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*240*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*241*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*242*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*243*/	  r1.z = floatBitsToInt(r1.z);
/*244*/	  r5.y = r3.x * r3.x + -r5.y;
/*245*/	  r5.y = sqrt(r5.y);
/*246*/	  r3.x = -r3.x + r5.y;
/*247*/	  r3.x = max(r3.x, 0.000000);
/*248*/	  r3.x = sqrt(r3.x);
/*249*/	  r1.z = r1.z * r3.x;
/*250*/	  r1.z = r1.z * 1.414214;
/*251*/	  r1.z = 0.008727 / r1.z;
/*252*/	  r1.z = max(r1.z, 0.000100);
/*253*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*254*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*255*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*256*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*257*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*258*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*259*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*260*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*261*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*262*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*263*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*264*/	  r1.x = floatBitsToInt(r1.x);
/*265*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*266*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*267*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*268*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*269*/	  r1.x = r1.x * r6.x + 1.000000;
/*270*/	  r1.x = r1.x * 0.500000;
/*271*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*272*/	  r1.z = r1.z * r6.y + 1.000000;
/*273*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*274*/	  r1.z = min(r1.y, 1.000000);
/*275*/	  r3.x = r5.x * 1.570796;
/*276*/	  r3.x = sin(r3.x);
/*277*/	  r1.z = r1.z + -1.000000;
/*278*/	  r1.z = r3.x * r1.z + 1.000000;
/*279*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*280*/	  r3.x = max(r3.x, 0.000000);
/*281*/	  r3.x = log2(r3.x);
/*282*/	  r3.x = r3.x * 10.000000;
/*283*/	  r3.x = exp2(r3.x);
/*284*/	  r3.x = r5.z * r3.x;
/*285*/	  r3.x = r3.x * r5.w + r0.x;
/*286*/	  r1.x = r1.z * abs(r1.x);
/*287*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*288*/	} else {
/*289*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*290*/	}
/*291*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*292*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*293*/	r3.xyz = (max(r0.xxxx, r3.xyzx)).xyz;
/*294*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*295*/	r0.xyz = (r0.yzwy * r1.yyyy).xyz;
/*296*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*297*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*298*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*299*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*300*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*301*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*302*/	r3.w = 1.000000;
/*303*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*304*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*305*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*306*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*307*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*308*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*309*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*310*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*311*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*312*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*313*/	if(r0.w != 0) discard;
/*314*/	r0.w = sqrt(r2.w);
/*315*/	r1.x = saturate(cb2.data[0].w)/**/;
/*316*/	r1.x = -r1.x + 1.000000;
/*317*/	r1.x = r1.x * 8.000000 + -4.000000;
/*318*/	r1.y = saturate(cb2.data[1].x)/**/;
/*319*/	r1.y = -r1.y + 1.000000;
/*320*/	r1.y = r1.y * 1000.000000;
/*321*/	r0.w = r0.w / r1.y;
/*322*/	r0.w = r0.w + r1.x;
/*323*/	r0.w = r0.w * 1.442695;
/*324*/	r0.w = exp2(r0.w);
/*325*/	r0.w = cb2.data[1].y / r0.w;
/*326*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*327*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*328*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*329*/	r1.x = r1.x + -cb2.data[1].z;
/*330*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*331*/	r1.x = saturate(r1.y * r1.x);
/*332*/	r1.y = r1.x * -2.000000 + 3.000000;
/*333*/	r1.x = r1.x * r1.x;
/*334*/	r1.x = r1.x * r1.y;
/*335*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*336*/	r1.y = sqrt(r1.y);
/*337*/	r1.z = max(cb2.data[2].z, 0.001000);
/*338*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*339*/	r1.y = r1.z * r1.y;
/*340*/	r1.y = min(r1.y, 1.000000);
/*341*/	r1.z = r1.y * -2.000000 + 3.000000;
/*342*/	r1.y = r1.y * r1.y;
/*343*/	r1.y = r1.y * r1.z;
/*344*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*345*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*346*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*347*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*348*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*349*/	r4.w = max(r4.y, 0.000000);
/*350*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*351*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*352*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*353*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*354*/	r0.w = saturate(r0.w * r1.y);
/*355*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*356*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*357*/	color0.w = r1.w;
/*358*/	return;
}
