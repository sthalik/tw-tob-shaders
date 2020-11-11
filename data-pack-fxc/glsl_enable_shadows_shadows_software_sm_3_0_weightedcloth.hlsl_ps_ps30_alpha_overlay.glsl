//
//
// Shader Model 4
// Fragment Shader
//
// id: 7822 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_WeightedCloth.hlsl_PS_ps30_alpha_overlay.glsl
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

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r4.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r4.xyzx + -r4.xyzx).xyz;
/*20*/	r2.xyw = (r2.yyyy * r3.xyxz + r4.xyxz).xyw;
/*21*/	r3.xyz = (r5.xyzx * r2.xywx + -r2.xywx).xyz;
/*22*/	r2.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*23*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r4.z = sqrt(r1.w);
/*30*/	r5.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r6.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r7.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*34*/	r3.zw = (r7.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r1.w = r6.w * r7.w;
/*36*/	r6.xyz = (-r2.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r2.xyz = (r1.wwww * r6.xyzx + r2.xyzx).xyz;
/*38*/	r4.xy = (r3.zwzz * r6.wwww + r3.xyxx).xy;
/*39*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*40*/	r2.w = inversesqrt(r2.w);
/*41*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*42*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*43*/	r3.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*44*/	r6.xyz = sin(vec3(r3.xyzx));
/*45*/	r1.w = r6.y * r6.x;
/*46*/	r1.w = r6.z * r1.w;
/*47*/	r1.w = r1.w * 0.500000 + 1.000000;
/*48*/	r1.w = r1.w * 0.800000 + r3.w;
/*49*/	r3.xzw = (cb0.data[26].xxxx * vec4(2.500000, 0.000000, 0.300000, 0.870000)).xzw;
/*50*/	r3.xzw = sin(vec3(r3.xxzw));
/*51*/	r3.x = r3.z * r3.x;
/*52*/	r3.x = r3.w * r3.x;
/*53*/	r3.x = r3.x * 0.500000 + 1.000000;
/*54*/	r3.z = r3.x * 0.400000;
/*55*/	r3.x = r3.x * 0.500000 + r3.y;
/*56*/	r3.yw = (r1.wwww * vec4(0.000000, 0.200000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*57*/	r6.xyzw = (texture(normal0_sampler, r3.ywyy.st)).xyzw;
/*58*/	r3.yw = (r6.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*59*/	r6.xy = (r3.ywyy * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	r1.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*61*/	r1.w = -r1.w + 1.000000;
/*62*/	r1.w = max(r1.w, 0.000000);
/*63*/	r6.z = sqrt(r1.w);
/*64*/	r3.xy = (r3.xxxx * vec4(0.500000, 0.200000, 0.000000, 0.000000) + vsOut_T1.xyxx).xy;
/*65*/	r7.xyzw = (texture(normal1_sampler, r3.xyxx.st)).xyzw;
/*66*/	r3.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*67*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*68*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*69*/	r1.w = -r1.w + 1.000000;
/*70*/	r1.w = max(r1.w, 0.000000);
/*71*/	r7.z = sqrt(r1.w);
/*72*/	r7.xy = (r3.zzzz * r3.xyxx).xy;
/*73*/	r3.xyz = (r6.xyzx + r7.xyzx).xyz;
/*74*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*77*/	r3.xyz = (r4.xyzx * r2.wwww + r3.xyzx).xyz;
/*78*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*81*/	r4.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*82*/	r4.xyz = (r4.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*83*/	r4.xyz = (vsOut_T9.xxxx * r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*84*/	r0.xyz = (r2.xyzx * r4.xyzx).xyz;
/*85*/	r1.w = r4.w + -vsOut_T9.x;
/*86*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*87*/	if(r1.w != 0) discard;
/*88*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*89*/	r2.x = r0.w + -r1.w;
/*90*/	r2.y = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*91*/	if(r2.y != 0) discard;
/*92*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*93*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*94*/	r1.w = saturate(r1.w * r2.x);
/*95*/	r2.x = r1.w * -2.000000 + 3.000000;
/*96*/	r1.w = r1.w * r1.w;
/*97*/	r2.xy = (-r2.xxxx * r1.wwww + vec4(1.000000, 0.975000, 0.000000, 0.000000)).xy;
/*98*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*99*/	r4.x = 0;
/*100*/	r4.y = cb0.data[26].x * 0.050000;
/*101*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r4.xyxx).xy;
/*102*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*103*/	r6.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*104*/	r1.w = saturate(r4.x * 5.000000);
/*105*/	r4.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*106*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*107*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*108*/	r2.z = log2(r6.z);
/*109*/	r2.z = r2.z * 1.800000;
/*110*/	r2.z = exp2(r2.z);
/*111*/	r2.z = r2.z * 10.000000;
/*112*/	r2.z = min(r2.z, 1.000000);
/*113*/	r1.w = r1.w + r2.z;
/*114*/	r1.w = r1.w * 0.500000;
/*115*/	r2.z = -r6.w + 1.000000;
/*116*/	r2.z = log2(r2.z);
/*117*/	r2.z = r2.z * r2.x;
/*118*/	r2.z = exp2(r2.z);
/*119*/	r2.z = min(r2.z, 1.000000);
/*120*/	r2.x = r2.x * r2.z;
/*121*/	r6.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*122*/	r6.w = 1.000000;
/*123*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r6.zzzw;
/*124*/	r4.xyzw = r1.wwww * r4.xyzw + r6.zzzw;
/*125*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*126*/	r0.xyzw = r2.xxxx * r4.xyzw + r0.xyzw;
/*127*/	r1.w = max(r2.y, 0.000000);
/*128*/	r2.xyzw = -r0.xyzw + r6.xyzw;
/*129*/	r0.xyzw = r1.wwww * r2.xyzw + r0.xyzw;
/*130*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*131*/	r2.xyz = (-r0.xyzx + r1.wwww).xyz;
/*132*/	r0.xyz = (vsOut_T7.yyyy * r2.xyzx + r0.xyzx).xyz;
/*133*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*134*/	r2.xyz = (-r1.xyzx + r1.wwww).xyz;
/*135*/	r1.xyz = (vsOut_T7.yyyy * r2.xyzx + r1.xyzx).xyz;
/*136*/	r1.w = vsOut_T7.y * -r5.y + r5.y;
/*137*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*138*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*139*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*140*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*141*/	r2.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*142*/	r2.x = inversesqrt(r2.x);
/*143*/	r2.xyz = (r2.xxxx * vsOut_T3.xyzx).xyz;
/*144*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*145*/	r2.w = inversesqrt(r2.w);
/*146*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*147*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*148*/	r2.w = inversesqrt(r2.w);
/*149*/	r5.yzw = (r2.wwww * vsOut_T2.xxyz).yzw;
/*150*/	r4.xyz = (r3.yyyy * r4.xyzx).xyz;
/*151*/	r2.xyz = (r3.xxxx * r2.xyzx + r4.xyzx).xyz;
/*152*/	r2.xyz = (r3.zzzz * r5.yzwy + r2.xyzx).xyz;
/*153*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*154*/	r2.w = inversesqrt(r2.w);
/*155*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*156*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*157*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*158*/	r4.x = inversesqrt(r2.w);
/*159*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*160*/	r4.w = -r5.x + 1.000000;
/*161*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*162*/	r5.z = dot(vec3(r4.xyzx), vec3(r2.xyzx));
/*163*/	r5.z = r5.z + r5.z;
/*164*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.xyzx).xyz;
/*165*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*166*/	r5.z = r4.w * 1.539380;
/*167*/	r5.z = cos((r5.z));
/*168*/	r5.z = inversesqrt(r5.z);
/*169*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*170*/	r5.w = saturate(r1.w * 60.000000);
/*171*/	r5.w = -r1.w + r5.w;
/*172*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*173*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*174*/	r6.w = inversesqrt(r6.w);
/*175*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*176*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*177*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*178*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*179*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*180*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*181*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*182*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*183*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*184*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*185*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*186*/	r6.w = -r1.w + 1.000000;
/*187*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*188*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*189*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*190*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.xyzx));
/*191*/	  r6.w = max(r6.w, 0.000000);
/*192*/	  r6.w = log2(r6.w);
/*193*/	  r6.w = r6.w * 10.000000;
/*194*/	  r6.w = exp2(r6.w);
/*195*/	  r6.w = r5.z * r6.w;
/*196*/	  r6.w = r6.w * r5.w + r1.w;
/*197*/	  r7.y = r4.w * 8.000000;
/*198*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*199*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*200*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*201*/	}
/*202*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*203*/	r2.y = max(r2.x, 0.000000);
/*204*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*205*/	if(floatBitsToUint(r2.x) != 0u) {
/*206*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*207*/	  r2.x = max(r2.x, -1.000000);
/*208*/	  r2.x = min(r2.x, 1.000000);
/*209*/	  r2.z = -abs(r2.x) + 1.000000;
/*210*/	  r2.z = sqrt(r2.z);
/*211*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*212*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*213*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*214*/	  r6.y = r2.z * r6.x;
/*215*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*216*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*217*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*218*/	  r2.x = r6.x * r2.z + r2.x;
/*219*/	  r2.z = r5.x * r5.x;
/*220*/	    r5.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*221*/	  r2.z = r2.z * r5.x + r7.x;
/*222*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*223*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*224*/	  r5.x = -r2.z * r2.z + 1.000000;
/*225*/	  r5.x = max(r5.x, 0.001000);
/*226*/	  r5.x = log2(r5.x);
/*227*/	  r5.y = r5.x * 4.950617;
/*228*/	  r5.x = r5.x * 0.346574 + 4.546885;
/*229*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*230*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*231*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*232*/	  r2.z = floatBitsToInt(r2.z);
/*233*/	  r5.y = r5.x * r5.x + -r5.y;
/*234*/	  r5.y = sqrt(r5.y);
/*235*/	  r5.x = -r5.x + r5.y;
/*236*/	  r5.x = max(r5.x, 0.000000);
/*237*/	  r5.x = sqrt(r5.x);
/*238*/	  r2.z = r2.z * r5.x;
/*239*/	  r2.z = r2.z * 1.414214;
/*240*/	  r2.z = 0.008727 / r2.z;
/*241*/	  r2.z = max(r2.z, 0.000100);
/*242*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*243*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*244*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*245*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*246*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*247*/	  r6.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*248*/	  r6.xy = (r6.xzxx / r6.ywyy).xy;
/*249*/	  r5.xy = (-r5.xyxx * r6.xyxx).xy;
/*250*/	  r6.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xzxx)) * 0xffffffffu)).xy;
/*251*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*252*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.x));
/*253*/	  r2.x = floatBitsToInt(r2.x);
/*254*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*255*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*256*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*257*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*258*/	  r2.x = r2.x * r5.x + 1.000000;
/*259*/	  r2.x = r2.x * 0.500000;
/*260*/	  r2.z = 1 + ~floatBitsToInt(r6.y);
/*261*/	  r2.z = r2.z * r5.y + 1.000000;
/*262*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*263*/	  r2.z = min(r2.y, 1.000000);
/*264*/	  r4.w = r4.w * 1.570796;
/*265*/	  r4.w = sin(r4.w);
/*266*/	  r2.z = r2.z + -1.000000;
/*267*/	  r2.z = r4.w * r2.z + 1.000000;
/*268*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*269*/	  r4.x = max(r4.x, 0.000000);
/*270*/	  r4.x = log2(r4.x);
/*271*/	  r4.x = r4.x * 10.000000;
/*272*/	  r4.x = exp2(r4.x);
/*273*/	  r4.x = r5.z * r4.x;
/*274*/	  r4.x = r4.x * r5.w + r1.w;
/*275*/	  r2.x = r2.z * abs(r2.x);
/*276*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*277*/	} else {
/*278*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*279*/	}
/*280*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*281*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*282*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*283*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*284*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*285*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*286*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*287*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*288*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*289*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*290*/	r1.x = sqrt(r2.w);
/*291*/	r1.y = saturate(cb2.data[0].w)/**/;
/*292*/	r1.y = -r1.y + 1.000000;
/*293*/	r1.y = r1.y * 8.000000 + -4.000000;
/*294*/	r1.z = saturate(cb2.data[1].x)/**/;
/*295*/	r1.z = -r1.z + 1.000000;
/*296*/	r1.z = r1.z * 1000.000000;
/*297*/	r1.x = r1.x / r1.z;
/*298*/	r1.x = r1.x + r1.y;
/*299*/	r1.x = r1.x * 1.442695;
/*300*/	r1.x = exp2(r1.x);
/*301*/	r1.x = cb2.data[1].y / r1.x;
/*302*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*303*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*304*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*305*/	r1.y = r1.y + -cb2.data[1].z;
/*306*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*307*/	r1.y = saturate(r1.z * r1.y);
/*308*/	r1.z = r1.y * -2.000000 + 3.000000;
/*309*/	r1.y = r1.y * r1.y;
/*310*/	r1.y = r1.y * r1.z;
/*311*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*312*/	r1.z = sqrt(r1.z);
/*313*/	r1.w = max(cb2.data[2].z, 0.001000);
/*314*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*315*/	r1.z = r1.w * r1.z;
/*316*/	r1.z = min(r1.z, 1.000000);
/*317*/	r1.w = r1.z * -2.000000 + 3.000000;
/*318*/	r1.z = r1.z * r1.z;
/*319*/	r1.z = r1.z * r1.w;
/*320*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*321*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*322*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*323*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*324*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*325*/	r3.w = max(r3.y, 0.000000);
/*326*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*327*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*328*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*329*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*330*/	r1.x = saturate(r1.x * r1.z);
/*331*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*332*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*333*/	color0.w = r0.w * vsOut_T6.w;
/*334*/	return;
}
