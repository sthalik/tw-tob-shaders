//
//
// Shader Model 4
// Fragment Shader
//
// id: 6577 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_skin_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;
uniform sampler2DArray s_decal_diffuse;

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
/*10*/	r1.z = sqrt(r0.w);
/*11*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*12*/	r2.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*13*/	r3.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*14*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*15*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*20*/	r3.z = vsOut_T6.z;
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*22*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*23*/	if(floatBitsToUint(r0.w) != 0u) {
/*24*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	  r0.w = -r0.w + 1.000000;
/*28*/	  r0.w = max(r0.w, 0.000000);
/*29*/	  r3.z = sqrt(r0.w);
/*30*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*32*/	  r0.w = r2.x * r6.w;
/*33*/	  r2.x = r0.w * -0.500000 + r2.x;
/*34*/	  r0.w = -r4.w * r5.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*36*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*37*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*38*/	}
/*39*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*40*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*41*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*42*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*43*/	r0.w = r3.w * r4.w;
/*44*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*45*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*46*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*47*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*48*/	r0.w = inversesqrt(r0.w);
/*49*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*50*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*51*/	if(r0.w != 0) discard;
/*52*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*53*/	r2.zw = (r2.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*54*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*55*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*56*/	r0.w = saturate(-r0.w + r3.w);
/*57*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*58*/	if(floatBitsToUint(r0.w) != 0u) {
/*59*/	  r0.w = -r3.w + 1.000000;
/*60*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*61*/	  r0.w = -r0.w + 1.000000;
/*62*/	  r0.w = -r0.w * r0.w + 1.000000;
/*63*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*64*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*65*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*66*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*67*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*68*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*69*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*70*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*71*/	}
/*72*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*73*/	r0.w = inversesqrt(r0.w);
/*74*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*75*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*76*/	r0.w = inversesqrt(r0.w);
/*77*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*78*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*81*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*82*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*83*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*84*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*85*/	r0.w = inversesqrt(r0.w);
/*86*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*87*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*88*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*89*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*90*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*91*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*92*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*93*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*94*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*95*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*96*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*97*/	r5.w = 1.000000;
/*98*/	r2.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*99*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*100*/	r7.x = uintBitsToFloat((r2.x >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*101*/	r7.y = uintBitsToFloat((r2.x >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*102*/	r7.z = uintBitsToFloat((r2.x >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*103*/	r7.w = uintBitsToFloat((r2.x >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*104*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*105*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*106*/	r2.w = intBitsToFloat(int(r2.z));
/*107*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*108*/	if(floatBitsToUint(r3.w) != 0u) {
/*109*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*110*/	  r6.w = vsOut_T0.w;
/*111*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*112*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*113*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*114*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*115*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*116*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*117*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*118*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*119*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*120*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*121*/	  if(floatBitsToUint(r4.w) == 0u) {
/*122*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*123*/	    r8.xy = floor((r7.xyxx).xy);
/*124*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*125*/	    r3.w = -0.000400 / r3.w;
/*126*/	    r3.w = r3.w + r7.z;
/*127*/	    r9.z = -r9.y + 1.000000;
/*128*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*129*/	    r9.w = -r9.y;
/*130*/	    r11.x = cb1.data[0].z/**/;
/*131*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*132*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*133*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*134*/	    r11.w = -cb1.data[0].w/**/;
/*135*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*136*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*137*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*138*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*139*/	    r9.x = r10.x;
/*140*/	    r9.y = r12.x;
/*141*/	    r9.z = r11.x;
/*142*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*143*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*144*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*145*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*146*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*147*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*148*/	    r3.w = -r7.x + r7.z;
/*149*/	    r3.w = r7.y * r3.w + r7.x;
/*150*/	  } else {
/*151*/	    r3.w = 1.000000;
/*152*/	  }
/*153*/	} else {
/*154*/	  r3.w = 1.000000;
/*155*/	}
/*156*/	r4.w = cb1.data[34].w + -1.000000;
/*157*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*158*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*159*/	if(floatBitsToUint(r2.z) == 0u) {
/*160*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*161*/	  r2.z = floatBitsToInt(r2.z);
/*162*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*163*/	  if(floatBitsToUint(r2.z) != 0u) {
/*164*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*165*/	    r6.w = vsOut_T0.w;
/*166*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*167*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*168*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*169*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*170*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*171*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*172*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*173*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*174*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*175*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*176*/	    if(floatBitsToUint(r6.w) == 0u) {
/*177*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*178*/	      r7.xy = floor((r6.xyxx).xy);
/*179*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*180*/	      r2.z = -0.000400 / r2.z;
/*181*/	      r2.z = r2.z + r6.z;
/*182*/	      r8.z = -r8.y + 1.000000;
/*183*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*184*/	      r8.w = -r8.y;
/*185*/	      r10.x = cb1.data[0].z/**/;
/*186*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*187*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*188*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*189*/	      r10.w = -cb1.data[0].w/**/;
/*190*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*191*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*192*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*193*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*194*/	      r8.x = r9.x;
/*195*/	      r8.y = r11.x;
/*196*/	      r8.z = r10.x;
/*197*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*198*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*199*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*200*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*201*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*202*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*203*/	      r2.z = -r6.x + r6.z;
/*204*/	      r2.z = r6.y * r2.z + r6.x;
/*205*/	    } else {
/*206*/	      r2.z = 1.000000;
/*207*/	    }
/*208*/	  } else {
/*209*/	    r2.z = 1.000000;
/*210*/	  }
/*211*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*212*/	  r6.y = r6.x * cb1.data[34].x;
/*213*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*214*/	  r6.x = r2.x + -r6.x;
/*215*/	  r6.x = saturate(r6.x / r6.y);
/*216*/	  r2.z = -r3.w + r2.z;
/*217*/	  r3.w = r6.x * r2.z + r3.w;
/*218*/	}
/*219*/	if(floatBitsToUint(r4.w) != 0u) {
/*220*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*221*/	  r4.w = r2.z * cb1.data[34].y;
/*222*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*223*/	  r2.z = -r2.z + r2.x;
/*224*/	  r2.z = saturate(r2.z / r4.w);
/*225*/	  r2.w = -r3.w + 1.000000;
/*226*/	  r3.w = r2.z * r2.w + r3.w;
/*227*/	}
/*228*/	r3.w = saturate(r3.w);
/*229*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*230*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*231*/	r2.z = inversesqrt(r2.z);
/*232*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*233*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*234*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*235*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*236*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*237*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*238*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*239*/	r2.w = r2.z * r8.x + 0.300000;
/*240*/	r2.w = saturate(-r2.w + 1.000000);
/*241*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*242*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*243*/	r4.w = -r2.z * r8.x + 1.000000;
/*244*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*245*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*246*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*247*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*248*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*249*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*250*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*251*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*252*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*253*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*254*/	r2.w = saturate(r2.z);
/*255*/	r2.w = r2.w * r2.w;
/*256*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*257*/	r4.w = r4.w * r4.w;
/*258*/	r4.w = r4.w * r4.w;
/*259*/	r2.w = r2.w * r4.w;
/*260*/	r2.w = r4.z * r2.w;
/*261*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*262*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*263*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*264*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*265*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*266*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*267*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*268*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*269*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*270*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*271*/	r2.w = inversesqrt(r2.w);
/*272*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*273*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*274*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*275*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*276*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*277*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*278*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*279*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*280*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*281*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*282*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*283*/	r2.w = r7.z * r7.x;
/*284*/	r2.y = r2.y * r2.y;
/*285*/	r2.z = r2.z + r2.z;
/*286*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*287*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*288*/	r2.z = max(r2.z, 0.000000);
/*289*/	r2.y = r2.y * 127.000000 + 1.600000;
/*290*/	r2.z = log2(r2.z);
/*291*/	r2.y = r2.z * r2.y;
/*292*/	r2.y = exp2(r2.y);
/*293*/	r2.y = min(r2.y, 1.000000);
/*294*/	r1.w = r1.w * r2.y;
/*295*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*296*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*297*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*298*/	r2.y = r1.w + r1.w;
/*299*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*300*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*301*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*302*/	r2.y = inversesqrt(r2.y);
/*303*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*304*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*305*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*306*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*307*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*308*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*309*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*310*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*311*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*312*/	r1.w = saturate(-r1.w + 1.000000);
/*313*/	r1.w = r1.w * r1.w;
/*314*/	r1.w = r4.x * r1.w;
/*315*/	r1.w = r1.w * 1.500000;
/*316*/	r1.w = r7.w * r1.w;
/*317*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*318*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*319*/	r0.w = inversesqrt(r0.w);
/*320*/	r0.w = r0.w * r1.y;
/*321*/	r0.w = max(r0.w, 0.000000);
/*322*/	r0.w = r0.w * r1.w;
/*323*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*324*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*325*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*326*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*327*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*328*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*329*/	r0.xy = (r0.xyxx / r2.xxxx).xy;
/*330*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*331*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*332*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*333*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*334*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*335*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*336*/	if(r0.x != 0) discard;
/*337*/	color0.w = 1.000000;
/*338*/	color1.x = 1.000000;
/*339*/	return;
}
