//
//
// Shader Model 4
// Fragment Shader
//
// id: 2163 - fxc/glsl_SM_3_0_weightedwithburn.hlsl_PS_ps30_alpha_overlay.glsl
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
/*18*/	r4.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r4.xyzx + -r4.xyzx).xyz;
/*20*/	r2.xyw = (r2.yyyy * r3.xyxz + r4.xyxz).xyw;
/*21*/	r3.xyz = (r5.xyzx * r2.xywx + -r2.xywx).xyz;
/*22*/	r0.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r1.w = sqrt(r1.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*32*/	r4.x = r2.z;
/*33*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*34*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*35*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*36*/	r2.z = saturate(r4.x * 5.000000);
/*37*/	r4.xyzw = r2.zzzz * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*38*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*39*/	r2.z = saturate(-r2.z * 15.000000 + 1.000000);
/*40*/	r2.w = log2(r5.z);
/*41*/	r2.w = r2.w * 1.800000;
/*42*/	r2.w = exp2(r2.w);
/*43*/	r2.w = r2.w * 10.000000;
/*44*/	r2.w = min(r2.w, 1.000000);
/*45*/	r2.z = r2.w + r2.z;
/*46*/	r2.z = r2.z * 0.500000;
/*47*/	r2.w = -r5.w + 1.000000;
/*48*/	r2.w = log2(r2.w);
/*49*/	r2.w = r2.w * vsOut_T7.z;
/*50*/	r2.w = exp2(r2.w);
/*51*/	r2.w = min(r2.w, 1.000000);
/*52*/	r2.w = r2.w * vsOut_T7.z;
/*53*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*54*/	r5.w = 1.000000;
/*55*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*56*/	r4.xyzw = r2.zzzz * r4.xyzw + r5.zzzw;
/*57*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*58*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*59*/	r2.z = vsOut_T7.z + -0.025000;
/*60*/	r2.z = max(r2.z, 0.000000);
/*61*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*62*/	r0.xyzw = r2.zzzz * r4.xyzw + r0.xyzw;
/*63*/	r2.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r4.xyz = (-r0.xyzx + r2.zzzz).xyz;
/*65*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*66*/	r2.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r4.xyz = (-r1.xyzx + r2.zzzz).xyz;
/*68*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*69*/	r2.z = vsOut_T7.y * -r3.y + r3.y;
/*70*/	r2.z = vsOut_T7.x * -r2.z + r2.z;
/*71*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*72*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*73*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*74*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*77*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*78*/	r2.w = inversesqrt(r2.w);
/*79*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*80*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*81*/	r2.w = inversesqrt(r2.w);
/*82*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*83*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*84*/	r2.xyw = (r2.xxxx * r3.yzyw + r4.xyxz).xyw;
/*85*/	r2.xyw = (r1.wwww * r5.xyxz + r2.xyxw).xyw;
/*86*/	r1.w = dot(vec3(r2.xywx), vec3(r2.xywx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r2.xyw = (r1.wwww * r2.xyxw).xyw;
/*89*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*90*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*91*/	r3.y = inversesqrt(r1.w);
/*92*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*93*/	r5.x = -r3.x + 1.000000;
/*94*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*95*/	r5.z = dot(vec3(r3.yzwy), vec3(r2.xywx));
/*96*/	r5.z = r5.z + r5.z;
/*97*/	r6.xyz = (r2.xywx * -r5.zzzz + r3.yzwy).xyz;
/*98*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*99*/	r5.z = r5.x * 1.539380;
/*100*/	r5.z = cos((r5.z));
/*101*/	r5.z = inversesqrt(r5.z);
/*102*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*103*/	r5.w = saturate(r2.z * 60.000000);
/*104*/	r5.w = -r2.z + r5.w;
/*105*/	r8.xyz = (r2.xywx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*106*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*107*/	r6.w = inversesqrt(r6.w);
/*108*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*109*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*110*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*111*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*112*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*113*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*114*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*115*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*116*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*117*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*118*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*119*/	r6.w = -r2.z + 1.000000;
/*120*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*121*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*122*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*123*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*124*/	  r6.w = max(r6.w, 0.000000);
/*125*/	  r6.w = log2(r6.w);
/*126*/	  r6.w = r6.w * 10.000000;
/*127*/	  r6.w = exp2(r6.w);
/*128*/	  r6.w = r5.z * r6.w;
/*129*/	  r6.w = r6.w * r5.w + r2.z;
/*130*/	  r7.y = r5.x * 8.000000;
/*131*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*132*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*133*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*134*/	}
/*135*/	r2.x = dot(vec3(r2.xywx), vec3(-cb1.data[0].yzwy));
/*136*/	r2.y = max(r2.x, 0.000000);
/*137*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*138*/	if(floatBitsToUint(r2.x) != 0u) {
/*139*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*140*/	  r2.x = max(r2.x, -1.000000);
/*141*/	  r2.x = min(r2.x, 1.000000);
/*142*/	  r2.w = -abs(r2.x) + 1.000000;
/*143*/	  r2.w = sqrt(r2.w);
/*144*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*145*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*146*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*147*/	  r6.y = r2.w * r6.x;
/*148*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*149*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*150*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*151*/	  r2.x = r6.x * r2.w + r2.x;
/*152*/	  r2.w = r3.x * r3.x;
/*153*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*154*/	  r2.w = r2.w * r3.x + r7.x;
/*155*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*156*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*157*/	  r3.x = -r2.w * r2.w + 1.000000;
/*158*/	  r3.x = max(r3.x, 0.001000);
/*159*/	  r3.x = log2(r3.x);
/*160*/	  r5.y = r3.x * 4.950617;
/*161*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*162*/	  r6.x = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*163*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*164*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.w));
/*165*/	  r2.w = floatBitsToInt(r2.w);
/*166*/	  r5.y = r3.x * r3.x + -r5.y;
/*167*/	  r5.y = sqrt(r5.y);
/*168*/	  r3.x = -r3.x + r5.y;
/*169*/	  r3.x = max(r3.x, 0.000000);
/*170*/	  r3.x = sqrt(r3.x);
/*171*/	  r2.w = r2.w * r3.x;
/*172*/	  r2.w = r2.w * 1.414214;
/*173*/	  r2.w = 0.008727 / r2.w;
/*174*/	  r2.w = max(r2.w, 0.000100);
/*175*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*176*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).x;
/*177*/	  r2.xw = (r2.xxxx * r6.xxxy).xw;
/*178*/	  r6.xy = (r2.xwxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*179*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*180*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*181*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*182*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*183*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxw)) * 0xffffffffu)).zw;
/*184*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*185*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*186*/	  r2.x = floatBitsToInt(r2.x);
/*187*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*188*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*189*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*190*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*191*/	  r2.x = r2.x * r6.x + 1.000000;
/*192*/	  r2.x = r2.x * 0.500000;
/*193*/	  r2.w = 1 + ~floatBitsToInt(r6.w);
/*194*/	  r2.w = r2.w * r6.y + 1.000000;
/*195*/	  r2.x = r2.w * 0.500000 + -r2.x;
/*196*/	  r2.w = min(r2.y, 1.000000);
/*197*/	  r3.x = r5.x * 1.570796;
/*198*/	  r3.x = sin(r3.x);
/*199*/	  r2.w = r2.w + -1.000000;
/*200*/	  r2.w = r3.x * r2.w + 1.000000;
/*201*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*202*/	  r3.x = max(r3.x, 0.000000);
/*203*/	  r3.x = log2(r3.x);
/*204*/	  r3.x = r3.x * 10.000000;
/*205*/	  r3.x = exp2(r3.x);
/*206*/	  r3.x = r5.z * r3.x;
/*207*/	  r3.x = r3.x * r5.w + r2.z;
/*208*/	  r2.x = r2.w * abs(r2.x);
/*209*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*210*/	} else {
/*211*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*212*/	}
/*213*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*214*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*215*/	r2.xzw = (max(r2.zzzz, r3.xxyz)).xzw;
/*216*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*217*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*218*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*219*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*220*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*221*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*222*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*223*/	r1.x = sqrt(r1.w);
/*224*/	r1.y = saturate(cb2.data[0].w)/**/;
/*225*/	r1.y = -r1.y + 1.000000;
/*226*/	r1.y = r1.y * 8.000000 + -4.000000;
/*227*/	r1.z = saturate(cb2.data[1].x)/**/;
/*228*/	r1.z = -r1.z + 1.000000;
/*229*/	r1.z = r1.z * 1000.000000;
/*230*/	r1.x = r1.x / r1.z;
/*231*/	r1.x = r1.x + r1.y;
/*232*/	r1.x = r1.x * 1.442695;
/*233*/	r1.x = exp2(r1.x);
/*234*/	r1.x = cb2.data[1].y / r1.x;
/*235*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*236*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*237*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*238*/	r1.y = r1.y + -cb2.data[1].z;
/*239*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*240*/	r1.y = saturate(r1.z * r1.y);
/*241*/	r1.z = r1.y * -2.000000 + 3.000000;
/*242*/	r1.y = r1.y * r1.y;
/*243*/	r1.y = r1.y * r1.z;
/*244*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*245*/	r1.z = sqrt(r1.z);
/*246*/	r1.w = max(cb2.data[2].z, 0.001000);
/*247*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*248*/	r1.z = r1.w * r1.z;
/*249*/	r1.z = min(r1.z, 1.000000);
/*250*/	r1.w = r1.z * -2.000000 + 3.000000;
/*251*/	r1.z = r1.z * r1.z;
/*252*/	r1.z = r1.z * r1.w;
/*253*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*254*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*255*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*256*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*257*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*258*/	r4.w = max(r4.y, 0.000000);
/*259*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*260*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*261*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*262*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*263*/	r1.x = saturate(r1.x * r1.z);
/*264*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*265*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*266*/	color0.w = r0.w * vsOut_T6.w;
/*267*/	return;
}
