//
//
// Shader Model 4
// Fragment Shader
//
// id: 4859 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapfiremesh.hlsl_PS_ps30_alpha_blend_40.glsl
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
/*55*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*56*/	r6.x = 0;
/*57*/	r6.y = cb0.data[26].x * 0.050000;
/*58*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*59*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*60*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*61*/	r2.w = saturate(r6.x * 5.000000);
/*62*/	r6.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r2.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*65*/	r3.z = log2(r7.z);
/*66*/	r3.z = r3.z * 1.800000;
/*67*/	r3.z = exp2(r3.z);
/*68*/	r3.z = r3.z * 10.000000;
/*69*/	r3.z = min(r3.z, 1.000000);
/*70*/	r2.w = r2.w + r3.z;
/*71*/	r2.w = r2.w * 0.500000;
/*72*/	r3.z = -r7.w + 1.000000;
/*73*/	r3.z = log2(r3.z);
/*74*/	r3.z = r3.z * vsOut_T7.x;
/*75*/	r3.z = exp2(r3.z);
/*76*/	r3.z = min(r3.z, 1.000000);
/*77*/	r3.z = r3.z * vsOut_T7.x;
/*78*/	r3.w = r7.z * 0.250000;
/*79*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*80*/	r6.xyz = (r2.wwww * r6.xyzx + r3.wwww).xyz;
/*81*/	r0.xyz = (-r0.xyzx * r4.xyzx + r6.xyzx).xyz;
/*82*/	r0.xyz = (r3.zzzz * r0.xyzx + r5.xyzx).xyz;
/*83*/	r2.w = vsOut_T7.x + -0.025000;
/*84*/	r2.w = max(r2.w, 0.000000);
/*85*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*86*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*87*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*88*/	r2.w = inversesqrt(r2.w);
/*89*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*90*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*91*/	r2.w = inversesqrt(r2.w);
/*92*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*93*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*94*/	r2.w = inversesqrt(r2.w);
/*95*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*96*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*97*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*98*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*99*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*100*/	r2.w = inversesqrt(r2.w);
/*101*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*102*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*103*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*104*/	if(floatBitsToUint(r0.w) != 0u) {
/*105*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*106*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*107*/	  r0.w = r3.w * cb0.data[26].x;
/*108*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*109*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*110*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*111*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*112*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*113*/	}
/*114*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*115*/	if(floatBitsToUint(r0.w) != 0u) {
/*116*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*117*/	  if(floatBitsToUint(r0.w) != 0u) {
/*118*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*119*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*120*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*121*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*122*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*123*/	    r0.w = -r0.w + 1.000000;
/*124*/	    r0.w = max(r0.w, 0.000000);
/*125*/	    r8.z = sqrt(r0.w);
/*126*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*127*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*128*/	    r0.w = inversesqrt(r0.w);
/*129*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*130*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*131*/	    r10.y = -1.000000;
/*132*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*133*/	    r0.w = inversesqrt(r0.w);
/*134*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*135*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*136*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*137*/	    r2.w = r2.w * 1.250000;
/*138*/	    r2.w = min(r2.w, 1.000000);
/*139*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*140*/	    r3.z = r3.z * 4.000000;
/*141*/	    r2.w = r2.w * 0.200000 + r3.z;
/*142*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*143*/	    r0.w = r0.w + -r2.w;
/*144*/	    r0.w = saturate(r0.w * 200.000000);
/*145*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*146*/	    r0.w = r0.w * r0.w;
/*147*/	    r0.w = r0.w * r2.w;
/*148*/	    r3.x = r0.w * -r3.x + r3.x;
/*149*/	    r2.w = -r3.y + 0.200000;
/*150*/	    r3.y = r0.w * r2.w + r3.y;
/*151*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*152*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*153*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*154*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*155*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*156*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*157*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*158*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*159*/	    r2.w = -r2.w + 1.000000;
/*160*/	    r2.w = max(r2.w, 0.000000);
/*161*/	    r7.z = sqrt(r2.w);
/*162*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*163*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*164*/	    r2.w = sqrt(r2.w);
/*165*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*166*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*167*/	    r2.w = inversesqrt(r2.w);
/*168*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*169*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*170*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*171*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*172*/	    r2.w = -r1.y + 1.000000;
/*173*/	    r0.w = min(r0.w, r2.w);
/*174*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*175*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*176*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*177*/	    r0.w = inversesqrt(r0.w);
/*178*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*179*/	  }
/*180*/	}
/*181*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*182*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*183*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*184*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*185*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*186*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*187*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*188*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*189*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*190*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*191*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*192*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*193*/	r2.w = inversesqrt(r2.w);
/*194*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*195*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*196*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*197*/	r3.y = inversesqrt(r2.w);
/*198*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*199*/	r5.x = -r3.x + 1.000000;
/*200*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*201*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*202*/	r5.z = r5.z + r5.z;
/*203*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*204*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*205*/	r5.z = r5.x * 1.539380;
/*206*/	r5.z = cos((r5.z));
/*207*/	r5.z = inversesqrt(r5.z);
/*208*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*209*/	r5.w = saturate(r0.w * 60.000000);
/*210*/	r5.w = -r0.w + r5.w;
/*211*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*212*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*213*/	r6.w = inversesqrt(r6.w);
/*214*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*215*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*216*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*217*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*218*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*219*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*220*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*221*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*222*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*223*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*224*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*225*/	r6.w = -r0.w + 1.000000;
/*226*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*227*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*228*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*229*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*230*/	  r6.w = max(r6.w, 0.000000);
/*231*/	  r6.w = log2(r6.w);
/*232*/	  r6.w = r6.w * 10.000000;
/*233*/	  r6.w = exp2(r6.w);
/*234*/	  r6.w = r5.z * r6.w;
/*235*/	  r6.w = r6.w * r5.w + r0.w;
/*236*/	  r7.y = r5.x * 8.000000;
/*237*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*238*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*239*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*240*/	}
/*241*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*242*/	r1.y = max(r1.x, 0.000000);
/*243*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*244*/	if(floatBitsToUint(r1.x) != 0u) {
/*245*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*246*/	  r1.x = max(r1.x, -1.000000);
/*247*/	  r1.x = min(r1.x, 1.000000);
/*248*/	  r1.z = -abs(r1.x) + 1.000000;
/*249*/	  r1.z = sqrt(r1.z);
/*250*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*251*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*252*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*253*/	  r6.y = r1.z * r6.x;
/*254*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*255*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*256*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*257*/	  r1.x = r6.x * r1.z + r1.x;
/*258*/	  r1.z = r3.x * r3.x;
/*259*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*260*/	  r1.z = r1.z * r3.x + r7.x;
/*261*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*262*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*263*/	  r3.x = -r1.z * r1.z + 1.000000;
/*264*/	  r3.x = max(r3.x, 0.001000);
/*265*/	  r3.x = log2(r3.x);
/*266*/	  r5.y = r3.x * 4.950617;
/*267*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*268*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*269*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*270*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*271*/	  r1.z = floatBitsToInt(r1.z);
/*272*/	  r5.y = r3.x * r3.x + -r5.y;
/*273*/	  r5.y = sqrt(r5.y);
/*274*/	  r3.x = -r3.x + r5.y;
/*275*/	  r3.x = max(r3.x, 0.000000);
/*276*/	  r3.x = sqrt(r3.x);
/*277*/	  r1.z = r1.z * r3.x;
/*278*/	  r1.z = r1.z * 1.414214;
/*279*/	  r1.z = 0.008727 / r1.z;
/*280*/	  r1.z = max(r1.z, 0.000100);
/*281*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*282*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*283*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*284*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*285*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*286*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*287*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*288*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*289*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*290*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*291*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*292*/	  r1.x = floatBitsToInt(r1.x);
/*293*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*294*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*295*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*296*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*297*/	  r1.x = r1.x * r6.x + 1.000000;
/*298*/	  r1.x = r1.x * 0.500000;
/*299*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*300*/	  r1.z = r1.z * r6.y + 1.000000;
/*301*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*302*/	  r1.z = min(r1.y, 1.000000);
/*303*/	  r3.x = r5.x * 1.570796;
/*304*/	  r3.x = sin(r3.x);
/*305*/	  r1.z = r1.z + -1.000000;
/*306*/	  r1.z = r3.x * r1.z + 1.000000;
/*307*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*308*/	  r3.x = max(r3.x, 0.000000);
/*309*/	  r3.x = log2(r3.x);
/*310*/	  r3.x = r3.x * 10.000000;
/*311*/	  r3.x = exp2(r3.x);
/*312*/	  r3.x = r5.z * r3.x;
/*313*/	  r3.x = r3.x * r5.w + r0.w;
/*314*/	  r1.x = r1.z * abs(r1.x);
/*315*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*316*/	} else {
/*317*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*318*/	}
/*319*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*320*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*321*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*322*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*323*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*324*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*325*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*326*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*327*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*328*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*329*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*330*/	r3.w = 1.000000;
/*331*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*332*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*333*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*334*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*335*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*336*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*337*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*338*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*339*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*340*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*341*/	if(r0.w != 0) discard;
/*342*/	r0.w = sqrt(r2.w);
/*343*/	r1.x = saturate(cb2.data[0].w)/**/;
/*344*/	r1.x = -r1.x + 1.000000;
/*345*/	r1.x = r1.x * 8.000000 + -4.000000;
/*346*/	r1.y = saturate(cb2.data[1].x)/**/;
/*347*/	r1.y = -r1.y + 1.000000;
/*348*/	r1.y = r1.y * 1000.000000;
/*349*/	r0.w = r0.w / r1.y;
/*350*/	r0.w = r0.w + r1.x;
/*351*/	r0.w = r0.w * 1.442695;
/*352*/	r0.w = exp2(r0.w);
/*353*/	r0.w = cb2.data[1].y / r0.w;
/*354*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*355*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*356*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*357*/	r1.x = r1.x + -cb2.data[1].z;
/*358*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*359*/	r1.x = saturate(r1.y * r1.x);
/*360*/	r1.y = r1.x * -2.000000 + 3.000000;
/*361*/	r1.x = r1.x * r1.x;
/*362*/	r1.x = r1.x * r1.y;
/*363*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*364*/	r1.y = sqrt(r1.y);
/*365*/	r1.z = max(cb2.data[2].z, 0.001000);
/*366*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*367*/	r1.y = r1.z * r1.y;
/*368*/	r1.y = min(r1.y, 1.000000);
/*369*/	r1.z = r1.y * -2.000000 + 3.000000;
/*370*/	r1.y = r1.y * r1.y;
/*371*/	r1.y = r1.y * r1.z;
/*372*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*373*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*374*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*375*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*376*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*377*/	r4.w = max(r4.y, 0.000000);
/*378*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*379*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*380*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*381*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*382*/	r0.w = saturate(r0.w * r1.y);
/*383*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*384*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*385*/	color0.w = r1.w;
/*386*/	return;
}
