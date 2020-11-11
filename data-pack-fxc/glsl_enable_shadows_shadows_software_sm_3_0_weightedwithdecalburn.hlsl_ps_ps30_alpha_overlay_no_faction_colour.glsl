//
//
// Shader Model 4
// Fragment Shader
//
// id: 6958 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalburn.hlsl_PS_ps30_alpha_overlay_no_faction_colour.glsl
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
flat in vec4 vsOut_T6;
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r1.w = -r1.w + 1.000000;
/*10*/	r1.w = max(r1.w, 0.000000);
/*11*/	r2.z = sqrt(r1.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*15*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*17*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*18*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*19*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r1.w));
/*20*/	r1.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r1.w));
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*22*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*23*/	if(floatBitsToUint(r1.w) != 0u) {
/*24*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*27*/	  r1.w = -r1.w + 1.000000;
/*28*/	  r1.w = max(r1.w, 0.000000);
/*29*/	  r5.z = sqrt(r1.w);
/*30*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*32*/	  r1.w = r3.x * r7.w;
/*33*/	  r3.x = r1.w * -0.500000 + r3.x;
/*34*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*35*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*36*/	  r1.w = -r4.w * r6.w + 1.000000;
/*37*/	  r0.xyz = (r1.wwww * r0.xyzx + r7.xyzx).xyz;
/*38*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*39*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*40*/	}
/*41*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*42*/	r4.x = r3.z;
/*43*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*44*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*45*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*46*/	r1.w = saturate(r4.x * 5.000000);
/*47*/	r4.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*48*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*50*/	r2.w = log2(r5.z);
/*51*/	r2.w = r2.w * 1.800000;
/*52*/	r2.w = exp2(r2.w);
/*53*/	r2.w = r2.w * 10.000000;
/*54*/	r2.w = min(r2.w, 1.000000);
/*55*/	r1.w = r1.w + r2.w;
/*56*/	r1.w = r1.w * 0.500000;
/*57*/	r2.w = -r5.w + 1.000000;
/*58*/	r2.w = log2(r2.w);
/*59*/	r2.w = r2.w * vsOut_T7.z;
/*60*/	r2.w = exp2(r2.w);
/*61*/	r2.w = min(r2.w, 1.000000);
/*62*/	r2.w = r2.w * vsOut_T7.z;
/*63*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*64*/	r5.w = 1.000000;
/*65*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*66*/	r4.xyzw = r1.wwww * r4.xyzw + r5.zzzw;
/*67*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*68*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*69*/	r1.w = vsOut_T7.z + -0.025000;
/*70*/	r1.w = max(r1.w, 0.000000);
/*71*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*72*/	r0.xyzw = r1.wwww * r4.xyzw + r0.xyzw;
/*73*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*75*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*76*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*78*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*79*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*80*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*81*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*82*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*83*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*84*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*85*/	r2.w = inversesqrt(r2.w);
/*86*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*87*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*88*/	r2.w = inversesqrt(r2.w);
/*89*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*90*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*91*/	r2.w = inversesqrt(r2.w);
/*92*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*93*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*94*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*95*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*96*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*97*/	r2.w = inversesqrt(r2.w);
/*98*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*99*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*100*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*101*/	r3.x = inversesqrt(r2.w);
/*102*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*103*/	r5.x = -r3.y + 1.000000;
/*104*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*105*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*106*/	r5.z = r5.z + r5.z;
/*107*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*108*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*109*/	r5.z = r5.x * 1.539380;
/*110*/	r5.z = cos((r5.z));
/*111*/	r5.z = inversesqrt(r5.z);
/*112*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*113*/	r5.w = saturate(r1.w * 60.000000);
/*114*/	r5.w = -r1.w + r5.w;
/*115*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*116*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*117*/	r6.w = inversesqrt(r6.w);
/*118*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*119*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*120*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*121*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*122*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*123*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*124*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*125*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*126*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*127*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*128*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*129*/	r6.w = -r1.w + 1.000000;
/*130*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*131*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*132*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*133*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*134*/	  r6.w = max(r6.w, 0.000000);
/*135*/	  r6.w = log2(r6.w);
/*136*/	  r6.w = r6.w * 10.000000;
/*137*/	  r6.w = exp2(r6.w);
/*138*/	  r6.w = r5.z * r6.w;
/*139*/	  r6.w = r6.w * r5.w + r1.w;
/*140*/	  r7.y = r5.x * 8.000000;
/*141*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*142*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*143*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*144*/	}
/*145*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*146*/	r2.y = max(r2.x, 0.000000);
/*147*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*148*/	if(floatBitsToUint(r2.x) != 0u) {
/*149*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*150*/	  r2.x = max(r2.x, -1.000000);
/*151*/	  r2.x = min(r2.x, 1.000000);
/*152*/	  r2.z = -abs(r2.x) + 1.000000;
/*153*/	  r2.z = sqrt(r2.z);
/*154*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*155*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*156*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*157*/	  r6.y = r2.z * r6.x;
/*158*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*159*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*160*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*161*/	  r2.x = r6.x * r2.z + r2.x;
/*162*/	  r2.z = r3.y * r3.y;
/*163*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*164*/	  r2.z = r2.z * r3.y + r7.x;
/*165*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*166*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*167*/	  r3.y = -r2.z * r2.z + 1.000000;
/*168*/	  r3.y = max(r3.y, 0.001000);
/*169*/	  r3.y = log2(r3.y);
/*170*/	  r5.y = r3.y * 4.950617;
/*171*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*172*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*173*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*174*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*175*/	  r2.z = floatBitsToInt(r2.z);
/*176*/	  r5.y = r3.y * r3.y + -r5.y;
/*177*/	  r5.y = sqrt(r5.y);
/*178*/	  r3.y = -r3.y + r5.y;
/*179*/	  r3.y = max(r3.y, 0.000000);
/*180*/	  r3.y = sqrt(r3.y);
/*181*/	  r2.z = r2.z * r3.y;
/*182*/	  r2.z = r2.z * 1.414214;
/*183*/	  r2.z = 0.008727 / r2.z;
/*184*/	  r2.z = max(r2.z, 0.000100);
/*185*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*186*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*187*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*188*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*189*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*190*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*191*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*192*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*193*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*194*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*195*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*196*/	  r2.x = floatBitsToInt(r2.x);
/*197*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*198*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*199*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*200*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*201*/	  r2.x = r2.x * r6.x + 1.000000;
/*202*/	  r2.x = r2.x * 0.500000;
/*203*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*204*/	  r2.z = r2.z * r6.y + 1.000000;
/*205*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*206*/	  r2.z = min(r2.y, 1.000000);
/*207*/	  r3.y = r5.x * 1.570796;
/*208*/	  r3.y = sin(r3.y);
/*209*/	  r2.z = r2.z + -1.000000;
/*210*/	  r2.z = r3.y * r2.z + 1.000000;
/*211*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*212*/	  r3.x = max(r3.x, 0.000000);
/*213*/	  r3.x = log2(r3.x);
/*214*/	  r3.x = r3.x * 10.000000;
/*215*/	  r3.x = exp2(r3.x);
/*216*/	  r3.x = r5.z * r3.x;
/*217*/	  r3.x = r3.x * r5.w + r1.w;
/*218*/	  r2.x = r2.z * abs(r2.x);
/*219*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*220*/	} else {
/*221*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*222*/	}
/*223*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*224*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*225*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*226*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*227*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*228*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*229*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*230*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*231*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*232*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*233*/	r1.x = sqrt(r2.w);
/*234*/	r1.y = saturate(cb2.data[0].w)/**/;
/*235*/	r1.y = -r1.y + 1.000000;
/*236*/	r1.y = r1.y * 8.000000 + -4.000000;
/*237*/	r1.z = saturate(cb2.data[1].x)/**/;
/*238*/	r1.z = -r1.z + 1.000000;
/*239*/	r1.z = r1.z * 1000.000000;
/*240*/	r1.x = r1.x / r1.z;
/*241*/	r1.x = r1.x + r1.y;
/*242*/	r1.x = r1.x * 1.442695;
/*243*/	r1.x = exp2(r1.x);
/*244*/	r1.x = cb2.data[1].y / r1.x;
/*245*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*246*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*247*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*248*/	r1.y = r1.y + -cb2.data[1].z;
/*249*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*250*/	r1.y = saturate(r1.z * r1.y);
/*251*/	r1.z = r1.y * -2.000000 + 3.000000;
/*252*/	r1.y = r1.y * r1.y;
/*253*/	r1.y = r1.y * r1.z;
/*254*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*255*/	r1.z = sqrt(r1.z);
/*256*/	r1.w = max(cb2.data[2].z, 0.001000);
/*257*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*258*/	r1.z = r1.w * r1.z;
/*259*/	r1.z = min(r1.z, 1.000000);
/*260*/	r1.w = r1.z * -2.000000 + 3.000000;
/*261*/	r1.z = r1.z * r1.z;
/*262*/	r1.z = r1.z * r1.w;
/*263*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*264*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*265*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*266*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*267*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*268*/	r4.w = max(r4.y, 0.000000);
/*269*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*270*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*271*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*272*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*273*/	r1.x = saturate(r1.x * r1.z);
/*274*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*275*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*276*/	color0.w = r0.w * vsOut_T6.w;
/*277*/	return;
}
