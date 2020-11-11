//
//
// Shader Model 4
// Fragment Shader
//
// id: 1021 - fxc/glsl_SM_3_0_rigidwithdecaldirtburnmesh.hlsl_PS_ps30_gbuffer_alpha_test_shroud_fizzle_oblique_tris.glsl
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
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D s_shroud;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;

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
/*41*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
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
/*72*/	r5.xy = (-cb3.data[3].xyxx + cb3.data[3].zwzz).xy;
/*73*/	r5.zw = (vsOut_T1.xxxy + -cb3.data[3].xxxy).zw;
/*74*/	r5.xy = (r5.zwzz / r5.xyxx).xy;
/*75*/	r5.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r5.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*76*/	r6.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r5.xyxx)) * 0xffffffffu)).xy;
/*77*/	r3.y = uintBitsToFloat(floatBitsToUint(r5.z) & floatBitsToUint(r6.x));
/*78*/	r3.y = uintBitsToFloat(floatBitsToUint(r5.w) & floatBitsToUint(r3.y));
/*79*/	r3.y = uintBitsToFloat(floatBitsToUint(r6.y) & floatBitsToUint(r3.y));
/*80*/	r6.xyzw = (texture(s_decal_diffuse, r5.xyxx.st)).xyzw;
/*81*/	r5.xyzw = (texture(s_decal_normal, r5.xyxx.st)).xyzw;
/*82*/	if(floatBitsToUint(r3.y) != 0u) {
/*83*/	  r5.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*84*/	  r5.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*85*/	  r3.y = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*86*/	  r3.y = -r3.y + 1.000000;
/*87*/	  r3.y = max(r3.y, 0.000000);
/*88*/	  r5.z = sqrt(r3.y);
/*89*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*90*/	  r8.xyzw = r6.xyzw * r7.wwww;
/*91*/	  r3.y = r1.x * r8.w;
/*92*/	  r1.x = r3.y * -0.500000 + r1.x;
/*93*/	  r6.xyz = (r6.xyzx * r7.wwww + -r2.xyzx).xyz;
/*94*/	  r2.xyz = (r8.wwww * r6.xyzx + r2.xyzx).xyz;
/*95*/	  r3.y = -r6.w * r7.w + 1.000000;
/*96*/	  r0.xyz = (r3.yyyy * r0.xyzx + r8.xyzx).xyz;
/*97*/	  r5.xyz = (-r4.xyzx + r5.xyzx).xyz;
/*98*/	  r4.xyz = (r8.wwww * r5.xyzx + r4.xyzx).xyz;
/*99*/	}
/*100*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*101*/	r5.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*102*/	r6.xyzw = (texture(s_decal_dirt_map, r5.xyxx.st)).xyzw;
/*103*/	r5.xy = (r6.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*104*/	r3.y = r5.w * r6.w;
/*105*/	r6.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*106*/	r0.xyz = (r3.yyyy * r6.xyzx + r0.xyzx).xyz;
/*107*/	r4.xy = (r5.xyxx * r5.wwww + r4.xyxx).xy;
/*108*/	r4.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*109*/	r4.w = inversesqrt(r4.w);
/*110*/	r4.xyz = (r4.wwww * r4.xyzx).xyz;
/*111*/	r5.xyz = (r2.xyzx * r3.yyyy).xyz;
/*112*/	r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*113*/	r5.x = 0;
/*114*/	r5.y = cb0.data[26].x * 0.050000;
/*115*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*116*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*117*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*118*/	r3.y = saturate(r5.x * 5.000000);
/*119*/	r3.yzw = (r3.yyyy * vec4(0.000000, 0.530000, 0.070000, -0.120000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*120*/	r4.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*121*/	r4.w = saturate(-r4.w * 15.000000 + 1.000000);
/*122*/	r5.x = log2(r6.z);
/*123*/	r5.x = r5.x * 1.800000;
/*124*/	r5.x = exp2(r5.x);
/*125*/	r5.x = r5.x * 10.000000;
/*126*/	r5.x = min(r5.x, 1.000000);
/*127*/	r4.w = r4.w + r5.x;
/*128*/	r4.w = r4.w * 0.500000;
/*129*/	r5.x = -r6.w + 1.000000;
/*130*/	r5.x = log2(r5.x);
/*131*/	r5.x = r5.x * vsOut_T7.x;
/*132*/	r5.x = exp2(r5.x);
/*133*/	r5.x = min(r5.x, 1.000000);
/*134*/	r5.x = r5.x * vsOut_T7.x;
/*135*/	r5.y = r6.z * 0.250000;
/*136*/	r3.yzw = (r3.yyzw * vec4(0.000000, 2.000000, 2.000000, 2.000000) + -r5.yyyy).yzw;
/*137*/	r3.yzw = (r4.wwww * r3.yyzw + r5.yyyy).yzw;
/*138*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*139*/	r0.xyz = (r5.xxxx * r3.yzwy + r0.xyzx).xyz;
/*140*/	r3.y = vsOut_T7.x + -0.025000;
/*141*/	r3.y = max(r3.y, 0.000000);
/*142*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*143*/	r0.xyz = (r3.yyyy * r5.xyzx + r0.xyzx).xyz;
/*144*/	r3.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*145*/	r3.y = inversesqrt(r3.y);
/*146*/	r3.yzw = (r3.yyyy * vsOut_T3.xxyz).yzw;
/*147*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*148*/	r4.w = inversesqrt(r4.w);
/*149*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*150*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*151*/	r4.w = inversesqrt(r4.w);
/*152*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*153*/	r7.xyz = (r4.yyyy * r5.xyzx).xyz;
/*154*/	r7.xyz = (r4.xxxx * r3.yzwy + r7.xyzx).xyz;
/*155*/	r7.xyz = (r4.zzzz * r6.xyzx + r7.xyzx).xyz;
/*156*/	r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*157*/	r4.w = inversesqrt(r4.w);
/*158*/	r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*159*/	r4.xyz = (mix(r7.xyzx, r4.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*160*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*161*/	if(floatBitsToUint(r0.w) != 0u) {
/*162*/	  r0.w = uintBitsToFloat((0.990000 < r4.y) ? 0xffffffffu : 0x00000000u);
/*163*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*164*/	  r0.w = r7.y * cb0.data[26].x;
/*165*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*166*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*167*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*168*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*169*/	  r1.xy = (r1.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*170*/	}
/*171*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*172*/	if(floatBitsToUint(r0.w) != 0u) {
/*173*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*174*/	  if(floatBitsToUint(r0.w) != 0u) {
/*175*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*176*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*177*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*178*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*179*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*180*/	    r0.w = -r0.w + 1.000000;
/*181*/	    r0.w = max(r0.w, 0.000000);
/*182*/	    r8.z = sqrt(r0.w);
/*183*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r4.xyzx).xyz;
/*184*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*185*/	    r0.w = inversesqrt(r0.w);
/*186*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*187*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*188*/	    r10.y = -1.000000;
/*189*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*190*/	    r0.w = inversesqrt(r0.w);
/*191*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*192*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*193*/	    r4.w = cb2.data[1].x * cb2.data[1].x;
/*194*/	    r4.w = r4.w * 1.250000;
/*195*/	    r4.w = min(r4.w, 1.000000);
/*196*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*197*/	    r5.w = r5.w * 4.000000;
/*198*/	    r4.w = r4.w * 0.200000 + r5.w;
/*199*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*200*/	    r0.w = r0.w + -r4.w;
/*201*/	    r0.w = saturate(r0.w * 200.000000);
/*202*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*203*/	    r0.w = r0.w * r0.w;
/*204*/	    r0.w = r0.w * r4.w;
/*205*/	    r1.y = r0.w * -r1.y + r1.y;
/*206*/	    r4.w = -r1.x + 0.200000;
/*207*/	    r1.x = r0.w * r4.w + r1.x;
/*208*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*209*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*210*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*211*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*212*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*213*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*214*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*215*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*216*/	    r4.w = -r4.w + 1.000000;
/*217*/	    r4.w = max(r4.w, 0.000000);
/*218*/	    r7.z = sqrt(r4.w);
/*219*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*220*/	    r4.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*221*/	    r4.w = sqrt(r4.w);
/*222*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*223*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*224*/	    r4.w = inversesqrt(r4.w);
/*225*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*226*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*227*/	    r3.yzw = (r7.xxxx * r3.yyzw + r5.xxyz).yzw;
/*228*/	    r3.yzw = (r7.zzzz * r6.xxyz + r3.yyzw).yzw;
/*229*/	    r4.w = -r4.y + 1.000000;
/*230*/	    r0.w = min(r0.w, r4.w);
/*231*/	    r3.yzw = (-r4.xxyz + r3.yyzw).yzw;
/*232*/	    r3.yzw = (r0.wwww * r3.yyzw + r4.xxyz).yzw;
/*233*/	    r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*234*/	    r0.w = inversesqrt(r0.w);
/*235*/	    r4.xyz = (r0.wwww * r3.yzwy).xyz;
/*236*/	  }
/*237*/	}
/*238*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*239*/	if(floatBitsToUint(r0.w) != 0u) {
/*240*/	  r5.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*241*/	  r6.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*242*/	  r5.xyzw = r5.xyzw / r6.xyzw;
/*243*/	  r6.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*244*/	  r5.xyzw = r5.xyzw * r6.xyzw + cb1.data[4].xyxy;
/*245*/	  r6.xyzw = (textureLod(s_shroud, r5.zwzz.st, r5.w)).xyzw;
/*246*/	  r5.xyzw = r5.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*247*/	  r5.xyzw = saturate(r5.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*248*/	  r7.xyzw = r5.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*249*/	  r5.xyzw = r5.xyzw * r5.xyzw;
/*250*/	  r5.xyzw = r5.xyzw * r7.xyzw;
/*251*/	  r0.w = r6.x * r5.x;
/*252*/	  r0.w = r0.w * r5.y;
/*253*/	  r0.w = r5.z * -r0.w + r0.w;
/*254*/	  r0.w = r5.w * -r0.w + r0.w;
/*255*/	} else {
/*256*/	  r0.w = 1.000000;
/*257*/	}
/*258*/	r3.yz = (r0.wwww + vec4(0.000000, -0.100000, -0.500000, 0.000000)).yz;
/*259*/	r0.w = saturate(r3.y * 2.500000);
/*260*/	r3.y = r0.w * -2.000000 + 3.000000;
/*261*/	r0.w = r0.w * r0.w;
/*262*/	r0.w = r0.w * r3.y;
/*263*/	r3.y = saturate(r3.z + r3.z);
/*264*/	r3.z = r3.y * -2.000000 + 3.000000;
/*265*/	r3.y = r3.y * r3.y;
/*266*/	r3.y = r3.y * r3.z;
/*267*/	r0.w = r0.w * 0.200000;
/*268*/	r5.xyz = saturate(r0.wwww * r0.xyzx).xyz;
/*269*/	r0.xyz = (r0.xyzx + -r5.xyzx).xyz;
/*270*/	r0.xyz = (r3.yyyy * r0.xyzx + r5.xyzx).xyz;
/*271*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*272*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*273*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*274*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*275*/	r3.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*276*/	r3.yzw = (-r0.xxyz + r3.yyyy).yzw;
/*277*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*278*/	r3.y = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*279*/	r3.yzw = (-r2.xxyz + r3.yyyy).yzw;
/*280*/	r5.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*281*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*282*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*283*/	r2.x = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*284*/	r2.x = inversesqrt(r2.x);
/*285*/	r2.xyz = (r2.xxxx * r4.xyzx).xyz;
/*286*/	color3.x = r2.w / r3.x;
/*287*/	r2.w = max(abs(r2.z), abs(r2.y));
/*288*/	r2.w = max(r2.w, abs(r2.x));
/*289*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*290*/	r1.xzw = (r2.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*291*/	color0.xyzw = saturate(r1.xzwy);
/*292*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*293*/	r5.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*294*/	color2.xyzw = saturate(r5.xyzw);
/*295*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*296*/	color4 = vsOut_P1;
/*297*/	return;
}
