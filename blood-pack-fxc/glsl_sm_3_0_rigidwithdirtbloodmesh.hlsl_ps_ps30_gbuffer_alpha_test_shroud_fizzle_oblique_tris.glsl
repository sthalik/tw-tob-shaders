//
//
// Shader Model 4
// Fragment Shader
//
// id: 1227 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_gbuffer_alpha_test_shroud_fizzle_oblique_tris.glsl
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
uniform sampler2D s_snow_normals;
uniform sampler2D s_shroud;
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
/*70*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*71*/	r2.yz = (vsOut_T1.xxyx * cb3.data[2].xxyx).yz;
/*72*/	r3.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*73*/	r4.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*74*/	r3.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*75*/	r2.w = r3.w * r4.w;
/*76*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*77*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*78*/	r1.xy = (r3.xyxx * r3.wwww + r1.xyxx).xy;
/*79*/	r3.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*80*/	r3.x = inversesqrt(r3.x);
/*81*/	r1.xyz = (r1.xyzx * r3.xxxx).xyz;
/*82*/	r2.yz = (r2.yyzy * vec4(0.000000, 0.750000, 0.750000, 0.000000) + vsOut_T6.yyzy).yz;
/*83*/	r3.xyzw = (texture(s_decal_blood_map, r2.yzyy.st)).xyzw;
/*84*/	r2.y = -vsOut_T7.w * 0.900000 + 1.000000;
/*85*/	r2.y = saturate(-r2.y + r3.w);
/*86*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*87*/	if(floatBitsToUint(r2.y) != 0u) {
/*88*/	  r2.y = -r3.w + 1.000000;
/*89*/	  r2.y = saturate(vsOut_T7.w * 0.900000 + -r2.y);
/*90*/	  r2.y = -r2.y + 1.000000;
/*91*/	  r2.y = -r2.y * r2.y + 1.000000;
/*92*/	  r2.y = r2.y * -0.600000 + 1.000000;
/*93*/	  r3.xyz = (r2.yyyy * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*94*/	  r2.y = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*95*/	  r2.y = uintBitsToFloat((r2.y < 0.225000) ? 0xffffffffu : 0x00000000u);
/*96*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(0x3f800000u));
/*97*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*98*/	  r0.xyz = (r2.yyyy * r4.xyzx + r3.xyzx).xyz;
/*99*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*100*/	  r4.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*101*/	} else {
/*102*/	  r5.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*103*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*104*/	  r2.yzw = (r2.wwww * r5.xxyz).yzw;
/*105*/	  r3.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r5.xyzx).xyz;
/*106*/	}
/*107*/	r2.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*108*/	r2.y = inversesqrt(r2.y);
/*109*/	r2.yzw = (r2.yyyy * vsOut_T3.xxyz).yzw;
/*110*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*111*/	r3.w = inversesqrt(r3.w);
/*112*/	r5.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*113*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*114*/	r3.w = inversesqrt(r3.w);
/*115*/	r6.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*116*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*117*/	r7.xyz = (r1.xxxx * r2.yzwy + r7.xyzx).xyz;
/*118*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*119*/	r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*120*/	r3.w = inversesqrt(r3.w);
/*121*/	r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*122*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*123*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*124*/	if(floatBitsToUint(r0.w) != 0u) {
/*125*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*126*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*127*/	  r0.w = r7.y * cb0.data[26].x;
/*128*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*129*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*130*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*131*/	  r3.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*132*/	  r4.xw = (r4.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*133*/	}
/*134*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*135*/	if(floatBitsToUint(r0.w) != 0u) {
/*136*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*137*/	  if(floatBitsToUint(r0.w) != 0u) {
/*138*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*139*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*140*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*141*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*142*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*143*/	    r0.w = -r0.w + 1.000000;
/*144*/	    r0.w = max(r0.w, 0.000000);
/*145*/	    r8.z = sqrt(r0.w);
/*146*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*147*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*148*/	    r0.w = inversesqrt(r0.w);
/*149*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*150*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*151*/	    r10.y = -1.000000;
/*152*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*153*/	    r0.w = inversesqrt(r0.w);
/*154*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*155*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*156*/	    r3.w = cb2.data[1].x * cb2.data[1].x;
/*157*/	    r3.w = r3.w * 1.250000;
/*158*/	    r3.w = min(r3.w, 1.000000);
/*159*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*160*/	    r5.w = r5.w * 4.000000;
/*161*/	    r3.w = r3.w * 0.200000 + r5.w;
/*162*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*163*/	    r0.w = r0.w + -r3.w;
/*164*/	    r0.w = saturate(r0.w * 200.000000);
/*165*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*166*/	    r0.w = r0.w * r0.w;
/*167*/	    r0.w = r0.w * r3.w;
/*168*/	    r4.w = r0.w * -r4.w + r4.w;
/*169*/	    r3.w = -r4.x + 0.200000;
/*170*/	    r4.x = r0.w * r3.w + r4.x;
/*171*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*172*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*173*/	    r9.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*174*/	    r3.xyz = (r0.wwww * r9.xyzx + r3.xyzx).xyz;
/*175*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*176*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*177*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*178*/	    r3.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*179*/	    r3.w = -r3.w + 1.000000;
/*180*/	    r3.w = max(r3.w, 0.000000);
/*181*/	    r7.z = sqrt(r3.w);
/*182*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*183*/	    r3.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*184*/	    r3.w = sqrt(r3.w);
/*185*/	    r7.xyz = (r8.xyzx * r3.wwww + r7.xyzx).xyz;
/*186*/	    r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*187*/	    r3.w = inversesqrt(r3.w);
/*188*/	    r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*189*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*190*/	    r2.yzw = (r7.xxxx * r2.yyzw + r5.xxyz).yzw;
/*191*/	    r2.yzw = (r7.zzzz * r6.xxyz + r2.yyzw).yzw;
/*192*/	    r3.w = -r1.y + 1.000000;
/*193*/	    r0.w = min(r0.w, r3.w);
/*194*/	    r2.yzw = (-r1.xxyz + r2.yyzw).yzw;
/*195*/	    r2.yzw = (r0.wwww * r2.yyzw + r1.xxyz).yzw;
/*196*/	    r0.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*197*/	    r0.w = inversesqrt(r0.w);
/*198*/	    r1.xyz = (r0.wwww * r2.yzwy).xyz;
/*199*/	  }
/*200*/	}
/*201*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*202*/	if(floatBitsToUint(r0.w) != 0u) {
/*203*/	  r5.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*204*/	  r6.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*205*/	  r5.xyzw = r5.xyzw / r6.xyzw;
/*206*/	  r6.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*207*/	  r5.xyzw = r5.xyzw * r6.xyzw + cb1.data[4].xyxy;
/*208*/	  r6.xyzw = (textureLod(s_shroud, r5.zwzz.st, r5.w)).xyzw;
/*209*/	  r5.xyzw = r5.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*210*/	  r5.xyzw = saturate(r5.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*211*/	  r7.xyzw = r5.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*212*/	  r5.xyzw = r5.xyzw * r5.xyzw;
/*213*/	  r5.xyzw = r5.xyzw * r7.xyzw;
/*214*/	  r0.w = r6.x * r5.x;
/*215*/	  r0.w = r0.w * r5.y;
/*216*/	  r0.w = r5.z * -r0.w + r0.w;
/*217*/	  r0.w = r5.w * -r0.w + r0.w;
/*218*/	} else {
/*219*/	  r0.w = 1.000000;
/*220*/	}
/*221*/	r2.yz = (r0.wwww + vec4(0.000000, -0.100000, -0.500000, 0.000000)).yz;
/*222*/	r0.w = saturate(r2.y * 2.500000);
/*223*/	r2.y = r0.w * -2.000000 + 3.000000;
/*224*/	r0.w = r0.w * r0.w;
/*225*/	r0.w = r0.w * r2.y;
/*226*/	r2.y = saturate(r2.z + r2.z);
/*227*/	r2.z = r2.y * -2.000000 + 3.000000;
/*228*/	r2.y = r2.y * r2.y;
/*229*/	r2.y = r2.y * r2.z;
/*230*/	r0.w = r0.w * 0.200000;
/*231*/	r5.xyz = saturate(r0.wwww * r0.xyzx).xyz;
/*232*/	r0.xyz = (r0.xyzx + -r5.xyzx).xyz;
/*233*/	r0.xyz = (r2.yyyy * r0.xyzx + r5.xyzx).xyz;
/*234*/	r0.w = vsOut_T7.y * -r4.x + r4.x;
/*235*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*236*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*237*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*238*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*239*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*240*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*241*/	r2.y = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*242*/	r2.yzw = (-r3.xxyz + r2.yyyy).yzw;
/*243*/	r3.xyz = (vsOut_T7.zzzz * r2.yzwy + r3.xyzx).xyz;
/*244*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*245*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*246*/	r2.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*247*/	r2.y = inversesqrt(r2.y);
/*248*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*249*/	color3.x = r1.w / r2.x;
/*250*/	r1.w = max(abs(r1.z), abs(r1.y));
/*251*/	r1.w = max(r1.w, abs(r1.x));
/*252*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*253*/	r4.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*254*/	color0.xyzw = saturate(r4.xyzw);
/*255*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*256*/	r3.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*257*/	color2.xyzw = saturate(r3.xyzw);
/*258*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*259*/	color4 = vsOut_P1;
/*260*/	return;
}
