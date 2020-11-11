//
//
// Shader Model 4
// Fragment Shader
//
// id: 2747 - fxc/glsl_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*6*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*7*/	r0.w = saturate(vsOut_P1.w);
/*8*/	r3.xyz = (r3.xyzx + -cb3.data[0].xyzx).xyz;
/*9*/	r3.xyz = (r0.wwww * r3.xyzx + cb3.data[0].xyzx).xyz;
/*10*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*11*/	r2.xyw = (r2.xyxw + -cb3.data[1].xyxz).xyw;
/*12*/	r2.xyw = (r0.wwww * r2.xyxw + cb3.data[1].xyxz).xyw;
/*13*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*14*/	r4.xyz = (r4.xyzx + -cb3.data[2].xyzx).xyz;
/*15*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[2].xyzx).xyz;
/*16*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*19*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*21*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*22*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*23*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*26*/	r0.w = -r0.w + 1.000000;
/*27*/	r0.w = max(r0.w, 0.000000);
/*28*/	r2.z = sqrt(r0.w);
/*29*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*31*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*32*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*33*/	r0.w = r3.w * r4.w;
/*34*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*35*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*36*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*37*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*38*/	r1.x = inversesqrt(r1.x);
/*39*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*40*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*41*/	if(r1.w != 0) discard;
/*42*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*43*/	r2.xy = (r2.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*44*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*45*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*46*/	r1.w = saturate(-r1.w + r2.w);
/*47*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r1.w) != 0u) {
/*49*/	  r1.w = -r2.w + 1.000000;
/*50*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*51*/	  r1.w = -r1.w + 1.000000;
/*52*/	  r1.w = -r1.w * r1.w + 1.000000;
/*53*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*54*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*55*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*56*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*57*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*58*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*59*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*60*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*61*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*62*/	} else {
/*63*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*64*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*65*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*66*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*67*/	}
/*68*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*70*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*71*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*72*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*73*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*74*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*75*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*76*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*77*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*78*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*79*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*82*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*85*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r1.w = inversesqrt(r1.w);
/*87*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*88*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*89*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*90*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*91*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*94*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*95*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*96*/	r1.w = inversesqrt(r1.w);
/*97*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*98*/	r1.w = -r3.x + 1.000000;
/*99*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*100*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*101*/	r4.x = r4.x + r4.x;
/*102*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*103*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*104*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*105*/	r4.w = cos((r6.x));
/*106*/	r4.w = inversesqrt(r4.w);
/*107*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*108*/	r5.w = saturate(r0.w * 60.000000);
/*109*/	r5.w = -r0.w + r5.w;
/*110*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*111*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*112*/	r7.x = inversesqrt(r7.x);
/*113*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*114*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*115*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*116*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*117*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*118*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*119*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*120*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*121*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*122*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*123*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*124*/	r5.y = -r0.w + 1.000000;
/*125*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*126*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*127*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*128*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*129*/	  r5.y = max(r5.y, 0.000000);
/*130*/	  r5.y = log2(r5.y);
/*131*/	  r5.y = r5.y * 10.000000;
/*132*/	  r5.y = exp2(r5.y);
/*133*/	  r5.y = r4.w * r5.y;
/*134*/	  r5.y = r5.y * r5.w + r0.w;
/*135*/	  r7.x = r1.w * 8.000000;
/*136*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*137*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*138*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*139*/	}
/*140*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*141*/	r7.x = max(r5.y, 0.000000);
/*142*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*143*/	if(floatBitsToUint(r5.y) != 0u) {
/*144*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*145*/	  r4.x = max(r4.x, -1.000000);
/*146*/	  r4.x = min(r4.x, 1.000000);
/*147*/	  r4.y = -abs(r4.x) + 1.000000;
/*148*/	  r4.y = sqrt(r4.y);
/*149*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*150*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*151*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*152*/	  r5.y = r4.y * r4.z;
/*153*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*154*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*155*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*156*/	  r4.x = r4.z * r4.y + r4.x;
/*157*/	  r3.x = r3.x * r3.x;
/*158*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*159*/	  r2.w = r3.x * r2.w + r5.x;
/*160*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*161*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*162*/	  r3.x = -r2.w * r2.w + 1.000000;
/*163*/	  r3.x = max(r3.x, 0.001000);
/*164*/	  r3.x = log2(r3.x);
/*165*/	  r4.y = r3.x * 4.950617;
/*166*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*167*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*168*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*169*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*170*/	  r2.w = floatBitsToInt(r2.w);
/*171*/	  r4.y = r3.x * r3.x + -r4.y;
/*172*/	  r4.y = sqrt(r4.y);
/*173*/	  r3.x = -r3.x + r4.y;
/*174*/	  r3.x = max(r3.x, 0.000000);
/*175*/	  r3.x = sqrt(r3.x);
/*176*/	  r2.w = r2.w * r3.x;
/*177*/	  r2.w = r2.w * 1.414214;
/*178*/	  r2.w = 0.008727 / r2.w;
/*179*/	  r2.w = max(r2.w, 0.000100);
/*180*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*181*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*182*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*183*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*184*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*185*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*186*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*187*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*188*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*189*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*190*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*191*/	  r2.w = floatBitsToInt(r2.w);
/*192*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*193*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*194*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*195*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*196*/	  r2.w = r2.w * r4.x + 1.000000;
/*197*/	  r2.w = r2.w * 0.500000;
/*198*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*199*/	  r3.x = r3.x * r4.y + 1.000000;
/*200*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*201*/	  r3.x = min(r7.x, 1.000000);
/*202*/	  r1.w = r1.w * 1.570796;
/*203*/	  r1.w = sin(r1.w);
/*204*/	  r3.x = r3.x + -1.000000;
/*205*/	  r1.w = r1.w * r3.x + 1.000000;
/*206*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*207*/	  r3.x = max(r3.x, 0.000000);
/*208*/	  r3.x = log2(r3.x);
/*209*/	  r3.x = r3.x * 10.000000;
/*210*/	  r3.x = exp2(r3.x);
/*211*/	  r3.x = r4.w * r3.x;
/*212*/	  r3.x = r3.x * r5.w + r0.w;
/*213*/	  r1.w = r1.w * abs(r2.w);
/*214*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*215*/	} else {
/*216*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*217*/	}
/*218*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*219*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*220*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*221*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*222*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*223*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*224*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*225*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*226*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*227*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*228*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*229*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*230*/	r1.w = inversesqrt(r1.w);
/*231*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*232*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*233*/	r1.w = r1.w + r1.w;
/*234*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*235*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*236*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*237*/	r1.x = max(r1.x, 0.000000);
/*238*/	r1.x = log2(r1.x);
/*239*/	r1.x = r1.x * 10.000000;
/*240*/	r1.x = exp2(r1.x);
/*241*/	r1.x = r4.w * r1.x;
/*242*/	r0.w = r1.x * r5.w + r0.w;
/*243*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*244*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*245*/	color0.w = 2.000000;
/*246*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*247*/	r0.w = 1.000000;
/*248*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*249*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*250*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*251*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*252*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*253*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*254*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*255*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*256*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*257*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*258*/	if(r0.x != 0) discard;
/*259*/	color1.x = 1.000000;
/*260*/	return;
}
