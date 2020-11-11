//
//
// Shader Model 4
// Fragment Shader
//
// id: 1290 - fxc/glsl_SM_3_0_rigidwithdirtburnmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb4;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
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

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb5.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.yyyz).zw;
/*21*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*22*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*23*/	r1.w = r4.w * r5.w;
/*24*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*25*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*26*/	r0.xy = (r3.zwzz * r4.wwww + r0.xyxx).xy;
/*27*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*28*/	r2.w = inversesqrt(r2.w);
/*29*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*30*/	r4.xyz = (r1.wwww * r2.xyzx).xyz;
/*31*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*32*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*33*/	r4.x = 0;
/*34*/	r4.y = cb1.data[26].x * 0.050000;
/*35*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*36*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*38*/	r1.w = saturate(r4.x * 5.000000);
/*39*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*40*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*41*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*42*/	r2.w = log2(r5.z);
/*43*/	r2.w = r2.w * 1.800000;
/*44*/	r2.w = exp2(r2.w);
/*45*/	r2.w = r2.w * 10.000000;
/*46*/	r2.w = min(r2.w, 1.000000);
/*47*/	r1.w = r1.w + r2.w;
/*48*/	r1.w = r1.w * 0.500000;
/*49*/	r2.w = -r5.w + 1.000000;
/*50*/	r2.w = log2(r2.w);
/*51*/	r2.w = r2.w * vsOut_T7.x;
/*52*/	r2.w = exp2(r2.w);
/*53*/	r2.w = min(r2.w, 1.000000);
/*54*/	r2.w = r2.w * vsOut_T7.x;
/*55*/	r3.z = r5.z * 0.250000;
/*56*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*57*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*58*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*59*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*60*/	r1.w = vsOut_T7.x + -0.025000;
/*61*/	r1.w = max(r1.w, 0.000000);
/*62*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*63*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*64*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*67*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*70*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*73*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*74*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*75*/	r7.xyz = (r0.wwww * r6.xyzx + r7.xyzx).xyz;
/*76*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*79*/	r0.xyz = (mix(r7.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*80*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*81*/	if(floatBitsToUint(r0.w) != 0u) {
/*82*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*83*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*84*/	  r0.w = r3.w * cb1.data[26].x;
/*85*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*86*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*87*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*88*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*89*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*90*/	}
/*91*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*92*/	if(floatBitsToUint(r0.w) != 0u) {
/*93*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*94*/	  if(floatBitsToUint(r0.w) != 0u) {
/*95*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*96*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*97*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*98*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*99*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*100*/	    r0.w = -r0.w + 1.000000;
/*101*/	    r0.w = max(r0.w, 0.000000);
/*102*/	    r8.z = sqrt(r0.w);
/*103*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*104*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*105*/	    r0.w = inversesqrt(r0.w);
/*106*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*107*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*108*/	    r10.y = -1.000000;
/*109*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*110*/	    r0.w = inversesqrt(r0.w);
/*111*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*112*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*113*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*114*/	    r1.w = r1.w * 1.250000;
/*115*/	    r1.w = min(r1.w, 1.000000);
/*116*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*117*/	    r2.w = r2.w * 4.000000;
/*118*/	    r1.w = r1.w * 0.200000 + r2.w;
/*119*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*120*/	    r0.w = r0.w + -r1.w;
/*121*/	    r0.w = saturate(r0.w * 200.000000);
/*122*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*123*/	    r0.w = r0.w * r0.w;
/*124*/	    r0.w = r0.w * r1.w;
/*125*/	    r3.x = r0.w * -r3.x + r3.x;
/*126*/	    r1.w = -r3.y + 0.200000;
/*127*/	    r3.y = r0.w * r1.w + r3.y;
/*128*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*129*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*130*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*131*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*132*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*133*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*134*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*135*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*136*/	    r1.w = -r1.w + 1.000000;
/*137*/	    r1.w = max(r1.w, 0.000000);
/*138*/	    r7.z = sqrt(r1.w);
/*139*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*140*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*141*/	    r1.w = sqrt(r1.w);
/*142*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*143*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*144*/	    r1.w = inversesqrt(r1.w);
/*145*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*146*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*147*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*148*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*149*/	    r1.w = -r0.y + 1.000000;
/*150*/	    r0.w = min(r0.w, r1.w);
/*151*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*152*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*153*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*154*/	    r0.w = inversesqrt(r0.w);
/*155*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*156*/	  }
/*157*/	}
/*158*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*159*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*160*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*161*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*162*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*163*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*164*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*165*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*166*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*167*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*168*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*169*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*170*/	r1.w = inversesqrt(r1.w);
/*171*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*172*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*173*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*174*/	r2.w = inversesqrt(r1.w);
/*175*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*176*/	r2.w = -r3.x + 1.000000;
/*177*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*178*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*179*/	r5.y = r5.y + r5.y;
/*180*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*181*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*182*/	r6.w = r2.w * 1.539380;
/*183*/	r6.w = cos((r6.w));
/*184*/	r6.w = inversesqrt(r6.w);
/*185*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*186*/	r7.x = saturate(r0.w * 60.000000);
/*187*/	r7.x = -r0.w + r7.x;
/*188*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*189*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*190*/	r8.x = inversesqrt(r8.x);
/*191*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*192*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*193*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*194*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*195*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*196*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*197*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*198*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*199*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*200*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*201*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*202*/	r6.y = -r0.w + 1.000000;
/*203*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*204*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*205*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*206*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*207*/	  r6.y = max(r6.y, 0.000000);
/*208*/	  r6.y = log2(r6.y);
/*209*/	  r6.y = r6.y * 10.000000;
/*210*/	  r6.y = exp2(r6.y);
/*211*/	  r6.y = r6.w * r6.y;
/*212*/	  r6.y = r6.y * r7.x + r0.w;
/*213*/	  r8.x = r2.w * 8.000000;
/*214*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*215*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*216*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*217*/	}
/*218*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*219*/	r0.y = max(r0.x, 0.000000);
/*220*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*221*/	if(floatBitsToUint(r0.x) != 0u) {
/*222*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*223*/	  r0.x = max(r0.x, -1.000000);
/*224*/	  r0.x = min(r0.x, 1.000000);
/*225*/	  r0.z = -abs(r0.x) + 1.000000;
/*226*/	  r0.z = sqrt(r0.z);
/*227*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*228*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*229*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*230*/	  r5.z = r0.z * r5.y;
/*231*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*232*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*233*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*234*/	  r0.x = r5.y * r0.z + r0.x;
/*235*/	  r0.z = r3.x * r3.x;
/*236*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*237*/	  r0.z = r0.z * r3.x + r6.x;
/*238*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*239*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*240*/	  r3.x = -r0.z * r0.z + 1.000000;
/*241*/	  r3.x = max(r3.x, 0.001000);
/*242*/	  r3.x = log2(r3.x);
/*243*/	  r5.x = r3.x * 4.950617;
/*244*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*245*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*246*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*247*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*248*/	  r0.z = floatBitsToInt(r0.z);
/*249*/	  r5.x = r3.x * r3.x + -r5.x;
/*250*/	  r5.x = sqrt(r5.x);
/*251*/	  r3.x = -r3.x + r5.x;
/*252*/	  r3.x = max(r3.x, 0.000000);
/*253*/	  r3.x = sqrt(r3.x);
/*254*/	  r0.z = r0.z * r3.x;
/*255*/	  r0.z = r0.z * 1.414214;
/*256*/	  r0.z = 0.008727 / r0.z;
/*257*/	  r0.z = max(r0.z, 0.000100);
/*258*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*259*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*260*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*261*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*262*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*263*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*264*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*265*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*266*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*267*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*268*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*269*/	  r0.x = floatBitsToInt(r0.x);
/*270*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*271*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*272*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*273*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*274*/	  r0.x = r0.x * r5.x + 1.000000;
/*275*/	  r0.x = r0.x * 0.500000;
/*276*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*277*/	  r0.z = r0.z * r5.y + 1.000000;
/*278*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*279*/	  r0.z = min(r0.y, 1.000000);
/*280*/	  r2.w = r2.w * 1.570796;
/*281*/	  r2.w = sin(r2.w);
/*282*/	  r0.z = r0.z + -1.000000;
/*283*/	  r0.z = r2.w * r0.z + 1.000000;
/*284*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*285*/	  r2.w = max(r2.w, 0.000000);
/*286*/	  r2.w = log2(r2.w);
/*287*/	  r2.w = r2.w * 10.000000;
/*288*/	  r2.w = exp2(r2.w);
/*289*/	  r2.w = r6.w * r2.w;
/*290*/	  r2.w = r2.w * r7.x + r0.w;
/*291*/	  r0.x = r0.z * abs(r0.x);
/*292*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*293*/	} else {
/*294*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*295*/	}
/*296*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*297*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*298*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*299*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*300*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*301*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*302*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*303*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*304*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*305*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*306*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*307*/	r2.w = 1.000000;
/*308*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*309*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*310*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*311*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*312*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*313*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*314*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*315*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*316*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*317*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*318*/	if(r0.w != 0) discard;
/*319*/	r0.w = sqrt(r1.w);
/*320*/	r1.x = saturate(cb3.data[0].w)/**/;
/*321*/	r1.x = -r1.x + 1.000000;
/*322*/	r1.x = r1.x * 8.000000 + -4.000000;
/*323*/	r1.y = saturate(cb3.data[1].x)/**/;
/*324*/	r1.y = -r1.y + 1.000000;
/*325*/	r1.y = r1.y * 1000.000000;
/*326*/	r0.w = r0.w / r1.y;
/*327*/	r0.w = r0.w + r1.x;
/*328*/	r0.w = r0.w * 1.442695;
/*329*/	r0.w = exp2(r0.w);
/*330*/	r0.w = cb3.data[1].y / r0.w;
/*331*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*332*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*333*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*334*/	r1.x = r1.x + -cb3.data[1].z;
/*335*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*336*/	r1.x = saturate(r1.y * r1.x);
/*337*/	r1.y = r1.x * -2.000000 + 3.000000;
/*338*/	r1.x = r1.x * r1.x;
/*339*/	r1.x = r1.x * r1.y;
/*340*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*341*/	r1.y = sqrt(r1.y);
/*342*/	r1.z = max(cb3.data[2].z, 0.001000);
/*343*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*344*/	r1.y = r1.z * r1.y;
/*345*/	r1.y = min(r1.y, 1.000000);
/*346*/	r1.z = r1.y * -2.000000 + 3.000000;
/*347*/	r1.y = r1.y * r1.y;
/*348*/	r1.y = r1.y * r1.z;
/*349*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*350*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*351*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*352*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*353*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*354*/	r4.w = max(r4.y, 0.000000);
/*355*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*356*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*357*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*358*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*359*/	r0.w = saturate(r0.w * r1.y);
/*360*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*361*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*362*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*363*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*364*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*365*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*366*/	return;
}
