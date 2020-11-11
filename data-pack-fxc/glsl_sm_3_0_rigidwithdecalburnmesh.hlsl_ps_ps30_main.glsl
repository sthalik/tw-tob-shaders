//
//
// Shader Model 4
// Fragment Shader
//
// id: 1127 - fxc/glsl_SM_3_0_rigidwithdecalburnmesh.hlsl_PS_ps30_main.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
  color0 = vec4(0);
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
/*4*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
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
/*50*/	  r1.w = r2.x * r7.w;
/*51*/	  r2.x = r1.w * -0.500000 + r2.x;
/*52*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*53*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*54*/	  r1.w = -r4.w * r6.w + 1.000000;
/*55*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*56*/	  r4.xyz = (-r3.xyzx + r5.xyzx).xyz;
/*57*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*58*/	}
/*59*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*60*/	r4.x = 0;
/*61*/	r4.y = cb0.data[26].x * 0.050000;
/*62*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*63*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*64*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*65*/	r1.w = saturate(r4.x * 5.000000);
/*66*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*67*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*68*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*69*/	r2.z = log2(r5.z);
/*70*/	r2.z = r2.z * 1.800000;
/*71*/	r2.z = exp2(r2.z);
/*72*/	r2.z = r2.z * 10.000000;
/*73*/	r2.z = min(r2.z, 1.000000);
/*74*/	r1.w = r1.w + r2.z;
/*75*/	r1.w = r1.w * 0.500000;
/*76*/	r2.z = -r5.w + 1.000000;
/*77*/	r2.z = log2(r2.z);
/*78*/	r2.z = r2.z * vsOut_T7.x;
/*79*/	r2.z = exp2(r2.z);
/*80*/	r2.z = min(r2.z, 1.000000);
/*81*/	r2.z = r2.z * vsOut_T7.x;
/*82*/	r2.w = r5.z * 0.250000;
/*83*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*84*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*85*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*86*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*87*/	r1.w = vsOut_T7.x + -0.025000;
/*88*/	r1.w = max(r1.w, 0.000000);
/*89*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*90*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*91*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*94*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*95*/	r1.w = inversesqrt(r1.w);
/*96*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*97*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*98*/	r1.w = inversesqrt(r1.w);
/*99*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*100*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*101*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*102*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*103*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*104*/	r1.w = inversesqrt(r1.w);
/*105*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*106*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*107*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*108*/	if(floatBitsToUint(r0.w) != 0u) {
/*109*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*110*/	  r2.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*111*/	  r0.w = r2.w * cb0.data[26].x;
/*112*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*113*/	  r2.zw = (vsOut_T1.xxxy * r2.zzzz + r7.xxxy).zw;
/*114*/	  r7.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*115*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*116*/	  r2.xy = (r2.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*117*/	}
/*118*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*119*/	if(floatBitsToUint(r0.w) != 0u) {
/*120*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*121*/	  if(floatBitsToUint(r0.w) != 0u) {
/*122*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*123*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*124*/	    r2.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*125*/	    r8.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*126*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*127*/	    r0.w = -r0.w + 1.000000;
/*128*/	    r0.w = max(r0.w, 0.000000);
/*129*/	    r8.z = sqrt(r0.w);
/*130*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*131*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*132*/	    r0.w = inversesqrt(r0.w);
/*133*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*134*/	    r10.xz = (cb3.data[0].xxyx).xz/**/;
/*135*/	    r10.y = -1.000000;
/*136*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*137*/	    r0.w = inversesqrt(r0.w);
/*138*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*139*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*140*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*141*/	    r1.w = r1.w * 1.250000;
/*142*/	    r1.w = min(r1.w, 1.000000);
/*143*/	    r2.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*144*/	    r2.z = r2.z * 4.000000;
/*145*/	    r1.w = r1.w * 0.200000 + r2.z;
/*146*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*147*/	    r0.w = r0.w + -r1.w;
/*148*/	    r0.w = saturate(r0.w * 200.000000);
/*149*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*150*/	    r0.w = r0.w * r0.w;
/*151*/	    r0.w = r0.w * r1.w;
/*152*/	    r2.y = r0.w * -r2.y + r2.y;
/*153*/	    r1.w = -r2.x + 0.200000;
/*154*/	    r2.x = r0.w * r1.w + r2.x;
/*155*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*156*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*157*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*158*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*159*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*160*/	    r2.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*161*/	    r7.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*162*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*163*/	    r1.w = -r1.w + 1.000000;
/*164*/	    r1.w = max(r1.w, 0.000000);
/*165*/	    r7.z = sqrt(r1.w);
/*166*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*167*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*168*/	    r1.w = sqrt(r1.w);
/*169*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*170*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*171*/	    r1.w = inversesqrt(r1.w);
/*172*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*173*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*174*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*175*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*176*/	    r1.w = -r3.y + 1.000000;
/*177*/	    r0.w = min(r0.w, r1.w);
/*178*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*179*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*180*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*181*/	    r0.w = inversesqrt(r0.w);
/*182*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*183*/	  }
/*184*/	}
/*185*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*186*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*187*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*188*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*189*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*190*/	r2.xzw = (-r0.xxyz + r1.wwww).xzw;
/*191*/	r0.xyz = (vsOut_T7.zzzz * r2.xzwx + r0.xyzx).xyz;
/*192*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*193*/	r2.xzw = (-r1.xxyz + r1.wwww).xzw;
/*194*/	r1.xyz = (vsOut_T7.zzzz * r2.xzwx + r1.xyzx).xyz;
/*195*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*196*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*197*/	r1.w = inversesqrt(r1.w);
/*198*/	r2.xzw = (r1.wwww * r3.xxyz).xzw;
/*199*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*200*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*201*/	r4.x = inversesqrt(r1.w);
/*202*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*203*/	r4.w = -r2.y + 1.000000;
/*204*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*205*/	r5.y = dot(vec3(r4.xyzx), vec3(r2.xzwx));
/*206*/	r5.y = r5.y + r5.y;
/*207*/	r5.yzw = (r2.xxzw * -r5.yyyy + r4.xxyz).yzw;
/*208*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*209*/	r6.w = r4.w * 1.539380;
/*210*/	r6.w = cos((r6.w));
/*211*/	r6.w = inversesqrt(r6.w);
/*212*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*213*/	r7.x = saturate(r0.w * 60.000000);
/*214*/	r7.x = -r0.w + r7.x;
/*215*/	r7.yzw = (r2.xxzw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*216*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*217*/	r8.x = inversesqrt(r8.x);
/*218*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*219*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*220*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*221*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*222*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*223*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*224*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*225*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*226*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*227*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*228*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*229*/	r6.y = -r0.w + 1.000000;
/*230*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*231*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*232*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*233*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.xyzx));
/*234*/	  r6.y = max(r6.y, 0.000000);
/*235*/	  r6.y = log2(r6.y);
/*236*/	  r6.y = r6.y * 10.000000;
/*237*/	  r6.y = exp2(r6.y);
/*238*/	  r6.y = r6.w * r6.y;
/*239*/	  r6.y = r6.y * r7.x + r0.w;
/*240*/	  r8.x = r4.w * 8.000000;
/*241*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*242*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*243*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*244*/	}
/*245*/	r2.x = dot(vec3(r2.xzwx), vec3(-cb1.data[0].yzwy));
/*246*/	r2.z = max(r2.x, 0.000000);
/*247*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*248*/	if(floatBitsToUint(r2.x) != 0u) {
/*249*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*250*/	  r2.x = max(r2.x, -1.000000);
/*251*/	  r2.x = min(r2.x, 1.000000);
/*252*/	  r2.w = -abs(r2.x) + 1.000000;
/*253*/	  r2.w = sqrt(r2.w);
/*254*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*255*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*256*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*257*/	  r5.z = r2.w * r5.y;
/*258*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*259*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*260*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*261*/	  r2.x = r5.y * r2.w + r2.x;
/*262*/	  r2.y = r2.y * r2.y;
/*263*/	    r2.w = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*264*/	  r2.y = r2.y * r2.w + r6.x;
/*265*/	  r2.y = r2.y * 0.500000 + 0.500000;
/*266*/	  r2.y = r2.y * 2.000000 + -1.000000;
/*267*/	  r2.w = -r2.y * r2.y + 1.000000;
/*268*/	  r2.w = max(r2.w, 0.001000);
/*269*/	  r2.w = log2(r2.w);
/*270*/	  r5.x = r2.w * 4.950617;
/*271*/	  r2.w = r2.w * 0.346574 + 4.546885;
/*272*/	  r5.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*273*/	  r2.y = uintBitsToFloat((r2.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*274*/	  r2.y = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.y));
/*275*/	  r2.y = floatBitsToInt(r2.y);
/*276*/	  r5.x = r2.w * r2.w + -r5.x;
/*277*/	  r5.x = sqrt(r5.x);
/*278*/	  r2.w = -r2.w + r5.x;
/*279*/	  r2.w = max(r2.w, 0.000000);
/*280*/	  r2.w = sqrt(r2.w);
/*281*/	  r2.y = r2.w * r2.y;
/*282*/	  r2.y = r2.y * 1.414214;
/*283*/	  r2.y = 0.008727 / r2.y;
/*284*/	  r2.y = max(r2.y, 0.000100);
/*285*/	  r2.xw = (r2.xxxx + vec4(-0.008727, 0.000000, 0.000000, 0.008727)).xw;
/*286*/	  r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*287*/	  r2.xy = (r2.yyyy * r2.xwxx).xy;
/*288*/	  r5.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*289*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*290*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*291*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*292*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*293*/	  r2.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxy)) * 0xffffffffu)).yw;
/*294*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*295*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r2.x));
/*296*/	  r2.x = floatBitsToInt(r2.x);
/*297*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*298*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*299*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*300*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*301*/	  r2.x = r2.x * r5.x + 1.000000;
/*302*/	  r2.x = r2.x * 0.500000;
/*303*/	  r2.y = 1 + ~floatBitsToInt(r2.w);
/*304*/	  r2.y = r2.y * r5.y + 1.000000;
/*305*/	  r2.x = r2.y * 0.500000 + -r2.x;
/*306*/	  r2.y = min(r2.z, 1.000000);
/*307*/	  r2.w = r4.w * 1.570796;
/*308*/	  r2.w = sin(r2.w);
/*309*/	  r2.y = r2.y + -1.000000;
/*310*/	  r2.y = r2.w * r2.y + 1.000000;
/*311*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*312*/	  r2.w = max(r2.w, 0.000000);
/*313*/	  r2.w = log2(r2.w);
/*314*/	  r2.w = r2.w * 10.000000;
/*315*/	  r2.w = exp2(r2.w);
/*316*/	  r2.w = r6.w * r2.w;
/*317*/	  r2.w = r2.w * r7.x + r0.w;
/*318*/	  r2.x = r2.y * abs(r2.x);
/*319*/	  r2.xyw = (r2.wwww * r2.xxxx).xyw;
/*320*/	} else {
/*321*/	  r2.xyw = (vec4(0, 0, 0, 0)).xyw;
/*322*/	}
/*323*/	r4.xyz = saturate(r6.zzzz * r2.xywx).xyz;
/*324*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*325*/	r2.xyw = (max(r0.wwww, r2.xyxw)).xyw;
/*326*/	r2.xyw = (-r2.xyxw + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*327*/	r0.xyz = (r0.xyzx * r2.zzzz).xyz;
/*328*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*329*/	r0.xyz = (r2.xywx * r0.xyzx).xyz;
/*330*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*331*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*332*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*333*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*334*/	r2.w = 1.000000;
/*335*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*336*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*337*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*338*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*339*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*340*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*341*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*342*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*343*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*344*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*345*/	if(r0.w != 0) discard;
/*346*/	r0.w = sqrt(r1.w);
/*347*/	r1.x = saturate(cb2.data[0].w)/**/;
/*348*/	r1.x = -r1.x + 1.000000;
/*349*/	r1.x = r1.x * 8.000000 + -4.000000;
/*350*/	r1.y = saturate(cb2.data[1].x)/**/;
/*351*/	r1.y = -r1.y + 1.000000;
/*352*/	r1.y = r1.y * 1000.000000;
/*353*/	r0.w = r0.w / r1.y;
/*354*/	r0.w = r0.w + r1.x;
/*355*/	r0.w = r0.w * 1.442695;
/*356*/	r0.w = exp2(r0.w);
/*357*/	r0.w = cb2.data[1].y / r0.w;
/*358*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*359*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*360*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*361*/	r1.x = r1.x + -cb2.data[1].z;
/*362*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*363*/	r1.x = saturate(r1.y * r1.x);
/*364*/	r1.y = r1.x * -2.000000 + 3.000000;
/*365*/	r1.x = r1.x * r1.x;
/*366*/	r1.x = r1.x * r1.y;
/*367*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*368*/	r1.y = sqrt(r1.y);
/*369*/	r1.z = max(cb2.data[2].z, 0.001000);
/*370*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*371*/	r1.y = r1.z * r1.y;
/*372*/	r1.y = min(r1.y, 1.000000);
/*373*/	r1.z = r1.y * -2.000000 + 3.000000;
/*374*/	r1.y = r1.y * r1.y;
/*375*/	r1.y = r1.y * r1.z;
/*376*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*377*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*378*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*379*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*380*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*381*/	r3.w = max(r3.y, 0.000000);
/*382*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*383*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*384*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*385*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*386*/	r0.w = saturate(r0.w * r1.y);
/*387*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*388*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*389*/	color0.w = 1.000000;
/*390*/	return;
}
