//
//
// Shader Model 4
// Fragment Shader
//
// id: 6150 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithblood.hlsl_PS_ps30_alpha_overlay.glsl
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
/*1*/	r1.x = r0.w + -0.501961;
/*2*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r1.x != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*6*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*7*/	r1.w = saturate(vsOut_P1.w);
/*8*/	r3.xyz = (r3.xyzx + -cb4.data[0].xyzx).xyz;
/*9*/	r3.xyz = (r1.wwww * r3.xyzx + cb4.data[0].xyzx).xyz;
/*10*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*11*/	r2.xyw = (r2.xyxw + -cb4.data[1].xyxz).xyw;
/*12*/	r2.xyw = (r1.wwww * r2.xyxw + cb4.data[1].xyxz).xyw;
/*13*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*14*/	r4.xyz = (r4.xyzx + -cb4.data[2].xyzx).xyz;
/*15*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[2].xyzx).xyz;
/*16*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r3.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyz = (r2.xywx * r3.xyzx + -r3.xyzx).xyz;
/*19*/	r1.xyw = (r1.yyyy * r2.xyxz + r3.xyxz).xyw;
/*20*/	r2.xyz = (r4.xyzx * r1.xywx + -r1.xywx).xyz;
/*21*/	r0.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*22*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*23*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	r1.z = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*26*/	r1.z = -r1.z + 1.000000;
/*27*/	r1.z = max(r1.z, 0.000000);
/*28*/	r1.z = sqrt(r1.z);
/*29*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*30*/	if(r1.w != 0) discard;
/*31*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*32*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*33*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*34*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*35*/	r1.w = saturate(-r1.w + r2.w);
/*36*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r1.w) != 0u) {
/*38*/	  r1.w = -r2.w + 1.000000;
/*39*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*40*/	  r1.w = -r1.w + 1.000000;
/*41*/	  r1.w = -r1.w * r1.w + 1.000000;
/*42*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*43*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*44*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*47*/	  r2.w = 1.000000;
/*48*/	  r3.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r2.xzzw;
/*49*/	  r0.xyzw = r1.wwww * r3.xyzw + r2.xyzw;
/*50*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*51*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*52*/	} else {
/*53*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	}
/*56*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*57*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*58*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*59*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r4.xyz = (-r2.xyzx + r1.wwww).xyz;
/*61*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*62*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*63*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*64*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*65*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*66*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*67*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r3.yzw = (r2.wwww * vsOut_T3.xxyz).yzw;
/*70*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*71*/	r2.w = inversesqrt(r2.w);
/*72*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*73*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*74*/	r2.w = inversesqrt(r2.w);
/*75*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*76*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*77*/	r3.yzw = (r1.xxxx * r3.yyzw + r4.xxyz).yzw;
/*78*/	r1.xyz = (r1.zzzz * r5.xyzx + r3.yzwy).xyz;
/*79*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*82*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*83*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*84*/	r3.y = inversesqrt(r2.w);
/*85*/	r3.yzw = (r3.yyyy * r4.xxyz).yzw;
/*86*/	r5.x = -r3.x + 1.000000;
/*87*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*88*/	r5.z = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*89*/	r5.z = r5.z + r5.z;
/*90*/	r6.xyz = (r1.xyzx * -r5.zzzz + r3.yzwy).xyz;
/*91*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*92*/	r5.z = r5.x * 1.539380;
/*93*/	r5.z = cos((r5.z));
/*94*/	r5.z = inversesqrt(r5.z);
/*95*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*96*/	r5.w = saturate(r1.w * 60.000000);
/*97*/	r5.w = -r1.w + r5.w;
/*98*/	r8.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*99*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*100*/	r6.w = inversesqrt(r6.w);
/*101*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*102*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*103*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*104*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*105*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*106*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*107*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*108*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*109*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*110*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*111*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*112*/	r6.w = -r1.w + 1.000000;
/*113*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*114*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*115*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*116*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.yzwy));
/*117*/	  r6.w = max(r6.w, 0.000000);
/*118*/	  r6.w = log2(r6.w);
/*119*/	  r6.w = r6.w * 10.000000;
/*120*/	  r6.w = exp2(r6.w);
/*121*/	  r6.w = r5.z * r6.w;
/*122*/	  r6.w = r6.w * r5.w + r1.w;
/*123*/	  r7.y = r5.x * 8.000000;
/*124*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*125*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*126*/	  r8.xyz = (r9.xyzx * r2.xyzx + r8.xyzx).xyz;
/*127*/	}
/*128*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*129*/	r1.y = max(r1.x, 0.000000);
/*130*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*131*/	if(floatBitsToUint(r1.x) != 0u) {
/*132*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*133*/	  r1.x = max(r1.x, -1.000000);
/*134*/	  r1.x = min(r1.x, 1.000000);
/*135*/	  r1.z = -abs(r1.x) + 1.000000;
/*136*/	  r1.z = sqrt(r1.z);
/*137*/	  r6.x = abs(r1.x) * -0.018729 + 0.074261;
/*138*/	  r6.x = r6.x * abs(r1.x) + -0.212114;
/*139*/	  r6.x = r6.x * abs(r1.x) + 1.570729;
/*140*/	  r6.y = r1.z * r6.x;
/*141*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*142*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*143*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.y));
/*144*/	  r1.x = r6.x * r1.z + r1.x;
/*145*/	  r1.z = r3.x * r3.x;
/*146*/	    r3.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*147*/	  r1.z = r1.z * r3.x + r7.x;
/*148*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*149*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*150*/	  r3.x = -r1.z * r1.z + 1.000000;
/*151*/	  r3.x = max(r3.x, 0.001000);
/*152*/	  r3.x = log2(r3.x);
/*153*/	  r5.y = r3.x * 4.950617;
/*154*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*155*/	  r6.x = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*156*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*157*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.z));
/*158*/	  r1.z = floatBitsToInt(r1.z);
/*159*/	  r5.y = r3.x * r3.x + -r5.y;
/*160*/	  r5.y = sqrt(r5.y);
/*161*/	  r3.x = -r3.x + r5.y;
/*162*/	  r3.x = max(r3.x, 0.000000);
/*163*/	  r3.x = sqrt(r3.x);
/*164*/	  r1.z = r1.z * r3.x;
/*165*/	  r1.z = r1.z * 1.414214;
/*166*/	  r1.z = 0.008727 / r1.z;
/*167*/	  r1.z = max(r1.z, 0.000100);
/*168*/	  r6.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*169*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*170*/	  r1.xz = (r1.xxxx * r6.xxyx).xz;
/*171*/	  r6.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*172*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*173*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*174*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*175*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*176*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*177*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*178*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r1.x));
/*179*/	  r1.x = floatBitsToInt(r1.x);
/*180*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*181*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*182*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*183*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*184*/	  r1.x = r1.x * r6.x + 1.000000;
/*185*/	  r1.x = r1.x * 0.500000;
/*186*/	  r1.z = 1 + ~floatBitsToInt(r6.w);
/*187*/	  r1.z = r1.z * r6.y + 1.000000;
/*188*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*189*/	  r1.z = min(r1.y, 1.000000);
/*190*/	  r3.x = r5.x * 1.570796;
/*191*/	  r3.x = sin(r3.x);
/*192*/	  r1.z = r1.z + -1.000000;
/*193*/	  r1.z = r3.x * r1.z + 1.000000;
/*194*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*195*/	  r3.x = max(r3.x, 0.000000);
/*196*/	  r3.x = log2(r3.x);
/*197*/	  r3.x = r3.x * 10.000000;
/*198*/	  r3.x = exp2(r3.x);
/*199*/	  r3.x = r5.z * r3.x;
/*200*/	  r3.x = r3.x * r5.w + r1.w;
/*201*/	  r1.x = r1.z * abs(r1.x);
/*202*/	  r3.xyz = (r3.xxxx * r1.xxxx).xyz;
/*203*/	} else {
/*204*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*205*/	}
/*206*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*207*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*208*/	r1.xzw = (max(r1.wwww, r3.xxyz)).xzw;
/*209*/	r1.xzw = (-r1.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*210*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*211*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*212*/	r0.xyz = (r1.xzwx * r0.xyzx).xyz;
/*213*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*214*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*215*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*216*/	r1.x = sqrt(r2.w);
/*217*/	r1.y = saturate(cb2.data[0].w)/**/;
/*218*/	r1.y = -r1.y + 1.000000;
/*219*/	r1.y = r1.y * 8.000000 + -4.000000;
/*220*/	r1.z = saturate(cb2.data[1].x)/**/;
/*221*/	r1.z = -r1.z + 1.000000;
/*222*/	r1.z = r1.z * 1000.000000;
/*223*/	r1.x = r1.x / r1.z;
/*224*/	r1.x = r1.x + r1.y;
/*225*/	r1.x = r1.x * 1.442695;
/*226*/	r1.x = exp2(r1.x);
/*227*/	r1.x = cb2.data[1].y / r1.x;
/*228*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*229*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*230*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*231*/	r1.y = r1.y + -cb2.data[1].z;
/*232*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*233*/	r1.y = saturate(r1.z * r1.y);
/*234*/	r1.z = r1.y * -2.000000 + 3.000000;
/*235*/	r1.y = r1.y * r1.y;
/*236*/	r1.y = r1.y * r1.z;
/*237*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*238*/	r1.z = sqrt(r1.z);
/*239*/	r1.w = max(cb2.data[2].z, 0.001000);
/*240*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*241*/	r1.z = r1.w * r1.z;
/*242*/	r1.z = min(r1.z, 1.000000);
/*243*/	r1.w = r1.z * -2.000000 + 3.000000;
/*244*/	r1.z = r1.z * r1.z;
/*245*/	r1.z = r1.z * r1.w;
/*246*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*247*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*248*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*249*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*250*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*251*/	r4.w = max(r4.y, 0.000000);
/*252*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*253*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*254*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*255*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*256*/	r1.x = saturate(r1.x * r1.z);
/*257*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*258*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*259*/	color0.w = r0.w * vsOut_T6.w;
/*260*/	return;
}
