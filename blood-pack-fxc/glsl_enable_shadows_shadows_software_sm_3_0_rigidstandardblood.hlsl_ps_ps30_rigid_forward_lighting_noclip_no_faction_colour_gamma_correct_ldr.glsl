//
//
// Shader Model 4
// Fragment Shader
//
// id: 4776 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidstandardblood.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*7*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*8*/	color0.w = r0.x * r1.w;
/*9*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r0.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*11*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*12*/	r0.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*13*/	r0.x = -r0.x + 1.000000;
/*14*/	r0.x = max(r0.x, 0.000000);
/*15*/	r2.z = sqrt(r0.x);
/*16*/	r0.xyw = (mix(r2.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*17*/	r2.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx).xy;
/*18*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*19*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*20*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*21*/	r1.w = saturate(-r1.w + r2.w);
/*22*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*23*/	if(floatBitsToUint(r1.w) != 0u) {
/*24*/	  r1.w = -r2.w + 1.000000;
/*25*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*26*/	  r1.w = -r1.w + 1.000000;
/*27*/	  r1.w = -r1.w * r1.w + 1.000000;
/*28*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*29*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*30*/	  r1.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*31*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*32*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*33*/	  r3.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*34*/	  r1.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*35*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*36*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*37*/	} else {
/*38*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*39*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*40*/	}
/*41*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*42*/	r1.w = inversesqrt(r1.w);
/*43*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*44*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*45*/	r1.w = inversesqrt(r1.w);
/*46*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*47*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*50*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*51*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*52*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*53*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*56*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*57*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*58*/	if(floatBitsToUint(r0.w) != 0u) {
/*59*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*60*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*61*/	  r0.w = r3.w * cb1.data[26].x;
/*62*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*63*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*64*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*65*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*66*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*67*/	}
/*68*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*69*/	if(floatBitsToUint(r0.w) != 0u) {
/*70*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*71*/	  if(floatBitsToUint(r0.w) != 0u) {
/*72*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*73*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*74*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*75*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*76*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*77*/	    r0.w = -r0.w + 1.000000;
/*78*/	    r0.w = max(r0.w, 0.000000);
/*79*/	    r8.z = sqrt(r0.w);
/*80*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*81*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*82*/	    r0.w = inversesqrt(r0.w);
/*83*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*84*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*85*/	    r10.y = -1.000000;
/*86*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*87*/	    r0.w = inversesqrt(r0.w);
/*88*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*89*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*90*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*91*/	    r1.w = r1.w * 1.250000;
/*92*/	    r1.w = min(r1.w, 1.000000);
/*93*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*94*/	    r2.w = r2.w * 4.000000;
/*95*/	    r1.w = r1.w * 0.200000 + r2.w;
/*96*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*97*/	    r0.w = r0.w + -r1.w;
/*98*/	    r0.w = saturate(r0.w * 200.000000);
/*99*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*100*/	    r0.w = r0.w * r0.w;
/*101*/	    r0.w = r0.w * r1.w;
/*102*/	    r3.x = r0.w * -r3.x + r3.x;
/*103*/	    r1.w = -r3.y + 0.200000;
/*104*/	    r3.y = r0.w * r1.w + r3.y;
/*105*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*106*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*107*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*108*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*109*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*110*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*111*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*112*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*113*/	    r1.w = -r1.w + 1.000000;
/*114*/	    r1.w = max(r1.w, 0.000000);
/*115*/	    r7.z = sqrt(r1.w);
/*116*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*117*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*118*/	    r1.w = sqrt(r1.w);
/*119*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*120*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*121*/	    r1.w = inversesqrt(r1.w);
/*122*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*123*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*124*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*125*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*126*/	    r1.w = -r0.y + 1.000000;
/*127*/	    r0.w = min(r0.w, r1.w);
/*128*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*129*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*130*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*131*/	    r0.w = inversesqrt(r0.w);
/*132*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*133*/	  }
/*134*/	}
/*135*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*136*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*137*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*138*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*139*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*140*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*141*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*142*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*143*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*144*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*145*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*146*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*147*/	r1.w = inversesqrt(r1.w);
/*148*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*149*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*150*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*151*/	r2.w = inversesqrt(r1.w);
/*152*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*153*/	r2.w = -r3.x + 1.000000;
/*154*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*155*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*156*/	r5.y = r5.y + r5.y;
/*157*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*158*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*159*/	r6.w = r2.w * 1.539380;
/*160*/	r6.w = cos((r6.w));
/*161*/	r6.w = inversesqrt(r6.w);
/*162*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*163*/	r7.x = saturate(r0.w * 60.000000);
/*164*/	r7.x = -r0.w + r7.x;
/*165*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*166*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*167*/	r8.x = inversesqrt(r8.x);
/*168*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*169*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*170*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*171*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*172*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*173*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*174*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*175*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*176*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*177*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*178*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*179*/	r6.y = -r0.w + 1.000000;
/*180*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*181*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*182*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*183*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*184*/	  r6.y = max(r6.y, 0.000000);
/*185*/	  r6.y = log2(r6.y);
/*186*/	  r6.y = r6.y * 10.000000;
/*187*/	  r6.y = exp2(r6.y);
/*188*/	  r6.y = r6.w * r6.y;
/*189*/	  r6.y = r6.y * r7.x + r0.w;
/*190*/	  r8.x = r2.w * 8.000000;
/*191*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*192*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*193*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*194*/	}
/*195*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*196*/	r0.y = max(r0.x, 0.000000);
/*197*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*198*/	if(floatBitsToUint(r0.x) != 0u) {
/*199*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*200*/	  r0.x = max(r0.x, -1.000000);
/*201*/	  r0.x = min(r0.x, 1.000000);
/*202*/	  r0.z = -abs(r0.x) + 1.000000;
/*203*/	  r0.z = sqrt(r0.z);
/*204*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*205*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*206*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*207*/	  r5.z = r0.z * r5.y;
/*208*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*209*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*210*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*211*/	  r0.x = r5.y * r0.z + r0.x;
/*212*/	  r0.z = r3.x * r3.x;
/*213*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*214*/	  r0.z = r0.z * r3.x + r6.x;
/*215*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*216*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*217*/	  r3.x = -r0.z * r0.z + 1.000000;
/*218*/	  r3.x = max(r3.x, 0.001000);
/*219*/	  r3.x = log2(r3.x);
/*220*/	  r5.x = r3.x * 4.950617;
/*221*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*222*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*223*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*224*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*225*/	  r0.z = floatBitsToInt(r0.z);
/*226*/	  r5.x = r3.x * r3.x + -r5.x;
/*227*/	  r5.x = sqrt(r5.x);
/*228*/	  r3.x = -r3.x + r5.x;
/*229*/	  r3.x = max(r3.x, 0.000000);
/*230*/	  r3.x = sqrt(r3.x);
/*231*/	  r0.z = r0.z * r3.x;
/*232*/	  r0.z = r0.z * 1.414214;
/*233*/	  r0.z = 0.008727 / r0.z;
/*234*/	  r0.z = max(r0.z, 0.000100);
/*235*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*236*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*237*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*238*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*239*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*240*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*241*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*242*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*243*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*244*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*245*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*246*/	  r0.x = floatBitsToInt(r0.x);
/*247*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*248*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*249*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*250*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*251*/	  r0.x = r0.x * r5.x + 1.000000;
/*252*/	  r0.x = r0.x * 0.500000;
/*253*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*254*/	  r0.z = r0.z * r5.y + 1.000000;
/*255*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*256*/	  r0.z = min(r0.y, 1.000000);
/*257*/	  r2.w = r2.w * 1.570796;
/*258*/	  r2.w = sin(r2.w);
/*259*/	  r0.z = r0.z + -1.000000;
/*260*/	  r0.z = r2.w * r0.z + 1.000000;
/*261*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*262*/	  r2.w = max(r2.w, 0.000000);
/*263*/	  r2.w = log2(r2.w);
/*264*/	  r2.w = r2.w * 10.000000;
/*265*/	  r2.w = exp2(r2.w);
/*266*/	  r2.w = r6.w * r2.w;
/*267*/	  r2.w = r2.w * r7.x + r0.w;
/*268*/	  r0.x = r0.z * abs(r0.x);
/*269*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*270*/	} else {
/*271*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*272*/	}
/*273*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*274*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*275*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*276*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*277*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*278*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*279*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*280*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*281*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*282*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*283*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*284*/	r2.w = 1.000000;
/*285*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*286*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*287*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*288*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*289*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*290*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*291*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*292*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*293*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*294*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*295*/	if(r0.w != 0) discard;
/*296*/	r0.w = sqrt(r1.w);
/*297*/	r1.x = saturate(cb3.data[0].w)/**/;
/*298*/	r1.x = -r1.x + 1.000000;
/*299*/	r1.x = r1.x * 8.000000 + -4.000000;
/*300*/	r1.y = saturate(cb3.data[1].x)/**/;
/*301*/	r1.y = -r1.y + 1.000000;
/*302*/	r1.y = r1.y * 1000.000000;
/*303*/	r0.w = r0.w / r1.y;
/*304*/	r0.w = r0.w + r1.x;
/*305*/	r0.w = r0.w * 1.442695;
/*306*/	r0.w = exp2(r0.w);
/*307*/	r0.w = cb3.data[1].y / r0.w;
/*308*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*309*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*310*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*311*/	r1.x = r1.x + -cb3.data[1].z;
/*312*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*313*/	r1.x = saturate(r1.y * r1.x);
/*314*/	r1.y = r1.x * -2.000000 + 3.000000;
/*315*/	r1.x = r1.x * r1.x;
/*316*/	r1.x = r1.x * r1.y;
/*317*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*318*/	r1.y = sqrt(r1.y);
/*319*/	r1.z = max(cb3.data[2].z, 0.001000);
/*320*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*321*/	r1.y = r1.z * r1.y;
/*322*/	r1.y = min(r1.y, 1.000000);
/*323*/	r1.z = r1.y * -2.000000 + 3.000000;
/*324*/	r1.y = r1.y * r1.y;
/*325*/	r1.y = r1.y * r1.z;
/*326*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*327*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*328*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*329*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*330*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*331*/	r4.w = max(r4.y, 0.000000);
/*332*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*333*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*334*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*335*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*336*/	r0.w = saturate(r0.w * r1.y);
/*337*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*338*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*339*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*340*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*341*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*342*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*343*/	return;
}
