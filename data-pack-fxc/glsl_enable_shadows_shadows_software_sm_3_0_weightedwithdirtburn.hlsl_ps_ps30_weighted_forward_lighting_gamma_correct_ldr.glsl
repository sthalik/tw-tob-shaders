//
//
// Shader Model 4
// Fragment Shader
//
// id: 6849 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_weighted_forward_lighting_gamma_correct_LDR.glsl
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

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
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
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb5.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb5.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb5.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb5.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb5.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r3.z = sqrt(r0.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r0.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*42*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*45*/	r5.x = r3.x;
/*46*/	r5.y = cb1.data[26].x * 0.050000 + r3.y;
/*47*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*48*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*49*/	r0.w = saturate(r5.x * 5.000000);
/*50*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*51*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*52*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*53*/	r1.w = log2(r3.z);
/*54*/	r1.w = r1.w * 1.800000;
/*55*/	r1.w = exp2(r1.w);
/*56*/	r1.w = r1.w * 10.000000;
/*57*/	r1.w = min(r1.w, 1.000000);
/*58*/	r0.w = r0.w + r1.w;
/*59*/	r0.w = r0.w * 0.500000;
/*60*/	r1.w = -r3.w + 1.000000;
/*61*/	r1.w = log2(r1.w);
/*62*/	r1.w = r1.w * vsOut_T7.z;
/*63*/	r1.w = exp2(r1.w);
/*64*/	r1.w = min(r1.w, 1.000000);
/*65*/	r1.w = r1.w * vsOut_T7.z;
/*66*/	r2.w = r3.z * 0.250000;
/*67*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*68*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*69*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*70*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*71*/	r0.w = vsOut_T7.z + -0.025000;
/*72*/	r0.w = max(r0.w, 0.000000);
/*73*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*74*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*75*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*77*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*78*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*79*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*80*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*81*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*82*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*83*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*84*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*85*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*89*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*92*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*95*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*96*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*97*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*98*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*101*/	r3.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*102*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*103*/	r2.w = inversesqrt(r1.w);
/*104*/	r4.yzw = (r2.wwww * r3.xxyz).yzw;
/*105*/	r2.w = -r4.x + 1.000000;
/*106*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*107*/	r5.y = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*108*/	r5.y = r5.y + r5.y;
/*109*/	r5.yzw = (r2.xxyz * -r5.yyyy + r4.yyzw).yzw;
/*110*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*111*/	r6.w = r2.w * 1.539380;
/*112*/	r6.w = cos((r6.w));
/*113*/	r6.w = inversesqrt(r6.w);
/*114*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*115*/	r7.x = saturate(r0.w * 60.000000);
/*116*/	r7.x = -r0.w + r7.x;
/*117*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*118*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*119*/	r8.x = inversesqrt(r8.x);
/*120*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*121*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*122*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*123*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*124*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*125*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*126*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*127*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*128*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*129*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*130*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*131*/	r6.y = -r0.w + 1.000000;
/*132*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*133*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*134*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*135*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.yzwy));
/*136*/	  r6.y = max(r6.y, 0.000000);
/*137*/	  r6.y = log2(r6.y);
/*138*/	  r6.y = r6.y * 10.000000;
/*139*/	  r6.y = exp2(r6.y);
/*140*/	  r6.y = r6.w * r6.y;
/*141*/	  r6.y = r6.y * r7.x + r0.w;
/*142*/	  r8.x = r2.w * 8.000000;
/*143*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*144*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*145*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*146*/	}
/*147*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*148*/	r2.y = max(r2.x, 0.000000);
/*149*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*150*/	if(floatBitsToUint(r2.x) != 0u) {
/*151*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*152*/	  r2.x = max(r2.x, -1.000000);
/*153*/	  r2.x = min(r2.x, 1.000000);
/*154*/	  r2.z = -abs(r2.x) + 1.000000;
/*155*/	  r2.z = sqrt(r2.z);
/*156*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*157*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*158*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*159*/	  r5.z = r2.z * r5.y;
/*160*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*161*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*162*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*163*/	  r2.x = r5.y * r2.z + r2.x;
/*164*/	  r2.z = r4.x * r4.x;
/*165*/	    r4.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*166*/	  r2.z = r2.z * r4.x + r6.x;
/*167*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*168*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*169*/	  r4.x = -r2.z * r2.z + 1.000000;
/*170*/	  r4.x = max(r4.x, 0.001000);
/*171*/	  r4.x = log2(r4.x);
/*172*/	  r5.x = r4.x * 4.950617;
/*173*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*174*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*175*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*176*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*177*/	  r2.z = floatBitsToInt(r2.z);
/*178*/	  r5.x = r4.x * r4.x + -r5.x;
/*179*/	  r5.x = sqrt(r5.x);
/*180*/	  r4.x = -r4.x + r5.x;
/*181*/	  r4.x = max(r4.x, 0.000000);
/*182*/	  r4.x = sqrt(r4.x);
/*183*/	  r2.z = r2.z * r4.x;
/*184*/	  r2.z = r2.z * 1.414214;
/*185*/	  r2.z = 0.008727 / r2.z;
/*186*/	  r2.z = max(r2.z, 0.000100);
/*187*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*188*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*189*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*190*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*191*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*192*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*193*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*194*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*195*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*196*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*197*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*198*/	  r2.x = floatBitsToInt(r2.x);
/*199*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*200*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*201*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*202*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*203*/	  r2.x = r2.x * r5.x + 1.000000;
/*204*/	  r2.x = r2.x * 0.500000;
/*205*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*206*/	  r2.z = r2.z * r5.y + 1.000000;
/*207*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*208*/	  r2.z = min(r2.y, 1.000000);
/*209*/	  r2.w = r2.w * 1.570796;
/*210*/	  r2.w = sin(r2.w);
/*211*/	  r2.z = r2.z + -1.000000;
/*212*/	  r2.z = r2.w * r2.z + 1.000000;
/*213*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r4.yzwy));
/*214*/	  r2.w = max(r2.w, 0.000000);
/*215*/	  r2.w = log2(r2.w);
/*216*/	  r2.w = r2.w * 10.000000;
/*217*/	  r2.w = exp2(r2.w);
/*218*/	  r2.w = r6.w * r2.w;
/*219*/	  r2.w = r2.w * r7.x + r0.w;
/*220*/	  r2.x = r2.z * abs(r2.x);
/*221*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*222*/	} else {
/*223*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*224*/	}
/*225*/	r4.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*226*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*227*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*228*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*229*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*230*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*231*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*232*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*233*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*234*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*235*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*236*/	r2.w = 1.000000;
/*237*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*238*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*239*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*240*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*241*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*242*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*243*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*244*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*245*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*246*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*247*/	if(r0.w != 0) discard;
/*248*/	r0.w = sqrt(r1.w);
/*249*/	r1.x = saturate(cb3.data[0].w)/**/;
/*250*/	r1.x = -r1.x + 1.000000;
/*251*/	r1.x = r1.x * 8.000000 + -4.000000;
/*252*/	r1.y = saturate(cb3.data[1].x)/**/;
/*253*/	r1.y = -r1.y + 1.000000;
/*254*/	r1.y = r1.y * 1000.000000;
/*255*/	r0.w = r0.w / r1.y;
/*256*/	r0.w = r0.w + r1.x;
/*257*/	r0.w = r0.w * 1.442695;
/*258*/	r0.w = exp2(r0.w);
/*259*/	r0.w = cb3.data[1].y / r0.w;
/*260*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*261*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*262*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*263*/	r1.x = r1.x + -cb3.data[1].z;
/*264*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*265*/	r1.x = saturate(r1.y * r1.x);
/*266*/	r1.y = r1.x * -2.000000 + 3.000000;
/*267*/	r1.x = r1.x * r1.x;
/*268*/	r1.x = r1.x * r1.y;
/*269*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*270*/	r1.y = sqrt(r1.y);
/*271*/	r1.z = max(cb3.data[2].z, 0.001000);
/*272*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*273*/	r1.y = r1.z * r1.y;
/*274*/	r1.y = min(r1.y, 1.000000);
/*275*/	r1.z = r1.y * -2.000000 + 3.000000;
/*276*/	r1.y = r1.y * r1.y;
/*277*/	r1.y = r1.y * r1.z;
/*278*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*279*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*280*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*281*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*282*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*283*/	r3.w = max(r3.y, 0.000000);
/*284*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*285*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*286*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*287*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*288*/	r0.w = saturate(r0.w * r1.y);
/*289*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*290*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*291*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*292*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*293*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*294*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*295*/	color0.w = 1.000000;
/*296*/	return;
}
