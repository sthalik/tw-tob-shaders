//
//
// Shader Model 4
// Fragment Shader
//
// id: 1110 - fxc/glsl_SM_4_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_alpha_blend_40.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*21*/	r0.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*22*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*23*/	r0.x = saturate(vsOut_N0.w);
/*24*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*25*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*26*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*27*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*28*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*29*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*30*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*31*/	r0.xyz = (r0.xxxx * r7.xyzx + cb5.data[2].xyzx).xyz;
/*32*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*33*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*34*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*35*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*36*/	r0.xyz = (r0.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*37*/	r0.xyz = (r4.zzzz * r0.xyzx + r1.xyzx).xyz;
/*38*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r1.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*40*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	r2.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*42*/	r2.w = -r2.w + 1.000000;
/*43*/	r2.w = max(r2.w, 0.000000);
/*44*/	r1.z = sqrt(r2.w);
/*45*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*46*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*47*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*48*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*49*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*50*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*51*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*52*/	r2.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r2.w));
/*53*/	r2.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r2.w));
/*54*/	r4.z = vsOut_T6.x;
/*55*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*56*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*57*/	if(floatBitsToUint(r2.w) != 0u) {
/*58*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*59*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	  r2.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*61*/	  r2.w = -r2.w + 1.000000;
/*62*/	  r2.w = max(r2.w, 0.000000);
/*63*/	  r4.z = sqrt(r2.w);
/*64*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*65*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*66*/	  r2.w = r3.y * r7.w;
/*67*/	  r3.y = r2.w * -0.500000 + r3.y;
/*68*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*69*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*70*/	  r2.w = -r5.w * r6.w + 1.000000;
/*71*/	  r0.xyz = (r2.wwww * r0.xyzx + r7.xyzx).xyz;
/*72*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*73*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*74*/	}
/*75*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*76*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*77*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*78*/	r2.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*79*/	r2.w = saturate(-r2.w + r4.w);
/*80*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*81*/	if(floatBitsToUint(r2.w) != 0u) {
/*82*/	  r2.w = -r4.w + 1.000000;
/*83*/	  r2.w = saturate(vsOut_T7.w * 0.900000 + -r2.w);
/*84*/	  r2.w = -r2.w + 1.000000;
/*85*/	  r2.w = -r2.w * r2.w + 1.000000;
/*86*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*87*/	  r4.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*88*/	  r2.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*89*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*90*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*91*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*92*/	  r0.xyz = (r2.wwww * r5.xyzx + r4.xyzx).xyz;
/*93*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*94*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*95*/	}
/*96*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*97*/	r2.w = inversesqrt(r2.w);
/*98*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*99*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*100*/	r2.w = inversesqrt(r2.w);
/*101*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*102*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*103*/	r2.w = inversesqrt(r2.w);
/*104*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*105*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*106*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*107*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*108*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*109*/	r2.w = inversesqrt(r2.w);
/*110*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*111*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*112*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*113*/	if(floatBitsToUint(r0.w) != 0u) {
/*114*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*115*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*116*/	  r0.w = r3.w * cb0.data[26].x;
/*117*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*118*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*119*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*120*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*121*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*122*/	}
/*123*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*124*/	if(floatBitsToUint(r0.w) != 0u) {
/*125*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*126*/	  if(floatBitsToUint(r0.w) != 0u) {
/*127*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*128*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*129*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*130*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*131*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*132*/	    r0.w = -r0.w + 1.000000;
/*133*/	    r0.w = max(r0.w, 0.000000);
/*134*/	    r8.z = sqrt(r0.w);
/*135*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*136*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*137*/	    r0.w = inversesqrt(r0.w);
/*138*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*139*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*140*/	    r10.y = -1.000000;
/*141*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*142*/	    r0.w = inversesqrt(r0.w);
/*143*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*144*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*145*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*146*/	    r2.w = r2.w * 1.250000;
/*147*/	    r2.w = min(r2.w, 1.000000);
/*148*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*149*/	    r3.z = r3.z * 4.000000;
/*150*/	    r2.w = r2.w * 0.200000 + r3.z;
/*151*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*152*/	    r0.w = r0.w + -r2.w;
/*153*/	    r0.w = saturate(r0.w * 200.000000);
/*154*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*155*/	    r0.w = r0.w * r0.w;
/*156*/	    r0.w = r0.w * r2.w;
/*157*/	    r3.x = r0.w * -r3.x + r3.x;
/*158*/	    r2.w = -r3.y + 0.200000;
/*159*/	    r3.y = r0.w * r2.w + r3.y;
/*160*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*161*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*162*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*163*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*164*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*165*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*166*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*167*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*168*/	    r2.w = -r2.w + 1.000000;
/*169*/	    r2.w = max(r2.w, 0.000000);
/*170*/	    r7.z = sqrt(r2.w);
/*171*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*172*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*173*/	    r2.w = sqrt(r2.w);
/*174*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*175*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*176*/	    r2.w = inversesqrt(r2.w);
/*177*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*178*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*179*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*180*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*181*/	    r2.w = -r1.y + 1.000000;
/*182*/	    r0.w = min(r0.w, r2.w);
/*183*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*184*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*185*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*186*/	    r0.w = inversesqrt(r0.w);
/*187*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*188*/	  }
/*189*/	}
/*190*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*191*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*192*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*193*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*194*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*195*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*196*/	r0.xyz = (vsOut_T7.zzzz * r3.yzwy + r0.xyzx).xyz;
/*197*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*198*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*199*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*200*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*201*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*202*/	r2.w = inversesqrt(r2.w);
/*203*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*204*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*205*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*206*/	r3.y = inversesqrt(r2.w);
/*207*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*208*/	r5.x = -r3.x + 1.000000;
/*209*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*210*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*211*/	r5.z = r5.z + r5.z;
/*212*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*213*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*214*/	r5.z = r5.x * 1.539380;
/*215*/	r5.z = cos((r5.z));
/*216*/	r5.z = inversesqrt(r5.z);
/*217*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*218*/	r5.w = saturate(r0.w * 60.000000);
/*219*/	r5.w = -r0.w + r5.w;
/*220*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*221*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*222*/	r6.w = inversesqrt(r6.w);
/*223*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*224*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*225*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*226*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*227*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*228*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*229*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*230*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*231*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*232*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*233*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*234*/	r6.w = -r0.w + 1.000000;
/*235*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*236*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*237*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*238*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*239*/	  r6.w = max(r6.w, 0.000000);
/*240*/	  r6.w = log2(r6.w);
/*241*/	  r6.w = r6.w * 10.000000;
/*242*/	  r6.w = exp2(r6.w);
/*243*/	  r6.w = r5.z * r6.w;
/*244*/	  r6.w = r6.w * r5.w + r0.w;
/*245*/	  r7.y = r5.x * 8.000000;
/*246*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*247*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*248*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*249*/	}
/*250*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*251*/	r1.y = max(r1.x, 0.000000);
/*252*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*253*/	if(floatBitsToUint(r1.x) != 0u) {
/*254*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*255*/	  r1.x = max(r1.x, -1.000000);
/*256*/	  r1.x = min(r1.x, 1.000000);
/*257*/	  r1.z = -abs(r1.x) + 1.000000;
/*258*/	  r1.z = sqrt(r1.z);
/*259*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*260*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*261*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*262*/	  r6.y = r1.z * r6.x;
/*263*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*264*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*265*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*266*/	  r1.x = r6.x * r1.z + r1.x;
/*267*/	  r1.z = r3.x * r3.x;
/*268*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*269*/	  r1.z = r1.z * r3.x + r7.x;
/*270*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*271*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*272*/	  r3.x = -r1.z * r1.z + 1.000000;
/*273*/	  r3.x = max(r3.x, 0.001000);
/*274*/	  r3.x = log2(r3.x);
/*275*/	  r5.y = r3.x * 4.950617;
/*276*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*277*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*278*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*279*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*280*/	  r1.z = floatBitsToInt(r1.z);
/*281*/	  r5.y = r3.x * r3.x + -r5.y;
/*282*/	  r5.y = sqrt(r5.y);
/*283*/	  r3.x = -r3.x + r5.y;
/*284*/	  r3.x = max(r3.x, 0.000000);
/*285*/	  r3.x = sqrt(r3.x);
/*286*/	  r1.z = r1.z * r3.x;
/*287*/	  r1.z = r1.z * 1.414214;
/*288*/	  r1.z = 0.008727 / r1.z;
/*289*/	  r1.z = max(r1.z, 0.000100);
/*290*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*291*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*292*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*293*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*294*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*295*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*296*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*297*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*298*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*299*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*300*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*301*/	  r1.x = floatBitsToInt(r1.x);
/*302*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*303*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*304*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*305*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*306*/	  r1.x = r1.x * r6.x + 1.000000;
/*307*/	  r1.x = r1.x * 0.500000;
/*308*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*309*/	  r1.z = r1.z * r6.y + 1.000000;
/*310*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*311*/	  r1.z = min(r1.y, 1.000000);
/*312*/	  r3.x = r5.x * 1.570796;
/*313*/	  r3.x = sin(r3.x);
/*314*/	  r1.z = r1.z + -1.000000;
/*315*/	  r1.z = r3.x * r1.z + 1.000000;
/*316*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*317*/	  r3.x = max(r3.x, 0.000000);
/*318*/	  r3.x = log2(r3.x);
/*319*/	  r3.x = r3.x * 10.000000;
/*320*/	  r3.x = exp2(r3.x);
/*321*/	  r3.x = r5.z * r3.x;
/*322*/	  r3.x = r3.x * r5.w + r0.w;
/*323*/	  r1.x = r1.z * abs(r1.x);
/*324*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*325*/	} else {
/*326*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*327*/	}
/*328*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*329*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*330*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*331*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*332*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*333*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*334*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*335*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*336*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*337*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*338*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*339*/	r3.w = 1.000000;
/*340*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*341*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*342*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*343*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*344*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*345*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*346*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*347*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*348*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*349*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*350*/	if(r0.w != 0) discard;
/*351*/	r0.w = sqrt(r2.w);
/*352*/	r1.x = saturate(cb2.data[0].w)/**/;
/*353*/	r1.x = -r1.x + 1.000000;
/*354*/	r1.x = r1.x * 8.000000 + -4.000000;
/*355*/	r1.y = saturate(cb2.data[1].x)/**/;
/*356*/	r1.y = -r1.y + 1.000000;
/*357*/	r1.y = r1.y * 1000.000000;
/*358*/	r0.w = r0.w / r1.y;
/*359*/	r0.w = r0.w + r1.x;
/*360*/	r0.w = r0.w * 1.442695;
/*361*/	r0.w = exp2(r0.w);
/*362*/	r0.w = cb2.data[1].y / r0.w;
/*363*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*364*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*365*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*366*/	r1.x = r1.x + -cb2.data[1].z;
/*367*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*368*/	r1.x = saturate(r1.y * r1.x);
/*369*/	r1.y = r1.x * -2.000000 + 3.000000;
/*370*/	r1.x = r1.x * r1.x;
/*371*/	r1.x = r1.x * r1.y;
/*372*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*373*/	r1.y = sqrt(r1.y);
/*374*/	r1.z = max(cb2.data[2].z, 0.001000);
/*375*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*376*/	r1.y = r1.z * r1.y;
/*377*/	r1.y = min(r1.y, 1.000000);
/*378*/	r1.z = r1.y * -2.000000 + 3.000000;
/*379*/	r1.y = r1.y * r1.y;
/*380*/	r1.y = r1.y * r1.z;
/*381*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*382*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*383*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*384*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*385*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*386*/	r4.w = max(r4.y, 0.000000);
/*387*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*388*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*389*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*390*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*391*/	r0.w = saturate(r0.w * r1.y);
/*392*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*393*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*394*/	color0.w = r1.w;
/*395*/	return;
}
