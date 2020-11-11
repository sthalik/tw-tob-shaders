//
//
// Shader Model 4
// Fragment Shader
//
// id: 7077 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_weighted_forward_lighting_gamma_correct_LDR.glsl
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
/*59*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*61*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*62*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*63*/	r0.w = r4.w * r5.w;
/*64*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*65*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*66*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*67*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*70*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*71*/	if(r1.w != 0) discard;
/*72*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*73*/	r3.zw = (r3.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*74*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*75*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*76*/	r1.w = saturate(-r1.w + r4.w);
/*77*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*78*/	if(floatBitsToUint(r1.w) != 0u) {
/*79*/	  r1.w = -r4.w + 1.000000;
/*80*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*81*/	  r1.w = -r1.w + 1.000000;
/*82*/	  r1.w = -r1.w * r1.w + 1.000000;
/*83*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*84*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*85*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*86*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*87*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*88*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*89*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*90*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*91*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*92*/	} else {
/*93*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*94*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*95*/	}
/*96*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*97*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*98*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*99*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*100*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*101*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*102*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*103*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*104*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*105*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*106*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*107*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*108*/	r1.w = inversesqrt(r1.w);
/*109*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*110*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*111*/	r1.w = inversesqrt(r1.w);
/*112*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*113*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*114*/	r1.w = inversesqrt(r1.w);
/*115*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*116*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*117*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*118*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*119*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*120*/	r1.w = inversesqrt(r1.w);
/*121*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*122*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*123*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*124*/	r2.w = inversesqrt(r1.w);
/*125*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*126*/	r2.w = -r3.y + 1.000000;
/*127*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*128*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*129*/	r5.y = r5.y + r5.y;
/*130*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*131*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*132*/	r6.w = r2.w * 1.539380;
/*133*/	r6.w = cos((r6.w));
/*134*/	r6.w = inversesqrt(r6.w);
/*135*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*136*/	r7.x = saturate(r0.w * 60.000000);
/*137*/	r7.x = -r0.w + r7.x;
/*138*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*139*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*140*/	r8.x = inversesqrt(r8.x);
/*141*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*142*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*143*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*144*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*145*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*146*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*147*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*148*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*149*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*150*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*151*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*152*/	r6.y = -r0.w + 1.000000;
/*153*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*154*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*155*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*156*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*157*/	  r6.y = max(r6.y, 0.000000);
/*158*/	  r6.y = log2(r6.y);
/*159*/	  r6.y = r6.y * 10.000000;
/*160*/	  r6.y = exp2(r6.y);
/*161*/	  r6.y = r6.w * r6.y;
/*162*/	  r6.y = r6.y * r7.x + r0.w;
/*163*/	  r8.x = r2.w * 8.000000;
/*164*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*165*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*166*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*167*/	}
/*168*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*169*/	r2.y = max(r2.x, 0.000000);
/*170*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*171*/	if(floatBitsToUint(r2.x) != 0u) {
/*172*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*173*/	  r2.x = max(r2.x, -1.000000);
/*174*/	  r2.x = min(r2.x, 1.000000);
/*175*/	  r2.z = -abs(r2.x) + 1.000000;
/*176*/	  r2.z = sqrt(r2.z);
/*177*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*178*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*179*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*180*/	  r5.z = r2.z * r5.y;
/*181*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*182*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*183*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*184*/	  r2.x = r5.y * r2.z + r2.x;
/*185*/	  r2.z = r3.y * r3.y;
/*186*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*187*/	  r2.z = r2.z * r3.y + r6.x;
/*188*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*189*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*190*/	  r3.y = -r2.z * r2.z + 1.000000;
/*191*/	  r3.y = max(r3.y, 0.001000);
/*192*/	  r3.y = log2(r3.y);
/*193*/	  r5.x = r3.y * 4.950617;
/*194*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*195*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*196*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*197*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*198*/	  r2.z = floatBitsToInt(r2.z);
/*199*/	  r5.x = r3.y * r3.y + -r5.x;
/*200*/	  r5.x = sqrt(r5.x);
/*201*/	  r3.y = -r3.y + r5.x;
/*202*/	  r3.y = max(r3.y, 0.000000);
/*203*/	  r3.y = sqrt(r3.y);
/*204*/	  r2.z = r2.z * r3.y;
/*205*/	  r2.z = r2.z * 1.414214;
/*206*/	  r2.z = 0.008727 / r2.z;
/*207*/	  r2.z = max(r2.z, 0.000100);
/*208*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*209*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*210*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*211*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*212*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*213*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*214*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*215*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*216*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*217*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*218*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*219*/	  r2.x = floatBitsToInt(r2.x);
/*220*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*221*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*222*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*223*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*224*/	  r2.x = r2.x * r5.x + 1.000000;
/*225*/	  r2.x = r2.x * 0.500000;
/*226*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*227*/	  r2.z = r2.z * r5.y + 1.000000;
/*228*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*229*/	  r2.z = min(r2.y, 1.000000);
/*230*/	  r2.w = r2.w * 1.570796;
/*231*/	  r2.w = sin(r2.w);
/*232*/	  r2.z = r2.z + -1.000000;
/*233*/	  r2.z = r2.w * r2.z + 1.000000;
/*234*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*235*/	  r2.w = max(r2.w, 0.000000);
/*236*/	  r2.w = log2(r2.w);
/*237*/	  r2.w = r2.w * 10.000000;
/*238*/	  r2.w = exp2(r2.w);
/*239*/	  r2.w = r6.w * r2.w;
/*240*/	  r2.w = r2.w * r7.x + r0.w;
/*241*/	  r2.x = r2.z * abs(r2.x);
/*242*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*243*/	} else {
/*244*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*245*/	}
/*246*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*247*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*248*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*249*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*250*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*251*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*252*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*253*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*254*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*255*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*256*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*257*/	r2.w = 1.000000;
/*258*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*259*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*260*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*261*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*262*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*263*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*264*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*265*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*266*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*267*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*268*/	if(r0.w != 0) discard;
/*269*/	r0.w = sqrt(r1.w);
/*270*/	r1.x = saturate(cb3.data[0].w)/**/;
/*271*/	r1.x = -r1.x + 1.000000;
/*272*/	r1.x = r1.x * 8.000000 + -4.000000;
/*273*/	r1.y = saturate(cb3.data[1].x)/**/;
/*274*/	r1.y = -r1.y + 1.000000;
/*275*/	r1.y = r1.y * 1000.000000;
/*276*/	r0.w = r0.w / r1.y;
/*277*/	r0.w = r0.w + r1.x;
/*278*/	r0.w = r0.w * 1.442695;
/*279*/	r0.w = exp2(r0.w);
/*280*/	r0.w = cb3.data[1].y / r0.w;
/*281*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*282*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*283*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*284*/	r1.x = r1.x + -cb3.data[1].z;
/*285*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*286*/	r1.x = saturate(r1.y * r1.x);
/*287*/	r1.y = r1.x * -2.000000 + 3.000000;
/*288*/	r1.x = r1.x * r1.x;
/*289*/	r1.x = r1.x * r1.y;
/*290*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*291*/	r1.y = sqrt(r1.y);
/*292*/	r1.z = max(cb3.data[2].z, 0.001000);
/*293*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*294*/	r1.y = r1.z * r1.y;
/*295*/	r1.y = min(r1.y, 1.000000);
/*296*/	r1.z = r1.y * -2.000000 + 3.000000;
/*297*/	r1.y = r1.y * r1.y;
/*298*/	r1.y = r1.y * r1.z;
/*299*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*300*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*301*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*302*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*303*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*304*/	r4.w = max(r4.y, 0.000000);
/*305*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*306*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*307*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*308*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*309*/	r0.w = saturate(r0.w * r1.y);
/*310*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*311*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*312*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*313*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*314*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*315*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*316*/	color0.w = 1.000000;
/*317*/	return;
}
