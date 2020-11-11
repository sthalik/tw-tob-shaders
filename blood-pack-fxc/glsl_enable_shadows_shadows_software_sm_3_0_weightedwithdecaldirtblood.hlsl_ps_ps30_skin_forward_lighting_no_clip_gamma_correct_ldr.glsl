//
//
// Shader Model 4
// Fragment Shader
//
// id: 6567 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_sky;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;

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
/*14*/	r1.z = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*16*/	r2.zw = (-cb5.data[3].xxxy + cb5.data[3].zzzw).zw;
/*17*/	r3.xy = (vsOut_T1.xyxx + -cb5.data[3].xyxx).xy;
/*18*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*19*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*20*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*21*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*23*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*24*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*25*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*26*/	if(floatBitsToUint(r0.w) != 0u) {
/*27*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*28*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*29*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*30*/	  r0.w = -r0.w + 1.000000;
/*31*/	  r0.w = max(r0.w, 0.000000);
/*32*/	  r4.z = sqrt(r0.w);
/*33*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*34*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*35*/	  r0.w = r2.x * r6.w;
/*36*/	  r2.x = r0.w * -0.500000 + r2.x;
/*37*/	  r0.w = -r3.w * r5.w + 1.000000;
/*38*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*39*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*40*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*41*/	}
/*42*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r2.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*44*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*45*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*46*/	r0.w = r3.w * r4.w;
/*47*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*48*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*49*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*50*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*53*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*54*/	if(r0.w != 0) discard;
/*55*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*56*/	r2.zw = (r2.zzzw * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*57*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*58*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*59*/	r0.w = saturate(-r0.w + r3.w);
/*60*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*61*/	if(floatBitsToUint(r0.w) != 0u) {
/*62*/	  r0.w = -r3.w + 1.000000;
/*63*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*64*/	  r0.w = -r0.w + 1.000000;
/*65*/	  r0.w = -r0.w * r0.w + 1.000000;
/*66*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*67*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*68*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*69*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*70*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*71*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*72*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*73*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*74*/	}
/*75*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*76*/	r0.w = inversesqrt(r0.w);
/*77*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*78*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*81*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*82*/	r0.w = inversesqrt(r0.w);
/*83*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*84*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*85*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*86*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*87*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*88*/	r0.w = inversesqrt(r0.w);
/*89*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*90*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*91*/	r1.w = -vsOut_T4.z + 1.000000;
/*92*/	r5.xyz = (vsOut_T4.zzzz * cb6.data[3].xyzx).xyz;
/*93*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*94*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*95*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*96*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*97*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*98*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*99*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*100*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*101*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*102*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*103*/	r5.w = 1.000000;
/*104*/	r2.x = dot(r5.xyzw, cb1.data[12].xyzw);
/*105*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*106*/	r7.x = uintBitsToFloat((r2.x >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*107*/	r7.y = uintBitsToFloat((r2.x >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*108*/	r7.z = uintBitsToFloat((r2.x >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*109*/	r7.w = uintBitsToFloat((r2.x >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*110*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*111*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*112*/	r2.w = intBitsToFloat(int(r2.z));
/*113*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*114*/	if(floatBitsToUint(r3.w) != 0u) {
/*115*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*116*/	  r6.w = vsOut_T0.w;
/*117*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*118*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*119*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*120*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*121*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*122*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*123*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*124*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*125*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*126*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*127*/	  if(floatBitsToUint(r4.w) == 0u) {
/*128*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*129*/	    r8.xy = floor((r7.xyxx).xy);
/*130*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*131*/	    r3.w = -0.000400 / r3.w;
/*132*/	    r3.w = r3.w + r7.z;
/*133*/	    r9.z = -r9.y + 1.000000;
/*134*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*135*/	    r9.w = -r9.y;
/*136*/	    r11.x = cb2.data[0].z/**/;
/*137*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*138*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*139*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*140*/	    r11.w = -cb2.data[0].w/**/;
/*141*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*142*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*143*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*144*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*145*/	    r9.x = r10.x;
/*146*/	    r9.y = r12.x;
/*147*/	    r9.z = r11.x;
/*148*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*149*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*150*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*151*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*152*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*153*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*154*/	    r3.w = -r7.x + r7.z;
/*155*/	    r3.w = r7.y * r3.w + r7.x;
/*156*/	  } else {
/*157*/	    r3.w = 1.000000;
/*158*/	  }
/*159*/	} else {
/*160*/	  r3.w = 1.000000;
/*161*/	}
/*162*/	r4.w = cb2.data[34].w + -1.000000;
/*163*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*164*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*165*/	if(floatBitsToUint(r2.z) == 0u) {
/*166*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*167*/	  r2.z = floatBitsToInt(r2.z);
/*168*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*169*/	  if(floatBitsToUint(r2.z) != 0u) {
/*170*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*171*/	    r6.w = vsOut_T0.w;
/*172*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*173*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*174*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*175*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*176*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*177*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*178*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*179*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*180*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*181*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*182*/	    if(floatBitsToUint(r6.w) == 0u) {
/*183*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*184*/	      r7.xy = floor((r6.xyxx).xy);
/*185*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*186*/	      r2.z = -0.000400 / r2.z;
/*187*/	      r2.z = r2.z + r6.z;
/*188*/	      r8.z = -r8.y + 1.000000;
/*189*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*190*/	      r8.w = -r8.y;
/*191*/	      r10.x = cb2.data[0].z/**/;
/*192*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*193*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*194*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*195*/	      r10.w = -cb2.data[0].w/**/;
/*196*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*197*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*198*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*199*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*200*/	      r8.x = r9.x;
/*201*/	      r8.y = r11.x;
/*202*/	      r8.z = r10.x;
/*203*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*204*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*205*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*206*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*207*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*208*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*209*/	      r2.z = -r6.x + r6.z;
/*210*/	      r2.z = r6.y * r2.z + r6.x;
/*211*/	    } else {
/*212*/	      r2.z = 1.000000;
/*213*/	    }
/*214*/	  } else {
/*215*/	    r2.z = 1.000000;
/*216*/	  }
/*217*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*218*/	  r6.y = r6.x * cb2.data[34].x;
/*219*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*220*/	  r6.x = r2.x + -r6.x;
/*221*/	  r6.x = saturate(r6.x / r6.y);
/*222*/	  r2.z = -r3.w + r2.z;
/*223*/	  r3.w = r6.x * r2.z + r3.w;
/*224*/	}
/*225*/	if(floatBitsToUint(r4.w) != 0u) {
/*226*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*227*/	  r4.w = r2.z * cb2.data[34].y;
/*228*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*229*/	  r2.z = -r2.z + r2.x;
/*230*/	  r2.z = saturate(r2.z / r4.w);
/*231*/	  r2.w = -r3.w + 1.000000;
/*232*/	  r3.w = r2.z * r2.w + r3.w;
/*233*/	}
/*234*/	r3.w = saturate(r3.w);
/*235*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*236*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*237*/	r2.w = inversesqrt(r2.z);
/*238*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*239*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*240*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*241*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*242*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*243*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*244*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*245*/	r4.w = r2.w * r9.x + 0.300000;
/*246*/	r4.w = saturate(-r4.w + 1.000000);
/*247*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*248*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*249*/	r7.w = -r2.w * r9.x + 1.000000;
/*250*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*251*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*252*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*253*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*254*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*255*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*256*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*257*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*258*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*259*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*260*/	r4.w = saturate(r2.w);
/*261*/	r4.w = r4.w * r4.w;
/*262*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*263*/	r7.w = r7.w * r7.w;
/*264*/	r7.w = r7.w * r7.w;
/*265*/	r4.w = r4.w * r7.w;
/*266*/	r4.z = r4.z * r4.w;
/*267*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*268*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*269*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*270*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*271*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*272*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*273*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*274*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*275*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*276*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*277*/	r7.w = inversesqrt(r7.w);
/*278*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*279*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*280*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*281*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*282*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*283*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*284*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*285*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*286*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*287*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*288*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*289*/	r7.w = r8.z * r8.x;
/*290*/	r2.y = r2.y * r2.y;
/*291*/	r2.w = r2.w + r2.w;
/*292*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*293*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*294*/	r2.w = max(r2.w, 0.000000);
/*295*/	r2.y = r2.y * 127.000000 + 1.600000;
/*296*/	r2.w = log2(r2.w);
/*297*/	r2.y = r2.w * r2.y;
/*298*/	r2.y = exp2(r2.y);
/*299*/	r2.y = min(r2.y, 1.000000);
/*300*/	r1.w = r1.w * r2.y;
/*301*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*302*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*303*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*304*/	r2.y = r1.w + r1.w;
/*305*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r7.xyzx).xyz;
/*306*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*307*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*308*/	r2.y = inversesqrt(r2.y);
/*309*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*310*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*311*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*312*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*313*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*314*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*315*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*316*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*317*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*318*/	r1.w = saturate(-r1.w + 1.000000);
/*319*/	r1.w = r1.w * r1.w;
/*320*/	r1.w = r4.x * r1.w;
/*321*/	r1.w = r1.w * 1.500000;
/*322*/	r1.w = r8.w * r1.w;
/*323*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*324*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*325*/	r0.w = inversesqrt(r0.w);
/*326*/	r0.w = r0.w * r1.y;
/*327*/	r0.w = max(r0.w, 0.000000);
/*328*/	r0.w = r0.w * r1.w;
/*329*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*330*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*331*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*332*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*333*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*334*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*335*/	r1.xy = (r1.xyxx / r2.xxxx).xy;
/*336*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*337*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*338*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*339*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*340*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*341*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*342*/	if(r0.w != 0) discard;
/*343*/	r0.w = sqrt(r2.z);
/*344*/	r1.x = saturate(cb4.data[0].w)/**/;
/*345*/	r1.x = -r1.x + 1.000000;
/*346*/	r1.x = r1.x * 8.000000 + -4.000000;
/*347*/	r1.y = saturate(cb4.data[1].x)/**/;
/*348*/	r1.y = -r1.y + 1.000000;
/*349*/	r1.y = r1.y * 1000.000000;
/*350*/	r0.w = r0.w / r1.y;
/*351*/	r0.w = r0.w + r1.x;
/*352*/	r0.w = r0.w * 1.442695;
/*353*/	r0.w = exp2(r0.w);
/*354*/	r0.w = cb4.data[1].y / r0.w;
/*355*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*356*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*357*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*358*/	r1.x = r1.x + -cb4.data[1].z;
/*359*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*360*/	r1.x = saturate(r1.y * r1.x);
/*361*/	r1.y = r1.x * -2.000000 + 3.000000;
/*362*/	r1.x = r1.x * r1.x;
/*363*/	r1.x = r1.x * r1.y;
/*364*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*365*/	r1.y = sqrt(r1.y);
/*366*/	r1.z = max(cb4.data[2].z, 0.001000);
/*367*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*368*/	r1.y = r1.z * r1.y;
/*369*/	r1.y = min(r1.y, 1.000000);
/*370*/	r1.z = r1.y * -2.000000 + 3.000000;
/*371*/	r1.y = r1.y * r1.y;
/*372*/	r1.y = r1.y * r1.z;
/*373*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*374*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*375*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*376*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*377*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*378*/	r6.w = max(r6.y, 0.000000);
/*379*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*380*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*381*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*382*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*383*/	r0.w = saturate(r0.w * r1.y);
/*384*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*385*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*386*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*387*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*388*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*389*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*390*/	color0.w = 1.000000;
/*391*/	return;
}
