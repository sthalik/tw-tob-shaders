//
//
// Shader Model 4
// Fragment Shader
//
// id: 7083 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_weighted_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;

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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r2.z = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*12*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*13*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*14*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*18*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*19*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*20*/	if(floatBitsToUint(r0.w) != 0u) {
/*21*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*22*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*24*/	  r0.w = -r0.w + 1.000000;
/*25*/	  r0.w = max(r0.w, 0.000000);
/*26*/	  r5.z = sqrt(r0.w);
/*27*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*29*/	  r0.w = r3.x * r7.w;
/*30*/	  r3.x = r0.w * -0.500000 + r3.x;
/*31*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*32*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*33*/	  r0.w = -r4.w * r6.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*35*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*36*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*37*/	}
/*38*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*40*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*41*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*42*/	r0.w = r4.w * r5.w;
/*43*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*44*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*45*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*46*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*47*/	r1.w = inversesqrt(r1.w);
/*48*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*49*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*50*/	if(r1.w != 0) discard;
/*51*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*52*/	r3.zw = (r3.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*53*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*54*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*55*/	r1.w = saturate(-r1.w + r4.w);
/*56*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*57*/	if(floatBitsToUint(r1.w) != 0u) {
/*58*/	  r1.w = -r4.w + 1.000000;
/*59*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*60*/	  r1.w = -r1.w + 1.000000;
/*61*/	  r1.w = -r1.w * r1.w + 1.000000;
/*62*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*63*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*64*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*65*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*66*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*67*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*68*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*69*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*70*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*71*/	} else {
/*72*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*73*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*74*/	}
/*75*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*77*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*78*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*79*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*80*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*81*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*82*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*83*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*84*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*85*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*89*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*92*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*95*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*96*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*97*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*98*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*101*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*102*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*103*/	r2.w = inversesqrt(r1.w);
/*104*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*105*/	r2.w = -r3.y + 1.000000;
/*106*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*107*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*108*/	r5.y = r5.y + r5.y;
/*109*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*110*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*111*/	r6.w = r2.w * 1.539380;
/*112*/	r6.w = cos((r6.w));
/*113*/	r6.w = inversesqrt(r6.w);
/*114*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*115*/	r7.x = saturate(r0.w * 60.000000);
/*116*/	r7.x = -r0.w + r7.x;
/*117*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*118*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*119*/	r8.x = inversesqrt(r8.x);
/*120*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*121*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*122*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*123*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*124*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*125*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*126*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*127*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*128*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*129*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*130*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*131*/	r6.y = -r0.w + 1.000000;
/*132*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*133*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*134*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*135*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*136*/	  r6.y = max(r6.y, 0.000000);
/*137*/	  r6.y = log2(r6.y);
/*138*/	  r6.y = r6.y * 10.000000;
/*139*/	  r6.y = exp2(r6.y);
/*140*/	  r6.y = r6.w * r6.y;
/*141*/	  r6.y = r6.y * r7.x + r0.w;
/*142*/	  r8.x = r2.w * 8.000000;
/*143*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*144*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*145*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*146*/	}
/*147*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*148*/	r2.y = max(r2.x, 0.000000);
/*149*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*150*/	if(floatBitsToUint(r2.x) != 0u) {
/*151*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*152*/	  r2.x = max(r2.x, -1.000000);
/*153*/	  r2.x = min(r2.x, 1.000000);
/*154*/	  r2.z = -abs(r2.x) + 1.000000;
/*155*/	  r2.z = sqrt(r2.z);
/*156*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*157*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*158*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*159*/	  r5.z = r2.z * r5.y;
/*160*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*161*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*162*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*163*/	  r2.x = r5.y * r2.z + r2.x;
/*164*/	  r2.z = r3.y * r3.y;
/*165*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*166*/	  r2.z = r2.z * r3.y + r6.x;
/*167*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*168*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*169*/	  r3.y = -r2.z * r2.z + 1.000000;
/*170*/	  r3.y = max(r3.y, 0.001000);
/*171*/	  r3.y = log2(r3.y);
/*172*/	  r5.x = r3.y * 4.950617;
/*173*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*174*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*175*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*176*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*177*/	  r2.z = floatBitsToInt(r2.z);
/*178*/	  r5.x = r3.y * r3.y + -r5.x;
/*179*/	  r5.x = sqrt(r5.x);
/*180*/	  r3.y = -r3.y + r5.x;
/*181*/	  r3.y = max(r3.y, 0.000000);
/*182*/	  r3.y = sqrt(r3.y);
/*183*/	  r2.z = r2.z * r3.y;
/*184*/	  r2.z = r2.z * 1.414214;
/*185*/	  r2.z = 0.008727 / r2.z;
/*186*/	  r2.z = max(r2.z, 0.000100);
/*187*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*188*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*189*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*190*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*191*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*192*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*193*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*194*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*195*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*196*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*197*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*198*/	  r2.x = floatBitsToInt(r2.x);
/*199*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*200*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*201*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*202*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*203*/	  r2.x = r2.x * r5.x + 1.000000;
/*204*/	  r2.x = r2.x * 0.500000;
/*205*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*206*/	  r2.z = r2.z * r5.y + 1.000000;
/*207*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*208*/	  r2.z = min(r2.y, 1.000000);
/*209*/	  r2.w = r2.w * 1.570796;
/*210*/	  r2.w = sin(r2.w);
/*211*/	  r2.z = r2.z + -1.000000;
/*212*/	  r2.z = r2.w * r2.z + 1.000000;
/*213*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*214*/	  r2.w = max(r2.w, 0.000000);
/*215*/	  r2.w = log2(r2.w);
/*216*/	  r2.w = r2.w * 10.000000;
/*217*/	  r2.w = exp2(r2.w);
/*218*/	  r2.w = r6.w * r2.w;
/*219*/	  r2.w = r2.w * r7.x + r0.w;
/*220*/	  r2.x = r2.z * abs(r2.x);
/*221*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*222*/	} else {
/*223*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*224*/	}
/*225*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*226*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*227*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*228*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*229*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*230*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*231*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*232*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*233*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*234*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*235*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*236*/	r2.w = 1.000000;
/*237*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*238*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*239*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*240*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*241*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*242*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*243*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*244*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*245*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*246*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*247*/	if(r0.w != 0) discard;
/*248*/	r0.w = sqrt(r1.w);
/*249*/	r1.x = saturate(cb3.data[0].w)/**/;
/*250*/	r1.x = -r1.x + 1.000000;
/*251*/	r1.x = r1.x * 8.000000 + -4.000000;
/*252*/	r1.y = saturate(cb3.data[1].x)/**/;
/*253*/	r1.y = -r1.y + 1.000000;
/*254*/	r1.y = r1.y * 1000.000000;
/*255*/	r0.w = r0.w / r1.y;
/*256*/	r0.w = r0.w + r1.x;
/*257*/	r0.w = r0.w * 1.442695;
/*258*/	r0.w = exp2(r0.w);
/*259*/	r0.w = cb3.data[1].y / r0.w;
/*260*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*261*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*262*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*263*/	r1.x = r1.x + -cb3.data[1].z;
/*264*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*265*/	r1.x = saturate(r1.y * r1.x);
/*266*/	r1.y = r1.x * -2.000000 + 3.000000;
/*267*/	r1.x = r1.x * r1.x;
/*268*/	r1.x = r1.x * r1.y;
/*269*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*270*/	r1.y = sqrt(r1.y);
/*271*/	r1.z = max(cb3.data[2].z, 0.001000);
/*272*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*273*/	r1.y = r1.z * r1.y;
/*274*/	r1.y = min(r1.y, 1.000000);
/*275*/	r1.z = r1.y * -2.000000 + 3.000000;
/*276*/	r1.y = r1.y * r1.y;
/*277*/	r1.y = r1.y * r1.z;
/*278*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*279*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*280*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*281*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*282*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*283*/	r4.w = max(r4.y, 0.000000);
/*284*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*285*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*286*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*287*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*288*/	r0.w = saturate(r0.w * r1.y);
/*289*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*290*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*291*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*292*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*293*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*294*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*295*/	color0.w = 1.000000;
/*296*/	return;
}
