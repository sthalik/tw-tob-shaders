//
//
// Shader Model 4
// Fragment Shader
//
// id: 643 - fxc/glsl_SM_3_0_rigidstandard.hlsl_PS_ps30_alpha_test.glsl
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
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

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
/*50*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*51*/	r2.w = inversesqrt(r2.w);
/*52*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*53*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*54*/	r2.w = inversesqrt(r2.w);
/*55*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*56*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*57*/	r2.w = inversesqrt(r2.w);
/*58*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*59*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*60*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*61*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*62*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*63*/	r2.w = inversesqrt(r2.w);
/*64*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*65*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*66*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*67*/	if(floatBitsToUint(r0.w) != 0u) {
/*68*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*69*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*70*/	  r0.w = r3.w * cb0.data[26].x;
/*71*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*72*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*73*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*74*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*75*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*76*/	}
/*77*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*78*/	if(floatBitsToUint(r0.w) != 0u) {
/*79*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*80*/	  if(floatBitsToUint(r0.w) != 0u) {
/*81*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*82*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*83*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*84*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*85*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*86*/	    r0.w = -r0.w + 1.000000;
/*87*/	    r0.w = max(r0.w, 0.000000);
/*88*/	    r8.z = sqrt(r0.w);
/*89*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*90*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*91*/	    r0.w = inversesqrt(r0.w);
/*92*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*93*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*94*/	    r10.y = -1.000000;
/*95*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*96*/	    r0.w = inversesqrt(r0.w);
/*97*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*98*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*99*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*100*/	    r2.w = r2.w * 1.250000;
/*101*/	    r2.w = min(r2.w, 1.000000);
/*102*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*103*/	    r3.z = r3.z * 4.000000;
/*104*/	    r2.w = r2.w * 0.200000 + r3.z;
/*105*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*106*/	    r0.w = r0.w + -r2.w;
/*107*/	    r0.w = saturate(r0.w * 200.000000);
/*108*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*109*/	    r0.w = r0.w * r0.w;
/*110*/	    r0.w = r0.w * r2.w;
/*111*/	    r3.x = r0.w * -r3.x + r3.x;
/*112*/	    r2.w = -r3.y + 0.200000;
/*113*/	    r3.y = r0.w * r2.w + r3.y;
/*114*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*115*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*116*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*117*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*118*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*119*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*120*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*121*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*122*/	    r2.w = -r2.w + 1.000000;
/*123*/	    r2.w = max(r2.w, 0.000000);
/*124*/	    r7.z = sqrt(r2.w);
/*125*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*126*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*127*/	    r2.w = sqrt(r2.w);
/*128*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*129*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*130*/	    r2.w = inversesqrt(r2.w);
/*131*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*132*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*133*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*134*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*135*/	    r2.w = -r1.y + 1.000000;
/*136*/	    r0.w = min(r0.w, r2.w);
/*137*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*138*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*139*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*140*/	    r0.w = inversesqrt(r0.w);
/*141*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*142*/	  }
/*143*/	}
/*144*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*145*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*146*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*147*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*148*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*149*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*150*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*151*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*152*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*153*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*154*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*155*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*156*/	r2.w = inversesqrt(r2.w);
/*157*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*158*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*159*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*160*/	r3.y = inversesqrt(r2.w);
/*161*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*162*/	r5.x = -r3.x + 1.000000;
/*163*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*164*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*165*/	r5.z = r5.z + r5.z;
/*166*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*167*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*168*/	r5.z = r5.x * 1.539380;
/*169*/	r5.z = cos((r5.z));
/*170*/	r5.z = inversesqrt(r5.z);
/*171*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*172*/	r5.w = saturate(r0.w * 60.000000);
/*173*/	r5.w = -r0.w + r5.w;
/*174*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*175*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*176*/	r6.w = inversesqrt(r6.w);
/*177*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*178*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*179*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*180*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*181*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*182*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*183*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*184*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*185*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*186*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*187*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*188*/	r6.w = -r0.w + 1.000000;
/*189*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*190*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*191*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*192*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*193*/	  r6.w = max(r6.w, 0.000000);
/*194*/	  r6.w = log2(r6.w);
/*195*/	  r6.w = r6.w * 10.000000;
/*196*/	  r6.w = exp2(r6.w);
/*197*/	  r6.w = r5.z * r6.w;
/*198*/	  r6.w = r6.w * r5.w + r0.w;
/*199*/	  r7.y = r5.x * 8.000000;
/*200*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*201*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*202*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*203*/	}
/*204*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*205*/	r1.y = max(r1.x, 0.000000);
/*206*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*207*/	if(floatBitsToUint(r1.x) != 0u) {
/*208*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*209*/	  r1.x = max(r1.x, -1.000000);
/*210*/	  r1.x = min(r1.x, 1.000000);
/*211*/	  r1.z = -abs(r1.x) + 1.000000;
/*212*/	  r1.z = sqrt(r1.z);
/*213*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*214*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*215*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*216*/	  r6.y = r1.z * r6.x;
/*217*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*218*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*219*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*220*/	  r1.x = r6.x * r1.z + r1.x;
/*221*/	  r1.z = r3.x * r3.x;
/*222*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*223*/	  r1.z = r1.z * r3.x + r7.x;
/*224*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*225*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*226*/	  r3.x = -r1.z * r1.z + 1.000000;
/*227*/	  r3.x = max(r3.x, 0.001000);
/*228*/	  r3.x = log2(r3.x);
/*229*/	  r5.y = r3.x * 4.950617;
/*230*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*231*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*232*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*233*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*234*/	  r1.z = floatBitsToInt(r1.z);
/*235*/	  r5.y = r3.x * r3.x + -r5.y;
/*236*/	  r5.y = sqrt(r5.y);
/*237*/	  r3.x = -r3.x + r5.y;
/*238*/	  r3.x = max(r3.x, 0.000000);
/*239*/	  r3.x = sqrt(r3.x);
/*240*/	  r1.z = r1.z * r3.x;
/*241*/	  r1.z = r1.z * 1.414214;
/*242*/	  r1.z = 0.008727 / r1.z;
/*243*/	  r1.z = max(r1.z, 0.000100);
/*244*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*245*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*246*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*247*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*248*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*249*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*250*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*251*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*252*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*253*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*254*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*255*/	  r1.x = floatBitsToInt(r1.x);
/*256*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*257*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*258*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*259*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*260*/	  r1.x = r1.x * r6.x + 1.000000;
/*261*/	  r1.x = r1.x * 0.500000;
/*262*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*263*/	  r1.z = r1.z * r6.y + 1.000000;
/*264*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*265*/	  r1.z = min(r1.y, 1.000000);
/*266*/	  r3.x = r5.x * 1.570796;
/*267*/	  r3.x = sin(r3.x);
/*268*/	  r1.z = r1.z + -1.000000;
/*269*/	  r1.z = r3.x * r1.z + 1.000000;
/*270*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*271*/	  r3.x = max(r3.x, 0.000000);
/*272*/	  r3.x = log2(r3.x);
/*273*/	  r3.x = r3.x * 10.000000;
/*274*/	  r3.x = exp2(r3.x);
/*275*/	  r3.x = r5.z * r3.x;
/*276*/	  r3.x = r3.x * r5.w + r0.w;
/*277*/	  r1.x = r1.z * abs(r1.x);
/*278*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*279*/	} else {
/*280*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*281*/	}
/*282*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*283*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*284*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*285*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*286*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*287*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*288*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*289*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*290*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*291*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*292*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*293*/	r3.w = 1.000000;
/*294*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*295*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*296*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*297*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*298*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*299*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*300*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*301*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*302*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*303*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*304*/	if(r0.w != 0) discard;
/*305*/	r0.w = sqrt(r2.w);
/*306*/	r1.x = saturate(cb2.data[0].w)/**/;
/*307*/	r1.x = -r1.x + 1.000000;
/*308*/	r1.x = r1.x * 8.000000 + -4.000000;
/*309*/	r1.y = saturate(cb2.data[1].x)/**/;
/*310*/	r1.y = -r1.y + 1.000000;
/*311*/	r1.y = r1.y * 1000.000000;
/*312*/	r0.w = r0.w / r1.y;
/*313*/	r0.w = r0.w + r1.x;
/*314*/	r0.w = r0.w * 1.442695;
/*315*/	r0.w = exp2(r0.w);
/*316*/	r0.w = cb2.data[1].y / r0.w;
/*317*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*318*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*319*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*320*/	r1.x = r1.x + -cb2.data[1].z;
/*321*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*322*/	r1.x = saturate(r1.y * r1.x);
/*323*/	r1.y = r1.x * -2.000000 + 3.000000;
/*324*/	r1.x = r1.x * r1.x;
/*325*/	r1.x = r1.x * r1.y;
/*326*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*327*/	r1.y = sqrt(r1.y);
/*328*/	r1.z = max(cb2.data[2].z, 0.001000);
/*329*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*330*/	r1.y = r1.z * r1.y;
/*331*/	r1.y = min(r1.y, 1.000000);
/*332*/	r1.z = r1.y * -2.000000 + 3.000000;
/*333*/	r1.y = r1.y * r1.y;
/*334*/	r1.y = r1.y * r1.z;
/*335*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*336*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*337*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*338*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*339*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*340*/	r4.w = max(r4.y, 0.000000);
/*341*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*342*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*343*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*344*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*345*/	r0.w = saturate(r0.w * r1.y);
/*346*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*347*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*348*/	color0.w = r1.w;
/*349*/	return;
}
