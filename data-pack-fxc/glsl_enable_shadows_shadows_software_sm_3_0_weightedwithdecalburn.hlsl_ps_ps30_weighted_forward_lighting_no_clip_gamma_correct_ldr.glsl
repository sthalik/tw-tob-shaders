//
//
// Shader Model 4
// Fragment Shader
//
// id: 6994 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalburn.hlsl_PS_ps30_weighted_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_sky;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;

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
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb5.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb5.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb5.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb5.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb5.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r2.z = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*30*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*31*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*32*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*33*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*34*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*35*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*36*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*38*/	if(floatBitsToUint(r0.w) != 0u) {
/*39*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*40*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*42*/	  r0.w = -r0.w + 1.000000;
/*43*/	  r0.w = max(r0.w, 0.000000);
/*44*/	  r5.z = sqrt(r0.w);
/*45*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*47*/	  r0.w = r3.x * r7.w;
/*48*/	  r3.x = r0.w * -0.500000 + r3.x;
/*49*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*50*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*51*/	  r0.w = -r4.w * r6.w + 1.000000;
/*52*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*53*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*54*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*55*/	}
/*56*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*57*/	r4.x = r3.z;
/*58*/	r4.y = cb1.data[26].x * 0.050000 + r3.w;
/*59*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*60*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*61*/	r0.w = saturate(r4.x * 5.000000);
/*62*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*65*/	r1.w = log2(r5.z);
/*66*/	r1.w = r1.w * 1.800000;
/*67*/	r1.w = exp2(r1.w);
/*68*/	r1.w = r1.w * 10.000000;
/*69*/	r1.w = min(r1.w, 1.000000);
/*70*/	r0.w = r0.w + r1.w;
/*71*/	r0.w = r0.w * 0.500000;
/*72*/	r1.w = -r5.w + 1.000000;
/*73*/	r1.w = log2(r1.w);
/*74*/	r1.w = r1.w * vsOut_T7.z;
/*75*/	r1.w = exp2(r1.w);
/*76*/	r1.w = min(r1.w, 1.000000);
/*77*/	r1.w = r1.w * vsOut_T7.z;
/*78*/	r2.w = r5.z * 0.250000;
/*79*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*80*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*81*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*82*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*83*/	r0.w = vsOut_T7.z + -0.025000;
/*84*/	r0.w = max(r0.w, 0.000000);
/*85*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*86*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*87*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*88*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*89*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*90*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*91*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*92*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*93*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*94*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*95*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*96*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*97*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*98*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*101*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*102*/	r1.w = inversesqrt(r1.w);
/*103*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*104*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*105*/	r1.w = inversesqrt(r1.w);
/*106*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*107*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*108*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*109*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*110*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*111*/	r1.w = inversesqrt(r1.w);
/*112*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*113*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*114*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*115*/	r2.w = inversesqrt(r1.w);
/*116*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*117*/	r2.w = -r3.y + 1.000000;
/*118*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*119*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*120*/	r5.y = r5.y + r5.y;
/*121*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*122*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*123*/	r6.w = r2.w * 1.539380;
/*124*/	r6.w = cos((r6.w));
/*125*/	r6.w = inversesqrt(r6.w);
/*126*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*127*/	r7.x = saturate(r0.w * 60.000000);
/*128*/	r7.x = -r0.w + r7.x;
/*129*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*130*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*131*/	r8.x = inversesqrt(r8.x);
/*132*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*133*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*134*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*135*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*136*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*137*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*138*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*139*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*140*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*141*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*142*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*143*/	r6.y = -r0.w + 1.000000;
/*144*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*145*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*146*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*147*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*148*/	  r6.y = max(r6.y, 0.000000);
/*149*/	  r6.y = log2(r6.y);
/*150*/	  r6.y = r6.y * 10.000000;
/*151*/	  r6.y = exp2(r6.y);
/*152*/	  r6.y = r6.w * r6.y;
/*153*/	  r6.y = r6.y * r7.x + r0.w;
/*154*/	  r8.x = r2.w * 8.000000;
/*155*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*156*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*157*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*158*/	}
/*159*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*160*/	r2.y = max(r2.x, 0.000000);
/*161*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*162*/	if(floatBitsToUint(r2.x) != 0u) {
/*163*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*164*/	  r2.x = max(r2.x, -1.000000);
/*165*/	  r2.x = min(r2.x, 1.000000);
/*166*/	  r2.z = -abs(r2.x) + 1.000000;
/*167*/	  r2.z = sqrt(r2.z);
/*168*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*169*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*170*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*171*/	  r5.z = r2.z * r5.y;
/*172*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*173*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*174*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*175*/	  r2.x = r5.y * r2.z + r2.x;
/*176*/	  r2.z = r3.y * r3.y;
/*177*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*178*/	  r2.z = r2.z * r3.y + r6.x;
/*179*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*180*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*181*/	  r3.y = -r2.z * r2.z + 1.000000;
/*182*/	  r3.y = max(r3.y, 0.001000);
/*183*/	  r3.y = log2(r3.y);
/*184*/	  r5.x = r3.y * 4.950617;
/*185*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*186*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*187*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*188*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*189*/	  r2.z = floatBitsToInt(r2.z);
/*190*/	  r5.x = r3.y * r3.y + -r5.x;
/*191*/	  r5.x = sqrt(r5.x);
/*192*/	  r3.y = -r3.y + r5.x;
/*193*/	  r3.y = max(r3.y, 0.000000);
/*194*/	  r3.y = sqrt(r3.y);
/*195*/	  r2.z = r2.z * r3.y;
/*196*/	  r2.z = r2.z * 1.414214;
/*197*/	  r2.z = 0.008727 / r2.z;
/*198*/	  r2.z = max(r2.z, 0.000100);
/*199*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*200*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*201*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*202*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*203*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*204*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*205*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*206*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*207*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*208*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*209*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*210*/	  r2.x = floatBitsToInt(r2.x);
/*211*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*212*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*213*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*214*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*215*/	  r2.x = r2.x * r5.x + 1.000000;
/*216*/	  r2.x = r2.x * 0.500000;
/*217*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*218*/	  r2.z = r2.z * r5.y + 1.000000;
/*219*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*220*/	  r2.z = min(r2.y, 1.000000);
/*221*/	  r2.w = r2.w * 1.570796;
/*222*/	  r2.w = sin(r2.w);
/*223*/	  r2.z = r2.z + -1.000000;
/*224*/	  r2.z = r2.w * r2.z + 1.000000;
/*225*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*226*/	  r2.w = max(r2.w, 0.000000);
/*227*/	  r2.w = log2(r2.w);
/*228*/	  r2.w = r2.w * 10.000000;
/*229*/	  r2.w = exp2(r2.w);
/*230*/	  r2.w = r6.w * r2.w;
/*231*/	  r2.w = r2.w * r7.x + r0.w;
/*232*/	  r2.x = r2.z * abs(r2.x);
/*233*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*234*/	} else {
/*235*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*236*/	}
/*237*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*238*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*239*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*240*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*241*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*242*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*243*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*244*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*245*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*246*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*247*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*248*/	r2.w = 1.000000;
/*249*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*250*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*251*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*252*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*253*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*254*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*255*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*256*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*257*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*258*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*259*/	if(r0.w != 0) discard;
/*260*/	r0.w = sqrt(r1.w);
/*261*/	r1.x = saturate(cb3.data[0].w)/**/;
/*262*/	r1.x = -r1.x + 1.000000;
/*263*/	r1.x = r1.x * 8.000000 + -4.000000;
/*264*/	r1.y = saturate(cb3.data[1].x)/**/;
/*265*/	r1.y = -r1.y + 1.000000;
/*266*/	r1.y = r1.y * 1000.000000;
/*267*/	r0.w = r0.w / r1.y;
/*268*/	r0.w = r0.w + r1.x;
/*269*/	r0.w = r0.w * 1.442695;
/*270*/	r0.w = exp2(r0.w);
/*271*/	r0.w = cb3.data[1].y / r0.w;
/*272*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*273*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*274*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*275*/	r1.x = r1.x + -cb3.data[1].z;
/*276*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*277*/	r1.x = saturate(r1.y * r1.x);
/*278*/	r1.y = r1.x * -2.000000 + 3.000000;
/*279*/	r1.x = r1.x * r1.x;
/*280*/	r1.x = r1.x * r1.y;
/*281*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*282*/	r1.y = sqrt(r1.y);
/*283*/	r1.z = max(cb3.data[2].z, 0.001000);
/*284*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*285*/	r1.y = r1.z * r1.y;
/*286*/	r1.y = min(r1.y, 1.000000);
/*287*/	r1.z = r1.y * -2.000000 + 3.000000;
/*288*/	r1.y = r1.y * r1.y;
/*289*/	r1.y = r1.y * r1.z;
/*290*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*291*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*292*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*293*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*294*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*295*/	r4.w = max(r4.y, 0.000000);
/*296*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*297*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*298*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*299*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*300*/	r0.w = saturate(r0.w * r1.y);
/*301*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*302*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*303*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*304*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*305*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*306*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*307*/	color0.w = 1.000000;
/*308*/	return;
}
