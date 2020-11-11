//
//
// Shader Model 4
// Fragment Shader
//
// id: 750 - fxc/glsl_SM_3_0_rigidstandardblood.hlsl_PS_ps30_gbuffer_alpha_test_shroud_fizzle_oblique_tris.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*17*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*18*/	r0.x = r1.w + -0.500000;
/*19*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r0.x != 0) discard;
/*21*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*22*/	r1.xyz = (dFdy(vsOut_T0.zxyz)).xyz;
/*23*/	r2.xyz = (dFdx(vsOut_T0.yzxy)).xyz;
/*24*/	r3.xyz = (r1.xyzx * r2.xyzx).xyz;
/*25*/	r1.xyz = (r1.zxyz * r2.yzxy + -r3.xyzx).xyz;
/*26*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*27*/	r1.w = inversesqrt(r1.w);
/*28*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*29*/	r2.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*30*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*31*/	r1.w = inversesqrt(r1.w);
/*32*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*33*/	r1.x = dot(vec3(r1.xyzx), vec3(r2.xyzx));
/*34*/	r1.x = saturate(r1.x + r1.x);
/*35*/	r1.yz = (vsOut_T1.xxyx * vec4(0.000000, 20.000000, 20.000000, 0.000000)).yz;
/*36*/	r2.xyzw = (texture(s_dissolve_map, r1.yzyy.st)).xyzw;
/*37*/	r1.x = r1.x + -r2.x;
/*38*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*39*/	if(r1.x != 0) discard;
/*40*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*41*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*42*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*43*/	r1.w = saturate(vsOut_N0.w);
/*44*/	r3.xyz = (r3.xyzx + -cb4.data[0].xyzx).xyz;
/*45*/	r3.xyz = (r1.wwww * r3.xyzx + cb4.data[0].xyzx).xyz;
/*46*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*47*/	r2.xyw = (r2.xyxw + -cb4.data[1].xyxz).xyw;
/*48*/	r2.xyw = (r1.wwww * r2.xyxw + cb4.data[1].xyxz).xyw;
/*49*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*50*/	r4.xyz = (r4.xyzx + -cb4.data[2].xyzx).xyz;
/*51*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[2].xyzx).xyz;
/*52*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*53*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*54*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*55*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*56*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*57*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*58*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*59*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*60*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*61*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*62*/	r1.w = -r1.w + 1.000000;
/*63*/	r1.w = max(r1.w, 0.000000);
/*64*/	r1.z = sqrt(r1.w);
/*65*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*66*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*67*/	r2.w = 1.000000;
/*68*/	r1.w = dot(r2.xyzw, cb0.data[11].xyzw);
/*69*/	r2.x = dot(r2.xyzw, cb0.data[12].xyzw);
/*70*/	r2.yz = (vsOut_T1.xxyx * cb3.data[2].xxyx).yz;
/*71*/	r2.yz = (r2.yyzy * vec4(0.000000, 0.750000, 0.750000, 0.000000) + vsOut_T6.yyzy).yz;
/*72*/	r3.xyzw = (texture(s_decal_blood_map, r2.yzyy.st)).xyzw;
/*73*/	r2.y = -vsOut_T7.w * 0.900000 + 1.000000;
/*74*/	r2.y = saturate(-r2.y + r3.w);
/*75*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r2.y) != 0u) {
/*77*/	  r2.y = -r3.w + 1.000000;
/*78*/	  r2.y = saturate(vsOut_T7.w * 0.900000 + -r2.y);
/*79*/	  r2.y = -r2.y + 1.000000;
/*80*/	  r2.y = -r2.y * r2.y + 1.000000;
/*81*/	  r2.y = r2.y * -0.600000 + 1.000000;
/*82*/	  r2.yzw = (r2.yyyy * vec4(0.000000, 0.240000, 0.000000, 0.000000)).yzw;
/*83*/	  r3.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*84*/	  r3.x = uintBitsToFloat((r3.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*85*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3f800000u));
/*86*/	  r3.yzw = (r0.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r2.yyww).yzw;
/*87*/	  r0.xyz = (r3.xxxx * r3.yzwy + r2.yzwy).xyz;
/*88*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*89*/	  r4.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*90*/	} else {
/*91*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*92*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*93*/	}
/*94*/	r2.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*95*/	r2.y = inversesqrt(r2.y);
/*96*/	r2.yzw = (r2.yyyy * vsOut_T3.xxyz).yzw;
/*97*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*98*/	r3.w = inversesqrt(r3.w);
/*99*/	r5.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*100*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*101*/	r3.w = inversesqrt(r3.w);
/*102*/	r6.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*103*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*104*/	r7.xyz = (r1.xxxx * r2.yzwy + r7.xyzx).xyz;
/*105*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*106*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*107*/	r3.w = inversesqrt(r3.w);
/*108*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*109*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*110*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*111*/	if(floatBitsToUint(r0.w) != 0u) {
/*112*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*113*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*114*/	  r0.w = r7.y * cb0.data[26].x;
/*115*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*116*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*117*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*118*/	  r3.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*119*/	  r4.xw = (r4.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*120*/	}
/*121*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*122*/	if(floatBitsToUint(r0.w) != 0u) {
/*123*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*124*/	  if(floatBitsToUint(r0.w) != 0u) {
/*125*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*126*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*127*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*128*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*129*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*130*/	    r0.w = -r0.w + 1.000000;
/*131*/	    r0.w = max(r0.w, 0.000000);
/*132*/	    r8.z = sqrt(r0.w);
/*133*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*134*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*135*/	    r0.w = inversesqrt(r0.w);
/*136*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*137*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*138*/	    r10.y = -1.000000;
/*139*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*140*/	    r0.w = inversesqrt(r0.w);
/*141*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*142*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*143*/	    r3.w = cb2.data[1].x * cb2.data[1].x;
/*144*/	    r3.w = r3.w * 1.250000;
/*145*/	    r3.w = min(r3.w, 1.000000);
/*146*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*147*/	    r5.w = r5.w * 4.000000;
/*148*/	    r3.w = r3.w * 0.200000 + r5.w;
/*149*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*150*/	    r0.w = r0.w + -r3.w;
/*151*/	    r0.w = saturate(r0.w * 200.000000);
/*152*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*153*/	    r0.w = r0.w * r0.w;
/*154*/	    r0.w = r0.w * r3.w;
/*155*/	    r4.w = r0.w * -r4.w + r4.w;
/*156*/	    r3.w = -r4.x + 0.200000;
/*157*/	    r4.x = r0.w * r3.w + r4.x;
/*158*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*159*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*160*/	    r9.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*161*/	    r3.xyz = (r0.wwww * r9.xyzx + r3.xyzx).xyz;
/*162*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*163*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*164*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*165*/	    r3.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*166*/	    r3.w = -r3.w + 1.000000;
/*167*/	    r3.w = max(r3.w, 0.000000);
/*168*/	    r7.z = sqrt(r3.w);
/*169*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*170*/	    r3.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*171*/	    r3.w = sqrt(r3.w);
/*172*/	    r7.xyz = (r8.xyzx * r3.wwww + r7.xyzx).xyz;
/*173*/	    r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*174*/	    r3.w = inversesqrt(r3.w);
/*175*/	    r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*176*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*177*/	    r2.yzw = (r7.xxxx * r2.yyzw + r5.xxyz).yzw;
/*178*/	    r2.yzw = (r7.zzzz * r6.xxyz + r2.yyzw).yzw;
/*179*/	    r3.w = -r1.y + 1.000000;
/*180*/	    r0.w = min(r0.w, r3.w);
/*181*/	    r2.yzw = (-r1.xxyz + r2.yyzw).yzw;
/*182*/	    r2.yzw = (r0.wwww * r2.yyzw + r1.xxyz).yzw;
/*183*/	    r0.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*184*/	    r0.w = inversesqrt(r0.w);
/*185*/	    r1.xyz = (r0.wwww * r2.yzwy).xyz;
/*186*/	  }
/*187*/	}
/*188*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*189*/	if(floatBitsToUint(r0.w) != 0u) {
/*190*/	  r5.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*191*/	  r6.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*192*/	  r5.xyzw = r5.xyzw / r6.xyzw;
/*193*/	  r6.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*194*/	  r5.xyzw = r5.xyzw * r6.xyzw + cb1.data[4].xyxy;
/*195*/	  r6.xyzw = (textureLod(s_shroud, r5.zwzz.st, r5.w)).xyzw;
/*196*/	  r5.xyzw = r5.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*197*/	  r5.xyzw = saturate(r5.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*198*/	  r7.xyzw = r5.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*199*/	  r5.xyzw = r5.xyzw * r5.xyzw;
/*200*/	  r5.xyzw = r5.xyzw * r7.xyzw;
/*201*/	  r0.w = r6.x * r5.x;
/*202*/	  r0.w = r0.w * r5.y;
/*203*/	  r0.w = r5.z * -r0.w + r0.w;
/*204*/	  r0.w = r5.w * -r0.w + r0.w;
/*205*/	} else {
/*206*/	  r0.w = 1.000000;
/*207*/	}
/*208*/	r2.yz = (r0.wwww + vec4(0.000000, -0.100000, -0.500000, 0.000000)).yz;
/*209*/	r0.w = saturate(r2.y * 2.500000);
/*210*/	r2.y = r0.w * -2.000000 + 3.000000;
/*211*/	r0.w = r0.w * r0.w;
/*212*/	r0.w = r0.w * r2.y;
/*213*/	r2.y = saturate(r2.z + r2.z);
/*214*/	r2.z = r2.y * -2.000000 + 3.000000;
/*215*/	r2.y = r2.y * r2.y;
/*216*/	r2.y = r2.y * r2.z;
/*217*/	r0.w = r0.w * 0.200000;
/*218*/	r5.xyz = saturate(r0.wwww * r0.xyzx).xyz;
/*219*/	r0.xyz = (r0.xyzx + -r5.xyzx).xyz;
/*220*/	r0.xyz = (r2.yyyy * r0.xyzx + r5.xyzx).xyz;
/*221*/	r0.w = vsOut_T7.y * -r4.x + r4.x;
/*222*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*223*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*224*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*225*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*226*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*227*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*228*/	r2.y = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*229*/	r2.yzw = (-r3.xxyz + r2.yyyy).yzw;
/*230*/	r3.xyz = (vsOut_T7.zzzz * r2.yzwy + r3.xyzx).xyz;
/*231*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*232*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*233*/	r2.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*234*/	r2.y = inversesqrt(r2.y);
/*235*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*236*/	color3.x = r1.w / r2.x;
/*237*/	r1.w = max(abs(r1.z), abs(r1.y));
/*238*/	r1.w = max(r1.w, abs(r1.x));
/*239*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*240*/	r4.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*241*/	color0.xyzw = saturate(r4.xyzw);
/*242*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*243*/	r3.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*244*/	color2.xyzw = saturate(r3.xyzw);
/*245*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*246*/	color4 = vsOut_P1;
/*247*/	return;
}
