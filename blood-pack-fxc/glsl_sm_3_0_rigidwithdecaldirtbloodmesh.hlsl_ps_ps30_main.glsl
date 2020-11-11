//
//
// Shader Model 4
// Fragment Shader
//
// id: 947 - fxc/glsl_SM_3_0_rigidwithdecaldirtbloodmesh.hlsl_PS_ps30_main.glsl
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
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

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
/*59*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*61*/	r4.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*62*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*63*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*64*/	r1.w = r4.w * r5.w;
/*65*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*66*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*67*/	r3.xy = (r4.xyxx * r4.wwww + r3.xyxx).xy;
/*68*/	r3.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*69*/	r3.w = inversesqrt(r3.w);
/*70*/	r3.xyz = (r3.wwww * r3.xyzx).xyz;
/*71*/	r2.zw = (r2.zzzw * vec4(0.000000, 0.000000, 0.750000, 0.750000) + vsOut_T6.yyyz).zw;
/*72*/	r4.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*73*/	r2.z = -vsOut_T7.w * 0.900000 + 1.000000;
/*74*/	r2.z = saturate(-r2.z + r4.w);
/*75*/	r2.z = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r2.z) != 0u) {
/*77*/	  r2.z = -r4.w + 1.000000;
/*78*/	  r2.z = saturate(vsOut_T7.w * 0.900000 + -r2.z);
/*79*/	  r2.z = -r2.z + 1.000000;
/*80*/	  r2.z = -r2.z * r2.z + 1.000000;
/*81*/	  r2.z = r2.z * -0.600000 + 1.000000;
/*82*/	  r4.xyz = (r2.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*83*/	  r2.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*84*/	  r2.z = uintBitsToFloat((r2.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*85*/	  r2.z = uintBitsToFloat(floatBitsToUint(r2.z) & uint(0x3f800000u));
/*86*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*87*/	  r0.xyz = (r2.zzzz * r5.xyzx + r4.xyzx).xyz;
/*88*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*89*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*90*/	} else {
/*91*/	  r5.xyz = (r1.wwww * r1.xyzx).xyz;
/*92*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*93*/	}
/*94*/	r1.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*95*/	r1.x = inversesqrt(r1.x);
/*96*/	r1.xyz = (r1.xxxx * vsOut_T3.xyzx).xyz;
/*97*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*98*/	r1.w = inversesqrt(r1.w);
/*99*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*100*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*101*/	r1.w = inversesqrt(r1.w);
/*102*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*103*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*104*/	r7.xyz = (r3.xxxx * r1.xyzx + r7.xyzx).xyz;
/*105*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*106*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*107*/	r1.w = inversesqrt(r1.w);
/*108*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*109*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*110*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*111*/	if(floatBitsToUint(r0.w) != 0u) {
/*112*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*113*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*114*/	  r0.w = r2.w * cb0.data[26].x;
/*115*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*116*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*117*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*118*/	  r4.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r4.xyzx).xyz;
/*119*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*120*/	}
/*121*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*122*/	if(floatBitsToUint(r0.w) != 0u) {
/*123*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*124*/	  if(floatBitsToUint(r0.w) != 0u) {
/*125*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*126*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*127*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*128*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*129*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*130*/	    r0.w = -r0.w + 1.000000;
/*131*/	    r0.w = max(r0.w, 0.000000);
/*132*/	    r8.z = sqrt(r0.w);
/*133*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*134*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*135*/	    r0.w = inversesqrt(r0.w);
/*136*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*137*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*138*/	    r10.y = -1.000000;
/*139*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*140*/	    r0.w = inversesqrt(r0.w);
/*141*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*142*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*143*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*144*/	    r1.w = r1.w * 1.250000;
/*145*/	    r1.w = min(r1.w, 1.000000);
/*146*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*147*/	    r2.z = r2.z * 4.000000;
/*148*/	    r1.w = r1.w * 0.200000 + r2.z;
/*149*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*150*/	    r0.w = r0.w + -r1.w;
/*151*/	    r0.w = saturate(r0.w * 200.000000);
/*152*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*153*/	    r0.w = r0.w * r0.w;
/*154*/	    r0.w = r0.w * r1.w;
/*155*/	    r2.x = r0.w * -r2.x + r2.x;
/*156*/	    r1.w = -r2.y + 0.200000;
/*157*/	    r2.y = r0.w * r1.w + r2.y;
/*158*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*159*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*160*/	    r9.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*161*/	    r4.xyz = (r0.wwww * r9.xyzx + r4.xyzx).xyz;
/*162*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*163*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*164*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*165*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*166*/	    r1.w = -r1.w + 1.000000;
/*167*/	    r1.w = max(r1.w, 0.000000);
/*168*/	    r7.z = sqrt(r1.w);
/*169*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*170*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*171*/	    r1.w = sqrt(r1.w);
/*172*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*173*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*174*/	    r1.w = inversesqrt(r1.w);
/*175*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*176*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*177*/	    r1.xyz = (r7.xxxx * r1.xyzx + r5.xyzx).xyz;
/*178*/	    r1.xyz = (r7.zzzz * r6.xyzx + r1.xyzx).xyz;
/*179*/	    r1.w = -r3.y + 1.000000;
/*180*/	    r0.w = min(r0.w, r1.w);
/*181*/	    r1.xyz = (-r3.xyzx + r1.xyzx).xyz;
/*182*/	    r1.xyz = (r0.wwww * r1.xyzx + r3.xyzx).xyz;
/*183*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*184*/	    r0.w = inversesqrt(r0.w);
/*185*/	    r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*186*/	  }
/*187*/	}
/*188*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*189*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*190*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*191*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*192*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*193*/	r1.xyz = (-r0.xyzx + r1.xxxx).xyz;
/*194*/	r0.xyz = (vsOut_T7.zzzz * r1.xyzx + r0.xyzx).xyz;
/*195*/	r1.x = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*196*/	r1.xyz = (-r4.xyzx + r1.xxxx).xyz;
/*197*/	r1.xyz = (vsOut_T7.zzzz * r1.xyzx + r4.xyzx).xyz;
/*198*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*199*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*200*/	r1.w = inversesqrt(r1.w);
/*201*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*202*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*203*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*204*/	r4.x = inversesqrt(r1.w);
/*205*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*206*/	r4.w = -r2.x + 1.000000;
/*207*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*208*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*209*/	r5.y = r5.y + r5.y;
/*210*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*211*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*212*/	r6.w = r4.w * 1.539380;
/*213*/	r6.w = cos((r6.w));
/*214*/	r6.w = inversesqrt(r6.w);
/*215*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*216*/	r7.x = saturate(r0.w * 60.000000);
/*217*/	r7.x = -r0.w + r7.x;
/*218*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*219*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*220*/	r8.x = inversesqrt(r8.x);
/*221*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*222*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*223*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*224*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*225*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*226*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*227*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*228*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*229*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*230*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*231*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*232*/	r6.y = -r0.w + 1.000000;
/*233*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*234*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*235*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*236*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*237*/	  r6.y = max(r6.y, 0.000000);
/*238*/	  r6.y = log2(r6.y);
/*239*/	  r6.y = r6.y * 10.000000;
/*240*/	  r6.y = exp2(r6.y);
/*241*/	  r6.y = r6.w * r6.y;
/*242*/	  r6.y = r6.y * r7.x + r0.w;
/*243*/	  r8.x = r4.w * 8.000000;
/*244*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*245*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*246*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*247*/	}
/*248*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*249*/	r2.z = max(r2.y, 0.000000);
/*250*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*251*/	if(floatBitsToUint(r2.y) != 0u) {
/*252*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*253*/	  r2.y = max(r2.y, -1.000000);
/*254*/	  r2.y = min(r2.y, 1.000000);
/*255*/	  r2.w = -abs(r2.y) + 1.000000;
/*256*/	  r2.w = sqrt(r2.w);
/*257*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*258*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*259*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*260*/	  r5.z = r2.w * r5.y;
/*261*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*262*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*263*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*264*/	  r2.y = r5.y * r2.w + r2.y;
/*265*/	  r2.x = r2.x * r2.x;
/*266*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*267*/	  r2.x = r2.x * r2.w + r6.x;
/*268*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*269*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*270*/	  r2.w = -r2.x * r2.x + 1.000000;
/*271*/	  r2.w = max(r2.w, 0.001000);
/*272*/	  r2.w = log2(r2.w);
/*273*/	  r5.x = r2.w * 4.950617;
/*274*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*275*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*276*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*277*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*278*/	  r2.x = floatBitsToInt(r2.x);
/*279*/	  r5.x = r2.w * r2.w + -r5.x;
/*280*/	  r5.x = sqrt(r5.x);
/*281*/	  r2.w = -r2.w + r5.x;
/*282*/	  r2.w = max(r2.w, 0.000000);
/*283*/	  r2.w = sqrt(r2.w);
/*284*/	  r2.x = r2.w * r2.x;
/*285*/	  r2.x = r2.x * 1.414214;
/*286*/	  r2.x = 0.008727 / r2.x;
/*287*/	  r2.x = max(r2.x, 0.000100);
/*288*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*289*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*290*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*291*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*292*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*293*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*294*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*295*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*296*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*297*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*298*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*299*/	  r2.x = floatBitsToInt(r2.x);
/*300*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*301*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*302*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*303*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*304*/	  r2.x = r2.x * r5.x + 1.000000;
/*305*/	  r2.x = r2.x * 0.500000;
/*306*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*307*/	  r2.y = r2.y * r5.y + 1.000000;
/*308*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*309*/	  r2.y = min(r2.z, 1.000000);
/*310*/	  r2.w = r4.w * 1.570796;
/*311*/	  r2.w = sin(r2.w);
/*312*/	  r2.y = r2.y + -1.000000;
/*313*/	  r2.y = r2.w * r2.y + 1.000000;
/*314*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*315*/	  r2.w = max(r2.w, 0.000000);
/*316*/	  r2.w = log2(r2.w);
/*317*/	  r2.w = r2.w * 10.000000;
/*318*/	  r2.w = exp2(r2.w);
/*319*/	  r2.w = r6.w * r2.w;
/*320*/	  r2.w = r2.w * r7.x + r0.w;
/*321*/	  r2.x = r2.y * abs(r2.x);
/*322*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*323*/	} else {
/*324*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*325*/	}
/*326*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*327*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*328*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*329*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*330*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*331*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*332*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*333*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*334*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*335*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*336*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*337*/	r2.w = 1.000000;
/*338*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*339*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*340*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*341*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*342*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*343*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*344*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*345*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*346*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*347*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*348*/	if(r0.w != 0) discard;
/*349*/	r0.w = sqrt(r1.w);
/*350*/	r1.x = saturate(cb2.data[0].w)/**/;
/*351*/	r1.x = -r1.x + 1.000000;
/*352*/	r1.x = r1.x * 8.000000 + -4.000000;
/*353*/	r1.y = saturate(cb2.data[1].x)/**/;
/*354*/	r1.y = -r1.y + 1.000000;
/*355*/	r1.y = r1.y * 1000.000000;
/*356*/	r0.w = r0.w / r1.y;
/*357*/	r0.w = r0.w + r1.x;
/*358*/	r0.w = r0.w * 1.442695;
/*359*/	r0.w = exp2(r0.w);
/*360*/	r0.w = cb2.data[1].y / r0.w;
/*361*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*362*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*363*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*364*/	r1.x = r1.x + -cb2.data[1].z;
/*365*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*366*/	r1.x = saturate(r1.y * r1.x);
/*367*/	r1.y = r1.x * -2.000000 + 3.000000;
/*368*/	r1.x = r1.x * r1.x;
/*369*/	r1.x = r1.x * r1.y;
/*370*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*371*/	r1.y = sqrt(r1.y);
/*372*/	r1.z = max(cb2.data[2].z, 0.001000);
/*373*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*374*/	r1.y = r1.z * r1.y;
/*375*/	r1.y = min(r1.y, 1.000000);
/*376*/	r1.z = r1.y * -2.000000 + 3.000000;
/*377*/	r1.y = r1.y * r1.y;
/*378*/	r1.y = r1.y * r1.z;
/*379*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*380*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*381*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*382*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*383*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*384*/	r3.w = max(r3.y, 0.000000);
/*385*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*386*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*387*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*388*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*389*/	r0.w = saturate(r0.w * r1.y);
/*390*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*391*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*392*/	color0.w = 1.000000;
/*393*/	return;
}
