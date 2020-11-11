//
//
// Shader Model 4
// Fragment Shader
//
// id: 1739 - fxc/glsl_SM_3_0_weightedwithdecal.hlsl_PS_ps30_weighted_forward_lighting_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
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
/*9*/	r4.xyz = (r4.xyzx + -cb5.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb5.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb5.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb5.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb5.data[2].xyzx).xyz;
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
/*29*/	r2.z = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*33*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*34*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*35*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*36*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*37*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*38*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*39*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*40*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*41*/	if(floatBitsToUint(r0.w) != 0u) {
/*42*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*43*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*44*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*45*/	  r0.w = -r0.w + 1.000000;
/*46*/	  r0.w = max(r0.w, 0.000000);
/*47*/	  r5.z = sqrt(r0.w);
/*48*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*50*/	  r0.w = r3.x * r7.w;
/*51*/	  r3.x = r0.w * -0.500000 + r3.x;
/*52*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*53*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*54*/	  r0.w = -r4.w * r6.w + 1.000000;
/*55*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*56*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*57*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*58*/	}
/*59*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*61*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*62*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*64*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*65*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*66*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*67*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*68*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*69*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*70*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*73*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*74*/	r1.w = inversesqrt(r1.w);
/*75*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*76*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*77*/	r1.w = inversesqrt(r1.w);
/*78*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*79*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*80*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*81*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*82*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*85*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*86*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*87*/	r2.w = inversesqrt(r1.w);
/*88*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*89*/	r2.w = -r3.y + 1.000000;
/*90*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*92*/	r5.y = r5.y + r5.y;
/*93*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*94*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*95*/	r6.w = r2.w * 1.539380;
/*96*/	r6.w = cos((r6.w));
/*97*/	r6.w = inversesqrt(r6.w);
/*98*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*99*/	r7.x = saturate(r0.w * 60.000000);
/*100*/	r7.x = -r0.w + r7.x;
/*101*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*102*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*103*/	r8.x = inversesqrt(r8.x);
/*104*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*105*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*106*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*107*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*108*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*109*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*110*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*111*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*112*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*113*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*114*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*115*/	r6.y = -r0.w + 1.000000;
/*116*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*117*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*118*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*119*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*120*/	  r6.y = max(r6.y, 0.000000);
/*121*/	  r6.y = log2(r6.y);
/*122*/	  r6.y = r6.y * 10.000000;
/*123*/	  r6.y = exp2(r6.y);
/*124*/	  r6.y = r6.w * r6.y;
/*125*/	  r6.y = r6.y * r7.x + r0.w;
/*126*/	  r8.x = r2.w * 8.000000;
/*127*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*128*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*129*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*130*/	}
/*131*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*132*/	r2.y = max(r2.x, 0.000000);
/*133*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*134*/	if(floatBitsToUint(r2.x) != 0u) {
/*135*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*136*/	  r2.x = max(r2.x, -1.000000);
/*137*/	  r2.x = min(r2.x, 1.000000);
/*138*/	  r2.z = -abs(r2.x) + 1.000000;
/*139*/	  r2.z = sqrt(r2.z);
/*140*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*141*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*142*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*143*/	  r5.z = r2.z * r5.y;
/*144*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*145*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*146*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*147*/	  r2.x = r5.y * r2.z + r2.x;
/*148*/	  r2.z = r3.y * r3.y;
/*149*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*150*/	  r2.z = r2.z * r3.y + r6.x;
/*151*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*152*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*153*/	  r3.y = -r2.z * r2.z + 1.000000;
/*154*/	  r3.y = max(r3.y, 0.001000);
/*155*/	  r3.y = log2(r3.y);
/*156*/	  r5.x = r3.y * 4.950617;
/*157*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*158*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*159*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*160*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*161*/	  r2.z = floatBitsToInt(r2.z);
/*162*/	  r5.x = r3.y * r3.y + -r5.x;
/*163*/	  r5.x = sqrt(r5.x);
/*164*/	  r3.y = -r3.y + r5.x;
/*165*/	  r3.y = max(r3.y, 0.000000);
/*166*/	  r3.y = sqrt(r3.y);
/*167*/	  r2.z = r2.z * r3.y;
/*168*/	  r2.z = r2.z * 1.414214;
/*169*/	  r2.z = 0.008727 / r2.z;
/*170*/	  r2.z = max(r2.z, 0.000100);
/*171*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*172*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*173*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*174*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*175*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*176*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*177*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*178*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*179*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*180*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*181*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*182*/	  r2.x = floatBitsToInt(r2.x);
/*183*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*184*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*185*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*186*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*187*/	  r2.x = r2.x * r5.x + 1.000000;
/*188*/	  r2.x = r2.x * 0.500000;
/*189*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*190*/	  r2.z = r2.z * r5.y + 1.000000;
/*191*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*192*/	  r2.z = min(r2.y, 1.000000);
/*193*/	  r2.w = r2.w * 1.570796;
/*194*/	  r2.w = sin(r2.w);
/*195*/	  r2.z = r2.z + -1.000000;
/*196*/	  r2.z = r2.w * r2.z + 1.000000;
/*197*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*198*/	  r2.w = max(r2.w, 0.000000);
/*199*/	  r2.w = log2(r2.w);
/*200*/	  r2.w = r2.w * 10.000000;
/*201*/	  r2.w = exp2(r2.w);
/*202*/	  r2.w = r6.w * r2.w;
/*203*/	  r2.w = r2.w * r7.x + r0.w;
/*204*/	  r2.x = r2.z * abs(r2.x);
/*205*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*206*/	} else {
/*207*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*208*/	}
/*209*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*210*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*211*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*212*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*213*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*214*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*215*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*216*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*217*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*218*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*219*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*220*/	r2.w = 1.000000;
/*221*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*222*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*223*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*224*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*225*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*226*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*227*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*228*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*229*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*230*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*231*/	if(r0.w != 0) discard;
/*232*/	r0.w = sqrt(r1.w);
/*233*/	r1.x = saturate(cb3.data[0].w)/**/;
/*234*/	r1.x = -r1.x + 1.000000;
/*235*/	r1.x = r1.x * 8.000000 + -4.000000;
/*236*/	r1.y = saturate(cb3.data[1].x)/**/;
/*237*/	r1.y = -r1.y + 1.000000;
/*238*/	r1.y = r1.y * 1000.000000;
/*239*/	r0.w = r0.w / r1.y;
/*240*/	r0.w = r0.w + r1.x;
/*241*/	r0.w = r0.w * 1.442695;
/*242*/	r0.w = exp2(r0.w);
/*243*/	r0.w = cb3.data[1].y / r0.w;
/*244*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*245*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*246*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*247*/	r1.x = r1.x + -cb3.data[1].z;
/*248*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*249*/	r1.x = saturate(r1.y * r1.x);
/*250*/	r1.y = r1.x * -2.000000 + 3.000000;
/*251*/	r1.x = r1.x * r1.x;
/*252*/	r1.x = r1.x * r1.y;
/*253*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*254*/	r1.y = sqrt(r1.y);
/*255*/	r1.z = max(cb3.data[2].z, 0.001000);
/*256*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*257*/	r1.y = r1.z * r1.y;
/*258*/	r1.y = min(r1.y, 1.000000);
/*259*/	r1.z = r1.y * -2.000000 + 3.000000;
/*260*/	r1.y = r1.y * r1.y;
/*261*/	r1.y = r1.y * r1.z;
/*262*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*263*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*264*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*265*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*266*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*267*/	r4.w = max(r4.y, 0.000000);
/*268*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*269*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*270*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*271*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*272*/	r0.w = saturate(r0.w * r1.y);
/*273*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*274*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*275*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*276*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*277*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*278*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*279*/	color0.w = 1.000000;
/*280*/	return;
}
