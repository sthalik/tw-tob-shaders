//
//
// Shader Model 4
// Fragment Shader
//
// id: 7006 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalburn.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
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

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r2.z = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*12*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*14*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*18*/	r4.z = vsOut_T6.z;
/*19*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*20*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*21*/	if(floatBitsToUint(r0.w) != 0u) {
/*22*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*23*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*25*/	  r0.w = -r0.w + 1.000000;
/*26*/	  r0.w = max(r0.w, 0.000000);
/*27*/	  r4.z = sqrt(r0.w);
/*28*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*30*/	  r0.w = r3.x * r7.w;
/*31*/	  r3.x = r0.w * -0.500000 + r3.x;
/*32*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*33*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*34*/	  r0.w = -r5.w * r6.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*36*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*37*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*38*/	}
/*39*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*40*/	r4.x = r3.z;
/*41*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*42*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*43*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*44*/	r0.w = saturate(r4.x * 5.000000);
/*45*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*46*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*47*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*48*/	r1.w = log2(r5.z);
/*49*/	r1.w = r1.w * 1.800000;
/*50*/	r1.w = exp2(r1.w);
/*51*/	r1.w = r1.w * 10.000000;
/*52*/	r1.w = min(r1.w, 1.000000);
/*53*/	r0.w = r0.w + r1.w;
/*54*/	r0.w = r0.w * 0.500000;
/*55*/	r1.w = -r5.w + 1.000000;
/*56*/	r1.w = log2(r1.w);
/*57*/	r1.w = r1.w * vsOut_T7.z;
/*58*/	r1.w = exp2(r1.w);
/*59*/	r1.w = min(r1.w, 1.000000);
/*60*/	r1.w = r1.w * vsOut_T7.z;
/*61*/	r2.w = r5.z * 0.250000;
/*62*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*63*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*64*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*65*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*66*/	r0.w = vsOut_T7.z + -0.025000;
/*67*/	r0.w = max(r0.w, 0.000000);
/*68*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*69*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*70*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*71*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*72*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*73*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*75*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*76*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*77*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*78*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*79*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*80*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*81*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*82*/	r1.w = inversesqrt(r1.w);
/*83*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*84*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*87*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*90*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*91*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*92*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*93*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*94*/	r1.w = inversesqrt(r1.w);
/*95*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*96*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*97*/	r4.w = 1.000000;
/*98*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*99*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*100*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*101*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*102*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*103*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*104*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*105*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*106*/	r3.x = intBitsToFloat(int(r2.w));
/*107*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*108*/	if(floatBitsToUint(r3.z) != 0u) {
/*109*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*110*/	  r5.w = vsOut_T0.w;
/*111*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*112*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*113*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*114*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*115*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*116*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*117*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*118*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*119*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*120*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*121*/	  if(floatBitsToUint(r3.w) == 0u) {
/*122*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*123*/	    r7.xy = floor((r6.xyxx).xy);
/*124*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*125*/	    r3.z = -0.000400 / r3.z;
/*126*/	    r3.z = r3.z + r6.z;
/*127*/	    r8.z = -r8.y + 1.000000;
/*128*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*129*/	    r8.w = -r8.y;
/*130*/	    r10.x = cb1.data[0].z/**/;
/*131*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*132*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*133*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*134*/	    r10.w = -cb1.data[0].w/**/;
/*135*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*136*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*137*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*138*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*139*/	    r8.x = r9.x;
/*140*/	    r8.y = r11.x;
/*141*/	    r8.z = r10.x;
/*142*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*143*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*144*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*145*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*146*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*147*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*148*/	    r3.z = -r6.x + r6.y;
/*149*/	    r3.z = r3.w * r3.z + r6.x;
/*150*/	  } else {
/*151*/	    r3.z = 1.000000;
/*152*/	  }
/*153*/	} else {
/*154*/	  r3.z = 1.000000;
/*155*/	}
/*156*/	r3.w = cb1.data[34].w + -1.000000;
/*157*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*158*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*159*/	if(floatBitsToUint(r2.w) == 0u) {
/*160*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*161*/	  r2.w = floatBitsToInt(r2.w);
/*162*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*163*/	  if(floatBitsToUint(r2.w) != 0u) {
/*164*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*165*/	    r5.w = vsOut_T0.w;
/*166*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*167*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*168*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*169*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*170*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*171*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*172*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*173*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*174*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*175*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*176*/	    if(floatBitsToUint(r5.w) == 0u) {
/*177*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*178*/	      r6.xy = floor((r5.xyxx).xy);
/*179*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*180*/	      r2.w = -0.000400 / r2.w;
/*181*/	      r2.w = r2.w + r5.z;
/*182*/	      r7.z = -r7.y + 1.000000;
/*183*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*184*/	      r7.w = -r7.y;
/*185*/	      r9.x = cb1.data[0].z/**/;
/*186*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*187*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*188*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*189*/	      r9.w = -cb1.data[0].w/**/;
/*190*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*191*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*192*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*193*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*194*/	      r7.x = r8.x;
/*195*/	      r7.y = r10.x;
/*196*/	      r7.z = r9.x;
/*197*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*198*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*199*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*200*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*201*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*202*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*203*/	      r2.w = -r5.x + r5.z;
/*204*/	      r2.w = r5.y * r2.w + r5.x;
/*205*/	    } else {
/*206*/	      r2.w = 1.000000;
/*207*/	    }
/*208*/	  } else {
/*209*/	    r2.w = 1.000000;
/*210*/	  }
/*211*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*212*/	  r5.y = r5.x * cb1.data[34].x;
/*213*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*214*/	  r5.x = r1.w + -r5.x;
/*215*/	  r5.x = saturate(r5.x / r5.y);
/*216*/	  r2.w = -r3.z + r2.w;
/*217*/	  r3.z = r5.x * r2.w + r3.z;
/*218*/	}
/*219*/	if(floatBitsToUint(r3.w) != 0u) {
/*220*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*221*/	  r3.w = r2.w * cb1.data[34].y;
/*222*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*223*/	  r2.w = r1.w + -r2.w;
/*224*/	  r2.w = saturate(r2.w / r3.w);
/*225*/	  r3.x = -r3.z + 1.000000;
/*226*/	  r3.z = r2.w * r3.x + r3.z;
/*227*/	}
/*228*/	r3.z = saturate(r3.z);
/*229*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*230*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*231*/	r2.w = inversesqrt(r2.w);
/*232*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*233*/	r2.w = -r3.y + 1.000000;
/*234*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*235*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*236*/	r3.w = r3.w + r3.w;
/*237*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*238*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*239*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*240*/	r3.w = cos((r8.x));
/*241*/	r3.w = inversesqrt(r3.w);
/*242*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*243*/	r5.w = saturate(r0.w * 60.000000);
/*244*/	r5.w = -r0.w + r5.w;
/*245*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*246*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*247*/	r6.w = inversesqrt(r6.w);
/*248*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*249*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*250*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*251*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*252*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*253*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*254*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*255*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*256*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*257*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*258*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*259*/	r6.w = -r0.w + 1.000000;
/*260*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*261*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*262*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*263*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*264*/	  r6.w = max(r6.w, 0.000000);
/*265*/	  r6.w = log2(r6.w);
/*266*/	  r6.w = r6.w * 10.000000;
/*267*/	  r6.w = exp2(r6.w);
/*268*/	  r6.w = r3.w * r6.w;
/*269*/	  r6.w = r6.w * r5.w + r0.w;
/*270*/	  r7.y = r2.w * 8.000000;
/*271*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*272*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*273*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*274*/	}
/*275*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*276*/	r7.y = max(r6.w, 0.000000);
/*277*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*278*/	if(floatBitsToUint(r6.w) != 0u) {
/*279*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*280*/	  r6.x = max(r6.x, -1.000000);
/*281*/	  r6.x = min(r6.x, 1.000000);
/*282*/	  r6.y = -abs(r6.x) + 1.000000;
/*283*/	  r6.y = sqrt(r6.y);
/*284*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*285*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*286*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*287*/	  r6.w = r6.y * r6.z;
/*288*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*289*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*290*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*291*/	  r6.x = r6.z * r6.y + r6.x;
/*292*/	  r3.y = r3.y * r3.y;
/*293*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*294*/	  r3.x = r3.y * r3.x + r7.x;
/*295*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*296*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*297*/	  r3.y = -r3.x * r3.x + 1.000000;
/*298*/	  r3.y = max(r3.y, 0.001000);
/*299*/	  r3.y = log2(r3.y);
/*300*/	  r6.y = r3.y * 4.950617;
/*301*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*302*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*303*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*304*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*305*/	  r3.x = floatBitsToInt(r3.x);
/*306*/	  r6.y = r3.y * r3.y + -r6.y;
/*307*/	  r6.y = sqrt(r6.y);
/*308*/	  r3.y = -r3.y + r6.y;
/*309*/	  r3.y = max(r3.y, 0.000000);
/*310*/	  r3.y = sqrt(r3.y);
/*311*/	  r3.x = r3.y * r3.x;
/*312*/	  r3.x = r3.x * 1.414214;
/*313*/	  r3.x = 0.008727 / r3.x;
/*314*/	  r3.x = max(r3.x, 0.000100);
/*315*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*316*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*317*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*318*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*319*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*320*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*321*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*322*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*323*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*324*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*325*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*326*/	  r3.x = floatBitsToInt(r3.x);
/*327*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*328*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*329*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*330*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*331*/	  r3.x = r3.x * r6.x + 1.000000;
/*332*/	  r3.x = r3.x * 0.500000;
/*333*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*334*/	  r3.y = r3.y * r6.y + 1.000000;
/*335*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*336*/	  r3.y = min(r7.y, 1.000000);
/*337*/	  r2.w = r2.w * 1.570796;
/*338*/	  r2.w = sin(r2.w);
/*339*/	  r3.y = r3.y + -1.000000;
/*340*/	  r2.w = r2.w * r3.y + 1.000000;
/*341*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*342*/	  r3.y = max(r3.y, 0.000000);
/*343*/	  r3.y = log2(r3.y);
/*344*/	  r3.y = r3.y * 10.000000;
/*345*/	  r3.y = exp2(r3.y);
/*346*/	  r3.y = r3.w * r3.y;
/*347*/	  r3.y = r3.y * r5.w + r0.w;
/*348*/	  r2.w = r2.w * abs(r3.x);
/*349*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*350*/	} else {
/*351*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*352*/	}
/*353*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*354*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*355*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*356*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*357*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*358*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*359*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*360*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*361*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*362*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*363*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*364*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*365*/	r2.w = inversesqrt(r2.w);
/*366*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*367*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*368*/	r2.w = r2.w + r2.w;
/*369*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*370*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*371*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*372*/	r2.x = max(r2.x, 0.000000);
/*373*/	r2.x = log2(r2.x);
/*374*/	r2.x = r2.x * 10.000000;
/*375*/	r2.x = exp2(r2.x);
/*376*/	r2.x = r3.w * r2.x;
/*377*/	r0.w = r2.x * r5.w + r0.w;
/*378*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*379*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*380*/	color0.w = 2.000000;
/*381*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*382*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*383*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*384*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*385*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*386*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*387*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*388*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*389*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*390*/	if(r0.x != 0) discard;
/*391*/	color1.x = 1.000000;
/*392*/	return;
}
