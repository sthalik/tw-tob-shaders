//
//
// Shader Model 4
// Fragment Shader
//
// id: 7079 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_weighted_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_decal_blood_map;
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb5.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb5.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb5.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb5.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb5.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r2.z = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*30*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*31*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*32*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*33*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*34*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*35*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*36*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*38*/	if(floatBitsToUint(r0.w) != 0u) {
/*39*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*40*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*41*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*42*/	  r0.w = -r0.w + 1.000000;
/*43*/	  r0.w = max(r0.w, 0.000000);
/*44*/	  r5.z = sqrt(r0.w);
/*45*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*47*/	  r0.w = r3.x * r7.w;
/*48*/	  r3.x = r0.w * -0.500000 + r3.x;
/*49*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*50*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*51*/	  r0.w = -r4.w * r6.w + 1.000000;
/*52*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*53*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*54*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*55*/	}
/*56*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*57*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*58*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*59*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*60*/	r0.w = r4.w * r5.w;
/*61*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*62*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*63*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*64*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*67*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*68*/	if(r1.w != 0) discard;
/*69*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*70*/	r3.zw = (r3.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*71*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*72*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*73*/	r1.w = saturate(-r1.w + r4.w);
/*74*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*75*/	if(floatBitsToUint(r1.w) != 0u) {
/*76*/	  r1.w = -r4.w + 1.000000;
/*77*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*78*/	  r1.w = -r1.w + 1.000000;
/*79*/	  r1.w = -r1.w * r1.w + 1.000000;
/*80*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*81*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*82*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*83*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*84*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*85*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*86*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*87*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*88*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*89*/	} else {
/*90*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*91*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*92*/	}
/*93*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*94*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*95*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*96*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*97*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*98*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*99*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*100*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*101*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*102*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*103*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*104*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*105*/	r1.w = inversesqrt(r1.w);
/*106*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*107*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*108*/	r1.w = inversesqrt(r1.w);
/*109*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*110*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*111*/	r1.w = inversesqrt(r1.w);
/*112*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*113*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*114*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*115*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*116*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*117*/	r1.w = inversesqrt(r1.w);
/*118*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*119*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*120*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*121*/	r2.w = inversesqrt(r1.w);
/*122*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*123*/	r2.w = -r3.y + 1.000000;
/*124*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*125*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*126*/	r5.y = r5.y + r5.y;
/*127*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*128*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*129*/	r6.w = r2.w * 1.539380;
/*130*/	r6.w = cos((r6.w));
/*131*/	r6.w = inversesqrt(r6.w);
/*132*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*133*/	r7.x = saturate(r0.w * 60.000000);
/*134*/	r7.x = -r0.w + r7.x;
/*135*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*136*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*137*/	r8.x = inversesqrt(r8.x);
/*138*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*139*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*140*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*141*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*142*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*143*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*144*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*145*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*146*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*147*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*148*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*149*/	r6.y = -r0.w + 1.000000;
/*150*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*151*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*152*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*153*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*154*/	  r6.y = max(r6.y, 0.000000);
/*155*/	  r6.y = log2(r6.y);
/*156*/	  r6.y = r6.y * 10.000000;
/*157*/	  r6.y = exp2(r6.y);
/*158*/	  r6.y = r6.w * r6.y;
/*159*/	  r6.y = r6.y * r7.x + r0.w;
/*160*/	  r8.x = r2.w * 8.000000;
/*161*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*162*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*163*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*164*/	}
/*165*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*166*/	r2.y = max(r2.x, 0.000000);
/*167*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*168*/	if(floatBitsToUint(r2.x) != 0u) {
/*169*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*170*/	  r2.x = max(r2.x, -1.000000);
/*171*/	  r2.x = min(r2.x, 1.000000);
/*172*/	  r2.z = -abs(r2.x) + 1.000000;
/*173*/	  r2.z = sqrt(r2.z);
/*174*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*175*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*176*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*177*/	  r5.z = r2.z * r5.y;
/*178*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*179*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*180*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*181*/	  r2.x = r5.y * r2.z + r2.x;
/*182*/	  r2.z = r3.y * r3.y;
/*183*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*184*/	  r2.z = r2.z * r3.y + r6.x;
/*185*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*186*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*187*/	  r3.y = -r2.z * r2.z + 1.000000;
/*188*/	  r3.y = max(r3.y, 0.001000);
/*189*/	  r3.y = log2(r3.y);
/*190*/	  r5.x = r3.y * 4.950617;
/*191*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*192*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*193*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*194*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*195*/	  r2.z = floatBitsToInt(r2.z);
/*196*/	  r5.x = r3.y * r3.y + -r5.x;
/*197*/	  r5.x = sqrt(r5.x);
/*198*/	  r3.y = -r3.y + r5.x;
/*199*/	  r3.y = max(r3.y, 0.000000);
/*200*/	  r3.y = sqrt(r3.y);
/*201*/	  r2.z = r2.z * r3.y;
/*202*/	  r2.z = r2.z * 1.414214;
/*203*/	  r2.z = 0.008727 / r2.z;
/*204*/	  r2.z = max(r2.z, 0.000100);
/*205*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*206*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*207*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*208*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*209*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*210*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*211*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*212*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*213*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*214*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*215*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*216*/	  r2.x = floatBitsToInt(r2.x);
/*217*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*218*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*219*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*220*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*221*/	  r2.x = r2.x * r5.x + 1.000000;
/*222*/	  r2.x = r2.x * 0.500000;
/*223*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*224*/	  r2.z = r2.z * r5.y + 1.000000;
/*225*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*226*/	  r2.z = min(r2.y, 1.000000);
/*227*/	  r2.w = r2.w * 1.570796;
/*228*/	  r2.w = sin(r2.w);
/*229*/	  r2.z = r2.z + -1.000000;
/*230*/	  r2.z = r2.w * r2.z + 1.000000;
/*231*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*232*/	  r2.w = max(r2.w, 0.000000);
/*233*/	  r2.w = log2(r2.w);
/*234*/	  r2.w = r2.w * 10.000000;
/*235*/	  r2.w = exp2(r2.w);
/*236*/	  r2.w = r6.w * r2.w;
/*237*/	  r2.w = r2.w * r7.x + r0.w;
/*238*/	  r2.x = r2.z * abs(r2.x);
/*239*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*240*/	} else {
/*241*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*242*/	}
/*243*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*244*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*245*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*246*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*247*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*248*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*249*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*250*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*251*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*252*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*253*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*254*/	r2.w = 1.000000;
/*255*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*256*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*257*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*258*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*259*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*260*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*261*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*262*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*263*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*264*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*265*/	if(r0.w != 0) discard;
/*266*/	r0.w = sqrt(r1.w);
/*267*/	r1.x = saturate(cb3.data[0].w)/**/;
/*268*/	r1.x = -r1.x + 1.000000;
/*269*/	r1.x = r1.x * 8.000000 + -4.000000;
/*270*/	r1.y = saturate(cb3.data[1].x)/**/;
/*271*/	r1.y = -r1.y + 1.000000;
/*272*/	r1.y = r1.y * 1000.000000;
/*273*/	r0.w = r0.w / r1.y;
/*274*/	r0.w = r0.w + r1.x;
/*275*/	r0.w = r0.w * 1.442695;
/*276*/	r0.w = exp2(r0.w);
/*277*/	r0.w = cb3.data[1].y / r0.w;
/*278*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*279*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*280*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*281*/	r1.x = r1.x + -cb3.data[1].z;
/*282*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*283*/	r1.x = saturate(r1.y * r1.x);
/*284*/	r1.y = r1.x * -2.000000 + 3.000000;
/*285*/	r1.x = r1.x * r1.x;
/*286*/	r1.x = r1.x * r1.y;
/*287*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*288*/	r1.y = sqrt(r1.y);
/*289*/	r1.z = max(cb3.data[2].z, 0.001000);
/*290*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*291*/	r1.y = r1.z * r1.y;
/*292*/	r1.y = min(r1.y, 1.000000);
/*293*/	r1.z = r1.y * -2.000000 + 3.000000;
/*294*/	r1.y = r1.y * r1.y;
/*295*/	r1.y = r1.y * r1.z;
/*296*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*297*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*298*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*299*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*300*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*301*/	r4.w = max(r4.y, 0.000000);
/*302*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*303*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*304*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*305*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*306*/	r0.w = saturate(r0.w * r1.y);
/*307*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*308*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*309*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*310*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*311*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*312*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*313*/	color0.w = 1.000000;
/*314*/	return;
}
