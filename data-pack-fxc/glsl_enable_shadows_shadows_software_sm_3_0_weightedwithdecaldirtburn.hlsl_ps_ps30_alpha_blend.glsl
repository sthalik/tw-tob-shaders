//
//
// Shader Model 4
// Fragment Shader
//
// id: 7095 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtburn.hlsl_PS_ps30_alpha_blend.glsl
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
uniform samplerCube s_environment;
uniform samplerCube s_sky;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;

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
/*38*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*40*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*41*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*42*/	r1.w = r4.w * r5.w;
/*43*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*44*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*45*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*46*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*47*/	r2.w = inversesqrt(r2.w);
/*48*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*49*/	r4.xyz = (r1.wwww * r1.xyzx).xyz;
/*50*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*51*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*52*/	r4.x = r3.z;
/*53*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*54*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*55*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*56*/	r1.w = saturate(r4.x * 5.000000);
/*57*/	r4.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*58*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*60*/	r2.w = log2(r5.z);
/*61*/	r2.w = r2.w * 1.800000;
/*62*/	r2.w = exp2(r2.w);
/*63*/	r2.w = r2.w * 10.000000;
/*64*/	r2.w = min(r2.w, 1.000000);
/*65*/	r1.w = r1.w + r2.w;
/*66*/	r1.w = r1.w * 0.500000;
/*67*/	r2.w = -r5.w + 1.000000;
/*68*/	r2.w = log2(r2.w);
/*69*/	r2.w = r2.w * vsOut_T7.z;
/*70*/	r2.w = exp2(r2.w);
/*71*/	r2.w = min(r2.w, 1.000000);
/*72*/	r2.w = r2.w * vsOut_T7.z;
/*73*/	r5.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*74*/	r5.w = 1.000000;
/*75*/	r4.xyzw = r4.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r5.zzzw;
/*76*/	r4.xyzw = r1.wwww * r4.xyzw + r5.zzzw;
/*77*/	r4.xyzw = -r0.xyzw + r4.xyzw;
/*78*/	r0.xyzw = r2.wwww * r4.xyzw + r0.xyzw;
/*79*/	r1.w = vsOut_T7.z + -0.025000;
/*80*/	r1.w = max(r1.w, 0.000000);
/*81*/	r4.xyzw = -r0.xyzw + r5.xyzw;
/*82*/	r0.xyzw = r1.wwww * r4.xyzw + r0.xyzw;
/*83*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*84*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*85*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*86*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*87*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*88*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*89*/	r1.w = vsOut_T7.y * -r3.x + r3.x;
/*90*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*91*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*92*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*93*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*94*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*95*/	r2.w = inversesqrt(r2.w);
/*96*/	r3.xzw = (r2.wwww * vsOut_T3.xxyz).xzw;
/*97*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*98*/	r2.w = inversesqrt(r2.w);
/*99*/	r4.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*100*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*101*/	r2.w = inversesqrt(r2.w);
/*102*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*103*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*104*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*105*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*106*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*107*/	r2.w = inversesqrt(r2.w);
/*108*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*109*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*110*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*111*/	r3.x = inversesqrt(r2.w);
/*112*/	r3.xzw = (r3.xxxx * r4.xxyz).xzw;
/*113*/	r5.x = -r3.y + 1.000000;
/*114*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*115*/	r5.z = dot(vec3(r3.xzwx), vec3(r2.xyzx));
/*116*/	r5.z = r5.z + r5.z;
/*117*/	r6.xyz = (r2.xyzx * -r5.zzzz + r3.xzwx).xyz;
/*118*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*119*/	r5.z = r5.x * 1.539380;
/*120*/	r5.z = cos((r5.z));
/*121*/	r5.z = inversesqrt(r5.z);
/*122*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*123*/	r5.w = saturate(r1.w * 60.000000);
/*124*/	r5.w = -r1.w + r5.w;
/*125*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*126*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*127*/	r6.w = inversesqrt(r6.w);
/*128*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*129*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*130*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*131*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*132*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*133*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*134*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*135*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*136*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*137*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*138*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*139*/	r6.w = -r1.w + 1.000000;
/*140*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*141*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*142*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*143*/	  r6.w = dot(vec3(r6.xyzx), vec3(r3.xzwx));
/*144*/	  r6.w = max(r6.w, 0.000000);
/*145*/	  r6.w = log2(r6.w);
/*146*/	  r6.w = r6.w * 10.000000;
/*147*/	  r6.w = exp2(r6.w);
/*148*/	  r6.w = r5.z * r6.w;
/*149*/	  r6.w = r6.w * r5.w + r1.w;
/*150*/	  r7.y = r5.x * 8.000000;
/*151*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*152*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*153*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*154*/	}
/*155*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*156*/	r2.y = max(r2.x, 0.000000);
/*157*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*158*/	if(floatBitsToUint(r2.x) != 0u) {
/*159*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*160*/	  r2.x = max(r2.x, -1.000000);
/*161*/	  r2.x = min(r2.x, 1.000000);
/*162*/	  r2.z = -abs(r2.x) + 1.000000;
/*163*/	  r2.z = sqrt(r2.z);
/*164*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*165*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*166*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*167*/	  r6.y = r2.z * r6.x;
/*168*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*169*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*170*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*171*/	  r2.x = r6.x * r2.z + r2.x;
/*172*/	  r2.z = r3.y * r3.y;
/*173*/	    r3.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*174*/	  r2.z = r2.z * r3.y + r7.x;
/*175*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*176*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*177*/	  r3.y = -r2.z * r2.z + 1.000000;
/*178*/	  r3.y = max(r3.y, 0.001000);
/*179*/	  r3.y = log2(r3.y);
/*180*/	  r5.y = r3.y * 4.950617;
/*181*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*182*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*183*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*184*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*185*/	  r2.z = floatBitsToInt(r2.z);
/*186*/	  r5.y = r3.y * r3.y + -r5.y;
/*187*/	  r5.y = sqrt(r5.y);
/*188*/	  r3.y = -r3.y + r5.y;
/*189*/	  r3.y = max(r3.y, 0.000000);
/*190*/	  r3.y = sqrt(r3.y);
/*191*/	  r2.z = r2.z * r3.y;
/*192*/	  r2.z = r2.z * 1.414214;
/*193*/	  r2.z = 0.008727 / r2.z;
/*194*/	  r2.z = max(r2.z, 0.000100);
/*195*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*196*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*197*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*198*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*199*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*200*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*201*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*202*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*203*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*204*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*205*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*206*/	  r2.x = floatBitsToInt(r2.x);
/*207*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*208*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*209*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*210*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*211*/	  r2.x = r2.x * r6.x + 1.000000;
/*212*/	  r2.x = r2.x * 0.500000;
/*213*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*214*/	  r2.z = r2.z * r6.y + 1.000000;
/*215*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*216*/	  r2.z = min(r2.y, 1.000000);
/*217*/	  r3.y = r5.x * 1.570796;
/*218*/	  r3.y = sin(r3.y);
/*219*/	  r2.z = r2.z + -1.000000;
/*220*/	  r2.z = r3.y * r2.z + 1.000000;
/*221*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xzwx));
/*222*/	  r3.x = max(r3.x, 0.000000);
/*223*/	  r3.x = log2(r3.x);
/*224*/	  r3.x = r3.x * 10.000000;
/*225*/	  r3.x = exp2(r3.x);
/*226*/	  r3.x = r5.z * r3.x;
/*227*/	  r3.x = r3.x * r5.w + r1.w;
/*228*/	  r2.x = r2.z * abs(r2.x);
/*229*/	  r3.xyz = (r3.xxxx * r2.xxxx).xyz;
/*230*/	} else {
/*231*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*232*/	}
/*233*/	r5.xyz = saturate(r7.zzzz * r3.xyzx).xyz;
/*234*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*235*/	r3.xyz = (max(r1.wwww, r3.xyzx)).xyz;
/*236*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*237*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*238*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*239*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*240*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*241*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*242*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*243*/	r1.x = sqrt(r2.w);
/*244*/	r1.y = saturate(cb2.data[0].w)/**/;
/*245*/	r1.y = -r1.y + 1.000000;
/*246*/	r1.y = r1.y * 8.000000 + -4.000000;
/*247*/	r1.z = saturate(cb2.data[1].x)/**/;
/*248*/	r1.z = -r1.z + 1.000000;
/*249*/	r1.z = r1.z * 1000.000000;
/*250*/	r1.x = r1.x / r1.z;
/*251*/	r1.x = r1.x + r1.y;
/*252*/	r1.x = r1.x * 1.442695;
/*253*/	r1.x = exp2(r1.x);
/*254*/	r1.x = cb2.data[1].y / r1.x;
/*255*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*256*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*257*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*258*/	r1.y = r1.y + -cb2.data[1].z;
/*259*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*260*/	r1.y = saturate(r1.z * r1.y);
/*261*/	r1.z = r1.y * -2.000000 + 3.000000;
/*262*/	r1.y = r1.y * r1.y;
/*263*/	r1.y = r1.y * r1.z;
/*264*/	r1.z = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*265*/	r1.z = sqrt(r1.z);
/*266*/	r1.w = max(cb2.data[2].z, 0.001000);
/*267*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*268*/	r1.z = r1.w * r1.z;
/*269*/	r1.z = min(r1.z, 1.000000);
/*270*/	r1.w = r1.z * -2.000000 + 3.000000;
/*271*/	r1.z = r1.z * r1.z;
/*272*/	r1.z = r1.z * r1.w;
/*273*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*274*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*275*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*276*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*277*/	r3.xyz = (r7.xxxx * r2.xyzx).xyz;
/*278*/	r4.w = max(r4.y, 0.000000);
/*279*/	r4.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*280*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*281*/	r2.xyz = (-r2.xyzx * r7.xxxx + r4.xyzx).xyz;
/*282*/	r2.xyz = (r1.yyyy * r2.xyzx + r3.xyzx).xyz;
/*283*/	r1.x = saturate(r1.x * r1.z);
/*284*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*285*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*286*/	color0.w = r0.w;
/*287*/	return;
}
