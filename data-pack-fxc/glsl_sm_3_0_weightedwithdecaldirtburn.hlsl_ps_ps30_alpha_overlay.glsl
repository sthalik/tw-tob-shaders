//
//
// Shader Model 4
// Fragment Shader
//
// id: 3040 - fxc/glsl_SM_3_0_weightedwithdecaldirtburn.hlsl_PS_ps30_alpha_overlay.glsl
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
/*22*/	r2.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*23*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r4.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*32*/	r5.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*33*/	r4.zw = (r5.xxxy / r4.zzzw).zw;
/*34*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*35*/	r5.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r4.zzzw)) * 0xffffffffu)).zw;
/*36*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.z) & floatBitsToUint(r5.x));
/*37*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*38*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.w) & floatBitsToUint(r1.w));
/*39*/	r5.xyzw = (texture(s_decal_diffuse, r4.zwzz.st)).xyzw;
/*40*/	r6.xyzw = (texture(s_decal_normal, r4.zwzz.st)).xyzw;
/*41*/	if(floatBitsToUint(r1.w) != 0u) {
/*42*/	  r4.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*43*/	  r6.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*44*/	  r1.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*45*/	  r1.w = -r1.w + 1.000000;
/*46*/	  r1.w = max(r1.w, 0.000000);
/*47*/	  r6.z = sqrt(r1.w);
/*48*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	  r8.xyzw = r5.xyzw * r7.wwww;
/*50*/	  r1.w = r4.x * r8.w;
/*51*/	  r4.x = r1.w * -0.500000 + r4.x;
/*52*/	  r5.xyz = (r5.xyzx * r7.wwww + -r1.xyzx).xyz;
/*53*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*54*/	  r1.w = -r5.w * r7.w + 1.000000;
/*55*/	  r2.xyz = (r1.wwww * r2.xyzx + r8.xyzx).xyz;
/*56*/	  r5.xyz = (-r3.xyzx + r6.xyzx).xyz;
/*57*/	  r3.xyz = (r8.wwww * r5.xyzx + r3.xyzx).xyz;
/*58*/	}
/*59*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r4.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*61*/	r6.xyzw = (texture(s_decal_dirt_map, r4.zwzz.st)).xyzw;
/*62*/	r4.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*63*/	r1.w = r5.w * r6.w;
/*64*/	r5.xyz = (-r2.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*65*/	r0.xyz = (r1.wwww * r5.xyzx + r2.xyzx).xyz;
/*66*/	r3.xy = (r4.zwzz * r5.wwww + r3.xyxx).xy;
/*67*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*68*/	r2.x = inversesqrt(r2.x);
/*69*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*70*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*71*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*72*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*73*/	r5.x = r3.x;
/*74*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*75*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*76*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*77*/	r1.w = saturate(r5.x * 5.000000);
/*78*/	r5.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*79*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*81*/	r2.w = log2(r3.z);
/*82*/	r2.w = r2.w * 1.800000;
/*83*/	r2.w = exp2(r2.w);
/*84*/	r2.w = r2.w * 10.000000;
/*85*/	r2.w = min(r2.w, 1.000000);
/*86*/	r1.w = r1.w + r2.w;
/*87*/	r1.w = r1.w * 0.500000;
/*88*/	r2.w = -r3.w + 1.000000;
/*89*/	r2.w = log2(r2.w);
/*90*/	r2.w = r2.w * vsOut_T7.z;
/*91*/	r2.w = exp2(r2.w);
/*92*/	r2.w = min(r2.w, 1.000000);
/*93*/	r2.w = r2.w * vsOut_T7.z;
/*94*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*95*/	r3.w = 1.000000;
/*96*/	r5.xyzw = r5.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r3.zzzw;
/*97*/	r5.xyzw = r1.wwww * r5.xyzw + r3.zzzw;
/*98*/	r5.xyzw = -r0.xyzw + r5.xyzw;
/*99*/	r0.xyzw = r2.wwww * r5.xyzw + r0.xyzw;
/*100*/	r1.w = vsOut_T7.z + -0.025000;
/*101*/	r1.w = max(r1.w, 0.000000);
/*102*/	r3.xyzw = -r0.xyzw + r3.xyzw;
/*103*/	r0.xyzw = r1.wwww * r3.xyzw + r0.xyzw;
/*104*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*105*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*106*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*107*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*108*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*109*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*110*/	r1.w = vsOut_T7.y * -r4.x + r4.x;
/*111*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*112*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*113*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*114*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*115*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*116*/	r2.w = inversesqrt(r2.w);
/*117*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*118*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*119*/	r2.w = inversesqrt(r2.w);
/*120*/	r4.xzw = (r2.wwww * vsOut_T5.xxyz).xzw;
/*121*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*122*/	r2.w = inversesqrt(r2.w);
/*123*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*124*/	r4.xzw = (r2.yyyy * r4.xxzw).xzw;
/*125*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.xzxw).xyw;
/*126*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*127*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*128*/	r2.w = inversesqrt(r2.w);
/*129*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*130*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*131*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*132*/	r4.x = inversesqrt(r2.w);
/*133*/	r4.xzw = (r3.xxyz * r4.xxxx).xzw;
/*134*/	r5.x = -r4.y + 1.000000;
/*135*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*136*/	r5.z = dot(vec3(r4.xzwx), vec3(r2.xyzx));
/*137*/	r5.z = r5.z + r5.z;
/*138*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.xzwx).xyz;
/*139*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*140*/	r5.z = r5.x * 1.539380;
/*141*/	r5.z = cos((r5.z));
/*142*/	r5.z = inversesqrt(r5.z);
/*143*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*144*/	r5.w = saturate(r1.w * 60.000000);
/*145*/	r5.w = -r1.w + r5.w;
/*146*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*147*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*148*/	r6.w = inversesqrt(r6.w);
/*149*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*150*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*151*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*152*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*153*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*154*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*155*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*156*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*157*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*158*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*159*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*160*/	r6.w = -r1.w + 1.000000;
/*161*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*162*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*163*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*164*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.xzwx));
/*165*/	  r6.w = max(r6.w, 0.000000);
/*166*/	  r6.w = log2(r6.w);
/*167*/	  r6.w = r6.w * 10.000000;
/*168*/	  r6.w = exp2(r6.w);
/*169*/	  r6.w = r5.z * r6.w;
/*170*/	  r6.w = r6.w * r5.w + r1.w;
/*171*/	  r7.y = r5.x * 8.000000;
/*172*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*173*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*174*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*175*/	}
/*176*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*177*/	r2.y = max(r2.x, 0.000000);
/*178*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*179*/	if(floatBitsToUint(r2.x) != 0u) {
/*180*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*181*/	  r2.x = max(r2.x, -1.000000);
/*182*/	  r2.x = min(r2.x, 1.000000);
/*183*/	  r2.z = -abs(r2.x) + 1.000000;
/*184*/	  r2.z = sqrt(r2.z);
/*185*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*186*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*187*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*188*/	  r6.y = r2.z * r6.x;
/*189*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*190*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*191*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*192*/	  r2.x = r6.x * r2.z + r2.x;
/*193*/	  r2.z = r4.y * r4.y;
/*194*/	    r4.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*195*/	  r2.z = r2.z * r4.y + r7.x;
/*196*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*197*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*198*/	  r4.y = -r2.z * r2.z + 1.000000;
/*199*/	  r4.y = max(r4.y, 0.001000);
/*200*/	  r4.y = log2(r4.y);
/*201*/	  r5.y = r4.y * 4.950617;
/*202*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*203*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*204*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*205*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*206*/	  r2.z = floatBitsToInt(r2.z);
/*207*/	  r5.y = r4.y * r4.y + -r5.y;
/*208*/	  r5.y = sqrt(r5.y);
/*209*/	  r4.y = -r4.y + r5.y;
/*210*/	  r4.y = max(r4.y, 0.000000);
/*211*/	  r4.y = sqrt(r4.y);
/*212*/	  r2.z = r2.z * r4.y;
/*213*/	  r2.z = r2.z * 1.414214;
/*214*/	  r2.z = 0.008727 / r2.z;
/*215*/	  r2.z = max(r2.z, 0.000100);
/*216*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*217*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*218*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*219*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*220*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*221*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*222*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*223*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*224*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*225*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*226*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*227*/	  r2.x = floatBitsToInt(r2.x);
/*228*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*229*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*230*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*231*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*232*/	  r2.x = r2.x * r6.x + 1.000000;
/*233*/	  r2.x = r2.x * 0.500000;
/*234*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*235*/	  r2.z = r2.z * r6.y + 1.000000;
/*236*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*237*/	  r2.z = min(r2.y, 1.000000);
/*238*/	  r4.y = r5.x * 1.570796;
/*239*/	  r4.y = sin(r4.y);
/*240*/	  r2.z = r2.z + -1.000000;
/*241*/	  r2.z = r4.y * r2.z + 1.000000;
/*242*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xzwx));
/*243*/	  r4.x = max(r4.x, 0.000000);
/*244*/	  r4.x = log2(r4.x);
/*245*/	  r4.x = r4.x * 10.000000;
/*246*/	  r4.x = exp2(r4.x);
/*247*/	  r4.x = r5.z * r4.x;
/*248*/	  r4.x = r4.x * r5.w + r1.w;
/*249*/	  r2.x = r2.z * abs(r2.x);
/*250*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*251*/	} else {
/*252*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*253*/	}
/*254*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*255*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*256*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*257*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*258*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*259*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*260*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*261*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*262*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*263*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*264*/	r1.x = sqrt(r2.w);
/*265*/	r1.y = saturate(cb2.data[0].w)/**/;
/*266*/	r1.y = -r1.y + 1.000000;
/*267*/	r1.y = r1.y * 8.000000 + -4.000000;
/*268*/	r1.z = saturate(cb2.data[1].x)/**/;
/*269*/	r1.z = -r1.z + 1.000000;
/*270*/	r1.z = r1.z * 1000.000000;
/*271*/	r1.x = r1.x / r1.z;
/*272*/	r1.x = r1.x + r1.y;
/*273*/	r1.x = r1.x * 1.442695;
/*274*/	r1.x = exp2(r1.x);
/*275*/	r1.x = cb2.data[1].y / r1.x;
/*276*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*277*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*278*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*279*/	r1.y = r1.y + -cb2.data[1].z;
/*280*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*281*/	r1.y = saturate(r1.z * r1.y);
/*282*/	r1.z = r1.y * -2.000000 + 3.000000;
/*283*/	r1.y = r1.y * r1.y;
/*284*/	r1.y = r1.y * r1.z;
/*285*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*286*/	r1.z = sqrt(r1.z);
/*287*/	r1.w = max(cb2.data[2].z, 0.001000);
/*288*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*289*/	r1.z = r1.w * r1.z;
/*290*/	r1.z = min(r1.z, 1.000000);
/*291*/	r1.w = r1.z * -2.000000 + 3.000000;
/*292*/	r1.z = r1.z * r1.z;
/*293*/	r1.z = r1.z * r1.w;
/*294*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*295*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*296*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*297*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*298*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*299*/	r3.w = max(r3.y, 0.000000);
/*300*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*301*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*302*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*303*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*304*/	r1.x = saturate(r1.x * r1.z);
/*305*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*306*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*307*/	color0.w = r0.w * vsOut_T6.w;
/*308*/	return;
}
