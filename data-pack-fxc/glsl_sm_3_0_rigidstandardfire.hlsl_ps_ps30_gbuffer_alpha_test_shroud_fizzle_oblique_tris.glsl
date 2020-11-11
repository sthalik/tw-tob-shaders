//
//
// Shader Model 4
// Fragment Shader
//
// id: 703 - fxc/glsl_SM_3_0_rigidstandardfire.hlsl_PS_ps30_gbuffer_alpha_test_shroud_fizzle_oblique_tris.glsl
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
flat in uint vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D s_shroud;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

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
/*1*/	r0.y = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb3.data[0].x))) * 0xffffffffu)).x;
/*14*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*15*/	  r1.x = r0.x * r1.x;
/*16*/	}
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r0.x = r1.w + -0.500000;
/*20*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(r0.x != 0) discard;
/*22*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*23*/	r1.xyz = (dFdy(vsOut_T0.zxyz)).xyz;
/*24*/	r3.xyz = (dFdx(vsOut_T0.yzxy)).xyz;
/*25*/	r4.xyz = (r1.xyzx * r3.xyzx).xyz;
/*26*/	r1.xyz = (r1.zxyz * r3.yzxy + -r4.xyzx).xyz;
/*27*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*28*/	r1.w = inversesqrt(r1.w);
/*29*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*30*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*31*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*32*/	r1.w = inversesqrt(r1.w);
/*33*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*34*/	r1.x = dot(vec3(r1.xyzx), vec3(r3.xyzx));
/*35*/	r1.x = saturate(r1.x + r1.x);
/*36*/	r3.xyzw = vsOut_T1.xyxy * vec4(20.000000, 20.000000, 1.200000, 1.500000);
/*37*/	r4.xyzw = (texture(s_dissolve_map, r3.xyxx.st)).xyzw;
/*38*/	r1.x = r1.x + -r4.x;
/*39*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*40*/	if(r1.x != 0) discard;
/*41*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*42*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r5.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*44*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*45*/	r2.w = saturate(vsOut_N0.w);
/*46*/	r6.xyz = (r6.xyzx + -cb4.data[0].xyzx).xyz;
/*47*/	r6.xyz = (r2.wwww * r6.xyzx + cb4.data[0].xyzx).xyz;
/*48*/	r5.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyw;
/*49*/	r5.xyw = (r5.xyxw + -cb4.data[1].xyxz).xyw;
/*50*/	r5.xyw = (r2.wwww * r5.xyxw + cb4.data[1].xyxz).xyw;
/*51*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r5.zzzz), uvec4(0)))).xyz;
/*52*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*53*/	r7.xyz = (r2.wwww * r7.xyzx + cb4.data[2].xyzx).xyz;
/*54*/	r6.xyz = (r6.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*55*/	r0.xyz = (r4.xxxx * r6.xyzx + r0.xyzx).xyz;
/*56*/	r5.xyz = (r5.xywx * r0.xyzx + -r0.xyzx).xyz;
/*57*/	r0.xyz = (r4.yyyy * r5.xyzx + r0.xyzx).xyz;
/*58*/	r4.xyw = (r7.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*59*/	r0.xyz = (r4.zzzz * r4.xywx + r0.xyzx).xyz;
/*60*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*62*/	r4.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*63*/	r2.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*64*/	r2.w = -r2.w + 1.000000;
/*65*/	r2.w = max(r2.w, 0.000000);
/*66*/	r4.z = sqrt(r2.w);
/*67*/	r4.xyz = (mix(r4.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*68*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*69*/	r5.w = 1.000000;
/*70*/	r2.w = dot(r5.xyzw, cb0.data[11].xyzw);
/*71*/	r3.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*72*/	r5.x = 0;
/*73*/	r5.y = cb0.data[26].x * 0.050000;
/*74*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*75*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*76*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*77*/	r3.y = saturate(r5.x * 5.000000);
/*78*/	r3.yzw = (r3.yyyy * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*79*/	r4.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r4.w = saturate(-r4.w * 15.000000 + 1.000000);
/*81*/	r5.x = log2(r6.z);
/*82*/	r5.x = r5.x * 1.800000;
/*83*/	r5.x = exp2(r5.x);
/*84*/	r5.x = r5.x * 10.000000;
/*85*/	r5.x = min(r5.x, 1.000000);
/*86*/	r4.w = r4.w + r5.x;
/*87*/	r4.w = r4.w * 0.500000;
/*88*/	r5.x = -r6.w + 1.000000;
/*89*/	r5.x = log2(r5.x);
/*90*/	r5.x = r5.x * vsOut_T7.x;
/*91*/	r5.x = exp2(r5.x);
/*92*/	r5.x = min(r5.x, 1.000000);
/*93*/	r5.x = r5.x * vsOut_T7.x;
/*94*/	r5.y = r6.z * 0.250000;
/*95*/	r3.yzw = (r3.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r5.yyyy).yzw;
/*96*/	r3.yzw = (r4.wwww * r3.yyzw + r5.yyyy).yzw;
/*97*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*98*/	r0.xyz = (r5.xxxx * r3.yzwy + r0.xyzx).xyz;
/*99*/	r3.y = vsOut_T7.x + -0.025000;
/*100*/	r3.y = max(r3.y, 0.000000);
/*101*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*102*/	r0.xyz = (r3.yyyy * r5.xyzx + r0.xyzx).xyz;
/*103*/	r3.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*104*/	r3.y = inversesqrt(r3.y);
/*105*/	r3.yzw = (r3.yyyy * vsOut_T3.xxyz).yzw;
/*106*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*107*/	r4.w = inversesqrt(r4.w);
/*108*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*109*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*110*/	r4.w = inversesqrt(r4.w);
/*111*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*112*/	r7.xyz = (r4.yyyy * r5.xyzx).xyz;
/*113*/	r4.xyw = (r4.xxxx * r3.yzyw + r7.xyxz).xyw;
/*114*/	r4.xyz = (r4.zzzz * r6.xyzx + r4.xywx).xyz;
/*115*/	r4.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*116*/	r4.w = inversesqrt(r4.w);
/*117*/	r4.xyz = (r4.wwww * r4.xyzx).xyz;
/*118*/	r4.xyz = (mix(r4.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*119*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*120*/	if(floatBitsToUint(r0.w) != 0u) {
/*121*/	  r0.w = uintBitsToFloat((0.990000 < r4.y) ? 0xffffffffu : 0x00000000u);
/*122*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*123*/	  r0.w = r7.y * cb0.data[26].x;
/*124*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*125*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*126*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*127*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*128*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*129*/	}
/*130*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*131*/	if(floatBitsToUint(r0.w) != 0u) {
/*132*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*133*/	  if(floatBitsToUint(r0.w) != 0u) {
/*134*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*135*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*136*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*137*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*138*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*139*/	    r0.w = -r0.w + 1.000000;
/*140*/	    r0.w = max(r0.w, 0.000000);
/*141*/	    r8.z = sqrt(r0.w);
/*142*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r4.xyzx).xyz;
/*143*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*144*/	    r0.w = inversesqrt(r0.w);
/*145*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*146*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*147*/	    r10.y = -1.000000;
/*148*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*149*/	    r0.w = inversesqrt(r0.w);
/*150*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*151*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*152*/	    r4.w = cb2.data[1].x * cb2.data[1].x;
/*153*/	    r4.w = r4.w * 1.250000;
/*154*/	    r4.w = min(r4.w, 1.000000);
/*155*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*156*/	    r5.w = r5.w * 4.000000;
/*157*/	    r4.w = r4.w * 0.200000 + r5.w;
/*158*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*159*/	    r0.w = r0.w + -r4.w;
/*160*/	    r0.w = saturate(r0.w * 200.000000);
/*161*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*162*/	    r0.w = r0.w * r0.w;
/*163*/	    r0.w = r0.w * r4.w;
/*164*/	    r1.w = r0.w * -r1.w + r1.w;
/*165*/	    r4.w = -r1.x + 0.200000;
/*166*/	    r1.x = r0.w * r4.w + r1.x;
/*167*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*168*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*169*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*170*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*171*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*172*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*173*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*174*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*175*/	    r4.w = -r4.w + 1.000000;
/*176*/	    r4.w = max(r4.w, 0.000000);
/*177*/	    r7.z = sqrt(r4.w);
/*178*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*179*/	    r4.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*180*/	    r4.w = sqrt(r4.w);
/*181*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*182*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*183*/	    r4.w = inversesqrt(r4.w);
/*184*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*185*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*186*/	    r3.yzw = (r7.xxxx * r3.yyzw + r5.xxyz).yzw;
/*187*/	    r3.yzw = (r7.zzzz * r6.xxyz + r3.yyzw).yzw;
/*188*/	    r4.w = -r4.y + 1.000000;
/*189*/	    r0.w = min(r0.w, r4.w);
/*190*/	    r3.yzw = (-r4.xxyz + r3.yyzw).yzw;
/*191*/	    r3.yzw = (r0.wwww * r3.yyzw + r4.xxyz).yzw;
/*192*/	    r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*193*/	    r0.w = inversesqrt(r0.w);
/*194*/	    r4.xyz = (r0.wwww * r3.yzwy).xyz;
/*195*/	  }
/*196*/	}
/*197*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*198*/	if(floatBitsToUint(r0.w) != 0u) {
/*199*/	  r5.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*200*/	  r6.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*201*/	  r5.xyzw = r5.xyzw / r6.xyzw;
/*202*/	  r6.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*203*/	  r5.xyzw = r5.xyzw * r6.xyzw + cb1.data[4].xyxy;
/*204*/	  r6.xyzw = (textureLod(s_shroud, r5.zwzz.st, r5.w)).xyzw;
/*205*/	  r5.xyzw = r5.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*206*/	  r5.xyzw = saturate(r5.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*207*/	  r7.xyzw = r5.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*208*/	  r5.xyzw = r5.xyzw * r5.xyzw;
/*209*/	  r5.xyzw = r5.xyzw * r7.xyzw;
/*210*/	  r0.w = r6.x * r5.x;
/*211*/	  r0.w = r0.w * r5.y;
/*212*/	  r0.w = r5.z * -r0.w + r0.w;
/*213*/	  r0.w = r5.w * -r0.w + r0.w;
/*214*/	} else {
/*215*/	  r0.w = 1.000000;
/*216*/	}
/*217*/	r3.yz = (r0.wwww + vec4(0.000000, -0.100000, -0.500000, 0.000000)).yz;
/*218*/	r0.w = saturate(r3.y * 2.500000);
/*219*/	r3.y = r0.w * -2.000000 + 3.000000;
/*220*/	r0.w = r0.w * r0.w;
/*221*/	r0.w = r0.w * r3.y;
/*222*/	r3.y = saturate(r3.z + r3.z);
/*223*/	r3.z = r3.y * -2.000000 + 3.000000;
/*224*/	r3.y = r3.y * r3.y;
/*225*/	r3.y = r3.y * r3.z;
/*226*/	r0.w = r0.w * 0.200000;
/*227*/	r5.xyz = saturate(r0.wwww * r0.xyzx).xyz;
/*228*/	r0.xyz = (r0.xyzx + -r5.xyzx).xyz;
/*229*/	r0.xyz = (r3.yyyy * r0.xyzx + r5.xyzx).xyz;
/*230*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*231*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*232*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*233*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*234*/	r3.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*235*/	r3.yzw = (-r0.xxyz + r3.yyyy).yzw;
/*236*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*237*/	r3.y = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*238*/	r3.yzw = (-r2.xxyz + r3.yyyy).yzw;
/*239*/	r5.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*240*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*241*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*242*/	r2.x = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*243*/	r2.x = inversesqrt(r2.x);
/*244*/	r2.xyz = (r2.xxxx * r4.xyzx).xyz;
/*245*/	color3.x = r2.w / r3.x;
/*246*/	r2.w = max(abs(r2.z), abs(r2.y));
/*247*/	r2.w = max(r2.w, abs(r2.x));
/*248*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*249*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*250*/	color0.xyzw = saturate(r1.xyzw);
/*251*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*252*/	r5.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*253*/	color2.xyzw = saturate(r5.xyzw);
/*254*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*255*/	color4 = vsOut_P1;
/*256*/	return;
}
