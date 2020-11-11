//
//
// Shader Model 4
// Fragment Shader
//
// id: 5927 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weighted.hlsl_PS_ps30_skin_forward_lighting_gamma_correct_LDR.glsl
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb5.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb5.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb5.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r0.w = sqrt(r0.w);
/*18*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*20*/	r1.z = inversesqrt(r1.z);
/*21*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*22*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*23*/	r1.z = inversesqrt(r1.z);
/*24*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*25*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*26*/	r1.z = inversesqrt(r1.z);
/*27*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*28*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*29*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*30*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*31*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*32*/	r0.w = inversesqrt(r0.w);
/*33*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*34*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*35*/	r1.w = -vsOut_T4.z + 1.000000;
/*36*/	r5.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*37*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*38*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*39*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*40*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*41*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*42*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*43*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*44*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*45*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*46*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*47*/	r5.w = 1.000000;
/*48*/	r2.y = dot(r5.xyzw, cb1.data[12].xyzw);
/*49*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*50*/	r7.x = uintBitsToFloat((r2.y >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*51*/	r7.y = uintBitsToFloat((r2.y >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*52*/	r7.z = uintBitsToFloat((r2.y >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*53*/	r7.w = uintBitsToFloat((r2.y >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*54*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*55*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*56*/	r2.w = intBitsToFloat(int(r2.z));
/*57*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*58*/	if(floatBitsToUint(r3.w) != 0u) {
/*59*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*60*/	  r6.w = vsOut_T0.w;
/*61*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*62*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*63*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*64*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*65*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*66*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*67*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*68*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*69*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*70*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*71*/	  if(floatBitsToUint(r4.w) == 0u) {
/*72*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*73*/	    r8.xy = floor((r7.xyxx).xy);
/*74*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*75*/	    r3.w = -0.000400 / r3.w;
/*76*/	    r3.w = r3.w + r7.z;
/*77*/	    r9.z = -r9.y + 1.000000;
/*78*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*79*/	    r9.w = -r9.y;
/*80*/	    r11.x = cb2.data[0].z/**/;
/*81*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*82*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*83*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*84*/	    r11.w = -cb2.data[0].w/**/;
/*85*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*86*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*87*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*88*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*89*/	    r9.x = r10.x;
/*90*/	    r9.y = r12.x;
/*91*/	    r9.z = r11.x;
/*92*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*93*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*94*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*95*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*96*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*97*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*98*/	    r3.w = -r7.x + r7.z;
/*99*/	    r3.w = r7.y * r3.w + r7.x;
/*100*/	  } else {
/*101*/	    r3.w = 1.000000;
/*102*/	  }
/*103*/	} else {
/*104*/	  r3.w = 1.000000;
/*105*/	}
/*106*/	r4.w = cb2.data[34].w + -1.000000;
/*107*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*108*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*109*/	if(floatBitsToUint(r2.z) == 0u) {
/*110*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*111*/	  r2.z = floatBitsToInt(r2.z);
/*112*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*113*/	  if(floatBitsToUint(r2.z) != 0u) {
/*114*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*115*/	    r6.w = vsOut_T0.w;
/*116*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*117*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*118*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*119*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*120*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*121*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*122*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*123*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*124*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*125*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*126*/	    if(floatBitsToUint(r6.w) == 0u) {
/*127*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*128*/	      r7.xy = floor((r6.xyxx).xy);
/*129*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*130*/	      r2.z = -0.000400 / r2.z;
/*131*/	      r2.z = r2.z + r6.z;
/*132*/	      r8.z = -r8.y + 1.000000;
/*133*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*134*/	      r8.w = -r8.y;
/*135*/	      r10.x = cb2.data[0].z/**/;
/*136*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*137*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*138*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*139*/	      r10.w = -cb2.data[0].w/**/;
/*140*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*141*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*142*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*143*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*144*/	      r8.x = r9.x;
/*145*/	      r8.y = r11.x;
/*146*/	      r8.z = r10.x;
/*147*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*148*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*149*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*150*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*151*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*152*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*153*/	      r2.z = -r6.x + r6.z;
/*154*/	      r2.z = r6.y * r2.z + r6.x;
/*155*/	    } else {
/*156*/	      r2.z = 1.000000;
/*157*/	    }
/*158*/	  } else {
/*159*/	    r2.z = 1.000000;
/*160*/	  }
/*161*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*162*/	  r6.y = r6.x * cb2.data[34].x;
/*163*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*164*/	  r6.x = r2.y + -r6.x;
/*165*/	  r6.x = saturate(r6.x / r6.y);
/*166*/	  r2.z = -r3.w + r2.z;
/*167*/	  r3.w = r6.x * r2.z + r3.w;
/*168*/	}
/*169*/	if(floatBitsToUint(r4.w) != 0u) {
/*170*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*171*/	  r4.w = r2.z * cb2.data[34].y;
/*172*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*173*/	  r2.z = -r2.z + r2.y;
/*174*/	  r2.z = saturate(r2.z / r4.w);
/*175*/	  r2.w = -r3.w + 1.000000;
/*176*/	  r3.w = r2.z * r2.w + r3.w;
/*177*/	}
/*178*/	r3.w = saturate(r3.w);
/*179*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*180*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*181*/	r2.w = inversesqrt(r2.z);
/*182*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*183*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*184*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*185*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*186*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*187*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*188*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*189*/	r4.w = r2.w * r9.x + 0.300000;
/*190*/	r4.w = saturate(-r4.w + 1.000000);
/*191*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*192*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*193*/	r7.w = -r2.w * r9.x + 1.000000;
/*194*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*195*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*196*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*197*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*198*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*199*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*200*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*201*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*202*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*203*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*204*/	r4.w = saturate(r2.w);
/*205*/	r4.w = r4.w * r4.w;
/*206*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*207*/	r7.w = r7.w * r7.w;
/*208*/	r7.w = r7.w * r7.w;
/*209*/	r4.w = r4.w * r7.w;
/*210*/	r4.z = r4.z * r4.w;
/*211*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*212*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*213*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*214*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*215*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*216*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*217*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*218*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*219*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*220*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*221*/	r7.w = inversesqrt(r7.w);
/*222*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*223*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*224*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*225*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*226*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*227*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*228*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*229*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*230*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*231*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*232*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*233*/	r7.w = r8.z * r8.x;
/*234*/	r2.x = r2.x * r2.x;
/*235*/	r2.w = r2.w + r2.w;
/*236*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*237*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*238*/	r2.w = max(r2.w, 0.000000);
/*239*/	r2.x = r2.x * 127.000000 + 1.600000;
/*240*/	r2.w = log2(r2.w);
/*241*/	r2.x = r2.w * r2.x;
/*242*/	r2.x = exp2(r2.x);
/*243*/	r2.x = min(r2.x, 1.000000);
/*244*/	r1.w = r1.w * r2.x;
/*245*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*246*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*247*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*248*/	r2.x = r1.w + r1.w;
/*249*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r7.xyzx).xyz;
/*250*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*251*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*252*/	r2.x = inversesqrt(r2.x);
/*253*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*254*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*255*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*256*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*257*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*258*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*259*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*260*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*261*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*262*/	r1.w = saturate(-r1.w + 1.000000);
/*263*/	r1.w = r1.w * r1.w;
/*264*/	r1.w = r4.x * r1.w;
/*265*/	r1.w = r1.w * 1.500000;
/*266*/	r1.w = r8.w * r1.w;
/*267*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*268*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*269*/	r0.w = inversesqrt(r0.w);
/*270*/	r0.w = r0.w * r1.y;
/*271*/	r0.w = max(r0.w, 0.000000);
/*272*/	r0.w = r0.w * r1.w;
/*273*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*274*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*275*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*276*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*277*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*278*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*279*/	r1.xy = (r1.xyxx / r2.yyyy).xy;
/*280*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*281*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*282*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*283*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*284*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*285*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*286*/	if(r0.w != 0) discard;
/*287*/	r0.w = sqrt(r2.z);
/*288*/	r1.x = saturate(cb4.data[0].w)/**/;
/*289*/	r1.x = -r1.x + 1.000000;
/*290*/	r1.x = r1.x * 8.000000 + -4.000000;
/*291*/	r1.y = saturate(cb4.data[1].x)/**/;
/*292*/	r1.y = -r1.y + 1.000000;
/*293*/	r1.y = r1.y * 1000.000000;
/*294*/	r0.w = r0.w / r1.y;
/*295*/	r0.w = r0.w + r1.x;
/*296*/	r0.w = r0.w * 1.442695;
/*297*/	r0.w = exp2(r0.w);
/*298*/	r0.w = cb4.data[1].y / r0.w;
/*299*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*300*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*301*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*302*/	r1.x = r1.x + -cb4.data[1].z;
/*303*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*304*/	r1.x = saturate(r1.y * r1.x);
/*305*/	r1.y = r1.x * -2.000000 + 3.000000;
/*306*/	r1.x = r1.x * r1.x;
/*307*/	r1.x = r1.x * r1.y;
/*308*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*309*/	r1.y = sqrt(r1.y);
/*310*/	r1.z = max(cb4.data[2].z, 0.001000);
/*311*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*312*/	r1.y = r1.z * r1.y;
/*313*/	r1.y = min(r1.y, 1.000000);
/*314*/	r1.z = r1.y * -2.000000 + 3.000000;
/*315*/	r1.y = r1.y * r1.y;
/*316*/	r1.y = r1.y * r1.z;
/*317*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*318*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*319*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*320*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*321*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*322*/	r6.w = max(r6.y, 0.000000);
/*323*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*324*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*325*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*326*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*327*/	r0.w = saturate(r0.w * r1.y);
/*328*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*329*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*330*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*331*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*332*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*333*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*334*/	color0.w = 1.000000;
/*335*/	return;
}
