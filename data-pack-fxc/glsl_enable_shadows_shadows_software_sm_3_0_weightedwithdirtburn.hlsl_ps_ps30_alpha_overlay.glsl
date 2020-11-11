//
//
// Shader Model 4
// Fragment Shader
//
// id: 6369 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_alpha_overlay.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*29*/	r4.z = sqrt(r1.w);
/*30*/	r5.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r6.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r7.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*34*/	r3.zw = (r7.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r1.w = r6.w * r7.w;
/*36*/	r6.xyz = (-r2.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r1.wwww * r6.xyzx + r2.xyzx).xyz;
/*38*/	r4.xy = (r3.zwzz * r6.wwww + r3.xyxx).xy;
/*39*/	r2.x = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*40*/	r2.x = inversesqrt(r2.x);
/*41*/	r2.xyz = (r2.xxxx * r4.xyzx).xyz;
/*42*/	r3.xyz = (r1.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*45*/	r4.x = r3.x;
/*46*/	r4.y = cb0.data[26].x * 0.050000 + r3.y;
/*47*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*48*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*49*/	r1.w = saturate(r4.x * 5.000000);
/*50*/	r4.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*51*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*52*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*53*/	r2.w = log2(r3.z);
/*54*/	r2.w = r2.w * 1.800000;
/*55*/	r2.w = exp2(r2.w);
/*56*/	r2.w = r2.w * 10.000000;
/*57*/	r2.w = min(r2.w, 1.000000);
/*58*/	r1.w = r1.w + r2.w;
/*59*/	r1.w = r1.w * 0.500000;
/*60*/	r2.w = -r3.w + 1.000000;
/*61*/	r2.w = log2(r2.w);
/*62*/	r2.w = r2.w * vsOut_T7.z;
/*63*/	r2.w = exp2(r2.w);
/*64*/	r2.w = min(r2.w, 1.000000);
/*65*/	r2.w = r2.w * vsOut_T7.z;
/*66*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*67*/	r3.w = 1.000000;
/*68*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r3.zzzw;
/*69*/	r4.xyzw = r1.wwww * r4.xyzw + r3.zzzw;
/*70*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*71*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*72*/	r1.w = vsOut_T7.z + -0.025000;
/*73*/	r1.w = max(r1.w, 0.000000);
/*74*/	r3.xyzw = -r0.xyzw + r3.xyzw;
/*75*/	r0.xyzw = r1.wwww * r3.xyzw + r0.xyzw;
/*76*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*78*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*79*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*81*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*82*/	r1.w = vsOut_T7.y * -r5.y + r5.y;
/*83*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*84*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*85*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*86*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*87*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*88*/	r2.w = inversesqrt(r2.w);
/*89*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*90*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*91*/	r2.w = inversesqrt(r2.w);
/*92*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*93*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*94*/	r2.w = inversesqrt(r2.w);
/*95*/	r5.yzw = (r2.wwww * vsOut_T2.xxyz).yzw;
/*96*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*97*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.xyxz).xyw;
/*98*/	r2.xyz = (r2.zzzz * r5.yzwy + r2.xywx).xyz;
/*99*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*100*/	r2.w = inversesqrt(r2.w);
/*101*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*102*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*103*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*104*/	r4.x = inversesqrt(r2.w);
/*105*/	r4.xyz = (r3.xyzx * r4.xxxx).xyz;
/*106*/	r4.w = -r5.x + 1.000000;
/*107*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*108*/	r5.z = dot(vec3(r4.xyzx), vec3(r2.xyzx));
/*109*/	r5.z = r5.z + r5.z;
/*110*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.xyzx).xyz;
/*111*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*112*/	r5.z = r4.w * 1.539380;
/*113*/	r5.z = cos((r5.z));
/*114*/	r5.z = inversesqrt(r5.z);
/*115*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*116*/	r5.w = saturate(r1.w * 60.000000);
/*117*/	r5.w = -r1.w + r5.w;
/*118*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*119*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*120*/	r6.w = inversesqrt(r6.w);
/*121*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*122*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*123*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*124*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*125*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*126*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*127*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*128*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*129*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*130*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*131*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*132*/	r6.w = -r1.w + 1.000000;
/*133*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*134*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*135*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*136*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.xyzx));
/*137*/	  r6.w = max(r6.w, 0.000000);
/*138*/	  r6.w = log2(r6.w);
/*139*/	  r6.w = r6.w * 10.000000;
/*140*/	  r6.w = exp2(r6.w);
/*141*/	  r6.w = r5.z * r6.w;
/*142*/	  r6.w = r6.w * r5.w + r1.w;
/*143*/	  r7.y = r4.w * 8.000000;
/*144*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*145*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*146*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*147*/	}
/*148*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*149*/	r2.y = max(r2.x, 0.000000);
/*150*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*151*/	if(floatBitsToUint(r2.x) != 0u) {
/*152*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*153*/	  r2.x = max(r2.x, -1.000000);
/*154*/	  r2.x = min(r2.x, 1.000000);
/*155*/	  r2.z = -abs(r2.x) + 1.000000;
/*156*/	  r2.z = sqrt(r2.z);
/*157*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*158*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*159*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*160*/	  r6.y = r2.z * r6.x;
/*161*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*162*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*163*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*164*/	  r2.x = r6.x * r2.z + r2.x;
/*165*/	  r2.z = r5.x * r5.x;
/*166*/	    r5.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*167*/	  r2.z = r2.z * r5.x + r7.x;
/*168*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*169*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*170*/	  r5.x = -r2.z * r2.z + 1.000000;
/*171*/	  r5.x = max(r5.x, 0.001000);
/*172*/	  r5.x = log2(r5.x);
/*173*/	  r5.y = r5.x * 4.950617;
/*174*/	  r5.x = r5.x * 0.346574 + 4.546885;
/*175*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*176*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*177*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*178*/	  r2.z = floatBitsToInt(r2.z);
/*179*/	  r5.y = r5.x * r5.x + -r5.y;
/*180*/	  r5.y = sqrt(r5.y);
/*181*/	  r5.x = -r5.x + r5.y;
/*182*/	  r5.x = max(r5.x, 0.000000);
/*183*/	  r5.x = sqrt(r5.x);
/*184*/	  r2.z = r2.z * r5.x;
/*185*/	  r2.z = r2.z * 1.414214;
/*186*/	  r2.z = 0.008727 / r2.z;
/*187*/	  r2.z = max(r2.z, 0.000100);
/*188*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*189*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*190*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*191*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*192*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*193*/	  r6.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*194*/	  r6.xy = (r6.xzxx / r6.ywyy).xy;
/*195*/	  r5.xy = (-r5.xyxx * r6.xyxx).xy;
/*196*/	  r6.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xzxx)) * 0xffffffffu)).xy;
/*197*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*198*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.x));
/*199*/	  r2.x = floatBitsToInt(r2.x);
/*200*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*201*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*202*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*203*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*204*/	  r2.x = r2.x * r5.x + 1.000000;
/*205*/	  r2.x = r2.x * 0.500000;
/*206*/	  r2.z = 1 + ~floatBitsToInt(r6.y);
/*207*/	  r2.z = r2.z * r5.y + 1.000000;
/*208*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*209*/	  r2.z = min(r2.y, 1.000000);
/*210*/	  r4.w = r4.w * 1.570796;
/*211*/	  r4.w = sin(r4.w);
/*212*/	  r2.z = r2.z + -1.000000;
/*213*/	  r2.z = r4.w * r2.z + 1.000000;
/*214*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*215*/	  r4.x = max(r4.x, 0.000000);
/*216*/	  r4.x = log2(r4.x);
/*217*/	  r4.x = r4.x * 10.000000;
/*218*/	  r4.x = exp2(r4.x);
/*219*/	  r4.x = r5.z * r4.x;
/*220*/	  r4.x = r4.x * r5.w + r1.w;
/*221*/	  r2.x = r2.z * abs(r2.x);
/*222*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*223*/	} else {
/*224*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*225*/	}
/*226*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*227*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*228*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*229*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*230*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*231*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*232*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*233*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*234*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*235*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*236*/	r1.x = sqrt(r2.w);
/*237*/	r1.y = saturate(cb2.data[0].w)/**/;
/*238*/	r1.y = -r1.y + 1.000000;
/*239*/	r1.y = r1.y * 8.000000 + -4.000000;
/*240*/	r1.z = saturate(cb2.data[1].x)/**/;
/*241*/	r1.z = -r1.z + 1.000000;
/*242*/	r1.z = r1.z * 1000.000000;
/*243*/	r1.x = r1.x / r1.z;
/*244*/	r1.x = r1.x + r1.y;
/*245*/	r1.x = r1.x * 1.442695;
/*246*/	r1.x = exp2(r1.x);
/*247*/	r1.x = cb2.data[1].y / r1.x;
/*248*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*249*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*250*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*251*/	r1.y = r1.y + -cb2.data[1].z;
/*252*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*253*/	r1.y = saturate(r1.z * r1.y);
/*254*/	r1.z = r1.y * -2.000000 + 3.000000;
/*255*/	r1.y = r1.y * r1.y;
/*256*/	r1.y = r1.y * r1.z;
/*257*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*258*/	r1.z = sqrt(r1.z);
/*259*/	r1.w = max(cb2.data[2].z, 0.001000);
/*260*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*261*/	r1.z = r1.w * r1.z;
/*262*/	r1.z = min(r1.z, 1.000000);
/*263*/	r1.w = r1.z * -2.000000 + 3.000000;
/*264*/	r1.z = r1.z * r1.z;
/*265*/	r1.z = r1.z * r1.w;
/*266*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*267*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*268*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*269*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*270*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*271*/	r3.w = max(r3.y, 0.000000);
/*272*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*273*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*274*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*275*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*276*/	r1.x = saturate(r1.x * r1.z);
/*277*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*278*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*279*/	color0.w = r0.w * vsOut_T6.w;
/*280*/	return;
}
