//
//
// Shader Model 4
// Fragment Shader
//
// id: 2897 - fxc/glsl_SM_3_0_weightedwithdecalburn.hlsl_PS_ps30_alpha_overlay.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*22*/	r0.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r2.z = sqrt(r1.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*33*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*34*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*35*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*36*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*37*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*38*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*39*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*40*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*41*/	if(floatBitsToUint(r1.w) != 0u) {
/*42*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*43*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*44*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*45*/	  r1.w = -r1.w + 1.000000;
/*46*/	  r1.w = max(r1.w, 0.000000);
/*47*/	  r5.z = sqrt(r1.w);
/*48*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*50*/	  r1.w = r3.x * r7.w;
/*51*/	  r3.x = r1.w * -0.500000 + r3.x;
/*52*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*53*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*54*/	  r1.w = -r4.w * r6.w + 1.000000;
/*55*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*56*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*57*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*58*/	}
/*59*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*60*/	r4.x = r3.z;
/*61*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*62*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*63*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*64*/	r1.w = saturate(r4.x * 5.000000);
/*65*/	r4.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*66*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*68*/	r2.w = log2(r5.z);
/*69*/	r2.w = r2.w * 1.800000;
/*70*/	r2.w = exp2(r2.w);
/*71*/	r2.w = r2.w * 10.000000;
/*72*/	r2.w = min(r2.w, 1.000000);
/*73*/	r1.w = r1.w + r2.w;
/*74*/	r1.w = r1.w * 0.500000;
/*75*/	r2.w = -r5.w + 1.000000;
/*76*/	r2.w = log2(r2.w);
/*77*/	r2.w = r2.w * vsOut_T7.z;
/*78*/	r2.w = exp2(r2.w);
/*79*/	r2.w = min(r2.w, 1.000000);
/*80*/	r2.w = r2.w * vsOut_T7.z;
/*81*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*82*/	r5.w = 1.000000;
/*83*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*84*/	r4.xyzw = r1.wwww * r4.xyzw + r5.zzzw;
/*85*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*86*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*87*/	r1.w = vsOut_T7.z + -0.025000;
/*88*/	r1.w = max(r1.w, 0.000000);
/*89*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*90*/	r0.xyzw = r1.wwww * r4.xyzw + r0.xyzw;
/*91*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*92*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*93*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*94*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*95*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*96*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*97*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*98*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*99*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*100*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*101*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*102*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*103*/	r2.w = inversesqrt(r2.w);
/*104*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*105*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*106*/	r2.w = inversesqrt(r2.w);
/*107*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*108*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*109*/	r2.w = inversesqrt(r2.w);
/*110*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*111*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*112*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*113*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*114*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*115*/	r2.w = inversesqrt(r2.w);
/*116*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*117*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*118*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*119*/	r3.x = inversesqrt(r2.w);
/*120*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*121*/	r5.x = -r3.y + 1.000000;
/*122*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*123*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*124*/	r5.z = r5.z + r5.z;
/*125*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*126*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*127*/	r5.z = r5.x * 1.539380;
/*128*/	r5.z = cos((r5.z));
/*129*/	r5.z = inversesqrt(r5.z);
/*130*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*131*/	r5.w = saturate(r1.w * 60.000000);
/*132*/	r5.w = -r1.w + r5.w;
/*133*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*134*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*135*/	r6.w = inversesqrt(r6.w);
/*136*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*137*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*138*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*139*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*140*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*141*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*142*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*143*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*144*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*145*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*146*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*147*/	r6.w = -r1.w + 1.000000;
/*148*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*149*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*150*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*151*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*152*/	  r6.w = max(r6.w, 0.000000);
/*153*/	  r6.w = log2(r6.w);
/*154*/	  r6.w = r6.w * 10.000000;
/*155*/	  r6.w = exp2(r6.w);
/*156*/	  r6.w = r5.z * r6.w;
/*157*/	  r6.w = r6.w * r5.w + r1.w;
/*158*/	  r7.y = r5.x * 8.000000;
/*159*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*160*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*161*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*162*/	}
/*163*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*164*/	r2.y = max(r2.x, 0.000000);
/*165*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*166*/	if(floatBitsToUint(r2.x) != 0u) {
/*167*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*168*/	  r2.x = max(r2.x, -1.000000);
/*169*/	  r2.x = min(r2.x, 1.000000);
/*170*/	  r2.z = -abs(r2.x) + 1.000000;
/*171*/	  r2.z = sqrt(r2.z);
/*172*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*173*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*174*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*175*/	  r6.y = r2.z * r6.x;
/*176*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*177*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*178*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*179*/	  r2.x = r6.x * r2.z + r2.x;
/*180*/	  r2.z = r3.y * r3.y;
/*181*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*182*/	  r2.z = r2.z * r3.y + r7.x;
/*183*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*184*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*185*/	  r3.y = -r2.z * r2.z + 1.000000;
/*186*/	  r3.y = max(r3.y, 0.001000);
/*187*/	  r3.y = log2(r3.y);
/*188*/	  r5.y = r3.y * 4.950617;
/*189*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*190*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*191*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*192*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*193*/	  r2.z = floatBitsToInt(r2.z);
/*194*/	  r5.y = r3.y * r3.y + -r5.y;
/*195*/	  r5.y = sqrt(r5.y);
/*196*/	  r3.y = -r3.y + r5.y;
/*197*/	  r3.y = max(r3.y, 0.000000);
/*198*/	  r3.y = sqrt(r3.y);
/*199*/	  r2.z = r2.z * r3.y;
/*200*/	  r2.z = r2.z * 1.414214;
/*201*/	  r2.z = 0.008727 / r2.z;
/*202*/	  r2.z = max(r2.z, 0.000100);
/*203*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*204*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*205*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*206*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*207*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*208*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*209*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*210*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*211*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*212*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*213*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*214*/	  r2.x = floatBitsToInt(r2.x);
/*215*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*216*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*217*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*218*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*219*/	  r2.x = r2.x * r6.x + 1.000000;
/*220*/	  r2.x = r2.x * 0.500000;
/*221*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*222*/	  r2.z = r2.z * r6.y + 1.000000;
/*223*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*224*/	  r2.z = min(r2.y, 1.000000);
/*225*/	  r3.y = r5.x * 1.570796;
/*226*/	  r3.y = sin(r3.y);
/*227*/	  r2.z = r2.z + -1.000000;
/*228*/	  r2.z = r3.y * r2.z + 1.000000;
/*229*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*230*/	  r3.x = max(r3.x, 0.000000);
/*231*/	  r3.x = log2(r3.x);
/*232*/	  r3.x = r3.x * 10.000000;
/*233*/	  r3.x = exp2(r3.x);
/*234*/	  r3.x = r5.z * r3.x;
/*235*/	  r3.x = r3.x * r5.w + r1.w;
/*236*/	  r2.x = r2.z * abs(r2.x);
/*237*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*238*/	} else {
/*239*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*240*/	}
/*241*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*242*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*243*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*244*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*245*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*246*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*247*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*248*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*249*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*250*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*251*/	r1.x = sqrt(r2.w);
/*252*/	r1.y = saturate(cb2.data[0].w)/**/;
/*253*/	r1.y = -r1.y + 1.000000;
/*254*/	r1.y = r1.y * 8.000000 + -4.000000;
/*255*/	r1.z = saturate(cb2.data[1].x)/**/;
/*256*/	r1.z = -r1.z + 1.000000;
/*257*/	r1.z = r1.z * 1000.000000;
/*258*/	r1.x = r1.x / r1.z;
/*259*/	r1.x = r1.x + r1.y;
/*260*/	r1.x = r1.x * 1.442695;
/*261*/	r1.x = exp2(r1.x);
/*262*/	r1.x = cb2.data[1].y / r1.x;
/*263*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*264*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*265*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*266*/	r1.y = r1.y + -cb2.data[1].z;
/*267*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*268*/	r1.y = saturate(r1.z * r1.y);
/*269*/	r1.z = r1.y * -2.000000 + 3.000000;
/*270*/	r1.y = r1.y * r1.y;
/*271*/	r1.y = r1.y * r1.z;
/*272*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*273*/	r1.z = sqrt(r1.z);
/*274*/	r1.w = max(cb2.data[2].z, 0.001000);
/*275*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*276*/	r1.z = r1.w * r1.z;
/*277*/	r1.z = min(r1.z, 1.000000);
/*278*/	r1.w = r1.z * -2.000000 + 3.000000;
/*279*/	r1.z = r1.z * r1.z;
/*280*/	r1.z = r1.z * r1.w;
/*281*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*282*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*283*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*284*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*285*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*286*/	r4.w = max(r4.y, 0.000000);
/*287*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*288*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*289*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*290*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*291*/	r1.x = saturate(r1.x * r1.z);
/*292*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*293*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*294*/	color0.w = r0.w * vsOut_T6.w;
/*295*/	return;
}
