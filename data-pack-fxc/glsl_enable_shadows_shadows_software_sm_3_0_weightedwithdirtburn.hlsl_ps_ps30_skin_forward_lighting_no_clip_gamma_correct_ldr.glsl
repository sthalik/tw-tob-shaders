//
//
// Shader Model 4
// Fragment Shader
//
// id: 6423 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb5;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*2*/	r2.xyz = (cb6.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb6.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb6.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
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
/*17*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*29*/	r4.y = cb1.data[26].x * 0.050000 + r2.y;
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
/*75*/	r5.xyz = (vsOut_T4.zzzz * cb6.data[3].xyzx).xyz;
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
/*87*/	r2.w = dot(r5.xyzw, cb1.data[12].xyzw);
/*88*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*89*/	r7.x = uintBitsToFloat((r2.w >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*90*/	r7.y = uintBitsToFloat((r2.w >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r7.z = uintBitsToFloat((r2.w >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*92*/	r7.w = uintBitsToFloat((r2.w >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*93*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*94*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*95*/	r3.z = intBitsToFloat(int(r3.y));
/*96*/	r3.w = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*97*/	if(floatBitsToUint(r3.w) != 0u) {
/*98*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*99*/	  r6.w = vsOut_T0.w;
/*100*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*101*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*102*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*103*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*104*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*105*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*106*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*107*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*108*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*109*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*110*/	  if(floatBitsToUint(r4.w) == 0u) {
/*111*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*112*/	    r8.xy = floor((r7.xyxx).xy);
/*113*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*114*/	    r3.w = -0.000400 / r3.w;
/*115*/	    r3.w = r3.w + r7.z;
/*116*/	    r9.z = -r9.y + 1.000000;
/*117*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*118*/	    r9.w = -r9.y;
/*119*/	    r11.x = cb2.data[0].z/**/;
/*120*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*121*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*122*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*123*/	    r11.w = -cb2.data[0].w/**/;
/*124*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*125*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*126*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
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
/*145*/	r4.w = cb2.data[34].w + -1.000000;
/*146*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*147*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*148*/	if(floatBitsToUint(r3.y) == 0u) {
/*149*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*150*/	  r3.y = floatBitsToInt(r3.y);
/*151*/	  r3.y = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*152*/	  if(floatBitsToUint(r3.y) != 0u) {
/*153*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*154*/	    r6.w = vsOut_T0.w;
/*155*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+6u].xyzw);
/*156*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+7u].xyzw);
/*157*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+8u].xyzw);
/*158*/	    r3.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+9u].xyzw);
/*159*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*160*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*161*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*162*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*163*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*164*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*165*/	    if(floatBitsToUint(r6.w) == 0u) {
/*166*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*167*/	      r7.xy = floor((r6.xyxx).xy);
/*168*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*169*/	      r3.y = -0.000400 / r3.y;
/*170*/	      r3.y = r3.y + r6.z;
/*171*/	      r8.z = -r8.y + 1.000000;
/*172*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*173*/	      r8.w = -r8.y;
/*174*/	      r10.x = cb2.data[0].z/**/;
/*175*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*176*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*177*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*178*/	      r10.w = -cb2.data[0].w/**/;
/*179*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*180*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*181*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
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
/*200*/	  r6.x = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*201*/	  r6.y = r6.x * cb2.data[34].x;
/*202*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*203*/	  r6.x = r2.w + -r6.x;
/*204*/	  r6.x = saturate(r6.x / r6.y);
/*205*/	  r3.y = -r3.w + r3.y;
/*206*/	  r3.w = r6.x * r3.y + r3.w;
/*207*/	}
/*208*/	if(floatBitsToUint(r4.w) != 0u) {
/*209*/	  r3.y = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*210*/	  r4.w = r3.y * cb2.data[34].y;
/*211*/	  r3.y = -r3.y * cb2.data[34].y + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*212*/	  r3.y = r2.w + -r3.y;
/*213*/	  r3.y = saturate(r3.y / r4.w);
/*214*/	  r3.z = -r3.w + 1.000000;
/*215*/	  r3.w = r3.y * r3.z + r3.w;
/*216*/	}
/*217*/	r3.w = saturate(r3.w);
/*218*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*219*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*220*/	r3.z = inversesqrt(r3.y);
/*221*/	r7.xyz = (r3.zzzz * r6.xyzx).xyz;
/*222*/	r3.z = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*223*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)));
/*224*/	r3.z = dot(vec3(r2.xyzx), vec3(-cb3.data[0].yzwy));
/*225*/	r9.xyz = (r3.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*226*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*227*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*228*/	r4.w = r3.z * r9.x + 0.300000;
/*229*/	r4.w = saturate(-r4.w + 1.000000);
/*230*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*231*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*232*/	r7.w = -r3.z * r9.x + 1.000000;
/*233*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*234*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*235*/	r11.xyz = (r3.zzzz * r9.xxxx + r11.xyzx).xyz;
/*236*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*237*/	r9.xyz = (-r3.zzzz + r9.xyzx).xyz;
/*238*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r3.zzzz).xyz;
/*239*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*240*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*241*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*242*/	r3.z = dot(vec3(r2.xyzx), vec3(cb3.data[0].yzwy));
/*243*/	r4.w = saturate(r3.z);
/*244*/	r4.w = r4.w * r4.w;
/*245*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*246*/	r7.w = r7.w * r7.w;
/*247*/	r7.w = r7.w * r7.w;
/*248*/	r4.w = r4.w * r7.w;
/*249*/	r4.z = r4.z * r4.w;
/*250*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*251*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*252*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*253*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*254*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*255*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*256*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*257*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*258*/	r9.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*259*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*260*/	r7.w = inversesqrt(r7.w);
/*261*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*262*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*263*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*264*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*265*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*266*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*267*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*268*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*269*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*270*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*271*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*272*/	r7.w = r8.z * r8.x;
/*273*/	r3.x = r3.x * r3.x;
/*274*/	r3.z = r3.z + r3.z;
/*275*/	r9.xyz = (r2.xyzx * -r3.zzzz + cb3.data[0].yzwy).xyz;
/*276*/	r3.z = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*277*/	r3.z = max(r3.z, 0.000000);
/*278*/	r3.x = r3.x * 127.000000 + 1.600000;
/*279*/	r3.z = log2(r3.z);
/*280*/	r3.x = r3.z * r3.x;
/*281*/	r3.x = exp2(r3.x);
/*282*/	r3.x = min(r3.x, 1.000000);
/*283*/	r1.w = r1.w * r3.x;
/*284*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*285*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*286*/	r1.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*287*/	r3.x = r1.w + r1.w;
/*288*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r7.xyzx).xyz;
/*289*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*290*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*291*/	r3.x = inversesqrt(r3.x);
/*292*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*293*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*294*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*295*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*296*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*297*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*298*/	r11.xyz = (r11.xyzx * r2.yyyy).xyz;
/*299*/	r10.xyz = (r2.xxxx * r10.xyzx + r11.xyzx).xyz;
/*300*/	r2.xyz = (r2.zzzz * r7.xyzx + r10.xyzx).xyz;
/*301*/	r1.w = saturate(-r1.w + 1.000000);
/*302*/	r1.w = r1.w * r1.w;
/*303*/	r1.w = r4.x * r1.w;
/*304*/	r1.w = r1.w * 1.500000;
/*305*/	r1.w = r8.w * r1.w;
/*306*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*307*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*308*/	r0.w = inversesqrt(r0.w);
/*309*/	r0.w = r0.w * r1.y;
/*310*/	r0.w = max(r0.w, 0.000000);
/*311*/	r0.w = r0.w * r1.w;
/*312*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*313*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*314*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*315*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*316*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*317*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*318*/	r1.xy = (r1.xyxx / r2.wwww).xy;
/*319*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*320*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*321*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*322*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*323*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*324*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*325*/	if(r0.w != 0) discard;
/*326*/	r0.w = sqrt(r3.y);
/*327*/	r1.x = saturate(cb4.data[0].w)/**/;
/*328*/	r1.x = -r1.x + 1.000000;
/*329*/	r1.x = r1.x * 8.000000 + -4.000000;
/*330*/	r1.y = saturate(cb4.data[1].x)/**/;
/*331*/	r1.y = -r1.y + 1.000000;
/*332*/	r1.y = r1.y * 1000.000000;
/*333*/	r0.w = r0.w / r1.y;
/*334*/	r0.w = r0.w + r1.x;
/*335*/	r0.w = r0.w * 1.442695;
/*336*/	r0.w = exp2(r0.w);
/*337*/	r0.w = cb4.data[1].y / r0.w;
/*338*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*339*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*340*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*341*/	r1.x = r1.x + -cb4.data[1].z;
/*342*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*343*/	r1.x = saturate(r1.y * r1.x);
/*344*/	r1.y = r1.x * -2.000000 + 3.000000;
/*345*/	r1.x = r1.x * r1.x;
/*346*/	r1.x = r1.x * r1.y;
/*347*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*348*/	r1.y = sqrt(r1.y);
/*349*/	r1.z = max(cb4.data[2].z, 0.001000);
/*350*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*351*/	r1.y = r1.z * r1.y;
/*352*/	r1.y = min(r1.y, 1.000000);
/*353*/	r1.z = r1.y * -2.000000 + 3.000000;
/*354*/	r1.y = r1.y * r1.y;
/*355*/	r1.y = r1.y * r1.z;
/*356*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*357*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*358*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*359*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*360*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*361*/	r6.w = max(r6.y, 0.000000);
/*362*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*363*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*364*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*365*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*366*/	r0.w = saturate(r0.w * r1.y);
/*367*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*368*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*369*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*370*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*371*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*372*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*373*/	color0.w = 1.000000;
/*374*/	return;
}
