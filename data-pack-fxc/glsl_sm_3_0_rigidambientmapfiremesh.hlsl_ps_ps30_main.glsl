//
//
// Shader Model 4
// Fragment Shader
//
// id: 521 - fxc/glsl_SM_3_0_rigidambientmapfiremesh.hlsl_PS_ps30_main.glsl
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
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_ambient_map;
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
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb4.data[0].z))) * 0xffffffffu)).w;
/*3*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*4*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*6*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_N0.w);
/*9*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*10*/	r5.xyz = (r1.wwww * r5.xyzx + cb5.data[0].xyzx).xyz;
/*11*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*12*/	r4.xyw = (r4.xyxw + -cb5.data[1].xyxz).xyw;
/*13*/	r4.xyw = (r1.wwww * r4.xyxw + cb5.data[1].xyxz).xyw;
/*14*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*15*/	r6.xyz = (r6.xyzx + -cb5.data[2].xyzx).xyz;
/*16*/	r6.xyz = (r1.wwww * r6.xyzx + cb5.data[2].xyzx).xyz;
/*17*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*19*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*21*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*23*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*24*/	r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*31*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*32*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*33*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*34*/	r6.x = 0;
/*35*/	r6.y = cb0.data[26].x * 0.050000;
/*36*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*37*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*38*/	r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*39*/	r1.w = saturate(r6.x * 5.000000);
/*40*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*41*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*42*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*43*/	r2.z = log2(r7.z);
/*44*/	r2.z = r2.z * 1.800000;
/*45*/	r2.z = exp2(r2.z);
/*46*/	r2.z = r2.z * 10.000000;
/*47*/	r2.z = min(r2.z, 1.000000);
/*48*/	r1.w = r1.w + r2.z;
/*49*/	r1.w = r1.w * 0.500000;
/*50*/	r2.z = -r7.w + 1.000000;
/*51*/	r2.z = log2(r2.z);
/*52*/	r2.z = r2.z * vsOut_T7.x;
/*53*/	r2.z = exp2(r2.z);
/*54*/	r2.z = min(r2.z, 1.000000);
/*55*/	r2.z = r2.z * vsOut_T7.x;
/*56*/	r2.w = r7.z * 0.250000;
/*57*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*58*/	r6.xyz = (r1.wwww * r6.xyzx + r2.wwww).xyz;
/*59*/	r0.xyz = (-r0.xyzx * r4.xyzx + r6.xyzx).xyz;
/*60*/	r0.xyz = (r2.zzzz * r0.xyzx + r5.xyzx).xyz;
/*61*/	r1.w = vsOut_T7.x + -0.025000;
/*62*/	r1.w = max(r1.w, 0.000000);
/*63*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*64*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*65*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*71*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*74*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*75*/	r3.xyw = (r3.xxxx * r4.xyxz + r7.xyxz).xyw;
/*76*/	r3.xyz = (r3.zzzz * r6.xyzx + r3.xywx).xyz;
/*77*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*78*/	r1.w = inversesqrt(r1.w);
/*79*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*80*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*81*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*82*/	if(floatBitsToUint(r0.w) != 0u) {
/*83*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*84*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*85*/	  r0.w = r2.w * cb0.data[26].x;
/*86*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*87*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*88*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*89*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*90*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*91*/	}
/*92*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*93*/	if(floatBitsToUint(r0.w) != 0u) {
/*94*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*95*/	  if(floatBitsToUint(r0.w) != 0u) {
/*96*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*97*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*98*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*99*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*100*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*101*/	    r0.w = -r0.w + 1.000000;
/*102*/	    r0.w = max(r0.w, 0.000000);
/*103*/	    r8.z = sqrt(r0.w);
/*104*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*105*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*106*/	    r0.w = inversesqrt(r0.w);
/*107*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*108*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*109*/	    r10.y = -1.000000;
/*110*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*111*/	    r0.w = inversesqrt(r0.w);
/*112*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*113*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*114*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*115*/	    r1.w = r1.w * 1.250000;
/*116*/	    r1.w = min(r1.w, 1.000000);
/*117*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*118*/	    r2.z = r2.z * 4.000000;
/*119*/	    r1.w = r1.w * 0.200000 + r2.z;
/*120*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*121*/	    r0.w = r0.w + -r1.w;
/*122*/	    r0.w = saturate(r0.w * 200.000000);
/*123*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*124*/	    r0.w = r0.w * r0.w;
/*125*/	    r0.w = r0.w * r1.w;
/*126*/	    r2.x = r0.w * -r2.x + r2.x;
/*127*/	    r1.w = -r2.y + 0.200000;
/*128*/	    r2.y = r0.w * r1.w + r2.y;
/*129*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*130*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*131*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*132*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*133*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*134*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*135*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*136*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*137*/	    r1.w = -r1.w + 1.000000;
/*138*/	    r1.w = max(r1.w, 0.000000);
/*139*/	    r7.z = sqrt(r1.w);
/*140*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*141*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*142*/	    r1.w = sqrt(r1.w);
/*143*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*144*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*145*/	    r1.w = inversesqrt(r1.w);
/*146*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*147*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*148*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*149*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*150*/	    r1.w = -r3.y + 1.000000;
/*151*/	    r0.w = min(r0.w, r1.w);
/*152*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*153*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*154*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*155*/	    r0.w = inversesqrt(r0.w);
/*156*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*157*/	  }
/*158*/	}
/*159*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*160*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*161*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*162*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*163*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*164*/	r2.yzw = (-r0.xxyz + r1.wwww).yzw;
/*165*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*166*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*167*/	r2.yzw = (-r1.xxyz + r1.wwww).yzw;
/*168*/	r1.xyz = (vsOut_T7.zzzz * r2.yzwy + r1.xyzx).xyz;
/*169*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*170*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*171*/	r1.w = inversesqrt(r1.w);
/*172*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*173*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*174*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*175*/	r4.x = inversesqrt(r1.w);
/*176*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*177*/	r4.w = -r2.x + 1.000000;
/*178*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*179*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*180*/	r5.y = r5.y + r5.y;
/*181*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*182*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*183*/	r6.w = r4.w * 1.539380;
/*184*/	r6.w = cos((r6.w));
/*185*/	r6.w = inversesqrt(r6.w);
/*186*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*187*/	r7.x = saturate(r0.w * 60.000000);
/*188*/	r7.x = -r0.w + r7.x;
/*189*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*190*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*191*/	r8.x = inversesqrt(r8.x);
/*192*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*193*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*194*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*195*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*196*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*197*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*198*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*199*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*200*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*201*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*202*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*203*/	r6.y = -r0.w + 1.000000;
/*204*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*205*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*206*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*207*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*208*/	  r6.y = max(r6.y, 0.000000);
/*209*/	  r6.y = log2(r6.y);
/*210*/	  r6.y = r6.y * 10.000000;
/*211*/	  r6.y = exp2(r6.y);
/*212*/	  r6.y = r6.w * r6.y;
/*213*/	  r6.y = r6.y * r7.x + r0.w;
/*214*/	  r8.x = r4.w * 8.000000;
/*215*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*216*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*217*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*218*/	}
/*219*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*220*/	r2.z = max(r2.y, 0.000000);
/*221*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*222*/	if(floatBitsToUint(r2.y) != 0u) {
/*223*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*224*/	  r2.y = max(r2.y, -1.000000);
/*225*/	  r2.y = min(r2.y, 1.000000);
/*226*/	  r2.w = -abs(r2.y) + 1.000000;
/*227*/	  r2.w = sqrt(r2.w);
/*228*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*229*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*230*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*231*/	  r5.z = r2.w * r5.y;
/*232*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*233*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*234*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*235*/	  r2.y = r5.y * r2.w + r2.y;
/*236*/	  r2.x = r2.x * r2.x;
/*237*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*238*/	  r2.x = r2.x * r2.w + r6.x;
/*239*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*240*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*241*/	  r2.w = -r2.x * r2.x + 1.000000;
/*242*/	  r2.w = max(r2.w, 0.001000);
/*243*/	  r2.w = log2(r2.w);
/*244*/	  r5.x = r2.w * 4.950617;
/*245*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*246*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*247*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*248*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*249*/	  r2.x = floatBitsToInt(r2.x);
/*250*/	  r5.x = r2.w * r2.w + -r5.x;
/*251*/	  r5.x = sqrt(r5.x);
/*252*/	  r2.w = -r2.w + r5.x;
/*253*/	  r2.w = max(r2.w, 0.000000);
/*254*/	  r2.w = sqrt(r2.w);
/*255*/	  r2.x = r2.w * r2.x;
/*256*/	  r2.x = r2.x * 1.414214;
/*257*/	  r2.x = 0.008727 / r2.x;
/*258*/	  r2.x = max(r2.x, 0.000100);
/*259*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*260*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*261*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*262*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*263*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*264*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*265*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*266*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*267*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*268*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*269*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*270*/	  r2.x = floatBitsToInt(r2.x);
/*271*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*272*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*273*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*274*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*275*/	  r2.x = r2.x * r5.x + 1.000000;
/*276*/	  r2.x = r2.x * 0.500000;
/*277*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*278*/	  r2.y = r2.y * r5.y + 1.000000;
/*279*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*280*/	  r2.y = min(r2.z, 1.000000);
/*281*/	  r2.w = r4.w * 1.570796;
/*282*/	  r2.w = sin(r2.w);
/*283*/	  r2.y = r2.y + -1.000000;
/*284*/	  r2.y = r2.w * r2.y + 1.000000;
/*285*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*286*/	  r2.w = max(r2.w, 0.000000);
/*287*/	  r2.w = log2(r2.w);
/*288*/	  r2.w = r2.w * 10.000000;
/*289*/	  r2.w = exp2(r2.w);
/*290*/	  r2.w = r6.w * r2.w;
/*291*/	  r2.w = r2.w * r7.x + r0.w;
/*292*/	  r2.x = r2.y * abs(r2.x);
/*293*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*294*/	} else {
/*295*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*296*/	}
/*297*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*298*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*299*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*300*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*301*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*302*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*303*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*304*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*305*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*306*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*307*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*308*/	r2.w = 1.000000;
/*309*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*310*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*311*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*312*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*313*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*314*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*315*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*316*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*317*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*318*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*319*/	if(r0.w != 0) discard;
/*320*/	r0.w = sqrt(r1.w);
/*321*/	r1.x = saturate(cb2.data[0].w)/**/;
/*322*/	r1.x = -r1.x + 1.000000;
/*323*/	r1.x = r1.x * 8.000000 + -4.000000;
/*324*/	r1.y = saturate(cb2.data[1].x)/**/;
/*325*/	r1.y = -r1.y + 1.000000;
/*326*/	r1.y = r1.y * 1000.000000;
/*327*/	r0.w = r0.w / r1.y;
/*328*/	r0.w = r0.w + r1.x;
/*329*/	r0.w = r0.w * 1.442695;
/*330*/	r0.w = exp2(r0.w);
/*331*/	r0.w = cb2.data[1].y / r0.w;
/*332*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*333*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*334*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*335*/	r1.x = r1.x + -cb2.data[1].z;
/*336*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*337*/	r1.x = saturate(r1.y * r1.x);
/*338*/	r1.y = r1.x * -2.000000 + 3.000000;
/*339*/	r1.x = r1.x * r1.x;
/*340*/	r1.x = r1.x * r1.y;
/*341*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*342*/	r1.y = sqrt(r1.y);
/*343*/	r1.z = max(cb2.data[2].z, 0.001000);
/*344*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*345*/	r1.y = r1.z * r1.y;
/*346*/	r1.y = min(r1.y, 1.000000);
/*347*/	r1.z = r1.y * -2.000000 + 3.000000;
/*348*/	r1.y = r1.y * r1.y;
/*349*/	r1.y = r1.y * r1.z;
/*350*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*351*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*352*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*353*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*354*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*355*/	r3.w = max(r3.y, 0.000000);
/*356*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*357*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*358*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*359*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*360*/	r0.w = saturate(r0.w * r1.y);
/*361*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*362*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*363*/	color0.w = 1.000000;
/*364*/	return;
}
