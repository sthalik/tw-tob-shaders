//
//
// Shader Model 4
// Fragment Shader
//
// id: 7870 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_WeightedCloth.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r1.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r1.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r1.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r1.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r1.w = -r1.w + 1.000000;
/*25*/	r1.w = max(r1.w, 0.000000);
/*26*/	r3.z = sqrt(r1.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*31*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*32*/	r1.w = r5.w * r6.w;
/*33*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*35*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*36*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	r2.x = inversesqrt(r2.x);
/*38*/	r2.yzw = (r1.wwww * r1.xxyz).yzw;
/*39*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*40*/	r5.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*41*/	r2.yzw = sin(vec3(r5.xxyz));
/*42*/	r1.w = r2.z * r2.y;
/*43*/	r1.w = r2.w * r1.w;
/*44*/	r1.w = r1.w * 0.500000 + 1.000000;
/*45*/	r1.w = r1.w * 0.800000 + r5.w;
/*46*/	r2.yzw = (cb0.data[26].xxxx * vec4(0.000000, 2.500000, 0.300000, 0.870000)).yzw;
/*47*/	r2.yzw = sin(vec3(r2.yyzw));
/*48*/	r2.y = r2.z * r2.y;
/*49*/	r2.y = r2.w * r2.y;
/*50*/	r2.y = r2.y * 0.500000 + 1.000000;
/*51*/	r2.z = r2.y * 0.400000;
/*52*/	r2.y = r2.y * 0.500000 + r5.y;
/*53*/	r4.zw = (r1.wwww * vec4(0.000000, 0.000000, 0.200000, 0.200000) + vsOut_T1.xxxy).zw;
/*54*/	r5.xyzw = (texture(normal0_sampler, r4.zwzz.st)).xyzw;
/*55*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*56*/	r5.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*57*/	r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*58*/	r1.w = -r1.w + 1.000000;
/*59*/	r1.w = max(r1.w, 0.000000);
/*60*/	r5.z = sqrt(r1.w);
/*61*/	r2.yw = (r2.yyyy * vec4(0.000000, 0.500000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*62*/	r6.xyzw = (texture(normal1_sampler, r2.ywyy.st)).xyzw;
/*63*/	r2.yw = (r6.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*64*/	r2.yw = (r2.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*65*/	r1.w = dot(vec2(r2.ywyy), vec2(r2.ywyy));
/*66*/	r1.w = -r1.w + 1.000000;
/*67*/	r1.w = max(r1.w, 0.000000);
/*68*/	r6.z = sqrt(r1.w);
/*69*/	r6.xy = (r2.zzzz * r2.ywyy).xy;
/*70*/	r2.yzw = (r5.xxyz + r6.xxyz).yzw;
/*71*/	r1.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r2.yzw = (r1.wwww * r2.yyzw).yzw;
/*74*/	r2.xyz = (r3.xyzx * r2.xxxx + r2.yzwy).xyz;
/*75*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*76*/	r1.w = inversesqrt(r1.w);
/*77*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*78*/	r3.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*79*/	r3.xyz = (r3.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*80*/	r3.xyz = (vsOut_T9.xxxx * r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*81*/	r5.xyz = (r0.xyzx * r3.xyzx).xyz;
/*82*/	r1.w = r3.w + -vsOut_T9.x;
/*83*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*84*/	if(r1.w != 0) discard;
/*85*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*86*/	r0.w = r0.w + -r1.w;
/*87*/	r2.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*88*/	if(r2.w != 0) discard;
/*89*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*90*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*91*/	r0.w = saturate(r0.w * r1.w);
/*92*/	r1.w = r0.w * -2.000000 + 3.000000;
/*93*/	r0.w = r0.w * r0.w;
/*94*/	r4.zw = (-r1.wwww * r0.wwww + vec4(0.000000, 0.000000, 1.000000, 0.975000)).zw;
/*95*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*96*/	r7.x = 0;
/*97*/	r7.y = cb0.data[26].x * 0.050000;
/*98*/	r6.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r7.xxxy).zw;
/*99*/	r7.xyzw = (texture(s_fire_map, r6.zwzz.st)).xyzw;
/*100*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*101*/	r0.w = saturate(r7.x * 5.000000);
/*102*/	r7.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*103*/	r0.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*104*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*105*/	r1.w = log2(r6.z);
/*106*/	r1.w = r1.w * 1.800000;
/*107*/	r1.w = exp2(r1.w);
/*108*/	r1.w = r1.w * 10.000000;
/*109*/	r1.w = min(r1.w, 1.000000);
/*110*/	r0.w = r0.w + r1.w;
/*111*/	r0.w = r0.w * 0.500000;
/*112*/	r1.w = -r6.w + 1.000000;
/*113*/	r1.w = log2(r1.w);
/*114*/	r1.w = r1.w * r4.z;
/*115*/	r1.w = exp2(r1.w);
/*116*/	r1.w = min(r1.w, 1.000000);
/*117*/	r1.w = r4.z * r1.w;
/*118*/	r2.w = r6.z * 0.250000;
/*119*/	r6.xyw = (r7.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*120*/	r6.xyw = (r0.wwww * r6.xyxw + r2.wwww).xyw;
/*121*/	r0.xyz = (-r0.xyzx * r3.xyzx + r6.xywx).xyz;
/*122*/	r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*123*/	r0.w = max(r4.w, 0.000000);
/*124*/	r3.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*125*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*126*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*127*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*128*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*129*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*131*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*132*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*133*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*134*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*135*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*136*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*137*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*138*/	r1.w = inversesqrt(r1.w);
/*139*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*140*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*141*/	r1.w = inversesqrt(r1.w);
/*142*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*143*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*144*/	r1.w = inversesqrt(r1.w);
/*145*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*146*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*147*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*148*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*149*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*150*/	r1.w = inversesqrt(r1.w);
/*151*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*152*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*153*/	r3.w = 1.000000;
/*154*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*155*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*156*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*157*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*158*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*159*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*160*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*161*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*162*/	r4.y = intBitsToFloat(int(r2.w));
/*163*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*164*/	if(floatBitsToUint(r4.z) != 0u) {
/*165*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*166*/	  r5.w = vsOut_T0.w;
/*167*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*168*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*169*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*170*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*171*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*172*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*173*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*174*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*175*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*176*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*177*/	  if(floatBitsToUint(r4.w) == 0u) {
/*178*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*179*/	    r7.xy = floor((r6.xyxx).xy);
/*180*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*181*/	    r4.z = -0.000400 / r4.z;
/*182*/	    r4.z = r4.z + r6.z;
/*183*/	    r8.z = -r8.y + 1.000000;
/*184*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*185*/	    r8.w = -r8.y;
/*186*/	    r10.x = cb1.data[0].z/**/;
/*187*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*188*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*189*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*190*/	    r10.w = -cb1.data[0].w/**/;
/*191*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*192*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*193*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*194*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*195*/	    r8.x = r9.x;
/*196*/	    r8.y = r11.x;
/*197*/	    r8.z = r10.x;
/*198*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*199*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*200*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*201*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*202*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*203*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*204*/	    r4.z = -r6.x + r6.y;
/*205*/	    r4.z = r4.w * r4.z + r6.x;
/*206*/	  } else {
/*207*/	    r4.z = 1.000000;
/*208*/	  }
/*209*/	} else {
/*210*/	  r4.z = 1.000000;
/*211*/	}
/*212*/	r4.w = cb1.data[34].w + -1.000000;
/*213*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*214*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*215*/	if(floatBitsToUint(r2.w) == 0u) {
/*216*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*217*/	  r2.w = floatBitsToInt(r2.w);
/*218*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*219*/	  if(floatBitsToUint(r2.w) != 0u) {
/*220*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*221*/	    r5.w = vsOut_T0.w;
/*222*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*223*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*224*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*225*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*226*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*227*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*228*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*229*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*230*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*231*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*232*/	    if(floatBitsToUint(r5.w) == 0u) {
/*233*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*234*/	      r6.xy = floor((r5.xyxx).xy);
/*235*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*236*/	      r2.w = -0.000400 / r2.w;
/*237*/	      r2.w = r2.w + r5.z;
/*238*/	      r7.z = -r7.y + 1.000000;
/*239*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*240*/	      r7.w = -r7.y;
/*241*/	      r9.x = cb1.data[0].z/**/;
/*242*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*243*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*244*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*245*/	      r9.w = -cb1.data[0].w/**/;
/*246*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*247*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*248*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*249*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*250*/	      r7.x = r8.x;
/*251*/	      r7.y = r10.x;
/*252*/	      r7.z = r9.x;
/*253*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*254*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*255*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*256*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*257*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*258*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*259*/	      r2.w = -r5.x + r5.z;
/*260*/	      r2.w = r5.y * r2.w + r5.x;
/*261*/	    } else {
/*262*/	      r2.w = 1.000000;
/*263*/	    }
/*264*/	  } else {
/*265*/	    r2.w = 1.000000;
/*266*/	  }
/*267*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*268*/	  r5.y = r5.x * cb1.data[34].x;
/*269*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*270*/	  r5.x = r1.w + -r5.x;
/*271*/	  r5.x = saturate(r5.x / r5.y);
/*272*/	  r2.w = -r4.z + r2.w;
/*273*/	  r4.z = r5.x * r2.w + r4.z;
/*274*/	}
/*275*/	if(floatBitsToUint(r4.w) != 0u) {
/*276*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*277*/	  r4.w = r2.w * cb1.data[34].y;
/*278*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*279*/	  r2.w = r1.w + -r2.w;
/*280*/	  r2.w = saturate(r2.w / r4.w);
/*281*/	  r4.y = -r4.z + 1.000000;
/*282*/	  r4.z = r2.w * r4.y + r4.z;
/*283*/	}
/*284*/	r4.z = saturate(r4.z);
/*285*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*286*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*287*/	r2.w = inversesqrt(r2.w);
/*288*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*289*/	r2.w = -r4.x + 1.000000;
/*290*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*291*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*292*/	r4.w = r4.w + r4.w;
/*293*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*294*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*295*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*296*/	r4.w = cos((r8.x));
/*297*/	r4.w = inversesqrt(r4.w);
/*298*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*299*/	r5.w = saturate(r0.w * 60.000000);
/*300*/	r5.w = -r0.w + r5.w;
/*301*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*302*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*303*/	r6.w = inversesqrt(r6.w);
/*304*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*305*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*306*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*307*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*308*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*309*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*310*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*311*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*312*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*313*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*314*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*315*/	r6.w = -r0.w + 1.000000;
/*316*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*317*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*318*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*319*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*320*/	  r6.w = max(r6.w, 0.000000);
/*321*/	  r6.w = log2(r6.w);
/*322*/	  r6.w = r6.w * 10.000000;
/*323*/	  r6.w = exp2(r6.w);
/*324*/	  r6.w = r4.w * r6.w;
/*325*/	  r6.w = r6.w * r5.w + r0.w;
/*326*/	  r7.y = r2.w * 8.000000;
/*327*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*328*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*329*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*330*/	}
/*331*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*332*/	r7.y = max(r6.w, 0.000000);
/*333*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*334*/	if(floatBitsToUint(r6.w) != 0u) {
/*335*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*336*/	  r6.x = max(r6.x, -1.000000);
/*337*/	  r6.x = min(r6.x, 1.000000);
/*338*/	  r6.y = -abs(r6.x) + 1.000000;
/*339*/	  r6.y = sqrt(r6.y);
/*340*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*341*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*342*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*343*/	  r6.w = r6.y * r6.z;
/*344*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*345*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*346*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*347*/	  r6.x = r6.z * r6.y + r6.x;
/*348*/	  r4.x = r4.x * r4.x;
/*349*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*350*/	  r4.x = r4.x * r4.y + r7.x;
/*351*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*352*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*353*/	  r4.y = -r4.x * r4.x + 1.000000;
/*354*/	  r4.y = max(r4.y, 0.001000);
/*355*/	  r4.y = log2(r4.y);
/*356*/	  r6.y = r4.y * 4.950617;
/*357*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*358*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*359*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*360*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*361*/	  r4.x = floatBitsToInt(r4.x);
/*362*/	  r6.y = r4.y * r4.y + -r6.y;
/*363*/	  r6.y = sqrt(r6.y);
/*364*/	  r4.y = -r4.y + r6.y;
/*365*/	  r4.y = max(r4.y, 0.000000);
/*366*/	  r4.y = sqrt(r4.y);
/*367*/	  r4.x = r4.y * r4.x;
/*368*/	  r4.x = r4.x * 1.414214;
/*369*/	  r4.x = 0.008727 / r4.x;
/*370*/	  r4.x = max(r4.x, 0.000100);
/*371*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*372*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*373*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*374*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*375*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*376*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*377*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*378*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*379*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*380*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*381*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*382*/	  r4.x = floatBitsToInt(r4.x);
/*383*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*384*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*385*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*386*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*387*/	  r4.x = r4.x * r6.x + 1.000000;
/*388*/	  r4.x = r4.x * 0.500000;
/*389*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*390*/	  r4.y = r4.y * r6.y + 1.000000;
/*391*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*392*/	  r4.y = min(r7.y, 1.000000);
/*393*/	  r2.w = r2.w * 1.570796;
/*394*/	  r2.w = sin(r2.w);
/*395*/	  r4.y = r4.y + -1.000000;
/*396*/	  r2.w = r2.w * r4.y + 1.000000;
/*397*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*398*/	  r4.y = max(r4.y, 0.000000);
/*399*/	  r4.y = log2(r4.y);
/*400*/	  r4.y = r4.y * 10.000000;
/*401*/	  r4.y = exp2(r4.y);
/*402*/	  r4.y = r4.w * r4.y;
/*403*/	  r4.y = r4.y * r5.w + r0.w;
/*404*/	  r2.w = r2.w * abs(r4.x);
/*405*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*406*/	} else {
/*407*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*408*/	}
/*409*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*410*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*411*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*412*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*413*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*414*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*415*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*416*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*417*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*418*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*419*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*420*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*421*/	r2.w = inversesqrt(r2.w);
/*422*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*423*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*424*/	r2.w = r2.w + r2.w;
/*425*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*426*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*427*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*428*/	r2.x = max(r2.x, 0.000000);
/*429*/	r2.x = log2(r2.x);
/*430*/	r2.x = r2.x * 10.000000;
/*431*/	r2.x = exp2(r2.x);
/*432*/	r2.x = r4.w * r2.x;
/*433*/	r0.w = r2.x * r5.w + r0.w;
/*434*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*435*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*436*/	color0.w = 2.000000;
/*437*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*438*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*439*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*440*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*441*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*442*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*443*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*444*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*445*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*446*/	if(r0.x != 0) discard;
/*447*/	color1.x = 1.000000;
/*448*/	return;
}
