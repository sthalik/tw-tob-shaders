//
//
// Shader Model 4
// Fragment Shader
//
// id: 737 - fxc/glsl_SM_3_0_rigidstandardblood.hlsl_PS_ps30_alpha_test.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

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
/*17*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*18*/	r0.x = r1.w + -0.500000;
/*19*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r0.x != 0) discard;
/*21*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*22*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*23*/	r1.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*24*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*25*/	r1.x = saturate(vsOut_N0.w);
/*26*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*27*/	r3.xyz = (r1.xxxx * r3.xyzx + cb5.data[0].xyzx).xyz;
/*28*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyz;
/*29*/	r4.xyz = (r4.xyzx + -cb5.data[1].xyzx).xyz;
/*30*/	r4.xyz = (r1.xxxx * r4.xyzx + cb5.data[1].xyzx).xyz;
/*31*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r1.zzzz), uvec4(0)))).xyz;
/*32*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*33*/	r1.xyz = (r1.xxxx * r5.xyzx + cb5.data[2].xyzx).xyz;
/*34*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*35*/	r0.xyz = (r2.xxxx * r3.xyzx + r0.xyzx).xyz;
/*36*/	r3.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*38*/	r1.xyz = (r1.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*40*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*41*/	r1.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*42*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*43*/	r2.x = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*44*/	r2.x = -r2.x + 1.000000;
/*45*/	r2.x = max(r2.x, 0.000000);
/*46*/	r1.z = sqrt(r2.x);
/*47*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*48*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*49*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*50*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*51*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*52*/	r2.x = saturate(-r2.x + r2.w);
/*53*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*54*/	if(floatBitsToUint(r2.x) != 0u) {
/*55*/	  r2.x = -r2.w + 1.000000;
/*56*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*57*/	  r2.x = -r2.x + 1.000000;
/*58*/	  r2.x = -r2.x * r2.x + 1.000000;
/*59*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*60*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*61*/	  r2.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*62*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*63*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*64*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*65*/	  r0.xyz = (r2.wwww * r3.xyzx + r2.xyzx).xyz;
/*66*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*67*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*68*/	} else {
/*69*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*70*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*71*/	}
/*72*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*73*/	r2.w = inversesqrt(r2.w);
/*74*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*75*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*76*/	r2.w = inversesqrt(r2.w);
/*77*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*78*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*79*/	r2.w = inversesqrt(r2.w);
/*80*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*81*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*82*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*83*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*84*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*85*/	r2.w = inversesqrt(r2.w);
/*86*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*87*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*88*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*89*/	if(floatBitsToUint(r0.w) != 0u) {
/*90*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*91*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*92*/	  r0.w = r3.w * cb0.data[26].x;
/*93*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*94*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*95*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*96*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*97*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*98*/	}
/*99*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r0.w) != 0u) {
/*101*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*102*/	  if(floatBitsToUint(r0.w) != 0u) {
/*103*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*104*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*105*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*106*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*107*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*108*/	    r0.w = -r0.w + 1.000000;
/*109*/	    r0.w = max(r0.w, 0.000000);
/*110*/	    r8.z = sqrt(r0.w);
/*111*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*112*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*115*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*116*/	    r10.y = -1.000000;
/*117*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*118*/	    r0.w = inversesqrt(r0.w);
/*119*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*120*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*121*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*122*/	    r2.w = r2.w * 1.250000;
/*123*/	    r2.w = min(r2.w, 1.000000);
/*124*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*125*/	    r3.z = r3.z * 4.000000;
/*126*/	    r2.w = r2.w * 0.200000 + r3.z;
/*127*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*128*/	    r0.w = r0.w + -r2.w;
/*129*/	    r0.w = saturate(r0.w * 200.000000);
/*130*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*131*/	    r0.w = r0.w * r0.w;
/*132*/	    r0.w = r0.w * r2.w;
/*133*/	    r3.x = r0.w * -r3.x + r3.x;
/*134*/	    r2.w = -r3.y + 0.200000;
/*135*/	    r3.y = r0.w * r2.w + r3.y;
/*136*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*137*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*138*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*139*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*140*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*141*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*142*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*143*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*144*/	    r2.w = -r2.w + 1.000000;
/*145*/	    r2.w = max(r2.w, 0.000000);
/*146*/	    r7.z = sqrt(r2.w);
/*147*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*148*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*149*/	    r2.w = sqrt(r2.w);
/*150*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*151*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*152*/	    r2.w = inversesqrt(r2.w);
/*153*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*154*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*155*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*156*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*157*/	    r2.w = -r1.y + 1.000000;
/*158*/	    r0.w = min(r0.w, r2.w);
/*159*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*160*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*161*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*162*/	    r0.w = inversesqrt(r0.w);
/*163*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*164*/	  }
/*165*/	}
/*166*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*167*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*168*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*169*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*170*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*171*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*172*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*173*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*174*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*175*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*176*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*177*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*178*/	r2.w = inversesqrt(r2.w);
/*179*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*180*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*181*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*182*/	r3.y = inversesqrt(r2.w);
/*183*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*184*/	r5.x = -r3.x + 1.000000;
/*185*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*187*/	r5.z = r5.z + r5.z;
/*188*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*189*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*190*/	r5.z = r5.x * 1.539380;
/*191*/	r5.z = cos((r5.z));
/*192*/	r5.z = inversesqrt(r5.z);
/*193*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*194*/	r5.w = saturate(r0.w * 60.000000);
/*195*/	r5.w = -r0.w + r5.w;
/*196*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*197*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*198*/	r6.w = inversesqrt(r6.w);
/*199*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*200*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*201*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*202*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*203*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*204*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*205*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*206*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*207*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*208*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*209*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*210*/	r6.w = -r0.w + 1.000000;
/*211*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*212*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*213*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*214*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*215*/	  r6.w = max(r6.w, 0.000000);
/*216*/	  r6.w = log2(r6.w);
/*217*/	  r6.w = r6.w * 10.000000;
/*218*/	  r6.w = exp2(r6.w);
/*219*/	  r6.w = r5.z * r6.w;
/*220*/	  r6.w = r6.w * r5.w + r0.w;
/*221*/	  r7.y = r5.x * 8.000000;
/*222*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*223*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*224*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*225*/	}
/*226*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*227*/	r1.y = max(r1.x, 0.000000);
/*228*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*229*/	if(floatBitsToUint(r1.x) != 0u) {
/*230*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*231*/	  r1.x = max(r1.x, -1.000000);
/*232*/	  r1.x = min(r1.x, 1.000000);
/*233*/	  r1.z = -abs(r1.x) + 1.000000;
/*234*/	  r1.z = sqrt(r1.z);
/*235*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*236*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*237*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*238*/	  r6.y = r1.z * r6.x;
/*239*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*240*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*241*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*242*/	  r1.x = r6.x * r1.z + r1.x;
/*243*/	  r1.z = r3.x * r3.x;
/*244*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*245*/	  r1.z = r1.z * r3.x + r7.x;
/*246*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*247*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*248*/	  r3.x = -r1.z * r1.z + 1.000000;
/*249*/	  r3.x = max(r3.x, 0.001000);
/*250*/	  r3.x = log2(r3.x);
/*251*/	  r5.y = r3.x * 4.950617;
/*252*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*253*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*254*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*255*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*256*/	  r1.z = floatBitsToInt(r1.z);
/*257*/	  r5.y = r3.x * r3.x + -r5.y;
/*258*/	  r5.y = sqrt(r5.y);
/*259*/	  r3.x = -r3.x + r5.y;
/*260*/	  r3.x = max(r3.x, 0.000000);
/*261*/	  r3.x = sqrt(r3.x);
/*262*/	  r1.z = r1.z * r3.x;
/*263*/	  r1.z = r1.z * 1.414214;
/*264*/	  r1.z = 0.008727 / r1.z;
/*265*/	  r1.z = max(r1.z, 0.000100);
/*266*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*267*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*268*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*269*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*270*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*271*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*272*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*273*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*274*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*275*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*276*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*277*/	  r1.x = floatBitsToInt(r1.x);
/*278*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*279*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*280*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*281*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*282*/	  r1.x = r1.x * r6.x + 1.000000;
/*283*/	  r1.x = r1.x * 0.500000;
/*284*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*285*/	  r1.z = r1.z * r6.y + 1.000000;
/*286*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*287*/	  r1.z = min(r1.y, 1.000000);
/*288*/	  r3.x = r5.x * 1.570796;
/*289*/	  r3.x = sin(r3.x);
/*290*/	  r1.z = r1.z + -1.000000;
/*291*/	  r1.z = r3.x * r1.z + 1.000000;
/*292*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*293*/	  r3.x = max(r3.x, 0.000000);
/*294*/	  r3.x = log2(r3.x);
/*295*/	  r3.x = r3.x * 10.000000;
/*296*/	  r3.x = exp2(r3.x);
/*297*/	  r3.x = r5.z * r3.x;
/*298*/	  r3.x = r3.x * r5.w + r0.w;
/*299*/	  r1.x = r1.z * abs(r1.x);
/*300*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*301*/	} else {
/*302*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*303*/	}
/*304*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*305*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*306*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*307*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*308*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*309*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*310*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*311*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*312*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*313*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*314*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*315*/	r3.w = 1.000000;
/*316*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*317*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*318*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*319*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*320*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*321*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*322*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*323*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*324*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*325*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*326*/	if(r0.w != 0) discard;
/*327*/	r0.w = sqrt(r2.w);
/*328*/	r1.x = saturate(cb2.data[0].w)/**/;
/*329*/	r1.x = -r1.x + 1.000000;
/*330*/	r1.x = r1.x * 8.000000 + -4.000000;
/*331*/	r1.y = saturate(cb2.data[1].x)/**/;
/*332*/	r1.y = -r1.y + 1.000000;
/*333*/	r1.y = r1.y * 1000.000000;
/*334*/	r0.w = r0.w / r1.y;
/*335*/	r0.w = r0.w + r1.x;
/*336*/	r0.w = r0.w * 1.442695;
/*337*/	r0.w = exp2(r0.w);
/*338*/	r0.w = cb2.data[1].y / r0.w;
/*339*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*340*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*341*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*342*/	r1.x = r1.x + -cb2.data[1].z;
/*343*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*344*/	r1.x = saturate(r1.y * r1.x);
/*345*/	r1.y = r1.x * -2.000000 + 3.000000;
/*346*/	r1.x = r1.x * r1.x;
/*347*/	r1.x = r1.x * r1.y;
/*348*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*349*/	r1.y = sqrt(r1.y);
/*350*/	r1.z = max(cb2.data[2].z, 0.001000);
/*351*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*352*/	r1.y = r1.z * r1.y;
/*353*/	r1.y = min(r1.y, 1.000000);
/*354*/	r1.z = r1.y * -2.000000 + 3.000000;
/*355*/	r1.y = r1.y * r1.y;
/*356*/	r1.y = r1.y * r1.z;
/*357*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*358*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*359*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*360*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*361*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*362*/	r4.w = max(r4.y, 0.000000);
/*363*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*364*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*365*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*366*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*367*/	r0.w = saturate(r0.w * r1.y);
/*368*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*369*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*370*/	color0.w = r1.w;
/*371*/	return;
}
