//
//
// Shader Model 4
// Fragment Shader
//
// id: 6571 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;

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
/*7*/	r1.z = sqrt(r0.w);
/*8*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*9*/	r2.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*10*/	r3.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*11*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*12*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*18*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*19*/	if(floatBitsToUint(r0.w) != 0u) {
/*20*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*21*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*23*/	  r0.w = -r0.w + 1.000000;
/*24*/	  r0.w = max(r0.w, 0.000000);
/*25*/	  r4.z = sqrt(r0.w);
/*26*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*27*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*28*/	  r0.w = r2.x * r6.w;
/*29*/	  r2.x = r0.w * -0.500000 + r2.x;
/*30*/	  r0.w = -r3.w * r5.w + 1.000000;
/*31*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*32*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*33*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*34*/	}
/*35*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r2.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*37*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*38*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*39*/	r0.w = r3.w * r4.w;
/*40*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*41*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*42*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*43*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*46*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*47*/	if(r0.w != 0) discard;
/*48*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*49*/	r2.zw = (r2.zzzw * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*50*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*51*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*52*/	r0.w = saturate(-r0.w + r3.w);
/*53*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*54*/	if(floatBitsToUint(r0.w) != 0u) {
/*55*/	  r0.w = -r3.w + 1.000000;
/*56*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*57*/	  r0.w = -r0.w + 1.000000;
/*58*/	  r0.w = -r0.w * r0.w + 1.000000;
/*59*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*60*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*61*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*62*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*63*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*64*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*65*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*66*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*67*/	}
/*68*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r0.w = inversesqrt(r0.w);
/*70*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*71*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*72*/	r0.w = inversesqrt(r0.w);
/*73*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*74*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r0.w = inversesqrt(r0.w);
/*76*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*78*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*79*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*80*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*81*/	r0.w = inversesqrt(r0.w);
/*82*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*83*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
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
/*94*/	r2.x = dot(r5.xyzw, cb1.data[12].xyzw);
/*95*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*96*/	r7.x = uintBitsToFloat((r2.x >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*97*/	r7.y = uintBitsToFloat((r2.x >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*98*/	r7.z = uintBitsToFloat((r2.x >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*99*/	r7.w = uintBitsToFloat((r2.x >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*100*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*101*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*102*/	r2.w = intBitsToFloat(int(r2.z));
/*103*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*104*/	if(floatBitsToUint(r3.w) != 0u) {
/*105*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*106*/	  r6.w = vsOut_T0.w;
/*107*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*108*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*109*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*110*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*111*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*112*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*113*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*114*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*115*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*116*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*117*/	  if(floatBitsToUint(r4.w) == 0u) {
/*118*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*119*/	    r8.xy = floor((r7.xyxx).xy);
/*120*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*121*/	    r3.w = -0.000400 / r3.w;
/*122*/	    r3.w = r3.w + r7.z;
/*123*/	    r9.z = -r9.y + 1.000000;
/*124*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*125*/	    r9.w = -r9.y;
/*126*/	    r11.x = cb2.data[0].z/**/;
/*127*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*128*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*129*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*130*/	    r11.w = -cb2.data[0].w/**/;
/*131*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*132*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*133*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
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
/*152*/	r4.w = cb2.data[34].w + -1.000000;
/*153*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*154*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*155*/	if(floatBitsToUint(r2.z) == 0u) {
/*156*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*157*/	  r2.z = floatBitsToInt(r2.z);
/*158*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*159*/	  if(floatBitsToUint(r2.z) != 0u) {
/*160*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*161*/	    r6.w = vsOut_T0.w;
/*162*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*163*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*164*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*165*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*166*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*167*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*168*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*169*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*170*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*171*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*172*/	    if(floatBitsToUint(r6.w) == 0u) {
/*173*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*174*/	      r7.xy = floor((r6.xyxx).xy);
/*175*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*176*/	      r2.z = -0.000400 / r2.z;
/*177*/	      r2.z = r2.z + r6.z;
/*178*/	      r8.z = -r8.y + 1.000000;
/*179*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*180*/	      r8.w = -r8.y;
/*181*/	      r10.x = cb2.data[0].z/**/;
/*182*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*183*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*184*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*185*/	      r10.w = -cb2.data[0].w/**/;
/*186*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*187*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*188*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
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
/*207*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*208*/	  r6.y = r6.x * cb2.data[34].x;
/*209*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*210*/	  r6.x = r2.x + -r6.x;
/*211*/	  r6.x = saturate(r6.x / r6.y);
/*212*/	  r2.z = -r3.w + r2.z;
/*213*/	  r3.w = r6.x * r2.z + r3.w;
/*214*/	}
/*215*/	if(floatBitsToUint(r4.w) != 0u) {
/*216*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*217*/	  r4.w = r2.z * cb2.data[34].y;
/*218*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*219*/	  r2.z = -r2.z + r2.x;
/*220*/	  r2.z = saturate(r2.z / r4.w);
/*221*/	  r2.w = -r3.w + 1.000000;
/*222*/	  r3.w = r2.z * r2.w + r3.w;
/*223*/	}
/*224*/	r3.w = saturate(r3.w);
/*225*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*226*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*227*/	r2.w = inversesqrt(r2.z);
/*228*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*229*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*230*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*231*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*232*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*233*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*234*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*235*/	r4.w = r2.w * r9.x + 0.300000;
/*236*/	r4.w = saturate(-r4.w + 1.000000);
/*237*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*238*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*239*/	r7.w = -r2.w * r9.x + 1.000000;
/*240*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*241*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*242*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*243*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*244*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*245*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*246*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*247*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*248*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*249*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*250*/	r4.w = saturate(r2.w);
/*251*/	r4.w = r4.w * r4.w;
/*252*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*253*/	r7.w = r7.w * r7.w;
/*254*/	r7.w = r7.w * r7.w;
/*255*/	r4.w = r4.w * r7.w;
/*256*/	r4.z = r4.z * r4.w;
/*257*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*258*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*259*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*260*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*261*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*262*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*263*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*264*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*265*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*266*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*267*/	r7.w = inversesqrt(r7.w);
/*268*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*269*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*270*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*271*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*272*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*273*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*274*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*275*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*276*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*277*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*278*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*279*/	r7.w = r8.z * r8.x;
/*280*/	r2.y = r2.y * r2.y;
/*281*/	r2.w = r2.w + r2.w;
/*282*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*283*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*284*/	r2.w = max(r2.w, 0.000000);
/*285*/	r2.y = r2.y * 127.000000 + 1.600000;
/*286*/	r2.w = log2(r2.w);
/*287*/	r2.y = r2.w * r2.y;
/*288*/	r2.y = exp2(r2.y);
/*289*/	r2.y = min(r2.y, 1.000000);
/*290*/	r1.w = r1.w * r2.y;
/*291*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*292*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*293*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*294*/	r2.y = r1.w + r1.w;
/*295*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r7.xyzx).xyz;
/*296*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*297*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*298*/	r2.y = inversesqrt(r2.y);
/*299*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*300*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*301*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*302*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*303*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*304*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*305*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*306*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*307*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*308*/	r1.w = saturate(-r1.w + 1.000000);
/*309*/	r1.w = r1.w * r1.w;
/*310*/	r1.w = r4.x * r1.w;
/*311*/	r1.w = r1.w * 1.500000;
/*312*/	r1.w = r8.w * r1.w;
/*313*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*314*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*315*/	r0.w = inversesqrt(r0.w);
/*316*/	r0.w = r0.w * r1.y;
/*317*/	r0.w = max(r0.w, 0.000000);
/*318*/	r0.w = r0.w * r1.w;
/*319*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*320*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*321*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*322*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*323*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*324*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*325*/	r1.xy = (r1.xyxx / r2.xxxx).xy;
/*326*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*327*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*328*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*329*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*330*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*331*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*332*/	if(r0.w != 0) discard;
/*333*/	r0.w = sqrt(r2.z);
/*334*/	r1.x = saturate(cb4.data[0].w)/**/;
/*335*/	r1.x = -r1.x + 1.000000;
/*336*/	r1.x = r1.x * 8.000000 + -4.000000;
/*337*/	r1.y = saturate(cb4.data[1].x)/**/;
/*338*/	r1.y = -r1.y + 1.000000;
/*339*/	r1.y = r1.y * 1000.000000;
/*340*/	r0.w = r0.w / r1.y;
/*341*/	r0.w = r0.w + r1.x;
/*342*/	r0.w = r0.w * 1.442695;
/*343*/	r0.w = exp2(r0.w);
/*344*/	r0.w = cb4.data[1].y / r0.w;
/*345*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*346*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*347*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*348*/	r1.x = r1.x + -cb4.data[1].z;
/*349*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*350*/	r1.x = saturate(r1.y * r1.x);
/*351*/	r1.y = r1.x * -2.000000 + 3.000000;
/*352*/	r1.x = r1.x * r1.x;
/*353*/	r1.x = r1.x * r1.y;
/*354*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*355*/	r1.y = sqrt(r1.y);
/*356*/	r1.z = max(cb4.data[2].z, 0.001000);
/*357*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*358*/	r1.y = r1.z * r1.y;
/*359*/	r1.y = min(r1.y, 1.000000);
/*360*/	r1.z = r1.y * -2.000000 + 3.000000;
/*361*/	r1.y = r1.y * r1.y;
/*362*/	r1.y = r1.y * r1.z;
/*363*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*364*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*365*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*366*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*367*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*368*/	r6.w = max(r6.y, 0.000000);
/*369*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*370*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*371*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*372*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*373*/	r0.w = saturate(r0.w * r1.y);
/*374*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*375*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*376*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*377*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*378*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*379*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*380*/	color0.w = 1.000000;
/*381*/	return;
}
