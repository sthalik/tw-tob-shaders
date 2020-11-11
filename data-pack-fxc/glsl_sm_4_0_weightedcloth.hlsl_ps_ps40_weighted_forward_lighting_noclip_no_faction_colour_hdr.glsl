//
//
// Shader Model 4
// Fragment Shader
//
// id: 3804 - fxc/glsl_SM_4_0_WeightedCloth.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_environment;
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
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
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
/*11*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*13*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*14*/	r1.w = r5.w * r6.w;
/*15*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*16*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*17*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*18*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*19*/	r2.x = inversesqrt(r2.x);
/*20*/	r2.yzw = (r1.wwww * r1.xxyz).yzw;
/*21*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*22*/	r5.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*23*/	r2.yzw = sin(vec3(r5.xxyz));
/*24*/	r1.w = r2.z * r2.y;
/*25*/	r1.w = r2.w * r1.w;
/*26*/	r1.w = r1.w * 0.500000 + 1.000000;
/*27*/	r1.w = r1.w * 0.800000 + r5.w;
/*28*/	r2.yzw = (cb0.data[26].xxxx * vec4(0.000000, 2.500000, 0.300000, 0.870000)).yzw;
/*29*/	r2.yzw = sin(vec3(r2.yyzw));
/*30*/	r2.y = r2.z * r2.y;
/*31*/	r2.y = r2.w * r2.y;
/*32*/	r2.y = r2.y * 0.500000 + 1.000000;
/*33*/	r2.z = r2.y * 0.400000;
/*34*/	r2.y = r2.y * 0.500000 + r5.y;
/*35*/	r4.zw = (r1.wwww * vec4(0.000000, 0.000000, 0.200000, 0.200000) + vsOut_T1.xxxy).zw;
/*36*/	r5.xyzw = (texture(normal0_sampler, r4.zwzz.st)).xyzw;
/*37*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*38*/	r5.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*40*/	r1.w = -r1.w + 1.000000;
/*41*/	r1.w = max(r1.w, 0.000000);
/*42*/	r5.z = sqrt(r1.w);
/*43*/	r2.yw = (r2.yyyy * vec4(0.000000, 0.500000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*44*/	r6.xyzw = (texture(normal1_sampler, r2.ywyy.st)).xyzw;
/*45*/	r2.yw = (r6.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*46*/	r2.yw = (r2.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*47*/	r1.w = dot(vec2(r2.ywyy), vec2(r2.ywyy));
/*48*/	r1.w = -r1.w + 1.000000;
/*49*/	r1.w = max(r1.w, 0.000000);
/*50*/	r6.z = sqrt(r1.w);
/*51*/	r6.xy = (r2.zzzz * r2.ywyy).xy;
/*52*/	r2.yzw = (r5.xxyz + r6.xxyz).yzw;
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
/*63*/	r5.xyz = (r0.xyzx * r3.xyzx).xyz;
/*64*/	r1.w = r3.w + -vsOut_T9.x;
/*65*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*66*/	if(r1.w != 0) discard;
/*67*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*68*/	r0.w = r0.w + -r1.w;
/*69*/	r2.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*70*/	if(r2.w != 0) discard;
/*71*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*72*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*73*/	r0.w = saturate(r0.w * r1.w);
/*74*/	r1.w = r0.w * -2.000000 + 3.000000;
/*75*/	r0.w = r0.w * r0.w;
/*76*/	r4.zw = (-r1.wwww * r0.wwww + vec4(0.000000, 0.000000, 1.000000, 0.975000)).zw;
/*77*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*78*/	r7.x = 0;
/*79*/	r7.y = cb0.data[26].x * 0.050000;
/*80*/	r6.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r7.xxxy).zw;
/*81*/	r7.xyzw = (texture(s_fire_map, r6.zwzz.st)).xyzw;
/*82*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*83*/	r0.w = saturate(r7.x * 5.000000);
/*84*/	r7.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*85*/	r0.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*86*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*87*/	r1.w = log2(r6.z);
/*88*/	r1.w = r1.w * 1.800000;
/*89*/	r1.w = exp2(r1.w);
/*90*/	r1.w = r1.w * 10.000000;
/*91*/	r1.w = min(r1.w, 1.000000);
/*92*/	r0.w = r0.w + r1.w;
/*93*/	r0.w = r0.w * 0.500000;
/*94*/	r1.w = -r6.w + 1.000000;
/*95*/	r1.w = log2(r1.w);
/*96*/	r1.w = r1.w * r4.z;
/*97*/	r1.w = exp2(r1.w);
/*98*/	r1.w = min(r1.w, 1.000000);
/*99*/	r1.w = r4.z * r1.w;
/*100*/	r2.w = r6.z * 0.250000;
/*101*/	r6.xyw = (r7.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*102*/	r6.xyw = (r0.wwww * r6.xyxw + r2.wwww).xyw;
/*103*/	r0.xyz = (-r0.xyzx * r3.xyzx + r6.xywx).xyz;
/*104*/	r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*105*/	r0.w = max(r4.w, 0.000000);
/*106*/	r3.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*107*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*108*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*109*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*110*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*111*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*112*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*113*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*114*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*115*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*116*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*117*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*118*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*119*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*120*/	r1.w = inversesqrt(r1.w);
/*121*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*122*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*123*/	r1.w = inversesqrt(r1.w);
/*124*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*125*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*126*/	r1.w = inversesqrt(r1.w);
/*127*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*128*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*129*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*130*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*131*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*132*/	r1.w = inversesqrt(r1.w);
/*133*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*134*/	r3.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*135*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*136*/	r1.w = inversesqrt(r1.w);
/*137*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*138*/	r1.w = -r4.x + 1.000000;
/*139*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*140*/	r3.w = dot(vec3(r3.xyzx), vec3(r2.xyzx));
/*141*/	r3.w = r3.w + r3.w;
/*142*/	r4.yzw = (r2.xxyz * -r3.wwww + r3.xxyz).yzw;
/*143*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*144*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*145*/	r3.w = cos((r6.x));
/*146*/	r3.w = inversesqrt(r3.w);
/*147*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*148*/	r5.w = saturate(r0.w * 60.000000);
/*149*/	r5.w = -r0.w + r5.w;
/*150*/	r6.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*151*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*152*/	r7.x = inversesqrt(r7.x);
/*153*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*154*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*155*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*156*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*157*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*158*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*159*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*160*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*161*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*162*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*163*/	r6.xzw = (r0.xxyz * r6.xxzw).xzw;
/*164*/	r5.y = -r0.w + 1.000000;
/*165*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*166*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*167*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*168*/	  r5.y = dot(vec3(r4.yzwy), vec3(r3.xyzx));
/*169*/	  r5.y = max(r5.y, 0.000000);
/*170*/	  r5.y = log2(r5.y);
/*171*/	  r5.y = r5.y * 10.000000;
/*172*/	  r5.y = exp2(r5.y);
/*173*/	  r5.y = r3.w * r5.y;
/*174*/	  r5.y = r5.y * r5.w + r0.w;
/*175*/	  r7.x = r1.w * 8.000000;
/*176*/	  r7.xyzw = (textureLod(s_environment, r4.yzwy.stp, r7.x)).xyzw;
/*177*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*178*/	  r6.xzw = (r7.xxyz * r1.xxyz + r6.xxzw).xzw;
/*179*/	}
/*180*/	r5.y = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*181*/	r7.x = max(r5.y, 0.000000);
/*182*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*183*/	if(floatBitsToUint(r5.y) != 0u) {
/*184*/	  r4.y = dot(vec3(-cb1.data[0].yzwy), vec3(r4.yzwy));
/*185*/	  r4.y = max(r4.y, -1.000000);
/*186*/	  r4.y = min(r4.y, 1.000000);
/*187*/	  r4.z = -abs(r4.y) + 1.000000;
/*188*/	  r4.z = sqrt(r4.z);
/*189*/	  r4.w = abs(r4.y) * -0.018729 + 0.074261;
/*190*/	  r4.w = r4.w * abs(r4.y) + -0.212114;
/*191*/	  r4.w = r4.w * abs(r4.y) + 1.570729;
/*192*/	  r5.y = r4.z * r4.w;
/*193*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*194*/	  r4.y = uintBitsToFloat((r4.y < -r4.y) ? 0xffffffffu : 0x00000000u);
/*195*/	  r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r5.y));
/*196*/	  r4.y = r4.w * r4.z + r4.y;
/*197*/	  r4.x = r4.x * r4.x;
/*198*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*199*/	  r2.w = r4.x * r2.w + r5.x;
/*200*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*201*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*202*/	  r4.x = -r2.w * r2.w + 1.000000;
/*203*/	  r4.x = max(r4.x, 0.001000);
/*204*/	  r4.x = log2(r4.x);
/*205*/	  r4.z = r4.x * 4.950617;
/*206*/	  r4.x = r4.x * 0.346574 + 4.546885;
/*207*/	  r4.w = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*208*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*209*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.w) + floatBitsToInt(r2.w));
/*210*/	  r2.w = floatBitsToInt(r2.w);
/*211*/	  r4.z = r4.x * r4.x + -r4.z;
/*212*/	  r4.z = sqrt(r4.z);
/*213*/	  r4.x = -r4.x + r4.z;
/*214*/	  r4.x = max(r4.x, 0.000000);
/*215*/	  r4.x = sqrt(r4.x);
/*216*/	  r2.w = r2.w * r4.x;
/*217*/	  r2.w = r2.w * 1.414214;
/*218*/	  r2.w = 0.008727 / r2.w;
/*219*/	  r2.w = max(r2.w, 0.000100);
/*220*/	  r4.xy = (r4.yyyy + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*221*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*222*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*223*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*224*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*225*/	  r8.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*226*/	  r7.yz = (r8.xxzx / r8.yywy).yz;
/*227*/	  r4.zw = (-r4.zzzw * r7.yyyz).zw;
/*228*/	  r7.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*229*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*230*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r7.y) + floatBitsToInt(r2.w));
/*231*/	  r2.w = floatBitsToInt(r2.w);
/*232*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*233*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*234*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*235*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*236*/	  r2.w = r2.w * r4.x + 1.000000;
/*237*/	  r2.w = r2.w * 0.500000;
/*238*/	  r4.x = 1 + ~floatBitsToInt(r7.z);
/*239*/	  r4.x = r4.x * r4.y + 1.000000;
/*240*/	  r2.w = r4.x * 0.500000 + -r2.w;
/*241*/	  r4.x = min(r7.x, 1.000000);
/*242*/	  r1.w = r1.w * 1.570796;
/*243*/	  r1.w = sin(r1.w);
/*244*/	  r4.x = r4.x + -1.000000;
/*245*/	  r1.w = r1.w * r4.x + 1.000000;
/*246*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.xyzx));
/*247*/	  r3.x = max(r3.x, 0.000000);
/*248*/	  r3.x = log2(r3.x);
/*249*/	  r3.x = r3.x * 10.000000;
/*250*/	  r3.x = exp2(r3.x);
/*251*/	  r3.x = r3.w * r3.x;
/*252*/	  r3.x = r3.x * r5.w + r0.w;
/*253*/	  r1.w = r1.w * abs(r2.w);
/*254*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*255*/	} else {
/*256*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*257*/	}
/*258*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*259*/	r4.xyz = (r1.xyzx * r4.xyzx).xyz;
/*260*/	r3.xyz = (max(r0.wwww, r3.xyzx)).xyz;
/*261*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*262*/	r0.xyz = (r0.xyzx * r7.xxxx).xyz;
/*263*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*264*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*265*/	r0.xyz = (r5.xxxx * r0.xyzx).xyz;
/*266*/	r0.xyz = (r4.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*267*/	r0.xyz = (r0.xyzx + r6.xzwx).xyz;
/*268*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*269*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*270*/	r1.w = inversesqrt(r1.w);
/*271*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*272*/	r1.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*273*/	r1.w = r1.w + r1.w;
/*274*/	r2.xyz = (r2.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*275*/	r4.xyzw = (textureLod(s_environment, r2.xyzx.stp, r6.y)).xyzw;
/*276*/	r1.w = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*277*/	r1.w = max(r1.w, 0.000000);
/*278*/	r1.w = log2(r1.w);
/*279*/	r1.w = r1.w * 10.000000;
/*280*/	r1.w = exp2(r1.w);
/*281*/	r1.w = r3.w * r1.w;
/*282*/	r0.w = r1.w * r5.w + r0.w;
/*283*/	r2.xyz = (r4.xyzx * r0.wwww).xyz;
/*284*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*285*/	color0.w = 2.000000;
/*286*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*287*/	r0.w = 1.000000;
/*288*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*289*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*290*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*291*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*292*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*293*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*294*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*295*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*296*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*297*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*298*/	if(r0.x != 0) discard;
/*299*/	color1.x = 1.000000;
/*300*/	return;
}
