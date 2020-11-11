//
//
// Shader Model 4
// Fragment Shader
//
// id: 6429 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;

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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb4.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r2.z = sqrt(r0.w);
/*18*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*21*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*22*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*23*/	r0.w = r4.w * r5.w;
/*24*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*25*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*26*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*27*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*28*/	r0.w = inversesqrt(r0.w);
/*29*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*30*/	r2.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*31*/	r4.x = r2.x;
/*32*/	r4.y = cb0.data[26].x * 0.050000 + r2.y;
/*33*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*34*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*35*/	r0.w = saturate(r4.x * 5.000000);
/*36*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*37*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*39*/	r1.w = log2(r2.z);
/*40*/	r1.w = r1.w * 1.800000;
/*41*/	r1.w = exp2(r1.w);
/*42*/	r1.w = r1.w * 10.000000;
/*43*/	r1.w = min(r1.w, 1.000000);
/*44*/	r0.w = r0.w + r1.w;
/*45*/	r0.w = r0.w * 0.500000;
/*46*/	r1.w = -r2.w + 1.000000;
/*47*/	r1.w = log2(r1.w);
/*48*/	r1.w = r1.w * vsOut_T7.z;
/*49*/	r1.w = exp2(r1.w);
/*50*/	r1.w = min(r1.w, 1.000000);
/*51*/	r1.w = r1.w * vsOut_T7.z;
/*52*/	r2.x = r2.z * 0.250000;
/*53*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.xxxx).xyz;
/*54*/	r2.xyw = (r0.wwww * r4.xyxz + r2.xxxx).xyw;
/*55*/	r2.xyw = (-r0.xyxz + r2.xyxw).xyw;
/*56*/	r0.xyz = (r1.wwww * r2.xywx + r0.xyzx).xyz;
/*57*/	r0.w = vsOut_T7.z + -0.025000;
/*58*/	r0.w = max(r0.w, 0.000000);
/*59*/	r2.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*60*/	r0.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*61*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*64*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*65*/	r0.w = inversesqrt(r0.w);
/*66*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*67*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*68*/	r0.w = inversesqrt(r0.w);
/*69*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*70*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*71*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*72*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*73*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*74*/	r0.w = inversesqrt(r0.w);
/*75*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*76*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*77*/	r1.w = -vsOut_T4.z + 1.000000;
/*78*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*79*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*80*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*81*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*82*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*83*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*84*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*85*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*86*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*87*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*88*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*89*/	r5.w = 1.000000;
/*90*/	r2.w = dot(r5.xyzw, cb0.data[12].xyzw);
/*91*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*92*/	r7.x = uintBitsToFloat((r2.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*93*/	r7.y = uintBitsToFloat((r2.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*94*/	r7.z = uintBitsToFloat((r2.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*95*/	r7.w = uintBitsToFloat((r2.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*96*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*97*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*98*/	r3.z = intBitsToFloat(int(r3.y));
/*99*/	r3.w = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r3.w) != 0u) {
/*101*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*102*/	  r6.w = vsOut_T0.w;
/*103*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*104*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*105*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*106*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*107*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*108*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*109*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*110*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*111*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*112*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*113*/	  if(floatBitsToUint(r4.w) == 0u) {
/*114*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*115*/	    r8.xy = floor((r7.xyxx).xy);
/*116*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*117*/	    r3.w = -0.000400 / r3.w;
/*118*/	    r3.w = r3.w + r7.z;
/*119*/	    r9.z = -r9.y + 1.000000;
/*120*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*121*/	    r9.w = -r9.y;
/*122*/	    r11.x = cb1.data[0].z/**/;
/*123*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*124*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*125*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*126*/	    r11.w = -cb1.data[0].w/**/;
/*127*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*128*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*129*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*130*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*131*/	    r9.x = r10.x;
/*132*/	    r9.y = r12.x;
/*133*/	    r9.z = r11.x;
/*134*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*135*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*136*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*137*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*138*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*139*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*140*/	    r3.w = -r7.x + r7.z;
/*141*/	    r3.w = r7.y * r3.w + r7.x;
/*142*/	  } else {
/*143*/	    r3.w = 1.000000;
/*144*/	  }
/*145*/	} else {
/*146*/	  r3.w = 1.000000;
/*147*/	}
/*148*/	r4.w = cb1.data[34].w + -1.000000;
/*149*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*150*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*151*/	if(floatBitsToUint(r3.y) == 0u) {
/*152*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*153*/	  r3.y = floatBitsToInt(r3.y);
/*154*/	  r3.y = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*155*/	  if(floatBitsToUint(r3.y) != 0u) {
/*156*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*157*/	    r6.w = vsOut_T0.w;
/*158*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+6u].xyzw);
/*159*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+7u].xyzw);
/*160*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+8u].xyzw);
/*161*/	    r3.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+9u].xyzw);
/*162*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*163*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*164*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*165*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*166*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*167*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*168*/	    if(floatBitsToUint(r6.w) == 0u) {
/*169*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*170*/	      r7.xy = floor((r6.xyxx).xy);
/*171*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*172*/	      r3.y = -0.000400 / r3.y;
/*173*/	      r3.y = r3.y + r6.z;
/*174*/	      r8.z = -r8.y + 1.000000;
/*175*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*176*/	      r8.w = -r8.y;
/*177*/	      r10.x = cb1.data[0].z/**/;
/*178*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*179*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*180*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*181*/	      r10.w = -cb1.data[0].w/**/;
/*182*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*183*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*184*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*185*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*186*/	      r8.x = r9.x;
/*187*/	      r8.y = r11.x;
/*188*/	      r8.z = r10.x;
/*189*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*190*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*191*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*192*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*193*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*194*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*195*/	      r3.y = -r6.x + r6.z;
/*196*/	      r3.y = r6.y * r3.y + r6.x;
/*197*/	    } else {
/*198*/	      r3.y = 1.000000;
/*199*/	    }
/*200*/	  } else {
/*201*/	    r3.y = 1.000000;
/*202*/	  }
/*203*/	  r6.x = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*204*/	  r6.y = r6.x * cb1.data[34].x;
/*205*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*206*/	  r6.x = r2.w + -r6.x;
/*207*/	  r6.x = saturate(r6.x / r6.y);
/*208*/	  r3.y = -r3.w + r3.y;
/*209*/	  r3.w = r6.x * r3.y + r3.w;
/*210*/	}
/*211*/	if(floatBitsToUint(r4.w) != 0u) {
/*212*/	  r3.y = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*213*/	  r4.w = r3.y * cb1.data[34].y;
/*214*/	  r3.y = -r3.y * cb1.data[34].y + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*215*/	  r3.y = r2.w + -r3.y;
/*216*/	  r3.y = saturate(r3.y / r4.w);
/*217*/	  r3.z = -r3.w + 1.000000;
/*218*/	  r3.w = r3.y * r3.z + r3.w;
/*219*/	}
/*220*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*221*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*222*/	r3.y = inversesqrt(r3.y);
/*223*/	r6.xyz = (r3.yyyy * r6.xyzx).xyz;
/*224*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*225*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*226*/	r3.y = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*227*/	r8.xyz = (r3.yyyy * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*228*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*229*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*230*/	r3.z = r3.y * r8.x + 0.300000;
/*231*/	r3.z = saturate(-r3.z + 1.000000);
/*232*/	r10.xyz = (r3.zzzz * r9.xyzx).xyz;
/*233*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*234*/	r4.w = -r3.y * r8.x + 1.000000;
/*235*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*236*/	r9.xyz = (-r9.xyzx * r3.zzzz + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*237*/	r10.xyz = (r3.yyyy * r8.xxxx + r10.xyzx).xyz;
/*238*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*239*/	r8.xyz = (-r3.yyyy + r8.xyzx).xyz;
/*240*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r3.yyyy).xyz;
/*241*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*242*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*243*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*244*/	r3.y = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*245*/	r3.zw = saturate(r3.yyyw).zw;
/*246*/	r3.z = r3.z * r3.z;
/*247*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*248*/	r4.w = r4.w * r4.w;
/*249*/	r4.w = r4.w * r4.w;
/*250*/	r3.z = r3.z * r4.w;
/*251*/	r3.z = r4.z * r3.z;
/*252*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*253*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*254*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*255*/	r4.yzw = (r3.zzzz * r4.yyzw).yzw;
/*256*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*257*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*258*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*259*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*260*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*261*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*262*/	r3.z = inversesqrt(r3.z);
/*263*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*264*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*265*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*266*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*267*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*268*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*269*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*270*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*271*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*272*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*273*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*274*/	r3.z = r7.z * r7.x;
/*275*/	r3.x = r3.x * r3.x;
/*276*/	r3.y = r3.y + r3.y;
/*277*/	r8.xyz = (r2.xyzx * -r3.yyyy + cb2.data[0].yzwy).xyz;
/*278*/	r3.y = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*279*/	r3.y = max(r3.y, 0.000000);
/*280*/	r3.x = r3.x * 127.000000 + 1.600000;
/*281*/	r3.y = log2(r3.y);
/*282*/	r3.x = r3.y * r3.x;
/*283*/	r3.x = exp2(r3.x);
/*284*/	r3.x = min(r3.x, 1.000000);
/*285*/	r1.w = r1.w * r3.x;
/*286*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*287*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*288*/	r1.w = dot(vec3(-r6.xyzx), vec3(r2.xyzx));
/*289*/	r3.x = r1.w + r1.w;
/*290*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r6.xyzx).xyz;
/*291*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*292*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*293*/	r3.x = inversesqrt(r3.x);
/*294*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*295*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*296*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*297*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*298*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*299*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*300*/	r6.xyz = (r6.xywx * r2.yyyy).xyz;
/*301*/	r6.xyz = (r2.xxxx * r8.xyzx + r6.xyzx).xyz;
/*302*/	r2.xyz = (r2.zzzz * r9.xyzx + r6.xyzx).xyz;
/*303*/	r1.w = saturate(-r1.w + 1.000000);
/*304*/	r1.w = r1.w * r1.w;
/*305*/	r1.w = r4.x * r1.w;
/*306*/	r1.w = r1.w * 1.500000;
/*307*/	r1.w = r7.w * r1.w;
/*308*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*309*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*310*/	r0.w = inversesqrt(r0.w);
/*311*/	r0.w = r0.w * r1.y;
/*312*/	r0.w = max(r0.w, 0.000000);
/*313*/	r0.w = r0.w * r1.w;
/*314*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*315*/	r0.xyz = (r0.xyzx * r3.zzzz + r1.xyzx).xyz;
/*316*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*317*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*318*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*319*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*320*/	r0.xy = (r0.xyxx / r2.wwww).xy;
/*321*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*322*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*323*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*324*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*325*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*326*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*327*/	if(r0.x != 0) discard;
/*328*/	color0.w = 1.000000;
/*329*/	color1.x = 1.000000;
/*330*/	return;
}
