//
//
// Shader Model 4
// Fragment Shader
//
// id: 4511 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps30_alpha_blend_40.glsl
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
uniform sampler2D s_ambient_map;
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
/*46*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*47*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*48*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*49*/	r6.x = 0;
/*50*/	r6.y = cb0.data[26].x * 0.050000;
/*51*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*52*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*53*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*54*/	r2.w = saturate(r6.x * 5.000000);
/*55*/	r6.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*56*/	r2.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*57*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*58*/	r3.z = log2(r7.z);
/*59*/	r3.z = r3.z * 1.800000;
/*60*/	r3.z = exp2(r3.z);
/*61*/	r3.z = r3.z * 10.000000;
/*62*/	r3.z = min(r3.z, 1.000000);
/*63*/	r2.w = r2.w + r3.z;
/*64*/	r2.w = r2.w * 0.500000;
/*65*/	r3.z = -r7.w + 1.000000;
/*66*/	r3.z = log2(r3.z);
/*67*/	r3.z = r3.z * vsOut_T7.x;
/*68*/	r3.z = exp2(r3.z);
/*69*/	r3.z = min(r3.z, 1.000000);
/*70*/	r3.z = r3.z * vsOut_T7.x;
/*71*/	r3.w = r7.z * 0.250000;
/*72*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*73*/	r6.xyz = (r2.wwww * r6.xyzx + r3.wwww).xyz;
/*74*/	r0.xyz = (-r0.xyzx * r4.xyzx + r6.xyzx).xyz;
/*75*/	r0.xyz = (r3.zzzz * r0.xyzx + r5.xyzx).xyz;
/*76*/	r2.w = vsOut_T7.x + -0.025000;
/*77*/	r2.w = max(r2.w, 0.000000);
/*78*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*79*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*80*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*81*/	r2.w = inversesqrt(r2.w);
/*82*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*83*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*84*/	r2.w = inversesqrt(r2.w);
/*85*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*86*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*87*/	r2.w = inversesqrt(r2.w);
/*88*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*89*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*90*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*91*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*92*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*93*/	r2.w = inversesqrt(r2.w);
/*94*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*95*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*96*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*97*/	if(floatBitsToUint(r0.w) != 0u) {
/*98*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*99*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*100*/	  r0.w = r3.w * cb0.data[26].x;
/*101*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*102*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*103*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*104*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*105*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*106*/	}
/*107*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*108*/	if(floatBitsToUint(r0.w) != 0u) {
/*109*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*110*/	  if(floatBitsToUint(r0.w) != 0u) {
/*111*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*112*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*113*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*114*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*115*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*116*/	    r0.w = -r0.w + 1.000000;
/*117*/	    r0.w = max(r0.w, 0.000000);
/*118*/	    r8.z = sqrt(r0.w);
/*119*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*120*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*121*/	    r0.w = inversesqrt(r0.w);
/*122*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*123*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*124*/	    r10.y = -1.000000;
/*125*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*126*/	    r0.w = inversesqrt(r0.w);
/*127*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*128*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*129*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*130*/	    r2.w = r2.w * 1.250000;
/*131*/	    r2.w = min(r2.w, 1.000000);
/*132*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*133*/	    r3.z = r3.z * 4.000000;
/*134*/	    r2.w = r2.w * 0.200000 + r3.z;
/*135*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*136*/	    r0.w = r0.w + -r2.w;
/*137*/	    r0.w = saturate(r0.w * 200.000000);
/*138*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*139*/	    r0.w = r0.w * r0.w;
/*140*/	    r0.w = r0.w * r2.w;
/*141*/	    r3.x = r0.w * -r3.x + r3.x;
/*142*/	    r2.w = -r3.y + 0.200000;
/*143*/	    r3.y = r0.w * r2.w + r3.y;
/*144*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*145*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*146*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*147*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*148*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*149*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*150*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*151*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*152*/	    r2.w = -r2.w + 1.000000;
/*153*/	    r2.w = max(r2.w, 0.000000);
/*154*/	    r7.z = sqrt(r2.w);
/*155*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*156*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*157*/	    r2.w = sqrt(r2.w);
/*158*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*159*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*160*/	    r2.w = inversesqrt(r2.w);
/*161*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*162*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*163*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*164*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*165*/	    r2.w = -r1.y + 1.000000;
/*166*/	    r0.w = min(r0.w, r2.w);
/*167*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*168*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*169*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*170*/	    r0.w = inversesqrt(r0.w);
/*171*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*172*/	  }
/*173*/	}
/*174*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*175*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*176*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*177*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*178*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*179*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*180*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*181*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*182*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*183*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*184*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*185*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*186*/	r2.w = inversesqrt(r2.w);
/*187*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*188*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*189*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*190*/	r3.y = inversesqrt(r2.w);
/*191*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*192*/	r5.x = -r3.x + 1.000000;
/*193*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*195*/	r5.z = r5.z + r5.z;
/*196*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*197*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*198*/	r5.z = r5.x * 1.539380;
/*199*/	r5.z = cos((r5.z));
/*200*/	r5.z = inversesqrt(r5.z);
/*201*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*202*/	r5.w = saturate(r0.w * 60.000000);
/*203*/	r5.w = -r0.w + r5.w;
/*204*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*205*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*206*/	r6.w = inversesqrt(r6.w);
/*207*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*208*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*209*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*210*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*211*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*212*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*213*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*214*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*215*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*216*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*217*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*218*/	r6.w = -r0.w + 1.000000;
/*219*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*220*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*221*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*222*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*223*/	  r6.w = max(r6.w, 0.000000);
/*224*/	  r6.w = log2(r6.w);
/*225*/	  r6.w = r6.w * 10.000000;
/*226*/	  r6.w = exp2(r6.w);
/*227*/	  r6.w = r5.z * r6.w;
/*228*/	  r6.w = r6.w * r5.w + r0.w;
/*229*/	  r7.y = r5.x * 8.000000;
/*230*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*231*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*232*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*233*/	}
/*234*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*235*/	r1.y = max(r1.x, 0.000000);
/*236*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*237*/	if(floatBitsToUint(r1.x) != 0u) {
/*238*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*239*/	  r1.x = max(r1.x, -1.000000);
/*240*/	  r1.x = min(r1.x, 1.000000);
/*241*/	  r1.z = -abs(r1.x) + 1.000000;
/*242*/	  r1.z = sqrt(r1.z);
/*243*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*244*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*245*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*246*/	  r6.y = r1.z * r6.x;
/*247*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*248*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*249*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*250*/	  r1.x = r6.x * r1.z + r1.x;
/*251*/	  r1.z = r3.x * r3.x;
/*252*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*253*/	  r1.z = r1.z * r3.x + r7.x;
/*254*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*255*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*256*/	  r3.x = -r1.z * r1.z + 1.000000;
/*257*/	  r3.x = max(r3.x, 0.001000);
/*258*/	  r3.x = log2(r3.x);
/*259*/	  r5.y = r3.x * 4.950617;
/*260*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*261*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*262*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*263*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*264*/	  r1.z = floatBitsToInt(r1.z);
/*265*/	  r5.y = r3.x * r3.x + -r5.y;
/*266*/	  r5.y = sqrt(r5.y);
/*267*/	  r3.x = -r3.x + r5.y;
/*268*/	  r3.x = max(r3.x, 0.000000);
/*269*/	  r3.x = sqrt(r3.x);
/*270*/	  r1.z = r1.z * r3.x;
/*271*/	  r1.z = r1.z * 1.414214;
/*272*/	  r1.z = 0.008727 / r1.z;
/*273*/	  r1.z = max(r1.z, 0.000100);
/*274*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*275*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*276*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*277*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*278*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*279*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*280*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*281*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*282*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*283*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*284*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*285*/	  r1.x = floatBitsToInt(r1.x);
/*286*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*287*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*288*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*289*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*290*/	  r1.x = r1.x * r6.x + 1.000000;
/*291*/	  r1.x = r1.x * 0.500000;
/*292*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*293*/	  r1.z = r1.z * r6.y + 1.000000;
/*294*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*295*/	  r1.z = min(r1.y, 1.000000);
/*296*/	  r3.x = r5.x * 1.570796;
/*297*/	  r3.x = sin(r3.x);
/*298*/	  r1.z = r1.z + -1.000000;
/*299*/	  r1.z = r3.x * r1.z + 1.000000;
/*300*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*301*/	  r3.x = max(r3.x, 0.000000);
/*302*/	  r3.x = log2(r3.x);
/*303*/	  r3.x = r3.x * 10.000000;
/*304*/	  r3.x = exp2(r3.x);
/*305*/	  r3.x = r5.z * r3.x;
/*306*/	  r3.x = r3.x * r5.w + r0.w;
/*307*/	  r1.x = r1.z * abs(r1.x);
/*308*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*309*/	} else {
/*310*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*311*/	}
/*312*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*313*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*314*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*315*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*316*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*317*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*318*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*319*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*320*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*321*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*322*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*323*/	r3.w = 1.000000;
/*324*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*325*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*326*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*327*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*328*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*329*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*330*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*331*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*332*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*333*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*334*/	if(r0.w != 0) discard;
/*335*/	r0.w = sqrt(r2.w);
/*336*/	r1.x = saturate(cb2.data[0].w)/**/;
/*337*/	r1.x = -r1.x + 1.000000;
/*338*/	r1.x = r1.x * 8.000000 + -4.000000;
/*339*/	r1.y = saturate(cb2.data[1].x)/**/;
/*340*/	r1.y = -r1.y + 1.000000;
/*341*/	r1.y = r1.y * 1000.000000;
/*342*/	r0.w = r0.w / r1.y;
/*343*/	r0.w = r0.w + r1.x;
/*344*/	r0.w = r0.w * 1.442695;
/*345*/	r0.w = exp2(r0.w);
/*346*/	r0.w = cb2.data[1].y / r0.w;
/*347*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*348*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*349*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*350*/	r1.x = r1.x + -cb2.data[1].z;
/*351*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*352*/	r1.x = saturate(r1.y * r1.x);
/*353*/	r1.y = r1.x * -2.000000 + 3.000000;
/*354*/	r1.x = r1.x * r1.x;
/*355*/	r1.x = r1.x * r1.y;
/*356*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*357*/	r1.y = sqrt(r1.y);
/*358*/	r1.z = max(cb2.data[2].z, 0.001000);
/*359*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*360*/	r1.y = r1.z * r1.y;
/*361*/	r1.y = min(r1.y, 1.000000);
/*362*/	r1.z = r1.y * -2.000000 + 3.000000;
/*363*/	r1.y = r1.y * r1.y;
/*364*/	r1.y = r1.y * r1.z;
/*365*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*366*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*367*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*368*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*369*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*370*/	r4.w = max(r4.y, 0.000000);
/*371*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*372*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*373*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*374*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*375*/	r0.w = saturate(r0.w * r1.y);
/*376*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*377*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*378*/	color0.w = r1.w;
/*379*/	return;
}
