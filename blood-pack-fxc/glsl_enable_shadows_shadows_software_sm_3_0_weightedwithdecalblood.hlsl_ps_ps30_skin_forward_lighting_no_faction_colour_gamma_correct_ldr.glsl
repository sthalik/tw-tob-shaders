//
//
// Shader Model 4
// Fragment Shader
//
// id: 6497 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_skin_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*10*/	r1.z = sqrt(r0.w);
/*11*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*12*/	r2.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*13*/	r3.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*14*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*15*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*16*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*20*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*21*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*22*/	if(floatBitsToUint(r0.w) != 0u) {
/*23*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*24*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*26*/	  r0.w = -r0.w + 1.000000;
/*27*/	  r0.w = max(r0.w, 0.000000);
/*28*/	  r4.z = sqrt(r0.w);
/*29*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*31*/	  r0.w = r2.x * r6.w;
/*32*/	  r2.x = r0.w * -0.500000 + r2.x;
/*33*/	  r0.w = -r3.w * r5.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*35*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*36*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*37*/	}
/*38*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*39*/	if(r0.w != 0) discard;
/*40*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*41*/	r2.zw = (r2.zzzw * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*42*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*43*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*44*/	r0.w = saturate(-r0.w + r3.w);
/*45*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*46*/	if(floatBitsToUint(r0.w) != 0u) {
/*47*/	  r0.w = -r3.w + 1.000000;
/*48*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*49*/	  r0.w = -r0.w + 1.000000;
/*50*/	  r0.w = -r0.w * r0.w + 1.000000;
/*51*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*52*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*53*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*54*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*55*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*56*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*57*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*58*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*59*/	}
/*60*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*63*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*66*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*70*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*71*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*72*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*73*/	r0.w = inversesqrt(r0.w);
/*74*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*75*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*76*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*77*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*78*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*79*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*80*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*81*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*82*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*83*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*84*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*85*/	r5.w = 1.000000;
/*86*/	r2.x = dot(r5.xyzw, cb1.data[12].xyzw);
/*87*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*88*/	r7.x = uintBitsToFloat((r2.x >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r7.y = uintBitsToFloat((r2.x >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*90*/	r7.z = uintBitsToFloat((r2.x >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r7.w = uintBitsToFloat((r2.x >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*92*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*93*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*94*/	r2.w = intBitsToFloat(int(r2.z));
/*95*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*96*/	if(floatBitsToUint(r3.w) != 0u) {
/*97*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*98*/	  r6.w = vsOut_T0.w;
/*99*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*100*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*101*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*102*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*103*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*104*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*105*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*106*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*107*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*108*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*109*/	  if(floatBitsToUint(r4.w) == 0u) {
/*110*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*111*/	    r8.xy = floor((r7.xyxx).xy);
/*112*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*113*/	    r3.w = -0.000400 / r3.w;
/*114*/	    r3.w = r3.w + r7.z;
/*115*/	    r9.z = -r9.y + 1.000000;
/*116*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*117*/	    r9.w = -r9.y;
/*118*/	    r11.x = cb2.data[0].z/**/;
/*119*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*120*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*121*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*122*/	    r11.w = -cb2.data[0].w/**/;
/*123*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*124*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*125*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*126*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*127*/	    r9.x = r10.x;
/*128*/	    r9.y = r12.x;
/*129*/	    r9.z = r11.x;
/*130*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*131*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*132*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*133*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*134*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*135*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*136*/	    r3.w = -r7.x + r7.z;
/*137*/	    r3.w = r7.y * r3.w + r7.x;
/*138*/	  } else {
/*139*/	    r3.w = 1.000000;
/*140*/	  }
/*141*/	} else {
/*142*/	  r3.w = 1.000000;
/*143*/	}
/*144*/	r4.w = cb2.data[34].w + -1.000000;
/*145*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*146*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*147*/	if(floatBitsToUint(r2.z) == 0u) {
/*148*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*149*/	  r2.z = floatBitsToInt(r2.z);
/*150*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*151*/	  if(floatBitsToUint(r2.z) != 0u) {
/*152*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*153*/	    r6.w = vsOut_T0.w;
/*154*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*155*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*156*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*157*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*158*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*159*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*160*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*161*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*162*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*163*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*164*/	    if(floatBitsToUint(r6.w) == 0u) {
/*165*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*166*/	      r7.xy = floor((r6.xyxx).xy);
/*167*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*168*/	      r2.z = -0.000400 / r2.z;
/*169*/	      r2.z = r2.z + r6.z;
/*170*/	      r8.z = -r8.y + 1.000000;
/*171*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*172*/	      r8.w = -r8.y;
/*173*/	      r10.x = cb2.data[0].z/**/;
/*174*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*175*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*176*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*177*/	      r10.w = -cb2.data[0].w/**/;
/*178*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*179*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*180*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*181*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*182*/	      r8.x = r9.x;
/*183*/	      r8.y = r11.x;
/*184*/	      r8.z = r10.x;
/*185*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*186*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*187*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*188*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*189*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*190*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*191*/	      r2.z = -r6.x + r6.z;
/*192*/	      r2.z = r6.y * r2.z + r6.x;
/*193*/	    } else {
/*194*/	      r2.z = 1.000000;
/*195*/	    }
/*196*/	  } else {
/*197*/	    r2.z = 1.000000;
/*198*/	  }
/*199*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*200*/	  r6.y = r6.x * cb2.data[34].x;
/*201*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*202*/	  r6.x = r2.x + -r6.x;
/*203*/	  r6.x = saturate(r6.x / r6.y);
/*204*/	  r2.z = -r3.w + r2.z;
/*205*/	  r3.w = r6.x * r2.z + r3.w;
/*206*/	}
/*207*/	if(floatBitsToUint(r4.w) != 0u) {
/*208*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*209*/	  r4.w = r2.z * cb2.data[34].y;
/*210*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*211*/	  r2.z = -r2.z + r2.x;
/*212*/	  r2.z = saturate(r2.z / r4.w);
/*213*/	  r2.w = -r3.w + 1.000000;
/*214*/	  r3.w = r2.z * r2.w + r3.w;
/*215*/	}
/*216*/	r3.w = saturate(r3.w);
/*217*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*218*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*219*/	r2.w = inversesqrt(r2.z);
/*220*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*221*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*222*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*223*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*224*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*225*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*226*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*227*/	r4.w = r2.w * r9.x + 0.300000;
/*228*/	r4.w = saturate(-r4.w + 1.000000);
/*229*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*230*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*231*/	r7.w = -r2.w * r9.x + 1.000000;
/*232*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*233*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*234*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*235*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*236*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*237*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*238*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*239*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*240*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*241*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*242*/	r4.w = saturate(r2.w);
/*243*/	r4.w = r4.w * r4.w;
/*244*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*245*/	r7.w = r7.w * r7.w;
/*246*/	r7.w = r7.w * r7.w;
/*247*/	r4.w = r4.w * r7.w;
/*248*/	r4.z = r4.z * r4.w;
/*249*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*250*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*251*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*252*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*253*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*254*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*255*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*256*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*257*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*258*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*259*/	r7.w = inversesqrt(r7.w);
/*260*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*261*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*262*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*263*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*264*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*265*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*266*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*267*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*268*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*269*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*270*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*271*/	r7.w = r8.z * r8.x;
/*272*/	r2.y = r2.y * r2.y;
/*273*/	r2.w = r2.w + r2.w;
/*274*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*275*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*276*/	r2.w = max(r2.w, 0.000000);
/*277*/	r2.y = r2.y * 127.000000 + 1.600000;
/*278*/	r2.w = log2(r2.w);
/*279*/	r2.y = r2.w * r2.y;
/*280*/	r2.y = exp2(r2.y);
/*281*/	r2.y = min(r2.y, 1.000000);
/*282*/	r1.w = r1.w * r2.y;
/*283*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*284*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*285*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*286*/	r2.y = r1.w + r1.w;
/*287*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r7.xyzx).xyz;
/*288*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*289*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*290*/	r2.y = inversesqrt(r2.y);
/*291*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*292*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*293*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*294*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*295*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*296*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*297*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*298*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*299*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*300*/	r1.w = saturate(-r1.w + 1.000000);
/*301*/	r1.w = r1.w * r1.w;
/*302*/	r1.w = r4.x * r1.w;
/*303*/	r1.w = r1.w * 1.500000;
/*304*/	r1.w = r8.w * r1.w;
/*305*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*306*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*307*/	r0.w = inversesqrt(r0.w);
/*308*/	r0.w = r0.w * r1.y;
/*309*/	r0.w = max(r0.w, 0.000000);
/*310*/	r0.w = r0.w * r1.w;
/*311*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*312*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*313*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*314*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*315*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*316*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*317*/	r1.xy = (r1.xyxx / r2.xxxx).xy;
/*318*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*319*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*320*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*321*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*322*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*323*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*324*/	if(r0.w != 0) discard;
/*325*/	r0.w = sqrt(r2.z);
/*326*/	r1.x = saturate(cb4.data[0].w)/**/;
/*327*/	r1.x = -r1.x + 1.000000;
/*328*/	r1.x = r1.x * 8.000000 + -4.000000;
/*329*/	r1.y = saturate(cb4.data[1].x)/**/;
/*330*/	r1.y = -r1.y + 1.000000;
/*331*/	r1.y = r1.y * 1000.000000;
/*332*/	r0.w = r0.w / r1.y;
/*333*/	r0.w = r0.w + r1.x;
/*334*/	r0.w = r0.w * 1.442695;
/*335*/	r0.w = exp2(r0.w);
/*336*/	r0.w = cb4.data[1].y / r0.w;
/*337*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*338*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*339*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*340*/	r1.x = r1.x + -cb4.data[1].z;
/*341*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*342*/	r1.x = saturate(r1.y * r1.x);
/*343*/	r1.y = r1.x * -2.000000 + 3.000000;
/*344*/	r1.x = r1.x * r1.x;
/*345*/	r1.x = r1.x * r1.y;
/*346*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*347*/	r1.y = sqrt(r1.y);
/*348*/	r1.z = max(cb4.data[2].z, 0.001000);
/*349*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*350*/	r1.y = r1.z * r1.y;
/*351*/	r1.y = min(r1.y, 1.000000);
/*352*/	r1.z = r1.y * -2.000000 + 3.000000;
/*353*/	r1.y = r1.y * r1.y;
/*354*/	r1.y = r1.y * r1.z;
/*355*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*356*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*357*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*358*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*359*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*360*/	r6.w = max(r6.y, 0.000000);
/*361*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*362*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*363*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*364*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*365*/	r0.w = saturate(r0.w * r1.y);
/*366*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*367*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*368*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*369*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*370*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*371*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*372*/	color0.w = 1.000000;
/*373*/	return;
}
