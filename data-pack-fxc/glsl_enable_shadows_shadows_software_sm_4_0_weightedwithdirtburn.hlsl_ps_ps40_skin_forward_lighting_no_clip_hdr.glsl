//
//
// Shader Model 4
// Fragment Shader
//
// id: 6431 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb4.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*9*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*11*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r2.z = sqrt(r0.w);
/*15*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*17*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*18*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*19*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*20*/	r0.w = r4.w * r5.w;
/*21*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*22*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*23*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*24*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*25*/	r0.w = inversesqrt(r0.w);
/*26*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*27*/	r2.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*28*/	r4.x = r2.x;
/*29*/	r4.y = cb0.data[26].x * 0.050000 + r2.y;
/*30*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*31*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*32*/	r0.w = saturate(r4.x * 5.000000);
/*33*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*34*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*36*/	r1.w = log2(r2.z);
/*37*/	r1.w = r1.w * 1.800000;
/*38*/	r1.w = exp2(r1.w);
/*39*/	r1.w = r1.w * 10.000000;
/*40*/	r1.w = min(r1.w, 1.000000);
/*41*/	r0.w = r0.w + r1.w;
/*42*/	r0.w = r0.w * 0.500000;
/*43*/	r1.w = -r2.w + 1.000000;
/*44*/	r1.w = log2(r1.w);
/*45*/	r1.w = r1.w * vsOut_T7.z;
/*46*/	r1.w = exp2(r1.w);
/*47*/	r1.w = min(r1.w, 1.000000);
/*48*/	r1.w = r1.w * vsOut_T7.z;
/*49*/	r2.x = r2.z * 0.250000;
/*50*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.xxxx).xyz;
/*51*/	r2.xyw = (r0.wwww * r4.xyxz + r2.xxxx).xyw;
/*52*/	r2.xyw = (-r0.xyxz + r2.xyxw).xyw;
/*53*/	r0.xyz = (r1.wwww * r2.xywx + r0.xyzx).xyz;
/*54*/	r0.w = vsOut_T7.z + -0.025000;
/*55*/	r0.w = max(r0.w, 0.000000);
/*56*/	r2.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*57*/	r0.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*58*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r0.w = inversesqrt(r0.w);
/*60*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*61*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*64*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r0.w = inversesqrt(r0.w);
/*66*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*68*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*69*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*70*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*71*/	r0.w = inversesqrt(r0.w);
/*72*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*73*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*74*/	r1.w = -vsOut_T4.z + 1.000000;
/*75*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*76*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*77*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*78*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*79*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*80*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*81*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*82*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*83*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*84*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*85*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*86*/	r5.w = 1.000000;
/*87*/	r2.w = dot(r5.xyzw, cb0.data[12].xyzw);
/*88*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*89*/	r7.x = uintBitsToFloat((r2.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*90*/	r7.y = uintBitsToFloat((r2.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r7.z = uintBitsToFloat((r2.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*92*/	r7.w = uintBitsToFloat((r2.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*93*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*94*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*95*/	r3.z = intBitsToFloat(int(r3.y));
/*96*/	r3.w = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*97*/	if(floatBitsToUint(r3.w) != 0u) {
/*98*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*99*/	  r6.w = vsOut_T0.w;
/*100*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*101*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*102*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*103*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*104*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*105*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*106*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*107*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*108*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*109*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*110*/	  if(floatBitsToUint(r4.w) == 0u) {
/*111*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*112*/	    r8.xy = floor((r7.xyxx).xy);
/*113*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*114*/	    r3.w = -0.000400 / r3.w;
/*115*/	    r3.w = r3.w + r7.z;
/*116*/	    r9.z = -r9.y + 1.000000;
/*117*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*118*/	    r9.w = -r9.y;
/*119*/	    r11.x = cb1.data[0].z/**/;
/*120*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*121*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*122*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*123*/	    r11.w = -cb1.data[0].w/**/;
/*124*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*125*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*126*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*127*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*128*/	    r9.x = r10.x;
/*129*/	    r9.y = r12.x;
/*130*/	    r9.z = r11.x;
/*131*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*132*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*133*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*134*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*135*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*136*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*137*/	    r3.w = -r7.x + r7.z;
/*138*/	    r3.w = r7.y * r3.w + r7.x;
/*139*/	  } else {
/*140*/	    r3.w = 1.000000;
/*141*/	  }
/*142*/	} else {
/*143*/	  r3.w = 1.000000;
/*144*/	}
/*145*/	r4.w = cb1.data[34].w + -1.000000;
/*146*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*147*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*148*/	if(floatBitsToUint(r3.y) == 0u) {
/*149*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*150*/	  r3.y = floatBitsToInt(r3.y);
/*151*/	  r3.y = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*152*/	  if(floatBitsToUint(r3.y) != 0u) {
/*153*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*154*/	    r6.w = vsOut_T0.w;
/*155*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+6u].xyzw);
/*156*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+7u].xyzw);
/*157*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+8u].xyzw);
/*158*/	    r3.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+9u].xyzw);
/*159*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*160*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*161*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*162*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*163*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*164*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*165*/	    if(floatBitsToUint(r6.w) == 0u) {
/*166*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*167*/	      r7.xy = floor((r6.xyxx).xy);
/*168*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*169*/	      r3.y = -0.000400 / r3.y;
/*170*/	      r3.y = r3.y + r6.z;
/*171*/	      r8.z = -r8.y + 1.000000;
/*172*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*173*/	      r8.w = -r8.y;
/*174*/	      r10.x = cb1.data[0].z/**/;
/*175*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*176*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*177*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*178*/	      r10.w = -cb1.data[0].w/**/;
/*179*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*180*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*181*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*182*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*183*/	      r8.x = r9.x;
/*184*/	      r8.y = r11.x;
/*185*/	      r8.z = r10.x;
/*186*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*187*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*188*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*189*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*190*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*191*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*192*/	      r3.y = -r6.x + r6.z;
/*193*/	      r3.y = r6.y * r3.y + r6.x;
/*194*/	    } else {
/*195*/	      r3.y = 1.000000;
/*196*/	    }
/*197*/	  } else {
/*198*/	    r3.y = 1.000000;
/*199*/	  }
/*200*/	  r6.x = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*201*/	  r6.y = r6.x * cb1.data[34].x;
/*202*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*203*/	  r6.x = r2.w + -r6.x;
/*204*/	  r6.x = saturate(r6.x / r6.y);
/*205*/	  r3.y = -r3.w + r3.y;
/*206*/	  r3.w = r6.x * r3.y + r3.w;
/*207*/	}
/*208*/	if(floatBitsToUint(r4.w) != 0u) {
/*209*/	  r3.y = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*210*/	  r4.w = r3.y * cb1.data[34].y;
/*211*/	  r3.y = -r3.y * cb1.data[34].y + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*212*/	  r3.y = r2.w + -r3.y;
/*213*/	  r3.y = saturate(r3.y / r4.w);
/*214*/	  r3.z = -r3.w + 1.000000;
/*215*/	  r3.w = r3.y * r3.z + r3.w;
/*216*/	}
/*217*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*218*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*219*/	r3.y = inversesqrt(r3.y);
/*220*/	r6.xyz = (r3.yyyy * r6.xyzx).xyz;
/*221*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*222*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*223*/	r3.y = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*224*/	r8.xyz = (r3.yyyy * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*225*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*226*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*227*/	r3.z = r3.y * r8.x + 0.300000;
/*228*/	r3.z = saturate(-r3.z + 1.000000);
/*229*/	r10.xyz = (r3.zzzz * r9.xyzx).xyz;
/*230*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*231*/	r4.w = -r3.y * r8.x + 1.000000;
/*232*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*233*/	r9.xyz = (-r9.xyzx * r3.zzzz + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*234*/	r10.xyz = (r3.yyyy * r8.xxxx + r10.xyzx).xyz;
/*235*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*236*/	r8.xyz = (-r3.yyyy + r8.xyzx).xyz;
/*237*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r3.yyyy).xyz;
/*238*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*239*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*240*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*241*/	r3.y = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*242*/	r3.zw = saturate(r3.yyyw).zw;
/*243*/	r3.z = r3.z * r3.z;
/*244*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*245*/	r4.w = r4.w * r4.w;
/*246*/	r4.w = r4.w * r4.w;
/*247*/	r3.z = r3.z * r4.w;
/*248*/	r3.z = r4.z * r3.z;
/*249*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*250*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*251*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*252*/	r4.yzw = (r3.zzzz * r4.yyzw).yzw;
/*253*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*254*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*255*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*256*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*257*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*258*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*259*/	r3.z = inversesqrt(r3.z);
/*260*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*261*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*262*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*263*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*264*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*265*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*266*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*267*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*268*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*269*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*270*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*271*/	r3.z = r7.z * r7.x;
/*272*/	r3.x = r3.x * r3.x;
/*273*/	r3.y = r3.y + r3.y;
/*274*/	r8.xyz = (r2.xyzx * -r3.yyyy + cb2.data[0].yzwy).xyz;
/*275*/	r3.y = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*276*/	r3.y = max(r3.y, 0.000000);
/*277*/	r3.x = r3.x * 127.000000 + 1.600000;
/*278*/	r3.y = log2(r3.y);
/*279*/	r3.x = r3.y * r3.x;
/*280*/	r3.x = exp2(r3.x);
/*281*/	r3.x = min(r3.x, 1.000000);
/*282*/	r1.w = r1.w * r3.x;
/*283*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*284*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*285*/	r1.w = dot(vec3(-r6.xyzx), vec3(r2.xyzx));
/*286*/	r3.x = r1.w + r1.w;
/*287*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r6.xyzx).xyz;
/*288*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*289*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*290*/	r3.x = inversesqrt(r3.x);
/*291*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*292*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*293*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*294*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*295*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*296*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*297*/	r6.xyz = (r6.xywx * r2.yyyy).xyz;
/*298*/	r6.xyz = (r2.xxxx * r8.xyzx + r6.xyzx).xyz;
/*299*/	r2.xyz = (r2.zzzz * r9.xyzx + r6.xyzx).xyz;
/*300*/	r1.w = saturate(-r1.w + 1.000000);
/*301*/	r1.w = r1.w * r1.w;
/*302*/	r1.w = r4.x * r1.w;
/*303*/	r1.w = r1.w * 1.500000;
/*304*/	r1.w = r7.w * r1.w;
/*305*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*306*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*307*/	r0.w = inversesqrt(r0.w);
/*308*/	r0.w = r0.w * r1.y;
/*309*/	r0.w = max(r0.w, 0.000000);
/*310*/	r0.w = r0.w * r1.w;
/*311*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*312*/	r0.xyz = (r0.xyzx * r3.zzzz + r1.xyzx).xyz;
/*313*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*314*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*315*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*316*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*317*/	r0.xy = (r0.xyxx / r2.wwww).xy;
/*318*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*319*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*320*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*321*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*322*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*323*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*324*/	if(r0.x != 0) discard;
/*325*/	color0.w = 1.000000;
/*326*/	color1.x = 1.000000;
/*327*/	return;
}
