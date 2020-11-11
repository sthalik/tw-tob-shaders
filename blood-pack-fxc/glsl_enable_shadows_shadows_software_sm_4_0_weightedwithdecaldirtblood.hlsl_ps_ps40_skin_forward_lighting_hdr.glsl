//
//
// Shader Model 4
// Fragment Shader
//
// id: 6573 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb4.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r1.z = sqrt(r0.w);
/*18*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*19*/	r2.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*20*/	r3.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*21*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*22*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*23*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*24*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*27*/	r3.z = vsOut_T6.z;
/*28*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*29*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*30*/	if(floatBitsToUint(r0.w) != 0u) {
/*31*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*32*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*34*/	  r0.w = -r0.w + 1.000000;
/*35*/	  r0.w = max(r0.w, 0.000000);
/*36*/	  r3.z = sqrt(r0.w);
/*37*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*38*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*39*/	  r0.w = r2.x * r6.w;
/*40*/	  r2.x = r0.w * -0.500000 + r2.x;
/*41*/	  r0.w = -r4.w * r5.w + 1.000000;
/*42*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*43*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*44*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*45*/	}
/*46*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*48*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*49*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*50*/	r0.w = r3.w * r4.w;
/*51*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*52*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*53*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*54*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*57*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*58*/	if(r0.w != 0) discard;
/*59*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*60*/	r2.zw = (r2.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*61*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*62*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*63*/	r0.w = saturate(-r0.w + r3.w);
/*64*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r0.w) != 0u) {
/*66*/	  r0.w = -r3.w + 1.000000;
/*67*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*68*/	  r0.w = -r0.w + 1.000000;
/*69*/	  r0.w = -r0.w * r0.w + 1.000000;
/*70*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*71*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*72*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*73*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*74*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*75*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*76*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*77*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*78*/	}
/*79*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r0.w = inversesqrt(r0.w);
/*81*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*82*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*85*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r0.w = inversesqrt(r0.w);
/*87*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*88*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*89*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*90*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*91*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*92*/	r0.w = inversesqrt(r0.w);
/*93*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*94*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*95*/	r1.w = -vsOut_T4.z + 1.000000;
/*96*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*97*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*98*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*99*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*100*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*101*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*102*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*103*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*104*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*105*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*106*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*107*/	r5.w = 1.000000;
/*108*/	r2.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*109*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*110*/	r7.x = uintBitsToFloat((r2.x >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*111*/	r7.y = uintBitsToFloat((r2.x >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*112*/	r7.z = uintBitsToFloat((r2.x >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*113*/	r7.w = uintBitsToFloat((r2.x >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*114*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*115*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*116*/	r2.w = intBitsToFloat(int(r2.z));
/*117*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*118*/	if(floatBitsToUint(r3.w) != 0u) {
/*119*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*120*/	  r6.w = vsOut_T0.w;
/*121*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*122*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*123*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*124*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*125*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*126*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*127*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*128*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*129*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*130*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*131*/	  if(floatBitsToUint(r4.w) == 0u) {
/*132*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*133*/	    r8.xy = floor((r7.xyxx).xy);
/*134*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*135*/	    r3.w = -0.000400 / r3.w;
/*136*/	    r3.w = r3.w + r7.z;
/*137*/	    r9.z = -r9.y + 1.000000;
/*138*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*139*/	    r9.w = -r9.y;
/*140*/	    r11.x = cb1.data[0].z/**/;
/*141*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*142*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*143*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*144*/	    r11.w = -cb1.data[0].w/**/;
/*145*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*146*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*147*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*148*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*149*/	    r9.x = r10.x;
/*150*/	    r9.y = r12.x;
/*151*/	    r9.z = r11.x;
/*152*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*153*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*154*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*155*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*156*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*157*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*158*/	    r3.w = -r7.x + r7.z;
/*159*/	    r3.w = r7.y * r3.w + r7.x;
/*160*/	  } else {
/*161*/	    r3.w = 1.000000;
/*162*/	  }
/*163*/	} else {
/*164*/	  r3.w = 1.000000;
/*165*/	}
/*166*/	r4.w = cb1.data[34].w + -1.000000;
/*167*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*168*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*169*/	if(floatBitsToUint(r2.z) == 0u) {
/*170*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*171*/	  r2.z = floatBitsToInt(r2.z);
/*172*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*173*/	  if(floatBitsToUint(r2.z) != 0u) {
/*174*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*175*/	    r6.w = vsOut_T0.w;
/*176*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*177*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*178*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*179*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*180*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*181*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*182*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*183*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*184*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*185*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*186*/	    if(floatBitsToUint(r6.w) == 0u) {
/*187*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*188*/	      r7.xy = floor((r6.xyxx).xy);
/*189*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*190*/	      r2.z = -0.000400 / r2.z;
/*191*/	      r2.z = r2.z + r6.z;
/*192*/	      r8.z = -r8.y + 1.000000;
/*193*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*194*/	      r8.w = -r8.y;
/*195*/	      r10.x = cb1.data[0].z/**/;
/*196*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*197*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*198*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*199*/	      r10.w = -cb1.data[0].w/**/;
/*200*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*201*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*202*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*203*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*204*/	      r8.x = r9.x;
/*205*/	      r8.y = r11.x;
/*206*/	      r8.z = r10.x;
/*207*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*208*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*209*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*210*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*211*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*212*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*213*/	      r2.z = -r6.x + r6.z;
/*214*/	      r2.z = r6.y * r2.z + r6.x;
/*215*/	    } else {
/*216*/	      r2.z = 1.000000;
/*217*/	    }
/*218*/	  } else {
/*219*/	    r2.z = 1.000000;
/*220*/	  }
/*221*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*222*/	  r6.y = r6.x * cb1.data[34].x;
/*223*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*224*/	  r6.x = r2.x + -r6.x;
/*225*/	  r6.x = saturate(r6.x / r6.y);
/*226*/	  r2.z = -r3.w + r2.z;
/*227*/	  r3.w = r6.x * r2.z + r3.w;
/*228*/	}
/*229*/	if(floatBitsToUint(r4.w) != 0u) {
/*230*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*231*/	  r4.w = r2.z * cb1.data[34].y;
/*232*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*233*/	  r2.z = -r2.z + r2.x;
/*234*/	  r2.z = saturate(r2.z / r4.w);
/*235*/	  r2.w = -r3.w + 1.000000;
/*236*/	  r3.w = r2.z * r2.w + r3.w;
/*237*/	}
/*238*/	r3.w = saturate(r3.w);
/*239*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*240*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*241*/	r2.z = inversesqrt(r2.z);
/*242*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*243*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*244*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*245*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*246*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*247*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*248*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*249*/	r2.w = r2.z * r8.x + 0.300000;
/*250*/	r2.w = saturate(-r2.w + 1.000000);
/*251*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*252*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*253*/	r4.w = -r2.z * r8.x + 1.000000;
/*254*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*255*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*256*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*257*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*258*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*259*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*260*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*261*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*262*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*263*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*264*/	r2.w = saturate(r2.z);
/*265*/	r2.w = r2.w * r2.w;
/*266*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*267*/	r4.w = r4.w * r4.w;
/*268*/	r4.w = r4.w * r4.w;
/*269*/	r2.w = r2.w * r4.w;
/*270*/	r2.w = r4.z * r2.w;
/*271*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*272*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*273*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*274*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*275*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*276*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*277*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*278*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*279*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*280*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*281*/	r2.w = inversesqrt(r2.w);
/*282*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*283*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*284*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*285*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*286*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*287*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*288*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*289*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*290*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*291*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*292*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*293*/	r2.w = r7.z * r7.x;
/*294*/	r2.y = r2.y * r2.y;
/*295*/	r2.z = r2.z + r2.z;
/*296*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*297*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*298*/	r2.z = max(r2.z, 0.000000);
/*299*/	r2.y = r2.y * 127.000000 + 1.600000;
/*300*/	r2.z = log2(r2.z);
/*301*/	r2.y = r2.z * r2.y;
/*302*/	r2.y = exp2(r2.y);
/*303*/	r2.y = min(r2.y, 1.000000);
/*304*/	r1.w = r1.w * r2.y;
/*305*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*306*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*307*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*308*/	r2.y = r1.w + r1.w;
/*309*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*310*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*311*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*312*/	r2.y = inversesqrt(r2.y);
/*313*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*314*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*315*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*316*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*317*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*318*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*319*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*320*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*321*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*322*/	r1.w = saturate(-r1.w + 1.000000);
/*323*/	r1.w = r1.w * r1.w;
/*324*/	r1.w = r4.x * r1.w;
/*325*/	r1.w = r1.w * 1.500000;
/*326*/	r1.w = r7.w * r1.w;
/*327*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*328*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*329*/	r0.w = inversesqrt(r0.w);
/*330*/	r0.w = r0.w * r1.y;
/*331*/	r0.w = max(r0.w, 0.000000);
/*332*/	r0.w = r0.w * r1.w;
/*333*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*334*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*335*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*336*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*337*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*338*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*339*/	r0.xy = (r0.xyxx / r2.xxxx).xy;
/*340*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*341*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*342*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*343*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*344*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*345*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*346*/	if(r0.x != 0) discard;
/*347*/	color0.w = 1.000000;
/*348*/	color1.x = 1.000000;
/*349*/	return;
}
