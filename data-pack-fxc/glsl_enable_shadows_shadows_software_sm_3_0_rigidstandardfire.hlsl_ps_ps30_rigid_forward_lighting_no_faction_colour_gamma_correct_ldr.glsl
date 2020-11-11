//
//
// Shader Model 4
// Fragment Shader
//
// id: 4722 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidstandardfire.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*24*/	r4.x = 0;
/*25*/	r4.y = cb1.data[26].x * 0.050000;
/*26*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*27*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*29*/	r1.w = saturate(r4.x * 5.000000);
/*30*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*31*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*33*/	r2.w = log2(r5.z);
/*34*/	r2.w = r2.w * 1.800000;
/*35*/	r2.w = exp2(r2.w);
/*36*/	r2.w = r2.w * 10.000000;
/*37*/	r2.w = min(r2.w, 1.000000);
/*38*/	r1.w = r1.w + r2.w;
/*39*/	r1.w = r1.w * 0.500000;
/*40*/	r2.w = -r5.w + 1.000000;
/*41*/	r2.w = log2(r2.w);
/*42*/	r2.w = r2.w * vsOut_T7.x;
/*43*/	r2.w = exp2(r2.w);
/*44*/	r2.w = min(r2.w, 1.000000);
/*45*/	r2.w = r2.w * vsOut_T7.x;
/*46*/	r3.z = r5.z * 0.250000;
/*47*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.zzzz).xyz;
/*48*/	r4.xyz = (r1.wwww * r4.xyzx + r3.zzzz).xyz;
/*49*/	r4.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*50*/	r1.xyz = (r2.wwww * r4.xyzx + r1.xyzx).xyz;
/*51*/	r1.w = vsOut_T7.x + -0.025000;
/*52*/	r1.w = max(r1.w, 0.000000);
/*53*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*54*/	r1.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*55*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*61*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*64*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*65*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*66*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*67*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*70*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*71*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*72*/	if(floatBitsToUint(r0.w) != 0u) {
/*73*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*74*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*75*/	  r0.w = r3.w * cb1.data[26].x;
/*76*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*77*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*78*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*79*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*80*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*81*/	}
/*82*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*83*/	if(floatBitsToUint(r0.w) != 0u) {
/*84*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*85*/	  if(floatBitsToUint(r0.w) != 0u) {
/*86*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*87*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*88*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*89*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*90*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*91*/	    r0.w = -r0.w + 1.000000;
/*92*/	    r0.w = max(r0.w, 0.000000);
/*93*/	    r8.z = sqrt(r0.w);
/*94*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*95*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*96*/	    r0.w = inversesqrt(r0.w);
/*97*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*98*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*99*/	    r10.y = -1.000000;
/*100*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*101*/	    r0.w = inversesqrt(r0.w);
/*102*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*103*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*104*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*105*/	    r1.w = r1.w * 1.250000;
/*106*/	    r1.w = min(r1.w, 1.000000);
/*107*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*108*/	    r2.w = r2.w * 4.000000;
/*109*/	    r1.w = r1.w * 0.200000 + r2.w;
/*110*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*111*/	    r0.w = r0.w + -r1.w;
/*112*/	    r0.w = saturate(r0.w * 200.000000);
/*113*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*114*/	    r0.w = r0.w * r0.w;
/*115*/	    r0.w = r0.w * r1.w;
/*116*/	    r3.x = r0.w * -r3.x + r3.x;
/*117*/	    r1.w = -r3.y + 0.200000;
/*118*/	    r3.y = r0.w * r1.w + r3.y;
/*119*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*120*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*121*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*122*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*123*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*124*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*125*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*126*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*127*/	    r1.w = -r1.w + 1.000000;
/*128*/	    r1.w = max(r1.w, 0.000000);
/*129*/	    r7.z = sqrt(r1.w);
/*130*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*131*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*132*/	    r1.w = sqrt(r1.w);
/*133*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*134*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*135*/	    r1.w = inversesqrt(r1.w);
/*136*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*137*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*138*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*139*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*140*/	    r1.w = -r0.y + 1.000000;
/*141*/	    r0.w = min(r0.w, r1.w);
/*142*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*143*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*144*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*145*/	    r0.w = inversesqrt(r0.w);
/*146*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*147*/	  }
/*148*/	}
/*149*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*150*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*151*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*152*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*153*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*154*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*155*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*156*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*157*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*158*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*159*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*160*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*161*/	r1.w = inversesqrt(r1.w);
/*162*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*163*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*164*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*165*/	r2.w = inversesqrt(r1.w);
/*166*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*167*/	r2.w = -r3.x + 1.000000;
/*168*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*169*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*170*/	r5.y = r5.y + r5.y;
/*171*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*172*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*173*/	r6.w = r2.w * 1.539380;
/*174*/	r6.w = cos((r6.w));
/*175*/	r6.w = inversesqrt(r6.w);
/*176*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*177*/	r7.x = saturate(r0.w * 60.000000);
/*178*/	r7.x = -r0.w + r7.x;
/*179*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*180*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*181*/	r8.x = inversesqrt(r8.x);
/*182*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*183*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*184*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*185*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*186*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*187*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*188*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*189*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*190*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*191*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*192*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*193*/	r6.y = -r0.w + 1.000000;
/*194*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*195*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*196*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*197*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*198*/	  r6.y = max(r6.y, 0.000000);
/*199*/	  r6.y = log2(r6.y);
/*200*/	  r6.y = r6.y * 10.000000;
/*201*/	  r6.y = exp2(r6.y);
/*202*/	  r6.y = r6.w * r6.y;
/*203*/	  r6.y = r6.y * r7.x + r0.w;
/*204*/	  r8.x = r2.w * 8.000000;
/*205*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*206*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*207*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*208*/	}
/*209*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*210*/	r0.y = max(r0.x, 0.000000);
/*211*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*212*/	if(floatBitsToUint(r0.x) != 0u) {
/*213*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*214*/	  r0.x = max(r0.x, -1.000000);
/*215*/	  r0.x = min(r0.x, 1.000000);
/*216*/	  r0.z = -abs(r0.x) + 1.000000;
/*217*/	  r0.z = sqrt(r0.z);
/*218*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*219*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*220*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*221*/	  r5.z = r0.z * r5.y;
/*222*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*223*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*224*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*225*/	  r0.x = r5.y * r0.z + r0.x;
/*226*/	  r0.z = r3.x * r3.x;
/*227*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*228*/	  r0.z = r0.z * r3.x + r6.x;
/*229*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*230*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*231*/	  r3.x = -r0.z * r0.z + 1.000000;
/*232*/	  r3.x = max(r3.x, 0.001000);
/*233*/	  r3.x = log2(r3.x);
/*234*/	  r5.x = r3.x * 4.950617;
/*235*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*236*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*237*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*238*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*239*/	  r0.z = floatBitsToInt(r0.z);
/*240*/	  r5.x = r3.x * r3.x + -r5.x;
/*241*/	  r5.x = sqrt(r5.x);
/*242*/	  r3.x = -r3.x + r5.x;
/*243*/	  r3.x = max(r3.x, 0.000000);
/*244*/	  r3.x = sqrt(r3.x);
/*245*/	  r0.z = r0.z * r3.x;
/*246*/	  r0.z = r0.z * 1.414214;
/*247*/	  r0.z = 0.008727 / r0.z;
/*248*/	  r0.z = max(r0.z, 0.000100);
/*249*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*250*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*251*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*252*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*253*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*254*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*255*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*256*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*257*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*258*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*259*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*260*/	  r0.x = floatBitsToInt(r0.x);
/*261*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*262*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*263*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*264*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*265*/	  r0.x = r0.x * r5.x + 1.000000;
/*266*/	  r0.x = r0.x * 0.500000;
/*267*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*268*/	  r0.z = r0.z * r5.y + 1.000000;
/*269*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*270*/	  r0.z = min(r0.y, 1.000000);
/*271*/	  r2.w = r2.w * 1.570796;
/*272*/	  r2.w = sin(r2.w);
/*273*/	  r0.z = r0.z + -1.000000;
/*274*/	  r0.z = r2.w * r0.z + 1.000000;
/*275*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*276*/	  r2.w = max(r2.w, 0.000000);
/*277*/	  r2.w = log2(r2.w);
/*278*/	  r2.w = r2.w * 10.000000;
/*279*/	  r2.w = exp2(r2.w);
/*280*/	  r2.w = r6.w * r2.w;
/*281*/	  r2.w = r2.w * r7.x + r0.w;
/*282*/	  r0.x = r0.z * abs(r0.x);
/*283*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*284*/	} else {
/*285*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*286*/	}
/*287*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*288*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*289*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*290*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*291*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*292*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*293*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*294*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*295*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*296*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*297*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*298*/	r2.w = 1.000000;
/*299*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*300*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*301*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*302*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*303*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*304*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*305*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*306*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*307*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*308*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*309*/	if(r0.w != 0) discard;
/*310*/	r0.w = sqrt(r1.w);
/*311*/	r1.x = saturate(cb3.data[0].w)/**/;
/*312*/	r1.x = -r1.x + 1.000000;
/*313*/	r1.x = r1.x * 8.000000 + -4.000000;
/*314*/	r1.y = saturate(cb3.data[1].x)/**/;
/*315*/	r1.y = -r1.y + 1.000000;
/*316*/	r1.y = r1.y * 1000.000000;
/*317*/	r0.w = r0.w / r1.y;
/*318*/	r0.w = r0.w + r1.x;
/*319*/	r0.w = r0.w * 1.442695;
/*320*/	r0.w = exp2(r0.w);
/*321*/	r0.w = cb3.data[1].y / r0.w;
/*322*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*323*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*324*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*325*/	r1.x = r1.x + -cb3.data[1].z;
/*326*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*327*/	r1.x = saturate(r1.y * r1.x);
/*328*/	r1.y = r1.x * -2.000000 + 3.000000;
/*329*/	r1.x = r1.x * r1.x;
/*330*/	r1.x = r1.x * r1.y;
/*331*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*332*/	r1.y = sqrt(r1.y);
/*333*/	r1.z = max(cb3.data[2].z, 0.001000);
/*334*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*335*/	r1.y = r1.z * r1.y;
/*336*/	r1.y = min(r1.y, 1.000000);
/*337*/	r1.z = r1.y * -2.000000 + 3.000000;
/*338*/	r1.y = r1.y * r1.y;
/*339*/	r1.y = r1.y * r1.z;
/*340*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*341*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*342*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*343*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*344*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*345*/	r4.w = max(r4.y, 0.000000);
/*346*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*347*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*348*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*349*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*350*/	r0.w = saturate(r0.w * r1.y);
/*351*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*352*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*353*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*354*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*355*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*356*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*357*/	return;
}
