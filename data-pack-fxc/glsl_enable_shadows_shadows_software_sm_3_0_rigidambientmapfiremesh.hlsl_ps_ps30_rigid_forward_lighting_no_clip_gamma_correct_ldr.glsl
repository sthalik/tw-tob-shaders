//
//
// Shader Model 4
// Fragment Shader
//
// id: 4542 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidambientmapfiremesh.hlsl_PS_ps30_rigid_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_ambient_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*11*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*14*/	r0.x = saturate(vsOut_N0.w);
/*15*/	r5.xyz = (r5.xyzx + -cb6.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb6.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb6.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb6.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb6.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb6.data[2].xyxz).xyw;
/*23*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*25*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*27*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*28*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*29*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*33*/	r1.w = -r1.w + 1.000000;
/*34*/	r1.w = max(r1.w, 0.000000);
/*35*/	r1.z = sqrt(r1.w);
/*36*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*38*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*39*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*40*/	r6.x = 0;
/*41*/	r6.y = cb1.data[26].x * 0.050000;
/*42*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*43*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*44*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*45*/	r1.w = saturate(r6.x * 5.000000);
/*46*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*47*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*49*/	r2.w = log2(r7.z);
/*50*/	r2.w = r2.w * 1.800000;
/*51*/	r2.w = exp2(r2.w);
/*52*/	r2.w = r2.w * 10.000000;
/*53*/	r2.w = min(r2.w, 1.000000);
/*54*/	r1.w = r1.w + r2.w;
/*55*/	r1.w = r1.w * 0.500000;
/*56*/	r2.w = -r7.w + 1.000000;
/*57*/	r2.w = log2(r2.w);
/*58*/	r2.w = r2.w * vsOut_T7.x;
/*59*/	r2.w = exp2(r2.w);
/*60*/	r2.w = min(r2.w, 1.000000);
/*61*/	r2.w = r2.w * vsOut_T7.x;
/*62*/	r3.z = r7.z * 0.250000;
/*63*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*64*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*65*/	r0.xyw = (-r0.xyxw * r4.xyxz + r6.xyxz).xyw;
/*66*/	r0.xyw = (r2.wwww * r0.xyxw + r5.xyxz).xyw;
/*67*/	r1.w = vsOut_T7.x + -0.025000;
/*68*/	r1.w = max(r1.w, 0.000000);
/*69*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*70*/	r0.xyw = (r1.wwww * r4.xyxz + r0.xyxw).xyw;
/*71*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*74*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*77*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*78*/	r1.w = inversesqrt(r1.w);
/*79*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*80*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*81*/	r1.xyw = (r1.xxxx * r4.xyxz + r7.xyxz).xyw;
/*82*/	r1.xyz = (r1.zzzz * r6.xyzx + r1.xywx).xyz;
/*83*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*86*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*87*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*88*/	if(floatBitsToUint(r0.z) != 0u) {
/*89*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*90*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*91*/	  r0.z = r3.w * cb1.data[26].x;
/*92*/	  r7.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*93*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*94*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*95*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*96*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*97*/	}
/*98*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*99*/	if(floatBitsToUint(r0.z) != 0u) {
/*100*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*101*/	  if(floatBitsToUint(r0.z) != 0u) {
/*102*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*103*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*104*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*105*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*106*/	    r0.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*107*/	    r0.z = -r0.z + 1.000000;
/*108*/	    r0.z = max(r0.z, 0.000000);
/*109*/	    r8.z = sqrt(r0.z);
/*110*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*111*/	    r0.z = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*112*/	    r0.z = inversesqrt(r0.z);
/*113*/	    r9.xyz = (r0.zzzz * r9.xyzx).xyz;
/*114*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*115*/	    r10.y = -1.000000;
/*116*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*117*/	    r0.z = inversesqrt(r0.z);
/*118*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*119*/	    r0.z = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*120*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*121*/	    r1.w = r1.w * 1.250000;
/*122*/	    r1.w = min(r1.w, 1.000000);
/*123*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*124*/	    r2.w = r2.w * 4.000000;
/*125*/	    r1.w = r1.w * 0.200000 + r2.w;
/*126*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*127*/	    r0.z = r0.z + -r1.w;
/*128*/	    r0.z = saturate(r0.z * 200.000000);
/*129*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*130*/	    r0.z = r0.z * r0.z;
/*131*/	    r0.z = r0.z * r1.w;
/*132*/	    r3.x = r0.z * -r3.x + r3.x;
/*133*/	    r1.w = -r3.y + 0.200000;
/*134*/	    r3.y = r0.z * r1.w + r3.y;
/*135*/	    r9.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*136*/	    r0.xyw = (r0.zzzz * r9.xyxz + r0.xyxw).xyw;
/*137*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*138*/	    r2.xyz = (r0.zzzz * r9.xyzx + r2.xyzx).xyz;
/*139*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*140*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*141*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*142*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*143*/	    r1.w = -r1.w + 1.000000;
/*144*/	    r1.w = max(r1.w, 0.000000);
/*145*/	    r7.z = sqrt(r1.w);
/*146*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*147*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*148*/	    r1.w = sqrt(r1.w);
/*149*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*150*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*151*/	    r1.w = inversesqrt(r1.w);
/*152*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*153*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*154*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*155*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*156*/	    r1.w = -r1.y + 1.000000;
/*157*/	    r0.z = min(r0.z, r1.w);
/*158*/	    r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*159*/	    r4.xyz = (r0.zzzz * r4.xyzx + r1.xyzx).xyz;
/*160*/	    r0.z = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*161*/	    r0.z = inversesqrt(r0.z);
/*162*/	    r1.xyz = (r0.zzzz * r4.xyzx).xyz;
/*163*/	  }
/*164*/	}
/*165*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*166*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*167*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*168*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*169*/	r1.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*170*/	r3.yzw = (-r0.xxyw + r1.wwww).yzw;
/*171*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*172*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*173*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*174*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*175*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*176*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*177*/	r1.w = inversesqrt(r1.w);
/*178*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*179*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*180*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*181*/	r2.w = inversesqrt(r1.w);
/*182*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*183*/	r2.w = -r3.x + 1.000000;
/*184*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*185*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*186*/	r5.y = r5.y + r5.y;
/*187*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*188*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*189*/	r6.w = r2.w * 1.539380;
/*190*/	r6.w = cos((r6.w));
/*191*/	r6.w = inversesqrt(r6.w);
/*192*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*193*/	r7.x = saturate(r0.z * 60.000000);
/*194*/	r7.x = -r0.z + r7.x;
/*195*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*196*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*197*/	r8.x = inversesqrt(r8.x);
/*198*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*199*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*200*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*201*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*202*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*203*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*204*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*205*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*206*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*207*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*208*/	r7.yzw = (r0.xxyw * r7.yyzw).yzw;
/*209*/	r6.y = -r0.z + 1.000000;
/*210*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*211*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*212*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*213*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*214*/	  r6.y = max(r6.y, 0.000000);
/*215*/	  r6.y = log2(r6.y);
/*216*/	  r6.y = r6.y * 10.000000;
/*217*/	  r6.y = exp2(r6.y);
/*218*/	  r6.y = r6.w * r6.y;
/*219*/	  r6.y = r6.y * r7.x + r0.z;
/*220*/	  r8.x = r2.w * 8.000000;
/*221*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*222*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*223*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*224*/	}
/*225*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*226*/	r1.y = max(r1.x, 0.000000);
/*227*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*228*/	if(floatBitsToUint(r1.x) != 0u) {
/*229*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*230*/	  r1.x = max(r1.x, -1.000000);
/*231*/	  r1.x = min(r1.x, 1.000000);
/*232*/	  r1.z = -abs(r1.x) + 1.000000;
/*233*/	  r1.z = sqrt(r1.z);
/*234*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*235*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*236*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*237*/	  r5.z = r1.z * r5.y;
/*238*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*239*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*240*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*241*/	  r1.x = r5.y * r1.z + r1.x;
/*242*/	  r1.z = r3.x * r3.x;
/*243*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*244*/	  r1.z = r1.z * r3.x + r6.x;
/*245*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*246*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*247*/	  r3.x = -r1.z * r1.z + 1.000000;
/*248*/	  r3.x = max(r3.x, 0.001000);
/*249*/	  r3.x = log2(r3.x);
/*250*/	  r5.x = r3.x * 4.950617;
/*251*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*252*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*253*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*254*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*255*/	  r1.z = floatBitsToInt(r1.z);
/*256*/	  r5.x = r3.x * r3.x + -r5.x;
/*257*/	  r5.x = sqrt(r5.x);
/*258*/	  r3.x = -r3.x + r5.x;
/*259*/	  r3.x = max(r3.x, 0.000000);
/*260*/	  r3.x = sqrt(r3.x);
/*261*/	  r1.z = r1.z * r3.x;
/*262*/	  r1.z = r1.z * 1.414214;
/*263*/	  r1.z = 0.008727 / r1.z;
/*264*/	  r1.z = max(r1.z, 0.000100);
/*265*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*266*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*267*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*268*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*269*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*270*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*271*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*272*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*273*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*274*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*275*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*276*/	  r1.x = floatBitsToInt(r1.x);
/*277*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*278*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*279*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*280*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*281*/	  r1.x = r1.x * r5.x + 1.000000;
/*282*/	  r1.x = r1.x * 0.500000;
/*283*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*284*/	  r1.z = r1.z * r5.y + 1.000000;
/*285*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*286*/	  r1.z = min(r1.y, 1.000000);
/*287*/	  r2.w = r2.w * 1.570796;
/*288*/	  r2.w = sin(r2.w);
/*289*/	  r1.z = r1.z + -1.000000;
/*290*/	  r1.z = r2.w * r1.z + 1.000000;
/*291*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*292*/	  r2.w = max(r2.w, 0.000000);
/*293*/	  r2.w = log2(r2.w);
/*294*/	  r2.w = r2.w * 10.000000;
/*295*/	  r2.w = exp2(r2.w);
/*296*/	  r2.w = r6.w * r2.w;
/*297*/	  r2.w = r2.w * r7.x + r0.z;
/*298*/	  r1.x = r1.z * abs(r1.x);
/*299*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*300*/	} else {
/*301*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*302*/	}
/*303*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*304*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*305*/	r3.xyz = (max(r0.zzzz, r3.xyzx)).xyz;
/*306*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*307*/	r0.xyz = (r0.xywx * r1.yyyy).xyz;
/*308*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*309*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*310*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*311*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*312*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*313*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*314*/	r2.w = 1.000000;
/*315*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*316*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*317*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*318*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*319*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*320*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*321*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*322*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*323*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*324*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*325*/	if(r0.w != 0) discard;
/*326*/	r0.w = sqrt(r1.w);
/*327*/	r1.x = saturate(cb3.data[0].w)/**/;
/*328*/	r1.x = -r1.x + 1.000000;
/*329*/	r1.x = r1.x * 8.000000 + -4.000000;
/*330*/	r1.y = saturate(cb3.data[1].x)/**/;
/*331*/	r1.y = -r1.y + 1.000000;
/*332*/	r1.y = r1.y * 1000.000000;
/*333*/	r0.w = r0.w / r1.y;
/*334*/	r0.w = r0.w + r1.x;
/*335*/	r0.w = r0.w * 1.442695;
/*336*/	r0.w = exp2(r0.w);
/*337*/	r0.w = cb3.data[1].y / r0.w;
/*338*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*339*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*340*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*341*/	r1.x = r1.x + -cb3.data[1].z;
/*342*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*343*/	r1.x = saturate(r1.y * r1.x);
/*344*/	r1.y = r1.x * -2.000000 + 3.000000;
/*345*/	r1.x = r1.x * r1.x;
/*346*/	r1.x = r1.x * r1.y;
/*347*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*348*/	r1.y = sqrt(r1.y);
/*349*/	r1.z = max(cb3.data[2].z, 0.001000);
/*350*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*351*/	r1.y = r1.z * r1.y;
/*352*/	r1.y = min(r1.y, 1.000000);
/*353*/	r1.z = r1.y * -2.000000 + 3.000000;
/*354*/	r1.y = r1.y * r1.y;
/*355*/	r1.y = r1.y * r1.z;
/*356*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*357*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*358*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*359*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*360*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*361*/	r4.w = max(r4.y, 0.000000);
/*362*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*363*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*364*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*365*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*366*/	r0.w = saturate(r0.w * r1.y);
/*367*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*368*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*369*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*370*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*371*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*372*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*373*/	return;
}
