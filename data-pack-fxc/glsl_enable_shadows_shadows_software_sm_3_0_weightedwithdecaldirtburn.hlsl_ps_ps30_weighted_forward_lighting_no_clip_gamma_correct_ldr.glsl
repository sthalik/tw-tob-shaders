//
//
// Shader Model 4
// Fragment Shader
//
// id: 7137 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtburn.hlsl_PS_ps30_weighted_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

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
/*56*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*57*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*58*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*59*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*60*/	r0.w = r4.w * r5.w;
/*61*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*62*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*63*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*64*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*67*/	r4.xyz = (r0.wwww * r1.xyzx).xyz;
/*68*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*69*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*70*/	r4.x = r3.z;
/*71*/	r4.y = cb1.data[26].x * 0.050000 + r3.w;
/*72*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*73*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*74*/	r0.w = saturate(r4.x * 5.000000);
/*75*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*76*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*78*/	r1.w = log2(r5.z);
/*79*/	r1.w = r1.w * 1.800000;
/*80*/	r1.w = exp2(r1.w);
/*81*/	r1.w = r1.w * 10.000000;
/*82*/	r1.w = min(r1.w, 1.000000);
/*83*/	r0.w = r0.w + r1.w;
/*84*/	r0.w = r0.w * 0.500000;
/*85*/	r1.w = -r5.w + 1.000000;
/*86*/	r1.w = log2(r1.w);
/*87*/	r1.w = r1.w * vsOut_T7.z;
/*88*/	r1.w = exp2(r1.w);
/*89*/	r1.w = min(r1.w, 1.000000);
/*90*/	r1.w = r1.w * vsOut_T7.z;
/*91*/	r2.w = r5.z * 0.250000;
/*92*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*93*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*94*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*95*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*96*/	r0.w = vsOut_T7.z + -0.025000;
/*97*/	r0.w = max(r0.w, 0.000000);
/*98*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*99*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*100*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*101*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*102*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*103*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*104*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*105*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*106*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*107*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*108*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*109*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*110*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*111*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*112*/	r1.w = inversesqrt(r1.w);
/*113*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*114*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*115*/	r1.w = inversesqrt(r1.w);
/*116*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*117*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*118*/	r1.w = inversesqrt(r1.w);
/*119*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*120*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*121*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*122*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*123*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*124*/	r1.w = inversesqrt(r1.w);
/*125*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*126*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*127*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*128*/	r2.w = inversesqrt(r1.w);
/*129*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*130*/	r2.w = -r3.y + 1.000000;
/*131*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*132*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*133*/	r5.y = r5.y + r5.y;
/*134*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*135*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*136*/	r6.w = r2.w * 1.539380;
/*137*/	r6.w = cos((r6.w));
/*138*/	r6.w = inversesqrt(r6.w);
/*139*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*140*/	r7.x = saturate(r0.w * 60.000000);
/*141*/	r7.x = -r0.w + r7.x;
/*142*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*143*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*144*/	r8.x = inversesqrt(r8.x);
/*145*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*146*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*147*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*148*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*149*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*150*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*151*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*152*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*153*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*154*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*155*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*156*/	r6.y = -r0.w + 1.000000;
/*157*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*158*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*159*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*160*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*161*/	  r6.y = max(r6.y, 0.000000);
/*162*/	  r6.y = log2(r6.y);
/*163*/	  r6.y = r6.y * 10.000000;
/*164*/	  r6.y = exp2(r6.y);
/*165*/	  r6.y = r6.w * r6.y;
/*166*/	  r6.y = r6.y * r7.x + r0.w;
/*167*/	  r8.x = r2.w * 8.000000;
/*168*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*169*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*170*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*171*/	}
/*172*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*173*/	r2.y = max(r2.x, 0.000000);
/*174*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*175*/	if(floatBitsToUint(r2.x) != 0u) {
/*176*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*177*/	  r2.x = max(r2.x, -1.000000);
/*178*/	  r2.x = min(r2.x, 1.000000);
/*179*/	  r2.z = -abs(r2.x) + 1.000000;
/*180*/	  r2.z = sqrt(r2.z);
/*181*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*182*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*183*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*184*/	  r5.z = r2.z * r5.y;
/*185*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*186*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*187*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*188*/	  r2.x = r5.y * r2.z + r2.x;
/*189*/	  r2.z = r3.y * r3.y;
/*190*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*191*/	  r2.z = r2.z * r3.y + r6.x;
/*192*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*193*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*194*/	  r3.y = -r2.z * r2.z + 1.000000;
/*195*/	  r3.y = max(r3.y, 0.001000);
/*196*/	  r3.y = log2(r3.y);
/*197*/	  r5.x = r3.y * 4.950617;
/*198*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*199*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*200*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*201*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*202*/	  r2.z = floatBitsToInt(r2.z);
/*203*/	  r5.x = r3.y * r3.y + -r5.x;
/*204*/	  r5.x = sqrt(r5.x);
/*205*/	  r3.y = -r3.y + r5.x;
/*206*/	  r3.y = max(r3.y, 0.000000);
/*207*/	  r3.y = sqrt(r3.y);
/*208*/	  r2.z = r2.z * r3.y;
/*209*/	  r2.z = r2.z * 1.414214;
/*210*/	  r2.z = 0.008727 / r2.z;
/*211*/	  r2.z = max(r2.z, 0.000100);
/*212*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*213*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*214*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*215*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*216*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*217*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*218*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*219*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*220*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*221*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*222*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*223*/	  r2.x = floatBitsToInt(r2.x);
/*224*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*225*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*226*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*227*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*228*/	  r2.x = r2.x * r5.x + 1.000000;
/*229*/	  r2.x = r2.x * 0.500000;
/*230*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*231*/	  r2.z = r2.z * r5.y + 1.000000;
/*232*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*233*/	  r2.z = min(r2.y, 1.000000);
/*234*/	  r2.w = r2.w * 1.570796;
/*235*/	  r2.w = sin(r2.w);
/*236*/	  r2.z = r2.z + -1.000000;
/*237*/	  r2.z = r2.w * r2.z + 1.000000;
/*238*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*239*/	  r2.w = max(r2.w, 0.000000);
/*240*/	  r2.w = log2(r2.w);
/*241*/	  r2.w = r2.w * 10.000000;
/*242*/	  r2.w = exp2(r2.w);
/*243*/	  r2.w = r6.w * r2.w;
/*244*/	  r2.w = r2.w * r7.x + r0.w;
/*245*/	  r2.x = r2.z * abs(r2.x);
/*246*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*247*/	} else {
/*248*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*249*/	}
/*250*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*251*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*252*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*253*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*254*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*255*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*256*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*257*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*258*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*259*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*260*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*261*/	r2.w = 1.000000;
/*262*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*263*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*264*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*265*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*266*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*267*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*268*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*269*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*270*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*271*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*272*/	if(r0.w != 0) discard;
/*273*/	r0.w = sqrt(r1.w);
/*274*/	r1.x = saturate(cb3.data[0].w)/**/;
/*275*/	r1.x = -r1.x + 1.000000;
/*276*/	r1.x = r1.x * 8.000000 + -4.000000;
/*277*/	r1.y = saturate(cb3.data[1].x)/**/;
/*278*/	r1.y = -r1.y + 1.000000;
/*279*/	r1.y = r1.y * 1000.000000;
/*280*/	r0.w = r0.w / r1.y;
/*281*/	r0.w = r0.w + r1.x;
/*282*/	r0.w = r0.w * 1.442695;
/*283*/	r0.w = exp2(r0.w);
/*284*/	r0.w = cb3.data[1].y / r0.w;
/*285*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*286*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*287*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*288*/	r1.x = r1.x + -cb3.data[1].z;
/*289*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*290*/	r1.x = saturate(r1.y * r1.x);
/*291*/	r1.y = r1.x * -2.000000 + 3.000000;
/*292*/	r1.x = r1.x * r1.x;
/*293*/	r1.x = r1.x * r1.y;
/*294*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*295*/	r1.y = sqrt(r1.y);
/*296*/	r1.z = max(cb3.data[2].z, 0.001000);
/*297*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*298*/	r1.y = r1.z * r1.y;
/*299*/	r1.y = min(r1.y, 1.000000);
/*300*/	r1.z = r1.y * -2.000000 + 3.000000;
/*301*/	r1.y = r1.y * r1.y;
/*302*/	r1.y = r1.y * r1.z;
/*303*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*304*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*305*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*306*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*307*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*308*/	r4.w = max(r4.y, 0.000000);
/*309*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*310*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*311*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*312*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*313*/	r0.w = saturate(r0.w * r1.y);
/*314*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*315*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*316*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*317*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*318*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*319*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*320*/	color0.w = 1.000000;
/*321*/	return;
}
