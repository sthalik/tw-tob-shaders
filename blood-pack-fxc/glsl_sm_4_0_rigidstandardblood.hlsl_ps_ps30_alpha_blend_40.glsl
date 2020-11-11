//
//
// Shader Model 4
// Fragment Shader
//
// id: 735 - fxc/glsl_SM_4_0_rigidstandardblood.hlsl_PS_ps30_alpha_blend_40.glsl
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
/*18*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r0.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*20*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*21*/	r0.x = saturate(vsOut_N0.w);
/*22*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*23*/	r3.xyz = (r0.xxxx * r3.xyzx + cb5.data[0].xyzx).xyz;
/*24*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*25*/	r4.xyz = (r4.xyzx + -cb5.data[1].xyzx).xyz;
/*26*/	r4.xyz = (r0.xxxx * r4.xyzx + cb5.data[1].xyzx).xyz;
/*27*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*28*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*29*/	r0.xyz = (r0.xxxx * r5.xyzx + cb5.data[2].xyzx).xyz;
/*30*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*31*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*32*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*33*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*34*/	r0.xyz = (r0.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*35*/	r0.xyz = (r2.zzzz * r0.xyzx + r1.xyzx).xyz;
/*36*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*37*/	r1.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*38*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r2.x = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*40*/	r2.x = -r2.x + 1.000000;
/*41*/	r2.x = max(r2.x, 0.000000);
/*42*/	r1.z = sqrt(r2.x);
/*43*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*44*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*45*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*46*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*47*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*48*/	r2.x = saturate(-r2.x + r2.w);
/*49*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*50*/	if(floatBitsToUint(r2.x) != 0u) {
/*51*/	  r2.x = -r2.w + 1.000000;
/*52*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*53*/	  r2.x = -r2.x + 1.000000;
/*54*/	  r2.x = -r2.x * r2.x + 1.000000;
/*55*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*56*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*57*/	  r2.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*58*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*59*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*60*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*61*/	  r0.xyz = (r2.wwww * r3.xyzx + r2.xyzx).xyz;
/*62*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*63*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*64*/	} else {
/*65*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*66*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*67*/	}
/*68*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r2.w = inversesqrt(r2.w);
/*70*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*71*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*72*/	r2.w = inversesqrt(r2.w);
/*73*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*74*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*78*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*79*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*80*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*81*/	r2.w = inversesqrt(r2.w);
/*82*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*83*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*84*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*85*/	if(floatBitsToUint(r0.w) != 0u) {
/*86*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*87*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*88*/	  r0.w = r3.w * cb0.data[26].x;
/*89*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*90*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*91*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*92*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*93*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*94*/	}
/*95*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*96*/	if(floatBitsToUint(r0.w) != 0u) {
/*97*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*98*/	  if(floatBitsToUint(r0.w) != 0u) {
/*99*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*100*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*101*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*102*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*103*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*104*/	    r0.w = -r0.w + 1.000000;
/*105*/	    r0.w = max(r0.w, 0.000000);
/*106*/	    r8.z = sqrt(r0.w);
/*107*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*108*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*109*/	    r0.w = inversesqrt(r0.w);
/*110*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*111*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*112*/	    r10.y = -1.000000;
/*113*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*114*/	    r0.w = inversesqrt(r0.w);
/*115*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*116*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*117*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*118*/	    r2.w = r2.w * 1.250000;
/*119*/	    r2.w = min(r2.w, 1.000000);
/*120*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*121*/	    r3.z = r3.z * 4.000000;
/*122*/	    r2.w = r2.w * 0.200000 + r3.z;
/*123*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*124*/	    r0.w = r0.w + -r2.w;
/*125*/	    r0.w = saturate(r0.w * 200.000000);
/*126*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*127*/	    r0.w = r0.w * r0.w;
/*128*/	    r0.w = r0.w * r2.w;
/*129*/	    r3.x = r0.w * -r3.x + r3.x;
/*130*/	    r2.w = -r3.y + 0.200000;
/*131*/	    r3.y = r0.w * r2.w + r3.y;
/*132*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*133*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*134*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*135*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*136*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*137*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*138*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*139*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*140*/	    r2.w = -r2.w + 1.000000;
/*141*/	    r2.w = max(r2.w, 0.000000);
/*142*/	    r7.z = sqrt(r2.w);
/*143*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*144*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*145*/	    r2.w = sqrt(r2.w);
/*146*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*147*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*148*/	    r2.w = inversesqrt(r2.w);
/*149*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*150*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*151*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*152*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*153*/	    r2.w = -r1.y + 1.000000;
/*154*/	    r0.w = min(r0.w, r2.w);
/*155*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*156*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*157*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*158*/	    r0.w = inversesqrt(r0.w);
/*159*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*160*/	  }
/*161*/	}
/*162*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*163*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*164*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*165*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*166*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*167*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*168*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*169*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*170*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*171*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*172*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*173*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*174*/	r2.w = inversesqrt(r2.w);
/*175*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*176*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*177*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*178*/	r3.y = inversesqrt(r2.w);
/*179*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*180*/	r5.x = -r3.x + 1.000000;
/*181*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*182*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*183*/	r5.z = r5.z + r5.z;
/*184*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*185*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*186*/	r5.z = r5.x * 1.539380;
/*187*/	r5.z = cos((r5.z));
/*188*/	r5.z = inversesqrt(r5.z);
/*189*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*190*/	r5.w = saturate(r0.w * 60.000000);
/*191*/	r5.w = -r0.w + r5.w;
/*192*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*193*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*194*/	r6.w = inversesqrt(r6.w);
/*195*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*196*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*197*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*198*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*199*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*200*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*201*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*202*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*203*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*204*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*205*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*206*/	r6.w = -r0.w + 1.000000;
/*207*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*208*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*209*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*210*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*211*/	  r6.w = max(r6.w, 0.000000);
/*212*/	  r6.w = log2(r6.w);
/*213*/	  r6.w = r6.w * 10.000000;
/*214*/	  r6.w = exp2(r6.w);
/*215*/	  r6.w = r5.z * r6.w;
/*216*/	  r6.w = r6.w * r5.w + r0.w;
/*217*/	  r7.y = r5.x * 8.000000;
/*218*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*219*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*220*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*221*/	}
/*222*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*223*/	r1.y = max(r1.x, 0.000000);
/*224*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*225*/	if(floatBitsToUint(r1.x) != 0u) {
/*226*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*227*/	  r1.x = max(r1.x, -1.000000);
/*228*/	  r1.x = min(r1.x, 1.000000);
/*229*/	  r1.z = -abs(r1.x) + 1.000000;
/*230*/	  r1.z = sqrt(r1.z);
/*231*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*232*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*233*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*234*/	  r6.y = r1.z * r6.x;
/*235*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*236*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*237*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*238*/	  r1.x = r6.x * r1.z + r1.x;
/*239*/	  r1.z = r3.x * r3.x;
/*240*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*241*/	  r1.z = r1.z * r3.x + r7.x;
/*242*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*243*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*244*/	  r3.x = -r1.z * r1.z + 1.000000;
/*245*/	  r3.x = max(r3.x, 0.001000);
/*246*/	  r3.x = log2(r3.x);
/*247*/	  r5.y = r3.x * 4.950617;
/*248*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*249*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*250*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*251*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*252*/	  r1.z = floatBitsToInt(r1.z);
/*253*/	  r5.y = r3.x * r3.x + -r5.y;
/*254*/	  r5.y = sqrt(r5.y);
/*255*/	  r3.x = -r3.x + r5.y;
/*256*/	  r3.x = max(r3.x, 0.000000);
/*257*/	  r3.x = sqrt(r3.x);
/*258*/	  r1.z = r1.z * r3.x;
/*259*/	  r1.z = r1.z * 1.414214;
/*260*/	  r1.z = 0.008727 / r1.z;
/*261*/	  r1.z = max(r1.z, 0.000100);
/*262*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*263*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*264*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*265*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*266*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*267*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*268*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*269*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*270*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*271*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*272*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*273*/	  r1.x = floatBitsToInt(r1.x);
/*274*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*275*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*276*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*277*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*278*/	  r1.x = r1.x * r6.x + 1.000000;
/*279*/	  r1.x = r1.x * 0.500000;
/*280*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*281*/	  r1.z = r1.z * r6.y + 1.000000;
/*282*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*283*/	  r1.z = min(r1.y, 1.000000);
/*284*/	  r3.x = r5.x * 1.570796;
/*285*/	  r3.x = sin(r3.x);
/*286*/	  r1.z = r1.z + -1.000000;
/*287*/	  r1.z = r3.x * r1.z + 1.000000;
/*288*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*289*/	  r3.x = max(r3.x, 0.000000);
/*290*/	  r3.x = log2(r3.x);
/*291*/	  r3.x = r3.x * 10.000000;
/*292*/	  r3.x = exp2(r3.x);
/*293*/	  r3.x = r5.z * r3.x;
/*294*/	  r3.x = r3.x * r5.w + r0.w;
/*295*/	  r1.x = r1.z * abs(r1.x);
/*296*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*297*/	} else {
/*298*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*299*/	}
/*300*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*301*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*302*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*303*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*304*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*305*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*306*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*307*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*308*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*309*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*310*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*311*/	r3.w = 1.000000;
/*312*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*313*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*314*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*315*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*316*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*317*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*318*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*319*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*320*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*321*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*322*/	if(r0.w != 0) discard;
/*323*/	r0.w = sqrt(r2.w);
/*324*/	r1.x = saturate(cb2.data[0].w)/**/;
/*325*/	r1.x = -r1.x + 1.000000;
/*326*/	r1.x = r1.x * 8.000000 + -4.000000;
/*327*/	r1.y = saturate(cb2.data[1].x)/**/;
/*328*/	r1.y = -r1.y + 1.000000;
/*329*/	r1.y = r1.y * 1000.000000;
/*330*/	r0.w = r0.w / r1.y;
/*331*/	r0.w = r0.w + r1.x;
/*332*/	r0.w = r0.w * 1.442695;
/*333*/	r0.w = exp2(r0.w);
/*334*/	r0.w = cb2.data[1].y / r0.w;
/*335*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*336*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*337*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*338*/	r1.x = r1.x + -cb2.data[1].z;
/*339*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*340*/	r1.x = saturate(r1.y * r1.x);
/*341*/	r1.y = r1.x * -2.000000 + 3.000000;
/*342*/	r1.x = r1.x * r1.x;
/*343*/	r1.x = r1.x * r1.y;
/*344*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*345*/	r1.y = sqrt(r1.y);
/*346*/	r1.z = max(cb2.data[2].z, 0.001000);
/*347*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*348*/	r1.y = r1.z * r1.y;
/*349*/	r1.y = min(r1.y, 1.000000);
/*350*/	r1.z = r1.y * -2.000000 + 3.000000;
/*351*/	r1.y = r1.y * r1.y;
/*352*/	r1.y = r1.y * r1.z;
/*353*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*354*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*355*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*356*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*357*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*358*/	r4.w = max(r4.y, 0.000000);
/*359*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*360*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*361*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*362*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*363*/	r0.w = saturate(r0.w * r1.y);
/*364*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*365*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*366*/	color0.w = r1.w;
/*367*/	return;
}
