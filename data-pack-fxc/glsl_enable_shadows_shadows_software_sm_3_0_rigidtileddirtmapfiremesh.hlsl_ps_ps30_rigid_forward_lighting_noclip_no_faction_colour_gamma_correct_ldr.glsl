//
//
// Shader Model 4
// Fragment Shader
//
// id: 4893 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidtileddirtmapfiremesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
/*19*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*20*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*21*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*22*/	r1.w = r4.w + -1.000000;
/*23*/	r1.w = r5.x * r1.w + 1.000000;
/*24*/	r1.w = saturate(r1.w * r5.x);
/*25*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*26*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*27*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*28*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*29*/	r6.x = 0;
/*30*/	r6.y = cb1.data[26].x * 0.050000;
/*31*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r6.xyxx).xy;
/*32*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*33*/	r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*34*/	r1.w = saturate(r6.x * 5.000000);
/*35*/	r6.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*36*/	r1.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*37*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*38*/	r2.w = log2(r7.z);
/*39*/	r2.w = r2.w * 1.800000;
/*40*/	r2.w = exp2(r2.w);
/*41*/	r2.w = r2.w * 10.000000;
/*42*/	r2.w = min(r2.w, 1.000000);
/*43*/	r1.w = r1.w + r2.w;
/*44*/	r1.w = r1.w * 0.500000;
/*45*/	r2.w = -r7.w + 1.000000;
/*46*/	r2.w = log2(r2.w);
/*47*/	r2.w = r2.w * vsOut_T7.x;
/*48*/	r2.w = exp2(r2.w);
/*49*/	r2.w = min(r2.w, 1.000000);
/*50*/	r2.w = r2.w * vsOut_T7.x;
/*51*/	r3.z = r7.z * 0.250000;
/*52*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*53*/	r6.xyz = (r1.wwww * r6.xyzx + r3.zzzz).xyz;
/*54*/	r1.xyz = (-r1.xyzx * r4.xyzx + r6.xyzx).xyz;
/*55*/	r1.xyz = (r2.wwww * r1.xyzx + r5.xyzx).xyz;
/*56*/	r1.w = vsOut_T7.x + -0.025000;
/*57*/	r1.w = max(r1.w, 0.000000);
/*58*/	r4.xyz = (r7.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*59*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*60*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*63*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*66*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*70*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*71*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*72*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*75*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*76*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*77*/	if(floatBitsToUint(r0.w) != 0u) {
/*78*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*79*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*80*/	  r0.w = r3.w * cb1.data[26].x;
/*81*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*82*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*83*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*84*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*85*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*86*/	}
/*87*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*88*/	if(floatBitsToUint(r0.w) != 0u) {
/*89*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*90*/	  if(floatBitsToUint(r0.w) != 0u) {
/*91*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*92*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*93*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*94*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*95*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*96*/	    r0.w = -r0.w + 1.000000;
/*97*/	    r0.w = max(r0.w, 0.000000);
/*98*/	    r8.z = sqrt(r0.w);
/*99*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*100*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*101*/	    r0.w = inversesqrt(r0.w);
/*102*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*103*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*104*/	    r10.y = -1.000000;
/*105*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*106*/	    r0.w = inversesqrt(r0.w);
/*107*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*108*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*109*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*110*/	    r1.w = r1.w * 1.250000;
/*111*/	    r1.w = min(r1.w, 1.000000);
/*112*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*113*/	    r2.w = r2.w * 4.000000;
/*114*/	    r1.w = r1.w * 0.200000 + r2.w;
/*115*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*116*/	    r0.w = r0.w + -r1.w;
/*117*/	    r0.w = saturate(r0.w * 200.000000);
/*118*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*119*/	    r0.w = r0.w * r0.w;
/*120*/	    r0.w = r0.w * r1.w;
/*121*/	    r3.x = r0.w * -r3.x + r3.x;
/*122*/	    r1.w = -r3.y + 0.200000;
/*123*/	    r3.y = r0.w * r1.w + r3.y;
/*124*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*125*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*126*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*127*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*128*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*129*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*130*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*131*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*132*/	    r1.w = -r1.w + 1.000000;
/*133*/	    r1.w = max(r1.w, 0.000000);
/*134*/	    r7.z = sqrt(r1.w);
/*135*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*136*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*137*/	    r1.w = sqrt(r1.w);
/*138*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*139*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*140*/	    r1.w = inversesqrt(r1.w);
/*141*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*142*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*143*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*144*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*145*/	    r1.w = -r0.y + 1.000000;
/*146*/	    r0.w = min(r0.w, r1.w);
/*147*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*148*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*149*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*150*/	    r0.w = inversesqrt(r0.w);
/*151*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*152*/	  }
/*153*/	}
/*154*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*155*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*156*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*157*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*158*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*159*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*160*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*161*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*162*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*163*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*164*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*165*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*166*/	r1.w = inversesqrt(r1.w);
/*167*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*168*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*169*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*170*/	r2.w = inversesqrt(r1.w);
/*171*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*172*/	r2.w = -r3.x + 1.000000;
/*173*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*174*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*175*/	r5.y = r5.y + r5.y;
/*176*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*177*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*178*/	r6.w = r2.w * 1.539380;
/*179*/	r6.w = cos((r6.w));
/*180*/	r6.w = inversesqrt(r6.w);
/*181*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*182*/	r7.x = saturate(r0.w * 60.000000);
/*183*/	r7.x = -r0.w + r7.x;
/*184*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*185*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*186*/	r8.x = inversesqrt(r8.x);
/*187*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*188*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*189*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*190*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*191*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*192*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*193*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*194*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*195*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*196*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*197*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*198*/	r6.y = -r0.w + 1.000000;
/*199*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*200*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*201*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*202*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*203*/	  r6.y = max(r6.y, 0.000000);
/*204*/	  r6.y = log2(r6.y);
/*205*/	  r6.y = r6.y * 10.000000;
/*206*/	  r6.y = exp2(r6.y);
/*207*/	  r6.y = r6.w * r6.y;
/*208*/	  r6.y = r6.y * r7.x + r0.w;
/*209*/	  r8.x = r2.w * 8.000000;
/*210*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*211*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*212*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*213*/	}
/*214*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*215*/	r0.y = max(r0.x, 0.000000);
/*216*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*217*/	if(floatBitsToUint(r0.x) != 0u) {
/*218*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*219*/	  r0.x = max(r0.x, -1.000000);
/*220*/	  r0.x = min(r0.x, 1.000000);
/*221*/	  r0.z = -abs(r0.x) + 1.000000;
/*222*/	  r0.z = sqrt(r0.z);
/*223*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*224*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*225*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*226*/	  r5.z = r0.z * r5.y;
/*227*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*228*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*229*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*230*/	  r0.x = r5.y * r0.z + r0.x;
/*231*/	  r0.z = r3.x * r3.x;
/*232*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*233*/	  r0.z = r0.z * r3.x + r6.x;
/*234*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*235*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*236*/	  r3.x = -r0.z * r0.z + 1.000000;
/*237*/	  r3.x = max(r3.x, 0.001000);
/*238*/	  r3.x = log2(r3.x);
/*239*/	  r5.x = r3.x * 4.950617;
/*240*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*241*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*242*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*243*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*244*/	  r0.z = floatBitsToInt(r0.z);
/*245*/	  r5.x = r3.x * r3.x + -r5.x;
/*246*/	  r5.x = sqrt(r5.x);
/*247*/	  r3.x = -r3.x + r5.x;
/*248*/	  r3.x = max(r3.x, 0.000000);
/*249*/	  r3.x = sqrt(r3.x);
/*250*/	  r0.z = r0.z * r3.x;
/*251*/	  r0.z = r0.z * 1.414214;
/*252*/	  r0.z = 0.008727 / r0.z;
/*253*/	  r0.z = max(r0.z, 0.000100);
/*254*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*255*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*256*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*257*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*258*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*259*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*260*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*261*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*262*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*263*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*264*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*265*/	  r0.x = floatBitsToInt(r0.x);
/*266*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*267*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*268*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*269*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*270*/	  r0.x = r0.x * r5.x + 1.000000;
/*271*/	  r0.x = r0.x * 0.500000;
/*272*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*273*/	  r0.z = r0.z * r5.y + 1.000000;
/*274*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*275*/	  r0.z = min(r0.y, 1.000000);
/*276*/	  r2.w = r2.w * 1.570796;
/*277*/	  r2.w = sin(r2.w);
/*278*/	  r0.z = r0.z + -1.000000;
/*279*/	  r0.z = r2.w * r0.z + 1.000000;
/*280*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*281*/	  r2.w = max(r2.w, 0.000000);
/*282*/	  r2.w = log2(r2.w);
/*283*/	  r2.w = r2.w * 10.000000;
/*284*/	  r2.w = exp2(r2.w);
/*285*/	  r2.w = r6.w * r2.w;
/*286*/	  r2.w = r2.w * r7.x + r0.w;
/*287*/	  r0.x = r0.z * abs(r0.x);
/*288*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*289*/	} else {
/*290*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*291*/	}
/*292*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*293*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*294*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*295*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*296*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*297*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*298*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*299*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*300*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*301*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*302*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*303*/	r2.w = 1.000000;
/*304*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*305*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*306*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*307*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*308*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*309*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*310*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*311*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*312*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*313*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*314*/	if(r0.w != 0) discard;
/*315*/	r0.w = sqrt(r1.w);
/*316*/	r1.x = saturate(cb3.data[0].w)/**/;
/*317*/	r1.x = -r1.x + 1.000000;
/*318*/	r1.x = r1.x * 8.000000 + -4.000000;
/*319*/	r1.y = saturate(cb3.data[1].x)/**/;
/*320*/	r1.y = -r1.y + 1.000000;
/*321*/	r1.y = r1.y * 1000.000000;
/*322*/	r0.w = r0.w / r1.y;
/*323*/	r0.w = r0.w + r1.x;
/*324*/	r0.w = r0.w * 1.442695;
/*325*/	r0.w = exp2(r0.w);
/*326*/	r0.w = cb3.data[1].y / r0.w;
/*327*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*328*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*329*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*330*/	r1.x = r1.x + -cb3.data[1].z;
/*331*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*332*/	r1.x = saturate(r1.y * r1.x);
/*333*/	r1.y = r1.x * -2.000000 + 3.000000;
/*334*/	r1.x = r1.x * r1.x;
/*335*/	r1.x = r1.x * r1.y;
/*336*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*337*/	r1.y = sqrt(r1.y);
/*338*/	r1.z = max(cb3.data[2].z, 0.001000);
/*339*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*340*/	r1.y = r1.z * r1.y;
/*341*/	r1.y = min(r1.y, 1.000000);
/*342*/	r1.z = r1.y * -2.000000 + 3.000000;
/*343*/	r1.y = r1.y * r1.y;
/*344*/	r1.y = r1.y * r1.z;
/*345*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*346*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*347*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*348*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*349*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*350*/	r4.w = max(r4.y, 0.000000);
/*351*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*352*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*353*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*354*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*355*/	r0.w = saturate(r0.w * r1.y);
/*356*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*357*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*358*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*359*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*360*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*361*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*362*/	return;
}
