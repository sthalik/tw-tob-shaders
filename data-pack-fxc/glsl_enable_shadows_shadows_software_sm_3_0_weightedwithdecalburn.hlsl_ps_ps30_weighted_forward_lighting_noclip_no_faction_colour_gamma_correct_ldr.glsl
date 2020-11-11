//
//
// Shader Model 4
// Fragment Shader
//
// id: 6998 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalburn.hlsl_PS_ps30_weighted_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
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
/*38*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*39*/	r4.x = r3.z;
/*40*/	r4.y = cb1.data[26].x * 0.050000 + r3.w;
/*41*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*42*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*43*/	r0.w = saturate(r4.x * 5.000000);
/*44*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*45*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*46*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*47*/	r1.w = log2(r5.z);
/*48*/	r1.w = r1.w * 1.800000;
/*49*/	r1.w = exp2(r1.w);
/*50*/	r1.w = r1.w * 10.000000;
/*51*/	r1.w = min(r1.w, 1.000000);
/*52*/	r0.w = r0.w + r1.w;
/*53*/	r0.w = r0.w * 0.500000;
/*54*/	r1.w = -r5.w + 1.000000;
/*55*/	r1.w = log2(r1.w);
/*56*/	r1.w = r1.w * vsOut_T7.z;
/*57*/	r1.w = exp2(r1.w);
/*58*/	r1.w = min(r1.w, 1.000000);
/*59*/	r1.w = r1.w * vsOut_T7.z;
/*60*/	r2.w = r5.z * 0.250000;
/*61*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*62*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*63*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*64*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*65*/	r0.w = vsOut_T7.z + -0.025000;
/*66*/	r0.w = max(r0.w, 0.000000);
/*67*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*68*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*69*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*70*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*71*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*72*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*74*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*75*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*76*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*77*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*78*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*79*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*80*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*83*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*89*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*90*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*91*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*92*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*95*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*96*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*97*/	r2.w = inversesqrt(r1.w);
/*98*/	r3.xzw = (r2.wwww * r4.xxyz).xzw;
/*99*/	r2.w = -r3.y + 1.000000;
/*100*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*101*/	r5.y = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*102*/	r5.y = r5.y + r5.y;
/*103*/	r5.yzw = (r2.xxyz * -r5.yyyy + r3.xxzw).yzw;
/*104*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*105*/	r6.w = r2.w * 1.539380;
/*106*/	r6.w = cos((r6.w));
/*107*/	r6.w = inversesqrt(r6.w);
/*108*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*109*/	r7.x = saturate(r0.w * 60.000000);
/*110*/	r7.x = -r0.w + r7.x;
/*111*/	r7.yzw = (r2.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*112*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*113*/	r8.x = inversesqrt(r8.x);
/*114*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*115*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*116*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*117*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*118*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*119*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*120*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*121*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*122*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*123*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*124*/	r7.yzw = (r0.xxyz * r7.yyzw).yzw;
/*125*/	r6.y = -r0.w + 1.000000;
/*126*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*127*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*128*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*129*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.xzwx));
/*130*/	  r6.y = max(r6.y, 0.000000);
/*131*/	  r6.y = log2(r6.y);
/*132*/	  r6.y = r6.y * 10.000000;
/*133*/	  r6.y = exp2(r6.y);
/*134*/	  r6.y = r6.w * r6.y;
/*135*/	  r6.y = r6.y * r7.x + r0.w;
/*136*/	  r8.x = r2.w * 8.000000;
/*137*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*138*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*139*/	  r7.yzw = (r8.xxyz * r1.xxyz + r7.yyzw).yzw;
/*140*/	}
/*141*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*142*/	r2.y = max(r2.x, 0.000000);
/*143*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*144*/	if(floatBitsToUint(r2.x) != 0u) {
/*145*/	  r2.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*146*/	  r2.x = max(r2.x, -1.000000);
/*147*/	  r2.x = min(r2.x, 1.000000);
/*148*/	  r2.z = -abs(r2.x) + 1.000000;
/*149*/	  r2.z = sqrt(r2.z);
/*150*/	  r5.y = abs(r2.x) * -0.018729 + 0.074261;
/*151*/	  r5.y = r5.y * abs(r2.x) + -0.212114;
/*152*/	  r5.y = r5.y * abs(r2.x) + 1.570729;
/*153*/	  r5.z = r2.z * r5.y;
/*154*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*155*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*156*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r5.z));
/*157*/	  r2.x = r5.y * r2.z + r2.x;
/*158*/	  r2.z = r3.y * r3.y;
/*159*/	    r3.y = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*160*/	  r2.z = r2.z * r3.y + r6.x;
/*161*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*162*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*163*/	  r3.y = -r2.z * r2.z + 1.000000;
/*164*/	  r3.y = max(r3.y, 0.001000);
/*165*/	  r3.y = log2(r3.y);
/*166*/	  r5.x = r3.y * 4.950617;
/*167*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*168*/	  r5.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*169*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*170*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r2.z));
/*171*/	  r2.z = floatBitsToInt(r2.z);
/*172*/	  r5.x = r3.y * r3.y + -r5.x;
/*173*/	  r5.x = sqrt(r5.x);
/*174*/	  r3.y = -r3.y + r5.x;
/*175*/	  r3.y = max(r3.y, 0.000000);
/*176*/	  r3.y = sqrt(r3.y);
/*177*/	  r2.z = r2.z * r3.y;
/*178*/	  r2.z = r2.z * 1.414214;
/*179*/	  r2.z = 0.008727 / r2.z;
/*180*/	  r2.z = max(r2.z, 0.000100);
/*181*/	  r5.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*182*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*183*/	  r2.xz = (r2.xxxx * r5.xxyx).xz;
/*184*/	  r5.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*185*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*186*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*187*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*188*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*189*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*190*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*191*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r2.x));
/*192*/	  r2.x = floatBitsToInt(r2.x);
/*193*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*194*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*195*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*196*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*197*/	  r2.x = r2.x * r5.x + 1.000000;
/*198*/	  r2.x = r2.x * 0.500000;
/*199*/	  r2.z = 1 + ~floatBitsToInt(r5.w);
/*200*/	  r2.z = r2.z * r5.y + 1.000000;
/*201*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*202*/	  r2.z = min(r2.y, 1.000000);
/*203*/	  r2.w = r2.w * 1.570796;
/*204*/	  r2.w = sin(r2.w);
/*205*/	  r2.z = r2.z + -1.000000;
/*206*/	  r2.z = r2.w * r2.z + 1.000000;
/*207*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.xzwx));
/*208*/	  r2.w = max(r2.w, 0.000000);
/*209*/	  r2.w = log2(r2.w);
/*210*/	  r2.w = r2.w * 10.000000;
/*211*/	  r2.w = exp2(r2.w);
/*212*/	  r2.w = r6.w * r2.w;
/*213*/	  r2.w = r2.w * r7.x + r0.w;
/*214*/	  r2.x = r2.z * abs(r2.x);
/*215*/	  r2.xzw = (r2.wwww * r2.xxxx).xzw;
/*216*/	} else {
/*217*/	  r2.xzw = (vec4(0, 0, 0, 0)).xzw;
/*218*/	}
/*219*/	r3.xyz = saturate(r6.zzzz * r2.xzwx).xyz;
/*220*/	r1.xyz = (r1.xyzx * r3.xyzx).xyz;
/*221*/	r2.xzw = (max(r0.wwww, r2.xxzw)).xzw;
/*222*/	r2.xzw = (-r2.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*223*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*224*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*225*/	r0.xyz = (r2.xzwx * r0.xyzx).xyz;
/*226*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*227*/	r0.xyz = (r1.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*228*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*229*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*230*/	r2.w = 1.000000;
/*231*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*232*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*233*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*234*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*235*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*236*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*237*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*238*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*239*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*240*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*241*/	if(r0.w != 0) discard;
/*242*/	r0.w = sqrt(r1.w);
/*243*/	r1.x = saturate(cb3.data[0].w)/**/;
/*244*/	r1.x = -r1.x + 1.000000;
/*245*/	r1.x = r1.x * 8.000000 + -4.000000;
/*246*/	r1.y = saturate(cb3.data[1].x)/**/;
/*247*/	r1.y = -r1.y + 1.000000;
/*248*/	r1.y = r1.y * 1000.000000;
/*249*/	r0.w = r0.w / r1.y;
/*250*/	r0.w = r0.w + r1.x;
/*251*/	r0.w = r0.w * 1.442695;
/*252*/	r0.w = exp2(r0.w);
/*253*/	r0.w = cb3.data[1].y / r0.w;
/*254*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*255*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*256*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*257*/	r1.x = r1.x + -cb3.data[1].z;
/*258*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*259*/	r1.x = saturate(r1.y * r1.x);
/*260*/	r1.y = r1.x * -2.000000 + 3.000000;
/*261*/	r1.x = r1.x * r1.x;
/*262*/	r1.x = r1.x * r1.y;
/*263*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*264*/	r1.y = sqrt(r1.y);
/*265*/	r1.z = max(cb3.data[2].z, 0.001000);
/*266*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*267*/	r1.y = r1.z * r1.y;
/*268*/	r1.y = min(r1.y, 1.000000);
/*269*/	r1.z = r1.y * -2.000000 + 3.000000;
/*270*/	r1.y = r1.y * r1.y;
/*271*/	r1.y = r1.y * r1.z;
/*272*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*273*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*274*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*275*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*276*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*277*/	r4.w = max(r4.y, 0.000000);
/*278*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*279*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*280*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*281*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*282*/	r0.w = saturate(r0.w * r1.y);
/*283*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*284*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*285*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*286*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*287*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*288*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*289*/	color0.w = 1.000000;
/*290*/	return;
}
