//
//
// Shader Model 4
// Fragment Shader
//
// id: 7868 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_WeightedCloth.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_fire_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D normal0_sampler;
uniform sampler2D normal1_sampler;
uniform sampler2D s_diffuse_damage_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shadowmap_PS
{
  vec4 data[45];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
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
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r1.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r2.x = inversesqrt(r2.x);
/*41*/	r2.yzw = (r1.wwww * r1.xxyz).yzw;
/*42*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*43*/	r5.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*44*/	r2.yzw = sin(vec3(r5.xxyz));
/*45*/	r1.w = r2.z * r2.y;
/*46*/	r1.w = r2.w * r1.w;
/*47*/	r1.w = r1.w * 0.500000 + 1.000000;
/*48*/	r1.w = r1.w * 0.800000 + r5.w;
/*49*/	r2.yzw = (cb0.data[26].xxxx * vec4(0.000000, 2.500000, 0.300000, 0.870000)).yzw;
/*50*/	r2.yzw = sin(vec3(r2.yyzw));
/*51*/	r2.y = r2.z * r2.y;
/*52*/	r2.y = r2.w * r2.y;
/*53*/	r2.y = r2.y * 0.500000 + 1.000000;
/*54*/	r2.z = r2.y * 0.400000;
/*55*/	r2.y = r2.y * 0.500000 + r5.y;
/*56*/	r4.zw = (r1.wwww * vec4(0.000000, 0.000000, 0.200000, 0.200000) + vsOut_T1.xxxy).zw;
/*57*/	r5.xyzw = (texture(normal0_sampler, r4.zwzz.st)).xyzw;
/*58*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*59*/	r5.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*61*/	r1.w = -r1.w + 1.000000;
/*62*/	r1.w = max(r1.w, 0.000000);
/*63*/	r5.z = sqrt(r1.w);
/*64*/	r2.yw = (r2.yyyy * vec4(0.000000, 0.500000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*65*/	r6.xyzw = (texture(normal1_sampler, r2.ywyy.st)).xyzw;
/*66*/	r2.yw = (r6.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*67*/	r2.yw = (r2.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*68*/	r1.w = dot(vec2(r2.ywyy), vec2(r2.ywyy));
/*69*/	r1.w = -r1.w + 1.000000;
/*70*/	r1.w = max(r1.w, 0.000000);
/*71*/	r6.z = sqrt(r1.w);
/*72*/	r6.xy = (r2.zzzz * r2.ywyy).xy;
/*73*/	r2.yzw = (r5.xxyz + r6.xxyz).yzw;
/*74*/	r1.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r2.yzw = (r1.wwww * r2.yyzw).yzw;
/*77*/	r2.xyz = (r3.xyzx * r2.xxxx + r2.yzwy).xyz;
/*78*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*81*/	r3.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*82*/	r3.xyz = (r3.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*83*/	r3.xyz = (vsOut_T9.xxxx * r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*84*/	r5.xyz = (r0.xyzx * r3.xyzx).xyz;
/*85*/	r1.w = r3.w + -vsOut_T9.x;
/*86*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*87*/	if(r1.w != 0) discard;
/*88*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*89*/	r0.w = r0.w + -r1.w;
/*90*/	r2.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*91*/	if(r2.w != 0) discard;
/*92*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*93*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*94*/	r0.w = saturate(r0.w * r1.w);
/*95*/	r1.w = r0.w * -2.000000 + 3.000000;
/*96*/	r0.w = r0.w * r0.w;
/*97*/	r4.zw = (-r1.wwww * r0.wwww + vec4(0.000000, 0.000000, 1.000000, 0.975000)).zw;
/*98*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*99*/	r7.x = 0;
/*100*/	r7.y = cb0.data[26].x * 0.050000;
/*101*/	r6.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r7.xxxy).zw;
/*102*/	r7.xyzw = (texture(s_fire_map, r6.zwzz.st)).xyzw;
/*103*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*104*/	r0.w = saturate(r7.x * 5.000000);
/*105*/	r7.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*106*/	r0.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*107*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*108*/	r1.w = log2(r6.z);
/*109*/	r1.w = r1.w * 1.800000;
/*110*/	r1.w = exp2(r1.w);
/*111*/	r1.w = r1.w * 10.000000;
/*112*/	r1.w = min(r1.w, 1.000000);
/*113*/	r0.w = r0.w + r1.w;
/*114*/	r0.w = r0.w * 0.500000;
/*115*/	r1.w = -r6.w + 1.000000;
/*116*/	r1.w = log2(r1.w);
/*117*/	r1.w = r1.w * r4.z;
/*118*/	r1.w = exp2(r1.w);
/*119*/	r1.w = min(r1.w, 1.000000);
/*120*/	r1.w = r4.z * r1.w;
/*121*/	r2.w = r6.z * 0.250000;
/*122*/	r6.xyw = (r7.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*123*/	r6.xyw = (r0.wwww * r6.xyxw + r2.wwww).xyw;
/*124*/	r0.xyz = (-r0.xyzx * r3.xyzx + r6.xywx).xyz;
/*125*/	r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*126*/	r0.w = max(r4.w, 0.000000);
/*127*/	r3.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*128*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*129*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*131*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*132*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*133*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*134*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*135*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*136*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*137*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*138*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*139*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*140*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*141*/	r1.w = inversesqrt(r1.w);
/*142*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*143*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*144*/	r1.w = inversesqrt(r1.w);
/*145*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*146*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*147*/	r1.w = inversesqrt(r1.w);
/*148*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*149*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*150*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*151*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*152*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*153*/	r1.w = inversesqrt(r1.w);
/*154*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*155*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*156*/	r3.w = 1.000000;
/*157*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*158*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*159*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*160*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*161*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*162*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*163*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*164*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*165*/	r4.y = intBitsToFloat(int(r2.w));
/*166*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*167*/	if(floatBitsToUint(r4.z) != 0u) {
/*168*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*169*/	  r5.w = vsOut_T0.w;
/*170*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*171*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*172*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*173*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*174*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*175*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*176*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*177*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*178*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*179*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*180*/	  if(floatBitsToUint(r4.w) == 0u) {
/*181*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*182*/	    r7.xy = floor((r6.xyxx).xy);
/*183*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*184*/	    r4.z = -0.000400 / r4.z;
/*185*/	    r4.z = r4.z + r6.z;
/*186*/	    r8.z = -r8.y + 1.000000;
/*187*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*188*/	    r8.w = -r8.y;
/*189*/	    r10.x = cb1.data[0].z/**/;
/*190*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*191*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*192*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*193*/	    r10.w = -cb1.data[0].w/**/;
/*194*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*195*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*196*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*197*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*198*/	    r8.x = r9.x;
/*199*/	    r8.y = r11.x;
/*200*/	    r8.z = r10.x;
/*201*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*202*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*203*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*204*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*205*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*206*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*207*/	    r4.z = -r6.x + r6.y;
/*208*/	    r4.z = r4.w * r4.z + r6.x;
/*209*/	  } else {
/*210*/	    r4.z = 1.000000;
/*211*/	  }
/*212*/	} else {
/*213*/	  r4.z = 1.000000;
/*214*/	}
/*215*/	r4.w = cb1.data[34].w + -1.000000;
/*216*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*217*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*218*/	if(floatBitsToUint(r2.w) == 0u) {
/*219*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*220*/	  r2.w = floatBitsToInt(r2.w);
/*221*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*222*/	  if(floatBitsToUint(r2.w) != 0u) {
/*223*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*224*/	    r5.w = vsOut_T0.w;
/*225*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*226*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*227*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*228*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*229*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*230*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*231*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*232*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*233*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*234*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*235*/	    if(floatBitsToUint(r5.w) == 0u) {
/*236*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*237*/	      r6.xy = floor((r5.xyxx).xy);
/*238*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*239*/	      r2.w = -0.000400 / r2.w;
/*240*/	      r2.w = r2.w + r5.z;
/*241*/	      r7.z = -r7.y + 1.000000;
/*242*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*243*/	      r7.w = -r7.y;
/*244*/	      r9.x = cb1.data[0].z/**/;
/*245*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*246*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*247*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*248*/	      r9.w = -cb1.data[0].w/**/;
/*249*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*250*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*251*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*252*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*253*/	      r7.x = r8.x;
/*254*/	      r7.y = r10.x;
/*255*/	      r7.z = r9.x;
/*256*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*257*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*258*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*259*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*260*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*261*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*262*/	      r2.w = -r5.x + r5.z;
/*263*/	      r2.w = r5.y * r2.w + r5.x;
/*264*/	    } else {
/*265*/	      r2.w = 1.000000;
/*266*/	    }
/*267*/	  } else {
/*268*/	    r2.w = 1.000000;
/*269*/	  }
/*270*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*271*/	  r5.y = r5.x * cb1.data[34].x;
/*272*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*273*/	  r5.x = r1.w + -r5.x;
/*274*/	  r5.x = saturate(r5.x / r5.y);
/*275*/	  r2.w = -r4.z + r2.w;
/*276*/	  r4.z = r5.x * r2.w + r4.z;
/*277*/	}
/*278*/	if(floatBitsToUint(r4.w) != 0u) {
/*279*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*280*/	  r4.w = r2.w * cb1.data[34].y;
/*281*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*282*/	  r2.w = r1.w + -r2.w;
/*283*/	  r2.w = saturate(r2.w / r4.w);
/*284*/	  r4.y = -r4.z + 1.000000;
/*285*/	  r4.z = r2.w * r4.y + r4.z;
/*286*/	}
/*287*/	r4.z = saturate(r4.z);
/*288*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*289*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*290*/	r2.w = inversesqrt(r2.w);
/*291*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*292*/	r2.w = -r4.x + 1.000000;
/*293*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*294*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*295*/	r4.w = r4.w + r4.w;
/*296*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*297*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*298*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*299*/	r4.w = cos((r8.x));
/*300*/	r4.w = inversesqrt(r4.w);
/*301*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*302*/	r5.w = saturate(r0.w * 60.000000);
/*303*/	r5.w = -r0.w + r5.w;
/*304*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*305*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*306*/	r6.w = inversesqrt(r6.w);
/*307*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*308*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*309*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*310*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*311*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*312*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*313*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*314*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*315*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*316*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*317*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*318*/	r6.w = -r0.w + 1.000000;
/*319*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*320*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*321*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*322*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*323*/	  r6.w = max(r6.w, 0.000000);
/*324*/	  r6.w = log2(r6.w);
/*325*/	  r6.w = r6.w * 10.000000;
/*326*/	  r6.w = exp2(r6.w);
/*327*/	  r6.w = r4.w * r6.w;
/*328*/	  r6.w = r6.w * r5.w + r0.w;
/*329*/	  r7.y = r2.w * 8.000000;
/*330*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*331*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*332*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*333*/	}
/*334*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*335*/	r7.y = max(r6.w, 0.000000);
/*336*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*337*/	if(floatBitsToUint(r6.w) != 0u) {
/*338*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*339*/	  r6.x = max(r6.x, -1.000000);
/*340*/	  r6.x = min(r6.x, 1.000000);
/*341*/	  r6.y = -abs(r6.x) + 1.000000;
/*342*/	  r6.y = sqrt(r6.y);
/*343*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*344*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*345*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*346*/	  r6.w = r6.y * r6.z;
/*347*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*348*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*349*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*350*/	  r6.x = r6.z * r6.y + r6.x;
/*351*/	  r4.x = r4.x * r4.x;
/*352*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*353*/	  r4.x = r4.x * r4.y + r7.x;
/*354*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*355*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*356*/	  r4.y = -r4.x * r4.x + 1.000000;
/*357*/	  r4.y = max(r4.y, 0.001000);
/*358*/	  r4.y = log2(r4.y);
/*359*/	  r6.y = r4.y * 4.950617;
/*360*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*361*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*362*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*363*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*364*/	  r4.x = floatBitsToInt(r4.x);
/*365*/	  r6.y = r4.y * r4.y + -r6.y;
/*366*/	  r6.y = sqrt(r6.y);
/*367*/	  r4.y = -r4.y + r6.y;
/*368*/	  r4.y = max(r4.y, 0.000000);
/*369*/	  r4.y = sqrt(r4.y);
/*370*/	  r4.x = r4.y * r4.x;
/*371*/	  r4.x = r4.x * 1.414214;
/*372*/	  r4.x = 0.008727 / r4.x;
/*373*/	  r4.x = max(r4.x, 0.000100);
/*374*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*375*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*376*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*377*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*378*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*379*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*380*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*381*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*382*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*383*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*384*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*385*/	  r4.x = floatBitsToInt(r4.x);
/*386*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*387*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*388*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*389*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*390*/	  r4.x = r4.x * r6.x + 1.000000;
/*391*/	  r4.x = r4.x * 0.500000;
/*392*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*393*/	  r4.y = r4.y * r6.y + 1.000000;
/*394*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*395*/	  r4.y = min(r7.y, 1.000000);
/*396*/	  r2.w = r2.w * 1.570796;
/*397*/	  r2.w = sin(r2.w);
/*398*/	  r4.y = r4.y + -1.000000;
/*399*/	  r2.w = r2.w * r4.y + 1.000000;
/*400*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*401*/	  r4.y = max(r4.y, 0.000000);
/*402*/	  r4.y = log2(r4.y);
/*403*/	  r4.y = r4.y * 10.000000;
/*404*/	  r4.y = exp2(r4.y);
/*405*/	  r4.y = r4.w * r4.y;
/*406*/	  r4.y = r4.y * r5.w + r0.w;
/*407*/	  r2.w = r2.w * abs(r4.x);
/*408*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*409*/	} else {
/*410*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*411*/	}
/*412*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*413*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*414*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*415*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*416*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*417*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*418*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*419*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*420*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*421*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*422*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*423*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*424*/	r2.w = inversesqrt(r2.w);
/*425*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*426*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*427*/	r2.w = r2.w + r2.w;
/*428*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*429*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*430*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*431*/	r2.x = max(r2.x, 0.000000);
/*432*/	r2.x = log2(r2.x);
/*433*/	r2.x = r2.x * 10.000000;
/*434*/	r2.x = exp2(r2.x);
/*435*/	r2.x = r4.w * r2.x;
/*436*/	r0.w = r2.x * r5.w + r0.w;
/*437*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*438*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*439*/	color0.w = 2.000000;
/*440*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*441*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*442*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*443*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*444*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*445*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*446*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*447*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*448*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*449*/	if(r0.x != 0) discard;
/*450*/	color1.x = 1.000000;
/*451*/	return;
}
