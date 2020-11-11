//
//
// Shader Model 4
// Fragment Shader
//
// id: 7004 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalburn.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r2.z = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*15*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*16*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*17*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*20*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*21*/	r4.z = vsOut_T6.z;
/*22*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*23*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*24*/	if(floatBitsToUint(r0.w) != 0u) {
/*25*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*26*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*27*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*28*/	  r0.w = -r0.w + 1.000000;
/*29*/	  r0.w = max(r0.w, 0.000000);
/*30*/	  r4.z = sqrt(r0.w);
/*31*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*33*/	  r0.w = r3.x * r7.w;
/*34*/	  r3.x = r0.w * -0.500000 + r3.x;
/*35*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*36*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*37*/	  r0.w = -r5.w * r6.w + 1.000000;
/*38*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*39*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*40*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*41*/	}
/*42*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*43*/	r4.x = r3.z;
/*44*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*45*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*46*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*47*/	r0.w = saturate(r4.x * 5.000000);
/*48*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*49*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*50*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*51*/	r1.w = log2(r5.z);
/*52*/	r1.w = r1.w * 1.800000;
/*53*/	r1.w = exp2(r1.w);
/*54*/	r1.w = r1.w * 10.000000;
/*55*/	r1.w = min(r1.w, 1.000000);
/*56*/	r0.w = r0.w + r1.w;
/*57*/	r0.w = r0.w * 0.500000;
/*58*/	r1.w = -r5.w + 1.000000;
/*59*/	r1.w = log2(r1.w);
/*60*/	r1.w = r1.w * vsOut_T7.z;
/*61*/	r1.w = exp2(r1.w);
/*62*/	r1.w = min(r1.w, 1.000000);
/*63*/	r1.w = r1.w * vsOut_T7.z;
/*64*/	r2.w = r5.z * 0.250000;
/*65*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*66*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*67*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*68*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*69*/	r0.w = vsOut_T7.z + -0.025000;
/*70*/	r0.w = max(r0.w, 0.000000);
/*71*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*72*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*73*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*75*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*76*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*78*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*79*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*80*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*81*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*82*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*83*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*84*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*85*/	r1.w = inversesqrt(r1.w);
/*86*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*87*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*90*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*93*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*94*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*95*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*96*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*97*/	r1.w = inversesqrt(r1.w);
/*98*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*99*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*100*/	r4.w = 1.000000;
/*101*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*102*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*103*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*104*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*105*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*106*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*107*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*108*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*109*/	r3.x = intBitsToFloat(int(r2.w));
/*110*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*111*/	if(floatBitsToUint(r3.z) != 0u) {
/*112*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*113*/	  r5.w = vsOut_T0.w;
/*114*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*115*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*116*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*117*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*118*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*119*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*120*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*121*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*122*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*123*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*124*/	  if(floatBitsToUint(r3.w) == 0u) {
/*125*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*126*/	    r7.xy = floor((r6.xyxx).xy);
/*127*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*128*/	    r3.z = -0.000400 / r3.z;
/*129*/	    r3.z = r3.z + r6.z;
/*130*/	    r8.z = -r8.y + 1.000000;
/*131*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*132*/	    r8.w = -r8.y;
/*133*/	    r10.x = cb1.data[0].z/**/;
/*134*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*135*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*136*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*137*/	    r10.w = -cb1.data[0].w/**/;
/*138*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*139*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*140*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*141*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*142*/	    r8.x = r9.x;
/*143*/	    r8.y = r11.x;
/*144*/	    r8.z = r10.x;
/*145*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*146*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*147*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*148*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*149*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*150*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*151*/	    r3.z = -r6.x + r6.y;
/*152*/	    r3.z = r3.w * r3.z + r6.x;
/*153*/	  } else {
/*154*/	    r3.z = 1.000000;
/*155*/	  }
/*156*/	} else {
/*157*/	  r3.z = 1.000000;
/*158*/	}
/*159*/	r3.w = cb1.data[34].w + -1.000000;
/*160*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*161*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*162*/	if(floatBitsToUint(r2.w) == 0u) {
/*163*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*164*/	  r2.w = floatBitsToInt(r2.w);
/*165*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*166*/	  if(floatBitsToUint(r2.w) != 0u) {
/*167*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*168*/	    r5.w = vsOut_T0.w;
/*169*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*170*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*171*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*172*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*173*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*174*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*175*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*176*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*177*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*178*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*179*/	    if(floatBitsToUint(r5.w) == 0u) {
/*180*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*181*/	      r6.xy = floor((r5.xyxx).xy);
/*182*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*183*/	      r2.w = -0.000400 / r2.w;
/*184*/	      r2.w = r2.w + r5.z;
/*185*/	      r7.z = -r7.y + 1.000000;
/*186*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*187*/	      r7.w = -r7.y;
/*188*/	      r9.x = cb1.data[0].z/**/;
/*189*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*190*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*191*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*192*/	      r9.w = -cb1.data[0].w/**/;
/*193*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*194*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*195*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*196*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*197*/	      r7.x = r8.x;
/*198*/	      r7.y = r10.x;
/*199*/	      r7.z = r9.x;
/*200*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*201*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*202*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*203*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*204*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*205*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*206*/	      r2.w = -r5.x + r5.z;
/*207*/	      r2.w = r5.y * r2.w + r5.x;
/*208*/	    } else {
/*209*/	      r2.w = 1.000000;
/*210*/	    }
/*211*/	  } else {
/*212*/	    r2.w = 1.000000;
/*213*/	  }
/*214*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*215*/	  r5.y = r5.x * cb1.data[34].x;
/*216*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*217*/	  r5.x = r1.w + -r5.x;
/*218*/	  r5.x = saturate(r5.x / r5.y);
/*219*/	  r2.w = -r3.z + r2.w;
/*220*/	  r3.z = r5.x * r2.w + r3.z;
/*221*/	}
/*222*/	if(floatBitsToUint(r3.w) != 0u) {
/*223*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*224*/	  r3.w = r2.w * cb1.data[34].y;
/*225*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*226*/	  r2.w = r1.w + -r2.w;
/*227*/	  r2.w = saturate(r2.w / r3.w);
/*228*/	  r3.x = -r3.z + 1.000000;
/*229*/	  r3.z = r2.w * r3.x + r3.z;
/*230*/	}
/*231*/	r3.z = saturate(r3.z);
/*232*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*233*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*234*/	r2.w = inversesqrt(r2.w);
/*235*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*236*/	r2.w = -r3.y + 1.000000;
/*237*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*238*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*239*/	r3.w = r3.w + r3.w;
/*240*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*241*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*242*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*243*/	r3.w = cos((r8.x));
/*244*/	r3.w = inversesqrt(r3.w);
/*245*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*246*/	r5.w = saturate(r0.w * 60.000000);
/*247*/	r5.w = -r0.w + r5.w;
/*248*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*249*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*250*/	r6.w = inversesqrt(r6.w);
/*251*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*252*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*253*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*254*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*255*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*256*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*257*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*258*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*259*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*260*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*261*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*262*/	r6.w = -r0.w + 1.000000;
/*263*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*264*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*265*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*266*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*267*/	  r6.w = max(r6.w, 0.000000);
/*268*/	  r6.w = log2(r6.w);
/*269*/	  r6.w = r6.w * 10.000000;
/*270*/	  r6.w = exp2(r6.w);
/*271*/	  r6.w = r3.w * r6.w;
/*272*/	  r6.w = r6.w * r5.w + r0.w;
/*273*/	  r7.y = r2.w * 8.000000;
/*274*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*275*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*276*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*277*/	}
/*278*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*279*/	r7.y = max(r6.w, 0.000000);
/*280*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*281*/	if(floatBitsToUint(r6.w) != 0u) {
/*282*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*283*/	  r6.x = max(r6.x, -1.000000);
/*284*/	  r6.x = min(r6.x, 1.000000);
/*285*/	  r6.y = -abs(r6.x) + 1.000000;
/*286*/	  r6.y = sqrt(r6.y);
/*287*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*288*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*289*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*290*/	  r6.w = r6.y * r6.z;
/*291*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*292*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*293*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*294*/	  r6.x = r6.z * r6.y + r6.x;
/*295*/	  r3.y = r3.y * r3.y;
/*296*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*297*/	  r3.x = r3.y * r3.x + r7.x;
/*298*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*299*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*300*/	  r3.y = -r3.x * r3.x + 1.000000;
/*301*/	  r3.y = max(r3.y, 0.001000);
/*302*/	  r3.y = log2(r3.y);
/*303*/	  r6.y = r3.y * 4.950617;
/*304*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*305*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*306*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*307*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*308*/	  r3.x = floatBitsToInt(r3.x);
/*309*/	  r6.y = r3.y * r3.y + -r6.y;
/*310*/	  r6.y = sqrt(r6.y);
/*311*/	  r3.y = -r3.y + r6.y;
/*312*/	  r3.y = max(r3.y, 0.000000);
/*313*/	  r3.y = sqrt(r3.y);
/*314*/	  r3.x = r3.y * r3.x;
/*315*/	  r3.x = r3.x * 1.414214;
/*316*/	  r3.x = 0.008727 / r3.x;
/*317*/	  r3.x = max(r3.x, 0.000100);
/*318*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*319*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*320*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*321*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*322*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*323*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*324*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*325*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*326*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*327*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*328*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*329*/	  r3.x = floatBitsToInt(r3.x);
/*330*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*331*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*332*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*333*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*334*/	  r3.x = r3.x * r6.x + 1.000000;
/*335*/	  r3.x = r3.x * 0.500000;
/*336*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*337*/	  r3.y = r3.y * r6.y + 1.000000;
/*338*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*339*/	  r3.y = min(r7.y, 1.000000);
/*340*/	  r2.w = r2.w * 1.570796;
/*341*/	  r2.w = sin(r2.w);
/*342*/	  r3.y = r3.y + -1.000000;
/*343*/	  r2.w = r2.w * r3.y + 1.000000;
/*344*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*345*/	  r3.y = max(r3.y, 0.000000);
/*346*/	  r3.y = log2(r3.y);
/*347*/	  r3.y = r3.y * 10.000000;
/*348*/	  r3.y = exp2(r3.y);
/*349*/	  r3.y = r3.w * r3.y;
/*350*/	  r3.y = r3.y * r5.w + r0.w;
/*351*/	  r2.w = r2.w * abs(r3.x);
/*352*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*353*/	} else {
/*354*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*355*/	}
/*356*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*357*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*358*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*359*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*360*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*361*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*362*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*363*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*364*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*365*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*366*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*367*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*368*/	r2.w = inversesqrt(r2.w);
/*369*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*370*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*371*/	r2.w = r2.w + r2.w;
/*372*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*373*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*374*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*375*/	r2.x = max(r2.x, 0.000000);
/*376*/	r2.x = log2(r2.x);
/*377*/	r2.x = r2.x * 10.000000;
/*378*/	r2.x = exp2(r2.x);
/*379*/	r2.x = r3.w * r2.x;
/*380*/	r0.w = r2.x * r5.w + r0.w;
/*381*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*382*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*383*/	color0.w = 2.000000;
/*384*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*385*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*386*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*387*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*388*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*389*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*390*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*391*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*392*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*393*/	if(r0.x != 0) discard;
/*394*/	color1.x = 1.000000;
/*395*/	return;
}
