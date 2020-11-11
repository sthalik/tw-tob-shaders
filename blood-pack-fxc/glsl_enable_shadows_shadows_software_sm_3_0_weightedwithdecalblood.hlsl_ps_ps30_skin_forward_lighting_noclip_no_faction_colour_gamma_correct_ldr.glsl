//
//
// Shader Model 4
// Fragment Shader
//
// id: 6499 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
/*35*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*36*/	if(r0.w != 0) discard;
/*37*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*38*/	r2.zw = (r2.zzzw * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*39*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*40*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*41*/	r0.w = saturate(-r0.w + r3.w);
/*42*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*43*/	if(floatBitsToUint(r0.w) != 0u) {
/*44*/	  r0.w = -r3.w + 1.000000;
/*45*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*46*/	  r0.w = -r0.w + 1.000000;
/*47*/	  r0.w = -r0.w * r0.w + 1.000000;
/*48*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*49*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*50*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*51*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*52*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*53*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*54*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*55*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*56*/	}
/*57*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*60*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*63*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*66*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*67*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*68*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*69*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*70*/	r0.w = inversesqrt(r0.w);
/*71*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*72*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*73*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*74*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*75*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*76*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*77*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*78*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*79*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*80*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*81*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*82*/	r5.w = 1.000000;
/*83*/	r2.x = dot(r5.xyzw, cb1.data[12].xyzw);
/*84*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*85*/	r7.x = uintBitsToFloat((r2.x >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r7.y = uintBitsToFloat((r2.x >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*87*/	r7.z = uintBitsToFloat((r2.x >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*88*/	r7.w = uintBitsToFloat((r2.x >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*90*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*91*/	r2.w = intBitsToFloat(int(r2.z));
/*92*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*93*/	if(floatBitsToUint(r3.w) != 0u) {
/*94*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*95*/	  r6.w = vsOut_T0.w;
/*96*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*97*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*98*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*99*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*100*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*101*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*102*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*103*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*104*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*105*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*106*/	  if(floatBitsToUint(r4.w) == 0u) {
/*107*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*108*/	    r8.xy = floor((r7.xyxx).xy);
/*109*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*110*/	    r3.w = -0.000400 / r3.w;
/*111*/	    r3.w = r3.w + r7.z;
/*112*/	    r9.z = -r9.y + 1.000000;
/*113*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*114*/	    r9.w = -r9.y;
/*115*/	    r11.x = cb2.data[0].z/**/;
/*116*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*117*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*118*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*119*/	    r11.w = -cb2.data[0].w/**/;
/*120*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*121*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*122*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*123*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*124*/	    r9.x = r10.x;
/*125*/	    r9.y = r12.x;
/*126*/	    r9.z = r11.x;
/*127*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*128*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*129*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*130*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*131*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*132*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*133*/	    r3.w = -r7.x + r7.z;
/*134*/	    r3.w = r7.y * r3.w + r7.x;
/*135*/	  } else {
/*136*/	    r3.w = 1.000000;
/*137*/	  }
/*138*/	} else {
/*139*/	  r3.w = 1.000000;
/*140*/	}
/*141*/	r4.w = cb2.data[34].w + -1.000000;
/*142*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*143*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*144*/	if(floatBitsToUint(r2.z) == 0u) {
/*145*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*146*/	  r2.z = floatBitsToInt(r2.z);
/*147*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*148*/	  if(floatBitsToUint(r2.z) != 0u) {
/*149*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*150*/	    r6.w = vsOut_T0.w;
/*151*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*152*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*153*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*154*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*155*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*156*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*157*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*158*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*159*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*160*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*161*/	    if(floatBitsToUint(r6.w) == 0u) {
/*162*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*163*/	      r7.xy = floor((r6.xyxx).xy);
/*164*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*165*/	      r2.z = -0.000400 / r2.z;
/*166*/	      r2.z = r2.z + r6.z;
/*167*/	      r8.z = -r8.y + 1.000000;
/*168*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*169*/	      r8.w = -r8.y;
/*170*/	      r10.x = cb2.data[0].z/**/;
/*171*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*172*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*173*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*174*/	      r10.w = -cb2.data[0].w/**/;
/*175*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*176*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*177*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*178*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*179*/	      r8.x = r9.x;
/*180*/	      r8.y = r11.x;
/*181*/	      r8.z = r10.x;
/*182*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*183*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*184*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*185*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*186*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*187*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*188*/	      r2.z = -r6.x + r6.z;
/*189*/	      r2.z = r6.y * r2.z + r6.x;
/*190*/	    } else {
/*191*/	      r2.z = 1.000000;
/*192*/	    }
/*193*/	  } else {
/*194*/	    r2.z = 1.000000;
/*195*/	  }
/*196*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*197*/	  r6.y = r6.x * cb2.data[34].x;
/*198*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*199*/	  r6.x = r2.x + -r6.x;
/*200*/	  r6.x = saturate(r6.x / r6.y);
/*201*/	  r2.z = -r3.w + r2.z;
/*202*/	  r3.w = r6.x * r2.z + r3.w;
/*203*/	}
/*204*/	if(floatBitsToUint(r4.w) != 0u) {
/*205*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*206*/	  r4.w = r2.z * cb2.data[34].y;
/*207*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*208*/	  r2.z = -r2.z + r2.x;
/*209*/	  r2.z = saturate(r2.z / r4.w);
/*210*/	  r2.w = -r3.w + 1.000000;
/*211*/	  r3.w = r2.z * r2.w + r3.w;
/*212*/	}
/*213*/	r3.w = saturate(r3.w);
/*214*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*215*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*216*/	r2.w = inversesqrt(r2.z);
/*217*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*218*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*219*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*220*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*221*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*222*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*223*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*224*/	r4.w = r2.w * r9.x + 0.300000;
/*225*/	r4.w = saturate(-r4.w + 1.000000);
/*226*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*227*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*228*/	r7.w = -r2.w * r9.x + 1.000000;
/*229*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*230*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*231*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*232*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*233*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*234*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*235*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*236*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*237*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*238*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*239*/	r4.w = saturate(r2.w);
/*240*/	r4.w = r4.w * r4.w;
/*241*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*242*/	r7.w = r7.w * r7.w;
/*243*/	r7.w = r7.w * r7.w;
/*244*/	r4.w = r4.w * r7.w;
/*245*/	r4.z = r4.z * r4.w;
/*246*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*247*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*248*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*249*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*250*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*251*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*252*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*253*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*254*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*255*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*256*/	r7.w = inversesqrt(r7.w);
/*257*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*258*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*259*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*260*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*261*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*262*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*263*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*264*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*265*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*266*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*267*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*268*/	r7.w = r8.z * r8.x;
/*269*/	r2.y = r2.y * r2.y;
/*270*/	r2.w = r2.w + r2.w;
/*271*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*272*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*273*/	r2.w = max(r2.w, 0.000000);
/*274*/	r2.y = r2.y * 127.000000 + 1.600000;
/*275*/	r2.w = log2(r2.w);
/*276*/	r2.y = r2.w * r2.y;
/*277*/	r2.y = exp2(r2.y);
/*278*/	r2.y = min(r2.y, 1.000000);
/*279*/	r1.w = r1.w * r2.y;
/*280*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*281*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*282*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*283*/	r2.y = r1.w + r1.w;
/*284*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r7.xyzx).xyz;
/*285*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*286*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*287*/	r2.y = inversesqrt(r2.y);
/*288*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*289*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*290*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*291*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*292*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*293*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*294*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*295*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*296*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*297*/	r1.w = saturate(-r1.w + 1.000000);
/*298*/	r1.w = r1.w * r1.w;
/*299*/	r1.w = r4.x * r1.w;
/*300*/	r1.w = r1.w * 1.500000;
/*301*/	r1.w = r8.w * r1.w;
/*302*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*303*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*304*/	r0.w = inversesqrt(r0.w);
/*305*/	r0.w = r0.w * r1.y;
/*306*/	r0.w = max(r0.w, 0.000000);
/*307*/	r0.w = r0.w * r1.w;
/*308*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*309*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*310*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*311*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*312*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*313*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*314*/	r1.xy = (r1.xyxx / r2.xxxx).xy;
/*315*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*316*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*317*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*318*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*319*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*320*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*321*/	if(r0.w != 0) discard;
/*322*/	r0.w = sqrt(r2.z);
/*323*/	r1.x = saturate(cb4.data[0].w)/**/;
/*324*/	r1.x = -r1.x + 1.000000;
/*325*/	r1.x = r1.x * 8.000000 + -4.000000;
/*326*/	r1.y = saturate(cb4.data[1].x)/**/;
/*327*/	r1.y = -r1.y + 1.000000;
/*328*/	r1.y = r1.y * 1000.000000;
/*329*/	r0.w = r0.w / r1.y;
/*330*/	r0.w = r0.w + r1.x;
/*331*/	r0.w = r0.w * 1.442695;
/*332*/	r0.w = exp2(r0.w);
/*333*/	r0.w = cb4.data[1].y / r0.w;
/*334*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*335*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*336*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*337*/	r1.x = r1.x + -cb4.data[1].z;
/*338*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*339*/	r1.x = saturate(r1.y * r1.x);
/*340*/	r1.y = r1.x * -2.000000 + 3.000000;
/*341*/	r1.x = r1.x * r1.x;
/*342*/	r1.x = r1.x * r1.y;
/*343*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*344*/	r1.y = sqrt(r1.y);
/*345*/	r1.z = max(cb4.data[2].z, 0.001000);
/*346*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*347*/	r1.y = r1.z * r1.y;
/*348*/	r1.y = min(r1.y, 1.000000);
/*349*/	r1.z = r1.y * -2.000000 + 3.000000;
/*350*/	r1.y = r1.y * r1.y;
/*351*/	r1.y = r1.y * r1.z;
/*352*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*353*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*354*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*355*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*356*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*357*/	r6.w = max(r6.y, 0.000000);
/*358*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*359*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*360*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*361*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*362*/	r0.w = saturate(r0.w * r1.y);
/*363*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*364*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*365*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*366*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*367*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*368*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*369*/	color0.w = 1.000000;
/*370*/	return;
}
