//
//
// Shader Model 4
// Fragment Shader
//
// id: 6796 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_weighted_forward_lighting_gamma_correct_LDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*6*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*7*/	r0.w = saturate(vsOut_P1.w);
/*8*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*9*/	r3.xyz = (r0.wwww * r3.xyzx + cb5.data[0].xyzx).xyz;
/*10*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*11*/	r2.xyw = (r2.xyxw + -cb5.data[1].xyxz).xyw;
/*12*/	r2.xyw = (r0.wwww * r2.xyxw + cb5.data[1].xyxz).xyw;
/*13*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*14*/	r4.xyz = (r4.xyzx + -cb5.data[2].xyzx).xyz;
/*15*/	r4.xyz = (r0.wwww * r4.xyzx + cb5.data[2].xyzx).xyz;
/*16*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*19*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*21*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*22*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*23*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*26*/	r0.w = -r0.w + 1.000000;
/*27*/	r0.w = max(r0.w, 0.000000);
/*28*/	r2.z = sqrt(r0.w);
/*29*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*31*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*32*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*33*/	r0.w = r3.w * r4.w;
/*34*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*35*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*36*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*37*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*38*/	r1.x = inversesqrt(r1.x);
/*39*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*40*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*41*/	if(r1.w != 0) discard;
/*42*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*43*/	r2.xy = (r2.xyxx * cb4.data[2].xyxx + vsOut_T6.xyxx).xy;
/*44*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*45*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*46*/	r1.w = saturate(-r1.w + r2.w);
/*47*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r1.w) != 0u) {
/*49*/	  r1.w = -r2.w + 1.000000;
/*50*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*51*/	  r1.w = -r1.w + 1.000000;
/*52*/	  r1.w = -r1.w * r1.w + 1.000000;
/*53*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*54*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*55*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*56*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*57*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*58*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*59*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*60*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*61*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*62*/	} else {
/*63*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*64*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*65*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*66*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*67*/	}
/*68*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*70*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*71*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*72*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*73*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*74*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*75*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*76*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*77*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*78*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*79*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*82*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*85*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r1.w = inversesqrt(r1.w);
/*87*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*88*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*89*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*90*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*91*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*94*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*95*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*96*/	r2.w = inversesqrt(r1.w);
/*97*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*98*/	r2.w = -r3.x + 1.000000;
/*99*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*100*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*101*/	r5.y = r5.y + r5.y;
/*102*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*103*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*104*/	r6.w = r2.w * 1.539380;
/*105*/	r6.w = cos((r6.w));
/*106*/	r6.w = inversesqrt(r6.w);
/*107*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*108*/	r7.x = saturate(r0.w * 60.000000);
/*109*/	r7.x = -r0.w + r7.x;
/*110*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*111*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*112*/	r8.x = inversesqrt(r8.x);
/*113*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*114*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*115*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*116*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*117*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*118*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*119*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*120*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*121*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*122*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*123*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*124*/	r6.y = -r0.w + 1.000000;
/*125*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*126*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*127*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*128*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*129*/	  r6.y = max(r6.y, 0.000000);
/*130*/	  r6.y = log2(r6.y);
/*131*/	  r6.y = r6.y * 10.000000;
/*132*/	  r6.y = exp2(r6.y);
/*133*/	  r6.y = r6.w * r6.y;
/*134*/	  r6.y = r6.y * r7.x + r0.w;
/*135*/	  r8.x = r2.w * 8.000000;
/*136*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*137*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*138*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*139*/	}
/*140*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*141*/	r1.y = max(r1.x, 0.000000);
/*142*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*143*/	if(floatBitsToUint(r1.x) != 0u) {
/*144*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*145*/	  r1.x = max(r1.x, -1.000000);
/*146*/	  r1.x = min(r1.x, 1.000000);
/*147*/	  r1.z = -abs(r1.x) + 1.000000;
/*148*/	  r1.z = sqrt(r1.z);
/*149*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*150*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*151*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*152*/	  r5.z = r1.z * r5.y;
/*153*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*154*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*155*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*156*/	  r1.x = r5.y * r1.z + r1.x;
/*157*/	  r1.z = r3.x * r3.x;
/*158*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*159*/	  r1.z = r1.z * r3.x + r6.x;
/*160*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*161*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*162*/	  r3.x = -r1.z * r1.z + 1.000000;
/*163*/	  r3.x = max(r3.x, 0.001000);
/*164*/	  r3.x = log2(r3.x);
/*165*/	  r5.x = r3.x * 4.950617;
/*166*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*167*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*168*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*169*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*170*/	  r1.z = floatBitsToInt(r1.z);
/*171*/	  r5.x = r3.x * r3.x + -r5.x;
/*172*/	  r5.x = sqrt(r5.x);
/*173*/	  r3.x = -r3.x + r5.x;
/*174*/	  r3.x = max(r3.x, 0.000000);
/*175*/	  r3.x = sqrt(r3.x);
/*176*/	  r1.z = r1.z * r3.x;
/*177*/	  r1.z = r1.z * 1.414214;
/*178*/	  r1.z = 0.008727 / r1.z;
/*179*/	  r1.z = max(r1.z, 0.000100);
/*180*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*181*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*182*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*183*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*184*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*185*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*186*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*187*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*188*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*189*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*190*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*191*/	  r1.x = floatBitsToInt(r1.x);
/*192*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*193*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*194*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*195*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*196*/	  r1.x = r1.x * r5.x + 1.000000;
/*197*/	  r1.x = r1.x * 0.500000;
/*198*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*199*/	  r1.z = r1.z * r5.y + 1.000000;
/*200*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*201*/	  r1.z = min(r1.y, 1.000000);
/*202*/	  r2.w = r2.w * 1.570796;
/*203*/	  r2.w = sin(r2.w);
/*204*/	  r1.z = r1.z + -1.000000;
/*205*/	  r1.z = r2.w * r1.z + 1.000000;
/*206*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*207*/	  r2.w = max(r2.w, 0.000000);
/*208*/	  r2.w = log2(r2.w);
/*209*/	  r2.w = r2.w * 10.000000;
/*210*/	  r2.w = exp2(r2.w);
/*211*/	  r2.w = r6.w * r2.w;
/*212*/	  r2.w = r2.w * r7.x + r0.w;
/*213*/	  r1.x = r1.z * abs(r1.x);
/*214*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*215*/	} else {
/*216*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*217*/	}
/*218*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*219*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*220*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*221*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*222*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*223*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*224*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*225*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*226*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*227*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*228*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*229*/	r2.w = 1.000000;
/*230*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*231*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*232*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*233*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*234*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*235*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*236*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*237*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*238*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*239*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*240*/	if(r0.w != 0) discard;
/*241*/	r0.w = sqrt(r1.w);
/*242*/	r1.x = saturate(cb3.data[0].w)/**/;
/*243*/	r1.x = -r1.x + 1.000000;
/*244*/	r1.x = r1.x * 8.000000 + -4.000000;
/*245*/	r1.y = saturate(cb3.data[1].x)/**/;
/*246*/	r1.y = -r1.y + 1.000000;
/*247*/	r1.y = r1.y * 1000.000000;
/*248*/	r0.w = r0.w / r1.y;
/*249*/	r0.w = r0.w + r1.x;
/*250*/	r0.w = r0.w * 1.442695;
/*251*/	r0.w = exp2(r0.w);
/*252*/	r0.w = cb3.data[1].y / r0.w;
/*253*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*254*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*255*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*256*/	r1.x = r1.x + -cb3.data[1].z;
/*257*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*258*/	r1.x = saturate(r1.y * r1.x);
/*259*/	r1.y = r1.x * -2.000000 + 3.000000;
/*260*/	r1.x = r1.x * r1.x;
/*261*/	r1.x = r1.x * r1.y;
/*262*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*263*/	r1.y = sqrt(r1.y);
/*264*/	r1.z = max(cb3.data[2].z, 0.001000);
/*265*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*266*/	r1.y = r1.z * r1.y;
/*267*/	r1.y = min(r1.y, 1.000000);
/*268*/	r1.z = r1.y * -2.000000 + 3.000000;
/*269*/	r1.y = r1.y * r1.y;
/*270*/	r1.y = r1.y * r1.z;
/*271*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*272*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*273*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*274*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*275*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*276*/	r4.w = max(r4.y, 0.000000);
/*277*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*278*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*279*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*280*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*281*/	r0.w = saturate(r0.w * r1.y);
/*282*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*283*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*284*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*285*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*286*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*287*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*288*/	color0.w = 1.000000;
/*289*/	return;
}
