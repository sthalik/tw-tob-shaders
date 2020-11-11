//
//
// Shader Model 4
// Fragment Shader
//
// id: 6351 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*15*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*17*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*18*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*19*/	r0.w = r3.w * r4.w;
/*20*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*21*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*22*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*23*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*26*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*27*/	if(r0.w != 0) discard;
/*28*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*29*/	r2.xy = (r2.xyxx * cb5.data[2].xyxx + vsOut_T6.xyxx).xy;
/*30*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*31*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*32*/	r0.w = saturate(-r0.w + r2.w);
/*33*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*34*/	if(floatBitsToUint(r0.w) != 0u) {
/*35*/	  r0.w = -r2.w + 1.000000;
/*36*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*37*/	  r0.w = -r0.w + 1.000000;
/*38*/	  r0.w = -r0.w * r0.w + 1.000000;
/*39*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*40*/	  r2.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*41*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*42*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*43*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*44*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*45*/	  r0.xyz = (r0.wwww * r3.xyzx + r2.xyzx).xyz;
/*46*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*47*/	} else {
/*48*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*49*/	}
/*50*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*53*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*54*/	r0.w = inversesqrt(r0.w);
/*55*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*56*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*59*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*60*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*61*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*62*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*63*/	r0.w = inversesqrt(r0.w);
/*64*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*65*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*66*/	r1.w = -vsOut_T4.z + 1.000000;
/*67*/	r5.xyz = (vsOut_T4.zzzz * cb6.data[3].xyzx).xyz;
/*68*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*69*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*70*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*71*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*72*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*73*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*75*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*76*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*77*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*78*/	r5.w = 1.000000;
/*79*/	r2.y = dot(r5.xyzw, cb1.data[12].xyzw);
/*80*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*81*/	r7.x = uintBitsToFloat((r2.y >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*82*/	r7.y = uintBitsToFloat((r2.y >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r7.z = uintBitsToFloat((r2.y >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*84*/	r7.w = uintBitsToFloat((r2.y >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*85*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*86*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*87*/	r2.w = intBitsToFloat(int(r2.z));
/*88*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*89*/	if(floatBitsToUint(r3.w) != 0u) {
/*90*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*91*/	  r6.w = vsOut_T0.w;
/*92*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*93*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*94*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*95*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*96*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*97*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*98*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*99*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*100*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*101*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*102*/	  if(floatBitsToUint(r4.w) == 0u) {
/*103*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*104*/	    r8.xy = floor((r7.xyxx).xy);
/*105*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*106*/	    r3.w = -0.000400 / r3.w;
/*107*/	    r3.w = r3.w + r7.z;
/*108*/	    r9.z = -r9.y + 1.000000;
/*109*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*110*/	    r9.w = -r9.y;
/*111*/	    r11.x = cb2.data[0].z/**/;
/*112*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*113*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*114*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*115*/	    r11.w = -cb2.data[0].w/**/;
/*116*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*117*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*118*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*119*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*120*/	    r9.x = r10.x;
/*121*/	    r9.y = r12.x;
/*122*/	    r9.z = r11.x;
/*123*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*124*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*125*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*126*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*127*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*128*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*129*/	    r3.w = -r7.x + r7.z;
/*130*/	    r3.w = r7.y * r3.w + r7.x;
/*131*/	  } else {
/*132*/	    r3.w = 1.000000;
/*133*/	  }
/*134*/	} else {
/*135*/	  r3.w = 1.000000;
/*136*/	}
/*137*/	r4.w = cb2.data[34].w + -1.000000;
/*138*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*139*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*140*/	if(floatBitsToUint(r2.z) == 0u) {
/*141*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*142*/	  r2.z = floatBitsToInt(r2.z);
/*143*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*144*/	  if(floatBitsToUint(r2.z) != 0u) {
/*145*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*146*/	    r6.w = vsOut_T0.w;
/*147*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*148*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*149*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*150*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*151*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*152*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*153*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*154*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*155*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*156*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*157*/	    if(floatBitsToUint(r6.w) == 0u) {
/*158*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*159*/	      r7.xy = floor((r6.xyxx).xy);
/*160*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*161*/	      r2.z = -0.000400 / r2.z;
/*162*/	      r2.z = r2.z + r6.z;
/*163*/	      r8.z = -r8.y + 1.000000;
/*164*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*165*/	      r8.w = -r8.y;
/*166*/	      r10.x = cb2.data[0].z/**/;
/*167*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*168*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*169*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*170*/	      r10.w = -cb2.data[0].w/**/;
/*171*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*172*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*173*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*174*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*175*/	      r8.x = r9.x;
/*176*/	      r8.y = r11.x;
/*177*/	      r8.z = r10.x;
/*178*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*179*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*180*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*181*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*182*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*183*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*184*/	      r2.z = -r6.x + r6.z;
/*185*/	      r2.z = r6.y * r2.z + r6.x;
/*186*/	    } else {
/*187*/	      r2.z = 1.000000;
/*188*/	    }
/*189*/	  } else {
/*190*/	    r2.z = 1.000000;
/*191*/	  }
/*192*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*193*/	  r6.y = r6.x * cb2.data[34].x;
/*194*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*195*/	  r6.x = r2.y + -r6.x;
/*196*/	  r6.x = saturate(r6.x / r6.y);
/*197*/	  r2.z = -r3.w + r2.z;
/*198*/	  r3.w = r6.x * r2.z + r3.w;
/*199*/	}
/*200*/	if(floatBitsToUint(r4.w) != 0u) {
/*201*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*202*/	  r4.w = r2.z * cb2.data[34].y;
/*203*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*204*/	  r2.z = -r2.z + r2.y;
/*205*/	  r2.z = saturate(r2.z / r4.w);
/*206*/	  r2.w = -r3.w + 1.000000;
/*207*/	  r3.w = r2.z * r2.w + r3.w;
/*208*/	}
/*209*/	r3.w = saturate(r3.w);
/*210*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*211*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*212*/	r2.w = inversesqrt(r2.z);
/*213*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*214*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*215*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*216*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*217*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*218*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*219*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*220*/	r4.w = r2.w * r9.x + 0.300000;
/*221*/	r4.w = saturate(-r4.w + 1.000000);
/*222*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*223*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*224*/	r7.w = -r2.w * r9.x + 1.000000;
/*225*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*226*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*227*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*228*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*229*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*230*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*231*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*232*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*233*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*234*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*235*/	r4.w = saturate(r2.w);
/*236*/	r4.w = r4.w * r4.w;
/*237*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*238*/	r7.w = r7.w * r7.w;
/*239*/	r7.w = r7.w * r7.w;
/*240*/	r4.w = r4.w * r7.w;
/*241*/	r4.z = r4.z * r4.w;
/*242*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*243*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*244*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*245*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*246*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*247*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*248*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*249*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*250*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*251*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*252*/	r7.w = inversesqrt(r7.w);
/*253*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*254*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*255*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*256*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*257*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*258*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*259*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*260*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*261*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*262*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*263*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*264*/	r7.w = r8.z * r8.x;
/*265*/	r2.x = r2.x * r2.x;
/*266*/	r2.w = r2.w + r2.w;
/*267*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*268*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*269*/	r2.w = max(r2.w, 0.000000);
/*270*/	r2.x = r2.x * 127.000000 + 1.600000;
/*271*/	r2.w = log2(r2.w);
/*272*/	r2.x = r2.w * r2.x;
/*273*/	r2.x = exp2(r2.x);
/*274*/	r2.x = min(r2.x, 1.000000);
/*275*/	r1.w = r1.w * r2.x;
/*276*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*277*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*278*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*279*/	r2.x = r1.w + r1.w;
/*280*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r7.xyzx).xyz;
/*281*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*282*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*283*/	r2.x = inversesqrt(r2.x);
/*284*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*285*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*286*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*287*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*288*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*289*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*290*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*291*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*292*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*293*/	r1.w = saturate(-r1.w + 1.000000);
/*294*/	r1.w = r1.w * r1.w;
/*295*/	r1.w = r4.x * r1.w;
/*296*/	r1.w = r1.w * 1.500000;
/*297*/	r1.w = r8.w * r1.w;
/*298*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*299*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*300*/	r0.w = inversesqrt(r0.w);
/*301*/	r0.w = r0.w * r1.y;
/*302*/	r0.w = max(r0.w, 0.000000);
/*303*/	r0.w = r0.w * r1.w;
/*304*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*305*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*306*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*307*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*308*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*309*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*310*/	r1.xy = (r1.xyxx / r2.yyyy).xy;
/*311*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*312*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*313*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*314*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*315*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*316*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*317*/	if(r0.w != 0) discard;
/*318*/	r0.w = sqrt(r2.z);
/*319*/	r1.x = saturate(cb4.data[0].w)/**/;
/*320*/	r1.x = -r1.x + 1.000000;
/*321*/	r1.x = r1.x * 8.000000 + -4.000000;
/*322*/	r1.y = saturate(cb4.data[1].x)/**/;
/*323*/	r1.y = -r1.y + 1.000000;
/*324*/	r1.y = r1.y * 1000.000000;
/*325*/	r0.w = r0.w / r1.y;
/*326*/	r0.w = r0.w + r1.x;
/*327*/	r0.w = r0.w * 1.442695;
/*328*/	r0.w = exp2(r0.w);
/*329*/	r0.w = cb4.data[1].y / r0.w;
/*330*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*331*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*332*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*333*/	r1.x = r1.x + -cb4.data[1].z;
/*334*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*335*/	r1.x = saturate(r1.y * r1.x);
/*336*/	r1.y = r1.x * -2.000000 + 3.000000;
/*337*/	r1.x = r1.x * r1.x;
/*338*/	r1.x = r1.x * r1.y;
/*339*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*340*/	r1.y = sqrt(r1.y);
/*341*/	r1.z = max(cb4.data[2].z, 0.001000);
/*342*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*343*/	r1.y = r1.z * r1.y;
/*344*/	r1.y = min(r1.y, 1.000000);
/*345*/	r1.z = r1.y * -2.000000 + 3.000000;
/*346*/	r1.y = r1.y * r1.y;
/*347*/	r1.y = r1.y * r1.z;
/*348*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*349*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*350*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*351*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*352*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*353*/	r6.w = max(r6.y, 0.000000);
/*354*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*355*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*356*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*357*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*358*/	r0.w = saturate(r0.w * r1.y);
/*359*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*360*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*361*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*362*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*363*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*364*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*365*/	color0.w = 1.000000;
/*366*/	return;
}
