//
//
// Shader Model 4
// Fragment Shader
//
// id: 6493 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_skin_forward_lighting_gamma_correct_LDR.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;

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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb6.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb6.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb6.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r1.z = sqrt(r0.w);
/*18*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*19*/	r2.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*20*/	r3.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*21*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*22*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*23*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*24*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*27*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*28*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*29*/	if(floatBitsToUint(r0.w) != 0u) {
/*30*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*31*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*33*/	  r0.w = -r0.w + 1.000000;
/*34*/	  r0.w = max(r0.w, 0.000000);
/*35*/	  r4.z = sqrt(r0.w);
/*36*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*37*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*38*/	  r0.w = r2.x * r6.w;
/*39*/	  r2.x = r0.w * -0.500000 + r2.x;
/*40*/	  r0.w = -r3.w * r5.w + 1.000000;
/*41*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*42*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*43*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*44*/	}
/*45*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*46*/	if(r0.w != 0) discard;
/*47*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*48*/	r2.zw = (r2.zzzw * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*49*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*50*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*51*/	r0.w = saturate(-r0.w + r3.w);
/*52*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*53*/	if(floatBitsToUint(r0.w) != 0u) {
/*54*/	  r0.w = -r3.w + 1.000000;
/*55*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*56*/	  r0.w = -r0.w + 1.000000;
/*57*/	  r0.w = -r0.w * r0.w + 1.000000;
/*58*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*59*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*60*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*61*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*62*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*63*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*64*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*65*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*66*/	}
/*67*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*68*/	r0.w = inversesqrt(r0.w);
/*69*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*70*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*71*/	r0.w = inversesqrt(r0.w);
/*72*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*73*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*74*/	r0.w = inversesqrt(r0.w);
/*75*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*76*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*77*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*78*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*79*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*80*/	r0.w = inversesqrt(r0.w);
/*81*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*82*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*83*/	r1.w = -vsOut_T4.z + 1.000000;
/*84*/	r5.xyz = (vsOut_T4.zzzz * cb6.data[3].xyzx).xyz;
/*85*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*86*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*87*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*88*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*89*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*90*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*91*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*92*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*93*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*94*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*95*/	r5.w = 1.000000;
/*96*/	r2.x = dot(r5.xyzw, cb1.data[12].xyzw);
/*97*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*98*/	r7.x = uintBitsToFloat((r2.x >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*99*/	r7.y = uintBitsToFloat((r2.x >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*100*/	r7.z = uintBitsToFloat((r2.x >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*101*/	r7.w = uintBitsToFloat((r2.x >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*102*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*103*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*104*/	r2.w = intBitsToFloat(int(r2.z));
/*105*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r3.w) != 0u) {
/*107*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*108*/	  r6.w = vsOut_T0.w;
/*109*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*110*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*111*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*112*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*113*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*114*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*115*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*116*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*117*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*118*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*119*/	  if(floatBitsToUint(r4.w) == 0u) {
/*120*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*121*/	    r8.xy = floor((r7.xyxx).xy);
/*122*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*123*/	    r3.w = -0.000400 / r3.w;
/*124*/	    r3.w = r3.w + r7.z;
/*125*/	    r9.z = -r9.y + 1.000000;
/*126*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*127*/	    r9.w = -r9.y;
/*128*/	    r11.x = cb2.data[0].z/**/;
/*129*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*130*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*131*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*132*/	    r11.w = -cb2.data[0].w/**/;
/*133*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*134*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*135*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*136*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*137*/	    r9.x = r10.x;
/*138*/	    r9.y = r12.x;
/*139*/	    r9.z = r11.x;
/*140*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*141*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*142*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*143*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*144*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*145*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*146*/	    r3.w = -r7.x + r7.z;
/*147*/	    r3.w = r7.y * r3.w + r7.x;
/*148*/	  } else {
/*149*/	    r3.w = 1.000000;
/*150*/	  }
/*151*/	} else {
/*152*/	  r3.w = 1.000000;
/*153*/	}
/*154*/	r4.w = cb2.data[34].w + -1.000000;
/*155*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*156*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*157*/	if(floatBitsToUint(r2.z) == 0u) {
/*158*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*159*/	  r2.z = floatBitsToInt(r2.z);
/*160*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*161*/	  if(floatBitsToUint(r2.z) != 0u) {
/*162*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*163*/	    r6.w = vsOut_T0.w;
/*164*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*165*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*166*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*167*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*168*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*169*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*170*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*171*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*172*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*173*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*174*/	    if(floatBitsToUint(r6.w) == 0u) {
/*175*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*176*/	      r7.xy = floor((r6.xyxx).xy);
/*177*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*178*/	      r2.z = -0.000400 / r2.z;
/*179*/	      r2.z = r2.z + r6.z;
/*180*/	      r8.z = -r8.y + 1.000000;
/*181*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*182*/	      r8.w = -r8.y;
/*183*/	      r10.x = cb2.data[0].z/**/;
/*184*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*185*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*186*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*187*/	      r10.w = -cb2.data[0].w/**/;
/*188*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*189*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*190*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*191*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*192*/	      r8.x = r9.x;
/*193*/	      r8.y = r11.x;
/*194*/	      r8.z = r10.x;
/*195*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*196*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*197*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*198*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*199*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*200*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*201*/	      r2.z = -r6.x + r6.z;
/*202*/	      r2.z = r6.y * r2.z + r6.x;
/*203*/	    } else {
/*204*/	      r2.z = 1.000000;
/*205*/	    }
/*206*/	  } else {
/*207*/	    r2.z = 1.000000;
/*208*/	  }
/*209*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*210*/	  r6.y = r6.x * cb2.data[34].x;
/*211*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*212*/	  r6.x = r2.x + -r6.x;
/*213*/	  r6.x = saturate(r6.x / r6.y);
/*214*/	  r2.z = -r3.w + r2.z;
/*215*/	  r3.w = r6.x * r2.z + r3.w;
/*216*/	}
/*217*/	if(floatBitsToUint(r4.w) != 0u) {
/*218*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*219*/	  r4.w = r2.z * cb2.data[34].y;
/*220*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*221*/	  r2.z = -r2.z + r2.x;
/*222*/	  r2.z = saturate(r2.z / r4.w);
/*223*/	  r2.w = -r3.w + 1.000000;
/*224*/	  r3.w = r2.z * r2.w + r3.w;
/*225*/	}
/*226*/	r3.w = saturate(r3.w);
/*227*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*228*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*229*/	r2.w = inversesqrt(r2.z);
/*230*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*231*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*232*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*233*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*234*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*235*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*236*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*237*/	r4.w = r2.w * r9.x + 0.300000;
/*238*/	r4.w = saturate(-r4.w + 1.000000);
/*239*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*240*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*241*/	r7.w = -r2.w * r9.x + 1.000000;
/*242*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*243*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*244*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*245*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*246*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*247*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*248*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*249*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*250*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*251*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*252*/	r4.w = saturate(r2.w);
/*253*/	r4.w = r4.w * r4.w;
/*254*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*255*/	r7.w = r7.w * r7.w;
/*256*/	r7.w = r7.w * r7.w;
/*257*/	r4.w = r4.w * r7.w;
/*258*/	r4.z = r4.z * r4.w;
/*259*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*260*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*261*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*262*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*263*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*264*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*265*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*266*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*267*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*268*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*269*/	r7.w = inversesqrt(r7.w);
/*270*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*271*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*272*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*273*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*274*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*275*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*276*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*277*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*278*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*279*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*280*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*281*/	r7.w = r8.z * r8.x;
/*282*/	r2.y = r2.y * r2.y;
/*283*/	r2.w = r2.w + r2.w;
/*284*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*285*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*286*/	r2.w = max(r2.w, 0.000000);
/*287*/	r2.y = r2.y * 127.000000 + 1.600000;
/*288*/	r2.w = log2(r2.w);
/*289*/	r2.y = r2.w * r2.y;
/*290*/	r2.y = exp2(r2.y);
/*291*/	r2.y = min(r2.y, 1.000000);
/*292*/	r1.w = r1.w * r2.y;
/*293*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*294*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*295*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*296*/	r2.y = r1.w + r1.w;
/*297*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r7.xyzx).xyz;
/*298*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*299*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*300*/	r2.y = inversesqrt(r2.y);
/*301*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*302*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*303*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*304*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*305*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*306*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*307*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*308*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*309*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*310*/	r1.w = saturate(-r1.w + 1.000000);
/*311*/	r1.w = r1.w * r1.w;
/*312*/	r1.w = r4.x * r1.w;
/*313*/	r1.w = r1.w * 1.500000;
/*314*/	r1.w = r8.w * r1.w;
/*315*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*316*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*317*/	r0.w = inversesqrt(r0.w);
/*318*/	r0.w = r0.w * r1.y;
/*319*/	r0.w = max(r0.w, 0.000000);
/*320*/	r0.w = r0.w * r1.w;
/*321*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*322*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*323*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*324*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*325*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*326*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*327*/	r1.xy = (r1.xyxx / r2.xxxx).xy;
/*328*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*329*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*330*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*331*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*332*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*333*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*334*/	if(r0.w != 0) discard;
/*335*/	r0.w = sqrt(r2.z);
/*336*/	r1.x = saturate(cb4.data[0].w)/**/;
/*337*/	r1.x = -r1.x + 1.000000;
/*338*/	r1.x = r1.x * 8.000000 + -4.000000;
/*339*/	r1.y = saturate(cb4.data[1].x)/**/;
/*340*/	r1.y = -r1.y + 1.000000;
/*341*/	r1.y = r1.y * 1000.000000;
/*342*/	r0.w = r0.w / r1.y;
/*343*/	r0.w = r0.w + r1.x;
/*344*/	r0.w = r0.w * 1.442695;
/*345*/	r0.w = exp2(r0.w);
/*346*/	r0.w = cb4.data[1].y / r0.w;
/*347*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*348*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*349*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*350*/	r1.x = r1.x + -cb4.data[1].z;
/*351*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*352*/	r1.x = saturate(r1.y * r1.x);
/*353*/	r1.y = r1.x * -2.000000 + 3.000000;
/*354*/	r1.x = r1.x * r1.x;
/*355*/	r1.x = r1.x * r1.y;
/*356*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*357*/	r1.y = sqrt(r1.y);
/*358*/	r1.z = max(cb4.data[2].z, 0.001000);
/*359*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*360*/	r1.y = r1.z * r1.y;
/*361*/	r1.y = min(r1.y, 1.000000);
/*362*/	r1.z = r1.y * -2.000000 + 3.000000;
/*363*/	r1.y = r1.y * r1.y;
/*364*/	r1.y = r1.y * r1.z;
/*365*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*366*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*367*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*368*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*369*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*370*/	r6.w = max(r6.y, 0.000000);
/*371*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*372*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*373*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*374*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*375*/	r0.w = saturate(r0.w * r1.y);
/*376*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*377*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*378*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*379*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*380*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*381*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*382*/	color0.w = 1.000000;
/*383*/	return;
}
