//
//
// Shader Model 4
// Fragment Shader
//
// id: 6425 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_skin_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r2.z = sqrt(r0.w);
/*11*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*14*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*15*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*16*/	r0.w = r4.w * r5.w;
/*17*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*18*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*19*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*20*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*21*/	r0.w = inversesqrt(r0.w);
/*22*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*23*/	r2.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*24*/	r4.x = r2.x;
/*25*/	r4.y = cb1.data[26].x * 0.050000 + r2.y;
/*26*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*27*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*28*/	r0.w = saturate(r4.x * 5.000000);
/*29*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*30*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*31*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*32*/	r1.w = log2(r2.z);
/*33*/	r1.w = r1.w * 1.800000;
/*34*/	r1.w = exp2(r1.w);
/*35*/	r1.w = r1.w * 10.000000;
/*36*/	r1.w = min(r1.w, 1.000000);
/*37*/	r0.w = r0.w + r1.w;
/*38*/	r0.w = r0.w * 0.500000;
/*39*/	r1.w = -r2.w + 1.000000;
/*40*/	r1.w = log2(r1.w);
/*41*/	r1.w = r1.w * vsOut_T7.z;
/*42*/	r1.w = exp2(r1.w);
/*43*/	r1.w = min(r1.w, 1.000000);
/*44*/	r1.w = r1.w * vsOut_T7.z;
/*45*/	r2.x = r2.z * 0.250000;
/*46*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.xxxx).xyz;
/*47*/	r2.xyw = (r0.wwww * r4.xyxz + r2.xxxx).xyw;
/*48*/	r2.xyw = (-r0.xyxz + r2.xyxw).xyw;
/*49*/	r0.xyz = (r1.wwww * r2.xywx + r0.xyzx).xyz;
/*50*/	r0.w = vsOut_T7.z + -0.025000;
/*51*/	r0.w = max(r0.w, 0.000000);
/*52*/	r2.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*53*/	r0.xyz = (r0.wwww * r2.xyzx + r0.xyzx).xyz;
/*54*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*57*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*60*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*63*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*64*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*65*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*66*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*69*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*71*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*72*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*73*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*74*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*75*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*76*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*77*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*78*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*79*/	r5.w = 1.000000;
/*80*/	r2.w = dot(r5.xyzw, cb1.data[12].xyzw);
/*81*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*82*/	r7.x = uintBitsToFloat((r2.w >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r7.y = uintBitsToFloat((r2.w >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*84*/	r7.z = uintBitsToFloat((r2.w >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*85*/	r7.w = uintBitsToFloat((r2.w >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*87*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*88*/	r3.z = intBitsToFloat(int(r3.y));
/*89*/	r3.w = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*90*/	if(floatBitsToUint(r3.w) != 0u) {
/*91*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*92*/	  r6.w = vsOut_T0.w;
/*93*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*94*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*95*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*96*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*97*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*98*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*99*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*100*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*101*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*102*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*103*/	  if(floatBitsToUint(r4.w) == 0u) {
/*104*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*105*/	    r8.xy = floor((r7.xyxx).xy);
/*106*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*107*/	    r3.w = -0.000400 / r3.w;
/*108*/	    r3.w = r3.w + r7.z;
/*109*/	    r9.z = -r9.y + 1.000000;
/*110*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*111*/	    r9.w = -r9.y;
/*112*/	    r11.x = cb2.data[0].z/**/;
/*113*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*114*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*115*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*116*/	    r11.w = -cb2.data[0].w/**/;
/*117*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*118*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*119*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*120*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*121*/	    r9.x = r10.x;
/*122*/	    r9.y = r12.x;
/*123*/	    r9.z = r11.x;
/*124*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*125*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*126*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*127*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*128*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*129*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*130*/	    r3.w = -r7.x + r7.z;
/*131*/	    r3.w = r7.y * r3.w + r7.x;
/*132*/	  } else {
/*133*/	    r3.w = 1.000000;
/*134*/	  }
/*135*/	} else {
/*136*/	  r3.w = 1.000000;
/*137*/	}
/*138*/	r4.w = cb2.data[34].w + -1.000000;
/*139*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*140*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*141*/	if(floatBitsToUint(r3.y) == 0u) {
/*142*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*143*/	  r3.y = floatBitsToInt(r3.y);
/*144*/	  r3.y = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*145*/	  if(floatBitsToUint(r3.y) != 0u) {
/*146*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*147*/	    r6.w = vsOut_T0.w;
/*148*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+6u].xyzw);
/*149*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+7u].xyzw);
/*150*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+8u].xyzw);
/*151*/	    r3.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+9u].xyzw);
/*152*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*153*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*154*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*155*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*156*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*157*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*158*/	    if(floatBitsToUint(r6.w) == 0u) {
/*159*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*160*/	      r7.xy = floor((r6.xyxx).xy);
/*161*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*162*/	      r3.y = -0.000400 / r3.y;
/*163*/	      r3.y = r3.y + r6.z;
/*164*/	      r8.z = -r8.y + 1.000000;
/*165*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*166*/	      r8.w = -r8.y;
/*167*/	      r10.x = cb2.data[0].z/**/;
/*168*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*169*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*170*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*171*/	      r10.w = -cb2.data[0].w/**/;
/*172*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*173*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*174*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*175*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*176*/	      r8.x = r9.x;
/*177*/	      r8.y = r11.x;
/*178*/	      r8.z = r10.x;
/*179*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*180*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*181*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*182*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*183*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*184*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*185*/	      r3.y = -r6.x + r6.z;
/*186*/	      r3.y = r6.y * r3.y + r6.x;
/*187*/	    } else {
/*188*/	      r3.y = 1.000000;
/*189*/	    }
/*190*/	  } else {
/*191*/	    r3.y = 1.000000;
/*192*/	  }
/*193*/	  r6.x = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*194*/	  r6.y = r6.x * cb2.data[34].x;
/*195*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*196*/	  r6.x = r2.w + -r6.x;
/*197*/	  r6.x = saturate(r6.x / r6.y);
/*198*/	  r3.y = -r3.w + r3.y;
/*199*/	  r3.w = r6.x * r3.y + r3.w;
/*200*/	}
/*201*/	if(floatBitsToUint(r4.w) != 0u) {
/*202*/	  r3.y = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*203*/	  r4.w = r3.y * cb2.data[34].y;
/*204*/	  r3.y = -r3.y * cb2.data[34].y + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*205*/	  r3.y = r2.w + -r3.y;
/*206*/	  r3.y = saturate(r3.y / r4.w);
/*207*/	  r3.z = -r3.w + 1.000000;
/*208*/	  r3.w = r3.y * r3.z + r3.w;
/*209*/	}
/*210*/	r3.w = saturate(r3.w);
/*211*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*212*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*213*/	r3.z = inversesqrt(r3.y);
/*214*/	r7.xyz = (r3.zzzz * r6.xyzx).xyz;
/*215*/	r3.z = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*216*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)));
/*217*/	r3.z = dot(vec3(r2.xyzx), vec3(-cb3.data[0].yzwy));
/*218*/	r9.xyz = (r3.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*219*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*220*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*221*/	r4.w = r3.z * r9.x + 0.300000;
/*222*/	r4.w = saturate(-r4.w + 1.000000);
/*223*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*224*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*225*/	r7.w = -r3.z * r9.x + 1.000000;
/*226*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*227*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*228*/	r11.xyz = (r3.zzzz * r9.xxxx + r11.xyzx).xyz;
/*229*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*230*/	r9.xyz = (-r3.zzzz + r9.xyzx).xyz;
/*231*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r3.zzzz).xyz;
/*232*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*233*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*234*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*235*/	r3.z = dot(vec3(r2.xyzx), vec3(cb3.data[0].yzwy));
/*236*/	r4.w = saturate(r3.z);
/*237*/	r4.w = r4.w * r4.w;
/*238*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*239*/	r7.w = r7.w * r7.w;
/*240*/	r7.w = r7.w * r7.w;
/*241*/	r4.w = r4.w * r7.w;
/*242*/	r4.z = r4.z * r4.w;
/*243*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*244*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*245*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*246*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*247*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*248*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*249*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*250*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*251*/	r9.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*252*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*253*/	r7.w = inversesqrt(r7.w);
/*254*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*255*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*256*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*257*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*258*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*259*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*260*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*261*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*262*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*263*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*264*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*265*/	r7.w = r8.z * r8.x;
/*266*/	r3.x = r3.x * r3.x;
/*267*/	r3.z = r3.z + r3.z;
/*268*/	r9.xyz = (r2.xyzx * -r3.zzzz + cb3.data[0].yzwy).xyz;
/*269*/	r3.z = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*270*/	r3.z = max(r3.z, 0.000000);
/*271*/	r3.x = r3.x * 127.000000 + 1.600000;
/*272*/	r3.z = log2(r3.z);
/*273*/	r3.x = r3.z * r3.x;
/*274*/	r3.x = exp2(r3.x);
/*275*/	r3.x = min(r3.x, 1.000000);
/*276*/	r1.w = r1.w * r3.x;
/*277*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*278*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*279*/	r1.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*280*/	r3.x = r1.w + r1.w;
/*281*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r7.xyzx).xyz;
/*282*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*283*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*284*/	r3.x = inversesqrt(r3.x);
/*285*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*286*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*287*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*288*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*289*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*290*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*291*/	r11.xyz = (r11.xyzx * r2.yyyy).xyz;
/*292*/	r10.xyz = (r2.xxxx * r10.xyzx + r11.xyzx).xyz;
/*293*/	r2.xyz = (r2.zzzz * r7.xyzx + r10.xyzx).xyz;
/*294*/	r1.w = saturate(-r1.w + 1.000000);
/*295*/	r1.w = r1.w * r1.w;
/*296*/	r1.w = r4.x * r1.w;
/*297*/	r1.w = r1.w * 1.500000;
/*298*/	r1.w = r8.w * r1.w;
/*299*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*300*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*301*/	r0.w = inversesqrt(r0.w);
/*302*/	r0.w = r0.w * r1.y;
/*303*/	r0.w = max(r0.w, 0.000000);
/*304*/	r0.w = r0.w * r1.w;
/*305*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*306*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*307*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*308*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*309*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*310*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*311*/	r1.xy = (r1.xyxx / r2.wwww).xy;
/*312*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*313*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*314*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*315*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*316*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*317*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*318*/	if(r0.w != 0) discard;
/*319*/	r0.w = sqrt(r3.y);
/*320*/	r1.x = saturate(cb4.data[0].w)/**/;
/*321*/	r1.x = -r1.x + 1.000000;
/*322*/	r1.x = r1.x * 8.000000 + -4.000000;
/*323*/	r1.y = saturate(cb4.data[1].x)/**/;
/*324*/	r1.y = -r1.y + 1.000000;
/*325*/	r1.y = r1.y * 1000.000000;
/*326*/	r0.w = r0.w / r1.y;
/*327*/	r0.w = r0.w + r1.x;
/*328*/	r0.w = r0.w * 1.442695;
/*329*/	r0.w = exp2(r0.w);
/*330*/	r0.w = cb4.data[1].y / r0.w;
/*331*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*332*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*333*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*334*/	r1.x = r1.x + -cb4.data[1].z;
/*335*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*336*/	r1.x = saturate(r1.y * r1.x);
/*337*/	r1.y = r1.x * -2.000000 + 3.000000;
/*338*/	r1.x = r1.x * r1.x;
/*339*/	r1.x = r1.x * r1.y;
/*340*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*341*/	r1.y = sqrt(r1.y);
/*342*/	r1.z = max(cb4.data[2].z, 0.001000);
/*343*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*344*/	r1.y = r1.z * r1.y;
/*345*/	r1.y = min(r1.y, 1.000000);
/*346*/	r1.z = r1.y * -2.000000 + 3.000000;
/*347*/	r1.y = r1.y * r1.y;
/*348*/	r1.y = r1.y * r1.z;
/*349*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*350*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*351*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*352*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*353*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*354*/	r6.w = max(r6.y, 0.000000);
/*355*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*356*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*357*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*358*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*359*/	r0.w = saturate(r0.w * r1.y);
/*360*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*361*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*362*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*363*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*364*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*365*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*366*/	color0.w = 1.000000;
/*367*/	return;
}
