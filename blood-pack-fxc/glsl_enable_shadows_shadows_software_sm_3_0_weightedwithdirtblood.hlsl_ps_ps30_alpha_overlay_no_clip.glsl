//
//
// Shader Model 4
// Fragment Shader
//
// id: 6298 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_alpha_overlay_no_clip.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*3*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*4*/	r1.w = saturate(vsOut_P1.w);
/*5*/	r3.xyz = (r3.xyzx + -cb4.data[0].xyzx).xyz;
/*6*/	r3.xyz = (r1.wwww * r3.xyzx + cb4.data[0].xyzx).xyz;
/*7*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*8*/	r2.xyw = (r2.xyxw + -cb4.data[1].xyxz).xyw;
/*9*/	r2.xyw = (r1.wwww * r2.xyxw + cb4.data[1].xyxz).xyw;
/*10*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*11*/	r4.xyz = (r4.xyzx + -cb4.data[2].xyzx).xyz;
/*12*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[2].xyzx).xyz;
/*13*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*14*/	r3.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xyz = (r2.xywx * r3.xyzx + -r3.xyzx).xyz;
/*16*/	r1.xyw = (r1.yyyy * r2.xyxz + r3.xyxz).xyw;
/*17*/	r2.xyz = (r4.xyzx * r1.xywx + -r1.xywx).xyz;
/*18*/	r1.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*19*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*21*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*23*/	r1.w = -r1.w + 1.000000;
/*24*/	r1.w = max(r1.w, 0.000000);
/*25*/	r3.z = sqrt(r1.w);
/*26*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*27*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*29*/	r2.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*30*/	r1.w = r4.w * r5.w;
/*31*/	r4.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*32*/	r0.xyz = (r1.wwww * r4.xyzx + r1.xyzx).xyz;
/*33*/	r3.xy = (r2.zwzz * r4.wwww + r2.xyxx).xy;
/*34*/	r1.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*35*/	r1.x = inversesqrt(r1.x);
/*36*/	r1.xyz = (r1.xxxx * r3.xyzx).xyz;
/*37*/	r2.x = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*38*/	if(r2.x != 0) discard;
/*39*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*40*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*41*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*42*/	r2.x = -vsOut_T4.z * 0.900000 + 1.000000;
/*43*/	r2.x = saturate(-r2.x + r2.w);
/*44*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*45*/	if(floatBitsToUint(r2.x) != 0u) {
/*46*/	  r2.x = -r2.w + 1.000000;
/*47*/	  r2.x = saturate(vsOut_T4.z * 0.900000 + -r2.x);
/*48*/	  r2.x = -r2.x + 1.000000;
/*49*/	  r2.x = -r2.x * r2.x + 1.000000;
/*50*/	  r2.x = r2.x * -0.600000 + 1.000000;
/*51*/	  r2.xyz = (r2.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*52*/	  r3.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*53*/	  r3.x = uintBitsToFloat((r3.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*54*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3f800000u));
/*55*/	  r2.w = 1.000000;
/*56*/	  r4.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r2.xzzw;
/*57*/	  r0.xyzw = r3.xxxx * r4.xyzw + r2.xyzw;
/*58*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*59*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*60*/	} else {
/*61*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*63*/	  r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*64*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*65*/	}
/*66*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*68*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*69*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*70*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*71*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*72*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*73*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*74*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*75*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*76*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*77*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*78*/	r2.w = inversesqrt(r2.w);
/*79*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*80*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*81*/	r2.w = inversesqrt(r2.w);
/*82*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*83*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*84*/	r2.w = inversesqrt(r2.w);
/*85*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*86*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*87*/	r3.yzw = (r1.xxxx * r3.yyzw + r4.xxyz).yzw;
/*88*/	r1.xyz = (r1.zzzz * r5.xyzx + r3.yzwy).xyz;
/*89*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*90*/	r2.w = inversesqrt(r2.w);
/*91*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*92*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*93*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*94*/	r3.y = inversesqrt(r2.w);
/*95*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*96*/	r5.x = -r3.x + 1.000000;
/*97*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*98*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*99*/	r5.z = r5.z + r5.z;
/*100*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*101*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*102*/	r5.z = r5.x * 1.539380;
/*103*/	r5.z = cos((r5.z));
/*104*/	r5.z = inversesqrt(r5.z);
/*105*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*106*/	r5.w = saturate(r1.w * 60.000000);
/*107*/	r5.w = -r1.w + r5.w;
/*108*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*109*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*110*/	r6.w = inversesqrt(r6.w);
/*111*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*112*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*113*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*114*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*115*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*116*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*117*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*118*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*119*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*120*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*121*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*122*/	r6.w = -r1.w + 1.000000;
/*123*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*124*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*125*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*126*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*127*/	  r6.w = max(r6.w, 0.000000);
/*128*/	  r6.w = log2(r6.w);
/*129*/	  r6.w = r6.w * 10.000000;
/*130*/	  r6.w = exp2(r6.w);
/*131*/	  r6.w = r5.z * r6.w;
/*132*/	  r6.w = r6.w * r5.w + r1.w;
/*133*/	  r7.y = r5.x * 8.000000;
/*134*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*135*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*136*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*137*/	}
/*138*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*139*/	r1.y = max(r1.x, 0.000000);
/*140*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*141*/	if(floatBitsToUint(r1.x) != 0u) {
/*142*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*143*/	  r1.x = max(r1.x, -1.000000);
/*144*/	  r1.x = min(r1.x, 1.000000);
/*145*/	  r1.z = -abs(r1.x) + 1.000000;
/*146*/	  r1.z = sqrt(r1.z);
/*147*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*148*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*149*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*150*/	  r6.y = r1.z * r6.x;
/*151*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*152*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*153*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*154*/	  r1.x = r6.x * r1.z + r1.x;
/*155*/	  r1.z = r3.x * r3.x;
/*156*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*157*/	  r1.z = r1.z * r3.x + r7.x;
/*158*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*159*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*160*/	  r3.x = -r1.z * r1.z + 1.000000;
/*161*/	  r3.x = max(r3.x, 0.001000);
/*162*/	  r3.x = log2(r3.x);
/*163*/	  r5.y = r3.x * 4.950617;
/*164*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*165*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*166*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*167*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*168*/	  r1.z = floatBitsToInt(r1.z);
/*169*/	  r5.y = r3.x * r3.x + -r5.y;
/*170*/	  r5.y = sqrt(r5.y);
/*171*/	  r3.x = -r3.x + r5.y;
/*172*/	  r3.x = max(r3.x, 0.000000);
/*173*/	  r3.x = sqrt(r3.x);
/*174*/	  r1.z = r1.z * r3.x;
/*175*/	  r1.z = r1.z * 1.414214;
/*176*/	  r1.z = 0.008727 / r1.z;
/*177*/	  r1.z = max(r1.z, 0.000100);
/*178*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*179*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*180*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*181*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*182*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*183*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*184*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*185*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*186*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*187*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*188*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*189*/	  r1.x = floatBitsToInt(r1.x);
/*190*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*191*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*192*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*193*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*194*/	  r1.x = r1.x * r6.x + 1.000000;
/*195*/	  r1.x = r1.x * 0.500000;
/*196*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*197*/	  r1.z = r1.z * r6.y + 1.000000;
/*198*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*199*/	  r1.z = min(r1.y, 1.000000);
/*200*/	  r3.x = r5.x * 1.570796;
/*201*/	  r3.x = sin(r3.x);
/*202*/	  r1.z = r1.z + -1.000000;
/*203*/	  r1.z = r3.x * r1.z + 1.000000;
/*204*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*205*/	  r3.x = max(r3.x, 0.000000);
/*206*/	  r3.x = log2(r3.x);
/*207*/	  r3.x = r3.x * 10.000000;
/*208*/	  r3.x = exp2(r3.x);
/*209*/	  r3.x = r5.z * r3.x;
/*210*/	  r3.x = r3.x * r5.w + r1.w;
/*211*/	  r1.x = r1.z * abs(r1.x);
/*212*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*213*/	} else {
/*214*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*215*/	}
/*216*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*217*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*218*/	r1.xzw = (max(r1.wwww, r3.xxyz)).xzw;
/*219*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*220*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*221*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*222*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*223*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*224*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*225*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*226*/	r1.x = sqrt(r2.w);
/*227*/	r1.y = saturate(cb2.data[0].w)/**/;
/*228*/	r1.y = -r1.y + 1.000000;
/*229*/	r1.y = r1.y * 8.000000 + -4.000000;
/*230*/	r1.z = saturate(cb2.data[1].x)/**/;
/*231*/	r1.z = -r1.z + 1.000000;
/*232*/	r1.z = r1.z * 1000.000000;
/*233*/	r1.x = r1.x / r1.z;
/*234*/	r1.x = r1.x + r1.y;
/*235*/	r1.x = r1.x * 1.442695;
/*236*/	r1.x = exp2(r1.x);
/*237*/	r1.x = cb2.data[1].y / r1.x;
/*238*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*239*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*240*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*241*/	r1.y = r1.y + -cb2.data[1].z;
/*242*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*243*/	r1.y = saturate(r1.z * r1.y);
/*244*/	r1.z = r1.y * -2.000000 + 3.000000;
/*245*/	r1.y = r1.y * r1.y;
/*246*/	r1.y = r1.y * r1.z;
/*247*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*248*/	r1.z = sqrt(r1.z);
/*249*/	r1.w = max(cb2.data[2].z, 0.001000);
/*250*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*251*/	r1.z = r1.w * r1.z;
/*252*/	r1.z = min(r1.z, 1.000000);
/*253*/	r1.w = r1.z * -2.000000 + 3.000000;
/*254*/	r1.z = r1.z * r1.z;
/*255*/	r1.z = r1.z * r1.w;
/*256*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*257*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*258*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*259*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*260*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*261*/	r4.w = max(r4.y, 0.000000);
/*262*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*263*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*264*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*265*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*266*/	r1.x = saturate(r1.x * r1.z);
/*267*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*268*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*269*/	color0.w = r0.w * vsOut_T6.w;
/*270*/	return;
}
