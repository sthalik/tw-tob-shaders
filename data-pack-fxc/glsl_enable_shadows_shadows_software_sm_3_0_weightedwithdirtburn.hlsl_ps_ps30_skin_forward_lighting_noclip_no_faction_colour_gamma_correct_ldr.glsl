//
//
// Shader Model 4
// Fragment Shader
//
// id: 6427 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r2.z = sqrt(r0.w);
/*8*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*11*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*12*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*13*/	r0.w = r4.w * r5.w;
/*14*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*15*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*16*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*17*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*18*/	r0.w = inversesqrt(r0.w);
/*19*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*20*/	r2.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*21*/	r4.x = r2.x;
/*22*/	r4.y = cb1.data[26].x * 0.050000 + r2.y;
/*23*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*24*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*25*/	r0.w = saturate(r4.x * 5.000000);
/*26*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*27*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*28*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*29*/	r1.w = log2(r2.z);
/*30*/	r1.w = r1.w * 1.800000;
/*31*/	r1.w = exp2(r1.w);
/*32*/	r1.w = r1.w * 10.000000;
/*33*/	r1.w = min(r1.w, 1.000000);
/*34*/	r0.w = r0.w + r1.w;
/*35*/	r0.w = r0.w * 0.500000;
/*36*/	r1.w = -r2.w + 1.000000;
/*37*/	r1.w = log2(r1.w);
/*38*/	r1.w = r1.w * vsOut_T7.z;
/*39*/	r1.w = exp2(r1.w);
/*40*/	r1.w = min(r1.w, 1.000000);
/*41*/	r1.w = r1.w * vsOut_T7.z;
/*42*/	r2.x = r2.z * 0.250000;
/*43*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.xxxx).xyz;
/*44*/	r2.xyw = (r0.wwww * r4.xyxz + r2.xxxx).xyw;
/*45*/	r2.xyw = (-r0.xyxz + r2.xyxw).xyw;
/*46*/	r0.xyz = (r1.wwww * r2.xywx + r0.xyzx).xyz;
/*47*/	r0.w = vsOut_T7.z + -0.025000;
/*48*/	r0.w = max(r0.w, 0.000000);
/*49*/	r2.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*50*/	r0.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*51*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*54*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*57*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*60*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*61*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*62*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*63*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*66*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*67*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*68*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*69*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*70*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*71*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*72*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*73*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*74*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*75*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*76*/	r5.w = 1.000000;
/*77*/	r2.w = dot(r5.xyzw, cb1.data[12].xyzw);
/*78*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*79*/	r7.x = uintBitsToFloat((r2.w >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*80*/	r7.y = uintBitsToFloat((r2.w >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*81*/	r7.z = uintBitsToFloat((r2.w >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*82*/	r7.w = uintBitsToFloat((r2.w >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*84*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*85*/	r3.z = intBitsToFloat(int(r3.y));
/*86*/	r3.w = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*87*/	if(floatBitsToUint(r3.w) != 0u) {
/*88*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*89*/	  r6.w = vsOut_T0.w;
/*90*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*91*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*92*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*93*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*94*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*95*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*96*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*97*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*98*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*99*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*100*/	  if(floatBitsToUint(r4.w) == 0u) {
/*101*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*102*/	    r8.xy = floor((r7.xyxx).xy);
/*103*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*104*/	    r3.w = -0.000400 / r3.w;
/*105*/	    r3.w = r3.w + r7.z;
/*106*/	    r9.z = -r9.y + 1.000000;
/*107*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*108*/	    r9.w = -r9.y;
/*109*/	    r11.x = cb2.data[0].z/**/;
/*110*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*111*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*112*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*113*/	    r11.w = -cb2.data[0].w/**/;
/*114*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*115*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*116*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*117*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*118*/	    r9.x = r10.x;
/*119*/	    r9.y = r12.x;
/*120*/	    r9.z = r11.x;
/*121*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*122*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*123*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*124*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*125*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*126*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*127*/	    r3.w = -r7.x + r7.z;
/*128*/	    r3.w = r7.y * r3.w + r7.x;
/*129*/	  } else {
/*130*/	    r3.w = 1.000000;
/*131*/	  }
/*132*/	} else {
/*133*/	  r3.w = 1.000000;
/*134*/	}
/*135*/	r4.w = cb2.data[34].w + -1.000000;
/*136*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*137*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*138*/	if(floatBitsToUint(r3.y) == 0u) {
/*139*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*140*/	  r3.y = floatBitsToInt(r3.y);
/*141*/	  r3.y = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*142*/	  if(floatBitsToUint(r3.y) != 0u) {
/*143*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*144*/	    r6.w = vsOut_T0.w;
/*145*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+6u].xyzw);
/*146*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+7u].xyzw);
/*147*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+8u].xyzw);
/*148*/	    r3.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+9u].xyzw);
/*149*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*150*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*151*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*152*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*153*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*154*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*155*/	    if(floatBitsToUint(r6.w) == 0u) {
/*156*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*157*/	      r7.xy = floor((r6.xyxx).xy);
/*158*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*159*/	      r3.y = -0.000400 / r3.y;
/*160*/	      r3.y = r3.y + r6.z;
/*161*/	      r8.z = -r8.y + 1.000000;
/*162*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*163*/	      r8.w = -r8.y;
/*164*/	      r10.x = cb2.data[0].z/**/;
/*165*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*166*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*167*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*168*/	      r10.w = -cb2.data[0].w/**/;
/*169*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*170*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*171*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*172*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*173*/	      r8.x = r9.x;
/*174*/	      r8.y = r11.x;
/*175*/	      r8.z = r10.x;
/*176*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*177*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*178*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*179*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*180*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*181*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*182*/	      r3.y = -r6.x + r6.z;
/*183*/	      r3.y = r6.y * r3.y + r6.x;
/*184*/	    } else {
/*185*/	      r3.y = 1.000000;
/*186*/	    }
/*187*/	  } else {
/*188*/	    r3.y = 1.000000;
/*189*/	  }
/*190*/	  r6.x = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*191*/	  r6.y = r6.x * cb2.data[34].x;
/*192*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*193*/	  r6.x = r2.w + -r6.x;
/*194*/	  r6.x = saturate(r6.x / r6.y);
/*195*/	  r3.y = -r3.w + r3.y;
/*196*/	  r3.w = r6.x * r3.y + r3.w;
/*197*/	}
/*198*/	if(floatBitsToUint(r4.w) != 0u) {
/*199*/	  r3.y = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*200*/	  r4.w = r3.y * cb2.data[34].y;
/*201*/	  r3.y = -r3.y * cb2.data[34].y + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*202*/	  r3.y = r2.w + -r3.y;
/*203*/	  r3.y = saturate(r3.y / r4.w);
/*204*/	  r3.z = -r3.w + 1.000000;
/*205*/	  r3.w = r3.y * r3.z + r3.w;
/*206*/	}
/*207*/	r3.w = saturate(r3.w);
/*208*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*209*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*210*/	r3.z = inversesqrt(r3.y);
/*211*/	r7.xyz = (r3.zzzz * r6.xyzx).xyz;
/*212*/	r3.z = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*213*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)));
/*214*/	r3.z = dot(vec3(r2.xyzx), vec3(-cb3.data[0].yzwy));
/*215*/	r9.xyz = (r3.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*216*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*217*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*218*/	r4.w = r3.z * r9.x + 0.300000;
/*219*/	r4.w = saturate(-r4.w + 1.000000);
/*220*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*221*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*222*/	r7.w = -r3.z * r9.x + 1.000000;
/*223*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*224*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*225*/	r11.xyz = (r3.zzzz * r9.xxxx + r11.xyzx).xyz;
/*226*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*227*/	r9.xyz = (-r3.zzzz + r9.xyzx).xyz;
/*228*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r3.zzzz).xyz;
/*229*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*230*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*231*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*232*/	r3.z = dot(vec3(r2.xyzx), vec3(cb3.data[0].yzwy));
/*233*/	r4.w = saturate(r3.z);
/*234*/	r4.w = r4.w * r4.w;
/*235*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*236*/	r7.w = r7.w * r7.w;
/*237*/	r7.w = r7.w * r7.w;
/*238*/	r4.w = r4.w * r7.w;
/*239*/	r4.z = r4.z * r4.w;
/*240*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*241*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*242*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*243*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*244*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*245*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*246*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*247*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*248*/	r9.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*249*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*250*/	r7.w = inversesqrt(r7.w);
/*251*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*252*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*253*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*254*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*255*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*256*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*257*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*258*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*259*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*260*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*261*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*262*/	r7.w = r8.z * r8.x;
/*263*/	r3.x = r3.x * r3.x;
/*264*/	r3.z = r3.z + r3.z;
/*265*/	r9.xyz = (r2.xyzx * -r3.zzzz + cb3.data[0].yzwy).xyz;
/*266*/	r3.z = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*267*/	r3.z = max(r3.z, 0.000000);
/*268*/	r3.x = r3.x * 127.000000 + 1.600000;
/*269*/	r3.z = log2(r3.z);
/*270*/	r3.x = r3.z * r3.x;
/*271*/	r3.x = exp2(r3.x);
/*272*/	r3.x = min(r3.x, 1.000000);
/*273*/	r1.w = r1.w * r3.x;
/*274*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*275*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*276*/	r1.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*277*/	r3.x = r1.w + r1.w;
/*278*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r7.xyzx).xyz;
/*279*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*280*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*281*/	r3.x = inversesqrt(r3.x);
/*282*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*283*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*284*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*285*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*286*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*287*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*288*/	r11.xyz = (r11.xyzx * r2.yyyy).xyz;
/*289*/	r10.xyz = (r2.xxxx * r10.xyzx + r11.xyzx).xyz;
/*290*/	r2.xyz = (r2.zzzz * r7.xyzx + r10.xyzx).xyz;
/*291*/	r1.w = saturate(-r1.w + 1.000000);
/*292*/	r1.w = r1.w * r1.w;
/*293*/	r1.w = r4.x * r1.w;
/*294*/	r1.w = r1.w * 1.500000;
/*295*/	r1.w = r8.w * r1.w;
/*296*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*297*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*298*/	r0.w = inversesqrt(r0.w);
/*299*/	r0.w = r0.w * r1.y;
/*300*/	r0.w = max(r0.w, 0.000000);
/*301*/	r0.w = r0.w * r1.w;
/*302*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*303*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*304*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*305*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*306*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*307*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*308*/	r1.xy = (r1.xyxx / r2.wwww).xy;
/*309*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*310*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*311*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*312*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*313*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*314*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*315*/	if(r0.w != 0) discard;
/*316*/	r0.w = sqrt(r3.y);
/*317*/	r1.x = saturate(cb4.data[0].w)/**/;
/*318*/	r1.x = -r1.x + 1.000000;
/*319*/	r1.x = r1.x * 8.000000 + -4.000000;
/*320*/	r1.y = saturate(cb4.data[1].x)/**/;
/*321*/	r1.y = -r1.y + 1.000000;
/*322*/	r1.y = r1.y * 1000.000000;
/*323*/	r0.w = r0.w / r1.y;
/*324*/	r0.w = r0.w + r1.x;
/*325*/	r0.w = r0.w * 1.442695;
/*326*/	r0.w = exp2(r0.w);
/*327*/	r0.w = cb4.data[1].y / r0.w;
/*328*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*329*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*330*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*331*/	r1.x = r1.x + -cb4.data[1].z;
/*332*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*333*/	r1.x = saturate(r1.y * r1.x);
/*334*/	r1.y = r1.x * -2.000000 + 3.000000;
/*335*/	r1.x = r1.x * r1.x;
/*336*/	r1.x = r1.x * r1.y;
/*337*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*338*/	r1.y = sqrt(r1.y);
/*339*/	r1.z = max(cb4.data[2].z, 0.001000);
/*340*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*341*/	r1.y = r1.z * r1.y;
/*342*/	r1.y = min(r1.y, 1.000000);
/*343*/	r1.z = r1.y * -2.000000 + 3.000000;
/*344*/	r1.y = r1.y * r1.y;
/*345*/	r1.y = r1.y * r1.z;
/*346*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*347*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*348*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*349*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*350*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*351*/	r6.w = max(r6.y, 0.000000);
/*352*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*353*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*354*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*355*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*356*/	r0.w = saturate(r0.w * r1.y);
/*357*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*358*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*359*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*360*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*361*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*362*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*363*/	color0.w = 1.000000;
/*364*/	return;
}
