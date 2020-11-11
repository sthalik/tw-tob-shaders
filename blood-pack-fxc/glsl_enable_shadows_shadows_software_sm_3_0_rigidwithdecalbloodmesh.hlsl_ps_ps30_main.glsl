//
//
// Shader Model 4
// Fragment Shader
//
// id: 5150 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdecalbloodmesh.hlsl_PS_ps30_main.glsl
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
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*31*/	r2.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*33*/	r2.zw = (r4.xxxy / r2.zzzw).zw;
/*34*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*35*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*36*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*37*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*38*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*39*/	r4.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*40*/	r5.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*41*/	if(floatBitsToUint(r1.w) != 0u) {
/*42*/	  r2.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*43*/	  r5.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*44*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*45*/	  r1.w = -r1.w + 1.000000;
/*46*/	  r1.w = max(r1.w, 0.000000);
/*47*/	  r5.z = sqrt(r1.w);
/*48*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*50*/	  r1.w = r2.y * r7.w;
/*51*/	  r2.y = r1.w * -0.500000 + r2.y;
/*52*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*53*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*54*/	  r1.w = -r4.w * r6.w + 1.000000;
/*55*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*56*/	  r4.xyz = (-r3.xyzx + r5.xyzx).xyz;
/*57*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*58*/	}
/*59*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*60*/	r2.zw = (r2.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*61*/	r4.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*62*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*63*/	r1.w = saturate(-r1.w + r4.w);
/*64*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r1.w) != 0u) {
/*66*/	  r1.w = -r4.w + 1.000000;
/*67*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*68*/	  r1.w = -r1.w + 1.000000;
/*69*/	  r1.w = -r1.w * r1.w + 1.000000;
/*70*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*71*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*72*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*73*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*74*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*75*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*76*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*77*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*78*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*79*/	}
/*80*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*83*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*89*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*90*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*91*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*92*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*95*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*96*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*97*/	if(floatBitsToUint(r0.w) != 0u) {
/*98*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*99*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*100*/	  r0.w = r2.w * cb0.data[26].x;
/*101*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*102*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*103*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*104*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*105*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*106*/	}
/*107*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*108*/	if(floatBitsToUint(r0.w) != 0u) {
/*109*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*110*/	  if(floatBitsToUint(r0.w) != 0u) {
/*111*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*112*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*113*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*114*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*115*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*116*/	    r0.w = -r0.w + 1.000000;
/*117*/	    r0.w = max(r0.w, 0.000000);
/*118*/	    r8.z = sqrt(r0.w);
/*119*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*120*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*121*/	    r0.w = inversesqrt(r0.w);
/*122*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*123*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*124*/	    r10.y = -1.000000;
/*125*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*126*/	    r0.w = inversesqrt(r0.w);
/*127*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*128*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*129*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*130*/	    r1.w = r1.w * 1.250000;
/*131*/	    r1.w = min(r1.w, 1.000000);
/*132*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*133*/	    r2.z = r2.z * 4.000000;
/*134*/	    r1.w = r1.w * 0.200000 + r2.z;
/*135*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*136*/	    r0.w = r0.w + -r1.w;
/*137*/	    r0.w = saturate(r0.w * 200.000000);
/*138*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*139*/	    r0.w = r0.w * r0.w;
/*140*/	    r0.w = r0.w * r1.w;
/*141*/	    r2.x = r0.w * -r2.x + r2.x;
/*142*/	    r1.w = -r2.y + 0.200000;
/*143*/	    r2.y = r0.w * r1.w + r2.y;
/*144*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*145*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*146*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*147*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*148*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*149*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*150*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*151*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*152*/	    r1.w = -r1.w + 1.000000;
/*153*/	    r1.w = max(r1.w, 0.000000);
/*154*/	    r7.z = sqrt(r1.w);
/*155*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*156*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*157*/	    r1.w = sqrt(r1.w);
/*158*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*159*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*160*/	    r1.w = inversesqrt(r1.w);
/*161*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*162*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*163*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*164*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*165*/	    r1.w = -r3.y + 1.000000;
/*166*/	    r0.w = min(r0.w, r1.w);
/*167*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*168*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*169*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*170*/	    r0.w = inversesqrt(r0.w);
/*171*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*172*/	  }
/*173*/	}
/*174*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*175*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*176*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*177*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*178*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*179*/	r2.yzw = (-r0.xxyz + r1.wwww).yzw;
/*180*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*181*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*182*/	r2.yzw = (-r1.xxyz + r1.wwww).yzw;
/*183*/	r1.xyz = (vsOut_T7.zzzz * r2.yzwy + r1.xyzx).xyz;
/*184*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*185*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*186*/	r1.w = inversesqrt(r1.w);
/*187*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*188*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*189*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*190*/	r4.x = inversesqrt(r1.w);
/*191*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*192*/	r4.w = -r2.x + 1.000000;
/*193*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*195*/	r5.y = r5.y + r5.y;
/*196*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*197*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*198*/	r6.w = r4.w * 1.539380;
/*199*/	r6.w = cos((r6.w));
/*200*/	r6.w = inversesqrt(r6.w);
/*201*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*202*/	r7.x = saturate(r0.w * 60.000000);
/*203*/	r7.x = -r0.w + r7.x;
/*204*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*205*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*206*/	r8.x = inversesqrt(r8.x);
/*207*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*208*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*209*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*210*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*211*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*212*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*213*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*214*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*215*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*216*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*217*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*218*/	r6.y = -r0.w + 1.000000;
/*219*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*220*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*221*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*222*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*223*/	  r6.y = max(r6.y, 0.000000);
/*224*/	  r6.y = log2(r6.y);
/*225*/	  r6.y = r6.y * 10.000000;
/*226*/	  r6.y = exp2(r6.y);
/*227*/	  r6.y = r6.w * r6.y;
/*228*/	  r6.y = r6.y * r7.x + r0.w;
/*229*/	  r8.x = r4.w * 8.000000;
/*230*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*231*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*232*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*233*/	}
/*234*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*235*/	r2.z = max(r2.y, 0.000000);
/*236*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*237*/	if(floatBitsToUint(r2.y) != 0u) {
/*238*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*239*/	  r2.y = max(r2.y, -1.000000);
/*240*/	  r2.y = min(r2.y, 1.000000);
/*241*/	  r2.w = -abs(r2.y) + 1.000000;
/*242*/	  r2.w = sqrt(r2.w);
/*243*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*244*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*245*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*246*/	  r5.z = r2.w * r5.y;
/*247*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*248*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*249*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*250*/	  r2.y = r5.y * r2.w + r2.y;
/*251*/	  r2.x = r2.x * r2.x;
/*252*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*253*/	  r2.x = r2.x * r2.w + r6.x;
/*254*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*255*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*256*/	  r2.w = -r2.x * r2.x + 1.000000;
/*257*/	  r2.w = max(r2.w, 0.001000);
/*258*/	  r2.w = log2(r2.w);
/*259*/	  r5.x = r2.w * 4.950617;
/*260*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*261*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*262*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*263*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*264*/	  r2.x = floatBitsToInt(r2.x);
/*265*/	  r5.x = r2.w * r2.w + -r5.x;
/*266*/	  r5.x = sqrt(r5.x);
/*267*/	  r2.w = -r2.w + r5.x;
/*268*/	  r2.w = max(r2.w, 0.000000);
/*269*/	  r2.w = sqrt(r2.w);
/*270*/	  r2.x = r2.w * r2.x;
/*271*/	  r2.x = r2.x * 1.414214;
/*272*/	  r2.x = 0.008727 / r2.x;
/*273*/	  r2.x = max(r2.x, 0.000100);
/*274*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*275*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*276*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*277*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*278*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*279*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*280*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*281*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*282*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*283*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*284*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*285*/	  r2.x = floatBitsToInt(r2.x);
/*286*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*287*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*288*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*289*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*290*/	  r2.x = r2.x * r5.x + 1.000000;
/*291*/	  r2.x = r2.x * 0.500000;
/*292*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*293*/	  r2.y = r2.y * r5.y + 1.000000;
/*294*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*295*/	  r2.y = min(r2.z, 1.000000);
/*296*/	  r2.w = r4.w * 1.570796;
/*297*/	  r2.w = sin(r2.w);
/*298*/	  r2.y = r2.y + -1.000000;
/*299*/	  r2.y = r2.w * r2.y + 1.000000;
/*300*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*301*/	  r2.w = max(r2.w, 0.000000);
/*302*/	  r2.w = log2(r2.w);
/*303*/	  r2.w = r2.w * 10.000000;
/*304*/	  r2.w = exp2(r2.w);
/*305*/	  r2.w = r6.w * r2.w;
/*306*/	  r2.w = r2.w * r7.x + r0.w;
/*307*/	  r2.x = r2.y * abs(r2.x);
/*308*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*309*/	} else {
/*310*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*311*/	}
/*312*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*313*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*314*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*315*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*316*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*317*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*318*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*319*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*320*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*321*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*322*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*323*/	r2.w = 1.000000;
/*324*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*325*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*326*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*327*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*328*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*329*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*330*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*331*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*332*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*333*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*334*/	if(r0.w != 0) discard;
/*335*/	r0.w = sqrt(r1.w);
/*336*/	r1.x = saturate(cb2.data[0].w)/**/;
/*337*/	r1.x = -r1.x + 1.000000;
/*338*/	r1.x = r1.x * 8.000000 + -4.000000;
/*339*/	r1.y = saturate(cb2.data[1].x)/**/;
/*340*/	r1.y = -r1.y + 1.000000;
/*341*/	r1.y = r1.y * 1000.000000;
/*342*/	r0.w = r0.w / r1.y;
/*343*/	r0.w = r0.w + r1.x;
/*344*/	r0.w = r0.w * 1.442695;
/*345*/	r0.w = exp2(r0.w);
/*346*/	r0.w = cb2.data[1].y / r0.w;
/*347*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*348*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*349*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*350*/	r1.x = r1.x + -cb2.data[1].z;
/*351*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*352*/	r1.x = saturate(r1.y * r1.x);
/*353*/	r1.y = r1.x * -2.000000 + 3.000000;
/*354*/	r1.x = r1.x * r1.x;
/*355*/	r1.x = r1.x * r1.y;
/*356*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*357*/	r1.y = sqrt(r1.y);
/*358*/	r1.z = max(cb2.data[2].z, 0.001000);
/*359*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*360*/	r1.y = r1.z * r1.y;
/*361*/	r1.y = min(r1.y, 1.000000);
/*362*/	r1.z = r1.y * -2.000000 + 3.000000;
/*363*/	r1.y = r1.y * r1.y;
/*364*/	r1.y = r1.y * r1.z;
/*365*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*366*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*367*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*368*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*369*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*370*/	r3.w = max(r3.y, 0.000000);
/*371*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*372*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*373*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*374*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*375*/	r0.w = saturate(r0.w * r1.y);
/*376*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*377*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*378*/	color0.w = 1.000000;
/*379*/	return;
}
