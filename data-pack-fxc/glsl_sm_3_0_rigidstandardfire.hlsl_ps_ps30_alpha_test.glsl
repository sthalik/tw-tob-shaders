//
//
// Shader Model 4
// Fragment Shader
//
// id: 690 - fxc/glsl_SM_3_0_rigidstandardfire.hlsl_PS_ps30_alpha_test.glsl
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
/*50*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*51*/	r4.x = 0;
/*52*/	r4.y = cb0.data[26].x * 0.050000;
/*53*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*54*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*55*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*56*/	r2.w = saturate(r4.x * 5.000000);
/*57*/	r4.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*58*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*60*/	r3.z = log2(r5.z);
/*61*/	r3.z = r3.z * 1.800000;
/*62*/	r3.z = exp2(r3.z);
/*63*/	r3.z = r3.z * 10.000000;
/*64*/	r3.z = min(r3.z, 1.000000);
/*65*/	r2.w = r2.w + r3.z;
/*66*/	r2.w = r2.w * 0.500000;
/*67*/	r3.z = -r5.w + 1.000000;
/*68*/	r3.z = log2(r3.z);
/*69*/	r3.z = r3.z * vsOut_T7.x;
/*70*/	r3.z = exp2(r3.z);
/*71*/	r3.z = min(r3.z, 1.000000);
/*72*/	r3.z = r3.z * vsOut_T7.x;
/*73*/	r3.w = r5.z * 0.250000;
/*74*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*75*/	r4.xyz = (r2.wwww * r4.xyzx + r3.wwww).xyz;
/*76*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*77*/	r0.xyz = (r3.zzzz * r4.xyzx + r0.xyzx).xyz;
/*78*/	r2.w = vsOut_T7.x + -0.025000;
/*79*/	r2.w = max(r2.w, 0.000000);
/*80*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*81*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*82*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*83*/	r2.w = inversesqrt(r2.w);
/*84*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*85*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*86*/	r2.w = inversesqrt(r2.w);
/*87*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*88*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*89*/	r2.w = inversesqrt(r2.w);
/*90*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*91*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*92*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*93*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*94*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*95*/	r2.w = inversesqrt(r2.w);
/*96*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*97*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*98*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*99*/	if(floatBitsToUint(r0.w) != 0u) {
/*100*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*101*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*102*/	  r0.w = r3.w * cb0.data[26].x;
/*103*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*104*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*105*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*106*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*107*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*108*/	}
/*109*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*110*/	if(floatBitsToUint(r0.w) != 0u) {
/*111*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*112*/	  if(floatBitsToUint(r0.w) != 0u) {
/*113*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*114*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*115*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*116*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*117*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*118*/	    r0.w = -r0.w + 1.000000;
/*119*/	    r0.w = max(r0.w, 0.000000);
/*120*/	    r8.z = sqrt(r0.w);
/*121*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*122*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*123*/	    r0.w = inversesqrt(r0.w);
/*124*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*125*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*126*/	    r10.y = -1.000000;
/*127*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*128*/	    r0.w = inversesqrt(r0.w);
/*129*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*130*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*131*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*132*/	    r2.w = r2.w * 1.250000;
/*133*/	    r2.w = min(r2.w, 1.000000);
/*134*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*135*/	    r3.z = r3.z * 4.000000;
/*136*/	    r2.w = r2.w * 0.200000 + r3.z;
/*137*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*138*/	    r0.w = r0.w + -r2.w;
/*139*/	    r0.w = saturate(r0.w * 200.000000);
/*140*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*141*/	    r0.w = r0.w * r0.w;
/*142*/	    r0.w = r0.w * r2.w;
/*143*/	    r3.x = r0.w * -r3.x + r3.x;
/*144*/	    r2.w = -r3.y + 0.200000;
/*145*/	    r3.y = r0.w * r2.w + r3.y;
/*146*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*147*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*148*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*149*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*150*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*151*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*152*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*153*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*154*/	    r2.w = -r2.w + 1.000000;
/*155*/	    r2.w = max(r2.w, 0.000000);
/*156*/	    r7.z = sqrt(r2.w);
/*157*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*158*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*159*/	    r2.w = sqrt(r2.w);
/*160*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*161*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*162*/	    r2.w = inversesqrt(r2.w);
/*163*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*164*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*165*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*166*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*167*/	    r2.w = -r1.y + 1.000000;
/*168*/	    r0.w = min(r0.w, r2.w);
/*169*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*170*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*171*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*172*/	    r0.w = inversesqrt(r0.w);
/*173*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*174*/	  }
/*175*/	}
/*176*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*177*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*178*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*179*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*180*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*181*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*182*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*183*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*184*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*185*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*186*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*187*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*188*/	r2.w = inversesqrt(r2.w);
/*189*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*190*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*191*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*192*/	r3.y = inversesqrt(r2.w);
/*193*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*194*/	r5.x = -r3.x + 1.000000;
/*195*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*196*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*197*/	r5.z = r5.z + r5.z;
/*198*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*199*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*200*/	r5.z = r5.x * 1.539380;
/*201*/	r5.z = cos((r5.z));
/*202*/	r5.z = inversesqrt(r5.z);
/*203*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*204*/	r5.w = saturate(r0.w * 60.000000);
/*205*/	r5.w = -r0.w + r5.w;
/*206*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*207*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*208*/	r6.w = inversesqrt(r6.w);
/*209*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*210*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*211*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*212*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*213*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*214*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*215*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*216*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*217*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*218*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*219*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*220*/	r6.w = -r0.w + 1.000000;
/*221*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*222*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*223*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*224*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*225*/	  r6.w = max(r6.w, 0.000000);
/*226*/	  r6.w = log2(r6.w);
/*227*/	  r6.w = r6.w * 10.000000;
/*228*/	  r6.w = exp2(r6.w);
/*229*/	  r6.w = r5.z * r6.w;
/*230*/	  r6.w = r6.w * r5.w + r0.w;
/*231*/	  r7.y = r5.x * 8.000000;
/*232*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*233*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*234*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*235*/	}
/*236*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*237*/	r1.y = max(r1.x, 0.000000);
/*238*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*239*/	if(floatBitsToUint(r1.x) != 0u) {
/*240*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*241*/	  r1.x = max(r1.x, -1.000000);
/*242*/	  r1.x = min(r1.x, 1.000000);
/*243*/	  r1.z = -abs(r1.x) + 1.000000;
/*244*/	  r1.z = sqrt(r1.z);
/*245*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*246*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*247*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*248*/	  r6.y = r1.z * r6.x;
/*249*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*250*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*251*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*252*/	  r1.x = r6.x * r1.z + r1.x;
/*253*/	  r1.z = r3.x * r3.x;
/*254*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*255*/	  r1.z = r1.z * r3.x + r7.x;
/*256*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*257*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*258*/	  r3.x = -r1.z * r1.z + 1.000000;
/*259*/	  r3.x = max(r3.x, 0.001000);
/*260*/	  r3.x = log2(r3.x);
/*261*/	  r5.y = r3.x * 4.950617;
/*262*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*263*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*264*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*265*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*266*/	  r1.z = floatBitsToInt(r1.z);
/*267*/	  r5.y = r3.x * r3.x + -r5.y;
/*268*/	  r5.y = sqrt(r5.y);
/*269*/	  r3.x = -r3.x + r5.y;
/*270*/	  r3.x = max(r3.x, 0.000000);
/*271*/	  r3.x = sqrt(r3.x);
/*272*/	  r1.z = r1.z * r3.x;
/*273*/	  r1.z = r1.z * 1.414214;
/*274*/	  r1.z = 0.008727 / r1.z;
/*275*/	  r1.z = max(r1.z, 0.000100);
/*276*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*277*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*278*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*279*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*280*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*281*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*282*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*283*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*284*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*285*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*286*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*287*/	  r1.x = floatBitsToInt(r1.x);
/*288*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*289*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*290*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*291*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*292*/	  r1.x = r1.x * r6.x + 1.000000;
/*293*/	  r1.x = r1.x * 0.500000;
/*294*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*295*/	  r1.z = r1.z * r6.y + 1.000000;
/*296*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*297*/	  r1.z = min(r1.y, 1.000000);
/*298*/	  r3.x = r5.x * 1.570796;
/*299*/	  r3.x = sin(r3.x);
/*300*/	  r1.z = r1.z + -1.000000;
/*301*/	  r1.z = r3.x * r1.z + 1.000000;
/*302*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*303*/	  r3.x = max(r3.x, 0.000000);
/*304*/	  r3.x = log2(r3.x);
/*305*/	  r3.x = r3.x * 10.000000;
/*306*/	  r3.x = exp2(r3.x);
/*307*/	  r3.x = r5.z * r3.x;
/*308*/	  r3.x = r3.x * r5.w + r0.w;
/*309*/	  r1.x = r1.z * abs(r1.x);
/*310*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*311*/	} else {
/*312*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*313*/	}
/*314*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*315*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*316*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*317*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*318*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*319*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*320*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*321*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*322*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*323*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*324*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*325*/	r3.w = 1.000000;
/*326*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*327*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*328*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*329*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*330*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*331*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*332*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*333*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*334*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*335*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*336*/	if(r0.w != 0) discard;
/*337*/	r0.w = sqrt(r2.w);
/*338*/	r1.x = saturate(cb2.data[0].w)/**/;
/*339*/	r1.x = -r1.x + 1.000000;
/*340*/	r1.x = r1.x * 8.000000 + -4.000000;
/*341*/	r1.y = saturate(cb2.data[1].x)/**/;
/*342*/	r1.y = -r1.y + 1.000000;
/*343*/	r1.y = r1.y * 1000.000000;
/*344*/	r0.w = r0.w / r1.y;
/*345*/	r0.w = r0.w + r1.x;
/*346*/	r0.w = r0.w * 1.442695;
/*347*/	r0.w = exp2(r0.w);
/*348*/	r0.w = cb2.data[1].y / r0.w;
/*349*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*350*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*351*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*352*/	r1.x = r1.x + -cb2.data[1].z;
/*353*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*354*/	r1.x = saturate(r1.y * r1.x);
/*355*/	r1.y = r1.x * -2.000000 + 3.000000;
/*356*/	r1.x = r1.x * r1.x;
/*357*/	r1.x = r1.x * r1.y;
/*358*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*359*/	r1.y = sqrt(r1.y);
/*360*/	r1.z = max(cb2.data[2].z, 0.001000);
/*361*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*362*/	r1.y = r1.z * r1.y;
/*363*/	r1.y = min(r1.y, 1.000000);
/*364*/	r1.z = r1.y * -2.000000 + 3.000000;
/*365*/	r1.y = r1.y * r1.y;
/*366*/	r1.y = r1.y * r1.z;
/*367*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*368*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*369*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*370*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*371*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*372*/	r4.w = max(r4.y, 0.000000);
/*373*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*374*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*375*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*376*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*377*/	r0.w = saturate(r0.w * r1.y);
/*378*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*379*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*380*/	color0.w = r1.w;
/*381*/	return;
}
