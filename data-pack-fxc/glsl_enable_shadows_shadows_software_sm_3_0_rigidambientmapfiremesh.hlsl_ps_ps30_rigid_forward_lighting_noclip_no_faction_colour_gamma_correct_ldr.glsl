//
//
// Shader Model 4
// Fragment Shader
//
// id: 4546 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidambientmapfiremesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
/*19*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*21*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*22*/	r6.x = 0;
/*23*/	r6.y = cb1.data[26].x * 0.050000;
/*24*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*25*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*26*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*27*/	r1.w = saturate(r6.x * 5.000000);
/*28*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*29*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*30*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*31*/	r2.w = log2(r7.z);
/*32*/	r2.w = r2.w * 1.800000;
/*33*/	r2.w = exp2(r2.w);
/*34*/	r2.w = r2.w * 10.000000;
/*35*/	r2.w = min(r2.w, 1.000000);
/*36*/	r1.w = r1.w + r2.w;
/*37*/	r1.w = r1.w * 0.500000;
/*38*/	r2.w = -r7.w + 1.000000;
/*39*/	r2.w = log2(r2.w);
/*40*/	r2.w = r2.w * vsOut_T7.x;
/*41*/	r2.w = exp2(r2.w);
/*42*/	r2.w = min(r2.w, 1.000000);
/*43*/	r2.w = r2.w * vsOut_T7.x;
/*44*/	r3.z = r7.z * 0.250000;
/*45*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*46*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*47*/	r1.xyz = (-r1.xyzx * r4.xyzx + r6.xyzx).xyz;
/*48*/	r1.xyz = (r2.wwww * r1.xyzx + r5.xyzx).xyz;
/*49*/	r1.w = vsOut_T7.x + -0.025000;
/*50*/	r1.w = max(r1.w, 0.000000);
/*51*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*52*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*53*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*56*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*57*/	r1.w = inversesqrt(r1.w);
/*58*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*59*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*60*/	r1.w = inversesqrt(r1.w);
/*61*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*62*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*63*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*64*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*65*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*68*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*69*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*70*/	if(floatBitsToUint(r0.w) != 0u) {
/*71*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*72*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*73*/	  r0.w = r3.w * cb1.data[26].x;
/*74*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*75*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*76*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*77*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*78*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*79*/	}
/*80*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*81*/	if(floatBitsToUint(r0.w) != 0u) {
/*82*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*83*/	  if(floatBitsToUint(r0.w) != 0u) {
/*84*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*85*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*86*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*87*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*88*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*89*/	    r0.w = -r0.w + 1.000000;
/*90*/	    r0.w = max(r0.w, 0.000000);
/*91*/	    r8.z = sqrt(r0.w);
/*92*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*93*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*94*/	    r0.w = inversesqrt(r0.w);
/*95*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*96*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*97*/	    r10.y = -1.000000;
/*98*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*99*/	    r0.w = inversesqrt(r0.w);
/*100*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*101*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*102*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*103*/	    r1.w = r1.w * 1.250000;
/*104*/	    r1.w = min(r1.w, 1.000000);
/*105*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*106*/	    r2.w = r2.w * 4.000000;
/*107*/	    r1.w = r1.w * 0.200000 + r2.w;
/*108*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*109*/	    r0.w = r0.w + -r1.w;
/*110*/	    r0.w = saturate(r0.w * 200.000000);
/*111*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*112*/	    r0.w = r0.w * r0.w;
/*113*/	    r0.w = r0.w * r1.w;
/*114*/	    r3.x = r0.w * -r3.x + r3.x;
/*115*/	    r1.w = -r3.y + 0.200000;
/*116*/	    r3.y = r0.w * r1.w + r3.y;
/*117*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*118*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*119*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*120*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*121*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*122*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*123*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*124*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*125*/	    r1.w = -r1.w + 1.000000;
/*126*/	    r1.w = max(r1.w, 0.000000);
/*127*/	    r7.z = sqrt(r1.w);
/*128*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*129*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*130*/	    r1.w = sqrt(r1.w);
/*131*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*132*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*133*/	    r1.w = inversesqrt(r1.w);
/*134*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*135*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*136*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*137*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*138*/	    r1.w = -r0.y + 1.000000;
/*139*/	    r0.w = min(r0.w, r1.w);
/*140*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*141*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*142*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*143*/	    r0.w = inversesqrt(r0.w);
/*144*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*145*/	  }
/*146*/	}
/*147*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*148*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*149*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*150*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*151*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*152*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*153*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*154*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*155*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*156*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*157*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*158*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*159*/	r1.w = inversesqrt(r1.w);
/*160*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*161*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*162*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*163*/	r2.w = inversesqrt(r1.w);
/*164*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*165*/	r2.w = -r3.x + 1.000000;
/*166*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*167*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*168*/	r5.y = r5.y + r5.y;
/*169*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*170*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*171*/	r6.w = r2.w * 1.539380;
/*172*/	r6.w = cos((r6.w));
/*173*/	r6.w = inversesqrt(r6.w);
/*174*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*175*/	r7.x = saturate(r0.w * 60.000000);
/*176*/	r7.x = -r0.w + r7.x;
/*177*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*178*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*179*/	r8.x = inversesqrt(r8.x);
/*180*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*181*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*182*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*183*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*184*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*185*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*186*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*187*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*188*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*189*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*190*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*191*/	r6.y = -r0.w + 1.000000;
/*192*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*193*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*194*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*195*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*196*/	  r6.y = max(r6.y, 0.000000);
/*197*/	  r6.y = log2(r6.y);
/*198*/	  r6.y = r6.y * 10.000000;
/*199*/	  r6.y = exp2(r6.y);
/*200*/	  r6.y = r6.w * r6.y;
/*201*/	  r6.y = r6.y * r7.x + r0.w;
/*202*/	  r8.x = r2.w * 8.000000;
/*203*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*204*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*205*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*206*/	}
/*207*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*208*/	r0.y = max(r0.x, 0.000000);
/*209*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*210*/	if(floatBitsToUint(r0.x) != 0u) {
/*211*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*212*/	  r0.x = max(r0.x, -1.000000);
/*213*/	  r0.x = min(r0.x, 1.000000);
/*214*/	  r0.z = -abs(r0.x) + 1.000000;
/*215*/	  r0.z = sqrt(r0.z);
/*216*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*217*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*218*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*219*/	  r5.z = r0.z * r5.y;
/*220*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*221*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*222*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*223*/	  r0.x = r5.y * r0.z + r0.x;
/*224*/	  r0.z = r3.x * r3.x;
/*225*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*226*/	  r0.z = r0.z * r3.x + r6.x;
/*227*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*228*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*229*/	  r3.x = -r0.z * r0.z + 1.000000;
/*230*/	  r3.x = max(r3.x, 0.001000);
/*231*/	  r3.x = log2(r3.x);
/*232*/	  r5.x = r3.x * 4.950617;
/*233*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*234*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*235*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*236*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*237*/	  r0.z = floatBitsToInt(r0.z);
/*238*/	  r5.x = r3.x * r3.x + -r5.x;
/*239*/	  r5.x = sqrt(r5.x);
/*240*/	  r3.x = -r3.x + r5.x;
/*241*/	  r3.x = max(r3.x, 0.000000);
/*242*/	  r3.x = sqrt(r3.x);
/*243*/	  r0.z = r0.z * r3.x;
/*244*/	  r0.z = r0.z * 1.414214;
/*245*/	  r0.z = 0.008727 / r0.z;
/*246*/	  r0.z = max(r0.z, 0.000100);
/*247*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*248*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*249*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*250*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*251*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*252*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*253*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*254*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*255*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*256*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*257*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*258*/	  r0.x = floatBitsToInt(r0.x);
/*259*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*260*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*261*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*262*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*263*/	  r0.x = r0.x * r5.x + 1.000000;
/*264*/	  r0.x = r0.x * 0.500000;
/*265*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*266*/	  r0.z = r0.z * r5.y + 1.000000;
/*267*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*268*/	  r0.z = min(r0.y, 1.000000);
/*269*/	  r2.w = r2.w * 1.570796;
/*270*/	  r2.w = sin(r2.w);
/*271*/	  r0.z = r0.z + -1.000000;
/*272*/	  r0.z = r2.w * r0.z + 1.000000;
/*273*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*274*/	  r2.w = max(r2.w, 0.000000);
/*275*/	  r2.w = log2(r2.w);
/*276*/	  r2.w = r2.w * 10.000000;
/*277*/	  r2.w = exp2(r2.w);
/*278*/	  r2.w = r6.w * r2.w;
/*279*/	  r2.w = r2.w * r7.x + r0.w;
/*280*/	  r0.x = r0.z * abs(r0.x);
/*281*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*282*/	} else {
/*283*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*284*/	}
/*285*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*286*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*287*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*288*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*289*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*290*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*291*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*292*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*293*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*294*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*295*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*296*/	r2.w = 1.000000;
/*297*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*298*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*299*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*300*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*301*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*302*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*303*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*304*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*305*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*306*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*307*/	if(r0.w != 0) discard;
/*308*/	r0.w = sqrt(r1.w);
/*309*/	r1.x = saturate(cb3.data[0].w)/**/;
/*310*/	r1.x = -r1.x + 1.000000;
/*311*/	r1.x = r1.x * 8.000000 + -4.000000;
/*312*/	r1.y = saturate(cb3.data[1].x)/**/;
/*313*/	r1.y = -r1.y + 1.000000;
/*314*/	r1.y = r1.y * 1000.000000;
/*315*/	r0.w = r0.w / r1.y;
/*316*/	r0.w = r0.w + r1.x;
/*317*/	r0.w = r0.w * 1.442695;
/*318*/	r0.w = exp2(r0.w);
/*319*/	r0.w = cb3.data[1].y / r0.w;
/*320*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*321*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*322*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*323*/	r1.x = r1.x + -cb3.data[1].z;
/*324*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*325*/	r1.x = saturate(r1.y * r1.x);
/*326*/	r1.y = r1.x * -2.000000 + 3.000000;
/*327*/	r1.x = r1.x * r1.x;
/*328*/	r1.x = r1.x * r1.y;
/*329*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*330*/	r1.y = sqrt(r1.y);
/*331*/	r1.z = max(cb3.data[2].z, 0.001000);
/*332*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*333*/	r1.y = r1.z * r1.y;
/*334*/	r1.y = min(r1.y, 1.000000);
/*335*/	r1.z = r1.y * -2.000000 + 3.000000;
/*336*/	r1.y = r1.y * r1.y;
/*337*/	r1.y = r1.y * r1.z;
/*338*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*339*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*340*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*341*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*342*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*343*/	r4.w = max(r4.y, 0.000000);
/*344*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*345*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*346*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*347*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*348*/	r0.w = saturate(r0.w * r1.y);
/*349*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*350*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*351*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*352*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*353*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*354*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*355*/	return;
}
