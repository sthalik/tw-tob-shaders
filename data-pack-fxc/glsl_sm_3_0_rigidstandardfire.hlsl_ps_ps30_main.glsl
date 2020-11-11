//
//
// Shader Model 4
// Fragment Shader
//
// id: 686 - fxc/glsl_SM_3_0_rigidstandardfire.hlsl_PS_ps30_main.glsl
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
/*31*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*32*/	r4.x = 0;
/*33*/	r4.y = cb0.data[26].x * 0.050000;
/*34*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*35*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*36*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*37*/	r1.w = saturate(r4.x * 5.000000);
/*38*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*39*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*41*/	r2.z = log2(r5.z);
/*42*/	r2.z = r2.z * 1.800000;
/*43*/	r2.z = exp2(r2.z);
/*44*/	r2.z = r2.z * 10.000000;
/*45*/	r2.z = min(r2.z, 1.000000);
/*46*/	r1.w = r1.w + r2.z;
/*47*/	r1.w = r1.w * 0.500000;
/*48*/	r2.z = -r5.w + 1.000000;
/*49*/	r2.z = log2(r2.z);
/*50*/	r2.z = r2.z * vsOut_T7.x;
/*51*/	r2.z = exp2(r2.z);
/*52*/	r2.z = min(r2.z, 1.000000);
/*53*/	r2.z = r2.z * vsOut_T7.x;
/*54*/	r2.w = r5.z * 0.250000;
/*55*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*56*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*57*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*58*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*59*/	r1.w = vsOut_T7.x + -0.025000;
/*60*/	r1.w = max(r1.w, 0.000000);
/*61*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*62*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*63*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*66*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*69*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*72*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*73*/	r3.xyw = (r3.xxxx * r4.xyxz + r7.xyxz).xyw;
/*74*/	r3.xyz = (r3.zzzz * r6.xyzx + r3.xywx).xyz;
/*75*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*78*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*79*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*80*/	if(floatBitsToUint(r0.w) != 0u) {
/*81*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*82*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*83*/	  r0.w = r2.w * cb0.data[26].x;
/*84*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*85*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*86*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*87*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*88*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*89*/	}
/*90*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*91*/	if(floatBitsToUint(r0.w) != 0u) {
/*92*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*93*/	  if(floatBitsToUint(r0.w) != 0u) {
/*94*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*95*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*96*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*97*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*98*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*99*/	    r0.w = -r0.w + 1.000000;
/*100*/	    r0.w = max(r0.w, 0.000000);
/*101*/	    r8.z = sqrt(r0.w);
/*102*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*103*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*104*/	    r0.w = inversesqrt(r0.w);
/*105*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*106*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*107*/	    r10.y = -1.000000;
/*108*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*109*/	    r0.w = inversesqrt(r0.w);
/*110*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*111*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*112*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*113*/	    r1.w = r1.w * 1.250000;
/*114*/	    r1.w = min(r1.w, 1.000000);
/*115*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*116*/	    r2.z = r2.z * 4.000000;
/*117*/	    r1.w = r1.w * 0.200000 + r2.z;
/*118*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*119*/	    r0.w = r0.w + -r1.w;
/*120*/	    r0.w = saturate(r0.w * 200.000000);
/*121*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*122*/	    r0.w = r0.w * r0.w;
/*123*/	    r0.w = r0.w * r1.w;
/*124*/	    r2.x = r0.w * -r2.x + r2.x;
/*125*/	    r1.w = -r2.y + 0.200000;
/*126*/	    r2.y = r0.w * r1.w + r2.y;
/*127*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*128*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*129*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*130*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*131*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*132*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*133*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*134*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*135*/	    r1.w = -r1.w + 1.000000;
/*136*/	    r1.w = max(r1.w, 0.000000);
/*137*/	    r7.z = sqrt(r1.w);
/*138*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*139*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*140*/	    r1.w = sqrt(r1.w);
/*141*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*142*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*143*/	    r1.w = inversesqrt(r1.w);
/*144*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*145*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*146*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*147*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*148*/	    r1.w = -r3.y + 1.000000;
/*149*/	    r0.w = min(r0.w, r1.w);
/*150*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*151*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*152*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*153*/	    r0.w = inversesqrt(r0.w);
/*154*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*155*/	  }
/*156*/	}
/*157*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*158*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*159*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*160*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*161*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*162*/	r2.yzw = (-r0.xxyz + r1.wwww).yzw;
/*163*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*164*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*165*/	r2.yzw = (-r1.xxyz + r1.wwww).yzw;
/*166*/	r1.xyz = (vsOut_T7.zzzz * r2.yzwy + r1.xyzx).xyz;
/*167*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*168*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*169*/	r1.w = inversesqrt(r1.w);
/*170*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*171*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*172*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*173*/	r4.x = inversesqrt(r1.w);
/*174*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*175*/	r4.w = -r2.x + 1.000000;
/*176*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*177*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*178*/	r5.y = r5.y + r5.y;
/*179*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*180*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*181*/	r6.w = r4.w * 1.539380;
/*182*/	r6.w = cos((r6.w));
/*183*/	r6.w = inversesqrt(r6.w);
/*184*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*185*/	r7.x = saturate(r0.w * 60.000000);
/*186*/	r7.x = -r0.w + r7.x;
/*187*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*188*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*189*/	r8.x = inversesqrt(r8.x);
/*190*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*191*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*192*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*193*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*194*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*195*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*196*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*197*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*198*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*199*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*200*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*201*/	r6.y = -r0.w + 1.000000;
/*202*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*203*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*204*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*205*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*206*/	  r6.y = max(r6.y, 0.000000);
/*207*/	  r6.y = log2(r6.y);
/*208*/	  r6.y = r6.y * 10.000000;
/*209*/	  r6.y = exp2(r6.y);
/*210*/	  r6.y = r6.w * r6.y;
/*211*/	  r6.y = r6.y * r7.x + r0.w;
/*212*/	  r8.x = r4.w * 8.000000;
/*213*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*214*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*215*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*216*/	}
/*217*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*218*/	r2.z = max(r2.y, 0.000000);
/*219*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*220*/	if(floatBitsToUint(r2.y) != 0u) {
/*221*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*222*/	  r2.y = max(r2.y, -1.000000);
/*223*/	  r2.y = min(r2.y, 1.000000);
/*224*/	  r2.w = -abs(r2.y) + 1.000000;
/*225*/	  r2.w = sqrt(r2.w);
/*226*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*227*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*228*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*229*/	  r5.z = r2.w * r5.y;
/*230*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*231*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*232*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*233*/	  r2.y = r5.y * r2.w + r2.y;
/*234*/	  r2.x = r2.x * r2.x;
/*235*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*236*/	  r2.x = r2.x * r2.w + r6.x;
/*237*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*238*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*239*/	  r2.w = -r2.x * r2.x + 1.000000;
/*240*/	  r2.w = max(r2.w, 0.001000);
/*241*/	  r2.w = log2(r2.w);
/*242*/	  r5.x = r2.w * 4.950617;
/*243*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*244*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*245*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*246*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*247*/	  r2.x = floatBitsToInt(r2.x);
/*248*/	  r5.x = r2.w * r2.w + -r5.x;
/*249*/	  r5.x = sqrt(r5.x);
/*250*/	  r2.w = -r2.w + r5.x;
/*251*/	  r2.w = max(r2.w, 0.000000);
/*252*/	  r2.w = sqrt(r2.w);
/*253*/	  r2.x = r2.w * r2.x;
/*254*/	  r2.x = r2.x * 1.414214;
/*255*/	  r2.x = 0.008727 / r2.x;
/*256*/	  r2.x = max(r2.x, 0.000100);
/*257*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*258*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*259*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*260*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*261*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*262*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*263*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*264*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*265*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*266*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*267*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*268*/	  r2.x = floatBitsToInt(r2.x);
/*269*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*270*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*271*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*272*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*273*/	  r2.x = r2.x * r5.x + 1.000000;
/*274*/	  r2.x = r2.x * 0.500000;
/*275*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*276*/	  r2.y = r2.y * r5.y + 1.000000;
/*277*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*278*/	  r2.y = min(r2.z, 1.000000);
/*279*/	  r2.w = r4.w * 1.570796;
/*280*/	  r2.w = sin(r2.w);
/*281*/	  r2.y = r2.y + -1.000000;
/*282*/	  r2.y = r2.w * r2.y + 1.000000;
/*283*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*284*/	  r2.w = max(r2.w, 0.000000);
/*285*/	  r2.w = log2(r2.w);
/*286*/	  r2.w = r2.w * 10.000000;
/*287*/	  r2.w = exp2(r2.w);
/*288*/	  r2.w = r6.w * r2.w;
/*289*/	  r2.w = r2.w * r7.x + r0.w;
/*290*/	  r2.x = r2.y * abs(r2.x);
/*291*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*292*/	} else {
/*293*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*294*/	}
/*295*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*296*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*297*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*298*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*299*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*300*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*301*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*302*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*303*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*304*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*305*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*306*/	r2.w = 1.000000;
/*307*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*308*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*309*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*310*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*311*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*312*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*313*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*314*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*315*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*316*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*317*/	if(r0.w != 0) discard;
/*318*/	r0.w = sqrt(r1.w);
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
/*339*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*340*/	r1.y = sqrt(r1.y);
/*341*/	r1.z = max(cb2.data[2].z, 0.001000);
/*342*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*343*/	r1.y = r1.z * r1.y;
/*344*/	r1.y = min(r1.y, 1.000000);
/*345*/	r1.z = r1.y * -2.000000 + 3.000000;
/*346*/	r1.y = r1.y * r1.y;
/*347*/	r1.y = r1.y * r1.z;
/*348*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*349*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*350*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*351*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*352*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*353*/	r3.w = max(r3.y, 0.000000);
/*354*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*355*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*356*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*357*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*358*/	r0.w = saturate(r0.w * r1.y);
/*359*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*360*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*361*/	color0.w = 1.000000;
/*362*/	return;
}
