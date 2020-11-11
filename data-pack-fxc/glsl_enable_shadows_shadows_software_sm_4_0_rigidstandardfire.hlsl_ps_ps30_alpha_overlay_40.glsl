//
//
// Shader Model 4
// Fragment Shader
//
// id: 4694 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandardfire.hlsl_PS_ps30_alpha_overlay_40.glsl
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

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
/*27*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*29*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*30*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*31*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*32*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*33*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*35*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*37*/	r1.w = -r1.w + 1.000000;
/*38*/	r1.w = max(r1.w, 0.000000);
/*39*/	r1.z = sqrt(r1.w);
/*40*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*42*/	r4.x = 0;
/*43*/	r4.y = cb0.data[26].x * 0.050000;
/*44*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*45*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*46*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*47*/	r1.w = saturate(r4.x * 5.000000);
/*48*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*49*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*50*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*51*/	r2.w = log2(r5.z);
/*52*/	r2.w = r2.w * 1.800000;
/*53*/	r2.w = exp2(r2.w);
/*54*/	r2.w = r2.w * 10.000000;
/*55*/	r2.w = min(r2.w, 1.000000);
/*56*/	r1.w = r1.w + r2.w;
/*57*/	r1.w = r1.w * 0.500000;
/*58*/	r2.w = -r5.w + 1.000000;
/*59*/	r2.w = log2(r2.w);
/*60*/	r2.w = r2.w * vsOut_T7.x;
/*61*/	r2.w = exp2(r2.w);
/*62*/	r2.w = min(r2.w, 1.000000);
/*63*/	r2.w = r2.w * vsOut_T7.x;
/*64*/	r3.z = r5.z * 0.250000;
/*65*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*66*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*67*/	r4.xyz = (-r0.xywx + r4.xyzx).xyz;
/*68*/	r0.xyw = (r2.wwww * r4.xyxz + r0.xyxw).xyw;
/*69*/	r1.w = vsOut_T7.x + -0.025000;
/*70*/	r1.w = max(r1.w, 0.000000);
/*71*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*72*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*73*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*74*/	r1.w = inversesqrt(r1.w);
/*75*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*76*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*79*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*82*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*83*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*84*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*85*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*86*/	r1.w = inversesqrt(r1.w);
/*87*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*88*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*89*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*90*/	if(floatBitsToUint(r0.z) != 0u) {
/*91*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*92*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*93*/	  r0.z = r3.w * cb0.data[26].x;
/*94*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*95*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*96*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*97*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*98*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*99*/	}
/*100*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*101*/	if(floatBitsToUint(r0.z) != 0u) {
/*102*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*103*/	  if(floatBitsToUint(r0.z) != 0u) {
/*104*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*105*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*106*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*107*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*108*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*109*/	    r0.z = -r0.z + 1.000000;
/*110*/	    r0.z = max(r0.z, 0.000000);
/*111*/	    r8.z = sqrt(r0.z);
/*112*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*113*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*114*/	    r0.z = inversesqrt(r0.z);
/*115*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*116*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*117*/	    r10.y = -1.000000;
/*118*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*119*/	    r0.z = inversesqrt(r0.z);
/*120*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*121*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*122*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*123*/	    r1.w = r1.w * 1.250000;
/*124*/	    r1.w = min(r1.w, 1.000000);
/*125*/	    r2.w = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*126*/	    r2.w = r2.w * 4.000000;
/*127*/	    r1.w = r1.w * 0.200000 + r2.w;
/*128*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*129*/	    r0.z = r0.z + -r1.w;
/*130*/	    r0.z = saturate(r0.z * 200.000000);
/*131*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*132*/	    r0.z = r0.z * r0.z;
/*133*/	    r0.z = r0.z * r1.w;
/*134*/	    r3.x = r0.z * -r3.x + r3.x;
/*135*/	    r1.w = -r3.y + 0.200000;
/*136*/	    r3.y = r0.z * r1.w + r3.y;
/*137*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*138*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*139*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*140*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*141*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*142*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*143*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*144*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*145*/	    r1.w = -r1.w + 1.000000;
/*146*/	    r1.w = max(r1.w, 0.000000);
/*147*/	    r7.z = sqrt(r1.w);
/*148*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*149*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*150*/	    r1.w = sqrt(r1.w);
/*151*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*152*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*153*/	    r1.w = inversesqrt(r1.w);
/*154*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*155*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*156*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*157*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*158*/	    r1.w = -r1.y + 1.000000;
/*159*/	    r0.z = min(r0.z, r1.w);
/*160*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*161*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*162*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*163*/	    r0.z = inversesqrt(r0.z);
/*164*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*165*/	  }
/*166*/	}
/*167*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*168*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*169*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*170*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*171*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*172*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*173*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*174*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*175*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*176*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*177*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*178*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*179*/	r1.w = inversesqrt(r1.w);
/*180*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*181*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*182*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*183*/	r2.w = inversesqrt(r1.w);
/*184*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*185*/	r2.w = -r3.x + 1.000000;
/*186*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*187*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*188*/	r5.y = r5.y + r5.y;
/*189*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*190*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*191*/	r6.w = r2.w * 1.539380;
/*192*/	r6.w = cos((r6.w));
/*193*/	r6.w = inversesqrt(r6.w);
/*194*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*195*/	r7.x = saturate(r0.z * 60.000000);
/*196*/	r7.x = -r0.z + r7.x;
/*197*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*198*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*199*/	r8.x = inversesqrt(r8.x);
/*200*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*201*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*202*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*203*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*204*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*205*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*206*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*207*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*208*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*209*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*210*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*211*/	r6.y = -r0.z + 1.000000;
/*212*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*213*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*214*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*215*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*216*/	  r6.y = max(r6.y, 0.000000);
/*217*/	  r6.y = log2(r6.y);
/*218*/	  r6.y = r6.y * 10.000000;
/*219*/	  r6.y = exp2(r6.y);
/*220*/	  r6.y = r6.w * r6.y;
/*221*/	  r6.y = r6.y * r7.x + r0.z;
/*222*/	  r8.x = r2.w * 8.000000;
/*223*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*224*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*225*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*226*/	}
/*227*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*228*/	r1.y = max(r1.x, 0.000000);
/*229*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*230*/	if(floatBitsToUint(r1.x) != 0u) {
/*231*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*232*/	  r1.x = max(r1.x, -1.000000);
/*233*/	  r1.x = min(r1.x, 1.000000);
/*234*/	  r1.z = -abs(r1.x) + 1.000000;
/*235*/	  r1.z = sqrt(r1.z);
/*236*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*237*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*238*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*239*/	  r5.z = r1.z * r5.y;
/*240*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*241*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*242*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*243*/	  r1.x = r5.y * r1.z + r1.x;
/*244*/	  r1.z = r3.x * r3.x;
/*245*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*246*/	  r1.z = r1.z * r3.x + r6.x;
/*247*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*248*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*249*/	  r3.x = -r1.z * r1.z + 1.000000;
/*250*/	  r3.x = max(r3.x, 0.001000);
/*251*/	  r3.x = log2(r3.x);
/*252*/	  r5.x = r3.x * 4.950617;
/*253*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*254*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*255*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*256*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*257*/	  r1.z = floatBitsToInt(r1.z);
/*258*/	  r5.x = r3.x * r3.x + -r5.x;
/*259*/	  r5.x = sqrt(r5.x);
/*260*/	  r3.x = -r3.x + r5.x;
/*261*/	  r3.x = max(r3.x, 0.000000);
/*262*/	  r3.x = sqrt(r3.x);
/*263*/	  r1.z = r1.z * r3.x;
/*264*/	  r1.z = r1.z * 1.414214;
/*265*/	  r1.z = 0.008727 / r1.z;
/*266*/	  r1.z = max(r1.z, 0.000100);
/*267*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*268*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*269*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*270*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*271*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*272*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*273*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*274*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*275*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*276*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*277*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*278*/	  r1.x = floatBitsToInt(r1.x);
/*279*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*280*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*281*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*282*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*283*/	  r1.x = r1.x * r5.x + 1.000000;
/*284*/	  r1.x = r1.x * 0.500000;
/*285*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*286*/	  r1.z = r1.z * r5.y + 1.000000;
/*287*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*288*/	  r1.z = min(r1.y, 1.000000);
/*289*/	  r2.w = r2.w * 1.570796;
/*290*/	  r2.w = sin(r2.w);
/*291*/	  r1.z = r1.z + -1.000000;
/*292*/	  r1.z = r2.w * r1.z + 1.000000;
/*293*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*294*/	  r2.w = max(r2.w, 0.000000);
/*295*/	  r2.w = log2(r2.w);
/*296*/	  r2.w = r2.w * 10.000000;
/*297*/	  r2.w = exp2(r2.w);
/*298*/	  r2.w = r6.w * r2.w;
/*299*/	  r2.w = r2.w * r7.x + r0.z;
/*300*/	  r1.x = r1.z * abs(r1.x);
/*301*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*302*/	} else {
/*303*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*304*/	}
/*305*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*306*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*307*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*308*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*309*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*310*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*311*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*312*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*313*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*314*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*315*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*316*/	r2.w = 1.000000;
/*317*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*318*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*319*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*320*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*321*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*322*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*323*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*324*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*325*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*326*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*327*/	if(r0.w != 0) discard;
/*328*/	r0.w = sqrt(r1.w);
/*329*/	r1.x = saturate(cb2.data[0].w)/**/;
/*330*/	r1.x = -r1.x + 1.000000;
/*331*/	r1.x = r1.x * 8.000000 + -4.000000;
/*332*/	r1.y = saturate(cb2.data[1].x)/**/;
/*333*/	r1.y = -r1.y + 1.000000;
/*334*/	r1.y = r1.y * 1000.000000;
/*335*/	r0.w = r0.w / r1.y;
/*336*/	r0.w = r0.w + r1.x;
/*337*/	r0.w = r0.w * 1.442695;
/*338*/	r0.w = exp2(r0.w);
/*339*/	r0.w = cb2.data[1].y / r0.w;
/*340*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*341*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*342*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*343*/	r1.x = r1.x + -cb2.data[1].z;
/*344*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*345*/	r1.x = saturate(r1.y * r1.x);
/*346*/	r1.y = r1.x * -2.000000 + 3.000000;
/*347*/	r1.x = r1.x * r1.x;
/*348*/	r1.x = r1.x * r1.y;
/*349*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*350*/	r1.y = sqrt(r1.y);
/*351*/	r1.z = max(cb2.data[2].z, 0.001000);
/*352*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*353*/	r1.y = r1.z * r1.y;
/*354*/	r1.y = min(r1.y, 1.000000);
/*355*/	r1.z = r1.y * -2.000000 + 3.000000;
/*356*/	r1.y = r1.y * r1.y;
/*357*/	r1.y = r1.y * r1.z;
/*358*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*359*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*360*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*361*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*362*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*363*/	r4.w = max(r4.y, 0.000000);
/*364*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*365*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*366*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*367*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*368*/	r0.w = saturate(r0.w * r1.y);
/*369*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*370*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*371*/	return;
}
