//
//
// Shader Model 4
// Fragment Shader
//
// id: 5263 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_main.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb4.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*5*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*6*/	r1.w = saturate(vsOut_N0.w);
/*7*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*8*/	r3.xyz = (r1.wwww * r3.xyzx + cb5.data[0].xyzx).xyz;
/*9*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*10*/	r2.xyw = (r2.xyxw + -cb5.data[1].xyxz).xyw;
/*11*/	r2.xyw = (r1.wwww * r2.xyxw + cb5.data[1].xyxz).xyw;
/*12*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*13*/	r4.xyz = (r4.xyzx + -cb5.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r1.wwww * r4.xyzx + cb5.data[2].xyzx).xyz;
/*15*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*17*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*20*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*21*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*22*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*23*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*25*/	r1.w = -r1.w + 1.000000;
/*26*/	r1.w = max(r1.w, 0.000000);
/*27*/	r1.z = sqrt(r1.w);
/*28*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*29*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*31*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*32*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*33*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*34*/	r1.w = r2.w * r3.w;
/*35*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*36*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*37*/	r1.xy = (r3.xyxx * r2.wwww + r1.xyxx).xy;
/*38*/	r2.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*39*/	r2.z = inversesqrt(r2.z);
/*40*/	r1.xyz = (r1.xyzx * r2.zzzz).xyz;
/*41*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*42*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*43*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*44*/	r2.x = saturate(-r2.x + r2.w);
/*45*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*46*/	if(floatBitsToUint(r2.x) != 0u) {
/*47*/	  r2.x = -r2.w + 1.000000;
/*48*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*49*/	  r2.x = -r2.x + 1.000000;
/*50*/	  r2.x = -r2.x * r2.x + 1.000000;
/*51*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*52*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*53*/	  r2.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*54*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*55*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*56*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*57*/	  r0.xyz = (r2.wwww * r3.xyzx + r2.xyzx).xyz;
/*58*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*59*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*60*/	} else {
/*61*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*63*/	  r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*64*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*65*/	}
/*66*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*69*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*72*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*75*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*76*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*77*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*78*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*81*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*82*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*83*/	if(floatBitsToUint(r0.w) != 0u) {
/*84*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*85*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*86*/	  r0.w = r3.w * cb0.data[26].x;
/*87*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*88*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*89*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*90*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*91*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*92*/	}
/*93*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*94*/	if(floatBitsToUint(r0.w) != 0u) {
/*95*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*96*/	  if(floatBitsToUint(r0.w) != 0u) {
/*97*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*98*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*99*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*100*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*101*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*102*/	    r0.w = -r0.w + 1.000000;
/*103*/	    r0.w = max(r0.w, 0.000000);
/*104*/	    r8.z = sqrt(r0.w);
/*105*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*106*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*107*/	    r0.w = inversesqrt(r0.w);
/*108*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*109*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*110*/	    r10.y = -1.000000;
/*111*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*112*/	    r0.w = inversesqrt(r0.w);
/*113*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*114*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*115*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*116*/	    r1.w = r1.w * 1.250000;
/*117*/	    r1.w = min(r1.w, 1.000000);
/*118*/	    r2.w = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*119*/	    r2.w = r2.w * 4.000000;
/*120*/	    r1.w = r1.w * 0.200000 + r2.w;
/*121*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*122*/	    r0.w = r0.w + -r1.w;
/*123*/	    r0.w = saturate(r0.w * 200.000000);
/*124*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*125*/	    r0.w = r0.w * r0.w;
/*126*/	    r0.w = r0.w * r1.w;
/*127*/	    r3.x = r0.w * -r3.x + r3.x;
/*128*/	    r1.w = -r3.y + 0.200000;
/*129*/	    r3.y = r0.w * r1.w + r3.y;
/*130*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*131*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*132*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*133*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*134*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*135*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*136*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*137*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*138*/	    r1.w = -r1.w + 1.000000;
/*139*/	    r1.w = max(r1.w, 0.000000);
/*140*/	    r7.z = sqrt(r1.w);
/*141*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*142*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*143*/	    r1.w = sqrt(r1.w);
/*144*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*145*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*146*/	    r1.w = inversesqrt(r1.w);
/*147*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*148*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*149*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*150*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*151*/	    r1.w = -r1.y + 1.000000;
/*152*/	    r0.w = min(r0.w, r1.w);
/*153*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*154*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*155*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*156*/	    r0.w = inversesqrt(r0.w);
/*157*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*158*/	  }
/*159*/	}
/*160*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*161*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*162*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*163*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*164*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*165*/	r3.yzw = (-r0.xxyz + r1.wwww).yzw;
/*166*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*167*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*168*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*169*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*170*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*171*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*172*/	r1.w = inversesqrt(r1.w);
/*173*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*174*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*175*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*176*/	r2.w = inversesqrt(r1.w);
/*177*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*178*/	r2.w = -r3.x + 1.000000;
/*179*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*180*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*181*/	r5.y = r5.y + r5.y;
/*182*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*183*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*184*/	r6.w = r2.w * 1.539380;
/*185*/	r6.w = cos((r6.w));
/*186*/	r6.w = inversesqrt(r6.w);
/*187*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*188*/	r7.x = saturate(r0.w * 60.000000);
/*189*/	r7.x = -r0.w + r7.x;
/*190*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*191*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*192*/	r8.x = inversesqrt(r8.x);
/*193*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*194*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*195*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*196*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*197*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*198*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*199*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*200*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*201*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*202*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*203*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*204*/	r6.y = -r0.w + 1.000000;
/*205*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*206*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*207*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*208*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*209*/	  r6.y = max(r6.y, 0.000000);
/*210*/	  r6.y = log2(r6.y);
/*211*/	  r6.y = r6.y * 10.000000;
/*212*/	  r6.y = exp2(r6.y);
/*213*/	  r6.y = r6.w * r6.y;
/*214*/	  r6.y = r6.y * r7.x + r0.w;
/*215*/	  r8.x = r2.w * 8.000000;
/*216*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*217*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*218*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*219*/	}
/*220*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*221*/	r1.y = max(r1.x, 0.000000);
/*222*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*223*/	if(floatBitsToUint(r1.x) != 0u) {
/*224*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*225*/	  r1.x = max(r1.x, -1.000000);
/*226*/	  r1.x = min(r1.x, 1.000000);
/*227*/	  r1.z = -abs(r1.x) + 1.000000;
/*228*/	  r1.z = sqrt(r1.z);
/*229*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*230*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*231*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*232*/	  r5.z = r1.z * r5.y;
/*233*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*234*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*235*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*236*/	  r1.x = r5.y * r1.z + r1.x;
/*237*/	  r1.z = r3.x * r3.x;
/*238*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*239*/	  r1.z = r1.z * r3.x + r6.x;
/*240*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*241*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*242*/	  r3.x = -r1.z * r1.z + 1.000000;
/*243*/	  r3.x = max(r3.x, 0.001000);
/*244*/	  r3.x = log2(r3.x);
/*245*/	  r5.x = r3.x * 4.950617;
/*246*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*247*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*248*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*249*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*250*/	  r1.z = floatBitsToInt(r1.z);
/*251*/	  r5.x = r3.x * r3.x + -r5.x;
/*252*/	  r5.x = sqrt(r5.x);
/*253*/	  r3.x = -r3.x + r5.x;
/*254*/	  r3.x = max(r3.x, 0.000000);
/*255*/	  r3.x = sqrt(r3.x);
/*256*/	  r1.z = r1.z * r3.x;
/*257*/	  r1.z = r1.z * 1.414214;
/*258*/	  r1.z = 0.008727 / r1.z;
/*259*/	  r1.z = max(r1.z, 0.000100);
/*260*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*261*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*262*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*263*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*264*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*265*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*266*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*267*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*268*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*269*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*270*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*271*/	  r1.x = floatBitsToInt(r1.x);
/*272*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*273*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*274*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*275*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*276*/	  r1.x = r1.x * r5.x + 1.000000;
/*277*/	  r1.x = r1.x * 0.500000;
/*278*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*279*/	  r1.z = r1.z * r5.y + 1.000000;
/*280*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*281*/	  r1.z = min(r1.y, 1.000000);
/*282*/	  r2.w = r2.w * 1.570796;
/*283*/	  r2.w = sin(r2.w);
/*284*/	  r1.z = r1.z + -1.000000;
/*285*/	  r1.z = r2.w * r1.z + 1.000000;
/*286*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*287*/	  r2.w = max(r2.w, 0.000000);
/*288*/	  r2.w = log2(r2.w);
/*289*/	  r2.w = r2.w * 10.000000;
/*290*/	  r2.w = exp2(r2.w);
/*291*/	  r2.w = r6.w * r2.w;
/*292*/	  r2.w = r2.w * r7.x + r0.w;
/*293*/	  r1.x = r1.z * abs(r1.x);
/*294*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*295*/	} else {
/*296*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*297*/	}
/*298*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*299*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*300*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*301*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*302*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*303*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*304*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*305*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*306*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*307*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*308*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*309*/	r2.w = 1.000000;
/*310*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*311*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*312*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*313*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*314*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*315*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*316*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*317*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*318*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*319*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*320*/	if(r0.w != 0) discard;
/*321*/	r0.w = sqrt(r1.w);
/*322*/	r1.x = saturate(cb2.data[0].w)/**/;
/*323*/	r1.x = -r1.x + 1.000000;
/*324*/	r1.x = r1.x * 8.000000 + -4.000000;
/*325*/	r1.y = saturate(cb2.data[1].x)/**/;
/*326*/	r1.y = -r1.y + 1.000000;
/*327*/	r1.y = r1.y * 1000.000000;
/*328*/	r0.w = r0.w / r1.y;
/*329*/	r0.w = r0.w + r1.x;
/*330*/	r0.w = r0.w * 1.442695;
/*331*/	r0.w = exp2(r0.w);
/*332*/	r0.w = cb2.data[1].y / r0.w;
/*333*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*334*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*335*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*336*/	r1.x = r1.x + -cb2.data[1].z;
/*337*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*338*/	r1.x = saturate(r1.y * r1.x);
/*339*/	r1.y = r1.x * -2.000000 + 3.000000;
/*340*/	r1.x = r1.x * r1.x;
/*341*/	r1.x = r1.x * r1.y;
/*342*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*343*/	r1.y = sqrt(r1.y);
/*344*/	r1.z = max(cb2.data[2].z, 0.001000);
/*345*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*346*/	r1.y = r1.z * r1.y;
/*347*/	r1.y = min(r1.y, 1.000000);
/*348*/	r1.z = r1.y * -2.000000 + 3.000000;
/*349*/	r1.y = r1.y * r1.y;
/*350*/	r1.y = r1.y * r1.z;
/*351*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*352*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*353*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*354*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*355*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*356*/	r4.w = max(r4.y, 0.000000);
/*357*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*358*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*359*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*360*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*361*/	r0.w = saturate(r0.w * r1.y);
/*362*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*363*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*364*/	color0.w = 1.000000;
/*365*/	return;
}
