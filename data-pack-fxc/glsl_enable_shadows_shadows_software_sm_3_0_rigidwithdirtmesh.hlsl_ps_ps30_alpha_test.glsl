//
//
// Shader Model 4
// Fragment Shader
//
// id: 5215 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdirtmesh.hlsl_PS_ps30_alpha_test.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*50*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*51*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*52*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*53*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*54*/	r2.w = r4.w * r5.w;
/*55*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*56*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*57*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*58*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*59*/	r3.z = inversesqrt(r3.z);
/*60*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*61*/	r4.xyz = (r2.wwww * r2.xyzx).xyz;
/*62*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*63*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r2.w = inversesqrt(r2.w);
/*65*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*66*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*67*/	r2.w = inversesqrt(r2.w);
/*68*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*69*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*70*/	r2.w = inversesqrt(r2.w);
/*71*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*72*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*73*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*74*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*75*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*76*/	r2.w = inversesqrt(r2.w);
/*77*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*78*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*79*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*80*/	if(floatBitsToUint(r0.w) != 0u) {
/*81*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*82*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*83*/	  r0.w = r3.w * cb0.data[26].x;
/*84*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*85*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*86*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*87*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*88*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*89*/	}
/*90*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*91*/	if(floatBitsToUint(r0.w) != 0u) {
/*92*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*93*/	  if(floatBitsToUint(r0.w) != 0u) {
/*94*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*95*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*96*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*97*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*98*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*99*/	    r0.w = -r0.w + 1.000000;
/*100*/	    r0.w = max(r0.w, 0.000000);
/*101*/	    r8.z = sqrt(r0.w);
/*102*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*103*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*104*/	    r0.w = inversesqrt(r0.w);
/*105*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*106*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*107*/	    r10.y = -1.000000;
/*108*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*109*/	    r0.w = inversesqrt(r0.w);
/*110*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*111*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*112*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*113*/	    r2.w = r2.w * 1.250000;
/*114*/	    r2.w = min(r2.w, 1.000000);
/*115*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*116*/	    r3.z = r3.z * 4.000000;
/*117*/	    r2.w = r2.w * 0.200000 + r3.z;
/*118*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*119*/	    r0.w = r0.w + -r2.w;
/*120*/	    r0.w = saturate(r0.w * 200.000000);
/*121*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*122*/	    r0.w = r0.w * r0.w;
/*123*/	    r0.w = r0.w * r2.w;
/*124*/	    r3.x = r0.w * -r3.x + r3.x;
/*125*/	    r2.w = -r3.y + 0.200000;
/*126*/	    r3.y = r0.w * r2.w + r3.y;
/*127*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*128*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*129*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*130*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*131*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*132*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*133*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*134*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*135*/	    r2.w = -r2.w + 1.000000;
/*136*/	    r2.w = max(r2.w, 0.000000);
/*137*/	    r7.z = sqrt(r2.w);
/*138*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*139*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*140*/	    r2.w = sqrt(r2.w);
/*141*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*142*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*143*/	    r2.w = inversesqrt(r2.w);
/*144*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*145*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*146*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*147*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*148*/	    r2.w = -r1.y + 1.000000;
/*149*/	    r0.w = min(r0.w, r2.w);
/*150*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*151*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*152*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*153*/	    r0.w = inversesqrt(r0.w);
/*154*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*155*/	  }
/*156*/	}
/*157*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*158*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*159*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*160*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*161*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*162*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*163*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*164*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*165*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*166*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*167*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*168*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*169*/	r2.w = inversesqrt(r2.w);
/*170*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*171*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*172*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*173*/	r3.y = inversesqrt(r2.w);
/*174*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*175*/	r5.x = -r3.x + 1.000000;
/*176*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*177*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*178*/	r5.z = r5.z + r5.z;
/*179*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*180*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*181*/	r5.z = r5.x * 1.539380;
/*182*/	r5.z = cos((r5.z));
/*183*/	r5.z = inversesqrt(r5.z);
/*184*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*185*/	r5.w = saturate(r0.w * 60.000000);
/*186*/	r5.w = -r0.w + r5.w;
/*187*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*188*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*189*/	r6.w = inversesqrt(r6.w);
/*190*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*191*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*192*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*193*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*194*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*195*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*196*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*197*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*198*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*199*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*200*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*201*/	r6.w = -r0.w + 1.000000;
/*202*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*203*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*204*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*205*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*206*/	  r6.w = max(r6.w, 0.000000);
/*207*/	  r6.w = log2(r6.w);
/*208*/	  r6.w = r6.w * 10.000000;
/*209*/	  r6.w = exp2(r6.w);
/*210*/	  r6.w = r5.z * r6.w;
/*211*/	  r6.w = r6.w * r5.w + r0.w;
/*212*/	  r7.y = r5.x * 8.000000;
/*213*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*214*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*215*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*216*/	}
/*217*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*218*/	r1.y = max(r1.x, 0.000000);
/*219*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*220*/	if(floatBitsToUint(r1.x) != 0u) {
/*221*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*222*/	  r1.x = max(r1.x, -1.000000);
/*223*/	  r1.x = min(r1.x, 1.000000);
/*224*/	  r1.z = -abs(r1.x) + 1.000000;
/*225*/	  r1.z = sqrt(r1.z);
/*226*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*227*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*228*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*229*/	  r6.y = r1.z * r6.x;
/*230*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*231*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*232*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*233*/	  r1.x = r6.x * r1.z + r1.x;
/*234*/	  r1.z = r3.x * r3.x;
/*235*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*236*/	  r1.z = r1.z * r3.x + r7.x;
/*237*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*238*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*239*/	  r3.x = -r1.z * r1.z + 1.000000;
/*240*/	  r3.x = max(r3.x, 0.001000);
/*241*/	  r3.x = log2(r3.x);
/*242*/	  r5.y = r3.x * 4.950617;
/*243*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*244*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*245*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*246*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*247*/	  r1.z = floatBitsToInt(r1.z);
/*248*/	  r5.y = r3.x * r3.x + -r5.y;
/*249*/	  r5.y = sqrt(r5.y);
/*250*/	  r3.x = -r3.x + r5.y;
/*251*/	  r3.x = max(r3.x, 0.000000);
/*252*/	  r3.x = sqrt(r3.x);
/*253*/	  r1.z = r1.z * r3.x;
/*254*/	  r1.z = r1.z * 1.414214;
/*255*/	  r1.z = 0.008727 / r1.z;
/*256*/	  r1.z = max(r1.z, 0.000100);
/*257*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*258*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*259*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*260*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*261*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*262*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*263*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*264*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*265*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*266*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*267*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*268*/	  r1.x = floatBitsToInt(r1.x);
/*269*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*270*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*271*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*272*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*273*/	  r1.x = r1.x * r6.x + 1.000000;
/*274*/	  r1.x = r1.x * 0.500000;
/*275*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*276*/	  r1.z = r1.z * r6.y + 1.000000;
/*277*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*278*/	  r1.z = min(r1.y, 1.000000);
/*279*/	  r3.x = r5.x * 1.570796;
/*280*/	  r3.x = sin(r3.x);
/*281*/	  r1.z = r1.z + -1.000000;
/*282*/	  r1.z = r3.x * r1.z + 1.000000;
/*283*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*284*/	  r3.x = max(r3.x, 0.000000);
/*285*/	  r3.x = log2(r3.x);
/*286*/	  r3.x = r3.x * 10.000000;
/*287*/	  r3.x = exp2(r3.x);
/*288*/	  r3.x = r5.z * r3.x;
/*289*/	  r3.x = r3.x * r5.w + r0.w;
/*290*/	  r1.x = r1.z * abs(r1.x);
/*291*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*292*/	} else {
/*293*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*294*/	}
/*295*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*296*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*297*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*298*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*299*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*300*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*301*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*302*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*303*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*304*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*305*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*306*/	r3.w = 1.000000;
/*307*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*308*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*309*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*310*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*311*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*312*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*313*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*314*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*315*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*316*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*317*/	if(r0.w != 0) discard;
/*318*/	r0.w = sqrt(r2.w);
/*319*/	r1.x = saturate(cb2.data[0].w)/**/;
/*320*/	r1.x = -r1.x + 1.000000;
/*321*/	r1.x = r1.x * 8.000000 + -4.000000;
/*322*/	r1.y = saturate(cb2.data[1].x)/**/;
/*323*/	r1.y = -r1.y + 1.000000;
/*324*/	r1.y = r1.y * 1000.000000;
/*325*/	r0.w = r0.w / r1.y;
/*326*/	r0.w = r0.w + r1.x;
/*327*/	r0.w = r0.w * 1.442695;
/*328*/	r0.w = exp2(r0.w);
/*329*/	r0.w = cb2.data[1].y / r0.w;
/*330*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*331*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*332*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*333*/	r1.x = r1.x + -cb2.data[1].z;
/*334*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*335*/	r1.x = saturate(r1.y * r1.x);
/*336*/	r1.y = r1.x * -2.000000 + 3.000000;
/*337*/	r1.x = r1.x * r1.x;
/*338*/	r1.x = r1.x * r1.y;
/*339*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*340*/	r1.y = sqrt(r1.y);
/*341*/	r1.z = max(cb2.data[2].z, 0.001000);
/*342*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*343*/	r1.y = r1.z * r1.y;
/*344*/	r1.y = min(r1.y, 1.000000);
/*345*/	r1.z = r1.y * -2.000000 + 3.000000;
/*346*/	r1.y = r1.y * r1.y;
/*347*/	r1.y = r1.y * r1.z;
/*348*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*349*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*350*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*351*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*352*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*353*/	r4.w = max(r4.y, 0.000000);
/*354*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*355*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*356*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*357*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*358*/	r0.w = saturate(r0.w * r1.y);
/*359*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*360*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*361*/	color0.w = r1.w;
/*362*/	return;
}
