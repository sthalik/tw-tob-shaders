//
//
// Shader Model 4
// Fragment Shader
//
// id: 6226 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithburn.hlsl_PS_ps30_alpha_overlay_no_clip.glsl
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
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r1.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r1.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r4.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r4.xyzx + -r4.xyzx).xyz;
/*17*/	r2.xyw = (r2.yyyy * r3.xyxz + r4.xyxz).xyw;
/*18*/	r3.xyz = (r5.xyzx * r2.xywx + -r2.xywx).xyz;
/*19*/	r0.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r1.w = -r1.w + 1.000000;
/*25*/	r1.w = max(r1.w, 0.000000);
/*26*/	r1.w = sqrt(r1.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*29*/	r4.x = r2.z;
/*30*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*31*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*32*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*33*/	r2.z = saturate(r4.x * 5.000000);
/*34*/	r4.xyzw = r2.zzzz * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*35*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*36*/	r2.z = saturate(-r2.z * 15.000000 + 1.000000);
/*37*/	r2.w = log2(r5.z);
/*38*/	r2.w = r2.w * 1.800000;
/*39*/	r2.w = exp2(r2.w);
/*40*/	r2.w = r2.w * 10.000000;
/*41*/	r2.w = min(r2.w, 1.000000);
/*42*/	r2.z = r2.w + r2.z;
/*43*/	r2.z = r2.z * 0.500000;
/*44*/	r2.w = -r5.w + 1.000000;
/*45*/	r2.w = log2(r2.w);
/*46*/	r2.w = r2.w * vsOut_T7.z;
/*47*/	r2.w = exp2(r2.w);
/*48*/	r2.w = min(r2.w, 1.000000);
/*49*/	r2.w = r2.w * vsOut_T7.z;
/*50*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*51*/	r5.w = 1.000000;
/*52*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*53*/	r4.xyzw = r2.zzzz * r4.xyzw + r5.zzzw;
/*54*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*55*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*56*/	r2.z = vsOut_T7.z + -0.025000;
/*57*/	r2.z = max(r2.z, 0.000000);
/*58*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*59*/	r0.xyzw = r2.zzzz * r4.xyzw + r0.xyzw;
/*60*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*62*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*63*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*65*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*66*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*67*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*68*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*69*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*70*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*71*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*72*/	r2.w = inversesqrt(r2.w);
/*73*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*74*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*77*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*78*/	r2.w = inversesqrt(r2.w);
/*79*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*80*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*81*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*82*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*83*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*86*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*87*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*88*/	r3.y = inversesqrt(r1.w);
/*89*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*90*/	r5.x = -r3.x + 1.000000;
/*91*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*92*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*93*/	r5.z = r5.z + r5.z;
/*94*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*95*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*96*/	r5.z = r5.x * 1.539380;
/*97*/	r5.z = cos((r5.z));
/*98*/	r5.z = inversesqrt(r5.z);
/*99*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*100*/	r5.w = saturate(r2.z * 60.000000);
/*101*/	r5.w = -r2.z + r5.w;
/*102*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*103*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*104*/	r6.w = inversesqrt(r6.w);
/*105*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*106*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*107*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*108*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*109*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*110*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*111*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*112*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*113*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*114*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*115*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*116*/	r6.w = -r2.z + 1.000000;
/*117*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*118*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*119*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*120*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*121*/	  r6.w = max(r6.w, 0.000000);
/*122*/	  r6.w = log2(r6.w);
/*123*/	  r6.w = r6.w * 10.000000;
/*124*/	  r6.w = exp2(r6.w);
/*125*/	  r6.w = r5.z * r6.w;
/*126*/	  r6.w = r6.w * r5.w + r2.z;
/*127*/	  r7.y = r5.x * 8.000000;
/*128*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*129*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*130*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*131*/	}
/*132*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*133*/	r2.y = max(r2.x, 0.000000);
/*134*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*135*/	if(floatBitsToUint(r2.x) != 0u) {
/*136*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*137*/	  r2.x = max(r2.x, -1.000000);
/*138*/	  r2.x = min(r2.x, 1.000000);
/*139*/	  r2.w = -abs(r2.x) + 1.000000;
/*140*/	  r2.w = sqrt(r2.w);
/*141*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*142*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*143*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*144*/	  r6.y = r2.w * r6.x;
/*145*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*146*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*147*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*148*/	  r2.x = r6.x * r2.w + r2.x;
/*149*/	  r2.w = r3.x * r3.x;
/*150*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*151*/	  r2.w = r2.w * r3.x + r7.x;
/*152*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*153*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*154*/	  r3.x = -r2.w * r2.w + 1.000000;
/*155*/	  r3.x = max(r3.x, 0.001000);
/*156*/	  r3.x = log2(r3.x);
/*157*/	  r5.y = r3.x * 4.950617;
/*158*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*159*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*160*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*161*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*162*/	  r2.w = floatBitsToInt(r2.w);
/*163*/	  r5.y = r3.x * r3.x + -r5.y;
/*164*/	  r5.y = sqrt(r5.y);
/*165*/	  r3.x = -r3.x + r5.y;
/*166*/	  r3.x = max(r3.x, 0.000000);
/*167*/	  r3.x = sqrt(r3.x);
/*168*/	  r2.w = r2.w * r3.x;
/*169*/	  r2.w = r2.w * 1.414214;
/*170*/	  r2.w = 0.008727 / r2.w;
/*171*/	  r2.w = max(r2.w, 0.000100);
/*172*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*173*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*174*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*175*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*176*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*177*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*178*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*179*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*180*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*181*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*182*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*183*/	  r2.x = floatBitsToInt(r2.x);
/*184*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*185*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*186*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*187*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*188*/	  r2.x = r2.x * r6.x + 1.000000;
/*189*/	  r2.x = r2.x * 0.500000;
/*190*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*191*/	  r2.w = r2.w * r6.y + 1.000000;
/*192*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*193*/	  r2.w = min(r2.y, 1.000000);
/*194*/	  r3.x = r5.x * 1.570796;
/*195*/	  r3.x = sin(r3.x);
/*196*/	  r2.w = r2.w + -1.000000;
/*197*/	  r2.w = r3.x * r2.w + 1.000000;
/*198*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*199*/	  r3.x = max(r3.x, 0.000000);
/*200*/	  r3.x = log2(r3.x);
/*201*/	  r3.x = r3.x * 10.000000;
/*202*/	  r3.x = exp2(r3.x);
/*203*/	  r3.x = r5.z * r3.x;
/*204*/	  r3.x = r3.x * r5.w + r2.z;
/*205*/	  r2.x = r2.w * abs(r2.x);
/*206*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*207*/	} else {
/*208*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*209*/	}
/*210*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*211*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*212*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*213*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*214*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*215*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*216*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*217*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*218*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*219*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*220*/	r1.x = sqrt(r1.w);
/*221*/	r1.y = saturate(cb2.data[0].w)/**/;
/*222*/	r1.y = -r1.y + 1.000000;
/*223*/	r1.y = r1.y * 8.000000 + -4.000000;
/*224*/	r1.z = saturate(cb2.data[1].x)/**/;
/*225*/	r1.z = -r1.z + 1.000000;
/*226*/	r1.z = r1.z * 1000.000000;
/*227*/	r1.x = r1.x / r1.z;
/*228*/	r1.x = r1.x + r1.y;
/*229*/	r1.x = r1.x * 1.442695;
/*230*/	r1.x = exp2(r1.x);
/*231*/	r1.x = cb2.data[1].y / r1.x;
/*232*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*233*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*234*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*235*/	r1.y = r1.y + -cb2.data[1].z;
/*236*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*237*/	r1.y = saturate(r1.z * r1.y);
/*238*/	r1.z = r1.y * -2.000000 + 3.000000;
/*239*/	r1.y = r1.y * r1.y;
/*240*/	r1.y = r1.y * r1.z;
/*241*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*242*/	r1.z = sqrt(r1.z);
/*243*/	r1.w = max(cb2.data[2].z, 0.001000);
/*244*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*245*/	r1.z = r1.w * r1.z;
/*246*/	r1.z = min(r1.z, 1.000000);
/*247*/	r1.w = r1.z * -2.000000 + 3.000000;
/*248*/	r1.z = r1.z * r1.z;
/*249*/	r1.z = r1.z * r1.w;
/*250*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*251*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*252*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*253*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*254*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*255*/	r4.w = max(r4.y, 0.000000);
/*256*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*257*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*258*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*259*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*260*/	r1.x = saturate(r1.x * r1.z);
/*261*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*262*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*263*/	color0.w = r0.w * vsOut_T6.w;
/*264*/	return;
}
