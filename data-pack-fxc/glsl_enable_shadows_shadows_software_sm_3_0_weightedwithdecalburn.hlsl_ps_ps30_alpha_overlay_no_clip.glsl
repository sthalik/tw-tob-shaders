//
//
// Shader Model 4
// Fragment Shader
//
// id: 6956 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalburn.hlsl_PS_ps30_alpha_overlay_no_clip.glsl
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r1.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
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
/*26*/	r2.z = sqrt(r1.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*30*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*31*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*32*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*33*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*34*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*35*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*36*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*38*/	if(floatBitsToUint(r1.w) != 0u) {
/*39*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*40*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*42*/	  r1.w = -r1.w + 1.000000;
/*43*/	  r1.w = max(r1.w, 0.000000);
/*44*/	  r5.z = sqrt(r1.w);
/*45*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*47*/	  r1.w = r3.x * r7.w;
/*48*/	  r3.x = r1.w * -0.500000 + r3.x;
/*49*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*50*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*51*/	  r1.w = -r4.w * r6.w + 1.000000;
/*52*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*53*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*54*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*55*/	}
/*56*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*57*/	r4.x = r3.z;
/*58*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*59*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*60*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*61*/	r1.w = saturate(r4.x * 5.000000);
/*62*/	r4.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*63*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*65*/	r2.w = log2(r5.z);
/*66*/	r2.w = r2.w * 1.800000;
/*67*/	r2.w = exp2(r2.w);
/*68*/	r2.w = r2.w * 10.000000;
/*69*/	r2.w = min(r2.w, 1.000000);
/*70*/	r1.w = r1.w + r2.w;
/*71*/	r1.w = r1.w * 0.500000;
/*72*/	r2.w = -r5.w + 1.000000;
/*73*/	r2.w = log2(r2.w);
/*74*/	r2.w = r2.w * vsOut_T7.z;
/*75*/	r2.w = exp2(r2.w);
/*76*/	r2.w = min(r2.w, 1.000000);
/*77*/	r2.w = r2.w * vsOut_T7.z;
/*78*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*79*/	r5.w = 1.000000;
/*80*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*81*/	r4.xyzw = r1.wwww * r4.xyzw + r5.zzzw;
/*82*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*83*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*84*/	r1.w = vsOut_T7.z + -0.025000;
/*85*/	r1.w = max(r1.w, 0.000000);
/*86*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*87*/	r0.xyzw = r1.wwww * r4.xyzw + r0.xyzw;
/*88*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*89*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*90*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*91*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*92*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*93*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*94*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*95*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*96*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*97*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*98*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*99*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*100*/	r2.w = inversesqrt(r2.w);
/*101*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*102*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*103*/	r2.w = inversesqrt(r2.w);
/*104*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*105*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*106*/	r2.w = inversesqrt(r2.w);
/*107*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*108*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*109*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*110*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*111*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*112*/	r2.w = inversesqrt(r2.w);
/*113*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*114*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*115*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*116*/	r3.x = inversesqrt(r2.w);
/*117*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*118*/	r5.x = -r3.y + 1.000000;
/*119*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*120*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*121*/	r5.z = r5.z + r5.z;
/*122*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*123*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*124*/	r5.z = r5.x * 1.539380;
/*125*/	r5.z = cos((r5.z));
/*126*/	r5.z = inversesqrt(r5.z);
/*127*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*128*/	r5.w = saturate(r1.w * 60.000000);
/*129*/	r5.w = -r1.w + r5.w;
/*130*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*131*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*132*/	r6.w = inversesqrt(r6.w);
/*133*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*134*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*135*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*136*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*137*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*138*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*139*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*140*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*141*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*142*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*143*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*144*/	r6.w = -r1.w + 1.000000;
/*145*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*146*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*147*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*148*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*149*/	  r6.w = max(r6.w, 0.000000);
/*150*/	  r6.w = log2(r6.w);
/*151*/	  r6.w = r6.w * 10.000000;
/*152*/	  r6.w = exp2(r6.w);
/*153*/	  r6.w = r5.z * r6.w;
/*154*/	  r6.w = r6.w * r5.w + r1.w;
/*155*/	  r7.y = r5.x * 8.000000;
/*156*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*157*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*158*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*159*/	}
/*160*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*161*/	r2.y = max(r2.x, 0.000000);
/*162*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*163*/	if(floatBitsToUint(r2.x) != 0u) {
/*164*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*165*/	  r2.x = max(r2.x, -1.000000);
/*166*/	  r2.x = min(r2.x, 1.000000);
/*167*/	  r2.z = -abs(r2.x) + 1.000000;
/*168*/	  r2.z = sqrt(r2.z);
/*169*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*170*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*171*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*172*/	  r6.y = r2.z * r6.x;
/*173*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*174*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*175*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*176*/	  r2.x = r6.x * r2.z + r2.x;
/*177*/	  r2.z = r3.y * r3.y;
/*178*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*179*/	  r2.z = r2.z * r3.y + r7.x;
/*180*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*181*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*182*/	  r3.y = -r2.z * r2.z + 1.000000;
/*183*/	  r3.y = max(r3.y, 0.001000);
/*184*/	  r3.y = log2(r3.y);
/*185*/	  r5.y = r3.y * 4.950617;
/*186*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*187*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*188*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*189*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*190*/	  r2.z = floatBitsToInt(r2.z);
/*191*/	  r5.y = r3.y * r3.y + -r5.y;
/*192*/	  r5.y = sqrt(r5.y);
/*193*/	  r3.y = -r3.y + r5.y;
/*194*/	  r3.y = max(r3.y, 0.000000);
/*195*/	  r3.y = sqrt(r3.y);
/*196*/	  r2.z = r2.z * r3.y;
/*197*/	  r2.z = r2.z * 1.414214;
/*198*/	  r2.z = 0.008727 / r2.z;
/*199*/	  r2.z = max(r2.z, 0.000100);
/*200*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*201*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*202*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*203*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*204*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*205*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*206*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*207*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*208*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*209*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*210*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*211*/	  r2.x = floatBitsToInt(r2.x);
/*212*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*213*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*214*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*215*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*216*/	  r2.x = r2.x * r6.x + 1.000000;
/*217*/	  r2.x = r2.x * 0.500000;
/*218*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*219*/	  r2.z = r2.z * r6.y + 1.000000;
/*220*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*221*/	  r2.z = min(r2.y, 1.000000);
/*222*/	  r3.y = r5.x * 1.570796;
/*223*/	  r3.y = sin(r3.y);
/*224*/	  r2.z = r2.z + -1.000000;
/*225*/	  r2.z = r3.y * r2.z + 1.000000;
/*226*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*227*/	  r3.x = max(r3.x, 0.000000);
/*228*/	  r3.x = log2(r3.x);
/*229*/	  r3.x = r3.x * 10.000000;
/*230*/	  r3.x = exp2(r3.x);
/*231*/	  r3.x = r5.z * r3.x;
/*232*/	  r3.x = r3.x * r5.w + r1.w;
/*233*/	  r2.x = r2.z * abs(r2.x);
/*234*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*235*/	} else {
/*236*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*237*/	}
/*238*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*239*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*240*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*241*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*242*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*243*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*244*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*245*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*246*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*247*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*248*/	r1.x = sqrt(r2.w);
/*249*/	r1.y = saturate(cb2.data[0].w)/**/;
/*250*/	r1.y = -r1.y + 1.000000;
/*251*/	r1.y = r1.y * 8.000000 + -4.000000;
/*252*/	r1.z = saturate(cb2.data[1].x)/**/;
/*253*/	r1.z = -r1.z + 1.000000;
/*254*/	r1.z = r1.z * 1000.000000;
/*255*/	r1.x = r1.x / r1.z;
/*256*/	r1.x = r1.x + r1.y;
/*257*/	r1.x = r1.x * 1.442695;
/*258*/	r1.x = exp2(r1.x);
/*259*/	r1.x = cb2.data[1].y / r1.x;
/*260*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*261*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*262*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*263*/	r1.y = r1.y + -cb2.data[1].z;
/*264*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*265*/	r1.y = saturate(r1.z * r1.y);
/*266*/	r1.z = r1.y * -2.000000 + 3.000000;
/*267*/	r1.y = r1.y * r1.y;
/*268*/	r1.y = r1.y * r1.z;
/*269*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*270*/	r1.z = sqrt(r1.z);
/*271*/	r1.w = max(cb2.data[2].z, 0.001000);
/*272*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*273*/	r1.z = r1.w * r1.z;
/*274*/	r1.z = min(r1.z, 1.000000);
/*275*/	r1.w = r1.z * -2.000000 + 3.000000;
/*276*/	r1.z = r1.z * r1.z;
/*277*/	r1.z = r1.z * r1.w;
/*278*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*279*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*280*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*281*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*282*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*283*/	r4.w = max(r4.y, 0.000000);
/*284*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*285*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*286*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*287*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*288*/	r1.x = saturate(r1.x * r1.z);
/*289*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*290*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*291*/	color0.w = r0.w * vsOut_T6.w;
/*292*/	return;
}
