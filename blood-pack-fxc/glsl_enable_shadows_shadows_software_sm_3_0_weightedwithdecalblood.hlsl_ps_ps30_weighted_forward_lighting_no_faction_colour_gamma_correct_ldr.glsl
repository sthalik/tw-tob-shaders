//
//
// Shader Model 4
// Fragment Shader
//
// id: 6938 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_weighted_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
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
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r2.z = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*15*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*17*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*20*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*22*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*23*/	if(floatBitsToUint(r0.w) != 0u) {
/*24*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*27*/	  r0.w = -r0.w + 1.000000;
/*28*/	  r0.w = max(r0.w, 0.000000);
/*29*/	  r5.z = sqrt(r0.w);
/*30*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*32*/	  r0.w = r3.x * r7.w;
/*33*/	  r3.x = r0.w * -0.500000 + r3.x;
/*34*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*35*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*36*/	  r0.w = -r4.w * r6.w + 1.000000;
/*37*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*38*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*39*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*40*/	}
/*41*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*42*/	if(r0.w != 0) discard;
/*43*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*44*/	r3.zw = (r3.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*45*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*46*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*47*/	r0.w = saturate(-r0.w + r4.w);
/*48*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*49*/	if(floatBitsToUint(r0.w) != 0u) {
/*50*/	  r0.w = -r4.w + 1.000000;
/*51*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*52*/	  r0.w = -r0.w + 1.000000;
/*53*/	  r0.w = -r0.w * r0.w + 1.000000;
/*54*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*55*/	  r4.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*56*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*57*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*58*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*59*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*60*/	  r0.xyz = (r0.wwww * r5.xyzx + r4.xyzx).xyz;
/*61*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*62*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*63*/	}
/*64*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*65*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*66*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*67*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*68*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*69*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*70*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*71*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*72*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*73*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*74*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*75*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*78*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*81*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*82*/	r1.w = inversesqrt(r1.w);
/*83*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*84*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*85*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*86*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*87*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*90*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*91*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*92*/	r2.w = inversesqrt(r1.w);
/*93*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*94*/	r2.w = -r3.y + 1.000000;
/*95*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*96*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*97*/	r5.y = r5.y + r5.y;
/*98*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*99*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*100*/	r6.w = r2.w * 1.539380;
/*101*/	r6.w = cos((r6.w));
/*102*/	r6.w = inversesqrt(r6.w);
/*103*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*104*/	r7.x = saturate(r0.w * 60.000000);
/*105*/	r7.x = -r0.w + r7.x;
/*106*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*107*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*108*/	r8.x = inversesqrt(r8.x);
/*109*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*110*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*111*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*112*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*113*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*114*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*115*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*116*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*117*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*118*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*119*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*120*/	r6.y = -r0.w + 1.000000;
/*121*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*122*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*123*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*124*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*125*/	  r6.y = max(r6.y, 0.000000);
/*126*/	  r6.y = log2(r6.y);
/*127*/	  r6.y = r6.y * 10.000000;
/*128*/	  r6.y = exp2(r6.y);
/*129*/	  r6.y = r6.w * r6.y;
/*130*/	  r6.y = r6.y * r7.x + r0.w;
/*131*/	  r8.x = r2.w * 8.000000;
/*132*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*133*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*134*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*135*/	}
/*136*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*137*/	r2.y = max(r2.x, 0.000000);
/*138*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*139*/	if(floatBitsToUint(r2.x) != 0u) {
/*140*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*141*/	  r2.x = max(r2.x, -1.000000);
/*142*/	  r2.x = min(r2.x, 1.000000);
/*143*/	  r2.z = -abs(r2.x) + 1.000000;
/*144*/	  r2.z = sqrt(r2.z);
/*145*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*146*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*147*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*148*/	  r5.z = r2.z * r5.y;
/*149*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*150*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*151*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*152*/	  r2.x = r5.y * r2.z + r2.x;
/*153*/	  r2.z = r3.y * r3.y;
/*154*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*155*/	  r2.z = r2.z * r3.y + r6.x;
/*156*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*157*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*158*/	  r3.y = -r2.z * r2.z + 1.000000;
/*159*/	  r3.y = max(r3.y, 0.001000);
/*160*/	  r3.y = log2(r3.y);
/*161*/	  r5.x = r3.y * 4.950617;
/*162*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*163*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*164*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*165*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*166*/	  r2.z = floatBitsToInt(r2.z);
/*167*/	  r5.x = r3.y * r3.y + -r5.x;
/*168*/	  r5.x = sqrt(r5.x);
/*169*/	  r3.y = -r3.y + r5.x;
/*170*/	  r3.y = max(r3.y, 0.000000);
/*171*/	  r3.y = sqrt(r3.y);
/*172*/	  r2.z = r2.z * r3.y;
/*173*/	  r2.z = r2.z * 1.414214;
/*174*/	  r2.z = 0.008727 / r2.z;
/*175*/	  r2.z = max(r2.z, 0.000100);
/*176*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*177*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*178*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*179*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*180*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*181*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*182*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*183*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*184*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*185*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*186*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*187*/	  r2.x = floatBitsToInt(r2.x);
/*188*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*189*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*190*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*191*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*192*/	  r2.x = r2.x * r5.x + 1.000000;
/*193*/	  r2.x = r2.x * 0.500000;
/*194*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*195*/	  r2.z = r2.z * r5.y + 1.000000;
/*196*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*197*/	  r2.z = min(r2.y, 1.000000);
/*198*/	  r2.w = r2.w * 1.570796;
/*199*/	  r2.w = sin(r2.w);
/*200*/	  r2.z = r2.z + -1.000000;
/*201*/	  r2.z = r2.w * r2.z + 1.000000;
/*202*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*203*/	  r2.w = max(r2.w, 0.000000);
/*204*/	  r2.w = log2(r2.w);
/*205*/	  r2.w = r2.w * 10.000000;
/*206*/	  r2.w = exp2(r2.w);
/*207*/	  r2.w = r6.w * r2.w;
/*208*/	  r2.w = r2.w * r7.x + r0.w;
/*209*/	  r2.x = r2.z * abs(r2.x);
/*210*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*211*/	} else {
/*212*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*213*/	}
/*214*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*215*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*216*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*217*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*218*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*219*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*220*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*221*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*222*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*223*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*224*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*225*/	r2.w = 1.000000;
/*226*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*227*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*228*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*229*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*230*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*231*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*232*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*233*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*234*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*235*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*236*/	if(r0.w != 0) discard;
/*237*/	r0.w = sqrt(r1.w);
/*238*/	r1.x = saturate(cb3.data[0].w)/**/;
/*239*/	r1.x = -r1.x + 1.000000;
/*240*/	r1.x = r1.x * 8.000000 + -4.000000;
/*241*/	r1.y = saturate(cb3.data[1].x)/**/;
/*242*/	r1.y = -r1.y + 1.000000;
/*243*/	r1.y = r1.y * 1000.000000;
/*244*/	r0.w = r0.w / r1.y;
/*245*/	r0.w = r0.w + r1.x;
/*246*/	r0.w = r0.w * 1.442695;
/*247*/	r0.w = exp2(r0.w);
/*248*/	r0.w = cb3.data[1].y / r0.w;
/*249*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*250*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*251*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*252*/	r1.x = r1.x + -cb3.data[1].z;
/*253*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*254*/	r1.x = saturate(r1.y * r1.x);
/*255*/	r1.y = r1.x * -2.000000 + 3.000000;
/*256*/	r1.x = r1.x * r1.x;
/*257*/	r1.x = r1.x * r1.y;
/*258*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*259*/	r1.y = sqrt(r1.y);
/*260*/	r1.z = max(cb3.data[2].z, 0.001000);
/*261*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*262*/	r1.y = r1.z * r1.y;
/*263*/	r1.y = min(r1.y, 1.000000);
/*264*/	r1.z = r1.y * -2.000000 + 3.000000;
/*265*/	r1.y = r1.y * r1.y;
/*266*/	r1.y = r1.y * r1.z;
/*267*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*268*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*269*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*270*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*271*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*272*/	r4.w = max(r4.y, 0.000000);
/*273*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*274*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*275*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*276*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*277*/	r0.w = saturate(r0.w * r1.y);
/*278*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*279*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*280*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*281*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*282*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*283*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*284*/	color0.w = 1.000000;
/*285*/	return;
}
