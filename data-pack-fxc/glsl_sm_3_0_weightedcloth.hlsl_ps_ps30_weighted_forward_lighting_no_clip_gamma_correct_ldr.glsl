//
//
// Shader Model 4
// Fragment Shader
//
// id: 3792 - fxc/glsl_SM_3_0_WeightedCloth.hlsl_PS_ps30_weighted_forward_lighting_no_clip_gamma_correct_LDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_T9;
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D normal0_sampler;
uniform sampler2D normal1_sampler;
uniform sampler2D s_diffuse_damage_map;

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
/*5*/	r1.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb5.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r1.wwww * r4.xyzx + cb5.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb5.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r1.wwww * r3.xyxw + cb5.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r1.wwww * r5.xyzx + cb5.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r1.w = -r1.w + 1.000000;
/*25*/	r1.w = max(r1.w, 0.000000);
/*26*/	r3.z = sqrt(r1.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*31*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*32*/	r1.w = r5.w * r6.w;
/*33*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*35*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*36*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	r2.x = inversesqrt(r2.x);
/*38*/	r2.yzw = (r1.wwww * r1.xxyz).yzw;
/*39*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*40*/	r5.xyzw = cb1.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*41*/	r2.yzw = sin(vec3(r5.xxyz));
/*42*/	r1.w = r2.z * r2.y;
/*43*/	r1.w = r2.w * r1.w;
/*44*/	r1.w = r1.w * 0.500000 + 1.000000;
/*45*/	r1.w = r1.w * 0.800000 + r5.w;
/*46*/	r2.yzw = (cb1.data[26].xxxx * vec4(0.000000, 2.500000, 0.300000, 0.870000)).yzw;
/*47*/	r2.yzw = sin(vec3(r2.yyzw));
/*48*/	r2.y = r2.z * r2.y;
/*49*/	r2.y = r2.w * r2.y;
/*50*/	r2.y = r2.y * 0.500000 + 1.000000;
/*51*/	r2.z = r2.y * 0.400000;
/*52*/	r2.y = r2.y * 0.500000 + r5.y;
/*53*/	r4.zw = (r1.wwww * vec4(0.000000, 0.000000, 0.200000, 0.200000) + vsOut_T1.xxxy).zw;
/*54*/	r5.xyzw = (texture(normal0_sampler, r4.zwzz.st)).xyzw;
/*55*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*56*/	r5.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*57*/	r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*58*/	r1.w = -r1.w + 1.000000;
/*59*/	r1.w = max(r1.w, 0.000000);
/*60*/	r5.z = sqrt(r1.w);
/*61*/	r2.yw = (r2.yyyy * vec4(0.000000, 0.500000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*62*/	r6.xyzw = (texture(normal1_sampler, r2.ywyy.st)).xyzw;
/*63*/	r2.yw = (r6.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*64*/	r2.yw = (r2.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*65*/	r1.w = dot(vec2(r2.ywyy), vec2(r2.ywyy));
/*66*/	r1.w = -r1.w + 1.000000;
/*67*/	r1.w = max(r1.w, 0.000000);
/*68*/	r6.z = sqrt(r1.w);
/*69*/	r6.xy = (r2.zzzz * r2.ywyy).xy;
/*70*/	r2.yzw = (r5.xxyz + r6.xxyz).yzw;
/*71*/	r1.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r2.yzw = (r1.wwww * r2.yyzw).yzw;
/*74*/	r2.xyz = (r3.xyzx * r2.xxxx + r2.yzwy).xyz;
/*75*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*78*/	r3.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*79*/	r3.xyz = (r3.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*80*/	r3.xyz = (vsOut_T9.xxxx * r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*81*/	r5.xyz = (r0.xyzx * r3.xyzx).xyz;
/*82*/	r1.w = r3.w + -vsOut_T9.x;
/*83*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*84*/	if(r1.w != 0) discard;
/*85*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*86*/	r0.w = r0.w + -r1.w;
/*87*/	r2.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*88*/	if(r2.w != 0) discard;
/*89*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*90*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*91*/	r0.w = saturate(r0.w * r1.w);
/*92*/	r1.w = r0.w * -2.000000 + 3.000000;
/*93*/	r0.w = r0.w * r0.w;
/*94*/	r4.zw = (-r1.wwww * r0.wwww + vec4(0.000000, 0.000000, 1.000000, 0.975000)).zw;
/*95*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*96*/	r7.x = 0;
/*97*/	r7.y = cb1.data[26].x * 0.050000;
/*98*/	r6.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r7.xxxy).zw;
/*99*/	r7.xyzw = (texture(s_fire_map, r6.zwzz.st)).xyzw;
/*100*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*101*/	r0.w = saturate(r7.x * 5.000000);
/*102*/	r7.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*103*/	r0.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*104*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*105*/	r1.w = log2(r6.z);
/*106*/	r1.w = r1.w * 1.800000;
/*107*/	r1.w = exp2(r1.w);
/*108*/	r1.w = r1.w * 10.000000;
/*109*/	r1.w = min(r1.w, 1.000000);
/*110*/	r0.w = r0.w + r1.w;
/*111*/	r0.w = r0.w * 0.500000;
/*112*/	r1.w = -r6.w + 1.000000;
/*113*/	r1.w = log2(r1.w);
/*114*/	r1.w = r1.w * r4.z;
/*115*/	r1.w = exp2(r1.w);
/*116*/	r1.w = min(r1.w, 1.000000);
/*117*/	r1.w = r4.z * r1.w;
/*118*/	r2.w = r6.z * 0.250000;
/*119*/	r6.xyw = (r7.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*120*/	r6.xyw = (r0.wwww * r6.xyxw + r2.wwww).xyw;
/*121*/	r0.xyz = (-r0.xyzx * r3.xyzx + r6.xywx).xyz;
/*122*/	r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*123*/	r0.w = max(r4.w, 0.000000);
/*124*/	r3.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*125*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*126*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*127*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*128*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*129*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*131*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*132*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*133*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*134*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*135*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*136*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*137*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*138*/	r1.w = inversesqrt(r1.w);
/*139*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*140*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*141*/	r1.w = inversesqrt(r1.w);
/*142*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*143*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*144*/	r1.w = inversesqrt(r1.w);
/*145*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*146*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*147*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*148*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*149*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*150*/	r1.w = inversesqrt(r1.w);
/*151*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*152*/	r3.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*153*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*154*/	r2.w = inversesqrt(r1.w);
/*155*/	r4.yzw = (r2.wwww * r3.xxyz).yzw;
/*156*/	r2.w = -r4.x + 1.000000;
/*157*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*158*/	r5.y = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*159*/	r5.y = r5.y + r5.y;
/*160*/	r5.yzw = (r2.xxyz * -r5.yyyy + r4.yyzw).yzw;
/*161*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*162*/	r6.w = r2.w * 1.539380;
/*163*/	r6.w = cos((r6.w));
/*164*/	r6.w = inversesqrt(r6.w);
/*165*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*166*/	r7.x = saturate(r0.w * 60.000000);
/*167*/	r7.x = -r0.w + r7.x;
/*168*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*169*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*170*/	r8.x = inversesqrt(r8.x);
/*171*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*172*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*173*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*174*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*175*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*176*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*177*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*178*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*179*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*180*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*181*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*182*/	r6.y = -r0.w + 1.000000;
/*183*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*184*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*185*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*186*/	  r6.y = dot(vec3(r5.yzwy), vec3(r4.yzwy));
/*187*/	  r6.y = max(r6.y, 0.000000);
/*188*/	  r6.y = log2(r6.y);
/*189*/	  r6.y = r6.y * 10.000000;
/*190*/	  r6.y = exp2(r6.y);
/*191*/	  r6.y = r6.w * r6.y;
/*192*/	  r6.y = r6.y * r7.x + r0.w;
/*193*/	  r8.x = r2.w * 8.000000;
/*194*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*195*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*196*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*197*/	}
/*198*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*199*/	r2.y = max(r2.x, 0.000000);
/*200*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*201*/	if(floatBitsToUint(r2.x) != 0u) {
/*202*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*203*/	  r2.x = max(r2.x, -1.000000);
/*204*/	  r2.x = min(r2.x, 1.000000);
/*205*/	  r2.z = -abs(r2.x) + 1.000000;
/*206*/	  r2.z = sqrt(r2.z);
/*207*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*208*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*209*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*210*/	  r5.z = r2.z * r5.y;
/*211*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*212*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*213*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*214*/	  r2.x = r5.y * r2.z + r2.x;
/*215*/	  r2.z = r4.x * r4.x;
/*216*/	    r4.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*217*/	  r2.z = r2.z * r4.x + r6.x;
/*218*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*219*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*220*/	  r4.x = -r2.z * r2.z + 1.000000;
/*221*/	  r4.x = max(r4.x, 0.001000);
/*222*/	  r4.x = log2(r4.x);
/*223*/	  r5.x = r4.x * 4.950617;
/*224*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*225*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*226*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*227*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*228*/	  r2.z = floatBitsToInt(r2.z);
/*229*/	  r5.x = r4.x * r4.x + -r5.x;
/*230*/	  r5.x = sqrt(r5.x);
/*231*/	  r4.x = -r4.x + r5.x;
/*232*/	  r4.x = max(r4.x, 0.000000);
/*233*/	  r4.x = sqrt(r4.x);
/*234*/	  r2.z = r2.z * r4.x;
/*235*/	  r2.z = r2.z * 1.414214;
/*236*/	  r2.z = 0.008727 / r2.z;
/*237*/	  r2.z = max(r2.z, 0.000100);
/*238*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*239*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*240*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*241*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*242*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*243*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*244*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*245*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*246*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*247*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*248*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*249*/	  r2.x = floatBitsToInt(r2.x);
/*250*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*251*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*252*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*253*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*254*/	  r2.x = r2.x * r5.x + 1.000000;
/*255*/	  r2.x = r2.x * 0.500000;
/*256*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*257*/	  r2.z = r2.z * r5.y + 1.000000;
/*258*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*259*/	  r2.z = min(r2.y, 1.000000);
/*260*/	  r2.w = r2.w * 1.570796;
/*261*/	  r2.w = sin(r2.w);
/*262*/	  r2.z = r2.z + -1.000000;
/*263*/	  r2.z = r2.w * r2.z + 1.000000;
/*264*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r4.yzwy));
/*265*/	  r2.w = max(r2.w, 0.000000);
/*266*/	  r2.w = log2(r2.w);
/*267*/	  r2.w = r2.w * 10.000000;
/*268*/	  r2.w = exp2(r2.w);
/*269*/	  r2.w = r6.w * r2.w;
/*270*/	  r2.w = r2.w * r7.x + r0.w;
/*271*/	  r2.x = r2.z * abs(r2.x);
/*272*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*273*/	} else {
/*274*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*275*/	}
/*276*/	r4.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*277*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*278*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*279*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*280*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*281*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*282*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*283*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*284*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*285*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*286*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*287*/	r2.w = 1.000000;
/*288*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*289*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*290*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*291*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*292*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*293*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*294*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*295*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*296*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*297*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*298*/	if(r0.w != 0) discard;
/*299*/	r0.w = sqrt(r1.w);
/*300*/	r1.x = saturate(cb3.data[0].w)/**/;
/*301*/	r1.x = -r1.x + 1.000000;
/*302*/	r1.x = r1.x * 8.000000 + -4.000000;
/*303*/	r1.y = saturate(cb3.data[1].x)/**/;
/*304*/	r1.y = -r1.y + 1.000000;
/*305*/	r1.y = r1.y * 1000.000000;
/*306*/	r0.w = r0.w / r1.y;
/*307*/	r0.w = r0.w + r1.x;
/*308*/	r0.w = r0.w * 1.442695;
/*309*/	r0.w = exp2(r0.w);
/*310*/	r0.w = cb3.data[1].y / r0.w;
/*311*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*312*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*313*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*314*/	r1.x = r1.x + -cb3.data[1].z;
/*315*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*316*/	r1.x = saturate(r1.y * r1.x);
/*317*/	r1.y = r1.x * -2.000000 + 3.000000;
/*318*/	r1.x = r1.x * r1.x;
/*319*/	r1.x = r1.x * r1.y;
/*320*/	r1.y = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*321*/	r1.y = sqrt(r1.y);
/*322*/	r1.z = max(cb3.data[2].z, 0.001000);
/*323*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*324*/	r1.y = r1.z * r1.y;
/*325*/	r1.y = min(r1.y, 1.000000);
/*326*/	r1.z = r1.y * -2.000000 + 3.000000;
/*327*/	r1.y = r1.y * r1.y;
/*328*/	r1.y = r1.y * r1.z;
/*329*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*330*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*331*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*332*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*333*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*334*/	r3.w = max(r3.y, 0.000000);
/*335*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*336*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*337*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*338*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*339*/	r0.w = saturate(r0.w * r1.y);
/*340*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*341*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*342*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*343*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*344*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*345*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*346*/	color0.w = 1.000000;
/*347*/	return;
}
