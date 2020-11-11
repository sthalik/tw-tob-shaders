//
//
// Shader Model 4
// Fragment Shader
//
// id: 2608 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
/*28*/	r0.w = sqrt(r0.w);
/*29*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*30*/	if(r1.z != 0) discard;
/*31*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*32*/	r1.zw = (r1.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*34*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*35*/	r1.z = saturate(-r1.z + r2.w);
/*36*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r1.z) != 0u) {
/*38*/	  r1.z = -r2.w + 1.000000;
/*39*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*40*/	  r1.z = -r1.z + 1.000000;
/*41*/	  r1.z = -r1.z * r1.z + 1.000000;
/*42*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*43*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*44*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*47*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*48*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*49*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*50*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*51*/	} else {
/*52*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*53*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	}
/*55*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*57*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*58*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*60*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*61*/	r1.z = vsOut_T7.y * -r3.y + r3.y;
/*62*/	r1.z = vsOut_T7.x * -r1.z + r1.z;
/*63*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*64*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*66*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*69*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*72*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*75*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*76*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*77*/	r1.xyw = (r0.wwww * r5.xyxz + r1.xyxw).xyw;
/*78*/	r0.w = dot(vec3(r1.xywx), vec3(r1.xywx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r1.xyw = (r0.wwww * r1.xyxw).xyw;
/*81*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*82*/	r0.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*85*/	r0.w = -r3.x + 1.000000;
/*86*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*87*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xywx));
/*88*/	r4.x = r4.x + r4.x;
/*89*/	r4.xyz = (r1.xywx * -r4.xxxx + r3.yzwy).xyz;
/*90*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*91*/	r6.xy = (r0.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*92*/	r4.w = cos((r6.x));
/*93*/	r4.w = inversesqrt(r4.w);
/*94*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*95*/	r5.w = saturate(r1.z * 60.000000);
/*96*/	r5.w = -r1.z + r5.w;
/*97*/	r6.xzw = (r1.xxyw * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*98*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*99*/	r7.x = inversesqrt(r7.x);
/*100*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*101*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*102*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*103*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*104*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*105*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*106*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*107*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*108*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*109*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*110*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*111*/	r5.y = -r1.z + 1.000000;
/*112*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*113*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*114*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*115*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*116*/	  r5.y = max(r5.y, 0.000000);
/*117*/	  r5.y = log2(r5.y);
/*118*/	  r5.y = r5.y * 10.000000;
/*119*/	  r5.y = exp2(r5.y);
/*120*/	  r5.y = r4.w * r5.y;
/*121*/	  r5.y = r5.y * r5.w + r1.z;
/*122*/	  r7.x = r0.w * 8.000000;
/*123*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*124*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*125*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*126*/	}
/*127*/	r5.y = dot(vec3(r1.xywx), vec3(-cb1.data[0].yzwy));
/*128*/	r7.x = max(r5.y, 0.000000);
/*129*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*130*/	if(floatBitsToUint(r5.y) != 0u) {
/*131*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*132*/	  r4.x = max(r4.x, -1.000000);
/*133*/	  r4.x = min(r4.x, 1.000000);
/*134*/	  r4.y = -abs(r4.x) + 1.000000;
/*135*/	  r4.y = sqrt(r4.y);
/*136*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*137*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*138*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*139*/	  r5.y = r4.y * r4.z;
/*140*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*141*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*142*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*143*/	  r4.x = r4.z * r4.y + r4.x;
/*144*/	  r3.x = r3.x * r3.x;
/*145*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*146*/	  r2.w = r3.x * r2.w + r5.x;
/*147*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*148*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*149*/	  r3.x = -r2.w * r2.w + 1.000000;
/*150*/	  r3.x = max(r3.x, 0.001000);
/*151*/	  r3.x = log2(r3.x);
/*152*/	  r4.y = r3.x * 4.950617;
/*153*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*154*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*155*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*156*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*157*/	  r2.w = floatBitsToInt(r2.w);
/*158*/	  r4.y = r3.x * r3.x + -r4.y;
/*159*/	  r4.y = sqrt(r4.y);
/*160*/	  r3.x = -r3.x + r4.y;
/*161*/	  r3.x = max(r3.x, 0.000000);
/*162*/	  r3.x = sqrt(r3.x);
/*163*/	  r2.w = r2.w * r3.x;
/*164*/	  r2.w = r2.w * 1.414214;
/*165*/	  r2.w = 0.008727 / r2.w;
/*166*/	  r2.w = max(r2.w, 0.000100);
/*167*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*168*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*169*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*170*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*171*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*172*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*173*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*174*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*175*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*176*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*177*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*178*/	  r2.w = floatBitsToInt(r2.w);
/*179*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*180*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*181*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*182*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*183*/	  r2.w = r2.w * r4.x + 1.000000;
/*184*/	  r2.w = r2.w * 0.500000;
/*185*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*186*/	  r3.x = r3.x * r4.y + 1.000000;
/*187*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*188*/	  r3.x = min(r7.x, 1.000000);
/*189*/	  r0.w = r0.w * 1.570796;
/*190*/	  r0.w = sin(r0.w);
/*191*/	  r3.x = r3.x + -1.000000;
/*192*/	  r0.w = r0.w * r3.x + 1.000000;
/*193*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*194*/	  r3.x = max(r3.x, 0.000000);
/*195*/	  r3.x = log2(r3.x);
/*196*/	  r3.x = r3.x * 10.000000;
/*197*/	  r3.x = exp2(r3.x);
/*198*/	  r3.x = r4.w * r3.x;
/*199*/	  r3.x = r3.x * r5.w + r1.z;
/*200*/	  r0.w = r0.w * abs(r2.w);
/*201*/	  r3.xyz = (r3.xxxx * r0.wwww).xyz;
/*202*/	} else {
/*203*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*204*/	}
/*205*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*206*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*207*/	r3.xyz = (max(r1.zzzz, r3.xyzx)).xyz;
/*208*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*209*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*210*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*211*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*212*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*213*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*214*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*215*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*216*/	r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*217*/	r0.w = inversesqrt(r0.w);
/*218*/	r3.xyz = (r0.wwww * r3.xyzx).xyz;
/*219*/	r0.w = dot(vec3(-r3.xyzx), vec3(r1.xywx));
/*220*/	r0.w = r0.w + r0.w;
/*221*/	r1.xyw = (r1.xyxw * -r0.wwww + -r3.xyxz).xyw;
/*222*/	r6.xyzw = (textureLod(s_environment, r1.xywx.stp, r6.y)).xyzw;
/*223*/	r0.w = dot(vec3(r1.xywx), vec3(-r3.xyzx));
/*224*/	r0.w = max(r0.w, 0.000000);
/*225*/	r0.w = log2(r0.w);
/*226*/	r0.w = r0.w * 10.000000;
/*227*/	r0.w = exp2(r0.w);
/*228*/	r0.w = r4.w * r0.w;
/*229*/	r0.w = r0.w * r5.w + r1.z;
/*230*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*231*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*232*/	color0.w = 2.000000;
/*233*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*234*/	r0.w = 1.000000;
/*235*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*236*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*237*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*238*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*239*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*240*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*241*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*242*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*243*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*244*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*245*/	if(r0.x != 0) discard;
/*246*/	color1.x = 1.000000;
/*247*/	return;
}
