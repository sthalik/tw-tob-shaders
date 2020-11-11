//
//
// Shader Model 4
// Fragment Shader
//
// id: 1214 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_alpha_test.glsl
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
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;

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
/*48*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*50*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*51*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*52*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*53*/	r2.z = r2.w * r3.w;
/*54*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*55*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*56*/	r1.xy = (r3.xyxx * r2.wwww + r1.xyxx).xy;
/*57*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*58*/	r2.w = inversesqrt(r2.w);
/*59*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*60*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*61*/	r3.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*62*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*63*/	r2.x = saturate(-r2.x + r3.w);
/*64*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r2.x) != 0u) {
/*66*/	  r2.x = -r3.w + 1.000000;
/*67*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*68*/	  r2.x = -r2.x + 1.000000;
/*69*/	  r2.x = -r2.x * r2.x + 1.000000;
/*70*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*71*/	  r2.xyw = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*72*/	  r3.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*73*/	  r3.x = uintBitsToFloat((r3.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*74*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3f800000u));
/*75*/	  r3.yzw = (r0.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r2.xxww).yzw;
/*76*/	  r0.xyz = (r3.xxxx * r3.yzwy + r2.xywx).xyz;
/*77*/	  r2.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*78*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*79*/	} else {
/*80*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*81*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*82*/	  r5.xyz = (r2.zzzz * r4.xyzx).xyz;
/*83*/	  r2.xyw = (r5.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r4.xyxz).xyw;
/*84*/	}
/*85*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*86*/	r2.z = inversesqrt(r2.z);
/*87*/	r4.xyz = (r2.zzzz * vsOut_T3.xyzx).xyz;
/*88*/	r2.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*89*/	r2.z = inversesqrt(r2.z);
/*90*/	r5.xyz = (r2.zzzz * vsOut_T4.xyzx).xyz;
/*91*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*92*/	r2.z = inversesqrt(r2.z);
/*93*/	r6.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*94*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*95*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*96*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*97*/	r2.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*98*/	r2.z = inversesqrt(r2.z);
/*99*/	r7.xyz = (r2.zzzz * r7.xyzx).xyz;
/*100*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*101*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*102*/	if(floatBitsToUint(r0.w) != 0u) {
/*103*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*104*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*105*/	  r0.w = r3.w * cb0.data[26].x;
/*106*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*107*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*108*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*109*/	  r2.xyw = (r7.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r2.xyxw).xyw;
/*110*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*111*/	}
/*112*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*113*/	if(floatBitsToUint(r0.w) != 0u) {
/*114*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*115*/	  if(floatBitsToUint(r0.w) != 0u) {
/*116*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*117*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*118*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*119*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*120*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*121*/	    r0.w = -r0.w + 1.000000;
/*122*/	    r0.w = max(r0.w, 0.000000);
/*123*/	    r8.z = sqrt(r0.w);
/*124*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*125*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*126*/	    r0.w = inversesqrt(r0.w);
/*127*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*128*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*129*/	    r10.y = -1.000000;
/*130*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*131*/	    r0.w = inversesqrt(r0.w);
/*132*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*133*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*134*/	    r2.z = cb3.data[1].x * cb3.data[1].x;
/*135*/	    r2.z = r2.z * 1.250000;
/*136*/	    r2.z = min(r2.z, 1.000000);
/*137*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*138*/	    r3.z = r3.z * 4.000000;
/*139*/	    r2.z = r2.z * 0.200000 + r3.z;
/*140*/	    r2.z = r2.z * -0.700000 + 1.000000;
/*141*/	    r0.w = r0.w + -r2.z;
/*142*/	    r0.w = saturate(r0.w * 200.000000);
/*143*/	    r2.z = r0.w * -2.000000 + 3.000000;
/*144*/	    r0.w = r0.w * r0.w;
/*145*/	    r0.w = r0.w * r2.z;
/*146*/	    r3.x = r0.w * -r3.x + r3.x;
/*147*/	    r2.z = -r3.y + 0.200000;
/*148*/	    r3.y = r0.w * r2.z + r3.y;
/*149*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*150*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*151*/	    r9.xyz = (-r2.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*152*/	    r2.xyw = (r0.wwww * r9.xyxz + r2.xyxw).xyw;
/*153*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*154*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*155*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*156*/	    r2.z = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*157*/	    r2.z = -r2.z + 1.000000;
/*158*/	    r2.z = max(r2.z, 0.000000);
/*159*/	    r7.z = sqrt(r2.z);
/*160*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*161*/	    r2.z = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*162*/	    r2.z = sqrt(r2.z);
/*163*/	    r7.xyz = (r8.xyzx * r2.zzzz + r7.xyzx).xyz;
/*164*/	    r2.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*165*/	    r2.z = inversesqrt(r2.z);
/*166*/	    r7.xyz = (r2.zzzz * r7.xyzx).xyz;
/*167*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*168*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*169*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*170*/	    r2.z = -r1.y + 1.000000;
/*171*/	    r0.w = min(r0.w, r2.z);
/*172*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*173*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*174*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*175*/	    r0.w = inversesqrt(r0.w);
/*176*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*177*/	  }
/*178*/	}
/*179*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*180*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*181*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*182*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*183*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*184*/	r3.yzw = (-r0.xxyz + r2.zzzz).yzw;
/*185*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*186*/	r2.z = dot(vec3(r2.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*187*/	r3.yzw = (-r2.xxyw + r2.zzzz).yzw;
/*188*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xywx).xyz;
/*189*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*190*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*191*/	r2.w = inversesqrt(r2.w);
/*192*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*193*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*194*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*195*/	r3.y = inversesqrt(r2.w);
/*196*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*197*/	r5.x = -r3.x + 1.000000;
/*198*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*199*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*200*/	r5.z = r5.z + r5.z;
/*201*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*202*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*203*/	r5.z = r5.x * 1.539380;
/*204*/	r5.z = cos((r5.z));
/*205*/	r5.z = inversesqrt(r5.z);
/*206*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*207*/	r5.w = saturate(r0.w * 60.000000);
/*208*/	r5.w = -r0.w + r5.w;
/*209*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*210*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*211*/	r6.w = inversesqrt(r6.w);
/*212*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*213*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*214*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*215*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*216*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*217*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*218*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*219*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*220*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*221*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*222*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*223*/	r6.w = -r0.w + 1.000000;
/*224*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*225*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*226*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*227*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*228*/	  r6.w = max(r6.w, 0.000000);
/*229*/	  r6.w = log2(r6.w);
/*230*/	  r6.w = r6.w * 10.000000;
/*231*/	  r6.w = exp2(r6.w);
/*232*/	  r6.w = r5.z * r6.w;
/*233*/	  r6.w = r6.w * r5.w + r0.w;
/*234*/	  r7.y = r5.x * 8.000000;
/*235*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*236*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*237*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*238*/	}
/*239*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*240*/	r1.y = max(r1.x, 0.000000);
/*241*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*242*/	if(floatBitsToUint(r1.x) != 0u) {
/*243*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*244*/	  r1.x = max(r1.x, -1.000000);
/*245*/	  r1.x = min(r1.x, 1.000000);
/*246*/	  r1.z = -abs(r1.x) + 1.000000;
/*247*/	  r1.z = sqrt(r1.z);
/*248*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*249*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*250*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*251*/	  r6.y = r1.z * r6.x;
/*252*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*253*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*254*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*255*/	  r1.x = r6.x * r1.z + r1.x;
/*256*/	  r1.z = r3.x * r3.x;
/*257*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*258*/	  r1.z = r1.z * r3.x + r7.x;
/*259*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*260*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*261*/	  r3.x = -r1.z * r1.z + 1.000000;
/*262*/	  r3.x = max(r3.x, 0.001000);
/*263*/	  r3.x = log2(r3.x);
/*264*/	  r5.y = r3.x * 4.950617;
/*265*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*266*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*267*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*268*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*269*/	  r1.z = floatBitsToInt(r1.z);
/*270*/	  r5.y = r3.x * r3.x + -r5.y;
/*271*/	  r5.y = sqrt(r5.y);
/*272*/	  r3.x = -r3.x + r5.y;
/*273*/	  r3.x = max(r3.x, 0.000000);
/*274*/	  r3.x = sqrt(r3.x);
/*275*/	  r1.z = r1.z * r3.x;
/*276*/	  r1.z = r1.z * 1.414214;
/*277*/	  r1.z = 0.008727 / r1.z;
/*278*/	  r1.z = max(r1.z, 0.000100);
/*279*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*280*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*281*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*282*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*283*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*284*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*285*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*286*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*287*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*288*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*289*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*290*/	  r1.x = floatBitsToInt(r1.x);
/*291*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*292*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*293*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*294*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*295*/	  r1.x = r1.x * r6.x + 1.000000;
/*296*/	  r1.x = r1.x * 0.500000;
/*297*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*298*/	  r1.z = r1.z * r6.y + 1.000000;
/*299*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*300*/	  r1.z = min(r1.y, 1.000000);
/*301*/	  r3.x = r5.x * 1.570796;
/*302*/	  r3.x = sin(r3.x);
/*303*/	  r1.z = r1.z + -1.000000;
/*304*/	  r1.z = r3.x * r1.z + 1.000000;
/*305*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*306*/	  r3.x = max(r3.x, 0.000000);
/*307*/	  r3.x = log2(r3.x);
/*308*/	  r3.x = r3.x * 10.000000;
/*309*/	  r3.x = exp2(r3.x);
/*310*/	  r3.x = r5.z * r3.x;
/*311*/	  r3.x = r3.x * r5.w + r0.w;
/*312*/	  r1.x = r1.z * abs(r1.x);
/*313*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*314*/	} else {
/*315*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*316*/	}
/*317*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*318*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*319*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*320*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*321*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*322*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*323*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*324*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*325*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*326*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*327*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*328*/	r3.w = 1.000000;
/*329*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*330*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*331*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*332*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*333*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*334*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*335*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*336*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*337*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*338*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*339*/	if(r0.w != 0) discard;
/*340*/	r0.w = sqrt(r2.w);
/*341*/	r1.x = saturate(cb2.data[0].w)/**/;
/*342*/	r1.x = -r1.x + 1.000000;
/*343*/	r1.x = r1.x * 8.000000 + -4.000000;
/*344*/	r1.y = saturate(cb2.data[1].x)/**/;
/*345*/	r1.y = -r1.y + 1.000000;
/*346*/	r1.y = r1.y * 1000.000000;
/*347*/	r0.w = r0.w / r1.y;
/*348*/	r0.w = r0.w + r1.x;
/*349*/	r0.w = r0.w * 1.442695;
/*350*/	r0.w = exp2(r0.w);
/*351*/	r0.w = cb2.data[1].y / r0.w;
/*352*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*353*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*354*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*355*/	r1.x = r1.x + -cb2.data[1].z;
/*356*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*357*/	r1.x = saturate(r1.y * r1.x);
/*358*/	r1.y = r1.x * -2.000000 + 3.000000;
/*359*/	r1.x = r1.x * r1.x;
/*360*/	r1.x = r1.x * r1.y;
/*361*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*362*/	r1.y = sqrt(r1.y);
/*363*/	r1.z = max(cb2.data[2].z, 0.001000);
/*364*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*365*/	r1.y = r1.z * r1.y;
/*366*/	r1.y = min(r1.y, 1.000000);
/*367*/	r1.z = r1.y * -2.000000 + 3.000000;
/*368*/	r1.y = r1.y * r1.y;
/*369*/	r1.y = r1.y * r1.z;
/*370*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*371*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*372*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*373*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*374*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*375*/	r4.w = max(r4.y, 0.000000);
/*376*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*377*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*378*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*379*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*380*/	r0.w = saturate(r0.w * r1.y);
/*381*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*382*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*383*/	color0.w = r1.w;
/*384*/	return;
}
