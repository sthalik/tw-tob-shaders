//
//
// Shader Model 4
// Fragment Shader
//
// id: 6355 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirtblood.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
/*7*/	r2.z = sqrt(r0.w);
/*8*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*10*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*11*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*12*/	r0.w = r3.w * r4.w;
/*13*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*14*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*16*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r0.w = inversesqrt(r0.w);
/*18*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*19*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r0.w != 0) discard;
/*21*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * cb5.data[2].xyxx + vsOut_T6.xyxx).xy;
/*23*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*25*/	r0.w = saturate(-r0.w + r2.w);
/*26*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r0.w) != 0u) {
/*28*/	  r0.w = -r2.w + 1.000000;
/*29*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*30*/	  r0.w = -r0.w + 1.000000;
/*31*/	  r0.w = -r0.w * r0.w + 1.000000;
/*32*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*33*/	  r2.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*37*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*38*/	  r0.xyz = (r0.wwww * r3.xyzx + r2.xyzx).xyz;
/*39*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*40*/	} else {
/*41*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*42*/	}
/*43*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*46*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*47*/	r0.w = inversesqrt(r0.w);
/*48*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*49*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*52*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*53*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*54*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*55*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*56*/	r0.w = inversesqrt(r0.w);
/*57*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*58*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*59*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*60*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*61*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*62*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*63*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*65*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*66*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*67*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*68*/	r5.w = 1.000000;
/*69*/	r2.y = dot(r5.xyzw, cb1.data[12].xyzw);
/*70*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*71*/	r7.x = uintBitsToFloat((r2.y >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r7.y = uintBitsToFloat((r2.y >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r7.z = uintBitsToFloat((r2.y >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*74*/	r7.w = uintBitsToFloat((r2.y >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*76*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*77*/	r2.w = intBitsToFloat(int(r2.z));
/*78*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*79*/	if(floatBitsToUint(r3.w) != 0u) {
/*80*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*81*/	  r6.w = vsOut_T0.w;
/*82*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*83*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*84*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*85*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*86*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*87*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*88*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*89*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*90*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*91*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*92*/	  if(floatBitsToUint(r4.w) == 0u) {
/*93*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*94*/	    r8.xy = floor((r7.xyxx).xy);
/*95*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*96*/	    r3.w = -0.000400 / r3.w;
/*97*/	    r3.w = r3.w + r7.z;
/*98*/	    r9.z = -r9.y + 1.000000;
/*99*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*100*/	    r9.w = -r9.y;
/*101*/	    r11.x = cb2.data[0].z/**/;
/*102*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*103*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*104*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*105*/	    r11.w = -cb2.data[0].w/**/;
/*106*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*107*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*108*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*109*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*110*/	    r9.x = r10.x;
/*111*/	    r9.y = r12.x;
/*112*/	    r9.z = r11.x;
/*113*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*114*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*115*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*116*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*117*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*118*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*119*/	    r3.w = -r7.x + r7.z;
/*120*/	    r3.w = r7.y * r3.w + r7.x;
/*121*/	  } else {
/*122*/	    r3.w = 1.000000;
/*123*/	  }
/*124*/	} else {
/*125*/	  r3.w = 1.000000;
/*126*/	}
/*127*/	r4.w = cb2.data[34].w + -1.000000;
/*128*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*129*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*130*/	if(floatBitsToUint(r2.z) == 0u) {
/*131*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*132*/	  r2.z = floatBitsToInt(r2.z);
/*133*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*134*/	  if(floatBitsToUint(r2.z) != 0u) {
/*135*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*136*/	    r6.w = vsOut_T0.w;
/*137*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*138*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*139*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*140*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*141*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*142*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*143*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*144*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*145*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*146*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*147*/	    if(floatBitsToUint(r6.w) == 0u) {
/*148*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*149*/	      r7.xy = floor((r6.xyxx).xy);
/*150*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*151*/	      r2.z = -0.000400 / r2.z;
/*152*/	      r2.z = r2.z + r6.z;
/*153*/	      r8.z = -r8.y + 1.000000;
/*154*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*155*/	      r8.w = -r8.y;
/*156*/	      r10.x = cb2.data[0].z/**/;
/*157*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*158*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*159*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*160*/	      r10.w = -cb2.data[0].w/**/;
/*161*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*162*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*163*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*164*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*165*/	      r8.x = r9.x;
/*166*/	      r8.y = r11.x;
/*167*/	      r8.z = r10.x;
/*168*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*169*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*170*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*171*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*172*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*173*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*174*/	      r2.z = -r6.x + r6.z;
/*175*/	      r2.z = r6.y * r2.z + r6.x;
/*176*/	    } else {
/*177*/	      r2.z = 1.000000;
/*178*/	    }
/*179*/	  } else {
/*180*/	    r2.z = 1.000000;
/*181*/	  }
/*182*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*183*/	  r6.y = r6.x * cb2.data[34].x;
/*184*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*185*/	  r6.x = r2.y + -r6.x;
/*186*/	  r6.x = saturate(r6.x / r6.y);
/*187*/	  r2.z = -r3.w + r2.z;
/*188*/	  r3.w = r6.x * r2.z + r3.w;
/*189*/	}
/*190*/	if(floatBitsToUint(r4.w) != 0u) {
/*191*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*192*/	  r4.w = r2.z * cb2.data[34].y;
/*193*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*194*/	  r2.z = -r2.z + r2.y;
/*195*/	  r2.z = saturate(r2.z / r4.w);
/*196*/	  r2.w = -r3.w + 1.000000;
/*197*/	  r3.w = r2.z * r2.w + r3.w;
/*198*/	}
/*199*/	r3.w = saturate(r3.w);
/*200*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*201*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*202*/	r2.w = inversesqrt(r2.z);
/*203*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*204*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*205*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*206*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*207*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*208*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*209*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*210*/	r4.w = r2.w * r9.x + 0.300000;
/*211*/	r4.w = saturate(-r4.w + 1.000000);
/*212*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*213*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*214*/	r7.w = -r2.w * r9.x + 1.000000;
/*215*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*216*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*217*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*218*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*219*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*220*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*221*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*222*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*223*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*224*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*225*/	r4.w = saturate(r2.w);
/*226*/	r4.w = r4.w * r4.w;
/*227*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*228*/	r7.w = r7.w * r7.w;
/*229*/	r7.w = r7.w * r7.w;
/*230*/	r4.w = r4.w * r7.w;
/*231*/	r4.z = r4.z * r4.w;
/*232*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*233*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*234*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*235*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*236*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*237*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*238*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*239*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*240*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*241*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*242*/	r7.w = inversesqrt(r7.w);
/*243*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*244*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*245*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*246*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*247*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*248*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*249*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*250*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*251*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*252*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*253*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*254*/	r7.w = r8.z * r8.x;
/*255*/	r2.x = r2.x * r2.x;
/*256*/	r2.w = r2.w + r2.w;
/*257*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*258*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*259*/	r2.w = max(r2.w, 0.000000);
/*260*/	r2.x = r2.x * 127.000000 + 1.600000;
/*261*/	r2.w = log2(r2.w);
/*262*/	r2.x = r2.w * r2.x;
/*263*/	r2.x = exp2(r2.x);
/*264*/	r2.x = min(r2.x, 1.000000);
/*265*/	r1.w = r1.w * r2.x;
/*266*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*267*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*268*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*269*/	r2.x = r1.w + r1.w;
/*270*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r7.xyzx).xyz;
/*271*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*272*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*273*/	r2.x = inversesqrt(r2.x);
/*274*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*275*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*276*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*277*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*278*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*279*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*280*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*281*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*282*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*283*/	r1.w = saturate(-r1.w + 1.000000);
/*284*/	r1.w = r1.w * r1.w;
/*285*/	r1.w = r4.x * r1.w;
/*286*/	r1.w = r1.w * 1.500000;
/*287*/	r1.w = r8.w * r1.w;
/*288*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*289*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*290*/	r0.w = inversesqrt(r0.w);
/*291*/	r0.w = r0.w * r1.y;
/*292*/	r0.w = max(r0.w, 0.000000);
/*293*/	r0.w = r0.w * r1.w;
/*294*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*295*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*296*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*297*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*298*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*299*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*300*/	r1.xy = (r1.xyxx / r2.yyyy).xy;
/*301*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*302*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*303*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*304*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*305*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*306*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*307*/	if(r0.w != 0) discard;
/*308*/	r0.w = sqrt(r2.z);
/*309*/	r1.x = saturate(cb4.data[0].w)/**/;
/*310*/	r1.x = -r1.x + 1.000000;
/*311*/	r1.x = r1.x * 8.000000 + -4.000000;
/*312*/	r1.y = saturate(cb4.data[1].x)/**/;
/*313*/	r1.y = -r1.y + 1.000000;
/*314*/	r1.y = r1.y * 1000.000000;
/*315*/	r0.w = r0.w / r1.y;
/*316*/	r0.w = r0.w + r1.x;
/*317*/	r0.w = r0.w * 1.442695;
/*318*/	r0.w = exp2(r0.w);
/*319*/	r0.w = cb4.data[1].y / r0.w;
/*320*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*321*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*322*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*323*/	r1.x = r1.x + -cb4.data[1].z;
/*324*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*325*/	r1.x = saturate(r1.y * r1.x);
/*326*/	r1.y = r1.x * -2.000000 + 3.000000;
/*327*/	r1.x = r1.x * r1.x;
/*328*/	r1.x = r1.x * r1.y;
/*329*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*330*/	r1.y = sqrt(r1.y);
/*331*/	r1.z = max(cb4.data[2].z, 0.001000);
/*332*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*333*/	r1.y = r1.z * r1.y;
/*334*/	r1.y = min(r1.y, 1.000000);
/*335*/	r1.z = r1.y * -2.000000 + 3.000000;
/*336*/	r1.y = r1.y * r1.y;
/*337*/	r1.y = r1.y * r1.z;
/*338*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*339*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*340*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*341*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*342*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*343*/	r6.w = max(r6.y, 0.000000);
/*344*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*345*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*346*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*347*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*348*/	r0.w = saturate(r0.w * r1.y);
/*349*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*350*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*351*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*352*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*353*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*354*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*355*/	color0.w = 1.000000;
/*356*/	return;
}
