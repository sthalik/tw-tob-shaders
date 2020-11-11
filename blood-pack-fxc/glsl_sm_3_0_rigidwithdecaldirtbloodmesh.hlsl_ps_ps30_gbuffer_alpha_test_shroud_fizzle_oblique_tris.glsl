//
//
// Shader Model 4
// Fragment Shader
//
// id: 968 - fxc/glsl_SM_3_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_gbuffer_alpha_test_shroud_fizzle_oblique_tris.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*36*/	r1.yz = (vsOut_T1.xxyx * vec4(0.000000, 20.000000, 20.000000, 0.000000)).yz;
/*37*/	r3.xyzw = (texture(s_dissolve_map, r1.yzyy.st)).xyzw;
/*38*/	r1.x = r1.x + -r3.x;
/*39*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*40*/	if(r1.x != 0) discard;
/*41*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*42*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*44*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*45*/	r2.w = saturate(vsOut_N0.w);
/*46*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*47*/	r5.xyz = (r2.wwww * r5.xyzx + cb4.data[0].xyzx).xyz;
/*48*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*49*/	r4.xyw = (r4.xyxw + -cb4.data[1].xyxz).xyw;
/*50*/	r4.xyw = (r2.wwww * r4.xyxw + cb4.data[1].xyxz).xyw;
/*51*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*52*/	r6.xyz = (r6.xyzx + -cb4.data[2].xyzx).xyz;
/*53*/	r6.xyz = (r2.wwww * r6.xyzx + cb4.data[2].xyzx).xyz;
/*54*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*55*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*56*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*57*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*58*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*59*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*60*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*62*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*63*/	r2.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*64*/	r2.w = -r2.w + 1.000000;
/*65*/	r2.w = max(r2.w, 0.000000);
/*66*/	r3.z = sqrt(r2.w);
/*67*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*68*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*69*/	r4.w = 1.000000;
/*70*/	r2.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*71*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*72*/	r4.xy = (-cb3.data[3].xyxx + cb3.data[3].zwzz).xy;
/*73*/	r4.zw = (vsOut_T1.xxxy + -cb3.data[3].xxxy).zw;
/*74*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*75*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*76*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*77*/	r4.z = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r5.x));
/*78*/	r4.z = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r4.z));
/*79*/	r4.z = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r4.z));
/*80*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyxx.st)).xyzw;
/*81*/	r6.xyzw = (texture(s_decal_normal, r4.xyxx.st)).xyzw;
/*82*/	if(floatBitsToUint(r4.z) != 0u) {
/*83*/	  r4.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*84*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*85*/	  r4.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*86*/	  r4.w = -r4.w + 1.000000;
/*87*/	  r4.w = max(r4.w, 0.000000);
/*88*/	  r4.z = sqrt(r4.w);
/*89*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*90*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*91*/	  r4.w = r1.x * r7.w;
/*92*/	  r1.x = r4.w * -0.500000 + r1.x;
/*93*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*94*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*95*/	  r4.w = -r5.w * r6.w + 1.000000;
/*96*/	  r0.xyz = (r4.wwww * r0.xyzx + r7.xyzx).xyz;
/*97*/	  r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*98*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*99*/	}
/*100*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*101*/	r4.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx).xy;
/*102*/	r5.xy = (vsOut_T1.xyxx * cb3.data[2].xyxx + vsOut_T6.yzyy).xy;
/*103*/	r5.xyzw = (texture(s_decal_dirt_map, r5.xyxx.st)).xyzw;
/*104*/	r5.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*105*/	r4.z = r4.w * r5.w;
/*106*/	r6.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*107*/	r0.xyz = (r4.zzzz * r6.xyzx + r0.xyzx).xyz;
/*108*/	r3.xy = (r5.xyxx * r4.wwww + r3.xyxx).xy;
/*109*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*110*/	r4.w = inversesqrt(r4.w);
/*111*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*112*/	r4.xy = (r4.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*113*/	r5.xyzw = (texture(s_decal_blood_map, r4.xyxx.st)).xyzw;
/*114*/	r4.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*115*/	r4.x = saturate(-r4.x + r5.w);
/*116*/	r4.x = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*117*/	if(floatBitsToUint(r4.x) != 0u) {
/*118*/	  r4.x = -r5.w + 1.000000;
/*119*/	  r4.x = saturate(vsOut_T7.w * 0.900000 + -r4.x);
/*120*/	  r4.x = -r4.x + 1.000000;
/*121*/	  r4.x = -r4.x * r4.x + 1.000000;
/*122*/	  r4.x = r4.x * -0.600000 + 1.000000;
/*123*/	  r4.xyw = (r4.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*124*/	  r5.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*125*/	  r5.x = uintBitsToFloat((r5.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*126*/	  r5.x = uintBitsToFloat(floatBitsToUint(r5.x) & uint(0x3f800000u));
/*127*/	  r5.yzw = (r0.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r4.xxww).yzw;
/*128*/	  r0.xyz = (r5.xxxx * r5.yzwy + r4.xywx).xyz;
/*129*/	  r4.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*130*/	  r1.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*131*/	} else {
/*132*/	  r5.xyz = (r2.xyzx * r4.zzzz).xyz;
/*133*/	  r4.xyw = (r5.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r2.xyxz).xyw;
/*134*/	}
/*135*/	r2.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*136*/	r2.x = inversesqrt(r2.x);
/*137*/	r2.xyz = (r2.xxxx * vsOut_T3.xyzx).xyz;
/*138*/	r4.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*139*/	r4.z = inversesqrt(r4.z);
/*140*/	r5.xyz = (r4.zzzz * vsOut_T4.xyzx).xyz;
/*141*/	r4.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*142*/	r4.z = inversesqrt(r4.z);
/*143*/	r6.xyz = (r4.zzzz * vsOut_T2.xyzx).xyz;
/*144*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*145*/	r7.xyz = (r3.xxxx * r2.xyzx + r7.xyzx).xyz;
/*146*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*147*/	r4.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*148*/	r4.z = inversesqrt(r4.z);
/*149*/	r7.xyz = (r4.zzzz * r7.xyzx).xyz;
/*150*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*151*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*152*/	if(floatBitsToUint(r0.w) != 0u) {
/*153*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*154*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*155*/	  r0.w = r7.y * cb0.data[26].x;
/*156*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*157*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*158*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*159*/	  r4.xyw = (r7.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r4.xyxw).xyw;
/*160*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*161*/	}
/*162*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*163*/	if(floatBitsToUint(r0.w) != 0u) {
/*164*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*165*/	  if(floatBitsToUint(r0.w) != 0u) {
/*166*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*167*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*168*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*169*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*170*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*171*/	    r0.w = -r0.w + 1.000000;
/*172*/	    r0.w = max(r0.w, 0.000000);
/*173*/	    r8.z = sqrt(r0.w);
/*174*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*175*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*176*/	    r0.w = inversesqrt(r0.w);
/*177*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*178*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*179*/	    r10.y = -1.000000;
/*180*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*181*/	    r0.w = inversesqrt(r0.w);
/*182*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*183*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*184*/	    r4.z = cb2.data[1].x * cb2.data[1].x;
/*185*/	    r4.z = r4.z * 1.250000;
/*186*/	    r4.z = min(r4.z, 1.000000);
/*187*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*188*/	    r5.w = r5.w * 4.000000;
/*189*/	    r4.z = r4.z * 0.200000 + r5.w;
/*190*/	    r4.z = r4.z * -0.700000 + 1.000000;
/*191*/	    r0.w = r0.w + -r4.z;
/*192*/	    r0.w = saturate(r0.w * 200.000000);
/*193*/	    r4.z = r0.w * -2.000000 + 3.000000;
/*194*/	    r0.w = r0.w * r0.w;
/*195*/	    r0.w = r0.w * r4.z;
/*196*/	    r1.w = r0.w * -r1.w + r1.w;
/*197*/	    r4.z = -r1.x + 0.200000;
/*198*/	    r1.x = r0.w * r4.z + r1.x;
/*199*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*200*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*201*/	    r9.xyz = (-r4.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*202*/	    r4.xyw = (r0.wwww * r9.xyxz + r4.xyxw).xyw;
/*203*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*204*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*205*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*206*/	    r4.z = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*207*/	    r4.z = -r4.z + 1.000000;
/*208*/	    r4.z = max(r4.z, 0.000000);
/*209*/	    r7.z = sqrt(r4.z);
/*210*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*211*/	    r4.z = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*212*/	    r4.z = sqrt(r4.z);
/*213*/	    r7.xyz = (r8.xyzx * r4.zzzz + r7.xyzx).xyz;
/*214*/	    r4.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*215*/	    r4.z = inversesqrt(r4.z);
/*216*/	    r7.xyz = (r4.zzzz * r7.xyzx).xyz;
/*217*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*218*/	    r2.xyz = (r7.xxxx * r2.xyzx + r5.xyzx).xyz;
/*219*/	    r2.xyz = (r7.zzzz * r6.xyzx + r2.xyzx).xyz;
/*220*/	    r4.z = -r3.y + 1.000000;
/*221*/	    r0.w = min(r0.w, r4.z);
/*222*/	    r2.xyz = (-r3.xyzx + r2.xyzx).xyz;
/*223*/	    r2.xyz = (r0.wwww * r2.xyzx + r3.xyzx).xyz;
/*224*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*225*/	    r0.w = inversesqrt(r0.w);
/*226*/	    r3.xyz = (r0.wwww * r2.xyzx).xyz;
/*227*/	  }
/*228*/	}
/*229*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*230*/	if(floatBitsToUint(r0.w) != 0u) {
/*231*/	  r5.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*232*/	  r6.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*233*/	  r5.xyzw = r5.xyzw / r6.xyzw;
/*234*/	  r6.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*235*/	  r5.xyzw = r5.xyzw * r6.xyzw + cb1.data[4].xyxy;
/*236*/	  r6.xyzw = (textureLod(s_shroud, r5.zwzz.st, r5.w)).xyzw;
/*237*/	  r5.xyzw = r5.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*238*/	  r5.xyzw = saturate(r5.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*239*/	  r7.xyzw = r5.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*240*/	  r5.xyzw = r5.xyzw * r5.xyzw;
/*241*/	  r5.xyzw = r5.xyzw * r7.xyzw;
/*242*/	  r0.w = r6.x * r5.x;
/*243*/	  r0.w = r0.w * r5.y;
/*244*/	  r0.w = r5.z * -r0.w + r0.w;
/*245*/	  r0.w = r5.w * -r0.w + r0.w;
/*246*/	} else {
/*247*/	  r0.w = 1.000000;
/*248*/	}
/*249*/	r2.xy = (r0.wwww + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*250*/	r0.w = saturate(r2.x * 2.500000);
/*251*/	r2.x = r0.w * -2.000000 + 3.000000;
/*252*/	r0.w = r0.w * r0.w;
/*253*/	r0.w = r0.w * r2.x;
/*254*/	r2.x = saturate(r2.y + r2.y);
/*255*/	r2.y = r2.x * -2.000000 + 3.000000;
/*256*/	r2.x = r2.x * r2.x;
/*257*/	r2.x = r2.x * r2.y;
/*258*/	r0.w = r0.w * 0.200000;
/*259*/	r5.xyz = saturate(r0.wwww * r0.xyzx).xyz;
/*260*/	r0.xyz = (r0.xyzx + -r5.xyzx).xyz;
/*261*/	r0.xyz = (r2.xxxx * r0.xyzx + r5.xyzx).xyz;
/*262*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*263*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*264*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*265*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.xyzx + r0.xyzx).xyz;
/*266*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*267*/	r2.xyz = (-r0.xyzx + r2.xxxx).xyz;
/*268*/	r0.xyz = (vsOut_T7.zzzz * r2.xyzx + r0.xyzx).xyz;
/*269*/	r2.x = dot(vec3(r4.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*270*/	r2.xyz = (-r4.xywx + r2.xxxx).xyz;
/*271*/	r4.xyz = (vsOut_T7.zzzz * r2.xyzx + r4.xywx).xyz;
/*272*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*273*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*274*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*275*/	r2.x = inversesqrt(r2.x);
/*276*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*277*/	color3.x = r2.w / r3.w;
/*278*/	r2.w = max(abs(r2.z), abs(r2.y));
/*279*/	r2.w = max(r2.w, abs(r2.x));
/*280*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*281*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*282*/	color0.xyzw = saturate(r1.xyzw);
/*283*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*284*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*285*/	color2.xyzw = saturate(r4.xyzw);
/*286*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*287*/	color4 = vsOut_P1;
/*288*/	return;
}
