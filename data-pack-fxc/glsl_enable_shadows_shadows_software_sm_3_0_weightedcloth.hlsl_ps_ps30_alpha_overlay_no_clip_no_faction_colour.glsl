//
//
// Shader Model 4
// Fragment Shader
//
// id: 7828 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_WeightedCloth.hlsl_PS_ps30_alpha_overlay_no_clip_no_faction_colour.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_T9;
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D normal0_sampler;
uniform sampler2D normal1_sampler;
uniform sampler2D s_diffuse_damage_map;
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
/*8*/	r3.z = sqrt(r1.w);
/*9*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*13*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*14*/	r1.w = r5.w * r6.w;
/*15*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*16*/	r5.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*17*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*18*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*19*/	r2.x = inversesqrt(r2.x);
/*20*/	r2.yzw = (r1.wwww * r1.xxyz).yzw;
/*21*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*22*/	r6.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*23*/	r2.yzw = sin(vec3(r6.xxyz));
/*24*/	r1.w = r2.z * r2.y;
/*25*/	r1.w = r2.w * r1.w;
/*26*/	r1.w = r1.w * 0.500000 + 1.000000;
/*27*/	r1.w = r1.w * 0.800000 + r6.w;
/*28*/	r2.yzw = (cb0.data[26].xxxx * vec4(0.000000, 2.500000, 0.300000, 0.870000)).yzw;
/*29*/	r2.yzw = sin(vec3(r2.yyzw));
/*30*/	r2.y = r2.z * r2.y;
/*31*/	r2.y = r2.w * r2.y;
/*32*/	r2.y = r2.y * 0.500000 + 1.000000;
/*33*/	r2.z = r2.y * 0.400000;
/*34*/	r2.y = r2.y * 0.500000 + r6.y;
/*35*/	r4.zw = (r1.wwww * vec4(0.000000, 0.000000, 0.200000, 0.200000) + vsOut_T1.xxxy).zw;
/*36*/	r6.xyzw = (texture(normal0_sampler, r4.zwzz.st)).xyzw;
/*37*/	r4.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*38*/	r6.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r1.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*40*/	r1.w = -r1.w + 1.000000;
/*41*/	r1.w = max(r1.w, 0.000000);
/*42*/	r6.z = sqrt(r1.w);
/*43*/	r2.yw = (r2.yyyy * vec4(0.000000, 0.500000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*44*/	r7.xyzw = (texture(normal1_sampler, r2.ywyy.st)).xyzw;
/*45*/	r2.yw = (r7.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*46*/	r2.yw = (r2.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*47*/	r1.w = dot(vec2(r2.ywyy), vec2(r2.ywyy));
/*48*/	r1.w = -r1.w + 1.000000;
/*49*/	r1.w = max(r1.w, 0.000000);
/*50*/	r7.z = sqrt(r1.w);
/*51*/	r7.xy = (r2.zzzz * r2.ywyy).xy;
/*52*/	r2.yzw = (r6.xxyz + r7.xxyz).yzw;
/*53*/	r1.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r2.yzw = (r1.wwww * r2.yyzw).yzw;
/*56*/	r2.xyz = (r3.xyzx * r2.xxxx + r2.yzwy).xyz;
/*57*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*60*/	r3.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.xyz = (r3.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*62*/	r3.xyz = (vsOut_T9.xxxx * r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*63*/	r0.xyz = (r3.xyzx * r5.xyzx).xyz;
/*64*/	r1.w = r3.w + -vsOut_T9.x;
/*65*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*66*/	if(r1.w != 0) discard;
/*67*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*68*/	r2.w = r0.w + -r1.w;
/*69*/	r3.x = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*70*/	if(r3.x != 0) discard;
/*71*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*72*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*73*/	r1.w = saturate(r1.w * r2.w);
/*74*/	r2.w = r1.w * -2.000000 + 3.000000;
/*75*/	r1.w = r1.w * r1.w;
/*76*/	r3.xy = (-r2.wwww * r1.wwww + vec4(1.000000, 0.975000, 0.000000, 0.000000)).xy;
/*77*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*78*/	r5.x = 0;
/*79*/	r5.y = cb0.data[26].x * 0.050000;
/*80*/	r4.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r5.xxxy).zw;
/*81*/	r5.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*82*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*83*/	r1.w = saturate(r5.x * 5.000000);
/*84*/	r5.xyzw = r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*85*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*86*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*87*/	r2.w = log2(r6.z);
/*88*/	r2.w = r2.w * 1.800000;
/*89*/	r2.w = exp2(r2.w);
/*90*/	r2.w = r2.w * 10.000000;
/*91*/	r2.w = min(r2.w, 1.000000);
/*92*/	r1.w = r1.w + r2.w;
/*93*/	r1.w = r1.w * 0.500000;
/*94*/	r2.w = -r6.w + 1.000000;
/*95*/	r2.w = log2(r2.w);
/*96*/	r2.w = r2.w * r3.x;
/*97*/	r2.w = exp2(r2.w);
/*98*/	r2.w = min(r2.w, 1.000000);
/*99*/	r2.w = r3.x * r2.w;
/*100*/	r6.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*101*/	r6.w = 1.000000;
/*102*/	r5.xyzw = r5.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r6.zzzw;
/*103*/	r5.xyzw = r1.wwww * r5.xyzw + r6.zzzw;
/*104*/	r5.xyzw = -r0.xyzw + r5.xyzw;
/*105*/	r0.xyzw = r2.wwww * r5.xyzw + r0.xyzw;
/*106*/	r1.w = max(r3.y, 0.000000);
/*107*/	r3.xyzw = -r0.xyzw + r6.xyzw;
/*108*/	r0.xyzw = r1.wwww * r3.xyzw + r0.xyzw;
/*109*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*110*/	r3.xyz = (-r0.xyzx + r1.wwww).xyz;
/*111*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*112*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*113*/	r3.xyz = (-r1.xyzx + r1.wwww).xyz;
/*114*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*115*/	r1.w = vsOut_T7.y * -r4.y + r4.y;
/*116*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*117*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*118*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*119*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*120*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*121*/	r2.w = inversesqrt(r2.w);
/*122*/	r3.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*123*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*124*/	r2.w = inversesqrt(r2.w);
/*125*/	r4.yzw = (r2.wwww * vsOut_T5.xxyz).yzw;
/*126*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*127*/	r2.w = inversesqrt(r2.w);
/*128*/	r5.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*129*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*130*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*131*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*132*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*133*/	r2.w = inversesqrt(r2.w);
/*134*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*135*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*136*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*137*/	r4.y = inversesqrt(r2.w);
/*138*/	r4.yzw = (r3.xxyz * r4.yyyy).yzw;
/*139*/	r5.x = -r4.x + 1.000000;
/*140*/	r5.y = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*141*/	r5.z = dot(vec3(r4.yzwy), vec3(r2.xyzx));
/*142*/	r5.z = r5.z + r5.z;
/*143*/	r6.xyz = (r2.xyzx * -r5.zzzz + r4.yzwy).xyz;
/*144*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.yyyy), uvec4(0)))).xyz;
/*145*/	r5.z = r5.x * 1.539380;
/*146*/	r5.z = cos((r5.z));
/*147*/	r5.z = inversesqrt(r5.z);
/*148*/	r5.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r5.z)).z;
/*149*/	r5.w = saturate(r1.w * 60.000000);
/*150*/	r5.w = -r1.w + r5.w;
/*151*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*152*/	r6.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*153*/	r6.w = inversesqrt(r6.w);
/*154*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*155*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*156*/	r10.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*157*/	r9.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*158*/	r11.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*159*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*160*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*161*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*162*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*163*/	r8.xyz = (r7.yyyy * r8.xyzx).xyz;
/*164*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*165*/	r6.w = -r1.w + 1.000000;
/*166*/	r8.xyz = (r6.wwww * r8.xyzx).xyz;
/*167*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*168*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*169*/	  r6.w = dot(vec3(r6.xyzx), vec3(r4.yzwy));
/*170*/	  r6.w = max(r6.w, 0.000000);
/*171*/	  r6.w = log2(r6.w);
/*172*/	  r6.w = r6.w * 10.000000;
/*173*/	  r6.w = exp2(r6.w);
/*174*/	  r6.w = r5.z * r6.w;
/*175*/	  r6.w = r6.w * r5.w + r1.w;
/*176*/	  r7.y = r5.x * 8.000000;
/*177*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*178*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*179*/	  r8.xyz = (r9.xyzx * r1.xyzx + r8.xyzx).xyz;
/*180*/	}
/*181*/	r2.x = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*182*/	r2.y = max(r2.x, 0.000000);
/*183*/	r2.x = uintBitsToFloat((0.000000 < r2.x) ? 0xffffffffu : 0x00000000u);
/*184*/	if(floatBitsToUint(r2.x) != 0u) {
/*185*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*186*/	  r2.x = max(r2.x, -1.000000);
/*187*/	  r2.x = min(r2.x, 1.000000);
/*188*/	  r2.z = -abs(r2.x) + 1.000000;
/*189*/	  r2.z = sqrt(r2.z);
/*190*/	  r6.x = abs(r2.x) * -0.018729 + 0.074261;
/*191*/	  r6.x = r6.x * abs(r2.x) + -0.212114;
/*192*/	  r6.x = r6.x * abs(r2.x) + 1.570729;
/*193*/	  r6.y = r2.z * r6.x;
/*194*/	  r6.y = r6.y * -2.000000 + 3.141593;
/*195*/	  r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*196*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r6.y));
/*197*/	  r2.x = r6.x * r2.z + r2.x;
/*198*/	  r2.z = r4.x * r4.x;
/*199*/	    r4.x = (floatBitsToUint(r5.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*200*/	  r2.z = r2.z * r4.x + r7.x;
/*201*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*202*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*203*/	  r4.x = -r2.z * r2.z + 1.000000;
/*204*/	  r4.x = max(r4.x, 0.001000);
/*205*/	  r4.x = log2(r4.x);
/*206*/	  r5.y = r4.x * 4.950617;
/*207*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*208*/	  r6.x = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*209*/	  r2.z = uintBitsToFloat((r2.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*210*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r2.z));
/*211*/	  r2.z = floatBitsToInt(r2.z);
/*212*/	  r5.y = r4.x * r4.x + -r5.y;
/*213*/	  r5.y = sqrt(r5.y);
/*214*/	  r4.x = -r4.x + r5.y;
/*215*/	  r4.x = max(r4.x, 0.000000);
/*216*/	  r4.x = sqrt(r4.x);
/*217*/	  r2.z = r2.z * r4.x;
/*218*/	  r2.z = r2.z * 1.414214;
/*219*/	  r2.z = 0.008727 / r2.z;
/*220*/	  r2.z = max(r2.z, 0.000100);
/*221*/	  r6.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*222*/	  r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).x;
/*223*/	  r2.xz = (r2.xxxx * r6.xxyx).xz;
/*224*/	  r6.xy = (r2.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*225*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*226*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*227*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*228*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*229*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxxz)) * 0xffffffffu)).zw;
/*230*/	  r2.x = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*231*/	  r2.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r2.x));
/*232*/	  r2.x = floatBitsToInt(r2.x);
/*233*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*234*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*235*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*236*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*237*/	  r2.x = r2.x * r6.x + 1.000000;
/*238*/	  r2.x = r2.x * 0.500000;
/*239*/	  r2.z = 1 + ~floatBitsToInt(r6.w);
/*240*/	  r2.z = r2.z * r6.y + 1.000000;
/*241*/	  r2.x = r2.z * 0.500000 + -r2.x;
/*242*/	  r2.z = min(r2.y, 1.000000);
/*243*/	  r4.x = r5.x * 1.570796;
/*244*/	  r4.x = sin(r4.x);
/*245*/	  r2.z = r2.z + -1.000000;
/*246*/	  r2.z = r4.x * r2.z + 1.000000;
/*247*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*248*/	  r4.x = max(r4.x, 0.000000);
/*249*/	  r4.x = log2(r4.x);
/*250*/	  r4.x = r4.x * 10.000000;
/*251*/	  r4.x = exp2(r4.x);
/*252*/	  r4.x = r5.z * r4.x;
/*253*/	  r4.x = r4.x * r5.w + r1.w;
/*254*/	  r2.x = r2.z * abs(r2.x);
/*255*/	  r4.xyz = (r4.xxxx * r2.xxxx).xyz;
/*256*/	} else {
/*257*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*258*/	}
/*259*/	r5.xyz = saturate(r7.zzzz * r4.xyzx).xyz;
/*260*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*261*/	r4.xyz = (max(r1.wwww, r4.xyzx)).xyz;
/*262*/	r4.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*263*/	r0.xyz = (r0.xyzx * r2.yyyy).xyz;
/*264*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*265*/	r0.xyz = (r4.xyzx * r0.xyzx).xyz;
/*266*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*267*/	r0.xyz = (r1.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*268*/	r0.xyz = (r0.xyzx + r8.xyzx).xyz;
/*269*/	r1.x = sqrt(r2.w);
/*270*/	r1.y = saturate(cb2.data[0].w)/**/;
/*271*/	r1.y = -r1.y + 1.000000;
/*272*/	r1.y = r1.y * 8.000000 + -4.000000;
/*273*/	r1.z = saturate(cb2.data[1].x)/**/;
/*274*/	r1.z = -r1.z + 1.000000;
/*275*/	r1.z = r1.z * 1000.000000;
/*276*/	r1.x = r1.x / r1.z;
/*277*/	r1.x = r1.x + r1.y;
/*278*/	r1.x = r1.x * 1.442695;
/*279*/	r1.x = exp2(r1.x);
/*280*/	r1.x = cb2.data[1].y / r1.x;
/*281*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*282*/	r1.y = -vsOut_T0.y + cb2.data[1].w;
/*283*/	r1.z = -cb2.data[1].z + cb2.data[1].w;
/*284*/	r1.y = r1.y + -cb2.data[1].z;
/*285*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*286*/	r1.y = saturate(r1.z * r1.y);
/*287*/	r1.z = r1.y * -2.000000 + 3.000000;
/*288*/	r1.y = r1.y * r1.y;
/*289*/	r1.y = r1.y * r1.z;
/*290*/	r1.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*291*/	r1.z = sqrt(r1.z);
/*292*/	r1.w = max(cb2.data[2].z, 0.001000);
/*293*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*294*/	r1.z = r1.w * r1.z;
/*295*/	r1.z = min(r1.z, 1.000000);
/*296*/	r1.w = r1.z * -2.000000 + 3.000000;
/*297*/	r1.z = r1.z * r1.z;
/*298*/	r1.z = r1.z * r1.w;
/*299*/	r1.x = cb2.data[2].x * r1.y + r1.x;
/*300*/	r2.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*301*/	r2.xyz = (r2.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*302*/	r2.xyz = (r2.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*303*/	r4.xyz = (r7.xxxx * r2.xyzx).xyz;
/*304*/	r3.w = max(r3.y, 0.000000);
/*305*/	r3.xyzw = (texture(s_sky, r3.xwzx.stp)).xyzw;
/*306*/	r1.y = saturate(dot(vec2(r1.xxxx), vec2(cb2.data[2].yyyy)));
/*307*/	r2.xyz = (-r2.xyzx * r7.xxxx + r3.xyzx).xyz;
/*308*/	r2.xyz = (r1.yyyy * r2.xyzx + r4.xyzx).xyz;
/*309*/	r1.x = saturate(r1.x * r1.z);
/*310*/	r1.yzw = (-r0.xxyz + r2.xxyz).yzw;
/*311*/	color0.xyz = (r1.xxxx * r1.yzwy + r0.xyzx).xyz;
/*312*/	color0.w = r0.w * vsOut_T6.w;
/*313*/	return;
}
