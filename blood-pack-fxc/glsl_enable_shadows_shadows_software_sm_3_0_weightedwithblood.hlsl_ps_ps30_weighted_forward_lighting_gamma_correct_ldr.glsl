//
//
// Shader Model 4
// Fragment Shader
//
// id: 6658 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithblood.hlsl_PS_ps30_weighted_forward_lighting_gamma_correct_LDR.glsl
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
/*28*/	r0.w = sqrt(r0.w);
/*29*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*30*/	if(r1.z != 0) discard;
/*31*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*32*/	r1.zw = (r1.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*34*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*35*/	r1.z = saturate(-r1.z + r2.w);
/*36*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r1.z) != 0u) {
/*38*/	  r1.z = -r2.w + 1.000000;
/*39*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*40*/	  r1.z = -r1.z + 1.000000;
/*41*/	  r1.z = -r1.z * r1.z + 1.000000;
/*42*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*43*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*44*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*47*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*48*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*49*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*50*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*51*/	} else {
/*52*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*53*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	}
/*55*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*57*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*58*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*60*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*61*/	r1.z = vsOut_T7.y * -r3.y + r3.y;
/*62*/	r1.z = vsOut_T7.x * -r1.z + r1.z;
/*63*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*64*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*66*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*69*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*72*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*75*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*76*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*77*/	r1.xyw = (r0.wwww * r5.xyxz + r1.xyxw).xyw;
/*78*/	r0.w = dot(vec3(r1.xywx), vec3(r1.xywx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r1.xyw = (r0.wwww * r1.xyxw).xyw;
/*81*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*82*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*83*/	r2.w = inversesqrt(r0.w);
/*84*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*85*/	r2.w = -r3.x + 1.000000;
/*86*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*87*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xywx));
/*88*/	r5.y = r5.y + r5.y;
/*89*/	r5.yzw = (r1.xxyw * -r5.yyyy + r3.yyzw).yzw;
/*90*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*91*/	r6.w = r2.w * 1.539380;
/*92*/	r6.w = cos((r6.w));
/*93*/	r6.w = inversesqrt(r6.w);
/*94*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*95*/	r7.x = saturate(r1.z * 60.000000);
/*96*/	r7.x = -r1.z + r7.x;
/*97*/	r7.yzw = (r1.xxyw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*98*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*99*/	r8.x = inversesqrt(r8.x);
/*100*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*101*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*102*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*103*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*104*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*105*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*106*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*107*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*108*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*109*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*110*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*111*/	r6.y = -r1.z + 1.000000;
/*112*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*113*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*114*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*115*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*116*/	  r6.y = max(r6.y, 0.000000);
/*117*/	  r6.y = log2(r6.y);
/*118*/	  r6.y = r6.y * 10.000000;
/*119*/	  r6.y = exp2(r6.y);
/*120*/	  r6.y = r6.w * r6.y;
/*121*/	  r6.y = r6.y * r7.x + r1.z;
/*122*/	  r8.x = r2.w * 8.000000;
/*123*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*124*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*125*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*126*/	}
/*127*/	r1.x = dot(vec3(r1.xywx), vec3(-cb2.data[0].yzwy));
/*128*/	r1.y = max(r1.x, 0.000000);
/*129*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*130*/	if(floatBitsToUint(r1.x) != 0u) {
/*131*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*132*/	  r1.x = max(r1.x, -1.000000);
/*133*/	  r1.x = min(r1.x, 1.000000);
/*134*/	  r1.w = -abs(r1.x) + 1.000000;
/*135*/	  r1.w = sqrt(r1.w);
/*136*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*137*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*138*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*139*/	  r5.z = r1.w * r5.y;
/*140*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*141*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*142*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*143*/	  r1.x = r5.y * r1.w + r1.x;
/*144*/	  r1.w = r3.x * r3.x;
/*145*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*146*/	  r1.w = r1.w * r3.x + r6.x;
/*147*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*148*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*149*/	  r3.x = -r1.w * r1.w + 1.000000;
/*150*/	  r3.x = max(r3.x, 0.001000);
/*151*/	  r3.x = log2(r3.x);
/*152*/	  r5.x = r3.x * 4.950617;
/*153*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*154*/	  r5.y = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*155*/	  r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*156*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.w));
/*157*/	  r1.w = floatBitsToInt(r1.w);
/*158*/	  r5.x = r3.x * r3.x + -r5.x;
/*159*/	  r5.x = sqrt(r5.x);
/*160*/	  r3.x = -r3.x + r5.x;
/*161*/	  r3.x = max(r3.x, 0.000000);
/*162*/	  r3.x = sqrt(r3.x);
/*163*/	  r1.w = r1.w * r3.x;
/*164*/	  r1.w = r1.w * 1.414214;
/*165*/	  r1.w = 0.008727 / r1.w;
/*166*/	  r1.w = max(r1.w, 0.000100);
/*167*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*168*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).x;
/*169*/	  r1.xw = (r1.xxxx * r5.xxxy).xw;
/*170*/	  r5.xy = (r1.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*171*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*172*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*173*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*174*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*175*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxw)) * 0xffffffffu)).zw;
/*176*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*177*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*178*/	  r1.x = floatBitsToInt(r1.x);
/*179*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*180*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*181*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*182*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*183*/	  r1.x = r1.x * r5.x + 1.000000;
/*184*/	  r1.x = r1.x * 0.500000;
/*185*/	  r1.w = 1 + ~floatBitsToInt(r5.w);
/*186*/	  r1.w = r1.w * r5.y + 1.000000;
/*187*/	  r1.x = r1.w * 0.500000 + -r1.x;
/*188*/	  r1.w = min(r1.y, 1.000000);
/*189*/	  r2.w = r2.w * 1.570796;
/*190*/	  r2.w = sin(r2.w);
/*191*/	  r1.w = r1.w + -1.000000;
/*192*/	  r1.w = r2.w * r1.w + 1.000000;
/*193*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*194*/	  r2.w = max(r2.w, 0.000000);
/*195*/	  r2.w = log2(r2.w);
/*196*/	  r2.w = r2.w * 10.000000;
/*197*/	  r2.w = exp2(r2.w);
/*198*/	  r2.w = r6.w * r2.w;
/*199*/	  r2.w = r2.w * r7.x + r1.z;
/*200*/	  r1.x = r1.w * abs(r1.x);
/*201*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*202*/	} else {
/*203*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*204*/	}
/*205*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*206*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*207*/	r1.xzw = (max(r1.zzzz, r3.xxyz)).xzw;
/*208*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*209*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*210*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*211*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*212*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*213*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*214*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*215*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*216*/	r1.w = 1.000000;
/*217*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*218*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*219*/	r1.x = dot(r1.xyzw, cb1.data[12].xyzw);
/*220*/	r1.xy = (r2.xyxx / r1.xxxx).xy;
/*221*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*222*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*223*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*224*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r1.x));
/*225*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*226*/	r1.x = uintBitsToFloat(~floatBitsToUint(r1.x));
/*227*/	if(r1.x != 0) discard;
/*228*/	r0.w = sqrt(r0.w);
/*229*/	r1.x = saturate(cb3.data[0].w)/**/;
/*230*/	r1.x = -r1.x + 1.000000;
/*231*/	r1.x = r1.x * 8.000000 + -4.000000;
/*232*/	r1.y = saturate(cb3.data[1].x)/**/;
/*233*/	r1.y = -r1.y + 1.000000;
/*234*/	r1.y = r1.y * 1000.000000;
/*235*/	r0.w = r0.w / r1.y;
/*236*/	r0.w = r0.w + r1.x;
/*237*/	r0.w = r0.w * 1.442695;
/*238*/	r0.w = exp2(r0.w);
/*239*/	r0.w = cb3.data[1].y / r0.w;
/*240*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*241*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*242*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*243*/	r1.x = r1.x + -cb3.data[1].z;
/*244*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*245*/	r1.x = saturate(r1.y * r1.x);
/*246*/	r1.y = r1.x * -2.000000 + 3.000000;
/*247*/	r1.x = r1.x * r1.x;
/*248*/	r1.x = r1.x * r1.y;
/*249*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*250*/	r1.y = sqrt(r1.y);
/*251*/	r1.z = max(cb3.data[2].z, 0.001000);
/*252*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*253*/	r1.y = r1.z * r1.y;
/*254*/	r1.y = min(r1.y, 1.000000);
/*255*/	r1.z = r1.y * -2.000000 + 3.000000;
/*256*/	r1.y = r1.y * r1.y;
/*257*/	r1.y = r1.y * r1.z;
/*258*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*259*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*260*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*261*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*262*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*263*/	r4.w = max(r4.y, 0.000000);
/*264*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*265*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*266*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*267*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*268*/	r0.w = saturate(r0.w * r1.y);
/*269*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*270*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*271*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*272*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*273*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*274*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*275*/	color0.w = 1.000000;
/*276*/	return;
}
