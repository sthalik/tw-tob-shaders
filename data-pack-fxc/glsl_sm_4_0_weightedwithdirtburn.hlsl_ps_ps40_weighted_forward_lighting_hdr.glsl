//
//
// Shader Model 4
// Fragment Shader
//
// id: 2800 - fxc/glsl_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r3.z = sqrt(r0.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r0.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*42*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*45*/	r5.x = r3.x;
/*46*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*47*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*48*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*49*/	r0.w = saturate(r5.x * 5.000000);
/*50*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*51*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*52*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*53*/	r1.w = log2(r3.z);
/*54*/	r1.w = r1.w * 1.800000;
/*55*/	r1.w = exp2(r1.w);
/*56*/	r1.w = r1.w * 10.000000;
/*57*/	r1.w = min(r1.w, 1.000000);
/*58*/	r0.w = r0.w + r1.w;
/*59*/	r0.w = r0.w * 0.500000;
/*60*/	r1.w = -r3.w + 1.000000;
/*61*/	r1.w = log2(r1.w);
/*62*/	r1.w = r1.w * vsOut_T7.z;
/*63*/	r1.w = exp2(r1.w);
/*64*/	r1.w = min(r1.w, 1.000000);
/*65*/	r1.w = r1.w * vsOut_T7.z;
/*66*/	r2.w = r3.z * 0.250000;
/*67*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*68*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*69*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*70*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*71*/	r0.w = vsOut_T7.z + -0.025000;
/*72*/	r0.w = max(r0.w, 0.000000);
/*73*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*74*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*75*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*77*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*78*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*79*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*80*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*81*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*82*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*83*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*84*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*85*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*89*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*92*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*95*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*96*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*97*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*98*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*101*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*102*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*103*/	r1.w = inversesqrt(r1.w);
/*104*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*105*/	r1.w = -r4.x + 1.000000;
/*106*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*107*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*108*/	r3.w = r3.w + r3.w;
/*109*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*110*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*111*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*112*/	r3.w = cos((r6.x));
/*113*/	r3.w = inversesqrt(r3.w);
/*114*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*115*/	r5.w = saturate(r0.w * 60.000000);
/*116*/	r5.w = -r0.w + r5.w;
/*117*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*118*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*119*/	r7.x = inversesqrt(r7.x);
/*120*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*121*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*122*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*123*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*124*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*125*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*126*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*127*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*128*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*129*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*130*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*131*/	r5.y = -r0.w + 1.000000;
/*132*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*133*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*134*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*135*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*136*/	  r5.y = max(r5.y, 0.000000);
/*137*/	  r5.y = log2(r5.y);
/*138*/	  r5.y = r5.y * 10.000000;
/*139*/	  r5.y = exp2(r5.y);
/*140*/	  r5.y = r3.w * r5.y;
/*141*/	  r5.y = r5.y * r5.w + r0.w;
/*142*/	  r7.x = r1.w * 8.000000;
/*143*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*144*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*145*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*146*/	}
/*147*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*148*/	r7.x = max(r5.y, 0.000000);
/*149*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*150*/	if(floatBitsToUint(r5.y) != 0u) {
/*151*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*152*/	  r4.y = max(r4.y, -1.000000);
/*153*/	  r4.y = min(r4.y, 1.000000);
/*154*/	  r4.z = -abs(r4.y) + 1.000000;
/*155*/	  r4.z = sqrt(r4.z);
/*156*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*157*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*158*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*159*/	  r5.y = r4.z * r4.w;
/*160*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*161*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*162*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*163*/	  r4.y = r4.w * r4.z + r4.y;
/*164*/	  r4.x = r4.x * r4.x;
/*165*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*166*/	  r2.w = r4.x * r2.w + r5.x;
/*167*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*168*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*169*/	  r4.x = -r2.w * r2.w + 1.000000;
/*170*/	  r4.x = max(r4.x, 0.001000);
/*171*/	  r4.x = log2(r4.x);
/*172*/	  r4.z = r4.x * 4.950617;
/*173*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*174*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*175*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*176*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*177*/	  r2.w = floatBitsToInt(r2.w);
/*178*/	  r4.z = r4.x * r4.x + -r4.z;
/*179*/	  r4.z = sqrt(r4.z);
/*180*/	  r4.x = -r4.x + r4.z;
/*181*/	  r4.x = max(r4.x, 0.000000);
/*182*/	  r4.x = sqrt(r4.x);
/*183*/	  r2.w = r2.w * r4.x;
/*184*/	  r2.w = r2.w * 1.414214;
/*185*/	  r2.w = 0.008727 / r2.w;
/*186*/	  r2.w = max(r2.w, 0.000100);
/*187*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*188*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*189*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*190*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*191*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*192*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*193*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*194*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*195*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*196*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*197*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*198*/	  r2.w = floatBitsToInt(r2.w);
/*199*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*200*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*201*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*202*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*203*/	  r2.w = r2.w * r4.x + 1.000000;
/*204*/	  r2.w = r2.w * 0.500000;
/*205*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*206*/	  r4.x = r4.x * r4.y + 1.000000;
/*207*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*208*/	  r4.x = min(r7.x, 1.000000);
/*209*/	  r1.w = r1.w * 1.570796;
/*210*/	  r1.w = sin(r1.w);
/*211*/	  r4.x = r4.x + -1.000000;
/*212*/	  r1.w = r1.w * r4.x + 1.000000;
/*213*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*214*/	  r3.x = max(r3.x, 0.000000);
/*215*/	  r3.x = log2(r3.x);
/*216*/	  r3.x = r3.x * 10.000000;
/*217*/	  r3.x = exp2(r3.x);
/*218*/	  r3.x = r3.w * r3.x;
/*219*/	  r3.x = r3.x * r5.w + r0.w;
/*220*/	  r1.w = r1.w * abs(r2.w);
/*221*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*222*/	} else {
/*223*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*224*/	}
/*225*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*226*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*227*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*228*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*229*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*230*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*231*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*232*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*233*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*234*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*235*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*236*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*237*/	r1.w = inversesqrt(r1.w);
/*238*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*239*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*240*/	r1.w = r1.w + r1.w;
/*241*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*242*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*243*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*244*/	r1.w = max(r1.w, 0.000000);
/*245*/	r1.w = log2(r1.w);
/*246*/	r1.w = r1.w * 10.000000;
/*247*/	r1.w = exp2(r1.w);
/*248*/	r1.w = r3.w * r1.w;
/*249*/	r0.w = r1.w * r5.w + r0.w;
/*250*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*251*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*252*/	color0.w = 2.000000;
/*253*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*254*/	r0.w = 1.000000;
/*255*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*256*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*257*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*258*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*259*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*260*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*261*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*262*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*263*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*264*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*265*/	if(r0.x != 0) discard;
/*266*/	color1.x = 1.000000;
/*267*/	return;
}
