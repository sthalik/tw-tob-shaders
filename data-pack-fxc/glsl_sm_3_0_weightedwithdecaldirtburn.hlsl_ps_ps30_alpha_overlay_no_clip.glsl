//
//
// Shader Model 4
// Fragment Shader
//
// id: 3042 - fxc/glsl_SM_3_0_weightedwithdecaldirtburn.hlsl_PS_ps30_alpha_overlay_no_clip.glsl
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
uniform sampler2D s_fire_map;
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

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
/*19*/	r2.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*20*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*24*/	r1.w = -r1.w + 1.000000;
/*25*/	r1.w = max(r1.w, 0.000000);
/*26*/	r3.z = sqrt(r1.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r4.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*29*/	r5.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*30*/	r4.zw = (r5.xxxy / r4.zzzw).zw;
/*31*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*32*/	r5.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r4.zzzw)) * 0xffffffffu)).zw;
/*33*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.z) & floatBitsToUint(r5.x));
/*34*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*35*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.w) & floatBitsToUint(r1.w));
/*36*/	r5.xyzw = (texture(s_decal_diffuse, r4.zwzz.st)).xyzw;
/*37*/	r6.xyzw = (texture(s_decal_normal, r4.zwzz.st)).xyzw;
/*38*/	if(floatBitsToUint(r1.w) != 0u) {
/*39*/	  r4.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*40*/	  r6.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	  r1.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*42*/	  r1.w = -r1.w + 1.000000;
/*43*/	  r1.w = max(r1.w, 0.000000);
/*44*/	  r6.z = sqrt(r1.w);
/*45*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r8.xyzw = r5.xyzw * r7.wwww;
/*47*/	  r1.w = r4.x * r8.w;
/*48*/	  r4.x = r1.w * -0.500000 + r4.x;
/*49*/	  r5.xyz = (r5.xyzx * r7.wwww + -r1.xyzx).xyz;
/*50*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*51*/	  r1.w = -r5.w * r7.w + 1.000000;
/*52*/	  r2.xyz = (r1.wwww * r2.xyzx + r8.xyzx).xyz;
/*53*/	  r5.xyz = (-r3.xyzx + r6.xyzx).xyz;
/*54*/	  r3.xyz = (r8.wwww * r5.xyzx + r3.xyzx).xyz;
/*55*/	}
/*56*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*57*/	r4.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*58*/	r6.xyzw = (texture(s_decal_dirt_map, r4.zwzz.st)).xyzw;
/*59*/	r4.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*60*/	r1.w = r5.w * r6.w;
/*61*/	r5.xyz = (-r2.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*62*/	r0.xyz = (r1.wwww * r5.xyzx + r2.xyzx).xyz;
/*63*/	r3.xy = (r4.zwzz * r5.wwww + r3.xyxx).xy;
/*64*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*65*/	r2.x = inversesqrt(r2.x);
/*66*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*67*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*68*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*69*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*70*/	r5.x = r3.x;
/*71*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*72*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*73*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*74*/	r1.w = saturate(r5.x * 5.000000);
/*75*/	r5.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*76*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*78*/	r2.w = log2(r3.z);
/*79*/	r2.w = r2.w * 1.800000;
/*80*/	r2.w = exp2(r2.w);
/*81*/	r2.w = r2.w * 10.000000;
/*82*/	r2.w = min(r2.w, 1.000000);
/*83*/	r1.w = r1.w + r2.w;
/*84*/	r1.w = r1.w * 0.500000;
/*85*/	r2.w = -r3.w + 1.000000;
/*86*/	r2.w = log2(r2.w);
/*87*/	r2.w = r2.w * vsOut_T7.z;
/*88*/	r2.w = exp2(r2.w);
/*89*/	r2.w = min(r2.w, 1.000000);
/*90*/	r2.w = r2.w * vsOut_T7.z;
/*91*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*92*/	r3.w = 1.000000;
/*93*/	r5.xyzw = r5.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r3.zzzw;
/*94*/	r5.xyzw = r1.wwww * r5.xyzw + r3.zzzw;
/*95*/	r5.xyzw = -r0.xyzw + r5.xyzw;
/*96*/	r0.xyzw = r2.wwww * r5.xyzw + r0.xyzw;
/*97*/	r1.w = vsOut_T7.z + -0.025000;
/*98*/	r1.w = max(r1.w, 0.000000);
/*99*/	r3.xyzw = -r0.xyzw + r3.xyzw;
/*100*/	r0.xyzw = r1.wwww * r3.xyzw + r0.xyzw;
/*101*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*102*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*103*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*104*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*105*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*106*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*107*/	r1.w = vsOut_T7.y * -r4.x + r4.x;
/*108*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*109*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*110*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*111*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*112*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*113*/	r2.w = inversesqrt(r2.w);
/*114*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*115*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*116*/	r2.w = inversesqrt(r2.w);
/*117*/	r4.xzw = (r2.wwww * vsOut_T5.xxyz).xzw;
/*118*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*119*/	r2.w = inversesqrt(r2.w);
/*120*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*121*/	r4.xzw = (r2.yyyy * r4.xxzw).xzw;
/*122*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.xzxw).xyw;
/*123*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*124*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*125*/	r2.w = inversesqrt(r2.w);
/*126*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*127*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*128*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*129*/	r4.x = inversesqrt(r2.w);
/*130*/	r4.xzw = (r3.xxyz * r4.xxxx).xzw;
/*131*/	r5.x = -r4.y + 1.000000;
/*132*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*133*/	r5.z = dot(vec3(r4.xzwx), vec3(r2.xyzx));
/*134*/	r5.z = r5.z + r5.z;
/*135*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.xzwx).xyz;
/*136*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*137*/	r5.z = r5.x * 1.539380;
/*138*/	r5.z = cos((r5.z));
/*139*/	r5.z = inversesqrt(r5.z);
/*140*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*141*/	r5.w = saturate(r1.w * 60.000000);
/*142*/	r5.w = -r1.w + r5.w;
/*143*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*144*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*145*/	r6.w = inversesqrt(r6.w);
/*146*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*147*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*148*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*149*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*150*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*151*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*152*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*153*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*154*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*155*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*156*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*157*/	r6.w = -r1.w + 1.000000;
/*158*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*159*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*160*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*161*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.xzwx));
/*162*/	  r6.w = max(r6.w, 0.000000);
/*163*/	  r6.w = log2(r6.w);
/*164*/	  r6.w = r6.w * 10.000000;
/*165*/	  r6.w = exp2(r6.w);
/*166*/	  r6.w = r5.z * r6.w;
/*167*/	  r6.w = r6.w * r5.w + r1.w;
/*168*/	  r7.y = r5.x * 8.000000;
/*169*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*170*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*171*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*172*/	}
/*173*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*174*/	r2.y = max(r2.x, 0.000000);
/*175*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*176*/	if(floatBitsToUint(r2.x) != 0u) {
/*177*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*178*/	  r2.x = max(r2.x, -1.000000);
/*179*/	  r2.x = min(r2.x, 1.000000);
/*180*/	  r2.z = -abs(r2.x) + 1.000000;
/*181*/	  r2.z = sqrt(r2.z);
/*182*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*183*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*184*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*185*/	  r6.y = r2.z * r6.x;
/*186*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*187*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*188*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*189*/	  r2.x = r6.x * r2.z + r2.x;
/*190*/	  r2.z = r4.y * r4.y;
/*191*/	    r4.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*192*/	  r2.z = r2.z * r4.y + r7.x;
/*193*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*194*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*195*/	  r4.y = -r2.z * r2.z + 1.000000;
/*196*/	  r4.y = max(r4.y, 0.001000);
/*197*/	  r4.y = log2(r4.y);
/*198*/	  r5.y = r4.y * 4.950617;
/*199*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*200*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*201*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*202*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*203*/	  r2.z = floatBitsToInt(r2.z);
/*204*/	  r5.y = r4.y * r4.y + -r5.y;
/*205*/	  r5.y = sqrt(r5.y);
/*206*/	  r4.y = -r4.y + r5.y;
/*207*/	  r4.y = max(r4.y, 0.000000);
/*208*/	  r4.y = sqrt(r4.y);
/*209*/	  r2.z = r2.z * r4.y;
/*210*/	  r2.z = r2.z * 1.414214;
/*211*/	  r2.z = 0.008727 / r2.z;
/*212*/	  r2.z = max(r2.z, 0.000100);
/*213*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*214*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*215*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*216*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*217*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*218*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*219*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*220*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*221*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*222*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*223*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*224*/	  r2.x = floatBitsToInt(r2.x);
/*225*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*226*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*227*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*228*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*229*/	  r2.x = r2.x * r6.x + 1.000000;
/*230*/	  r2.x = r2.x * 0.500000;
/*231*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*232*/	  r2.z = r2.z * r6.y + 1.000000;
/*233*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*234*/	  r2.z = min(r2.y, 1.000000);
/*235*/	  r4.y = r5.x * 1.570796;
/*236*/	  r4.y = sin(r4.y);
/*237*/	  r2.z = r2.z + -1.000000;
/*238*/	  r2.z = r4.y * r2.z + 1.000000;
/*239*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xzwx));
/*240*/	  r4.x = max(r4.x, 0.000000);
/*241*/	  r4.x = log2(r4.x);
/*242*/	  r4.x = r4.x * 10.000000;
/*243*/	  r4.x = exp2(r4.x);
/*244*/	  r4.x = r5.z * r4.x;
/*245*/	  r4.x = r4.x * r5.w + r1.w;
/*246*/	  r2.x = r2.z * abs(r2.x);
/*247*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*248*/	} else {
/*249*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*250*/	}
/*251*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*252*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*253*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*254*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*255*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*256*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*257*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*258*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*259*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*260*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*261*/	r1.x = sqrt(r2.w);
/*262*/	r1.y = saturate(cb2.data[0].w)/**/;
/*263*/	r1.y = -r1.y + 1.000000;
/*264*/	r1.y = r1.y * 8.000000 + -4.000000;
/*265*/	r1.z = saturate(cb2.data[1].x)/**/;
/*266*/	r1.z = -r1.z + 1.000000;
/*267*/	r1.z = r1.z * 1000.000000;
/*268*/	r1.x = r1.x / r1.z;
/*269*/	r1.x = r1.x + r1.y;
/*270*/	r1.x = r1.x * 1.442695;
/*271*/	r1.x = exp2(r1.x);
/*272*/	r1.x = cb2.data[1].y / r1.x;
/*273*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*274*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*275*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*276*/	r1.y = r1.y + -cb2.data[1].z;
/*277*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*278*/	r1.y = saturate(r1.z * r1.y);
/*279*/	r1.z = r1.y * -2.000000 + 3.000000;
/*280*/	r1.y = r1.y * r1.y;
/*281*/	r1.y = r1.y * r1.z;
/*282*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*283*/	r1.z = sqrt(r1.z);
/*284*/	r1.w = max(cb2.data[2].z, 0.001000);
/*285*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*286*/	r1.z = r1.w * r1.z;
/*287*/	r1.z = min(r1.z, 1.000000);
/*288*/	r1.w = r1.z * -2.000000 + 3.000000;
/*289*/	r1.z = r1.z * r1.z;
/*290*/	r1.z = r1.z * r1.w;
/*291*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*292*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*293*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*294*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*295*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*296*/	r3.w = max(r3.y, 0.000000);
/*297*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*298*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*299*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*300*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*301*/	r1.x = saturate(r1.x * r1.z);
/*302*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*303*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*304*/	color0.w = r0.w * vsOut_T6.w;
/*305*/	return;
}
