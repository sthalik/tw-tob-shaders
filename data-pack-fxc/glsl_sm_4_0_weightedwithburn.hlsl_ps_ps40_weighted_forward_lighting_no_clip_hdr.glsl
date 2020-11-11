//
//
// Shader Model 4
// Fragment Shader
//
// id: 2663 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb2;

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
/*6*/	r4.xyz = (r4.xyzx + -cb2.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb2.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb2.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb2.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb2.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb2.data[2].xyzx).xyz;
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
/*26*/	r0.w = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*29*/	r4.x = r2.z;
/*30*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*31*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*32*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*33*/	r1.w = saturate(r4.x * 5.000000);
/*34*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*35*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*36*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*37*/	r2.z = log2(r5.z);
/*38*/	r2.z = r2.z * 1.800000;
/*39*/	r2.z = exp2(r2.z);
/*40*/	r2.z = r2.z * 10.000000;
/*41*/	r2.z = min(r2.z, 1.000000);
/*42*/	r1.w = r1.w + r2.z;
/*43*/	r1.w = r1.w * 0.500000;
/*44*/	r2.z = -r5.w + 1.000000;
/*45*/	r2.z = log2(r2.z);
/*46*/	r2.z = r2.z * vsOut_T7.z;
/*47*/	r2.z = exp2(r2.z);
/*48*/	r2.z = min(r2.z, 1.000000);
/*49*/	r2.z = r2.z * vsOut_T7.z;
/*50*/	r2.w = r5.z * 0.250000;
/*51*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*52*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*53*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*54*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*55*/	r1.w = vsOut_T7.z + -0.025000;
/*56*/	r1.w = max(r1.w, 0.000000);
/*57*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*58*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*59*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*61*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*62*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*64*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*65*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*66*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*67*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*68*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*69*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*70*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*71*/	r2.z = inversesqrt(r2.z);
/*72*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*73*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*74*/	r2.z = inversesqrt(r2.z);
/*75*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*76*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*77*/	r2.z = inversesqrt(r2.z);
/*78*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*79*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*80*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*81*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*85*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*86*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*87*/	r0.w = inversesqrt(r0.w);
/*88*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*89*/	r0.w = -r3.x + 1.000000;
/*90*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r4.x = dot(vec3(r3.yzwy), vec3(r2.xyzx));
/*92*/	r4.x = r4.x + r4.x;
/*93*/	r4.xyz = (r2.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*94*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*95*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*96*/	r4.w = cos((r6.x));
/*97*/	r4.w = inversesqrt(r4.w);
/*98*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*99*/	r5.w = saturate(r1.w * 60.000000);
/*100*/	r5.w = -r1.w + r5.w;
/*101*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*102*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*103*/	r7.x = inversesqrt(r7.x);
/*104*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*105*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*106*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*107*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*108*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*109*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*110*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*111*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*112*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*113*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*114*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*115*/	r5.y = -r1.w + 1.000000;
/*116*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*117*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*118*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*119*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*120*/	  r5.y = max(r5.y, 0.000000);
/*121*/	  r5.y = log2(r5.y);
/*122*/	  r5.y = r5.y * 10.000000;
/*123*/	  r5.y = exp2(r5.y);
/*124*/	  r5.y = r4.w * r5.y;
/*125*/	  r5.y = r5.y * r5.w + r1.w;
/*126*/	  r7.x = r0.w * 8.000000;
/*127*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*128*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*129*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*130*/	}
/*131*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*132*/	r7.x = max(r5.y, 0.000000);
/*133*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*134*/	if(floatBitsToUint(r5.y) != 0u) {
/*135*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*136*/	  r4.x = max(r4.x, -1.000000);
/*137*/	  r4.x = min(r4.x, 1.000000);
/*138*/	  r4.y = -abs(r4.x) + 1.000000;
/*139*/	  r4.y = sqrt(r4.y);
/*140*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*141*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*142*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*143*/	  r5.y = r4.y * r4.z;
/*144*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*145*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*146*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*147*/	  r4.x = r4.z * r4.y + r4.x;
/*148*/	  r3.x = r3.x * r3.x;
/*149*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*150*/	  r2.w = r3.x * r2.w + r5.x;
/*151*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*152*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*153*/	  r3.x = -r2.w * r2.w + 1.000000;
/*154*/	  r3.x = max(r3.x, 0.001000);
/*155*/	  r3.x = log2(r3.x);
/*156*/	  r4.y = r3.x * 4.950617;
/*157*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*158*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*159*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*160*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*161*/	  r2.w = floatBitsToInt(r2.w);
/*162*/	  r4.y = r3.x * r3.x + -r4.y;
/*163*/	  r4.y = sqrt(r4.y);
/*164*/	  r3.x = -r3.x + r4.y;
/*165*/	  r3.x = max(r3.x, 0.000000);
/*166*/	  r3.x = sqrt(r3.x);
/*167*/	  r2.w = r2.w * r3.x;
/*168*/	  r2.w = r2.w * 1.414214;
/*169*/	  r2.w = 0.008727 / r2.w;
/*170*/	  r2.w = max(r2.w, 0.000100);
/*171*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*172*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*173*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*174*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*175*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*176*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*177*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*178*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*179*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*180*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*181*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*182*/	  r2.w = floatBitsToInt(r2.w);
/*183*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*184*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*185*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*186*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*187*/	  r2.w = r2.w * r4.x + 1.000000;
/*188*/	  r2.w = r2.w * 0.500000;
/*189*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*190*/	  r3.x = r3.x * r4.y + 1.000000;
/*191*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*192*/	  r3.x = min(r7.x, 1.000000);
/*193*/	  r0.w = r0.w * 1.570796;
/*194*/	  r0.w = sin(r0.w);
/*195*/	  r3.x = r3.x + -1.000000;
/*196*/	  r0.w = r0.w * r3.x + 1.000000;
/*197*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*198*/	  r3.x = max(r3.x, 0.000000);
/*199*/	  r3.x = log2(r3.x);
/*200*/	  r3.x = r3.x * 10.000000;
/*201*/	  r3.x = exp2(r3.x);
/*202*/	  r3.x = r4.w * r3.x;
/*203*/	  r3.x = r3.x * r5.w + r1.w;
/*204*/	  r0.w = r0.w * abs(r2.w);
/*205*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*206*/	} else {
/*207*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*208*/	}
/*209*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*210*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*211*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*212*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*213*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*214*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*215*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*216*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*217*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*218*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*219*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*220*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*221*/	r0.w = inversesqrt(r0.w);
/*222*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*223*/	r0.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*224*/	r0.w = r0.w + r0.w;
/*225*/	r2.xyz = (r2.xyzx * -r0.wwww + -r3.xyzx).xyz;
/*226*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*227*/	r0.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*228*/	r0.w = max(r0.w, 0.000000);
/*229*/	r0.w = log2(r0.w);
/*230*/	r0.w = r0.w * 10.000000;
/*231*/	r0.w = exp2(r0.w);
/*232*/	r0.w = r4.w * r0.w;
/*233*/	r0.w = r0.w * r5.w + r1.w;
/*234*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*235*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*236*/	color0.w = 2.000000;
/*237*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*238*/	r0.w = 1.000000;
/*239*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*240*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*241*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*242*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*243*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*244*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*245*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*246*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*247*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*248*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*249*/	if(r0.x != 0) discard;
/*250*/	color1.x = 1.000000;
/*251*/	return;
}
