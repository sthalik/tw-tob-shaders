//
//
// Shader Model 4
// Fragment Shader
//
// id: 7872 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_WeightedCloth.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
/*2*/	r1.w = r0.w + -0.501961;
/*3*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r1.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r1.w = -r1.w + 1.000000;
/*10*/	r1.w = max(r1.w, 0.000000);
/*11*/	r3.z = sqrt(r1.w);
/*12*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*16*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*17*/	r1.w = r5.w * r6.w;
/*18*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*19*/	r0.xyz = (r1.wwww * r5.xyzx + r0.xyzx).xyz;
/*20*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*21*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*22*/	r2.x = inversesqrt(r2.x);
/*23*/	r2.yzw = (r1.wwww * r1.xxyz).yzw;
/*24*/	r1.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*25*/	r5.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*26*/	r2.yzw = sin(vec3(r5.xxyz));
/*27*/	r1.w = r2.z * r2.y;
/*28*/	r1.w = r2.w * r1.w;
/*29*/	r1.w = r1.w * 0.500000 + 1.000000;
/*30*/	r1.w = r1.w * 0.800000 + r5.w;
/*31*/	r2.yzw = (cb0.data[26].xxxx * vec4(0.000000, 2.500000, 0.300000, 0.870000)).yzw;
/*32*/	r2.yzw = sin(vec3(r2.yyzw));
/*33*/	r2.y = r2.z * r2.y;
/*34*/	r2.y = r2.w * r2.y;
/*35*/	r2.y = r2.y * 0.500000 + 1.000000;
/*36*/	r2.z = r2.y * 0.400000;
/*37*/	r2.y = r2.y * 0.500000 + r5.y;
/*38*/	r4.zw = (r1.wwww * vec4(0.000000, 0.000000, 0.200000, 0.200000) + vsOut_T1.xxxy).zw;
/*39*/	r5.xyzw = (texture(normal0_sampler, r4.zwzz.st)).xyzw;
/*40*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*41*/	r5.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	r1.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*43*/	r1.w = -r1.w + 1.000000;
/*44*/	r1.w = max(r1.w, 0.000000);
/*45*/	r5.z = sqrt(r1.w);
/*46*/	r2.yw = (r2.yyyy * vec4(0.000000, 0.500000, 0.000000, 0.200000) + vsOut_T1.xxxy).yw;
/*47*/	r6.xyzw = (texture(normal1_sampler, r2.ywyy.st)).xyzw;
/*48*/	r2.yw = (r6.wwwy + vec4(0.000000, 0.001961, 0.000000, 0.001961)).yw;
/*49*/	r2.yw = (r2.yyyw * vec4(0.000000, 2.000000, 0.000000, 2.000000) + vec4(0.000000, -1.000000, 0.000000, -1.000000)).yw;
/*50*/	r1.w = dot(vec2(r2.ywyy), vec2(r2.ywyy));
/*51*/	r1.w = -r1.w + 1.000000;
/*52*/	r1.w = max(r1.w, 0.000000);
/*53*/	r6.z = sqrt(r1.w);
/*54*/	r6.xy = (r2.zzzz * r2.ywyy).xy;
/*55*/	r2.yzw = (r5.xxyz + r6.xxyz).yzw;
/*56*/	r1.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*57*/	r1.w = inversesqrt(r1.w);
/*58*/	r2.yzw = (r1.wwww * r2.yyzw).yzw;
/*59*/	r2.xyz = (r3.xyzx * r2.xxxx + r2.yzwy).xyz;
/*60*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*63*/	r3.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*64*/	r3.xyz = (r3.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*65*/	r3.xyz = (vsOut_T9.xxxx * r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*66*/	r5.xyz = (r0.xyzx * r3.xyzx).xyz;
/*67*/	r1.w = r3.w + -vsOut_T9.x;
/*68*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*69*/	if(r1.w != 0) discard;
/*70*/	r1.w = vsOut_T9.y * 1.700000 + -0.700000;
/*71*/	r0.w = r0.w + -r1.w;
/*72*/	r2.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*73*/	if(r2.w != 0) discard;
/*74*/	r1.w = vsOut_T9.y * 1.700000 + -r1.w;
/*75*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*76*/	r0.w = saturate(r0.w * r1.w);
/*77*/	r1.w = r0.w * -2.000000 + 3.000000;
/*78*/	r0.w = r0.w * r0.w;
/*79*/	r4.zw = (-r1.wwww * r0.wwww + vec4(0.000000, 0.000000, 1.000000, 0.975000)).zw;
/*80*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*81*/	r7.x = 0;
/*82*/	r7.y = cb0.data[26].x * 0.050000;
/*83*/	r6.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r7.xxxy).zw;
/*84*/	r7.xyzw = (texture(s_fire_map, r6.zwzz.st)).xyzw;
/*85*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*86*/	r0.w = saturate(r7.x * 5.000000);
/*87*/	r7.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*88*/	r0.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*89*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*90*/	r1.w = log2(r6.z);
/*91*/	r1.w = r1.w * 1.800000;
/*92*/	r1.w = exp2(r1.w);
/*93*/	r1.w = r1.w * 10.000000;
/*94*/	r1.w = min(r1.w, 1.000000);
/*95*/	r0.w = r0.w + r1.w;
/*96*/	r0.w = r0.w * 0.500000;
/*97*/	r1.w = -r6.w + 1.000000;
/*98*/	r1.w = log2(r1.w);
/*99*/	r1.w = r1.w * r4.z;
/*100*/	r1.w = exp2(r1.w);
/*101*/	r1.w = min(r1.w, 1.000000);
/*102*/	r1.w = r4.z * r1.w;
/*103*/	r2.w = r6.z * 0.250000;
/*104*/	r6.xyw = (r7.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*105*/	r6.xyw = (r0.wwww * r6.xyxw + r2.wwww).xyw;
/*106*/	r0.xyz = (-r0.xyzx * r3.xyzx + r6.xywx).xyz;
/*107*/	r0.xyz = (r1.wwww * r0.xyzx + r5.xyzx).xyz;
/*108*/	r0.w = max(r4.w, 0.000000);
/*109*/	r3.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*110*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*111*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*112*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*113*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*114*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*115*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*116*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*117*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*118*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*119*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*120*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*121*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*122*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*123*/	r1.w = inversesqrt(r1.w);
/*124*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*125*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*126*/	r1.w = inversesqrt(r1.w);
/*127*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*128*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*129*/	r1.w = inversesqrt(r1.w);
/*130*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*131*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*132*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*133*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*134*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*135*/	r1.w = inversesqrt(r1.w);
/*136*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*137*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*138*/	r3.w = 1.000000;
/*139*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*140*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*141*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*142*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*143*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*144*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*145*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*146*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*147*/	r4.y = intBitsToFloat(int(r2.w));
/*148*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*149*/	if(floatBitsToUint(r4.z) != 0u) {
/*150*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*151*/	  r5.w = vsOut_T0.w;
/*152*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*153*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*154*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*155*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*156*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*157*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*158*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*159*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*160*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*161*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*162*/	  if(floatBitsToUint(r4.w) == 0u) {
/*163*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*164*/	    r7.xy = floor((r6.xyxx).xy);
/*165*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*166*/	    r4.z = -0.000400 / r4.z;
/*167*/	    r4.z = r4.z + r6.z;
/*168*/	    r8.z = -r8.y + 1.000000;
/*169*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*170*/	    r8.w = -r8.y;
/*171*/	    r10.x = cb1.data[0].z/**/;
/*172*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*173*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*174*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*175*/	    r10.w = -cb1.data[0].w/**/;
/*176*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*177*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*178*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*179*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*180*/	    r8.x = r9.x;
/*181*/	    r8.y = r11.x;
/*182*/	    r8.z = r10.x;
/*183*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*184*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*185*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*186*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*187*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*188*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*189*/	    r4.z = -r6.x + r6.y;
/*190*/	    r4.z = r4.w * r4.z + r6.x;
/*191*/	  } else {
/*192*/	    r4.z = 1.000000;
/*193*/	  }
/*194*/	} else {
/*195*/	  r4.z = 1.000000;
/*196*/	}
/*197*/	r4.w = cb1.data[34].w + -1.000000;
/*198*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*199*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*200*/	if(floatBitsToUint(r2.w) == 0u) {
/*201*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*202*/	  r2.w = floatBitsToInt(r2.w);
/*203*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*204*/	  if(floatBitsToUint(r2.w) != 0u) {
/*205*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*206*/	    r5.w = vsOut_T0.w;
/*207*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*208*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*209*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*210*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*211*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*212*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*213*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*214*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*215*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*216*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*217*/	    if(floatBitsToUint(r5.w) == 0u) {
/*218*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*219*/	      r6.xy = floor((r5.xyxx).xy);
/*220*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*221*/	      r2.w = -0.000400 / r2.w;
/*222*/	      r2.w = r2.w + r5.z;
/*223*/	      r7.z = -r7.y + 1.000000;
/*224*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*225*/	      r7.w = -r7.y;
/*226*/	      r9.x = cb1.data[0].z/**/;
/*227*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*228*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*229*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*230*/	      r9.w = -cb1.data[0].w/**/;
/*231*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*232*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*233*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*234*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*235*/	      r7.x = r8.x;
/*236*/	      r7.y = r10.x;
/*237*/	      r7.z = r9.x;
/*238*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*239*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*240*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*241*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*242*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*243*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*244*/	      r2.w = -r5.x + r5.z;
/*245*/	      r2.w = r5.y * r2.w + r5.x;
/*246*/	    } else {
/*247*/	      r2.w = 1.000000;
/*248*/	    }
/*249*/	  } else {
/*250*/	    r2.w = 1.000000;
/*251*/	  }
/*252*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*253*/	  r5.y = r5.x * cb1.data[34].x;
/*254*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*255*/	  r5.x = r1.w + -r5.x;
/*256*/	  r5.x = saturate(r5.x / r5.y);
/*257*/	  r2.w = -r4.z + r2.w;
/*258*/	  r4.z = r5.x * r2.w + r4.z;
/*259*/	}
/*260*/	if(floatBitsToUint(r4.w) != 0u) {
/*261*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*262*/	  r4.w = r2.w * cb1.data[34].y;
/*263*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*264*/	  r2.w = r1.w + -r2.w;
/*265*/	  r2.w = saturate(r2.w / r4.w);
/*266*/	  r4.y = -r4.z + 1.000000;
/*267*/	  r4.z = r2.w * r4.y + r4.z;
/*268*/	}
/*269*/	r4.z = saturate(r4.z);
/*270*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*271*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*272*/	r2.w = inversesqrt(r2.w);
/*273*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*274*/	r2.w = -r4.x + 1.000000;
/*275*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*276*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*277*/	r4.w = r4.w + r4.w;
/*278*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*279*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*280*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*281*/	r4.w = cos((r8.x));
/*282*/	r4.w = inversesqrt(r4.w);
/*283*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*284*/	r5.w = saturate(r0.w * 60.000000);
/*285*/	r5.w = -r0.w + r5.w;
/*286*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*287*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*288*/	r6.w = inversesqrt(r6.w);
/*289*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*290*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*291*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*292*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*293*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*294*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*295*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*296*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*297*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*298*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*299*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*300*/	r6.w = -r0.w + 1.000000;
/*301*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*302*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*303*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*304*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*305*/	  r6.w = max(r6.w, 0.000000);
/*306*/	  r6.w = log2(r6.w);
/*307*/	  r6.w = r6.w * 10.000000;
/*308*/	  r6.w = exp2(r6.w);
/*309*/	  r6.w = r4.w * r6.w;
/*310*/	  r6.w = r6.w * r5.w + r0.w;
/*311*/	  r7.y = r2.w * 8.000000;
/*312*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*313*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*314*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*315*/	}
/*316*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*317*/	r7.y = max(r6.w, 0.000000);
/*318*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*319*/	if(floatBitsToUint(r6.w) != 0u) {
/*320*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*321*/	  r6.x = max(r6.x, -1.000000);
/*322*/	  r6.x = min(r6.x, 1.000000);
/*323*/	  r6.y = -abs(r6.x) + 1.000000;
/*324*/	  r6.y = sqrt(r6.y);
/*325*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*326*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*327*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*328*/	  r6.w = r6.y * r6.z;
/*329*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*330*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*331*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*332*/	  r6.x = r6.z * r6.y + r6.x;
/*333*/	  r4.x = r4.x * r4.x;
/*334*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*335*/	  r4.x = r4.x * r4.y + r7.x;
/*336*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*337*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*338*/	  r4.y = -r4.x * r4.x + 1.000000;
/*339*/	  r4.y = max(r4.y, 0.001000);
/*340*/	  r4.y = log2(r4.y);
/*341*/	  r6.y = r4.y * 4.950617;
/*342*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*343*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*344*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*345*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*346*/	  r4.x = floatBitsToInt(r4.x);
/*347*/	  r6.y = r4.y * r4.y + -r6.y;
/*348*/	  r6.y = sqrt(r6.y);
/*349*/	  r4.y = -r4.y + r6.y;
/*350*/	  r4.y = max(r4.y, 0.000000);
/*351*/	  r4.y = sqrt(r4.y);
/*352*/	  r4.x = r4.y * r4.x;
/*353*/	  r4.x = r4.x * 1.414214;
/*354*/	  r4.x = 0.008727 / r4.x;
/*355*/	  r4.x = max(r4.x, 0.000100);
/*356*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*357*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*358*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*359*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*360*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*361*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*362*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*363*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*364*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*365*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*366*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*367*/	  r4.x = floatBitsToInt(r4.x);
/*368*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*369*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*370*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*371*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*372*/	  r4.x = r4.x * r6.x + 1.000000;
/*373*/	  r4.x = r4.x * 0.500000;
/*374*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*375*/	  r4.y = r4.y * r6.y + 1.000000;
/*376*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*377*/	  r4.y = min(r7.y, 1.000000);
/*378*/	  r2.w = r2.w * 1.570796;
/*379*/	  r2.w = sin(r2.w);
/*380*/	  r4.y = r4.y + -1.000000;
/*381*/	  r2.w = r2.w * r4.y + 1.000000;
/*382*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*383*/	  r4.y = max(r4.y, 0.000000);
/*384*/	  r4.y = log2(r4.y);
/*385*/	  r4.y = r4.y * 10.000000;
/*386*/	  r4.y = exp2(r4.y);
/*387*/	  r4.y = r4.w * r4.y;
/*388*/	  r4.y = r4.y * r5.w + r0.w;
/*389*/	  r2.w = r2.w * abs(r4.x);
/*390*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*391*/	} else {
/*392*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*393*/	}
/*394*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*395*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*396*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*397*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*398*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*399*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*400*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*401*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*402*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*403*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*404*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*405*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*406*/	r2.w = inversesqrt(r2.w);
/*407*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*408*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*409*/	r2.w = r2.w + r2.w;
/*410*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*411*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*412*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*413*/	r2.x = max(r2.x, 0.000000);
/*414*/	r2.x = log2(r2.x);
/*415*/	r2.x = r2.x * 10.000000;
/*416*/	r2.x = exp2(r2.x);
/*417*/	r2.x = r4.w * r2.x;
/*418*/	r0.w = r2.x * r5.w + r0.w;
/*419*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*420*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*421*/	color0.w = 2.000000;
/*422*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*423*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*424*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*425*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*426*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*427*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*428*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*429*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*430*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*431*/	if(r0.x != 0) discard;
/*432*/	color1.x = 1.000000;
/*433*/	return;
}
