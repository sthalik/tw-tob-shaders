//
//
// Shader Model 4
// Fragment Shader
//
// id: 6278 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithburn.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform shadowmap_PS
{
  vec4 data[45];
} cb2;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb3;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb5.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb5.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb5.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*9*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*11*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r0.w = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*17*/	r3.x = r1.z;
/*18*/	r3.y = cb1.data[26].x * 0.050000 + r1.w;
/*19*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*20*/	r4.xyzw = (texture(s_fire_map, r1.zwzz.st)).xyzw;
/*21*/	r1.z = saturate(r3.x * 5.000000);
/*22*/	r3.xyz = (r1.zzzz * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*23*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*24*/	r1.z = saturate(-r1.z * 15.000000 + 1.000000);
/*25*/	r1.w = log2(r4.z);
/*26*/	r1.w = r1.w * 1.800000;
/*27*/	r1.w = exp2(r1.w);
/*28*/	r1.w = r1.w * 10.000000;
/*29*/	r1.w = min(r1.w, 1.000000);
/*30*/	r1.z = r1.w + r1.z;
/*31*/	r1.z = r1.z * 0.500000;
/*32*/	r1.w = -r4.w + 1.000000;
/*33*/	r1.w = log2(r1.w);
/*34*/	r1.w = r1.w * vsOut_T7.z;
/*35*/	r1.w = exp2(r1.w);
/*36*/	r1.w = min(r1.w, 1.000000);
/*37*/	r1.w = r1.w * vsOut_T7.z;
/*38*/	r2.z = r4.z * 0.250000;
/*39*/	r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.zzzz).xyz;
/*40*/	r3.xyz = (r1.zzzz * r3.xyzx + r2.zzzz).xyz;
/*41*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*42*/	r0.xyz = (r1.wwww * r3.xyzx + r0.xyzx).xyz;
/*43*/	r1.z = vsOut_T7.z + -0.025000;
/*44*/	r1.z = max(r1.z, 0.000000);
/*45*/	r3.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*46*/	r0.xyz = (r1.zzzz * r3.xyzx + r0.xyzx).xyz;
/*47*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*48*/	r1.z = inversesqrt(r1.z);
/*49*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*50*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*51*/	r1.z = inversesqrt(r1.z);
/*52*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*53*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*54*/	r1.z = inversesqrt(r1.z);
/*55*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*56*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*57*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*58*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*59*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*62*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*63*/	r1.w = -vsOut_T4.z + 1.000000;
/*64*/	r5.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*65*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*66*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*67*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*68*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*69*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*70*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*71*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*72*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*73*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*74*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*75*/	r5.w = 1.000000;
/*76*/	r2.y = dot(r5.xyzw, cb1.data[12].xyzw);
/*77*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*78*/	r7.x = uintBitsToFloat((r2.y >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*79*/	r7.y = uintBitsToFloat((r2.y >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*80*/	r7.z = uintBitsToFloat((r2.y >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*81*/	r7.w = uintBitsToFloat((r2.y >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*82*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*83*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*84*/	r2.w = intBitsToFloat(int(r2.z));
/*85*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*86*/	if(floatBitsToUint(r3.w) != 0u) {
/*87*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*88*/	  r6.w = vsOut_T0.w;
/*89*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*90*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*91*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*92*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*93*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*94*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*95*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*96*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*97*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*98*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*99*/	  if(floatBitsToUint(r4.w) == 0u) {
/*100*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*101*/	    r8.xy = floor((r7.xyxx).xy);
/*102*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*103*/	    r3.w = -0.000400 / r3.w;
/*104*/	    r3.w = r3.w + r7.z;
/*105*/	    r9.z = -r9.y + 1.000000;
/*106*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*107*/	    r9.w = -r9.y;
/*108*/	    r11.x = cb2.data[0].z/**/;
/*109*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*110*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*111*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*112*/	    r11.w = -cb2.data[0].w/**/;
/*113*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*114*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*115*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*116*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*117*/	    r9.x = r10.x;
/*118*/	    r9.y = r12.x;
/*119*/	    r9.z = r11.x;
/*120*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*121*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*122*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*123*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*124*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*125*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*126*/	    r3.w = -r7.x + r7.z;
/*127*/	    r3.w = r7.y * r3.w + r7.x;
/*128*/	  } else {
/*129*/	    r3.w = 1.000000;
/*130*/	  }
/*131*/	} else {
/*132*/	  r3.w = 1.000000;
/*133*/	}
/*134*/	r4.w = cb2.data[34].w + -1.000000;
/*135*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*136*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*137*/	if(floatBitsToUint(r2.z) == 0u) {
/*138*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*139*/	  r2.z = floatBitsToInt(r2.z);
/*140*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*141*/	  if(floatBitsToUint(r2.z) != 0u) {
/*142*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*143*/	    r6.w = vsOut_T0.w;
/*144*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*145*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*146*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*147*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*148*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*149*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*150*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*151*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*152*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*153*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*154*/	    if(floatBitsToUint(r6.w) == 0u) {
/*155*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*156*/	      r7.xy = floor((r6.xyxx).xy);
/*157*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*158*/	      r2.z = -0.000400 / r2.z;
/*159*/	      r2.z = r2.z + r6.z;
/*160*/	      r8.z = -r8.y + 1.000000;
/*161*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*162*/	      r8.w = -r8.y;
/*163*/	      r10.x = cb2.data[0].z/**/;
/*164*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*165*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*166*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*167*/	      r10.w = -cb2.data[0].w/**/;
/*168*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*169*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*170*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*171*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*172*/	      r8.x = r9.x;
/*173*/	      r8.y = r11.x;
/*174*/	      r8.z = r10.x;
/*175*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*176*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*177*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*178*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*179*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*180*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*181*/	      r2.z = -r6.x + r6.z;
/*182*/	      r2.z = r6.y * r2.z + r6.x;
/*183*/	    } else {
/*184*/	      r2.z = 1.000000;
/*185*/	    }
/*186*/	  } else {
/*187*/	    r2.z = 1.000000;
/*188*/	  }
/*189*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*190*/	  r6.y = r6.x * cb2.data[34].x;
/*191*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*192*/	  r6.x = r2.y + -r6.x;
/*193*/	  r6.x = saturate(r6.x / r6.y);
/*194*/	  r2.z = -r3.w + r2.z;
/*195*/	  r3.w = r6.x * r2.z + r3.w;
/*196*/	}
/*197*/	if(floatBitsToUint(r4.w) != 0u) {
/*198*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*199*/	  r4.w = r2.z * cb2.data[34].y;
/*200*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*201*/	  r2.z = -r2.z + r2.y;
/*202*/	  r2.z = saturate(r2.z / r4.w);
/*203*/	  r2.w = -r3.w + 1.000000;
/*204*/	  r3.w = r2.z * r2.w + r3.w;
/*205*/	}
/*206*/	r3.w = saturate(r3.w);
/*207*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*208*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*209*/	r2.w = inversesqrt(r2.z);
/*210*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*211*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*212*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*213*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*214*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*215*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*216*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*217*/	r4.w = r2.w * r9.x + 0.300000;
/*218*/	r4.w = saturate(-r4.w + 1.000000);
/*219*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*220*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*221*/	r7.w = -r2.w * r9.x + 1.000000;
/*222*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*223*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*224*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*225*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*226*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*227*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*228*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*229*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*230*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*231*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*232*/	r4.w = saturate(r2.w);
/*233*/	r4.w = r4.w * r4.w;
/*234*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*235*/	r7.w = r7.w * r7.w;
/*236*/	r7.w = r7.w * r7.w;
/*237*/	r4.w = r4.w * r7.w;
/*238*/	r4.z = r4.z * r4.w;
/*239*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*240*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*241*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*242*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*243*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*244*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*245*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*246*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*247*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*248*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*249*/	r7.w = inversesqrt(r7.w);
/*250*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*251*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*252*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*253*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*254*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*255*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*256*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*257*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*258*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*259*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*260*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*261*/	r7.w = r8.z * r8.x;
/*262*/	r2.x = r2.x * r2.x;
/*263*/	r2.w = r2.w + r2.w;
/*264*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*265*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*266*/	r2.w = max(r2.w, 0.000000);
/*267*/	r2.x = r2.x * 127.000000 + 1.600000;
/*268*/	r2.w = log2(r2.w);
/*269*/	r2.x = r2.w * r2.x;
/*270*/	r2.x = exp2(r2.x);
/*271*/	r2.x = min(r2.x, 1.000000);
/*272*/	r1.w = r1.w * r2.x;
/*273*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*274*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*275*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*276*/	r2.x = r1.w + r1.w;
/*277*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r7.xyzx).xyz;
/*278*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*279*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*280*/	r2.x = inversesqrt(r2.x);
/*281*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*282*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*283*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*284*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*285*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*286*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*287*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*288*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*289*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*290*/	r1.w = saturate(-r1.w + 1.000000);
/*291*/	r1.w = r1.w * r1.w;
/*292*/	r1.w = r4.x * r1.w;
/*293*/	r1.w = r1.w * 1.500000;
/*294*/	r1.w = r8.w * r1.w;
/*295*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*296*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*297*/	r0.w = inversesqrt(r0.w);
/*298*/	r0.w = r0.w * r1.y;
/*299*/	r0.w = max(r0.w, 0.000000);
/*300*/	r0.w = r0.w * r1.w;
/*301*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*302*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*303*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*304*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*305*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*306*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*307*/	r1.xy = (r1.xyxx / r2.yyyy).xy;
/*308*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*309*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*310*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*311*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*312*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*313*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*314*/	if(r0.w != 0) discard;
/*315*/	r0.w = sqrt(r2.z);
/*316*/	r1.x = saturate(cb4.data[0].w)/**/;
/*317*/	r1.x = -r1.x + 1.000000;
/*318*/	r1.x = r1.x * 8.000000 + -4.000000;
/*319*/	r1.y = saturate(cb4.data[1].x)/**/;
/*320*/	r1.y = -r1.y + 1.000000;
/*321*/	r1.y = r1.y * 1000.000000;
/*322*/	r0.w = r0.w / r1.y;
/*323*/	r0.w = r0.w + r1.x;
/*324*/	r0.w = r0.w * 1.442695;
/*325*/	r0.w = exp2(r0.w);
/*326*/	r0.w = cb4.data[1].y / r0.w;
/*327*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*328*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*329*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*330*/	r1.x = r1.x + -cb4.data[1].z;
/*331*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*332*/	r1.x = saturate(r1.y * r1.x);
/*333*/	r1.y = r1.x * -2.000000 + 3.000000;
/*334*/	r1.x = r1.x * r1.x;
/*335*/	r1.x = r1.x * r1.y;
/*336*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*337*/	r1.y = sqrt(r1.y);
/*338*/	r1.z = max(cb4.data[2].z, 0.001000);
/*339*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*340*/	r1.y = r1.z * r1.y;
/*341*/	r1.y = min(r1.y, 1.000000);
/*342*/	r1.z = r1.y * -2.000000 + 3.000000;
/*343*/	r1.y = r1.y * r1.y;
/*344*/	r1.y = r1.y * r1.z;
/*345*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*346*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*347*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*348*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*349*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*350*/	r6.w = max(r6.y, 0.000000);
/*351*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*352*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*353*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*354*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*355*/	r0.w = saturate(r0.w * r1.y);
/*356*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*357*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*358*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*359*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*360*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*361*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*362*/	color0.w = 1.000000;
/*363*/	return;
}
