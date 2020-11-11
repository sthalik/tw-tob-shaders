//
//
// Shader Model 4
// Fragment Shader
//
// id: 4807 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps30_alpha_blend_40.glsl
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
/*19*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
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
/*46*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*47*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*48*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*49*/	r2.w = r4.w + -1.000000;
/*50*/	r2.w = r5.x * r2.w + 1.000000;
/*51*/	r2.w = saturate(r2.w * r5.x);
/*52*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*53*/	r4.xyz = (r2.wwww * r5.xyzx + r4.xyzx).xyz;
/*54*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*55*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r2.w = inversesqrt(r2.w);
/*57*/	r6.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*59*/	r2.w = inversesqrt(r2.w);
/*60*/	r7.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*61*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r8.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*64*/	r9.xyz = (r1.yyyy * r7.xyzx).xyz;
/*65*/	r9.xyz = (r1.xxxx * r6.xyzx + r9.xyzx).xyz;
/*66*/	r1.xyz = (r1.zzzz * r8.xyzx + r9.xyzx).xyz;
/*67*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*70*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*71*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*72*/	if(floatBitsToUint(r0.w) != 0u) {
/*73*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*74*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*75*/	  r0.w = r3.w * cb0.data[26].x;
/*76*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*77*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*78*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*79*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*80*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*81*/	}
/*82*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*83*/	if(floatBitsToUint(r0.w) != 0u) {
/*84*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*85*/	  if(floatBitsToUint(r0.w) != 0u) {
/*86*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*87*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*88*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*89*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*90*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*91*/	    r0.w = -r0.w + 1.000000;
/*92*/	    r0.w = max(r0.w, 0.000000);
/*93*/	    r10.z = sqrt(r0.w);
/*94*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*95*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*96*/	    r0.w = inversesqrt(r0.w);
/*97*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*98*/	    r12.xz = (cb3.data[0].xxyx).xz/**/;
/*99*/	    r12.y = -1.000000;
/*100*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*101*/	    r0.w = inversesqrt(r0.w);
/*102*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*103*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*104*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*105*/	    r2.w = r2.w * 1.250000;
/*106*/	    r2.w = min(r2.w, 1.000000);
/*107*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*108*/	    r3.z = r3.z * 4.000000;
/*109*/	    r2.w = r2.w * 0.200000 + r3.z;
/*110*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*111*/	    r0.w = r0.w + -r2.w;
/*112*/	    r0.w = saturate(r0.w * 200.000000);
/*113*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*114*/	    r0.w = r0.w * r0.w;
/*115*/	    r0.w = r0.w * r2.w;
/*116*/	    r3.x = r0.w * -r3.x + r3.x;
/*117*/	    r2.w = -r3.y + 0.200000;
/*118*/	    r3.y = r0.w * r2.w + r3.y;
/*119*/	    r0.xyz = (-r0.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*120*/	    r5.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*121*/	    r0.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*122*/	    r2.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*123*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*124*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*125*/	    r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*126*/	    r2.w = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*127*/	    r2.w = -r2.w + 1.000000;
/*128*/	    r2.w = max(r2.w, 0.000000);
/*129*/	    r0.z = sqrt(r2.w);
/*130*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*131*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*132*/	    r2.w = sqrt(r2.w);
/*133*/	    r0.xyz = (r4.xyzx * r2.wwww + r0.xyzx).xyz;
/*134*/	    r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*135*/	    r2.w = inversesqrt(r2.w);
/*136*/	    r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*137*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*138*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*139*/	    r0.xyz = (r0.zzzz * r8.xyzx + r4.xyzx).xyz;
/*140*/	    r2.w = -r1.y + 1.000000;
/*141*/	    r0.w = min(r0.w, r2.w);
/*142*/	    r0.xyz = (-r1.xyzx + r0.xyzx).xyz;
/*143*/	    r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*144*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*145*/	    r0.w = inversesqrt(r0.w);
/*146*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*147*/	  }
/*148*/	}
/*149*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*150*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*151*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*152*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*153*/	r2.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*154*/	r3.yzw = (-r0.yyzw + r2.wwww).yzw;
/*155*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*156*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*157*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*158*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*159*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*160*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*161*/	r2.w = inversesqrt(r2.w);
/*162*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*163*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*164*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*165*/	r3.y = inversesqrt(r2.w);
/*166*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*167*/	r5.x = -r3.x + 1.000000;
/*168*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*169*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*170*/	r5.z = r5.z + r5.z;
/*171*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*172*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*173*/	r5.z = r5.x * 1.539380;
/*174*/	r5.z = cos((r5.z));
/*175*/	r5.z = inversesqrt(r5.z);
/*176*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*177*/	r5.w = saturate(r0.x * 60.000000);
/*178*/	r5.w = -r0.x + r5.w;
/*179*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*180*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*181*/	r6.w = inversesqrt(r6.w);
/*182*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*183*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*184*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*185*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*186*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*187*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*188*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*189*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*190*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*191*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*192*/	r8.xyz = (r0.yzwy * r8.xyzx).xyz;
/*193*/	r6.w = -r0.x + 1.000000;
/*194*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*195*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*196*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*197*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*198*/	  r6.w = max(r6.w, 0.000000);
/*199*/	  r6.w = log2(r6.w);
/*200*/	  r6.w = r6.w * 10.000000;
/*201*/	  r6.w = exp2(r6.w);
/*202*/	  r6.w = r5.z * r6.w;
/*203*/	  r6.w = r6.w * r5.w + r0.x;
/*204*/	  r7.y = r5.x * 8.000000;
/*205*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*206*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*207*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*208*/	}
/*209*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*210*/	r1.y = max(r1.x, 0.000000);
/*211*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*212*/	if(floatBitsToUint(r1.x) != 0u) {
/*213*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*214*/	  r1.x = max(r1.x, -1.000000);
/*215*/	  r1.x = min(r1.x, 1.000000);
/*216*/	  r1.z = -abs(r1.x) + 1.000000;
/*217*/	  r1.z = sqrt(r1.z);
/*218*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*219*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*220*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*221*/	  r6.y = r1.z * r6.x;
/*222*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*223*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*224*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*225*/	  r1.x = r6.x * r1.z + r1.x;
/*226*/	  r1.z = r3.x * r3.x;
/*227*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*228*/	  r1.z = r1.z * r3.x + r7.x;
/*229*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*230*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*231*/	  r3.x = -r1.z * r1.z + 1.000000;
/*232*/	  r3.x = max(r3.x, 0.001000);
/*233*/	  r3.x = log2(r3.x);
/*234*/	  r5.y = r3.x * 4.950617;
/*235*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*236*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*237*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*238*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*239*/	  r1.z = floatBitsToInt(r1.z);
/*240*/	  r5.y = r3.x * r3.x + -r5.y;
/*241*/	  r5.y = sqrt(r5.y);
/*242*/	  r3.x = -r3.x + r5.y;
/*243*/	  r3.x = max(r3.x, 0.000000);
/*244*/	  r3.x = sqrt(r3.x);
/*245*/	  r1.z = r1.z * r3.x;
/*246*/	  r1.z = r1.z * 1.414214;
/*247*/	  r1.z = 0.008727 / r1.z;
/*248*/	  r1.z = max(r1.z, 0.000100);
/*249*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*250*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*251*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*252*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*253*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*254*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*255*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*256*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*257*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*258*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*259*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*260*/	  r1.x = floatBitsToInt(r1.x);
/*261*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*262*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*263*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*264*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*265*/	  r1.x = r1.x * r6.x + 1.000000;
/*266*/	  r1.x = r1.x * 0.500000;
/*267*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*268*/	  r1.z = r1.z * r6.y + 1.000000;
/*269*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*270*/	  r1.z = min(r1.y, 1.000000);
/*271*/	  r3.x = r5.x * 1.570796;
/*272*/	  r3.x = sin(r3.x);
/*273*/	  r1.z = r1.z + -1.000000;
/*274*/	  r1.z = r3.x * r1.z + 1.000000;
/*275*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*276*/	  r3.x = max(r3.x, 0.000000);
/*277*/	  r3.x = log2(r3.x);
/*278*/	  r3.x = r3.x * 10.000000;
/*279*/	  r3.x = exp2(r3.x);
/*280*/	  r3.x = r5.z * r3.x;
/*281*/	  r3.x = r3.x * r5.w + r0.x;
/*282*/	  r1.x = r1.z * abs(r1.x);
/*283*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*284*/	} else {
/*285*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*286*/	}
/*287*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*288*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*289*/	r3.xyz = (max(r0.xxxx, r3.xyzx)).xyz;
/*290*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*291*/	r0.xyz = (r0.yzwy * r1.yyyy).xyz;
/*292*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*293*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*294*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*295*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*296*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*297*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*298*/	r3.w = 1.000000;
/*299*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*300*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*301*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*302*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*303*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*304*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*305*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*306*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*307*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*308*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*309*/	if(r0.w != 0) discard;
/*310*/	r0.w = sqrt(r2.w);
/*311*/	r1.x = saturate(cb2.data[0].w)/**/;
/*312*/	r1.x = -r1.x + 1.000000;
/*313*/	r1.x = r1.x * 8.000000 + -4.000000;
/*314*/	r1.y = saturate(cb2.data[1].x)/**/;
/*315*/	r1.y = -r1.y + 1.000000;
/*316*/	r1.y = r1.y * 1000.000000;
/*317*/	r0.w = r0.w / r1.y;
/*318*/	r0.w = r0.w + r1.x;
/*319*/	r0.w = r0.w * 1.442695;
/*320*/	r0.w = exp2(r0.w);
/*321*/	r0.w = cb2.data[1].y / r0.w;
/*322*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*323*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*324*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*325*/	r1.x = r1.x + -cb2.data[1].z;
/*326*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*327*/	r1.x = saturate(r1.y * r1.x);
/*328*/	r1.y = r1.x * -2.000000 + 3.000000;
/*329*/	r1.x = r1.x * r1.x;
/*330*/	r1.x = r1.x * r1.y;
/*331*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*332*/	r1.y = sqrt(r1.y);
/*333*/	r1.z = max(cb2.data[2].z, 0.001000);
/*334*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*335*/	r1.y = r1.z * r1.y;
/*336*/	r1.y = min(r1.y, 1.000000);
/*337*/	r1.z = r1.y * -2.000000 + 3.000000;
/*338*/	r1.y = r1.y * r1.y;
/*339*/	r1.y = r1.y * r1.z;
/*340*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*341*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*342*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*343*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*344*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*345*/	r4.w = max(r4.y, 0.000000);
/*346*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*347*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*348*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*349*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*350*/	r0.w = saturate(r0.w * r1.y);
/*351*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*352*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*353*/	color0.w = r1.w;
/*354*/	return;
}
