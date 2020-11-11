//
//
// Shader Model 4
// Fragment Shader
//
// id: 6721 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithburn.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r0.w = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*29*/	r4.x = r2.z;
/*30*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*31*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*32*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*33*/	r1.w = saturate(r4.x * 5.000000);
/*34*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*35*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*36*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*37*/	r2.z = log2(r5.z);
/*38*/	r2.z = r2.z * 1.800000;
/*39*/	r2.z = exp2(r2.z);
/*40*/	r2.z = r2.z * 10.000000;
/*41*/	r2.z = min(r2.z, 1.000000);
/*42*/	r1.w = r1.w + r2.z;
/*43*/	r1.w = r1.w * 0.500000;
/*44*/	r2.z = -r5.w + 1.000000;
/*45*/	r2.z = log2(r2.z);
/*46*/	r2.z = r2.z * vsOut_T7.z;
/*47*/	r2.z = exp2(r2.z);
/*48*/	r2.z = min(r2.z, 1.000000);
/*49*/	r2.z = r2.z * vsOut_T7.z;
/*50*/	r2.w = r5.z * 0.250000;
/*51*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*52*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*53*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*54*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*55*/	r1.w = vsOut_T7.z + -0.025000;
/*56*/	r1.w = max(r1.w, 0.000000);
/*57*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*58*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*59*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*61*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*62*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*64*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*65*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*66*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*67*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*68*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*69*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*70*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*71*/	r2.z = inversesqrt(r2.z);
/*72*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*73*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*74*/	r2.z = inversesqrt(r2.z);
/*75*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*76*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*77*/	r2.z = inversesqrt(r2.z);
/*78*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*79*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*80*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*81*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*85*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*86*/	r4.w = 1.000000;
/*87*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*88*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*89*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*90*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*92*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*93*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*94*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*95*/	r3.y = intBitsToFloat(int(r2.w));
/*96*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*97*/	if(floatBitsToUint(r3.z) != 0u) {
/*98*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*99*/	  r5.w = vsOut_T0.w;
/*100*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*101*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*102*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*103*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*104*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*105*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*106*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*107*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*108*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*109*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*110*/	  if(floatBitsToUint(r3.w) == 0u) {
/*111*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*112*/	    r7.xy = floor((r6.xyxx).xy);
/*113*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*114*/	    r3.z = -0.000400 / r3.z;
/*115*/	    r3.z = r3.z + r6.z;
/*116*/	    r8.z = -r8.y + 1.000000;
/*117*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*118*/	    r8.w = -r8.y;
/*119*/	    r10.x = cb1.data[0].z/**/;
/*120*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*121*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*122*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*123*/	    r10.w = -cb1.data[0].w/**/;
/*124*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*125*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*126*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*127*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*128*/	    r8.x = r9.x;
/*129*/	    r8.y = r11.x;
/*130*/	    r8.z = r10.x;
/*131*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*132*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*133*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*134*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*135*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*136*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*137*/	    r3.z = -r6.x + r6.y;
/*138*/	    r3.z = r3.w * r3.z + r6.x;
/*139*/	  } else {
/*140*/	    r3.z = 1.000000;
/*141*/	  }
/*142*/	} else {
/*143*/	  r3.z = 1.000000;
/*144*/	}
/*145*/	r3.w = cb1.data[34].w + -1.000000;
/*146*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*147*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*148*/	if(floatBitsToUint(r2.w) == 0u) {
/*149*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*150*/	  r2.w = floatBitsToInt(r2.w);
/*151*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*152*/	  if(floatBitsToUint(r2.w) != 0u) {
/*153*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*154*/	    r5.w = vsOut_T0.w;
/*155*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*156*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*157*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*158*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*159*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*160*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*161*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*162*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*163*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*164*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*165*/	    if(floatBitsToUint(r5.w) == 0u) {
/*166*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*167*/	      r6.xy = floor((r5.xyxx).xy);
/*168*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*169*/	      r2.w = -0.000400 / r2.w;
/*170*/	      r2.w = r2.w + r5.z;
/*171*/	      r7.z = -r7.y + 1.000000;
/*172*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*173*/	      r7.w = -r7.y;
/*174*/	      r9.x = cb1.data[0].z/**/;
/*175*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*176*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*177*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*178*/	      r9.w = -cb1.data[0].w/**/;
/*179*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*180*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*181*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*182*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*183*/	      r7.x = r8.x;
/*184*/	      r7.y = r10.x;
/*185*/	      r7.z = r9.x;
/*186*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*187*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*188*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*189*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*190*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*191*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*192*/	      r2.w = -r5.x + r5.z;
/*193*/	      r2.w = r5.y * r2.w + r5.x;
/*194*/	    } else {
/*195*/	      r2.w = 1.000000;
/*196*/	    }
/*197*/	  } else {
/*198*/	    r2.w = 1.000000;
/*199*/	  }
/*200*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*201*/	  r5.y = r5.x * cb1.data[34].x;
/*202*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*203*/	  r5.x = r0.w + -r5.x;
/*204*/	  r5.x = saturate(r5.x / r5.y);
/*205*/	  r2.w = -r3.z + r2.w;
/*206*/	  r3.z = r5.x * r2.w + r3.z;
/*207*/	}
/*208*/	if(floatBitsToUint(r3.w) != 0u) {
/*209*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*210*/	  r3.w = r2.w * cb1.data[34].y;
/*211*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*212*/	  r2.w = r0.w + -r2.w;
/*213*/	  r2.w = saturate(r2.w / r3.w);
/*214*/	  r3.y = -r3.z + 1.000000;
/*215*/	  r3.z = r2.w * r3.y + r3.z;
/*216*/	}
/*217*/	r3.z = saturate(r3.z);
/*218*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*219*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*220*/	r2.w = inversesqrt(r2.w);
/*221*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*222*/	r2.w = -r3.x + 1.000000;
/*223*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*224*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*225*/	r3.w = r3.w + r3.w;
/*226*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*227*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*228*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*229*/	r3.w = cos((r8.x));
/*230*/	r3.w = inversesqrt(r3.w);
/*231*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*232*/	r5.w = saturate(r1.w * 60.000000);
/*233*/	r5.w = -r1.w + r5.w;
/*234*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*235*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*236*/	r6.w = inversesqrt(r6.w);
/*237*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*238*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*239*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*240*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*241*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*242*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*243*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*244*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*245*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*246*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*247*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*248*/	r6.w = -r1.w + 1.000000;
/*249*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*250*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*251*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*252*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*253*/	  r6.w = max(r6.w, 0.000000);
/*254*/	  r6.w = log2(r6.w);
/*255*/	  r6.w = r6.w * 10.000000;
/*256*/	  r6.w = exp2(r6.w);
/*257*/	  r6.w = r3.w * r6.w;
/*258*/	  r6.w = r6.w * r5.w + r1.w;
/*259*/	  r7.y = r2.w * 8.000000;
/*260*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*261*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*262*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*263*/	}
/*264*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*265*/	r7.y = max(r6.w, 0.000000);
/*266*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*267*/	if(floatBitsToUint(r6.w) != 0u) {
/*268*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*269*/	  r6.x = max(r6.x, -1.000000);
/*270*/	  r6.x = min(r6.x, 1.000000);
/*271*/	  r6.y = -abs(r6.x) + 1.000000;
/*272*/	  r6.y = sqrt(r6.y);
/*273*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*274*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*275*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*276*/	  r6.w = r6.y * r6.z;
/*277*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*278*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*279*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*280*/	  r6.x = r6.z * r6.y + r6.x;
/*281*/	  r3.x = r3.x * r3.x;
/*282*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*283*/	  r3.x = r3.x * r3.y + r7.x;
/*284*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*285*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*286*/	  r3.y = -r3.x * r3.x + 1.000000;
/*287*/	  r3.y = max(r3.y, 0.001000);
/*288*/	  r3.y = log2(r3.y);
/*289*/	  r6.y = r3.y * 4.950617;
/*290*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*291*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*292*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*293*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*294*/	  r3.x = floatBitsToInt(r3.x);
/*295*/	  r6.y = r3.y * r3.y + -r6.y;
/*296*/	  r6.y = sqrt(r6.y);
/*297*/	  r3.y = -r3.y + r6.y;
/*298*/	  r3.y = max(r3.y, 0.000000);
/*299*/	  r3.y = sqrt(r3.y);
/*300*/	  r3.x = r3.y * r3.x;
/*301*/	  r3.x = r3.x * 1.414214;
/*302*/	  r3.x = 0.008727 / r3.x;
/*303*/	  r3.x = max(r3.x, 0.000100);
/*304*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*305*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*306*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*307*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*308*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*309*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*310*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*311*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*312*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*313*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*314*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*315*/	  r3.x = floatBitsToInt(r3.x);
/*316*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*317*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*318*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*319*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*320*/	  r3.x = r3.x * r6.x + 1.000000;
/*321*/	  r3.x = r3.x * 0.500000;
/*322*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*323*/	  r3.y = r3.y * r6.y + 1.000000;
/*324*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*325*/	  r3.y = min(r7.y, 1.000000);
/*326*/	  r2.w = r2.w * 1.570796;
/*327*/	  r2.w = sin(r2.w);
/*328*/	  r3.y = r3.y + -1.000000;
/*329*/	  r2.w = r2.w * r3.y + 1.000000;
/*330*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*331*/	  r3.y = max(r3.y, 0.000000);
/*332*/	  r3.y = log2(r3.y);
/*333*/	  r3.y = r3.y * 10.000000;
/*334*/	  r3.y = exp2(r3.y);
/*335*/	  r3.y = r3.w * r3.y;
/*336*/	  r3.y = r3.y * r5.w + r1.w;
/*337*/	  r2.w = r2.w * abs(r3.x);
/*338*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*339*/	} else {
/*340*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*341*/	}
/*342*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*343*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*344*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*345*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*346*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*347*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*348*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*349*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*350*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*351*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*352*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*353*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*354*/	r2.w = inversesqrt(r2.w);
/*355*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*356*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*357*/	r2.w = r2.w + r2.w;
/*358*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*359*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*360*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*361*/	r2.x = max(r2.x, 0.000000);
/*362*/	r2.x = log2(r2.x);
/*363*/	r2.x = r2.x * 10.000000;
/*364*/	r2.x = exp2(r2.x);
/*365*/	r2.x = r3.w * r2.x;
/*366*/	r1.w = r2.x * r5.w + r1.w;
/*367*/	r2.xyz = (r6.xyzx * r1.wwww).xyz;
/*368*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*369*/	color0.w = 2.000000;
/*370*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*371*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*372*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*373*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*374*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*375*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*376*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*377*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*378*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*379*/	if(r0.x != 0) discard;
/*380*/	color1.x = 1.000000;
/*381*/	return;
}
