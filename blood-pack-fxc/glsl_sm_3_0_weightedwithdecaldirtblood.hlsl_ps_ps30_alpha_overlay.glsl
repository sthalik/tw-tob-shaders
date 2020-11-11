//
//
// Shader Model 4
// Fragment Shader
//
// id: 2451 - fxc/glsl_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_alpha_overlay.glsl
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

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
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r4.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r4.xyzx + -r4.xyzx).xyz;
/*20*/	r2.xyw = (r2.yyyy * r3.xyxz + r4.xyxz).xyw;
/*21*/	r3.xyz = (r5.xyzx * r2.xywx + -r2.xywx).xyz;
/*22*/	r2.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*23*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r4.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*32*/	r5.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*33*/	r4.zw = (r5.xxxy / r4.zzzw).zw;
/*34*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*35*/	r5.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r4.zzzw)) * 0xffffffffu)).zw;
/*36*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.z) & floatBitsToUint(r5.x));
/*37*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r1.w));
/*38*/	r1.w = uintBitsToFloat(floatBitsToUint(r5.w) & floatBitsToUint(r1.w));
/*39*/	r5.xyzw = (texture(s_decal_diffuse, r4.zwzz.st)).xyzw;
/*40*/	r6.xyzw = (texture(s_decal_normal, r4.zwzz.st)).xyzw;
/*41*/	if(floatBitsToUint(r1.w) != 0u) {
/*42*/	  r4.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*43*/	  r6.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*44*/	  r1.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*45*/	  r1.w = -r1.w + 1.000000;
/*46*/	  r1.w = max(r1.w, 0.000000);
/*47*/	  r6.z = sqrt(r1.w);
/*48*/	  r7.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*49*/	  r8.xyzw = r5.xyzw * r7.wwww;
/*50*/	  r1.w = r4.x * r8.w;
/*51*/	  r4.x = r1.w * -0.500000 + r4.x;
/*52*/	  r5.xyz = (r5.xyzx * r7.wwww + -r1.xyzx).xyz;
/*53*/	  r1.xyz = (r8.wwww * r5.xyzx + r1.xyzx).xyz;
/*54*/	  r1.w = -r5.w * r7.w + 1.000000;
/*55*/	  r2.xyz = (r1.wwww * r2.xyzx + r8.xyzx).xyz;
/*56*/	  r5.xyz = (-r3.xyzx + r6.xyzx).xyz;
/*57*/	  r3.xyz = (r8.wwww * r5.xyzx + r3.xyzx).xyz;
/*58*/	}
/*59*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r4.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*61*/	r6.xyzw = (texture(s_decal_dirt_map, r4.zwzz.st)).xyzw;
/*62*/	r4.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*63*/	r1.w = r5.w * r6.w;
/*64*/	r5.xyz = (-r2.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*65*/	r0.xyz = (r1.wwww * r5.xyzx + r2.xyzx).xyz;
/*66*/	r3.xy = (r4.zwzz * r5.wwww + r3.xyxx).xy;
/*67*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*68*/	r2.x = inversesqrt(r2.x);
/*69*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*70*/	r2.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*71*/	if(r2.w != 0) discard;
/*72*/	r3.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*73*/	r3.xy = (r3.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*74*/	r3.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*75*/	r2.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*76*/	r2.w = saturate(-r2.w + r3.w);
/*77*/	r2.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*78*/	if(floatBitsToUint(r2.w) != 0u) {
/*79*/	  r2.w = -r3.w + 1.000000;
/*80*/	  r2.w = saturate(vsOut_T4.z * 0.900000 + -r2.w);
/*81*/	  r2.w = -r2.w + 1.000000;
/*82*/	  r2.w = -r2.w * r2.w + 1.000000;
/*83*/	  r2.w = r2.w * -0.600000 + 1.000000;
/*84*/	  r3.xyz = (r2.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*85*/	  r2.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*86*/	  r2.w = uintBitsToFloat((r2.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*87*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0x3f800000u));
/*88*/	  r3.w = 1.000000;
/*89*/	  r5.xyzw = r0.xyzw * vec4(0.300000, 0.000000, 0.000000, 1.000000) + -r3.xzzw;
/*90*/	  r0.xyzw = r2.wwww * r5.xyzw + r3.xyzw;
/*91*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*92*/	  r4.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*93*/	} else {
/*94*/	  r5.xyz = (r1.wwww * r1.xyzx).xyz;
/*95*/	  r3.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*96*/	}
/*97*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*98*/	r1.xyz = (-r0.xyzx + r1.xxxx).xyz;
/*99*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*100*/	r1.x = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*101*/	r1.xyz = (-r3.xyzx + r1.xxxx).xyz;
/*102*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r3.xyzx).xyz;
/*103*/	r1.w = vsOut_T7.y * -r4.x + r4.x;
/*104*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*105*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*106*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*107*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*108*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*109*/	r2.w = inversesqrt(r2.w);
/*110*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*111*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*112*/	r2.w = inversesqrt(r2.w);
/*113*/	r4.xzw = (r2.wwww * vsOut_T5.xxyz).xzw;
/*114*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*115*/	r2.w = inversesqrt(r2.w);
/*116*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*117*/	r4.xzw = (r2.yyyy * r4.xxzw).xzw;
/*118*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.xzxw).xyw;
/*119*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*120*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*121*/	r2.w = inversesqrt(r2.w);
/*122*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*123*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*124*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*125*/	r4.x = inversesqrt(r2.w);
/*126*/	r4.xzw = (r3.xxyz * r4.xxxx).xzw;
/*127*/	r5.x = -r4.y + 1.000000;
/*128*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*129*/	r5.z = dot(vec3(r4.xzwx), vec3(r2.xyzx));
/*130*/	r5.z = r5.z + r5.z;
/*131*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.xzwx).xyz;
/*132*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*133*/	r5.z = r5.x * 1.539380;
/*134*/	r5.z = cos((r5.z));
/*135*/	r5.z = inversesqrt(r5.z);
/*136*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*137*/	r5.w = saturate(r1.w * 60.000000);
/*138*/	r5.w = -r1.w + r5.w;
/*139*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*140*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*141*/	r6.w = inversesqrt(r6.w);
/*142*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*143*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*144*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*145*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*146*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*147*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*148*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*149*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*150*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*151*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*152*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*153*/	r6.w = -r1.w + 1.000000;
/*154*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*155*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*156*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*157*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.xzwx));
/*158*/	  r6.w = max(r6.w, 0.000000);
/*159*/	  r6.w = log2(r6.w);
/*160*/	  r6.w = r6.w * 10.000000;
/*161*/	  r6.w = exp2(r6.w);
/*162*/	  r6.w = r5.z * r6.w;
/*163*/	  r6.w = r6.w * r5.w + r1.w;
/*164*/	  r7.y = r5.x * 8.000000;
/*165*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*166*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*167*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*168*/	}
/*169*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*170*/	r2.y = max(r2.x, 0.000000);
/*171*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*172*/	if(floatBitsToUint(r2.x) != 0u) {
/*173*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*174*/	  r2.x = max(r2.x, -1.000000);
/*175*/	  r2.x = min(r2.x, 1.000000);
/*176*/	  r2.z = -abs(r2.x) + 1.000000;
/*177*/	  r2.z = sqrt(r2.z);
/*178*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*179*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*180*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*181*/	  r6.y = r2.z * r6.x;
/*182*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*183*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*184*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*185*/	  r2.x = r6.x * r2.z + r2.x;
/*186*/	  r2.z = r4.y * r4.y;
/*187*/	    r4.y = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*188*/	  r2.z = r2.z * r4.y + r7.x;
/*189*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*190*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*191*/	  r4.y = -r2.z * r2.z + 1.000000;
/*192*/	  r4.y = max(r4.y, 0.001000);
/*193*/	  r4.y = log2(r4.y);
/*194*/	  r5.y = r4.y * 4.950617;
/*195*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*196*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*197*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*198*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*199*/	  r2.z = floatBitsToInt(r2.z);
/*200*/	  r5.y = r4.y * r4.y + -r5.y;
/*201*/	  r5.y = sqrt(r5.y);
/*202*/	  r4.y = -r4.y + r5.y;
/*203*/	  r4.y = max(r4.y, 0.000000);
/*204*/	  r4.y = sqrt(r4.y);
/*205*/	  r2.z = r2.z * r4.y;
/*206*/	  r2.z = r2.z * 1.414214;
/*207*/	  r2.z = 0.008727 / r2.z;
/*208*/	  r2.z = max(r2.z, 0.000100);
/*209*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*210*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*211*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*212*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*213*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*214*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*215*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*216*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*217*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*218*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*219*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*220*/	  r2.x = floatBitsToInt(r2.x);
/*221*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*222*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*223*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*224*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*225*/	  r2.x = r2.x * r6.x + 1.000000;
/*226*/	  r2.x = r2.x * 0.500000;
/*227*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*228*/	  r2.z = r2.z * r6.y + 1.000000;
/*229*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*230*/	  r2.z = min(r2.y, 1.000000);
/*231*/	  r4.y = r5.x * 1.570796;
/*232*/	  r4.y = sin(r4.y);
/*233*/	  r2.z = r2.z + -1.000000;
/*234*/	  r2.z = r4.y * r2.z + 1.000000;
/*235*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xzwx));
/*236*/	  r4.x = max(r4.x, 0.000000);
/*237*/	  r4.x = log2(r4.x);
/*238*/	  r4.x = r4.x * 10.000000;
/*239*/	  r4.x = exp2(r4.x);
/*240*/	  r4.x = r5.z * r4.x;
/*241*/	  r4.x = r4.x * r5.w + r1.w;
/*242*/	  r2.x = r2.z * abs(r2.x);
/*243*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*244*/	} else {
/*245*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*246*/	}
/*247*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*248*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*249*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*250*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*251*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*252*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*253*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*254*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*255*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*256*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*257*/	r1.x = sqrt(r2.w);
/*258*/	r1.y = saturate(cb2.data[0].w)/**/;
/*259*/	r1.y = -r1.y + 1.000000;
/*260*/	r1.y = r1.y * 8.000000 + -4.000000;
/*261*/	r1.z = saturate(cb2.data[1].x)/**/;
/*262*/	r1.z = -r1.z + 1.000000;
/*263*/	r1.z = r1.z * 1000.000000;
/*264*/	r1.x = r1.x / r1.z;
/*265*/	r1.x = r1.x + r1.y;
/*266*/	r1.x = r1.x * 1.442695;
/*267*/	r1.x = exp2(r1.x);
/*268*/	r1.x = cb2.data[1].y / r1.x;
/*269*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*270*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*271*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*272*/	r1.y = r1.y + -cb2.data[1].z;
/*273*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*274*/	r1.y = saturate(r1.z * r1.y);
/*275*/	r1.z = r1.y * -2.000000 + 3.000000;
/*276*/	r1.y = r1.y * r1.y;
/*277*/	r1.y = r1.y * r1.z;
/*278*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*279*/	r1.z = sqrt(r1.z);
/*280*/	r1.w = max(cb2.data[2].z, 0.001000);
/*281*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*282*/	r1.z = r1.w * r1.z;
/*283*/	r1.z = min(r1.z, 1.000000);
/*284*/	r1.w = r1.z * -2.000000 + 3.000000;
/*285*/	r1.z = r1.z * r1.z;
/*286*/	r1.z = r1.z * r1.w;
/*287*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*288*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*289*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*290*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*291*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*292*/	r3.w = max(r3.y, 0.000000);
/*293*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*294*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*295*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*296*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*297*/	r1.x = saturate(r1.x * r1.z);
/*298*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*299*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*300*/	color0.w = r0.w * vsOut_T6.w;
/*301*/	return;
}
