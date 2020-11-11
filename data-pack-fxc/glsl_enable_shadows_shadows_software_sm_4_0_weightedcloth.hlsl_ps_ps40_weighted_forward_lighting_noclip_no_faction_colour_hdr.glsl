//
//
// Shader Model 4
// Fragment Shader
//
// id: 7874 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_WeightedCloth.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D sHardShadowBuffer;
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
/*134*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*135*/	r3.w = 1.000000;
/*136*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*137*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*138*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*139*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*140*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*141*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*142*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*143*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*144*/	r4.y = intBitsToFloat(int(r2.w));
/*145*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*146*/	if(floatBitsToUint(r4.z) != 0u) {
/*147*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*148*/	  r5.w = vsOut_T0.w;
/*149*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*150*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*151*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*152*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*153*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*154*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*155*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*156*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*157*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*158*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*159*/	  if(floatBitsToUint(r4.w) == 0u) {
/*160*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*161*/	    r7.xy = floor((r6.xyxx).xy);
/*162*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*163*/	    r4.z = -0.000400 / r4.z;
/*164*/	    r4.z = r4.z + r6.z;
/*165*/	    r8.z = -r8.y + 1.000000;
/*166*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*167*/	    r8.w = -r8.y;
/*168*/	    r10.x = cb1.data[0].z/**/;
/*169*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*170*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*171*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*172*/	    r10.w = -cb1.data[0].w/**/;
/*173*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*174*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*175*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*176*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*177*/	    r8.x = r9.x;
/*178*/	    r8.y = r11.x;
/*179*/	    r8.z = r10.x;
/*180*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*181*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*182*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*183*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*184*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*185*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*186*/	    r4.z = -r6.x + r6.y;
/*187*/	    r4.z = r4.w * r4.z + r6.x;
/*188*/	  } else {
/*189*/	    r4.z = 1.000000;
/*190*/	  }
/*191*/	} else {
/*192*/	  r4.z = 1.000000;
/*193*/	}
/*194*/	r4.w = cb1.data[34].w + -1.000000;
/*195*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*196*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*197*/	if(floatBitsToUint(r2.w) == 0u) {
/*198*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*199*/	  r2.w = floatBitsToInt(r2.w);
/*200*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*201*/	  if(floatBitsToUint(r2.w) != 0u) {
/*202*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*203*/	    r5.w = vsOut_T0.w;
/*204*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*205*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*206*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*207*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*208*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*209*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*210*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*211*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*212*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*213*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*214*/	    if(floatBitsToUint(r5.w) == 0u) {
/*215*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*216*/	      r6.xy = floor((r5.xyxx).xy);
/*217*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*218*/	      r2.w = -0.000400 / r2.w;
/*219*/	      r2.w = r2.w + r5.z;
/*220*/	      r7.z = -r7.y + 1.000000;
/*221*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*222*/	      r7.w = -r7.y;
/*223*/	      r9.x = cb1.data[0].z/**/;
/*224*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*225*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*226*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*227*/	      r9.w = -cb1.data[0].w/**/;
/*228*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*229*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*230*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*231*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*232*/	      r7.x = r8.x;
/*233*/	      r7.y = r10.x;
/*234*/	      r7.z = r9.x;
/*235*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*236*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*237*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*238*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*239*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*240*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*241*/	      r2.w = -r5.x + r5.z;
/*242*/	      r2.w = r5.y * r2.w + r5.x;
/*243*/	    } else {
/*244*/	      r2.w = 1.000000;
/*245*/	    }
/*246*/	  } else {
/*247*/	    r2.w = 1.000000;
/*248*/	  }
/*249*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*250*/	  r5.y = r5.x * cb1.data[34].x;
/*251*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*252*/	  r5.x = r1.w + -r5.x;
/*253*/	  r5.x = saturate(r5.x / r5.y);
/*254*/	  r2.w = -r4.z + r2.w;
/*255*/	  r4.z = r5.x * r2.w + r4.z;
/*256*/	}
/*257*/	if(floatBitsToUint(r4.w) != 0u) {
/*258*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*259*/	  r4.w = r2.w * cb1.data[34].y;
/*260*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*261*/	  r2.w = r1.w + -r2.w;
/*262*/	  r2.w = saturate(r2.w / r4.w);
/*263*/	  r4.y = -r4.z + 1.000000;
/*264*/	  r4.z = r2.w * r4.y + r4.z;
/*265*/	}
/*266*/	r4.z = saturate(r4.z);
/*267*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*268*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*269*/	r2.w = inversesqrt(r2.w);
/*270*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*271*/	r2.w = -r4.x + 1.000000;
/*272*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*273*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*274*/	r4.w = r4.w + r4.w;
/*275*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*276*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*277*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*278*/	r4.w = cos((r8.x));
/*279*/	r4.w = inversesqrt(r4.w);
/*280*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*281*/	r5.w = saturate(r0.w * 60.000000);
/*282*/	r5.w = -r0.w + r5.w;
/*283*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*284*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*285*/	r6.w = inversesqrt(r6.w);
/*286*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*287*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*288*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*289*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*290*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*291*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*292*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*293*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*294*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*295*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*296*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*297*/	r6.w = -r0.w + 1.000000;
/*298*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*299*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*300*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*301*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*302*/	  r6.w = max(r6.w, 0.000000);
/*303*/	  r6.w = log2(r6.w);
/*304*/	  r6.w = r6.w * 10.000000;
/*305*/	  r6.w = exp2(r6.w);
/*306*/	  r6.w = r4.w * r6.w;
/*307*/	  r6.w = r6.w * r5.w + r0.w;
/*308*/	  r7.y = r2.w * 8.000000;
/*309*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*310*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*311*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*312*/	}
/*313*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*314*/	r7.y = max(r6.w, 0.000000);
/*315*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*316*/	if(floatBitsToUint(r6.w) != 0u) {
/*317*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*318*/	  r6.x = max(r6.x, -1.000000);
/*319*/	  r6.x = min(r6.x, 1.000000);
/*320*/	  r6.y = -abs(r6.x) + 1.000000;
/*321*/	  r6.y = sqrt(r6.y);
/*322*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*323*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*324*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*325*/	  r6.w = r6.y * r6.z;
/*326*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*327*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*328*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*329*/	  r6.x = r6.z * r6.y + r6.x;
/*330*/	  r4.x = r4.x * r4.x;
/*331*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*332*/	  r4.x = r4.x * r4.y + r7.x;
/*333*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*334*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*335*/	  r4.y = -r4.x * r4.x + 1.000000;
/*336*/	  r4.y = max(r4.y, 0.001000);
/*337*/	  r4.y = log2(r4.y);
/*338*/	  r6.y = r4.y * 4.950617;
/*339*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*340*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*341*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*342*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*343*/	  r4.x = floatBitsToInt(r4.x);
/*344*/	  r6.y = r4.y * r4.y + -r6.y;
/*345*/	  r6.y = sqrt(r6.y);
/*346*/	  r4.y = -r4.y + r6.y;
/*347*/	  r4.y = max(r4.y, 0.000000);
/*348*/	  r4.y = sqrt(r4.y);
/*349*/	  r4.x = r4.y * r4.x;
/*350*/	  r4.x = r4.x * 1.414214;
/*351*/	  r4.x = 0.008727 / r4.x;
/*352*/	  r4.x = max(r4.x, 0.000100);
/*353*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*354*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*355*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*356*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*357*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*358*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*359*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*360*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*361*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*362*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*363*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*364*/	  r4.x = floatBitsToInt(r4.x);
/*365*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*366*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*367*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*368*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*369*/	  r4.x = r4.x * r6.x + 1.000000;
/*370*/	  r4.x = r4.x * 0.500000;
/*371*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*372*/	  r4.y = r4.y * r6.y + 1.000000;
/*373*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*374*/	  r4.y = min(r7.y, 1.000000);
/*375*/	  r2.w = r2.w * 1.570796;
/*376*/	  r2.w = sin(r2.w);
/*377*/	  r4.y = r4.y + -1.000000;
/*378*/	  r2.w = r2.w * r4.y + 1.000000;
/*379*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*380*/	  r4.y = max(r4.y, 0.000000);
/*381*/	  r4.y = log2(r4.y);
/*382*/	  r4.y = r4.y * 10.000000;
/*383*/	  r4.y = exp2(r4.y);
/*384*/	  r4.y = r4.w * r4.y;
/*385*/	  r4.y = r4.y * r5.w + r0.w;
/*386*/	  r2.w = r2.w * abs(r4.x);
/*387*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*388*/	} else {
/*389*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*390*/	}
/*391*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*392*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*393*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*394*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*395*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*396*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*397*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*398*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*399*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*400*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*401*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*402*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*403*/	r2.w = inversesqrt(r2.w);
/*404*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*405*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*406*/	r2.w = r2.w + r2.w;
/*407*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*408*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*409*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*410*/	r2.x = max(r2.x, 0.000000);
/*411*/	r2.x = log2(r2.x);
/*412*/	r2.x = r2.x * 10.000000;
/*413*/	r2.x = exp2(r2.x);
/*414*/	r2.x = r4.w * r2.x;
/*415*/	r0.w = r2.x * r5.w + r0.w;
/*416*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*417*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*418*/	color0.w = 2.000000;
/*419*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*420*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*421*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*422*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*423*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*424*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*425*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*426*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*427*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*428*/	if(r0.x != 0) discard;
/*429*/	color1.x = 1.000000;
/*430*/	return;
}
