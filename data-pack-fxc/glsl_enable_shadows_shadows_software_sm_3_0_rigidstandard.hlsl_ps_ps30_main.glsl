//
//
// Shader Model 4
// Fragment Shader
//
// id: 4634 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidstandard.hlsl_PS_ps30_main.glsl
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
/*31*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*32*/	r1.w = inversesqrt(r1.w);
/*33*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*34*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*35*/	r1.w = inversesqrt(r1.w);
/*36*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*37*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*38*/	r1.w = inversesqrt(r1.w);
/*39*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*40*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*41*/	r3.xyw = (r3.xxxx * r4.xyxz + r7.xyxz).xyw;
/*42*/	r3.xyz = (r3.zzzz * r6.xyzx + r3.xywx).xyz;
/*43*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*44*/	r1.w = inversesqrt(r1.w);
/*45*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*46*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*47*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*48*/	if(floatBitsToUint(r0.w) != 0u) {
/*49*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*50*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*51*/	  r0.w = r2.w * cb0.data[26].x;
/*52*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*53*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*54*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*55*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*56*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*57*/	}
/*58*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*59*/	if(floatBitsToUint(r0.w) != 0u) {
/*60*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*61*/	  if(floatBitsToUint(r0.w) != 0u) {
/*62*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*63*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*64*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*65*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*66*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*67*/	    r0.w = -r0.w + 1.000000;
/*68*/	    r0.w = max(r0.w, 0.000000);
/*69*/	    r8.z = sqrt(r0.w);
/*70*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*71*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*72*/	    r0.w = inversesqrt(r0.w);
/*73*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*74*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*75*/	    r10.y = -1.000000;
/*76*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*77*/	    r0.w = inversesqrt(r0.w);
/*78*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*79*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*80*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*81*/	    r1.w = r1.w * 1.250000;
/*82*/	    r1.w = min(r1.w, 1.000000);
/*83*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*84*/	    r2.z = r2.z * 4.000000;
/*85*/	    r1.w = r1.w * 0.200000 + r2.z;
/*86*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*87*/	    r0.w = r0.w + -r1.w;
/*88*/	    r0.w = saturate(r0.w * 200.000000);
/*89*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*90*/	    r0.w = r0.w * r0.w;
/*91*/	    r0.w = r0.w * r1.w;
/*92*/	    r2.x = r0.w * -r2.x + r2.x;
/*93*/	    r1.w = -r2.y + 0.200000;
/*94*/	    r2.y = r0.w * r1.w + r2.y;
/*95*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*96*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*97*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*98*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*99*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*100*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*101*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*102*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*103*/	    r1.w = -r1.w + 1.000000;
/*104*/	    r1.w = max(r1.w, 0.000000);
/*105*/	    r7.z = sqrt(r1.w);
/*106*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*107*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*108*/	    r1.w = sqrt(r1.w);
/*109*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*110*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*111*/	    r1.w = inversesqrt(r1.w);
/*112*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*113*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*114*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*115*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*116*/	    r1.w = -r3.y + 1.000000;
/*117*/	    r0.w = min(r0.w, r1.w);
/*118*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*119*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*120*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*121*/	    r0.w = inversesqrt(r0.w);
/*122*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*123*/	  }
/*124*/	}
/*125*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*126*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*127*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*128*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*129*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r2.yzw = (-r0.xxyz + r1.wwww).yzw;
/*131*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*132*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*133*/	r2.yzw = (-r1.xxyz + r1.wwww).yzw;
/*134*/	r1.xyz = (vsOut_T7.zzzz * r2.yzwy + r1.xyzx).xyz;
/*135*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*136*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*137*/	r1.w = inversesqrt(r1.w);
/*138*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*139*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*140*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*141*/	r4.x = inversesqrt(r1.w);
/*142*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*143*/	r4.w = -r2.x + 1.000000;
/*144*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*145*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*146*/	r5.y = r5.y + r5.y;
/*147*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*148*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*149*/	r6.w = r4.w * 1.539380;
/*150*/	r6.w = cos((r6.w));
/*151*/	r6.w = inversesqrt(r6.w);
/*152*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*153*/	r7.x = saturate(r0.w * 60.000000);
/*154*/	r7.x = -r0.w + r7.x;
/*155*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*156*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*157*/	r8.x = inversesqrt(r8.x);
/*158*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*159*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*160*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*161*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*162*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*163*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*164*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*165*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*166*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*167*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*168*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*169*/	r6.y = -r0.w + 1.000000;
/*170*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*171*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*172*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*173*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*174*/	  r6.y = max(r6.y, 0.000000);
/*175*/	  r6.y = log2(r6.y);
/*176*/	  r6.y = r6.y * 10.000000;
/*177*/	  r6.y = exp2(r6.y);
/*178*/	  r6.y = r6.w * r6.y;
/*179*/	  r6.y = r6.y * r7.x + r0.w;
/*180*/	  r8.x = r4.w * 8.000000;
/*181*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*182*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*183*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*184*/	}
/*185*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*186*/	r2.z = max(r2.y, 0.000000);
/*187*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*188*/	if(floatBitsToUint(r2.y) != 0u) {
/*189*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*190*/	  r2.y = max(r2.y, -1.000000);
/*191*/	  r2.y = min(r2.y, 1.000000);
/*192*/	  r2.w = -abs(r2.y) + 1.000000;
/*193*/	  r2.w = sqrt(r2.w);
/*194*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*195*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*196*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*197*/	  r5.z = r2.w * r5.y;
/*198*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*199*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*200*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*201*/	  r2.y = r5.y * r2.w + r2.y;
/*202*/	  r2.x = r2.x * r2.x;
/*203*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*204*/	  r2.x = r2.x * r2.w + r6.x;
/*205*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*206*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*207*/	  r2.w = -r2.x * r2.x + 1.000000;
/*208*/	  r2.w = max(r2.w, 0.001000);
/*209*/	  r2.w = log2(r2.w);
/*210*/	  r5.x = r2.w * 4.950617;
/*211*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*212*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*213*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*214*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*215*/	  r2.x = floatBitsToInt(r2.x);
/*216*/	  r5.x = r2.w * r2.w + -r5.x;
/*217*/	  r5.x = sqrt(r5.x);
/*218*/	  r2.w = -r2.w + r5.x;
/*219*/	  r2.w = max(r2.w, 0.000000);
/*220*/	  r2.w = sqrt(r2.w);
/*221*/	  r2.x = r2.w * r2.x;
/*222*/	  r2.x = r2.x * 1.414214;
/*223*/	  r2.x = 0.008727 / r2.x;
/*224*/	  r2.x = max(r2.x, 0.000100);
/*225*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*226*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*227*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*228*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*229*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*230*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*231*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*232*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*233*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*234*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*235*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*236*/	  r2.x = floatBitsToInt(r2.x);
/*237*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*238*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*239*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*240*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*241*/	  r2.x = r2.x * r5.x + 1.000000;
/*242*/	  r2.x = r2.x * 0.500000;
/*243*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*244*/	  r2.y = r2.y * r5.y + 1.000000;
/*245*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*246*/	  r2.y = min(r2.z, 1.000000);
/*247*/	  r2.w = r4.w * 1.570796;
/*248*/	  r2.w = sin(r2.w);
/*249*/	  r2.y = r2.y + -1.000000;
/*250*/	  r2.y = r2.w * r2.y + 1.000000;
/*251*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*252*/	  r2.w = max(r2.w, 0.000000);
/*253*/	  r2.w = log2(r2.w);
/*254*/	  r2.w = r2.w * 10.000000;
/*255*/	  r2.w = exp2(r2.w);
/*256*/	  r2.w = r6.w * r2.w;
/*257*/	  r2.w = r2.w * r7.x + r0.w;
/*258*/	  r2.x = r2.y * abs(r2.x);
/*259*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*260*/	} else {
/*261*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*262*/	}
/*263*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*264*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*265*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*266*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*267*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*268*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*269*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*270*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*271*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*272*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*273*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*274*/	r2.w = 1.000000;
/*275*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*276*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*277*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*278*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*279*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*280*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*281*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*282*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*283*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*284*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*285*/	if(r0.w != 0) discard;
/*286*/	r0.w = sqrt(r1.w);
/*287*/	r1.x = saturate(cb2.data[0].w)/**/;
/*288*/	r1.x = -r1.x + 1.000000;
/*289*/	r1.x = r1.x * 8.000000 + -4.000000;
/*290*/	r1.y = saturate(cb2.data[1].x)/**/;
/*291*/	r1.y = -r1.y + 1.000000;
/*292*/	r1.y = r1.y * 1000.000000;
/*293*/	r0.w = r0.w / r1.y;
/*294*/	r0.w = r0.w + r1.x;
/*295*/	r0.w = r0.w * 1.442695;
/*296*/	r0.w = exp2(r0.w);
/*297*/	r0.w = cb2.data[1].y / r0.w;
/*298*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*299*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*300*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*301*/	r1.x = r1.x + -cb2.data[1].z;
/*302*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*303*/	r1.x = saturate(r1.y * r1.x);
/*304*/	r1.y = r1.x * -2.000000 + 3.000000;
/*305*/	r1.x = r1.x * r1.x;
/*306*/	r1.x = r1.x * r1.y;
/*307*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*308*/	r1.y = sqrt(r1.y);
/*309*/	r1.z = max(cb2.data[2].z, 0.001000);
/*310*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*311*/	r1.y = r1.z * r1.y;
/*312*/	r1.y = min(r1.y, 1.000000);
/*313*/	r1.z = r1.y * -2.000000 + 3.000000;
/*314*/	r1.y = r1.y * r1.y;
/*315*/	r1.y = r1.y * r1.z;
/*316*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*317*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*318*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*319*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*320*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*321*/	r3.w = max(r3.y, 0.000000);
/*322*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*323*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*324*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*325*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*326*/	r0.w = saturate(r0.w * r1.y);
/*327*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*328*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*329*/	color0.w = 1.000000;
/*330*/	return;
}
