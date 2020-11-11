//
//
// Shader Model 4
// Fragment Shader
//
// id: 6719 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithburn.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
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
/*29*/	r0.w = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*32*/	r4.x = r2.z;
/*33*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*34*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*35*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*36*/	r1.w = saturate(r4.x * 5.000000);
/*37*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*38*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*39*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*40*/	r2.z = log2(r5.z);
/*41*/	r2.z = r2.z * 1.800000;
/*42*/	r2.z = exp2(r2.z);
/*43*/	r2.z = r2.z * 10.000000;
/*44*/	r2.z = min(r2.z, 1.000000);
/*45*/	r1.w = r1.w + r2.z;
/*46*/	r1.w = r1.w * 0.500000;
/*47*/	r2.z = -r5.w + 1.000000;
/*48*/	r2.z = log2(r2.z);
/*49*/	r2.z = r2.z * vsOut_T7.z;
/*50*/	r2.z = exp2(r2.z);
/*51*/	r2.z = min(r2.z, 1.000000);
/*52*/	r2.z = r2.z * vsOut_T7.z;
/*53*/	r2.w = r5.z * 0.250000;
/*54*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*55*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*56*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*57*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*58*/	r1.w = vsOut_T7.z + -0.025000;
/*59*/	r1.w = max(r1.w, 0.000000);
/*60*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*61*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*62*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*64*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*65*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*67*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*68*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*69*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*70*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*71*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*72*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*73*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*74*/	r2.z = inversesqrt(r2.z);
/*75*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*76*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*77*/	r2.z = inversesqrt(r2.z);
/*78*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*79*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*80*/	r2.z = inversesqrt(r2.z);
/*81*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*82*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*83*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*84*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*85*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*86*/	r0.w = inversesqrt(r0.w);
/*87*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*88*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*89*/	r4.w = 1.000000;
/*90*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*91*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*92*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*93*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*94*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*95*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*96*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*97*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*98*/	r3.y = intBitsToFloat(int(r2.w));
/*99*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r3.z) != 0u) {
/*101*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*102*/	  r5.w = vsOut_T0.w;
/*103*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*104*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*105*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*106*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*107*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*108*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*109*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*110*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*111*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*112*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*113*/	  if(floatBitsToUint(r3.w) == 0u) {
/*114*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*115*/	    r7.xy = floor((r6.xyxx).xy);
/*116*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*117*/	    r3.z = -0.000400 / r3.z;
/*118*/	    r3.z = r3.z + r6.z;
/*119*/	    r8.z = -r8.y + 1.000000;
/*120*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*121*/	    r8.w = -r8.y;
/*122*/	    r10.x = cb1.data[0].z/**/;
/*123*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*124*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*125*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*126*/	    r10.w = -cb1.data[0].w/**/;
/*127*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*128*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*129*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*130*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*131*/	    r8.x = r9.x;
/*132*/	    r8.y = r11.x;
/*133*/	    r8.z = r10.x;
/*134*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*135*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*136*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*137*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*138*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*139*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*140*/	    r3.z = -r6.x + r6.y;
/*141*/	    r3.z = r3.w * r3.z + r6.x;
/*142*/	  } else {
/*143*/	    r3.z = 1.000000;
/*144*/	  }
/*145*/	} else {
/*146*/	  r3.z = 1.000000;
/*147*/	}
/*148*/	r3.w = cb1.data[34].w + -1.000000;
/*149*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*150*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*151*/	if(floatBitsToUint(r2.w) == 0u) {
/*152*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*153*/	  r2.w = floatBitsToInt(r2.w);
/*154*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*155*/	  if(floatBitsToUint(r2.w) != 0u) {
/*156*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*157*/	    r5.w = vsOut_T0.w;
/*158*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*159*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*160*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*161*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*162*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*163*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*164*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*165*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*166*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*167*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*168*/	    if(floatBitsToUint(r5.w) == 0u) {
/*169*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*170*/	      r6.xy = floor((r5.xyxx).xy);
/*171*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*172*/	      r2.w = -0.000400 / r2.w;
/*173*/	      r2.w = r2.w + r5.z;
/*174*/	      r7.z = -r7.y + 1.000000;
/*175*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*176*/	      r7.w = -r7.y;
/*177*/	      r9.x = cb1.data[0].z/**/;
/*178*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*179*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*180*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*181*/	      r9.w = -cb1.data[0].w/**/;
/*182*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*183*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*184*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*185*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*186*/	      r7.x = r8.x;
/*187*/	      r7.y = r10.x;
/*188*/	      r7.z = r9.x;
/*189*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*190*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*191*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*192*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*193*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*194*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*195*/	      r2.w = -r5.x + r5.z;
/*196*/	      r2.w = r5.y * r2.w + r5.x;
/*197*/	    } else {
/*198*/	      r2.w = 1.000000;
/*199*/	    }
/*200*/	  } else {
/*201*/	    r2.w = 1.000000;
/*202*/	  }
/*203*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*204*/	  r5.y = r5.x * cb1.data[34].x;
/*205*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*206*/	  r5.x = r0.w + -r5.x;
/*207*/	  r5.x = saturate(r5.x / r5.y);
/*208*/	  r2.w = -r3.z + r2.w;
/*209*/	  r3.z = r5.x * r2.w + r3.z;
/*210*/	}
/*211*/	if(floatBitsToUint(r3.w) != 0u) {
/*212*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*213*/	  r3.w = r2.w * cb1.data[34].y;
/*214*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*215*/	  r2.w = r0.w + -r2.w;
/*216*/	  r2.w = saturate(r2.w / r3.w);
/*217*/	  r3.y = -r3.z + 1.000000;
/*218*/	  r3.z = r2.w * r3.y + r3.z;
/*219*/	}
/*220*/	r3.z = saturate(r3.z);
/*221*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*222*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*223*/	r2.w = inversesqrt(r2.w);
/*224*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*225*/	r2.w = -r3.x + 1.000000;
/*226*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*227*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*228*/	r3.w = r3.w + r3.w;
/*229*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*230*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*231*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*232*/	r3.w = cos((r8.x));
/*233*/	r3.w = inversesqrt(r3.w);
/*234*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*235*/	r5.w = saturate(r1.w * 60.000000);
/*236*/	r5.w = -r1.w + r5.w;
/*237*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*238*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*239*/	r6.w = inversesqrt(r6.w);
/*240*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*241*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*242*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*243*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*244*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*245*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*246*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*247*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*248*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*249*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*250*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*251*/	r6.w = -r1.w + 1.000000;
/*252*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*253*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*254*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*255*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*256*/	  r6.w = max(r6.w, 0.000000);
/*257*/	  r6.w = log2(r6.w);
/*258*/	  r6.w = r6.w * 10.000000;
/*259*/	  r6.w = exp2(r6.w);
/*260*/	  r6.w = r3.w * r6.w;
/*261*/	  r6.w = r6.w * r5.w + r1.w;
/*262*/	  r7.y = r2.w * 8.000000;
/*263*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*264*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*265*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*266*/	}
/*267*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*268*/	r7.y = max(r6.w, 0.000000);
/*269*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*270*/	if(floatBitsToUint(r6.w) != 0u) {
/*271*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*272*/	  r6.x = max(r6.x, -1.000000);
/*273*/	  r6.x = min(r6.x, 1.000000);
/*274*/	  r6.y = -abs(r6.x) + 1.000000;
/*275*/	  r6.y = sqrt(r6.y);
/*276*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*277*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*278*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*279*/	  r6.w = r6.y * r6.z;
/*280*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*281*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*282*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*283*/	  r6.x = r6.z * r6.y + r6.x;
/*284*/	  r3.x = r3.x * r3.x;
/*285*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*286*/	  r3.x = r3.x * r3.y + r7.x;
/*287*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*288*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*289*/	  r3.y = -r3.x * r3.x + 1.000000;
/*290*/	  r3.y = max(r3.y, 0.001000);
/*291*/	  r3.y = log2(r3.y);
/*292*/	  r6.y = r3.y * 4.950617;
/*293*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*294*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*295*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*296*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*297*/	  r3.x = floatBitsToInt(r3.x);
/*298*/	  r6.y = r3.y * r3.y + -r6.y;
/*299*/	  r6.y = sqrt(r6.y);
/*300*/	  r3.y = -r3.y + r6.y;
/*301*/	  r3.y = max(r3.y, 0.000000);
/*302*/	  r3.y = sqrt(r3.y);
/*303*/	  r3.x = r3.y * r3.x;
/*304*/	  r3.x = r3.x * 1.414214;
/*305*/	  r3.x = 0.008727 / r3.x;
/*306*/	  r3.x = max(r3.x, 0.000100);
/*307*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*308*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*309*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*310*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*311*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*312*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*313*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*314*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*315*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*316*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*317*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*318*/	  r3.x = floatBitsToInt(r3.x);
/*319*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*320*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*321*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*322*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*323*/	  r3.x = r3.x * r6.x + 1.000000;
/*324*/	  r3.x = r3.x * 0.500000;
/*325*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*326*/	  r3.y = r3.y * r6.y + 1.000000;
/*327*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*328*/	  r3.y = min(r7.y, 1.000000);
/*329*/	  r2.w = r2.w * 1.570796;
/*330*/	  r2.w = sin(r2.w);
/*331*/	  r3.y = r3.y + -1.000000;
/*332*/	  r2.w = r2.w * r3.y + 1.000000;
/*333*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*334*/	  r3.y = max(r3.y, 0.000000);
/*335*/	  r3.y = log2(r3.y);
/*336*/	  r3.y = r3.y * 10.000000;
/*337*/	  r3.y = exp2(r3.y);
/*338*/	  r3.y = r3.w * r3.y;
/*339*/	  r3.y = r3.y * r5.w + r1.w;
/*340*/	  r2.w = r2.w * abs(r3.x);
/*341*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*342*/	} else {
/*343*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*344*/	}
/*345*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*346*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*347*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*348*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*349*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*350*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*351*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*352*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*353*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*354*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*355*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*356*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*357*/	r2.w = inversesqrt(r2.w);
/*358*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*359*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*360*/	r2.w = r2.w + r2.w;
/*361*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*362*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*363*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*364*/	r2.x = max(r2.x, 0.000000);
/*365*/	r2.x = log2(r2.x);
/*366*/	r2.x = r2.x * 10.000000;
/*367*/	r2.x = exp2(r2.x);
/*368*/	r2.x = r3.w * r2.x;
/*369*/	r1.w = r2.x * r5.w + r1.w;
/*370*/	r2.xyz = (r6.xyzx * r1.wwww).xyz;
/*371*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*372*/	color0.w = 2.000000;
/*373*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*374*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*375*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*376*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*377*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*378*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*379*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*380*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*381*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*382*/	if(r0.x != 0) discard;
/*383*/	color1.x = 1.000000;
/*384*/	return;
}
