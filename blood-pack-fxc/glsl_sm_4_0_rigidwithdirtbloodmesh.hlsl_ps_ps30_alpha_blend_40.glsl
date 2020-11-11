//
//
// Shader Model 4
// Fragment Shader
//
// id: 1212 - fxc/glsl_SM_4_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_alpha_blend_40.glsl
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
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
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
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb4.data[0].x))) * 0xffffffffu)).x;
/*14*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*15*/	  r1.x = r0.x * r1.x;
/*16*/	}
/*17*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*18*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r0.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*20*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*21*/	r0.x = saturate(vsOut_N0.w);
/*22*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*23*/	r3.xyz = (r0.xxxx * r3.xyzx + cb5.data[0].xyzx).xyz;
/*24*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*25*/	r4.xyz = (r4.xyzx + -cb5.data[1].xyzx).xyz;
/*26*/	r4.xyz = (r0.xxxx * r4.xyzx + cb5.data[1].xyzx).xyz;
/*27*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*28*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*29*/	r0.xyz = (r0.xxxx * r5.xyzx + cb5.data[2].xyzx).xyz;
/*30*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*31*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*32*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*33*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*34*/	r0.xyz = (r0.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*35*/	r0.xyz = (r2.zzzz * r0.xyzx + r1.xyzx).xyz;
/*36*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*37*/	r1.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*38*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r2.x = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*40*/	r2.x = -r2.x + 1.000000;
/*41*/	r2.x = max(r2.x, 0.000000);
/*42*/	r1.z = sqrt(r2.x);
/*43*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*44*/	r2.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*45*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*46*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*47*/	r3.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*48*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*49*/	r2.z = r2.w * r3.w;
/*50*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*51*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*52*/	r1.xy = (r3.xyxx * r2.wwww + r1.xyxx).xy;
/*53*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*54*/	r2.w = inversesqrt(r2.w);
/*55*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*56*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*57*/	r3.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*58*/	r2.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*59*/	r2.x = saturate(-r2.x + r3.w);
/*60*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*61*/	if(floatBitsToUint(r2.x) != 0u) {
/*62*/	  r2.x = -r3.w + 1.000000;
/*63*/	  r2.x = saturate(vsOut_T7.w * 0.900000 + -r2.x);
/*64*/	  r2.x = -r2.x + 1.000000;
/*65*/	  r2.x = -r2.x * r2.x + 1.000000;
/*66*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*67*/	  r2.xyw = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*68*/	  r3.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*69*/	  r3.x = uintBitsToFloat((r3.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*70*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3f800000u));
/*71*/	  r3.yzw = (r0.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r2.xxww).yzw;
/*72*/	  r0.xyz = (r3.xxxx * r3.yzwy + r2.xywx).xyz;
/*73*/	  r2.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*74*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*75*/	} else {
/*76*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*77*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*78*/	  r5.xyz = (r2.zzzz * r4.xyzx).xyz;
/*79*/	  r2.xyw = (r5.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r4.xyxz).xyw;
/*80*/	}
/*81*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*82*/	r2.z = inversesqrt(r2.z);
/*83*/	r4.xyz = (r2.zzzz * vsOut_T3.xyzx).xyz;
/*84*/	r2.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*85*/	r2.z = inversesqrt(r2.z);
/*86*/	r5.xyz = (r2.zzzz * vsOut_T4.xyzx).xyz;
/*87*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*88*/	r2.z = inversesqrt(r2.z);
/*89*/	r6.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*90*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*91*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*92*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*93*/	r2.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*94*/	r2.z = inversesqrt(r2.z);
/*95*/	r7.xyz = (r2.zzzz * r7.xyzx).xyz;
/*96*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*97*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*98*/	if(floatBitsToUint(r0.w) != 0u) {
/*99*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*100*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*101*/	  r0.w = r3.w * cb0.data[26].x;
/*102*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*103*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*104*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*105*/	  r2.xyw = (r7.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r2.xyxw).xyw;
/*106*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*107*/	}
/*108*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*109*/	if(floatBitsToUint(r0.w) != 0u) {
/*110*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*111*/	  if(floatBitsToUint(r0.w) != 0u) {
/*112*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*113*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*114*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*115*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*116*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*117*/	    r0.w = -r0.w + 1.000000;
/*118*/	    r0.w = max(r0.w, 0.000000);
/*119*/	    r8.z = sqrt(r0.w);
/*120*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*121*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*122*/	    r0.w = inversesqrt(r0.w);
/*123*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*124*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*125*/	    r10.y = -1.000000;
/*126*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*127*/	    r0.w = inversesqrt(r0.w);
/*128*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*129*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*130*/	    r2.z = cb3.data[1].x * cb3.data[1].x;
/*131*/	    r2.z = r2.z * 1.250000;
/*132*/	    r2.z = min(r2.z, 1.000000);
/*133*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*134*/	    r3.z = r3.z * 4.000000;
/*135*/	    r2.z = r2.z * 0.200000 + r3.z;
/*136*/	    r2.z = r2.z * -0.700000 + 1.000000;
/*137*/	    r0.w = r0.w + -r2.z;
/*138*/	    r0.w = saturate(r0.w * 200.000000);
/*139*/	    r2.z = r0.w * -2.000000 + 3.000000;
/*140*/	    r0.w = r0.w * r0.w;
/*141*/	    r0.w = r0.w * r2.z;
/*142*/	    r3.x = r0.w * -r3.x + r3.x;
/*143*/	    r2.z = -r3.y + 0.200000;
/*144*/	    r3.y = r0.w * r2.z + r3.y;
/*145*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*146*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*147*/	    r9.xyz = (-r2.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*148*/	    r2.xyw = (r0.wwww * r9.xyxz + r2.xyxw).xyw;
/*149*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*150*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*151*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*152*/	    r2.z = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*153*/	    r2.z = -r2.z + 1.000000;
/*154*/	    r2.z = max(r2.z, 0.000000);
/*155*/	    r7.z = sqrt(r2.z);
/*156*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*157*/	    r2.z = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*158*/	    r2.z = sqrt(r2.z);
/*159*/	    r7.xyz = (r8.xyzx * r2.zzzz + r7.xyzx).xyz;
/*160*/	    r2.z = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*161*/	    r2.z = inversesqrt(r2.z);
/*162*/	    r7.xyz = (r2.zzzz * r7.xyzx).xyz;
/*163*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*164*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*165*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*166*/	    r2.z = -r1.y + 1.000000;
/*167*/	    r0.w = min(r0.w, r2.z);
/*168*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*169*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*170*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*171*/	    r0.w = inversesqrt(r0.w);
/*172*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*173*/	  }
/*174*/	}
/*175*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*176*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*177*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*178*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*179*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*180*/	r3.yzw = (-r0.xxyz + r2.zzzz).yzw;
/*181*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*182*/	r2.z = dot(vec3(r2.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*183*/	r3.yzw = (-r2.xxyw + r2.zzzz).yzw;
/*184*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xywx).xyz;
/*185*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*186*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*187*/	r2.w = inversesqrt(r2.w);
/*188*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*189*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*190*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*191*/	r3.y = inversesqrt(r2.w);
/*192*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*193*/	r5.x = -r3.x + 1.000000;
/*194*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*195*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*196*/	r5.z = r5.z + r5.z;
/*197*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*198*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*199*/	r5.z = r5.x * 1.539380;
/*200*/	r5.z = cos((r5.z));
/*201*/	r5.z = inversesqrt(r5.z);
/*202*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*203*/	r5.w = saturate(r0.w * 60.000000);
/*204*/	r5.w = -r0.w + r5.w;
/*205*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*206*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*207*/	r6.w = inversesqrt(r6.w);
/*208*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*209*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*210*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*211*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*212*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*213*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*214*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*215*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*216*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*217*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*218*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*219*/	r6.w = -r0.w + 1.000000;
/*220*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*221*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*222*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*223*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*224*/	  r6.w = max(r6.w, 0.000000);
/*225*/	  r6.w = log2(r6.w);
/*226*/	  r6.w = r6.w * 10.000000;
/*227*/	  r6.w = exp2(r6.w);
/*228*/	  r6.w = r5.z * r6.w;
/*229*/	  r6.w = r6.w * r5.w + r0.w;
/*230*/	  r7.y = r5.x * 8.000000;
/*231*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*232*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*233*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*234*/	}
/*235*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*236*/	r1.y = max(r1.x, 0.000000);
/*237*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*238*/	if(floatBitsToUint(r1.x) != 0u) {
/*239*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*240*/	  r1.x = max(r1.x, -1.000000);
/*241*/	  r1.x = min(r1.x, 1.000000);
/*242*/	  r1.z = -abs(r1.x) + 1.000000;
/*243*/	  r1.z = sqrt(r1.z);
/*244*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*245*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*246*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*247*/	  r6.y = r1.z * r6.x;
/*248*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*249*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*250*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*251*/	  r1.x = r6.x * r1.z + r1.x;
/*252*/	  r1.z = r3.x * r3.x;
/*253*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*254*/	  r1.z = r1.z * r3.x + r7.x;
/*255*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*256*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*257*/	  r3.x = -r1.z * r1.z + 1.000000;
/*258*/	  r3.x = max(r3.x, 0.001000);
/*259*/	  r3.x = log2(r3.x);
/*260*/	  r5.y = r3.x * 4.950617;
/*261*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*262*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*263*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*264*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*265*/	  r1.z = floatBitsToInt(r1.z);
/*266*/	  r5.y = r3.x * r3.x + -r5.y;
/*267*/	  r5.y = sqrt(r5.y);
/*268*/	  r3.x = -r3.x + r5.y;
/*269*/	  r3.x = max(r3.x, 0.000000);
/*270*/	  r3.x = sqrt(r3.x);
/*271*/	  r1.z = r1.z * r3.x;
/*272*/	  r1.z = r1.z * 1.414214;
/*273*/	  r1.z = 0.008727 / r1.z;
/*274*/	  r1.z = max(r1.z, 0.000100);
/*275*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*276*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*277*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*278*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*279*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*280*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*281*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*282*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*283*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*284*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*285*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*286*/	  r1.x = floatBitsToInt(r1.x);
/*287*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*288*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*289*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*290*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*291*/	  r1.x = r1.x * r6.x + 1.000000;
/*292*/	  r1.x = r1.x * 0.500000;
/*293*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*294*/	  r1.z = r1.z * r6.y + 1.000000;
/*295*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*296*/	  r1.z = min(r1.y, 1.000000);
/*297*/	  r3.x = r5.x * 1.570796;
/*298*/	  r3.x = sin(r3.x);
/*299*/	  r1.z = r1.z + -1.000000;
/*300*/	  r1.z = r3.x * r1.z + 1.000000;
/*301*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*302*/	  r3.x = max(r3.x, 0.000000);
/*303*/	  r3.x = log2(r3.x);
/*304*/	  r3.x = r3.x * 10.000000;
/*305*/	  r3.x = exp2(r3.x);
/*306*/	  r3.x = r5.z * r3.x;
/*307*/	  r3.x = r3.x * r5.w + r0.w;
/*308*/	  r1.x = r1.z * abs(r1.x);
/*309*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*310*/	} else {
/*311*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*312*/	}
/*313*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*314*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*315*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*316*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*317*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*318*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*319*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*320*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*321*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*322*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*323*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*324*/	r3.w = 1.000000;
/*325*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*326*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*327*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*328*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*329*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*330*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*331*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*332*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*333*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*334*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*335*/	if(r0.w != 0) discard;
/*336*/	r0.w = sqrt(r2.w);
/*337*/	r1.x = saturate(cb2.data[0].w)/**/;
/*338*/	r1.x = -r1.x + 1.000000;
/*339*/	r1.x = r1.x * 8.000000 + -4.000000;
/*340*/	r1.y = saturate(cb2.data[1].x)/**/;
/*341*/	r1.y = -r1.y + 1.000000;
/*342*/	r1.y = r1.y * 1000.000000;
/*343*/	r0.w = r0.w / r1.y;
/*344*/	r0.w = r0.w + r1.x;
/*345*/	r0.w = r0.w * 1.442695;
/*346*/	r0.w = exp2(r0.w);
/*347*/	r0.w = cb2.data[1].y / r0.w;
/*348*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*349*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*350*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*351*/	r1.x = r1.x + -cb2.data[1].z;
/*352*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*353*/	r1.x = saturate(r1.y * r1.x);
/*354*/	r1.y = r1.x * -2.000000 + 3.000000;
/*355*/	r1.x = r1.x * r1.x;
/*356*/	r1.x = r1.x * r1.y;
/*357*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*358*/	r1.y = sqrt(r1.y);
/*359*/	r1.z = max(cb2.data[2].z, 0.001000);
/*360*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*361*/	r1.y = r1.z * r1.y;
/*362*/	r1.y = min(r1.y, 1.000000);
/*363*/	r1.z = r1.y * -2.000000 + 3.000000;
/*364*/	r1.y = r1.y * r1.y;
/*365*/	r1.y = r1.y * r1.z;
/*366*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*367*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*368*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*369*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*370*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*371*/	r4.w = max(r4.y, 0.000000);
/*372*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*373*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*374*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*375*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*376*/	r0.w = saturate(r0.w * r1.y);
/*377*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*378*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*379*/	color0.w = r1.w;
/*380*/	return;
}
