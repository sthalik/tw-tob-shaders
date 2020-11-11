//
//
// Shader Model 4
// Fragment Shader
//
// id: 2602 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_weighted_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*3*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*4*/	r0.w = saturate(vsOut_P1.w);
/*5*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*6*/	r3.xyz = (r0.wwww * r3.xyzx + cb5.data[0].xyzx).xyz;
/*7*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*8*/	r2.xyw = (r2.xyxw + -cb5.data[1].xyxz).xyw;
/*9*/	r2.xyw = (r0.wwww * r2.xyxw + cb5.data[1].xyxz).xyw;
/*10*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*11*/	r4.xyz = (r4.xyzx + -cb5.data[2].xyzx).xyz;
/*12*/	r4.xyz = (r0.wwww * r4.xyzx + cb5.data[2].xyzx).xyz;
/*13*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*14*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*18*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*19*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*21*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*23*/	r0.w = -r0.w + 1.000000;
/*24*/	r0.w = max(r0.w, 0.000000);
/*25*/	r0.w = sqrt(r0.w);
/*26*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*27*/	if(r1.z != 0) discard;
/*28*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*29*/	r1.zw = (r1.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*31*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*32*/	r1.z = saturate(-r1.z + r2.w);
/*33*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*34*/	if(floatBitsToUint(r1.z) != 0u) {
/*35*/	  r1.z = -r2.w + 1.000000;
/*36*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*37*/	  r1.z = -r1.z + 1.000000;
/*38*/	  r1.z = -r1.z * r1.z + 1.000000;
/*39*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*40*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*41*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*42*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*43*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*44*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*45*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*46*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*47*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*48*/	} else {
/*49*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*51*/	}
/*52*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*54*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*55*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*57*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*58*/	r1.z = vsOut_T7.y * -r3.y + r3.y;
/*59*/	r1.z = vsOut_T7.x * -r1.z + r1.z;
/*60*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*61*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*62*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*63*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r1.w = inversesqrt(r1.w);
/*65*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*66*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*69*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*72*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*73*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*74*/	r1.xyw = (r0.wwww * r5.xyxz + r1.xyxw).xyw;
/*75*/	r0.w = dot(vec3(r1.xywx), vec3(r1.xywx));
/*76*/	r0.w = inversesqrt(r0.w);
/*77*/	r1.xyw = (r0.wwww * r1.xyxw).xyw;
/*78*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*79*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*80*/	r2.w = inversesqrt(r0.w);
/*81*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*82*/	r2.w = -r3.x + 1.000000;
/*83*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*84*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xywx));
/*85*/	r5.y = r5.y + r5.y;
/*86*/	r5.yzw = (r1.xxyw * -r5.yyyy + r3.yyzw).yzw;
/*87*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*88*/	r6.w = r2.w * 1.539380;
/*89*/	r6.w = cos((r6.w));
/*90*/	r6.w = inversesqrt(r6.w);
/*91*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*92*/	r7.x = saturate(r1.z * 60.000000);
/*93*/	r7.x = -r1.z + r7.x;
/*94*/	r7.yzw = (r1.xxyw * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*95*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*96*/	r8.x = inversesqrt(r8.x);
/*97*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*98*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*99*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*100*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*101*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*102*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*103*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*104*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*105*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*106*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*107*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*108*/	r6.y = -r1.z + 1.000000;
/*109*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*110*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*111*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*112*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*113*/	  r6.y = max(r6.y, 0.000000);
/*114*/	  r6.y = log2(r6.y);
/*115*/	  r6.y = r6.y * 10.000000;
/*116*/	  r6.y = exp2(r6.y);
/*117*/	  r6.y = r6.w * r6.y;
/*118*/	  r6.y = r6.y * r7.x + r1.z;
/*119*/	  r8.x = r2.w * 8.000000;
/*120*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*121*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*122*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*123*/	}
/*124*/	r1.x = dot(vec3(r1.xywx), vec3(-cb2.data[0].yzwy));
/*125*/	r1.y = max(r1.x, 0.000000);
/*126*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*127*/	if(floatBitsToUint(r1.x) != 0u) {
/*128*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*129*/	  r1.x = max(r1.x, -1.000000);
/*130*/	  r1.x = min(r1.x, 1.000000);
/*131*/	  r1.w = -abs(r1.x) + 1.000000;
/*132*/	  r1.w = sqrt(r1.w);
/*133*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*134*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*135*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*136*/	  r5.z = r1.w * r5.y;
/*137*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*138*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*139*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*140*/	  r1.x = r5.y * r1.w + r1.x;
/*141*/	  r1.w = r3.x * r3.x;
/*142*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*143*/	  r1.w = r1.w * r3.x + r6.x;
/*144*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*145*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*146*/	  r3.x = -r1.w * r1.w + 1.000000;
/*147*/	  r3.x = max(r3.x, 0.001000);
/*148*/	  r3.x = log2(r3.x);
/*149*/	  r5.x = r3.x * 4.950617;
/*150*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*151*/	  r5.y = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*152*/	  r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*153*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.w));
/*154*/	  r1.w = floatBitsToInt(r1.w);
/*155*/	  r5.x = r3.x * r3.x + -r5.x;
/*156*/	  r5.x = sqrt(r5.x);
/*157*/	  r3.x = -r3.x + r5.x;
/*158*/	  r3.x = max(r3.x, 0.000000);
/*159*/	  r3.x = sqrt(r3.x);
/*160*/	  r1.w = r1.w * r3.x;
/*161*/	  r1.w = r1.w * 1.414214;
/*162*/	  r1.w = 0.008727 / r1.w;
/*163*/	  r1.w = max(r1.w, 0.000100);
/*164*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*165*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).x;
/*166*/	  r1.xw = (r1.xxxx * r5.xxxy).xw;
/*167*/	  r5.xy = (r1.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*168*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*169*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*170*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*171*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*172*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxw)) * 0xffffffffu)).zw;
/*173*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*174*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*175*/	  r1.x = floatBitsToInt(r1.x);
/*176*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*177*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*178*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*179*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*180*/	  r1.x = r1.x * r5.x + 1.000000;
/*181*/	  r1.x = r1.x * 0.500000;
/*182*/	  r1.w = 1 + ~floatBitsToInt(r5.w);
/*183*/	  r1.w = r1.w * r5.y + 1.000000;
/*184*/	  r1.x = r1.w * 0.500000 + -r1.x;
/*185*/	  r1.w = min(r1.y, 1.000000);
/*186*/	  r2.w = r2.w * 1.570796;
/*187*/	  r2.w = sin(r2.w);
/*188*/	  r1.w = r1.w + -1.000000;
/*189*/	  r1.w = r2.w * r1.w + 1.000000;
/*190*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*191*/	  r2.w = max(r2.w, 0.000000);
/*192*/	  r2.w = log2(r2.w);
/*193*/	  r2.w = r2.w * 10.000000;
/*194*/	  r2.w = exp2(r2.w);
/*195*/	  r2.w = r6.w * r2.w;
/*196*/	  r2.w = r2.w * r7.x + r1.z;
/*197*/	  r1.x = r1.w * abs(r1.x);
/*198*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*199*/	} else {
/*200*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*201*/	}
/*202*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*203*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*204*/	r1.xzw = (max(r1.zzzz, r3.xxyz)).xzw;
/*205*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*206*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*207*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*208*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*209*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*210*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*211*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*212*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*213*/	r1.w = 1.000000;
/*214*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*215*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*216*/	r1.x = dot(r1.xyzw, cb1.data[12].xyzw);
/*217*/	r1.xy = (r2.xyxx / r1.xxxx).xy;
/*218*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*219*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*220*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*221*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r1.x));
/*222*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*223*/	r1.x = uintBitsToFloat(~floatBitsToUint(r1.x));
/*224*/	if(r1.x != 0) discard;
/*225*/	r0.w = sqrt(r0.w);
/*226*/	r1.x = saturate(cb3.data[0].w)/**/;
/*227*/	r1.x = -r1.x + 1.000000;
/*228*/	r1.x = r1.x * 8.000000 + -4.000000;
/*229*/	r1.y = saturate(cb3.data[1].x)/**/;
/*230*/	r1.y = -r1.y + 1.000000;
/*231*/	r1.y = r1.y * 1000.000000;
/*232*/	r0.w = r0.w / r1.y;
/*233*/	r0.w = r0.w + r1.x;
/*234*/	r0.w = r0.w * 1.442695;
/*235*/	r0.w = exp2(r0.w);
/*236*/	r0.w = cb3.data[1].y / r0.w;
/*237*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*238*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*239*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*240*/	r1.x = r1.x + -cb3.data[1].z;
/*241*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*242*/	r1.x = saturate(r1.y * r1.x);
/*243*/	r1.y = r1.x * -2.000000 + 3.000000;
/*244*/	r1.x = r1.x * r1.x;
/*245*/	r1.x = r1.x * r1.y;
/*246*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*247*/	r1.y = sqrt(r1.y);
/*248*/	r1.z = max(cb3.data[2].z, 0.001000);
/*249*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*250*/	r1.y = r1.z * r1.y;
/*251*/	r1.y = min(r1.y, 1.000000);
/*252*/	r1.z = r1.y * -2.000000 + 3.000000;
/*253*/	r1.y = r1.y * r1.y;
/*254*/	r1.y = r1.y * r1.z;
/*255*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*256*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*257*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*258*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*259*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*260*/	r4.w = max(r4.y, 0.000000);
/*261*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*262*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*263*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*264*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*265*/	r0.w = saturate(r0.w * r1.y);
/*266*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*267*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*268*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*269*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*270*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*271*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*272*/	color0.w = 1.000000;
/*273*/	return;
}
