//
//
// Shader Model 4
// Fragment Shader
//
// id: 764 - fxc/glsl_SM_3_0_rigidstandardblood.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*8*/	r0.y = r1.w + -0.500000;
/*9*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	if(r0.y != 0) discard;
/*11*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*12*/	color0.w = r0.x * r1.w;
/*13*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r0.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*15*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*16*/	r0.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*17*/	r0.x = -r0.x + 1.000000;
/*18*/	r0.x = max(r0.x, 0.000000);
/*19*/	r2.z = sqrt(r0.x);
/*20*/	r0.xyw = (mix(r2.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*21*/	r2.xy = (vsOut_T1.xyxx * cb5.data[2].xyxx).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*23*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r1.w = -vsOut_T7.w * 0.900000 + 1.000000;
/*25*/	r1.w = saturate(-r1.w + r2.w);
/*26*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r1.w) != 0u) {
/*28*/	  r1.w = -r2.w + 1.000000;
/*29*/	  r1.w = saturate(vsOut_T7.w * 0.900000 + -r1.w);
/*30*/	  r1.w = -r1.w + 1.000000;
/*31*/	  r1.w = -r1.w * r1.w + 1.000000;
/*32*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*33*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r1.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*37*/	  r3.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*38*/	  r1.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*39*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*40*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*41*/	} else {
/*42*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*44*/	}
/*45*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*48*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*51*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*54*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*55*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*56*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*57*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*60*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*61*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*62*/	if(floatBitsToUint(r0.w) != 0u) {
/*63*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*64*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*65*/	  r0.w = r3.w * cb1.data[26].x;
/*66*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*67*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*68*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*69*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*70*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*71*/	}
/*72*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*73*/	if(floatBitsToUint(r0.w) != 0u) {
/*74*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*75*/	  if(floatBitsToUint(r0.w) != 0u) {
/*76*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*77*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*78*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*79*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*80*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*81*/	    r0.w = -r0.w + 1.000000;
/*82*/	    r0.w = max(r0.w, 0.000000);
/*83*/	    r8.z = sqrt(r0.w);
/*84*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*85*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*86*/	    r0.w = inversesqrt(r0.w);
/*87*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*88*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*89*/	    r10.y = -1.000000;
/*90*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*91*/	    r0.w = inversesqrt(r0.w);
/*92*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*93*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*94*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*95*/	    r1.w = r1.w * 1.250000;
/*96*/	    r1.w = min(r1.w, 1.000000);
/*97*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*98*/	    r2.w = r2.w * 4.000000;
/*99*/	    r1.w = r1.w * 0.200000 + r2.w;
/*100*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*101*/	    r0.w = r0.w + -r1.w;
/*102*/	    r0.w = saturate(r0.w * 200.000000);
/*103*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*104*/	    r0.w = r0.w * r0.w;
/*105*/	    r0.w = r0.w * r1.w;
/*106*/	    r3.x = r0.w * -r3.x + r3.x;
/*107*/	    r1.w = -r3.y + 0.200000;
/*108*/	    r3.y = r0.w * r1.w + r3.y;
/*109*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*110*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*111*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*112*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*113*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*114*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*115*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*116*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*117*/	    r1.w = -r1.w + 1.000000;
/*118*/	    r1.w = max(r1.w, 0.000000);
/*119*/	    r7.z = sqrt(r1.w);
/*120*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*121*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*122*/	    r1.w = sqrt(r1.w);
/*123*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*124*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*125*/	    r1.w = inversesqrt(r1.w);
/*126*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*127*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*128*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*129*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*130*/	    r1.w = -r0.y + 1.000000;
/*131*/	    r0.w = min(r0.w, r1.w);
/*132*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*133*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*134*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*135*/	    r0.w = inversesqrt(r0.w);
/*136*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*137*/	  }
/*138*/	}
/*139*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*140*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*141*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*142*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*143*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*144*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*145*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*146*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*147*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*148*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*149*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*150*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*151*/	r1.w = inversesqrt(r1.w);
/*152*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*153*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*154*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*155*/	r2.w = inversesqrt(r1.w);
/*156*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*157*/	r2.w = -r3.x + 1.000000;
/*158*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*159*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*160*/	r5.y = r5.y + r5.y;
/*161*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*162*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*163*/	r6.w = r2.w * 1.539380;
/*164*/	r6.w = cos((r6.w));
/*165*/	r6.w = inversesqrt(r6.w);
/*166*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*167*/	r7.x = saturate(r0.w * 60.000000);
/*168*/	r7.x = -r0.w + r7.x;
/*169*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*170*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*171*/	r8.x = inversesqrt(r8.x);
/*172*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*173*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*174*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*175*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*176*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*177*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*178*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*179*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*180*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*181*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*182*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*183*/	r6.y = -r0.w + 1.000000;
/*184*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*185*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*186*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*187*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*188*/	  r6.y = max(r6.y, 0.000000);
/*189*/	  r6.y = log2(r6.y);
/*190*/	  r6.y = r6.y * 10.000000;
/*191*/	  r6.y = exp2(r6.y);
/*192*/	  r6.y = r6.w * r6.y;
/*193*/	  r6.y = r6.y * r7.x + r0.w;
/*194*/	  r8.x = r2.w * 8.000000;
/*195*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*196*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*197*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*198*/	}
/*199*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*200*/	r0.y = max(r0.x, 0.000000);
/*201*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*202*/	if(floatBitsToUint(r0.x) != 0u) {
/*203*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*204*/	  r0.x = max(r0.x, -1.000000);
/*205*/	  r0.x = min(r0.x, 1.000000);
/*206*/	  r0.z = -abs(r0.x) + 1.000000;
/*207*/	  r0.z = sqrt(r0.z);
/*208*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*209*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*210*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*211*/	  r5.z = r0.z * r5.y;
/*212*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*213*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*214*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*215*/	  r0.x = r5.y * r0.z + r0.x;
/*216*/	  r0.z = r3.x * r3.x;
/*217*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*218*/	  r0.z = r0.z * r3.x + r6.x;
/*219*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*220*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*221*/	  r3.x = -r0.z * r0.z + 1.000000;
/*222*/	  r3.x = max(r3.x, 0.001000);
/*223*/	  r3.x = log2(r3.x);
/*224*/	  r5.x = r3.x * 4.950617;
/*225*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*226*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*227*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*228*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*229*/	  r0.z = floatBitsToInt(r0.z);
/*230*/	  r5.x = r3.x * r3.x + -r5.x;
/*231*/	  r5.x = sqrt(r5.x);
/*232*/	  r3.x = -r3.x + r5.x;
/*233*/	  r3.x = max(r3.x, 0.000000);
/*234*/	  r3.x = sqrt(r3.x);
/*235*/	  r0.z = r0.z * r3.x;
/*236*/	  r0.z = r0.z * 1.414214;
/*237*/	  r0.z = 0.008727 / r0.z;
/*238*/	  r0.z = max(r0.z, 0.000100);
/*239*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*240*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*241*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*242*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*243*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*244*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*245*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*246*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*247*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*248*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*249*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*250*/	  r0.x = floatBitsToInt(r0.x);
/*251*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*252*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*253*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*254*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*255*/	  r0.x = r0.x * r5.x + 1.000000;
/*256*/	  r0.x = r0.x * 0.500000;
/*257*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*258*/	  r0.z = r0.z * r5.y + 1.000000;
/*259*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*260*/	  r0.z = min(r0.y, 1.000000);
/*261*/	  r2.w = r2.w * 1.570796;
/*262*/	  r2.w = sin(r2.w);
/*263*/	  r0.z = r0.z + -1.000000;
/*264*/	  r0.z = r2.w * r0.z + 1.000000;
/*265*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*266*/	  r2.w = max(r2.w, 0.000000);
/*267*/	  r2.w = log2(r2.w);
/*268*/	  r2.w = r2.w * 10.000000;
/*269*/	  r2.w = exp2(r2.w);
/*270*/	  r2.w = r6.w * r2.w;
/*271*/	  r2.w = r2.w * r7.x + r0.w;
/*272*/	  r0.x = r0.z * abs(r0.x);
/*273*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*274*/	} else {
/*275*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*276*/	}
/*277*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*278*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*279*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*280*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*281*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*282*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*283*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*284*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*285*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*286*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*287*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*288*/	r2.w = 1.000000;
/*289*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*290*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*291*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*292*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*293*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*294*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*295*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*296*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*297*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*298*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*299*/	if(r0.w != 0) discard;
/*300*/	r0.w = sqrt(r1.w);
/*301*/	r1.x = saturate(cb3.data[0].w)/**/;
/*302*/	r1.x = -r1.x + 1.000000;
/*303*/	r1.x = r1.x * 8.000000 + -4.000000;
/*304*/	r1.y = saturate(cb3.data[1].x)/**/;
/*305*/	r1.y = -r1.y + 1.000000;
/*306*/	r1.y = r1.y * 1000.000000;
/*307*/	r0.w = r0.w / r1.y;
/*308*/	r0.w = r0.w + r1.x;
/*309*/	r0.w = r0.w * 1.442695;
/*310*/	r0.w = exp2(r0.w);
/*311*/	r0.w = cb3.data[1].y / r0.w;
/*312*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*313*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*314*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*315*/	r1.x = r1.x + -cb3.data[1].z;
/*316*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*317*/	r1.x = saturate(r1.y * r1.x);
/*318*/	r1.y = r1.x * -2.000000 + 3.000000;
/*319*/	r1.x = r1.x * r1.x;
/*320*/	r1.x = r1.x * r1.y;
/*321*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*322*/	r1.y = sqrt(r1.y);
/*323*/	r1.z = max(cb3.data[2].z, 0.001000);
/*324*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*325*/	r1.y = r1.z * r1.y;
/*326*/	r1.y = min(r1.y, 1.000000);
/*327*/	r1.z = r1.y * -2.000000 + 3.000000;
/*328*/	r1.y = r1.y * r1.y;
/*329*/	r1.y = r1.y * r1.z;
/*330*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*331*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*332*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*333*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*334*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*335*/	r4.w = max(r4.y, 0.000000);
/*336*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*337*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*338*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*339*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*340*/	r0.w = saturate(r0.w * r1.y);
/*341*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*342*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*343*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*344*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*345*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*346*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*347*/	return;
}
