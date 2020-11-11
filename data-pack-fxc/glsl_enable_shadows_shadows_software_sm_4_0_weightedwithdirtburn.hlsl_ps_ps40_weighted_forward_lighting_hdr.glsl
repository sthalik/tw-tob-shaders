//
//
// Shader Model 4
// Fragment Shader
//
// id: 6857 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;

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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r3.z = sqrt(r0.w);
/*30*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*34*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*35*/	r0.w = r5.w * r6.w;
/*36*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*37*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*38*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*39*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*42*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*43*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*44*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*45*/	r5.x = r3.x;
/*46*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*47*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*48*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*49*/	r0.w = saturate(r5.x * 5.000000);
/*50*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*51*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*52*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*53*/	r1.w = log2(r3.z);
/*54*/	r1.w = r1.w * 1.800000;
/*55*/	r1.w = exp2(r1.w);
/*56*/	r1.w = r1.w * 10.000000;
/*57*/	r1.w = min(r1.w, 1.000000);
/*58*/	r0.w = r0.w + r1.w;
/*59*/	r0.w = r0.w * 0.500000;
/*60*/	r1.w = -r3.w + 1.000000;
/*61*/	r1.w = log2(r1.w);
/*62*/	r1.w = r1.w * vsOut_T7.z;
/*63*/	r1.w = exp2(r1.w);
/*64*/	r1.w = min(r1.w, 1.000000);
/*65*/	r1.w = r1.w * vsOut_T7.z;
/*66*/	r2.w = r3.z * 0.250000;
/*67*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*68*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*69*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*70*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*71*/	r0.w = vsOut_T7.z + -0.025000;
/*72*/	r0.w = max(r0.w, 0.000000);
/*73*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*74*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*75*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*77*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*78*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*79*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*80*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*81*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*82*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*83*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*84*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*85*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*89*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*92*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*93*/	r1.w = inversesqrt(r1.w);
/*94*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*95*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*96*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*97*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*98*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*99*/	r1.w = inversesqrt(r1.w);
/*100*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*101*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*102*/	r3.w = 1.000000;
/*103*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*104*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*105*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*106*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*107*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*108*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*109*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*110*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*111*/	r4.y = intBitsToFloat(int(r2.w));
/*112*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*113*/	if(floatBitsToUint(r4.z) != 0u) {
/*114*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*115*/	  r5.w = vsOut_T0.w;
/*116*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*117*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*118*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*119*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*120*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*121*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*122*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*123*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*124*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*125*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*126*/	  if(floatBitsToUint(r4.w) == 0u) {
/*127*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*128*/	    r7.xy = floor((r6.xyxx).xy);
/*129*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*130*/	    r4.z = -0.000400 / r4.z;
/*131*/	    r4.z = r4.z + r6.z;
/*132*/	    r8.z = -r8.y + 1.000000;
/*133*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*134*/	    r8.w = -r8.y;
/*135*/	    r10.x = cb1.data[0].z/**/;
/*136*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*137*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*138*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*139*/	    r10.w = -cb1.data[0].w/**/;
/*140*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*141*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*142*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*143*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*144*/	    r8.x = r9.x;
/*145*/	    r8.y = r11.x;
/*146*/	    r8.z = r10.x;
/*147*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*148*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*149*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*150*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*151*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*152*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*153*/	    r4.z = -r6.x + r6.y;
/*154*/	    r4.z = r4.w * r4.z + r6.x;
/*155*/	  } else {
/*156*/	    r4.z = 1.000000;
/*157*/	  }
/*158*/	} else {
/*159*/	  r4.z = 1.000000;
/*160*/	}
/*161*/	r4.w = cb1.data[34].w + -1.000000;
/*162*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*163*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*164*/	if(floatBitsToUint(r2.w) == 0u) {
/*165*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*166*/	  r2.w = floatBitsToInt(r2.w);
/*167*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*168*/	  if(floatBitsToUint(r2.w) != 0u) {
/*169*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*170*/	    r5.w = vsOut_T0.w;
/*171*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*172*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*173*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*174*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*175*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*176*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*177*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*178*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*179*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*180*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*181*/	    if(floatBitsToUint(r5.w) == 0u) {
/*182*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*183*/	      r6.xy = floor((r5.xyxx).xy);
/*184*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*185*/	      r2.w = -0.000400 / r2.w;
/*186*/	      r2.w = r2.w + r5.z;
/*187*/	      r7.z = -r7.y + 1.000000;
/*188*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*189*/	      r7.w = -r7.y;
/*190*/	      r9.x = cb1.data[0].z/**/;
/*191*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*192*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*193*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*194*/	      r9.w = -cb1.data[0].w/**/;
/*195*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*196*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*197*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*198*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*199*/	      r7.x = r8.x;
/*200*/	      r7.y = r10.x;
/*201*/	      r7.z = r9.x;
/*202*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*203*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*204*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*205*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*206*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*207*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*208*/	      r2.w = -r5.x + r5.z;
/*209*/	      r2.w = r5.y * r2.w + r5.x;
/*210*/	    } else {
/*211*/	      r2.w = 1.000000;
/*212*/	    }
/*213*/	  } else {
/*214*/	    r2.w = 1.000000;
/*215*/	  }
/*216*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*217*/	  r5.y = r5.x * cb1.data[34].x;
/*218*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*219*/	  r5.x = r1.w + -r5.x;
/*220*/	  r5.x = saturate(r5.x / r5.y);
/*221*/	  r2.w = -r4.z + r2.w;
/*222*/	  r4.z = r5.x * r2.w + r4.z;
/*223*/	}
/*224*/	if(floatBitsToUint(r4.w) != 0u) {
/*225*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*226*/	  r4.w = r2.w * cb1.data[34].y;
/*227*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*228*/	  r2.w = r1.w + -r2.w;
/*229*/	  r2.w = saturate(r2.w / r4.w);
/*230*/	  r4.y = -r4.z + 1.000000;
/*231*/	  r4.z = r2.w * r4.y + r4.z;
/*232*/	}
/*233*/	r4.z = saturate(r4.z);
/*234*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*235*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*236*/	r2.w = inversesqrt(r2.w);
/*237*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*238*/	r2.w = -r4.x + 1.000000;
/*239*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*240*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*241*/	r4.w = r4.w + r4.w;
/*242*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*243*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*244*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*245*/	r4.w = cos((r8.x));
/*246*/	r4.w = inversesqrt(r4.w);
/*247*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*248*/	r5.w = saturate(r0.w * 60.000000);
/*249*/	r5.w = -r0.w + r5.w;
/*250*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*251*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*252*/	r6.w = inversesqrt(r6.w);
/*253*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*254*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*255*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*256*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*257*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*258*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*259*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*260*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*261*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*262*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*263*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*264*/	r6.w = -r0.w + 1.000000;
/*265*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*266*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*267*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*268*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*269*/	  r6.w = max(r6.w, 0.000000);
/*270*/	  r6.w = log2(r6.w);
/*271*/	  r6.w = r6.w * 10.000000;
/*272*/	  r6.w = exp2(r6.w);
/*273*/	  r6.w = r4.w * r6.w;
/*274*/	  r6.w = r6.w * r5.w + r0.w;
/*275*/	  r7.y = r2.w * 8.000000;
/*276*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*277*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*278*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*279*/	}
/*280*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*281*/	r7.y = max(r6.w, 0.000000);
/*282*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*283*/	if(floatBitsToUint(r6.w) != 0u) {
/*284*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*285*/	  r6.x = max(r6.x, -1.000000);
/*286*/	  r6.x = min(r6.x, 1.000000);
/*287*/	  r6.y = -abs(r6.x) + 1.000000;
/*288*/	  r6.y = sqrt(r6.y);
/*289*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*290*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*291*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*292*/	  r6.w = r6.y * r6.z;
/*293*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*294*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*295*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*296*/	  r6.x = r6.z * r6.y + r6.x;
/*297*/	  r4.x = r4.x * r4.x;
/*298*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*299*/	  r4.x = r4.x * r4.y + r7.x;
/*300*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*301*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*302*/	  r4.y = -r4.x * r4.x + 1.000000;
/*303*/	  r4.y = max(r4.y, 0.001000);
/*304*/	  r4.y = log2(r4.y);
/*305*/	  r6.y = r4.y * 4.950617;
/*306*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*307*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*308*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*309*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*310*/	  r4.x = floatBitsToInt(r4.x);
/*311*/	  r6.y = r4.y * r4.y + -r6.y;
/*312*/	  r6.y = sqrt(r6.y);
/*313*/	  r4.y = -r4.y + r6.y;
/*314*/	  r4.y = max(r4.y, 0.000000);
/*315*/	  r4.y = sqrt(r4.y);
/*316*/	  r4.x = r4.y * r4.x;
/*317*/	  r4.x = r4.x * 1.414214;
/*318*/	  r4.x = 0.008727 / r4.x;
/*319*/	  r4.x = max(r4.x, 0.000100);
/*320*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*321*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*322*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*323*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*324*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*325*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*326*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*327*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*328*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*329*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*330*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*331*/	  r4.x = floatBitsToInt(r4.x);
/*332*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*333*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*334*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*335*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*336*/	  r4.x = r4.x * r6.x + 1.000000;
/*337*/	  r4.x = r4.x * 0.500000;
/*338*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*339*/	  r4.y = r4.y * r6.y + 1.000000;
/*340*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*341*/	  r4.y = min(r7.y, 1.000000);
/*342*/	  r2.w = r2.w * 1.570796;
/*343*/	  r2.w = sin(r2.w);
/*344*/	  r4.y = r4.y + -1.000000;
/*345*/	  r2.w = r2.w * r4.y + 1.000000;
/*346*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*347*/	  r4.y = max(r4.y, 0.000000);
/*348*/	  r4.y = log2(r4.y);
/*349*/	  r4.y = r4.y * 10.000000;
/*350*/	  r4.y = exp2(r4.y);
/*351*/	  r4.y = r4.w * r4.y;
/*352*/	  r4.y = r4.y * r5.w + r0.w;
/*353*/	  r2.w = r2.w * abs(r4.x);
/*354*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*355*/	} else {
/*356*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*357*/	}
/*358*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*359*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*360*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*361*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*362*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*363*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*364*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*365*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*366*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*367*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*368*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*369*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*370*/	r2.w = inversesqrt(r2.w);
/*371*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*372*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*373*/	r2.w = r2.w + r2.w;
/*374*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*375*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*376*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*377*/	r2.x = max(r2.x, 0.000000);
/*378*/	r2.x = log2(r2.x);
/*379*/	r2.x = r2.x * 10.000000;
/*380*/	r2.x = exp2(r2.x);
/*381*/	r2.x = r4.w * r2.x;
/*382*/	r0.w = r2.x * r5.w + r0.w;
/*383*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*384*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*385*/	color0.w = 2.000000;
/*386*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*387*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*388*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*389*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*390*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*391*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*392*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*393*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*394*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*395*/	if(r0.x != 0) discard;
/*396*/	color1.x = 1.000000;
/*397*/	return;
}
