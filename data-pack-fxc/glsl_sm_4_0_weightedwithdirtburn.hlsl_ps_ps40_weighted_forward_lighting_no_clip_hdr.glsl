//
//
// Shader Model 4
// Fragment Shader
//
// id: 2802 - fxc/glsl_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;

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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
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
/*26*/	r3.z = sqrt(r0.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*31*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*32*/	r0.w = r5.w * r6.w;
/*33*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*35*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*36*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	r1.w = inversesqrt(r1.w);
/*38*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*39*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*40*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*41*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*42*/	r5.x = r3.x;
/*43*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*44*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*45*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*46*/	r0.w = saturate(r5.x * 5.000000);
/*47*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*48*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*50*/	r1.w = log2(r3.z);
/*51*/	r1.w = r1.w * 1.800000;
/*52*/	r1.w = exp2(r1.w);
/*53*/	r1.w = r1.w * 10.000000;
/*54*/	r1.w = min(r1.w, 1.000000);
/*55*/	r0.w = r0.w + r1.w;
/*56*/	r0.w = r0.w * 0.500000;
/*57*/	r1.w = -r3.w + 1.000000;
/*58*/	r1.w = log2(r1.w);
/*59*/	r1.w = r1.w * vsOut_T7.z;
/*60*/	r1.w = exp2(r1.w);
/*61*/	r1.w = min(r1.w, 1.000000);
/*62*/	r1.w = r1.w * vsOut_T7.z;
/*63*/	r2.w = r3.z * 0.250000;
/*64*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*65*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*66*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*67*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*68*/	r0.w = vsOut_T7.z + -0.025000;
/*69*/	r0.w = max(r0.w, 0.000000);
/*70*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*71*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*72*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*74*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*75*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*77*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*78*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*79*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*80*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*81*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*82*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*83*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*89*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*92*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*93*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*94*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*95*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*96*/	r1.w = inversesqrt(r1.w);
/*97*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*98*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*99*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*100*/	r1.w = inversesqrt(r1.w);
/*101*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*102*/	r1.w = -r4.x + 1.000000;
/*103*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*104*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*105*/	r3.w = r3.w + r3.w;
/*106*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*107*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*108*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*109*/	r3.w = cos((r6.x));
/*110*/	r3.w = inversesqrt(r3.w);
/*111*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*112*/	r5.w = saturate(r0.w * 60.000000);
/*113*/	r5.w = -r0.w + r5.w;
/*114*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*115*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*116*/	r7.x = inversesqrt(r7.x);
/*117*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*118*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*119*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*120*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*121*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*122*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*123*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*124*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*125*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*126*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*127*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*128*/	r5.y = -r0.w + 1.000000;
/*129*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*130*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*131*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*132*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*133*/	  r5.y = max(r5.y, 0.000000);
/*134*/	  r5.y = log2(r5.y);
/*135*/	  r5.y = r5.y * 10.000000;
/*136*/	  r5.y = exp2(r5.y);
/*137*/	  r5.y = r3.w * r5.y;
/*138*/	  r5.y = r5.y * r5.w + r0.w;
/*139*/	  r7.x = r1.w * 8.000000;
/*140*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*141*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*142*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*143*/	}
/*144*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*145*/	r7.x = max(r5.y, 0.000000);
/*146*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*147*/	if(floatBitsToUint(r5.y) != 0u) {
/*148*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*149*/	  r4.y = max(r4.y, -1.000000);
/*150*/	  r4.y = min(r4.y, 1.000000);
/*151*/	  r4.z = -abs(r4.y) + 1.000000;
/*152*/	  r4.z = sqrt(r4.z);
/*153*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*154*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*155*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*156*/	  r5.y = r4.z * r4.w;
/*157*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*158*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*159*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*160*/	  r4.y = r4.w * r4.z + r4.y;
/*161*/	  r4.x = r4.x * r4.x;
/*162*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*163*/	  r2.w = r4.x * r2.w + r5.x;
/*164*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*165*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*166*/	  r4.x = -r2.w * r2.w + 1.000000;
/*167*/	  r4.x = max(r4.x, 0.001000);
/*168*/	  r4.x = log2(r4.x);
/*169*/	  r4.z = r4.x * 4.950617;
/*170*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*171*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*172*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*173*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*174*/	  r2.w = floatBitsToInt(r2.w);
/*175*/	  r4.z = r4.x * r4.x + -r4.z;
/*176*/	  r4.z = sqrt(r4.z);
/*177*/	  r4.x = -r4.x + r4.z;
/*178*/	  r4.x = max(r4.x, 0.000000);
/*179*/	  r4.x = sqrt(r4.x);
/*180*/	  r2.w = r2.w * r4.x;
/*181*/	  r2.w = r2.w * 1.414214;
/*182*/	  r2.w = 0.008727 / r2.w;
/*183*/	  r2.w = max(r2.w, 0.000100);
/*184*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*185*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*186*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*187*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*188*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*189*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*190*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*191*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*192*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*193*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*194*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*195*/	  r2.w = floatBitsToInt(r2.w);
/*196*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*197*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*198*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*199*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*200*/	  r2.w = r2.w * r4.x + 1.000000;
/*201*/	  r2.w = r2.w * 0.500000;
/*202*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*203*/	  r4.x = r4.x * r4.y + 1.000000;
/*204*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*205*/	  r4.x = min(r7.x, 1.000000);
/*206*/	  r1.w = r1.w * 1.570796;
/*207*/	  r1.w = sin(r1.w);
/*208*/	  r4.x = r4.x + -1.000000;
/*209*/	  r1.w = r1.w * r4.x + 1.000000;
/*210*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*211*/	  r3.x = max(r3.x, 0.000000);
/*212*/	  r3.x = log2(r3.x);
/*213*/	  r3.x = r3.x * 10.000000;
/*214*/	  r3.x = exp2(r3.x);
/*215*/	  r3.x = r3.w * r3.x;
/*216*/	  r3.x = r3.x * r5.w + r0.w;
/*217*/	  r1.w = r1.w * abs(r2.w);
/*218*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*219*/	} else {
/*220*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*221*/	}
/*222*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*223*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*224*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*225*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*226*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*227*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*228*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*229*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*230*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*231*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*232*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*233*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*234*/	r1.w = inversesqrt(r1.w);
/*235*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*236*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*237*/	r1.w = r1.w + r1.w;
/*238*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*239*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*240*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*241*/	r1.w = max(r1.w, 0.000000);
/*242*/	r1.w = log2(r1.w);
/*243*/	r1.w = r1.w * 10.000000;
/*244*/	r1.w = exp2(r1.w);
/*245*/	r1.w = r3.w * r1.w;
/*246*/	r0.w = r1.w * r5.w + r0.w;
/*247*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*248*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*249*/	color0.w = 2.000000;
/*250*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*251*/	r0.w = 1.000000;
/*252*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*253*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*254*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*255*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*256*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*257*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*258*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*259*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*260*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*261*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*262*/	if(r0.x != 0) discard;
/*263*/	color1.x = 1.000000;
/*264*/	return;
}
