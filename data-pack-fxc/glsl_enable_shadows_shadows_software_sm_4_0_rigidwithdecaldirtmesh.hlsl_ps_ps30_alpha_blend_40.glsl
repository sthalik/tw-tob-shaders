//
//
// Shader Model 4
// Fragment Shader
//
// id: 4911 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps30_alpha_blend_40.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
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
/*66*/	  r2.w = r3.x * r7.w;
/*67*/	  r3.x = r2.w * -0.500000 + r3.x;
/*68*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*69*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*70*/	  r2.w = -r5.w * r6.w + 1.000000;
/*71*/	  r0.xyz = (r2.wwww * r0.xyzx + r7.xyzx).xyz;
/*72*/	  r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*73*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*74*/	}
/*75*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*76*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.yyyz).zw;
/*77*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*78*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*79*/	r2.w = r4.w * r5.w;
/*80*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*81*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*82*/	r1.xy = (r3.zwzz * r4.wwww + r1.xyxx).xy;
/*83*/	r3.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*84*/	r3.z = inversesqrt(r3.z);
/*85*/	r1.xyz = (r1.xyzx * r3.zzzz).xyz;
/*86*/	r4.xyz = (r2.wwww * r2.xyzx).xyz;
/*87*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*88*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*89*/	r2.w = inversesqrt(r2.w);
/*90*/	r4.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*91*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*92*/	r2.w = inversesqrt(r2.w);
/*93*/	r5.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*94*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*95*/	r2.w = inversesqrt(r2.w);
/*96*/	r6.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*97*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*98*/	r7.xyz = (r1.xxxx * r4.xyzx + r7.xyzx).xyz;
/*99*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*100*/	r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*101*/	r2.w = inversesqrt(r2.w);
/*102*/	r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*103*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*104*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*105*/	if(floatBitsToUint(r0.w) != 0u) {
/*106*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*107*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*108*/	  r0.w = r3.w * cb0.data[26].x;
/*109*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*110*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*111*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*112*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*113*/	  r3.xy = (r3.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*114*/	}
/*115*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*116*/	if(floatBitsToUint(r0.w) != 0u) {
/*117*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*118*/	  if(floatBitsToUint(r0.w) != 0u) {
/*119*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*120*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*121*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*122*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*123*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*124*/	    r0.w = -r0.w + 1.000000;
/*125*/	    r0.w = max(r0.w, 0.000000);
/*126*/	    r8.z = sqrt(r0.w);
/*127*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*128*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*129*/	    r0.w = inversesqrt(r0.w);
/*130*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*131*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*132*/	    r10.y = -1.000000;
/*133*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*134*/	    r0.w = inversesqrt(r0.w);
/*135*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*136*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*137*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*138*/	    r2.w = r2.w * 1.250000;
/*139*/	    r2.w = min(r2.w, 1.000000);
/*140*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*141*/	    r3.z = r3.z * 4.000000;
/*142*/	    r2.w = r2.w * 0.200000 + r3.z;
/*143*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*144*/	    r0.w = r0.w + -r2.w;
/*145*/	    r0.w = saturate(r0.w * 200.000000);
/*146*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*147*/	    r0.w = r0.w * r0.w;
/*148*/	    r0.w = r0.w * r2.w;
/*149*/	    r3.y = r0.w * -r3.y + r3.y;
/*150*/	    r2.w = -r3.x + 0.200000;
/*151*/	    r3.x = r0.w * r2.w + r3.x;
/*152*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*153*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*154*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*155*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*156*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*157*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*158*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*159*/	    r2.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*160*/	    r2.w = -r2.w + 1.000000;
/*161*/	    r2.w = max(r2.w, 0.000000);
/*162*/	    r7.z = sqrt(r2.w);
/*163*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*164*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*165*/	    r2.w = sqrt(r2.w);
/*166*/	    r7.xyz = (r8.xyzx * r2.wwww + r7.xyzx).xyz;
/*167*/	    r2.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*168*/	    r2.w = inversesqrt(r2.w);
/*169*/	    r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*170*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*171*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*172*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*173*/	    r2.w = -r1.y + 1.000000;
/*174*/	    r0.w = min(r0.w, r2.w);
/*175*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*176*/	    r4.xyz = (r0.wwww * r4.xyzx + r1.xyzx).xyz;
/*177*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*178*/	    r0.w = inversesqrt(r0.w);
/*179*/	    r1.xyz = (r0.wwww * r4.xyzx).xyz;
/*180*/	  }
/*181*/	}
/*182*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*183*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*184*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*185*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*186*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*187*/	r3.xzw = (-r0.xxyz + r2.wwww).xzw;
/*188*/	r0.xyz = (vsOut_T7.zzzz * r3.xzwx + r0.xyzx).xyz;
/*189*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*190*/	r3.xzw = (-r2.xxyz + r2.wwww).xzw;
/*191*/	r2.xyz = (vsOut_T7.zzzz * r3.xzwx + r2.xyzx).xyz;
/*192*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*193*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*194*/	r2.w = inversesqrt(r2.w);
/*195*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*196*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*197*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*198*/	r3.x = inversesqrt(r2.w);
/*199*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*200*/	r5.x = -r3.y + 1.000000;
/*201*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*202*/	r5.z = dot(vec3(r3.xzwx), vec3(r1.xyzx));
/*203*/	r5.z = r5.z + r5.z;
/*204*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*205*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*206*/	r5.z = r5.x * 1.539380;
/*207*/	r5.z = cos((r5.z));
/*208*/	r5.z = inversesqrt(r5.z);
/*209*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*210*/	r5.w = saturate(r0.w * 60.000000);
/*211*/	r5.w = -r0.w + r5.w;
/*212*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*213*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*214*/	r6.w = inversesqrt(r6.w);
/*215*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*216*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*217*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*218*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*219*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*220*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*221*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*222*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*223*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*224*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*225*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*226*/	r6.w = -r0.w + 1.000000;
/*227*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*228*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*229*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*230*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*231*/	  r6.w = max(r6.w, 0.000000);
/*232*/	  r6.w = log2(r6.w);
/*233*/	  r6.w = r6.w * 10.000000;
/*234*/	  r6.w = exp2(r6.w);
/*235*/	  r6.w = r5.z * r6.w;
/*236*/	  r6.w = r6.w * r5.w + r0.w;
/*237*/	  r7.y = r5.x * 8.000000;
/*238*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*239*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*240*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*241*/	}
/*242*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*243*/	r1.y = max(r1.x, 0.000000);
/*244*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*245*/	if(floatBitsToUint(r1.x) != 0u) {
/*246*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*247*/	  r1.x = max(r1.x, -1.000000);
/*248*/	  r1.x = min(r1.x, 1.000000);
/*249*/	  r1.z = -abs(r1.x) + 1.000000;
/*250*/	  r1.z = sqrt(r1.z);
/*251*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*252*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*253*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*254*/	  r6.y = r1.z * r6.x;
/*255*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*256*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*257*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*258*/	  r1.x = r6.x * r1.z + r1.x;
/*259*/	  r1.z = r3.y * r3.y;
/*260*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*261*/	  r1.z = r1.z * r3.y + r7.x;
/*262*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*263*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*264*/	  r3.y = -r1.z * r1.z + 1.000000;
/*265*/	  r3.y = max(r3.y, 0.001000);
/*266*/	  r3.y = log2(r3.y);
/*267*/	  r5.y = r3.y * 4.950617;
/*268*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*269*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*270*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*271*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*272*/	  r1.z = floatBitsToInt(r1.z);
/*273*/	  r5.y = r3.y * r3.y + -r5.y;
/*274*/	  r5.y = sqrt(r5.y);
/*275*/	  r3.y = -r3.y + r5.y;
/*276*/	  r3.y = max(r3.y, 0.000000);
/*277*/	  r3.y = sqrt(r3.y);
/*278*/	  r1.z = r1.z * r3.y;
/*279*/	  r1.z = r1.z * 1.414214;
/*280*/	  r1.z = 0.008727 / r1.z;
/*281*/	  r1.z = max(r1.z, 0.000100);
/*282*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*283*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*284*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*285*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*286*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*287*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*288*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*289*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*290*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*291*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*292*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*293*/	  r1.x = floatBitsToInt(r1.x);
/*294*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*295*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*296*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*297*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*298*/	  r1.x = r1.x * r6.x + 1.000000;
/*299*/	  r1.x = r1.x * 0.500000;
/*300*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*301*/	  r1.z = r1.z * r6.y + 1.000000;
/*302*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*303*/	  r1.z = min(r1.y, 1.000000);
/*304*/	  r3.y = r5.x * 1.570796;
/*305*/	  r3.y = sin(r3.y);
/*306*/	  r1.z = r1.z + -1.000000;
/*307*/	  r1.z = r3.y * r1.z + 1.000000;
/*308*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*309*/	  r3.x = max(r3.x, 0.000000);
/*310*/	  r3.x = log2(r3.x);
/*311*/	  r3.x = r3.x * 10.000000;
/*312*/	  r3.x = exp2(r3.x);
/*313*/	  r3.x = r5.z * r3.x;
/*314*/	  r3.x = r3.x * r5.w + r0.w;
/*315*/	  r1.x = r1.z * abs(r1.x);
/*316*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*317*/	} else {
/*318*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*319*/	}
/*320*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*321*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*322*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*323*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*324*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*325*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*326*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*327*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*328*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*329*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*330*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*331*/	r3.w = 1.000000;
/*332*/	r1.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*333*/	r1.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*334*/	r0.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*335*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*336*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*337*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*338*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*339*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*340*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*341*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*342*/	if(r0.w != 0) discard;
/*343*/	r0.w = sqrt(r2.w);
/*344*/	r1.x = saturate(cb2.data[0].w)/**/;
/*345*/	r1.x = -r1.x + 1.000000;
/*346*/	r1.x = r1.x * 8.000000 + -4.000000;
/*347*/	r1.y = saturate(cb2.data[1].x)/**/;
/*348*/	r1.y = -r1.y + 1.000000;
/*349*/	r1.y = r1.y * 1000.000000;
/*350*/	r0.w = r0.w / r1.y;
/*351*/	r0.w = r0.w + r1.x;
/*352*/	r0.w = r0.w * 1.442695;
/*353*/	r0.w = exp2(r0.w);
/*354*/	r0.w = cb2.data[1].y / r0.w;
/*355*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*356*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*357*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*358*/	r1.x = r1.x + -cb2.data[1].z;
/*359*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*360*/	r1.x = saturate(r1.y * r1.x);
/*361*/	r1.y = r1.x * -2.000000 + 3.000000;
/*362*/	r1.x = r1.x * r1.x;
/*363*/	r1.x = r1.x * r1.y;
/*364*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*365*/	r1.y = sqrt(r1.y);
/*366*/	r1.z = max(cb2.data[2].z, 0.001000);
/*367*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*368*/	r1.y = r1.z * r1.y;
/*369*/	r1.y = min(r1.y, 1.000000);
/*370*/	r1.z = r1.y * -2.000000 + 3.000000;
/*371*/	r1.y = r1.y * r1.y;
/*372*/	r1.y = r1.y * r1.z;
/*373*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*374*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*375*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*376*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*377*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*378*/	r4.w = max(r4.y, 0.000000);
/*379*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*380*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*381*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*382*/	r2.xyz = (r1.xxxx * r2.xyzx + r3.xyzx).xyz;
/*383*/	r0.w = saturate(r0.w * r1.y);
/*384*/	r1.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*385*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*386*/	color0.w = r1.w;
/*387*/	return;
}
