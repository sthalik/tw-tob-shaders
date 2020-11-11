//
//
// Shader Model 4
// Fragment Shader
//
// id: 6433 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_skin_forward_lighting_no_faction_colour_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
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
/*13*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*25*/	r4.y = cb0.data[26].x * 0.050000 + r2.y;
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
/*80*/	r2.w = dot(r5.xyzw, cb0.data[12].xyzw);
/*81*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*82*/	r7.x = uintBitsToFloat((r2.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r7.y = uintBitsToFloat((r2.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*84*/	r7.z = uintBitsToFloat((r2.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*85*/	r7.w = uintBitsToFloat((r2.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*87*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*88*/	r3.z = intBitsToFloat(int(r3.y));
/*89*/	r3.w = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*90*/	if(floatBitsToUint(r3.w) != 0u) {
/*91*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*92*/	  r6.w = vsOut_T0.w;
/*93*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*94*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*95*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*96*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*97*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*98*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*99*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*100*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*101*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*102*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*103*/	  if(floatBitsToUint(r4.w) == 0u) {
/*104*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*105*/	    r8.xy = floor((r7.xyxx).xy);
/*106*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*107*/	    r3.w = -0.000400 / r3.w;
/*108*/	    r3.w = r3.w + r7.z;
/*109*/	    r9.z = -r9.y + 1.000000;
/*110*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*111*/	    r9.w = -r9.y;
/*112*/	    r11.x = cb1.data[0].z/**/;
/*113*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*114*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*115*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*116*/	    r11.w = -cb1.data[0].w/**/;
/*117*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*118*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*119*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
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
/*138*/	r4.w = cb1.data[34].w + -1.000000;
/*139*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*140*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*141*/	if(floatBitsToUint(r3.y) == 0u) {
/*142*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*143*/	  r3.y = floatBitsToInt(r3.y);
/*144*/	  r3.y = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*145*/	  if(floatBitsToUint(r3.y) != 0u) {
/*146*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*147*/	    r6.w = vsOut_T0.w;
/*148*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+6u].xyzw);
/*149*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+7u].xyzw);
/*150*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+8u].xyzw);
/*151*/	    r3.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+9u].xyzw);
/*152*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*153*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*154*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*155*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*156*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*157*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*158*/	    if(floatBitsToUint(r6.w) == 0u) {
/*159*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*160*/	      r7.xy = floor((r6.xyxx).xy);
/*161*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*162*/	      r3.y = -0.000400 / r3.y;
/*163*/	      r3.y = r3.y + r6.z;
/*164*/	      r8.z = -r8.y + 1.000000;
/*165*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*166*/	      r8.w = -r8.y;
/*167*/	      r10.x = cb1.data[0].z/**/;
/*168*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*169*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*170*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*171*/	      r10.w = -cb1.data[0].w/**/;
/*172*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*173*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*174*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
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
/*193*/	  r6.x = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*194*/	  r6.y = r6.x * cb1.data[34].x;
/*195*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*196*/	  r6.x = r2.w + -r6.x;
/*197*/	  r6.x = saturate(r6.x / r6.y);
/*198*/	  r3.y = -r3.w + r3.y;
/*199*/	  r3.w = r6.x * r3.y + r3.w;
/*200*/	}
/*201*/	if(floatBitsToUint(r4.w) != 0u) {
/*202*/	  r3.y = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*203*/	  r4.w = r3.y * cb1.data[34].y;
/*204*/	  r3.y = -r3.y * cb1.data[34].y + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*205*/	  r3.y = r2.w + -r3.y;
/*206*/	  r3.y = saturate(r3.y / r4.w);
/*207*/	  r3.z = -r3.w + 1.000000;
/*208*/	  r3.w = r3.y * r3.z + r3.w;
/*209*/	}
/*210*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*211*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*212*/	r3.y = inversesqrt(r3.y);
/*213*/	r6.xyz = (r3.yyyy * r6.xyzx).xyz;
/*214*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*215*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*216*/	r3.y = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*217*/	r8.xyz = (r3.yyyy * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*218*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*219*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*220*/	r3.z = r3.y * r8.x + 0.300000;
/*221*/	r3.z = saturate(-r3.z + 1.000000);
/*222*/	r10.xyz = (r3.zzzz * r9.xyzx).xyz;
/*223*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*224*/	r4.w = -r3.y * r8.x + 1.000000;
/*225*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*226*/	r9.xyz = (-r9.xyzx * r3.zzzz + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*227*/	r10.xyz = (r3.yyyy * r8.xxxx + r10.xyzx).xyz;
/*228*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*229*/	r8.xyz = (-r3.yyyy + r8.xyzx).xyz;
/*230*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r3.yyyy).xyz;
/*231*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*232*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*233*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*234*/	r3.y = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*235*/	r3.zw = saturate(r3.yyyw).zw;
/*236*/	r3.z = r3.z * r3.z;
/*237*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*238*/	r4.w = r4.w * r4.w;
/*239*/	r4.w = r4.w * r4.w;
/*240*/	r3.z = r3.z * r4.w;
/*241*/	r3.z = r4.z * r3.z;
/*242*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*243*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*244*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*245*/	r4.yzw = (r3.zzzz * r4.yyzw).yzw;
/*246*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*247*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*248*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*249*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*250*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*251*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*252*/	r3.z = inversesqrt(r3.z);
/*253*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*254*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*255*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*256*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*257*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*258*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*259*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*260*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*261*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*262*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*263*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*264*/	r3.z = r7.z * r7.x;
/*265*/	r3.x = r3.x * r3.x;
/*266*/	r3.y = r3.y + r3.y;
/*267*/	r8.xyz = (r2.xyzx * -r3.yyyy + cb2.data[0].yzwy).xyz;
/*268*/	r3.y = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*269*/	r3.y = max(r3.y, 0.000000);
/*270*/	r3.x = r3.x * 127.000000 + 1.600000;
/*271*/	r3.y = log2(r3.y);
/*272*/	r3.x = r3.y * r3.x;
/*273*/	r3.x = exp2(r3.x);
/*274*/	r3.x = min(r3.x, 1.000000);
/*275*/	r1.w = r1.w * r3.x;
/*276*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*277*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*278*/	r1.w = dot(vec3(-r6.xyzx), vec3(r2.xyzx));
/*279*/	r3.x = r1.w + r1.w;
/*280*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r6.xyzx).xyz;
/*281*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*282*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*283*/	r3.x = inversesqrt(r3.x);
/*284*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*285*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*286*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*287*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*288*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*289*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*290*/	r6.xyz = (r6.xywx * r2.yyyy).xyz;
/*291*/	r6.xyz = (r2.xxxx * r8.xyzx + r6.xyzx).xyz;
/*292*/	r2.xyz = (r2.zzzz * r9.xyzx + r6.xyzx).xyz;
/*293*/	r1.w = saturate(-r1.w + 1.000000);
/*294*/	r1.w = r1.w * r1.w;
/*295*/	r1.w = r4.x * r1.w;
/*296*/	r1.w = r1.w * 1.500000;
/*297*/	r1.w = r7.w * r1.w;
/*298*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*299*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*300*/	r0.w = inversesqrt(r0.w);
/*301*/	r0.w = r0.w * r1.y;
/*302*/	r0.w = max(r0.w, 0.000000);
/*303*/	r0.w = r0.w * r1.w;
/*304*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*305*/	r0.xyz = (r0.xyzx * r3.zzzz + r1.xyzx).xyz;
/*306*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*307*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*308*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*309*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*310*/	r0.xy = (r0.xyxx / r2.wwww).xy;
/*311*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*312*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*313*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*314*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*315*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*316*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*317*/	if(r0.x != 0) discard;
/*318*/	color0.w = 1.000000;
/*319*/	color1.x = 1.000000;
/*320*/	return;
}
