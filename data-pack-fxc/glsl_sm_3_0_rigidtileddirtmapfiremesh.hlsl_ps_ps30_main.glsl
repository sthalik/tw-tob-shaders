//
//
// Shader Model 4
// Fragment Shader
//
// id: 841 - fxc/glsl_SM_3_0_rigidtileddirtmapfiremesh.hlsl_PS_ps30_main.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
/*31*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*32*/	r4.xyzw = (texture(s_detail_map, r2.zwzz.st)).xyzw;
/*33*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*34*/	r1.w = r4.w + -1.000000;
/*35*/	r1.w = r5.x * r1.w + 1.000000;
/*36*/	r1.w = saturate(r1.w * r5.x);
/*37*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*38*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*39*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*40*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*41*/	r6.x = 0;
/*42*/	r6.y = cb0.data[26].x * 0.050000;
/*43*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*44*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*45*/	r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*46*/	r1.w = saturate(r6.x * 5.000000);
/*47*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*48*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*50*/	r2.z = log2(r7.z);
/*51*/	r2.z = r2.z * 1.800000;
/*52*/	r2.z = exp2(r2.z);
/*53*/	r2.z = r2.z * 10.000000;
/*54*/	r2.z = min(r2.z, 1.000000);
/*55*/	r1.w = r1.w + r2.z;
/*56*/	r1.w = r1.w * 0.500000;
/*57*/	r2.z = -r7.w + 1.000000;
/*58*/	r2.z = log2(r2.z);
/*59*/	r2.z = r2.z * vsOut_T7.x;
/*60*/	r2.z = exp2(r2.z);
/*61*/	r2.z = min(r2.z, 1.000000);
/*62*/	r2.z = r2.z * vsOut_T7.x;
/*63*/	r2.w = r7.z * 0.250000;
/*64*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*65*/	r6.xyz = (r1.wwww * r6.xyzx + r2.wwww).xyz;
/*66*/	r0.xyz = (-r0.xyzx * r4.xyzx + r6.xyzx).xyz;
/*67*/	r0.xyz = (r2.zzzz * r0.xyzx + r5.xyzx).xyz;
/*68*/	r1.w = vsOut_T7.x + -0.025000;
/*69*/	r1.w = max(r1.w, 0.000000);
/*70*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*71*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*72*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*75*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*78*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*81*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*82*/	r3.xyw = (r3.xxxx * r4.xyxz + r7.xyxz).xyw;
/*83*/	r3.xyz = (r3.zzzz * r6.xyzx + r3.xywx).xyz;
/*84*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*87*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*88*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*89*/	if(floatBitsToUint(r0.w) != 0u) {
/*90*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*91*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*92*/	  r0.w = r2.w * cb0.data[26].x;
/*93*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*94*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*95*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*96*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*97*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*98*/	}
/*99*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r0.w) != 0u) {
/*101*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*102*/	  if(floatBitsToUint(r0.w) != 0u) {
/*103*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*104*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*105*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*106*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*107*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*108*/	    r0.w = -r0.w + 1.000000;
/*109*/	    r0.w = max(r0.w, 0.000000);
/*110*/	    r8.z = sqrt(r0.w);
/*111*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*112*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*115*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*116*/	    r10.y = -1.000000;
/*117*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*118*/	    r0.w = inversesqrt(r0.w);
/*119*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*120*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*121*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*122*/	    r1.w = r1.w * 1.250000;
/*123*/	    r1.w = min(r1.w, 1.000000);
/*124*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*125*/	    r2.z = r2.z * 4.000000;
/*126*/	    r1.w = r1.w * 0.200000 + r2.z;
/*127*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*128*/	    r0.w = r0.w + -r1.w;
/*129*/	    r0.w = saturate(r0.w * 200.000000);
/*130*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*131*/	    r0.w = r0.w * r0.w;
/*132*/	    r0.w = r0.w * r1.w;
/*133*/	    r2.x = r0.w * -r2.x + r2.x;
/*134*/	    r1.w = -r2.y + 0.200000;
/*135*/	    r2.y = r0.w * r1.w + r2.y;
/*136*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*137*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*138*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*139*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*140*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*141*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*142*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*143*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*144*/	    r1.w = -r1.w + 1.000000;
/*145*/	    r1.w = max(r1.w, 0.000000);
/*146*/	    r7.z = sqrt(r1.w);
/*147*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*148*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*149*/	    r1.w = sqrt(r1.w);
/*150*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*151*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*152*/	    r1.w = inversesqrt(r1.w);
/*153*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*154*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*155*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*156*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*157*/	    r1.w = -r3.y + 1.000000;
/*158*/	    r0.w = min(r0.w, r1.w);
/*159*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*160*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*161*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*162*/	    r0.w = inversesqrt(r0.w);
/*163*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*164*/	  }
/*165*/	}
/*166*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*167*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*168*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*169*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*170*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*171*/	r2.yzw = (-r0.xxyz + r1.wwww).yzw;
/*172*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*173*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*174*/	r2.yzw = (-r1.xxyz + r1.wwww).yzw;
/*175*/	r1.xyz = (vsOut_T7.zzzz * r2.yzwy + r1.xyzx).xyz;
/*176*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*177*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*178*/	r1.w = inversesqrt(r1.w);
/*179*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*180*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*181*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*182*/	r4.x = inversesqrt(r1.w);
/*183*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*184*/	r4.w = -r2.x + 1.000000;
/*185*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*187*/	r5.y = r5.y + r5.y;
/*188*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*189*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*190*/	r6.w = r4.w * 1.539380;
/*191*/	r6.w = cos((r6.w));
/*192*/	r6.w = inversesqrt(r6.w);
/*193*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*194*/	r7.x = saturate(r0.w * 60.000000);
/*195*/	r7.x = -r0.w + r7.x;
/*196*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*197*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*198*/	r8.x = inversesqrt(r8.x);
/*199*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*200*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*201*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*202*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*203*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*204*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*205*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*206*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*207*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*208*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*209*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*210*/	r6.y = -r0.w + 1.000000;
/*211*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*212*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*213*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*214*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*215*/	  r6.y = max(r6.y, 0.000000);
/*216*/	  r6.y = log2(r6.y);
/*217*/	  r6.y = r6.y * 10.000000;
/*218*/	  r6.y = exp2(r6.y);
/*219*/	  r6.y = r6.w * r6.y;
/*220*/	  r6.y = r6.y * r7.x + r0.w;
/*221*/	  r8.x = r4.w * 8.000000;
/*222*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*223*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*224*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*225*/	}
/*226*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*227*/	r2.z = max(r2.y, 0.000000);
/*228*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*229*/	if(floatBitsToUint(r2.y) != 0u) {
/*230*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*231*/	  r2.y = max(r2.y, -1.000000);
/*232*/	  r2.y = min(r2.y, 1.000000);
/*233*/	  r2.w = -abs(r2.y) + 1.000000;
/*234*/	  r2.w = sqrt(r2.w);
/*235*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*236*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*237*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*238*/	  r5.z = r2.w * r5.y;
/*239*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*240*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*241*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*242*/	  r2.y = r5.y * r2.w + r2.y;
/*243*/	  r2.x = r2.x * r2.x;
/*244*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*245*/	  r2.x = r2.x * r2.w + r6.x;
/*246*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*247*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*248*/	  r2.w = -r2.x * r2.x + 1.000000;
/*249*/	  r2.w = max(r2.w, 0.001000);
/*250*/	  r2.w = log2(r2.w);
/*251*/	  r5.x = r2.w * 4.950617;
/*252*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*253*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*254*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*255*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*256*/	  r2.x = floatBitsToInt(r2.x);
/*257*/	  r5.x = r2.w * r2.w + -r5.x;
/*258*/	  r5.x = sqrt(r5.x);
/*259*/	  r2.w = -r2.w + r5.x;
/*260*/	  r2.w = max(r2.w, 0.000000);
/*261*/	  r2.w = sqrt(r2.w);
/*262*/	  r2.x = r2.w * r2.x;
/*263*/	  r2.x = r2.x * 1.414214;
/*264*/	  r2.x = 0.008727 / r2.x;
/*265*/	  r2.x = max(r2.x, 0.000100);
/*266*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*267*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*268*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*269*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*270*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*271*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*272*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*273*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*274*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*275*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*276*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*277*/	  r2.x = floatBitsToInt(r2.x);
/*278*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*279*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*280*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*281*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*282*/	  r2.x = r2.x * r5.x + 1.000000;
/*283*/	  r2.x = r2.x * 0.500000;
/*284*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*285*/	  r2.y = r2.y * r5.y + 1.000000;
/*286*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*287*/	  r2.y = min(r2.z, 1.000000);
/*288*/	  r2.w = r4.w * 1.570796;
/*289*/	  r2.w = sin(r2.w);
/*290*/	  r2.y = r2.y + -1.000000;
/*291*/	  r2.y = r2.w * r2.y + 1.000000;
/*292*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*293*/	  r2.w = max(r2.w, 0.000000);
/*294*/	  r2.w = log2(r2.w);
/*295*/	  r2.w = r2.w * 10.000000;
/*296*/	  r2.w = exp2(r2.w);
/*297*/	  r2.w = r6.w * r2.w;
/*298*/	  r2.w = r2.w * r7.x + r0.w;
/*299*/	  r2.x = r2.y * abs(r2.x);
/*300*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*301*/	} else {
/*302*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*303*/	}
/*304*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*305*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*306*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*307*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*308*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*309*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*310*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*311*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*312*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*313*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*314*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*315*/	r2.w = 1.000000;
/*316*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*317*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*318*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*319*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*320*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*321*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*322*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*323*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*324*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*325*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*326*/	if(r0.w != 0) discard;
/*327*/	r0.w = sqrt(r1.w);
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
/*348*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*349*/	r1.y = sqrt(r1.y);
/*350*/	r1.z = max(cb2.data[2].z, 0.001000);
/*351*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*352*/	r1.y = r1.z * r1.y;
/*353*/	r1.y = min(r1.y, 1.000000);
/*354*/	r1.z = r1.y * -2.000000 + 3.000000;
/*355*/	r1.y = r1.y * r1.y;
/*356*/	r1.y = r1.y * r1.z;
/*357*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*358*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*359*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*360*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*361*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*362*/	r3.w = max(r3.y, 0.000000);
/*363*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*364*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*365*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*366*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*367*/	r0.w = saturate(r0.w * r1.y);
/*368*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*369*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*370*/	color0.w = 1.000000;
/*371*/	return;
}
