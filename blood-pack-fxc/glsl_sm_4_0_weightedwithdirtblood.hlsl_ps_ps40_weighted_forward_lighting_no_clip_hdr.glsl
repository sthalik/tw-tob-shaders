//
//
// Shader Model 4
// Fragment Shader
//
// id: 2749 - fxc/glsl_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*3*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*4*/	r0.w = saturate(vsOut_P1.w);
/*5*/	r3.xyz = (r3.xyzx + -cb3.data[0].xyzx).xyz;
/*6*/	r3.xyz = (r0.wwww * r3.xyzx + cb3.data[0].xyzx).xyz;
/*7*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*8*/	r2.xyw = (r2.xyxw + -cb3.data[1].xyxz).xyw;
/*9*/	r2.xyw = (r0.wwww * r2.xyxw + cb3.data[1].xyxz).xyw;
/*10*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*11*/	r4.xyz = (r4.xyzx + -cb3.data[2].xyzx).xyz;
/*12*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[2].xyzx).xyz;
/*13*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*14*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*18*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*19*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*21*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*23*/	r0.w = -r0.w + 1.000000;
/*24*/	r0.w = max(r0.w, 0.000000);
/*25*/	r2.z = sqrt(r0.w);
/*26*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*27*/	r1.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*28*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*29*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*30*/	r0.w = r3.w * r4.w;
/*31*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*32*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*33*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*34*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*35*/	r1.x = inversesqrt(r1.x);
/*36*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*37*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*38*/	if(r1.w != 0) discard;
/*39*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*40*/	r2.xy = (r2.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*41*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*42*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*43*/	r1.w = saturate(-r1.w + r2.w);
/*44*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*45*/	if(floatBitsToUint(r1.w) != 0u) {
/*46*/	  r1.w = -r2.w + 1.000000;
/*47*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*48*/	  r1.w = -r1.w + 1.000000;
/*49*/	  r1.w = -r1.w * r1.w + 1.000000;
/*50*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*51*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*52*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*53*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*54*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*55*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*56*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*57*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*58*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*59*/	} else {
/*60*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*63*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*64*/	}
/*65*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*67*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*68*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*70*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*71*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*72*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*73*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*74*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*75*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*76*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*79*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*82*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*85*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*86*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*87*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*88*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*89*/	r1.w = inversesqrt(r1.w);
/*90*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*91*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*92*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*95*/	r1.w = -r3.x + 1.000000;
/*96*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*97*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*98*/	r4.x = r4.x + r4.x;
/*99*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*100*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*101*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*102*/	r4.w = cos((r6.x));
/*103*/	r4.w = inversesqrt(r4.w);
/*104*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*105*/	r5.w = saturate(r0.w * 60.000000);
/*106*/	r5.w = -r0.w + r5.w;
/*107*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*108*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*109*/	r7.x = inversesqrt(r7.x);
/*110*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*111*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*112*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*113*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*114*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*115*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*116*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*117*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*118*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*119*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*120*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*121*/	r5.y = -r0.w + 1.000000;
/*122*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*123*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*124*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*125*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*126*/	  r5.y = max(r5.y, 0.000000);
/*127*/	  r5.y = log2(r5.y);
/*128*/	  r5.y = r5.y * 10.000000;
/*129*/	  r5.y = exp2(r5.y);
/*130*/	  r5.y = r4.w * r5.y;
/*131*/	  r5.y = r5.y * r5.w + r0.w;
/*132*/	  r7.x = r1.w * 8.000000;
/*133*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*134*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*135*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*136*/	}
/*137*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*138*/	r7.x = max(r5.y, 0.000000);
/*139*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*140*/	if(floatBitsToUint(r5.y) != 0u) {
/*141*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*142*/	  r4.x = max(r4.x, -1.000000);
/*143*/	  r4.x = min(r4.x, 1.000000);
/*144*/	  r4.y = -abs(r4.x) + 1.000000;
/*145*/	  r4.y = sqrt(r4.y);
/*146*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*147*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*148*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*149*/	  r5.y = r4.y * r4.z;
/*150*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*151*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*152*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*153*/	  r4.x = r4.z * r4.y + r4.x;
/*154*/	  r3.x = r3.x * r3.x;
/*155*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*156*/	  r2.w = r3.x * r2.w + r5.x;
/*157*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*158*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*159*/	  r3.x = -r2.w * r2.w + 1.000000;
/*160*/	  r3.x = max(r3.x, 0.001000);
/*161*/	  r3.x = log2(r3.x);
/*162*/	  r4.y = r3.x * 4.950617;
/*163*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*164*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*165*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*166*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*167*/	  r2.w = floatBitsToInt(r2.w);
/*168*/	  r4.y = r3.x * r3.x + -r4.y;
/*169*/	  r4.y = sqrt(r4.y);
/*170*/	  r3.x = -r3.x + r4.y;
/*171*/	  r3.x = max(r3.x, 0.000000);
/*172*/	  r3.x = sqrt(r3.x);
/*173*/	  r2.w = r2.w * r3.x;
/*174*/	  r2.w = r2.w * 1.414214;
/*175*/	  r2.w = 0.008727 / r2.w;
/*176*/	  r2.w = max(r2.w, 0.000100);
/*177*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*178*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*179*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*180*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*181*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*182*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*183*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*184*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*185*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*186*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*187*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*188*/	  r2.w = floatBitsToInt(r2.w);
/*189*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*190*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*191*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*192*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*193*/	  r2.w = r2.w * r4.x + 1.000000;
/*194*/	  r2.w = r2.w * 0.500000;
/*195*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*196*/	  r3.x = r3.x * r4.y + 1.000000;
/*197*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*198*/	  r3.x = min(r7.x, 1.000000);
/*199*/	  r1.w = r1.w * 1.570796;
/*200*/	  r1.w = sin(r1.w);
/*201*/	  r3.x = r3.x + -1.000000;
/*202*/	  r1.w = r1.w * r3.x + 1.000000;
/*203*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*204*/	  r3.x = max(r3.x, 0.000000);
/*205*/	  r3.x = log2(r3.x);
/*206*/	  r3.x = r3.x * 10.000000;
/*207*/	  r3.x = exp2(r3.x);
/*208*/	  r3.x = r4.w * r3.x;
/*209*/	  r3.x = r3.x * r5.w + r0.w;
/*210*/	  r1.w = r1.w * abs(r2.w);
/*211*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*212*/	} else {
/*213*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*214*/	}
/*215*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*216*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*217*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*218*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*219*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*220*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*221*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*222*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*223*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*224*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*225*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*226*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*227*/	r1.w = inversesqrt(r1.w);
/*228*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*229*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*230*/	r1.w = r1.w + r1.w;
/*231*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*232*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*233*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*234*/	r1.x = max(r1.x, 0.000000);
/*235*/	r1.x = log2(r1.x);
/*236*/	r1.x = r1.x * 10.000000;
/*237*/	r1.x = exp2(r1.x);
/*238*/	r1.x = r4.w * r1.x;
/*239*/	r0.w = r1.x * r5.w + r0.w;
/*240*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*241*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*242*/	color0.w = 2.000000;
/*243*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*244*/	r0.w = 1.000000;
/*245*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*246*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*247*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*248*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*249*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*250*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*251*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*252*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*253*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*254*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*255*/	if(r0.x != 0) discard;
/*256*/	color1.x = 1.000000;
/*257*/	return;
}
