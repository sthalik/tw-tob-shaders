//
//
// Shader Model 4
// Fragment Shader
//
// id: 6503 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalblood.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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
/*14*/	r1.z = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*16*/	r2.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*17*/	r3.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*18*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*19*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*20*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*21*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*23*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*24*/	r3.z = vsOut_T6.z;
/*25*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*26*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*27*/	if(floatBitsToUint(r0.w) != 0u) {
/*28*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*29*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*31*/	  r0.w = -r0.w + 1.000000;
/*32*/	  r0.w = max(r0.w, 0.000000);
/*33*/	  r3.z = sqrt(r0.w);
/*34*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*35*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*36*/	  r0.w = r2.x * r6.w;
/*37*/	  r2.x = r0.w * -0.500000 + r2.x;
/*38*/	  r0.w = -r4.w * r5.w + 1.000000;
/*39*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*40*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*41*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*42*/	}
/*43*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*44*/	if(r0.w != 0) discard;
/*45*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*46*/	r2.zw = (r2.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*47*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*48*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*49*/	r0.w = saturate(-r0.w + r3.w);
/*50*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*51*/	if(floatBitsToUint(r0.w) != 0u) {
/*52*/	  r0.w = -r3.w + 1.000000;
/*53*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*54*/	  r0.w = -r0.w + 1.000000;
/*55*/	  r0.w = -r0.w * r0.w + 1.000000;
/*56*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*57*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*58*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*59*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*60*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*61*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*62*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*63*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*64*/	}
/*65*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*66*/	r0.w = inversesqrt(r0.w);
/*67*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*68*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*69*/	r0.w = inversesqrt(r0.w);
/*70*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*71*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*72*/	r0.w = inversesqrt(r0.w);
/*73*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*74*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*75*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*76*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*77*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*78*/	r0.w = inversesqrt(r0.w);
/*79*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*80*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*81*/	r1.w = -vsOut_T4.z + 1.000000;
/*82*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*83*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*84*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*85*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*86*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*87*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*88*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*89*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*90*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*91*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*92*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*93*/	r5.w = 1.000000;
/*94*/	r2.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*95*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*96*/	r7.x = uintBitsToFloat((r2.x >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*97*/	r7.y = uintBitsToFloat((r2.x >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*98*/	r7.z = uintBitsToFloat((r2.x >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*99*/	r7.w = uintBitsToFloat((r2.x >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*100*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*101*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*102*/	r2.w = intBitsToFloat(int(r2.z));
/*103*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*104*/	if(floatBitsToUint(r3.w) != 0u) {
/*105*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*106*/	  r6.w = vsOut_T0.w;
/*107*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*108*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*109*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*110*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*111*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*112*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*113*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*114*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*115*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*116*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*117*/	  if(floatBitsToUint(r4.w) == 0u) {
/*118*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*119*/	    r8.xy = floor((r7.xyxx).xy);
/*120*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*121*/	    r3.w = -0.000400 / r3.w;
/*122*/	    r3.w = r3.w + r7.z;
/*123*/	    r9.z = -r9.y + 1.000000;
/*124*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*125*/	    r9.w = -r9.y;
/*126*/	    r11.x = cb1.data[0].z/**/;
/*127*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*128*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*129*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*130*/	    r11.w = -cb1.data[0].w/**/;
/*131*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*132*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*133*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*134*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*135*/	    r9.x = r10.x;
/*136*/	    r9.y = r12.x;
/*137*/	    r9.z = r11.x;
/*138*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*139*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*140*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*141*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*142*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*143*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*144*/	    r3.w = -r7.x + r7.z;
/*145*/	    r3.w = r7.y * r3.w + r7.x;
/*146*/	  } else {
/*147*/	    r3.w = 1.000000;
/*148*/	  }
/*149*/	} else {
/*150*/	  r3.w = 1.000000;
/*151*/	}
/*152*/	r4.w = cb1.data[34].w + -1.000000;
/*153*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*154*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*155*/	if(floatBitsToUint(r2.z) == 0u) {
/*156*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*157*/	  r2.z = floatBitsToInt(r2.z);
/*158*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*159*/	  if(floatBitsToUint(r2.z) != 0u) {
/*160*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*161*/	    r6.w = vsOut_T0.w;
/*162*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*163*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*164*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*165*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*166*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*167*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*168*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*169*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*170*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*171*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*172*/	    if(floatBitsToUint(r6.w) == 0u) {
/*173*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*174*/	      r7.xy = floor((r6.xyxx).xy);
/*175*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*176*/	      r2.z = -0.000400 / r2.z;
/*177*/	      r2.z = r2.z + r6.z;
/*178*/	      r8.z = -r8.y + 1.000000;
/*179*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*180*/	      r8.w = -r8.y;
/*181*/	      r10.x = cb1.data[0].z/**/;
/*182*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*183*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*184*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*185*/	      r10.w = -cb1.data[0].w/**/;
/*186*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*187*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*188*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*189*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*190*/	      r8.x = r9.x;
/*191*/	      r8.y = r11.x;
/*192*/	      r8.z = r10.x;
/*193*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*194*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*195*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*196*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*197*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*198*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*199*/	      r2.z = -r6.x + r6.z;
/*200*/	      r2.z = r6.y * r2.z + r6.x;
/*201*/	    } else {
/*202*/	      r2.z = 1.000000;
/*203*/	    }
/*204*/	  } else {
/*205*/	    r2.z = 1.000000;
/*206*/	  }
/*207*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*208*/	  r6.y = r6.x * cb1.data[34].x;
/*209*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*210*/	  r6.x = r2.x + -r6.x;
/*211*/	  r6.x = saturate(r6.x / r6.y);
/*212*/	  r2.z = -r3.w + r2.z;
/*213*/	  r3.w = r6.x * r2.z + r3.w;
/*214*/	}
/*215*/	if(floatBitsToUint(r4.w) != 0u) {
/*216*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*217*/	  r4.w = r2.z * cb1.data[34].y;
/*218*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*219*/	  r2.z = -r2.z + r2.x;
/*220*/	  r2.z = saturate(r2.z / r4.w);
/*221*/	  r2.w = -r3.w + 1.000000;
/*222*/	  r3.w = r2.z * r2.w + r3.w;
/*223*/	}
/*224*/	r3.w = saturate(r3.w);
/*225*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*226*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*227*/	r2.z = inversesqrt(r2.z);
/*228*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*229*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*230*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*231*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*232*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*233*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*234*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*235*/	r2.w = r2.z * r8.x + 0.300000;
/*236*/	r2.w = saturate(-r2.w + 1.000000);
/*237*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*238*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*239*/	r4.w = -r2.z * r8.x + 1.000000;
/*240*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*241*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*242*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*243*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*244*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*245*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*246*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*247*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*248*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*249*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*250*/	r2.w = saturate(r2.z);
/*251*/	r2.w = r2.w * r2.w;
/*252*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*253*/	r4.w = r4.w * r4.w;
/*254*/	r4.w = r4.w * r4.w;
/*255*/	r2.w = r2.w * r4.w;
/*256*/	r2.w = r4.z * r2.w;
/*257*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*258*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*259*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*260*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*261*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*262*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*263*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*264*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*265*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*266*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*267*/	r2.w = inversesqrt(r2.w);
/*268*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*269*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*270*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*271*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*272*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*273*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*274*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*275*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*276*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*277*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*278*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*279*/	r2.w = r7.z * r7.x;
/*280*/	r2.y = r2.y * r2.y;
/*281*/	r2.z = r2.z + r2.z;
/*282*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*283*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*284*/	r2.z = max(r2.z, 0.000000);
/*285*/	r2.y = r2.y * 127.000000 + 1.600000;
/*286*/	r2.z = log2(r2.z);
/*287*/	r2.y = r2.z * r2.y;
/*288*/	r2.y = exp2(r2.y);
/*289*/	r2.y = min(r2.y, 1.000000);
/*290*/	r1.w = r1.w * r2.y;
/*291*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*292*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*293*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*294*/	r2.y = r1.w + r1.w;
/*295*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*296*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*297*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*298*/	r2.y = inversesqrt(r2.y);
/*299*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*300*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*301*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*302*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*303*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*304*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*305*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*306*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*307*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*308*/	r1.w = saturate(-r1.w + 1.000000);
/*309*/	r1.w = r1.w * r1.w;
/*310*/	r1.w = r4.x * r1.w;
/*311*/	r1.w = r1.w * 1.500000;
/*312*/	r1.w = r7.w * r1.w;
/*313*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*314*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*315*/	r0.w = inversesqrt(r0.w);
/*316*/	r0.w = r0.w * r1.y;
/*317*/	r0.w = max(r0.w, 0.000000);
/*318*/	r0.w = r0.w * r1.w;
/*319*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*320*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*321*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*322*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*323*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*324*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*325*/	r0.xy = (r0.xyxx / r2.xxxx).xy;
/*326*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*327*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*328*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*329*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*330*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*331*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*332*/	if(r0.x != 0) discard;
/*333*/	color0.w = 1.000000;
/*334*/	color1.x = 1.000000;
/*335*/	return;
}
