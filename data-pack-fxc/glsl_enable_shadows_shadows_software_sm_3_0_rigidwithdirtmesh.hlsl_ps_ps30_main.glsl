//
//
// Shader Model 4
// Fragment Shader
//
// id: 5211 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidwithdirtmesh.hlsl_PS_ps30_main.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

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
/*31*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*33*/	r5.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r1.w = r4.w * r5.w;
/*36*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r4.wwww + r3.xyxx).xy;
/*39*/	r2.z = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r2.z = inversesqrt(r2.z);
/*41*/	r3.xyz = (r2.zzzz * r3.xyzx).xyz;
/*42*/	r4.xyz = (r1.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*45*/	r1.w = inversesqrt(r1.w);
/*46*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*47*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*50*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*51*/	r1.w = inversesqrt(r1.w);
/*52*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*53*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*54*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*55*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*56*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*57*/	r1.w = inversesqrt(r1.w);
/*58*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*59*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*60*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*61*/	if(floatBitsToUint(r0.w) != 0u) {
/*62*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*63*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*64*/	  r0.w = r2.w * cb0.data[26].x;
/*65*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*66*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*67*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*68*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*69*/	  r2.xy = (r2.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*70*/	}
/*71*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*72*/	if(floatBitsToUint(r0.w) != 0u) {
/*73*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*74*/	  if(floatBitsToUint(r0.w) != 0u) {
/*75*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*76*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*77*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*78*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*79*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*80*/	    r0.w = -r0.w + 1.000000;
/*81*/	    r0.w = max(r0.w, 0.000000);
/*82*/	    r8.z = sqrt(r0.w);
/*83*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*84*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*85*/	    r0.w = inversesqrt(r0.w);
/*86*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*87*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*88*/	    r10.y = -1.000000;
/*89*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*90*/	    r0.w = inversesqrt(r0.w);
/*91*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*92*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*93*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*94*/	    r1.w = r1.w * 1.250000;
/*95*/	    r1.w = min(r1.w, 1.000000);
/*96*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*97*/	    r2.z = r2.z * 4.000000;
/*98*/	    r1.w = r1.w * 0.200000 + r2.z;
/*99*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*100*/	    r0.w = r0.w + -r1.w;
/*101*/	    r0.w = saturate(r0.w * 200.000000);
/*102*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*103*/	    r0.w = r0.w * r0.w;
/*104*/	    r0.w = r0.w * r1.w;
/*105*/	    r2.x = r0.w * -r2.x + r2.x;
/*106*/	    r1.w = -r2.y + 0.200000;
/*107*/	    r2.y = r0.w * r1.w + r2.y;
/*108*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*109*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*110*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*111*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*112*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*113*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*114*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*115*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*116*/	    r1.w = -r1.w + 1.000000;
/*117*/	    r1.w = max(r1.w, 0.000000);
/*118*/	    r7.z = sqrt(r1.w);
/*119*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*120*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*121*/	    r1.w = sqrt(r1.w);
/*122*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*123*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*124*/	    r1.w = inversesqrt(r1.w);
/*125*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*126*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*127*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*128*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*129*/	    r1.w = -r3.y + 1.000000;
/*130*/	    r0.w = min(r0.w, r1.w);
/*131*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*132*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*133*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*134*/	    r0.w = inversesqrt(r0.w);
/*135*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*136*/	  }
/*137*/	}
/*138*/	r0.w = vsOut_T7.y * -r2.y + r2.y;
/*139*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*140*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*141*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*142*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*143*/	r2.yzw = (-r0.xxyz + r1.wwww).yzw;
/*144*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*145*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*146*/	r2.yzw = (-r1.xxyz + r1.wwww).yzw;
/*147*/	r1.xyz = (vsOut_T7.zzzz * r2.yzwy + r1.xyzx).xyz;
/*148*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*149*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*150*/	r1.w = inversesqrt(r1.w);
/*151*/	r2.yzw = (r1.wwww * r3.xxyz).yzw;
/*152*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*153*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*154*/	r4.x = inversesqrt(r1.w);
/*155*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*156*/	r4.w = -r2.x + 1.000000;
/*157*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*158*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.yzwy));
/*159*/	r5.y = r5.y + r5.y;
/*160*/	r5.yzw = (r2.yyzw * -r5.yyyy + r4.xxyz).yzw;
/*161*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*162*/	r6.w = r4.w * 1.539380;
/*163*/	r6.w = cos((r6.w));
/*164*/	r6.w = inversesqrt(r6.w);
/*165*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*166*/	r7.x = saturate(r0.w * 60.000000);
/*167*/	r7.x = -r0.w + r7.x;
/*168*/	r7.yzw = (r2.yyzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*169*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*170*/	r8.x = inversesqrt(r8.x);
/*171*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*172*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*173*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*174*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*175*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*176*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*177*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*178*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*179*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*180*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*181*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*182*/	r6.y = -r0.w + 1.000000;
/*183*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*184*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*185*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*186*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*187*/	  r6.y = max(r6.y, 0.000000);
/*188*/	  r6.y = log2(r6.y);
/*189*/	  r6.y = r6.y * 10.000000;
/*190*/	  r6.y = exp2(r6.y);
/*191*/	  r6.y = r6.w * r6.y;
/*192*/	  r6.y = r6.y * r7.x + r0.w;
/*193*/	  r8.x = r4.w * 8.000000;
/*194*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*195*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*196*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*197*/	}
/*198*/	r2.y = dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy));
/*199*/	r2.z = max(r2.y, 0.000000);
/*200*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*201*/	if(floatBitsToUint(r2.y) != 0u) {
/*202*/	  r2.y = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*203*/	  r2.y = max(r2.y, -1.000000);
/*204*/	  r2.y = min(r2.y, 1.000000);
/*205*/	  r2.w = -abs(r2.y) + 1.000000;
/*206*/	  r2.w = sqrt(r2.w);
/*207*/	  r5.y = abs(r2.y) * -0.018729 + 0.074261;
/*208*/	  r5.y = r5.y * abs(r2.y) + -0.212114;
/*209*/	  r5.y = r5.y * abs(r2.y) + 1.570729;
/*210*/	  r5.z = r2.w * r5.y;
/*211*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*212*/	  r2.y = uintBitsToFloat((r2.y < -r2.y) ? 0xffffffffu : 0x00000000u);
/*213*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r5.z));
/*214*/	  r2.y = r5.y * r2.w + r2.y;
/*215*/	  r2.x = r2.x * r2.x;
/*216*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*217*/	  r2.x = r2.x * r2.w + r6.x;
/*218*/	  r2.x = r2.x * 0.500000 + 0.500000;
/*219*/	  r2.x = r2.x * 2.000000 + -1.000000;
/*220*/	  r2.w = -r2.x * r2.x + 1.000000;
/*221*/	  r2.w = max(r2.w, 0.001000);
/*222*/	  r2.w = log2(r2.w);
/*223*/	  r5.x = r2.w * 4.950617;
/*224*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*225*/	  r5.y = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*226*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*227*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.x));
/*228*/	  r2.x = floatBitsToInt(r2.x);
/*229*/	  r5.x = r2.w * r2.w + -r5.x;
/*230*/	  r5.x = sqrt(r5.x);
/*231*/	  r2.w = -r2.w + r5.x;
/*232*/	  r2.w = max(r2.w, 0.000000);
/*233*/	  r2.w = sqrt(r2.w);
/*234*/	  r2.x = r2.w * r2.x;
/*235*/	  r2.x = r2.x * 1.414214;
/*236*/	  r2.x = 0.008727 / r2.x;
/*237*/	  r2.x = max(r2.x, 0.000100);
/*238*/	  r2.yw = (r2.yyyy + vec4(0.000000, -0.008727, 0.000000, 0.008727)).yw;
/*239*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*240*/	  r2.xy = (r2.xxxx * r2.ywyy).xy;
/*241*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*242*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*243*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*244*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*245*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*246*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*247*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*248*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*249*/	  r2.x = floatBitsToInt(r2.x);
/*250*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*251*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*252*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*253*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*254*/	  r2.x = r2.x * r5.x + 1.000000;
/*255*/	  r2.x = r2.x * 0.500000;
/*256*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*257*/	  r2.y = r2.y * r5.y + 1.000000;
/*258*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*259*/	  r2.y = min(r2.z, 1.000000);
/*260*/	  r2.w = r4.w * 1.570796;
/*261*/	  r2.w = sin(r2.w);
/*262*/	  r2.y = r2.y + -1.000000;
/*263*/	  r2.y = r2.w * r2.y + 1.000000;
/*264*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*265*/	  r2.w = max(r2.w, 0.000000);
/*266*/	  r2.w = log2(r2.w);
/*267*/	  r2.w = r2.w * 10.000000;
/*268*/	  r2.w = exp2(r2.w);
/*269*/	  r2.w = r6.w * r2.w;
/*270*/	  r2.w = r2.w * r7.x + r0.w;
/*271*/	  r2.x = r2.y * abs(r2.x);
/*272*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*273*/	} else {
/*274*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*275*/	}
/*276*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*277*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*278*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*279*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*280*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*281*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*282*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*283*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*284*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*285*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*286*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*287*/	r2.w = 1.000000;
/*288*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*289*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*290*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*291*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*292*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*293*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*294*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*295*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*296*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*297*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*298*/	if(r0.w != 0) discard;
/*299*/	r0.w = sqrt(r1.w);
/*300*/	r1.x = saturate(cb2.data[0].w)/**/;
/*301*/	r1.x = -r1.x + 1.000000;
/*302*/	r1.x = r1.x * 8.000000 + -4.000000;
/*303*/	r1.y = saturate(cb2.data[1].x)/**/;
/*304*/	r1.y = -r1.y + 1.000000;
/*305*/	r1.y = r1.y * 1000.000000;
/*306*/	r0.w = r0.w / r1.y;
/*307*/	r0.w = r0.w + r1.x;
/*308*/	r0.w = r0.w * 1.442695;
/*309*/	r0.w = exp2(r0.w);
/*310*/	r0.w = cb2.data[1].y / r0.w;
/*311*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*312*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*313*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*314*/	r1.x = r1.x + -cb2.data[1].z;
/*315*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*316*/	r1.x = saturate(r1.y * r1.x);
/*317*/	r1.y = r1.x * -2.000000 + 3.000000;
/*318*/	r1.x = r1.x * r1.x;
/*319*/	r1.x = r1.x * r1.y;
/*320*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*321*/	r1.y = sqrt(r1.y);
/*322*/	r1.z = max(cb2.data[2].z, 0.001000);
/*323*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*324*/	r1.y = r1.z * r1.y;
/*325*/	r1.y = min(r1.y, 1.000000);
/*326*/	r1.z = r1.y * -2.000000 + 3.000000;
/*327*/	r1.y = r1.y * r1.y;
/*328*/	r1.y = r1.y * r1.z;
/*329*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*330*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*331*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*332*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*333*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*334*/	r3.w = max(r3.y, 0.000000);
/*335*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*336*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*337*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*338*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*339*/	r0.w = saturate(r0.w * r1.y);
/*340*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*341*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*342*/	color0.w = 1.000000;
/*343*/	return;
}
