//
//
// Shader Model 4
// Fragment Shader
//
// id: 794 - fxc/glsl_SM_3_0_rigidtileddirtmapmesh.hlsl_PS_ps30_main.glsl
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
  vec4 r11;
  vec4 r12;
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
/*40*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*41*/	r1.w = inversesqrt(r1.w);
/*42*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*43*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*44*/	r1.w = inversesqrt(r1.w);
/*45*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*46*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*47*/	r1.w = inversesqrt(r1.w);
/*48*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*49*/	r9.xyz = (r3.yyyy * r7.xyzx).xyz;
/*50*/	r3.xyw = (r3.xxxx * r6.xyxz + r9.xyxz).xyw;
/*51*/	r3.xyz = (r3.zzzz * r8.xyzx + r3.xywx).xyz;
/*52*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*53*/	r1.w = inversesqrt(r1.w);
/*54*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*55*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*56*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*57*/	if(floatBitsToUint(r0.w) != 0u) {
/*58*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*59*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*60*/	  r0.w = r2.w * cb0.data[26].x;
/*61*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*62*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r9.xxxy).zw;
/*63*/	  r9.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*64*/	  r1.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*65*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*66*/	}
/*67*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*68*/	if(floatBitsToUint(r0.w) != 0u) {
/*69*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*70*/	  if(floatBitsToUint(r0.w) != 0u) {
/*71*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*72*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*73*/	    r2.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*74*/	    r10.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*75*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*76*/	    r0.w = -r0.w + 1.000000;
/*77*/	    r0.w = max(r0.w, 0.000000);
/*78*/	    r10.z = sqrt(r0.w);
/*79*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*80*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*81*/	    r0.w = inversesqrt(r0.w);
/*82*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*83*/	    r12.xz = (cb3.data[0].xxyx).xz/**/;
/*84*/	    r12.y = -1.000000;
/*85*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*86*/	    r0.w = inversesqrt(r0.w);
/*87*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*88*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*89*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*90*/	    r1.w = r1.w * 1.250000;
/*91*/	    r1.w = min(r1.w, 1.000000);
/*92*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*93*/	    r2.z = r2.z * 4.000000;
/*94*/	    r1.w = r1.w * 0.200000 + r2.z;
/*95*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*96*/	    r0.w = r0.w + -r1.w;
/*97*/	    r0.w = saturate(r0.w * 200.000000);
/*98*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*99*/	    r0.w = r0.w * r0.w;
/*100*/	    r0.w = r0.w * r1.w;
/*101*/	    r2.x = r0.w * -r2.x + r2.x;
/*102*/	    r1.w = -r2.y + 0.200000;
/*103*/	    r2.y = r0.w * r1.w + r2.y;
/*104*/	    r0.xyz = (-r0.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*105*/	    r5.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*106*/	    r0.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*107*/	    r1.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*108*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*109*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*110*/	    r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*111*/	    r1.w = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*112*/	    r1.w = -r1.w + 1.000000;
/*113*/	    r1.w = max(r1.w, 0.000000);
/*114*/	    r0.z = sqrt(r1.w);
/*115*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*116*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*117*/	    r1.w = sqrt(r1.w);
/*118*/	    r0.xyz = (r4.xyzx * r1.wwww + r0.xyzx).xyz;
/*119*/	    r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*120*/	    r1.w = inversesqrt(r1.w);
/*121*/	    r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*122*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*123*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*124*/	    r0.xyz = (r0.zzzz * r8.xyzx + r4.xyzx).xyz;
/*125*/	    r1.w = -r3.y + 1.000000;
/*126*/	    r0.w = min(r0.w, r1.w);
/*127*/	    r0.xyz = (-r3.xyzx + r0.xyzx).xyz;
/*128*/	    r0.xyz = (r0.wwww * r0.xyzx + r3.xyzx).xyz;
/*129*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*130*/	    r0.w = inversesqrt(r0.w);
/*131*/	    r3.xyz = (r0.wwww * r0.xyzx).xyz;
/*132*/	  }
/*133*/	}
/*134*/	r0.x = vsOut_T7.y * -r2.y + r2.y;
/*135*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*136*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*137*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*138*/	r1.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*139*/	r2.yzw = (-r0.yyzw + r1.wwww).yzw;
/*140*/	r0.yzw = (vsOut_T7.zzzz * r2.yyzw + r0.yyzw).yzw;
/*141*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*142*/	r2.yzw = (-r1.xxyz + r1.wwww).yzw;
/*143*/	r1.xyz = (vsOut_T7.zzzz * r2.yzwy + r1.xyzx).xyz;
/*144*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*145*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*146*/	r1.w = inversesqrt(r1.w);
/*147*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*148*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*149*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*150*/	r4.x = inversesqrt(r1.w);
/*151*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*152*/	r4.w = -r2.x + 1.000000;
/*153*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*154*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*155*/	r5.y = r5.y + r5.y;
/*156*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*157*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*158*/	r6.w = r4.w * 1.539380;
/*159*/	r6.w = cos((r6.w));
/*160*/	r6.w = inversesqrt(r6.w);
/*161*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*162*/	r7.x = saturate(r0.x * 60.000000);
/*163*/	r7.x = -r0.x + r7.x;
/*164*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*165*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*166*/	r8.x = inversesqrt(r8.x);
/*167*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*168*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*169*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*170*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*171*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*172*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*173*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*174*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*175*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*176*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*177*/	r7.yzw = (r0.yyzw * r7.yyzw).yzw;
/*178*/	r6.y = -r0.x + 1.000000;
/*179*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*180*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*181*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*182*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*183*/	  r6.y = max(r6.y, 0.000000);
/*184*/	  r6.y = log2(r6.y);
/*185*/	  r6.y = r6.y * 10.000000;
/*186*/	  r6.y = exp2(r6.y);
/*187*/	  r6.y = r6.w * r6.y;
/*188*/	  r6.y = r6.y * r7.x + r0.x;
/*189*/	  r8.x = r4.w * 8.000000;
/*190*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*191*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*192*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*193*/	}
/*194*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*195*/	r2.z = max(r2.y, 0.000000);
/*196*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*197*/	if(floatBitsToUint(r2.y) != 0u) {
/*198*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*199*/	  r2.y = max(r2.y, -1.000000);
/*200*/	  r2.y = min(r2.y, 1.000000);
/*201*/	  r2.w = -abs(r2.y) + 1.000000;
/*202*/	  r2.w = sqrt(r2.w);
/*203*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*204*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*205*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*206*/	  r5.z = r2.w * r5.y;
/*207*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*208*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*209*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*210*/	  r2.y = r5.y * r2.w + r2.y;
/*211*/	  r2.x = r2.x * r2.x;
/*212*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*213*/	  r2.x = r2.x * r2.w + r6.x;
/*214*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*215*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*216*/	  r2.w = -r2.x * r2.x + 1.000000;
/*217*/	  r2.w = max(r2.w, 0.001000);
/*218*/	  r2.w = log2(r2.w);
/*219*/	  r5.x = r2.w * 4.950617;
/*220*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*221*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*222*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*223*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*224*/	  r2.x = floatBitsToInt(r2.x);
/*225*/	  r5.x = r2.w * r2.w + -r5.x;
/*226*/	  r5.x = sqrt(r5.x);
/*227*/	  r2.w = -r2.w + r5.x;
/*228*/	  r2.w = max(r2.w, 0.000000);
/*229*/	  r2.w = sqrt(r2.w);
/*230*/	  r2.x = r2.w * r2.x;
/*231*/	  r2.x = r2.x * 1.414214;
/*232*/	  r2.x = 0.008727 / r2.x;
/*233*/	  r2.x = max(r2.x, 0.000100);
/*234*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*235*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*236*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*237*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*238*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*239*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*240*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*241*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*242*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*243*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*244*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*245*/	  r2.x = floatBitsToInt(r2.x);
/*246*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*247*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*248*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*249*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*250*/	  r2.x = r2.x * r5.x + 1.000000;
/*251*/	  r2.x = r2.x * 0.500000;
/*252*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*253*/	  r2.y = r2.y * r5.y + 1.000000;
/*254*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*255*/	  r2.y = min(r2.z, 1.000000);
/*256*/	  r2.w = r4.w * 1.570796;
/*257*/	  r2.w = sin(r2.w);
/*258*/	  r2.y = r2.y + -1.000000;
/*259*/	  r2.y = r2.w * r2.y + 1.000000;
/*260*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*261*/	  r2.w = max(r2.w, 0.000000);
/*262*/	  r2.w = log2(r2.w);
/*263*/	  r2.w = r2.w * 10.000000;
/*264*/	  r2.w = exp2(r2.w);
/*265*/	  r2.w = r6.w * r2.w;
/*266*/	  r2.w = r2.w * r7.x + r0.x;
/*267*/	  r2.x = r2.y * abs(r2.x);
/*268*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*269*/	} else {
/*270*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*271*/	}
/*272*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*273*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*274*/	r2.xyw = (max(r0.xxxx, r2.xyxw)).xyw;
/*275*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*276*/	r0.xyz = (r0.yzwy * r2.zzzz).xyz;
/*277*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*278*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*279*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*280*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*281*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*282*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*283*/	r2.w = 1.000000;
/*284*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*285*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*286*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*287*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*288*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*289*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*290*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*291*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*292*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*293*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*294*/	if(r0.w != 0) discard;
/*295*/	r0.w = sqrt(r1.w);
/*296*/	r1.x = saturate(cb2.data[0].w)/**/;
/*297*/	r1.x = -r1.x + 1.000000;
/*298*/	r1.x = r1.x * 8.000000 + -4.000000;
/*299*/	r1.y = saturate(cb2.data[1].x)/**/;
/*300*/	r1.y = -r1.y + 1.000000;
/*301*/	r1.y = r1.y * 1000.000000;
/*302*/	r0.w = r0.w / r1.y;
/*303*/	r0.w = r0.w + r1.x;
/*304*/	r0.w = r0.w * 1.442695;
/*305*/	r0.w = exp2(r0.w);
/*306*/	r0.w = cb2.data[1].y / r0.w;
/*307*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*308*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*309*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*310*/	r1.x = r1.x + -cb2.data[1].z;
/*311*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*312*/	r1.x = saturate(r1.y * r1.x);
/*313*/	r1.y = r1.x * -2.000000 + 3.000000;
/*314*/	r1.x = r1.x * r1.x;
/*315*/	r1.x = r1.x * r1.y;
/*316*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*317*/	r1.y = sqrt(r1.y);
/*318*/	r1.z = max(cb2.data[2].z, 0.001000);
/*319*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*320*/	r1.y = r1.z * r1.y;
/*321*/	r1.y = min(r1.y, 1.000000);
/*322*/	r1.z = r1.y * -2.000000 + 3.000000;
/*323*/	r1.y = r1.y * r1.y;
/*324*/	r1.y = r1.y * r1.z;
/*325*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*326*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*327*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*328*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*329*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*330*/	r3.w = max(r3.y, 0.000000);
/*331*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*332*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*333*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*334*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*335*/	r0.w = saturate(r0.w * r1.y);
/*336*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*337*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*338*/	color0.w = 1.000000;
/*339*/	return;
}
