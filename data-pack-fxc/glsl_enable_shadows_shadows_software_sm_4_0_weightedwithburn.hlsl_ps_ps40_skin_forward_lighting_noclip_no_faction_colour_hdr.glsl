//
//
// Shader Model 4
// Fragment Shader
//
// id: 6290 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithburn.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
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
/*7*/	r0.w = sqrt(r0.w);
/*8*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*10*/	r3.x = r1.z;
/*11*/	r3.y = cb0.data[26].x * 0.050000 + r1.w;
/*12*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*13*/	r4.xyzw = (texture(s_fire_map, r1.zwzz.st)).xyzw;
/*14*/	r1.z = saturate(r3.x * 5.000000);
/*15*/	r3.xyz = (r1.zzzz * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*16*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*17*/	r1.z = saturate(-r1.z * 15.000000 + 1.000000);
/*18*/	r1.w = log2(r4.z);
/*19*/	r1.w = r1.w * 1.800000;
/*20*/	r1.w = exp2(r1.w);
/*21*/	r1.w = r1.w * 10.000000;
/*22*/	r1.w = min(r1.w, 1.000000);
/*23*/	r1.z = r1.w + r1.z;
/*24*/	r1.z = r1.z * 0.500000;
/*25*/	r1.w = -r4.w + 1.000000;
/*26*/	r1.w = log2(r1.w);
/*27*/	r1.w = r1.w * vsOut_T7.z;
/*28*/	r1.w = exp2(r1.w);
/*29*/	r1.w = min(r1.w, 1.000000);
/*30*/	r1.w = r1.w * vsOut_T7.z;
/*31*/	r2.z = r4.z * 0.250000;
/*32*/	r3.xyz = (r3.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.zzzz).xyz;
/*33*/	r3.xyz = (r1.zzzz * r3.xyzx + r2.zzzz).xyz;
/*34*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*35*/	r0.xyz = (r1.wwww * r3.xyzx + r0.xyzx).xyz;
/*36*/	r1.z = vsOut_T7.z + -0.025000;
/*37*/	r1.z = max(r1.z, 0.000000);
/*38*/	r3.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r1.zzzz * r3.xyzx + r0.xyzx).xyz;
/*40*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*41*/	r1.z = inversesqrt(r1.z);
/*42*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*43*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*44*/	r1.z = inversesqrt(r1.z);
/*45*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*46*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*47*/	r1.z = inversesqrt(r1.z);
/*48*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*49*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*50*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*51*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*52*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*53*/	r0.w = inversesqrt(r0.w);
/*54*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*55*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*56*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*57*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*58*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*59*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*60*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*62*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*63*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*64*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*65*/	r5.w = 1.000000;
/*66*/	r2.y = dot(r5.xyzw, cb0.data[12].xyzw);
/*67*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*68*/	r7.x = uintBitsToFloat((r2.y >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*69*/	r7.y = uintBitsToFloat((r2.y >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*70*/	r7.z = uintBitsToFloat((r2.y >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*71*/	r7.w = uintBitsToFloat((r2.y >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*73*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*74*/	r2.w = intBitsToFloat(int(r2.z));
/*75*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r3.w) != 0u) {
/*77*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*78*/	  r6.w = vsOut_T0.w;
/*79*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*80*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*81*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*82*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*83*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*84*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*85*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*86*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*87*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*88*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*89*/	  if(floatBitsToUint(r4.w) == 0u) {
/*90*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*91*/	    r8.xy = floor((r7.xyxx).xy);
/*92*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*93*/	    r3.w = -0.000400 / r3.w;
/*94*/	    r3.w = r3.w + r7.z;
/*95*/	    r9.z = -r9.y + 1.000000;
/*96*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*97*/	    r9.w = -r9.y;
/*98*/	    r11.x = cb1.data[0].z/**/;
/*99*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*100*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*101*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*102*/	    r11.w = -cb1.data[0].w/**/;
/*103*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*104*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*105*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*106*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*107*/	    r9.x = r10.x;
/*108*/	    r9.y = r12.x;
/*109*/	    r9.z = r11.x;
/*110*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*111*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*112*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*113*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*114*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*115*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*116*/	    r3.w = -r7.x + r7.z;
/*117*/	    r3.w = r7.y * r3.w + r7.x;
/*118*/	  } else {
/*119*/	    r3.w = 1.000000;
/*120*/	  }
/*121*/	} else {
/*122*/	  r3.w = 1.000000;
/*123*/	}
/*124*/	r4.w = cb1.data[34].w + -1.000000;
/*125*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*126*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*127*/	if(floatBitsToUint(r2.z) == 0u) {
/*128*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*129*/	  r2.z = floatBitsToInt(r2.z);
/*130*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*131*/	  if(floatBitsToUint(r2.z) != 0u) {
/*132*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*133*/	    r6.w = vsOut_T0.w;
/*134*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*135*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*136*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*137*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*138*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*139*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*140*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*141*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*142*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*143*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*144*/	    if(floatBitsToUint(r6.w) == 0u) {
/*145*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*146*/	      r7.xy = floor((r6.xyxx).xy);
/*147*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*148*/	      r2.z = -0.000400 / r2.z;
/*149*/	      r2.z = r2.z + r6.z;
/*150*/	      r8.z = -r8.y + 1.000000;
/*151*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*152*/	      r8.w = -r8.y;
/*153*/	      r10.x = cb1.data[0].z/**/;
/*154*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*155*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*156*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*157*/	      r10.w = -cb1.data[0].w/**/;
/*158*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*159*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*160*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*161*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*162*/	      r8.x = r9.x;
/*163*/	      r8.y = r11.x;
/*164*/	      r8.z = r10.x;
/*165*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*166*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*167*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*168*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*169*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*170*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*171*/	      r2.z = -r6.x + r6.z;
/*172*/	      r2.z = r6.y * r2.z + r6.x;
/*173*/	    } else {
/*174*/	      r2.z = 1.000000;
/*175*/	    }
/*176*/	  } else {
/*177*/	    r2.z = 1.000000;
/*178*/	  }
/*179*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*180*/	  r6.y = r6.x * cb1.data[34].x;
/*181*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*182*/	  r6.x = r2.y + -r6.x;
/*183*/	  r6.x = saturate(r6.x / r6.y);
/*184*/	  r2.z = -r3.w + r2.z;
/*185*/	  r3.w = r6.x * r2.z + r3.w;
/*186*/	}
/*187*/	if(floatBitsToUint(r4.w) != 0u) {
/*188*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*189*/	  r4.w = r2.z * cb1.data[34].y;
/*190*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*191*/	  r2.z = -r2.z + r2.y;
/*192*/	  r2.z = saturate(r2.z / r4.w);
/*193*/	  r2.w = -r3.w + 1.000000;
/*194*/	  r3.w = r2.z * r2.w + r3.w;
/*195*/	}
/*196*/	r3.w = saturate(r3.w);
/*197*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*198*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*199*/	r2.z = inversesqrt(r2.z);
/*200*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*201*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*202*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*203*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*204*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*205*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*206*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*207*/	r2.w = r2.z * r8.x + 0.300000;
/*208*/	r2.w = saturate(-r2.w + 1.000000);
/*209*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*210*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*211*/	r4.w = -r2.z * r8.x + 1.000000;
/*212*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*213*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*214*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*215*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*216*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*217*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*218*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*219*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*220*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*221*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*222*/	r2.w = saturate(r2.z);
/*223*/	r2.w = r2.w * r2.w;
/*224*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*225*/	r4.w = r4.w * r4.w;
/*226*/	r4.w = r4.w * r4.w;
/*227*/	r2.w = r2.w * r4.w;
/*228*/	r2.w = r4.z * r2.w;
/*229*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*230*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*231*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*232*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*233*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*234*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*235*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*236*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*237*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*238*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*239*/	r2.w = inversesqrt(r2.w);
/*240*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*241*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*242*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*243*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*244*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*245*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*246*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*247*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*248*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*249*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*250*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*251*/	r2.w = r7.z * r7.x;
/*252*/	r2.x = r2.x * r2.x;
/*253*/	r2.z = r2.z + r2.z;
/*254*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*255*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*256*/	r2.z = max(r2.z, 0.000000);
/*257*/	r2.x = r2.x * 127.000000 + 1.600000;
/*258*/	r2.z = log2(r2.z);
/*259*/	r2.x = r2.z * r2.x;
/*260*/	r2.x = exp2(r2.x);
/*261*/	r2.x = min(r2.x, 1.000000);
/*262*/	r1.w = r1.w * r2.x;
/*263*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*264*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*265*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*266*/	r2.x = r1.w + r1.w;
/*267*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*268*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*269*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*270*/	r2.x = inversesqrt(r2.x);
/*271*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*272*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*273*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*274*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*275*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*276*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*277*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*278*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*279*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*280*/	r1.w = saturate(-r1.w + 1.000000);
/*281*/	r1.w = r1.w * r1.w;
/*282*/	r1.w = r4.x * r1.w;
/*283*/	r1.w = r1.w * 1.500000;
/*284*/	r1.w = r7.w * r1.w;
/*285*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*286*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*287*/	r0.w = inversesqrt(r0.w);
/*288*/	r0.w = r0.w * r1.y;
/*289*/	r0.w = max(r0.w, 0.000000);
/*290*/	r0.w = r0.w * r1.w;
/*291*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*292*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*293*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*294*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*295*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*296*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*297*/	r0.xy = (r0.xyxx / r2.yyyy).xy;
/*298*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*299*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*300*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*301*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*302*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*303*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*304*/	if(r0.x != 0) discard;
/*305*/	color0.w = 1.000000;
/*306*/	color1.x = 1.000000;
/*307*/	return;
}
