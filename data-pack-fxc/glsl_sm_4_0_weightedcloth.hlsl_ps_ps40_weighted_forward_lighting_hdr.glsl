//
//
// Shader Model 4
// Fragment Shader
//
// id: 3798 - fxc/glsl_SM_4_0_WeightedCloth.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;
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
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
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
/*9*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r1.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r1.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r2.x = inversesqrt(r2.x);
/*41*/	r2.yzw = (r1.wwww * r1.xxyz).yzw;
/*42*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*43*/	r5.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*44*/	r2.yzw = sin(vec3(r5.xxyz));
/*45*/	r1.w = r2.z * r2.y;
/*46*/	r1.w = r2.w * r1.w;
/*47*/	r1.w = r1.w * 0.500000 + 1.000000;
/*48*/	r1.w = r1.w * 0.800000 + r5.w;
/*49*/	r2.yzw = (cb0.data[26].xxxx * vec4(0.000000, 2.500000, 0.300000, 0.870000)).yzw;
/*50*/	r2.yzw = sin(vec3(r2.yyzw));
/*51*/	r2.y = r2.z * r2.y;
/*52*/	r2.y = r2.w * r2.y;
/*53*/	r2.y = r2.y * 0.500000 + 1.000000;
/*54*/	r2.z = r2.y * 0.400000;
/*55*/	r2.y = r2.y * 0.500000 + r5.y;
/*56*/	r4.zw = (r1.wwww * vec4(0.000000, 0.000000, 0.200000, 0.200000) + vsOut_T1.xxxy).zw;
/*57*/	r5.xyzw = (texture(normal0_sampler, r4.zwzz.st)).xyzw;
/*58*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*59*/	r5.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*61*/	r1.w = -r1.w + 1.000000;
/*62*/	r1.w = max(r1.w, 0.000000);
/*63*/	r5.z = sqrt(r1.w);
/*64*/	r2.yw = (r2.yyyy * vec4(0.000000, 0.500000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*65*/	r6.xyzw = (texture(normal1_sampler, r2.ywyy.st)).xyzw;
/*66*/	r2.yw = (r6.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*67*/	r2.yw = (r2.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*68*/	r1.w = dot(vec2(r2.ywyy), vec2(r2.ywyy));
/*69*/	r1.w = -r1.w + 1.000000;
/*70*/	r1.w = max(r1.w, 0.000000);
/*71*/	r6.z = sqrt(r1.w);
/*72*/	r6.xy = (r2.zzzz * r2.ywyy).xy;
/*73*/	r2.yzw = (r5.xxyz + r6.xxyz).yzw;
/*74*/	r1.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r2.yzw = (r1.wwww * r2.yyzw).yzw;
/*77*/	r2.xyz = (r3.xyzx * r2.xxxx + r2.yzwy).xyz;
/*78*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*81*/	r3.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*82*/	r3.xyz = (r3.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*83*/	r3.xyz = (vsOut_T9.xxxx * r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*84*/	r5.xyz = (r0.xyzx * r3.xyzx).xyz;
/*85*/	r1.w = r3.w + -vsOut_T9.x;
/*86*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*87*/	if(r1.w != 0) discard;
/*88*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*89*/	r0.w = r0.w + -r1.w;
/*90*/	r2.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*91*/	if(r2.w != 0) discard;
/*92*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*93*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*94*/	r0.w = saturate(r0.w * r1.w);
/*95*/	r1.w = r0.w * -2.000000 + 3.000000;
/*96*/	r0.w = r0.w * r0.w;
/*97*/	r4.zw = (-r1.wwww * r0.wwww + vec4(0.000000, 0.000000, 1.000000, 0.975000)).zw;
/*98*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*99*/	r7.x = 0;
/*100*/	r7.y = cb0.data[26].x * 0.050000;
/*101*/	r6.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r7.xxxy).zw;
/*102*/	r7.xyzw = (texture(s_fire_map, r6.zwzz.st)).xyzw;
/*103*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*104*/	r0.w = saturate(r7.x * 5.000000);
/*105*/	r7.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*106*/	r0.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*107*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*108*/	r1.w = log2(r6.z);
/*109*/	r1.w = r1.w * 1.800000;
/*110*/	r1.w = exp2(r1.w);
/*111*/	r1.w = r1.w * 10.000000;
/*112*/	r1.w = min(r1.w, 1.000000);
/*113*/	r0.w = r0.w + r1.w;
/*114*/	r0.w = r0.w * 0.500000;
/*115*/	r1.w = -r6.w + 1.000000;
/*116*/	r1.w = log2(r1.w);
/*117*/	r1.w = r1.w * r4.z;
/*118*/	r1.w = exp2(r1.w);
/*119*/	r1.w = min(r1.w, 1.000000);
/*120*/	r1.w = r4.z * r1.w;
/*121*/	r2.w = r6.z * 0.250000;
/*122*/	r6.xyw = (r7.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*123*/	r6.xyw = (r0.wwww * r6.xyxw + r2.wwww).xyw;
/*124*/	r0.xyz = (-r0.xyzx * r3.xyzx + r6.xywx).xyz;
/*125*/	r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*126*/	r0.w = max(r4.w, 0.000000);
/*127*/	r3.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*128*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*129*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*131*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*132*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*133*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*134*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*135*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*136*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*137*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*138*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*139*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*140*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*141*/	r1.w = inversesqrt(r1.w);
/*142*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*143*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*144*/	r1.w = inversesqrt(r1.w);
/*145*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*146*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*147*/	r1.w = inversesqrt(r1.w);
/*148*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*149*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*150*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*151*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*152*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*153*/	r1.w = inversesqrt(r1.w);
/*154*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*155*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*156*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*157*/	r1.w = inversesqrt(r1.w);
/*158*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*159*/	r1.w = -r4.x + 1.000000;
/*160*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*161*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*162*/	r3.w = r3.w + r3.w;
/*163*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*164*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*165*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*166*/	r3.w = cos((r6.x));
/*167*/	r3.w = inversesqrt(r3.w);
/*168*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*169*/	r5.w = saturate(r0.w * 60.000000);
/*170*/	r5.w = -r0.w + r5.w;
/*171*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*172*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*173*/	r7.x = inversesqrt(r7.x);
/*174*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*175*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*176*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*177*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*178*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*179*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*180*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*181*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*182*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*183*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*184*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*185*/	r5.y = -r0.w + 1.000000;
/*186*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*187*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*188*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*189*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*190*/	  r5.y = max(r5.y, 0.000000);
/*191*/	  r5.y = log2(r5.y);
/*192*/	  r5.y = r5.y * 10.000000;
/*193*/	  r5.y = exp2(r5.y);
/*194*/	  r5.y = r3.w * r5.y;
/*195*/	  r5.y = r5.y * r5.w + r0.w;
/*196*/	  r7.x = r1.w * 8.000000;
/*197*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*198*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*199*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*200*/	}
/*201*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*202*/	r7.x = max(r5.y, 0.000000);
/*203*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*204*/	if(floatBitsToUint(r5.y) != 0u) {
/*205*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*206*/	  r4.y = max(r4.y, -1.000000);
/*207*/	  r4.y = min(r4.y, 1.000000);
/*208*/	  r4.z = -abs(r4.y) + 1.000000;
/*209*/	  r4.z = sqrt(r4.z);
/*210*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*211*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*212*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*213*/	  r5.y = r4.z * r4.w;
/*214*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*215*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*216*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*217*/	  r4.y = r4.w * r4.z + r4.y;
/*218*/	  r4.x = r4.x * r4.x;
/*219*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*220*/	  r2.w = r4.x * r2.w + r5.x;
/*221*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*222*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*223*/	  r4.x = -r2.w * r2.w + 1.000000;
/*224*/	  r4.x = max(r4.x, 0.001000);
/*225*/	  r4.x = log2(r4.x);
/*226*/	  r4.z = r4.x * 4.950617;
/*227*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*228*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*229*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*230*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*231*/	  r2.w = floatBitsToInt(r2.w);
/*232*/	  r4.z = r4.x * r4.x + -r4.z;
/*233*/	  r4.z = sqrt(r4.z);
/*234*/	  r4.x = -r4.x + r4.z;
/*235*/	  r4.x = max(r4.x, 0.000000);
/*236*/	  r4.x = sqrt(r4.x);
/*237*/	  r2.w = r2.w * r4.x;
/*238*/	  r2.w = r2.w * 1.414214;
/*239*/	  r2.w = 0.008727 / r2.w;
/*240*/	  r2.w = max(r2.w, 0.000100);
/*241*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*242*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*243*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*244*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*245*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*246*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*247*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*248*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*249*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*250*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*251*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*252*/	  r2.w = floatBitsToInt(r2.w);
/*253*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*254*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*255*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*256*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*257*/	  r2.w = r2.w * r4.x + 1.000000;
/*258*/	  r2.w = r2.w * 0.500000;
/*259*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*260*/	  r4.x = r4.x * r4.y + 1.000000;
/*261*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*262*/	  r4.x = min(r7.x, 1.000000);
/*263*/	  r1.w = r1.w * 1.570796;
/*264*/	  r1.w = sin(r1.w);
/*265*/	  r4.x = r4.x + -1.000000;
/*266*/	  r1.w = r1.w * r4.x + 1.000000;
/*267*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*268*/	  r3.x = max(r3.x, 0.000000);
/*269*/	  r3.x = log2(r3.x);
/*270*/	  r3.x = r3.x * 10.000000;
/*271*/	  r3.x = exp2(r3.x);
/*272*/	  r3.x = r3.w * r3.x;
/*273*/	  r3.x = r3.x * r5.w + r0.w;
/*274*/	  r1.w = r1.w * abs(r2.w);
/*275*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*276*/	} else {
/*277*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*278*/	}
/*279*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*280*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*281*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*282*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*283*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*284*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*285*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*286*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*287*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*288*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*289*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*290*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*291*/	r1.w = inversesqrt(r1.w);
/*292*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*293*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*294*/	r1.w = r1.w + r1.w;
/*295*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*296*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*297*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*298*/	r1.w = max(r1.w, 0.000000);
/*299*/	r1.w = log2(r1.w);
/*300*/	r1.w = r1.w * 10.000000;
/*301*/	r1.w = exp2(r1.w);
/*302*/	r1.w = r3.w * r1.w;
/*303*/	r0.w = r1.w * r5.w + r0.w;
/*304*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*305*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*306*/	color0.w = 2.000000;
/*307*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*308*/	r0.w = 1.000000;
/*309*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*310*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*311*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*312*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*313*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*314*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*315*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*316*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*317*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*318*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*319*/	if(r0.x != 0) discard;
/*320*/	color1.x = 1.000000;
/*321*/	return;
}
