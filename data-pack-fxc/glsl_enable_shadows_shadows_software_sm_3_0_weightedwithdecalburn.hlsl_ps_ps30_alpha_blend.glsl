//
//
// Shader Model 4
// Fragment Shader
//
// id: 6952 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalburn.hlsl_PS_ps30_alpha_blend.glsl
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

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*5*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r1.w = -r1.w + 1.000000;
/*7*/	r1.w = max(r1.w, 0.000000);
/*8*/	r2.z = sqrt(r1.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*12*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*13*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*14*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*15*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*16*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*17*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*18*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*19*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*20*/	if(floatBitsToUint(r1.w) != 0u) {
/*21*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*22*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*24*/	  r1.w = -r1.w + 1.000000;
/*25*/	  r1.w = max(r1.w, 0.000000);
/*26*/	  r5.z = sqrt(r1.w);
/*27*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*29*/	  r1.w = r3.x * r7.w;
/*30*/	  r3.x = r1.w * -0.500000 + r3.x;
/*31*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*32*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*33*/	  r1.w = -r4.w * r6.w + 1.000000;
/*34*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*35*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*36*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*37*/	}
/*38*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*39*/	r4.x = r3.z;
/*40*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*41*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*42*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*43*/	r1.w = saturate(r4.x * 5.000000);
/*44*/	r4.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*45*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*46*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*47*/	r2.w = log2(r5.z);
/*48*/	r2.w = r2.w * 1.800000;
/*49*/	r2.w = exp2(r2.w);
/*50*/	r2.w = r2.w * 10.000000;
/*51*/	r2.w = min(r2.w, 1.000000);
/*52*/	r1.w = r1.w + r2.w;
/*53*/	r1.w = r1.w * 0.500000;
/*54*/	r2.w = -r5.w + 1.000000;
/*55*/	r2.w = log2(r2.w);
/*56*/	r2.w = r2.w * vsOut_T7.z;
/*57*/	r2.w = exp2(r2.w);
/*58*/	r2.w = min(r2.w, 1.000000);
/*59*/	r2.w = r2.w * vsOut_T7.z;
/*60*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*61*/	r5.w = 1.000000;
/*62*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*63*/	r4.xyzw = r1.wwww * r4.xyzw + r5.zzzw;
/*64*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*65*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*66*/	r1.w = vsOut_T7.z + -0.025000;
/*67*/	r1.w = max(r1.w, 0.000000);
/*68*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*69*/	r0.xyzw = r1.wwww * r4.xyzw + r0.xyzw;
/*70*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*71*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*72*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*73*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*75*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*76*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*77*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*78*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*79*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*80*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*81*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*82*/	r2.w = inversesqrt(r2.w);
/*83*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*84*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*85*/	r2.w = inversesqrt(r2.w);
/*86*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*87*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*88*/	r2.w = inversesqrt(r2.w);
/*89*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*90*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*91*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*92*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*93*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*94*/	r2.w = inversesqrt(r2.w);
/*95*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*96*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*97*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*98*/	r3.x = inversesqrt(r2.w);
/*99*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*100*/	r5.x = -r3.y + 1.000000;
/*101*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*102*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*103*/	r5.z = r5.z + r5.z;
/*104*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*105*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*106*/	r5.z = r5.x * 1.539380;
/*107*/	r5.z = cos((r5.z));
/*108*/	r5.z = inversesqrt(r5.z);
/*109*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*110*/	r5.w = saturate(r1.w * 60.000000);
/*111*/	r5.w = -r1.w + r5.w;
/*112*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*113*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*114*/	r6.w = inversesqrt(r6.w);
/*115*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*116*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*117*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*118*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*119*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*120*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*121*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*122*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*123*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*124*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*125*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*126*/	r6.w = -r1.w + 1.000000;
/*127*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*128*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*129*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*130*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*131*/	  r6.w = max(r6.w, 0.000000);
/*132*/	  r6.w = log2(r6.w);
/*133*/	  r6.w = r6.w * 10.000000;
/*134*/	  r6.w = exp2(r6.w);
/*135*/	  r6.w = r5.z * r6.w;
/*136*/	  r6.w = r6.w * r5.w + r1.w;
/*137*/	  r7.y = r5.x * 8.000000;
/*138*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*139*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*140*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*141*/	}
/*142*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*143*/	r2.y = max(r2.x, 0.000000);
/*144*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*145*/	if(floatBitsToUint(r2.x) != 0u) {
/*146*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*147*/	  r2.x = max(r2.x, -1.000000);
/*148*/	  r2.x = min(r2.x, 1.000000);
/*149*/	  r2.z = -abs(r2.x) + 1.000000;
/*150*/	  r2.z = sqrt(r2.z);
/*151*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*152*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*153*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*154*/	  r6.y = r2.z * r6.x;
/*155*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*156*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*157*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*158*/	  r2.x = r6.x * r2.z + r2.x;
/*159*/	  r2.z = r3.y * r3.y;
/*160*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*161*/	  r2.z = r2.z * r3.y + r7.x;
/*162*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*163*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*164*/	  r3.y = -r2.z * r2.z + 1.000000;
/*165*/	  r3.y = max(r3.y, 0.001000);
/*166*/	  r3.y = log2(r3.y);
/*167*/	  r5.y = r3.y * 4.950617;
/*168*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*169*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*170*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*171*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*172*/	  r2.z = floatBitsToInt(r2.z);
/*173*/	  r5.y = r3.y * r3.y + -r5.y;
/*174*/	  r5.y = sqrt(r5.y);
/*175*/	  r3.y = -r3.y + r5.y;
/*176*/	  r3.y = max(r3.y, 0.000000);
/*177*/	  r3.y = sqrt(r3.y);
/*178*/	  r2.z = r2.z * r3.y;
/*179*/	  r2.z = r2.z * 1.414214;
/*180*/	  r2.z = 0.008727 / r2.z;
/*181*/	  r2.z = max(r2.z, 0.000100);
/*182*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*183*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*184*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*185*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*186*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*187*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*188*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*189*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*190*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*191*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*192*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*193*/	  r2.x = floatBitsToInt(r2.x);
/*194*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*195*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*196*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*197*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*198*/	  r2.x = r2.x * r6.x + 1.000000;
/*199*/	  r2.x = r2.x * 0.500000;
/*200*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*201*/	  r2.z = r2.z * r6.y + 1.000000;
/*202*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*203*/	  r2.z = min(r2.y, 1.000000);
/*204*/	  r3.y = r5.x * 1.570796;
/*205*/	  r3.y = sin(r3.y);
/*206*/	  r2.z = r2.z + -1.000000;
/*207*/	  r2.z = r3.y * r2.z + 1.000000;
/*208*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*209*/	  r3.x = max(r3.x, 0.000000);
/*210*/	  r3.x = log2(r3.x);
/*211*/	  r3.x = r3.x * 10.000000;
/*212*/	  r3.x = exp2(r3.x);
/*213*/	  r3.x = r5.z * r3.x;
/*214*/	  r3.x = r3.x * r5.w + r1.w;
/*215*/	  r2.x = r2.z * abs(r2.x);
/*216*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*217*/	} else {
/*218*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*219*/	}
/*220*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*221*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*222*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*223*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*224*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*225*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*226*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*227*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*228*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*229*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*230*/	r1.x = sqrt(r2.w);
/*231*/	r1.y = saturate(cb2.data[0].w)/**/;
/*232*/	r1.y = -r1.y + 1.000000;
/*233*/	r1.y = r1.y * 8.000000 + -4.000000;
/*234*/	r1.z = saturate(cb2.data[1].x)/**/;
/*235*/	r1.z = -r1.z + 1.000000;
/*236*/	r1.z = r1.z * 1000.000000;
/*237*/	r1.x = r1.x / r1.z;
/*238*/	r1.x = r1.x + r1.y;
/*239*/	r1.x = r1.x * 1.442695;
/*240*/	r1.x = exp2(r1.x);
/*241*/	r1.x = cb2.data[1].y / r1.x;
/*242*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*243*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*244*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*245*/	r1.y = r1.y + -cb2.data[1].z;
/*246*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*247*/	r1.y = saturate(r1.z * r1.y);
/*248*/	r1.z = r1.y * -2.000000 + 3.000000;
/*249*/	r1.y = r1.y * r1.y;
/*250*/	r1.y = r1.y * r1.z;
/*251*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*252*/	r1.z = sqrt(r1.z);
/*253*/	r1.w = max(cb2.data[2].z, 0.001000);
/*254*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*255*/	r1.z = r1.w * r1.z;
/*256*/	r1.z = min(r1.z, 1.000000);
/*257*/	r1.w = r1.z * -2.000000 + 3.000000;
/*258*/	r1.z = r1.z * r1.z;
/*259*/	r1.z = r1.z * r1.w;
/*260*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*261*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*262*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*263*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*264*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*265*/	r4.w = max(r4.y, 0.000000);
/*266*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*267*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*268*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*269*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*270*/	r1.x = saturate(r1.x * r1.z);
/*271*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*272*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*273*/	color0.w = r0.w;
/*274*/	return;
}
