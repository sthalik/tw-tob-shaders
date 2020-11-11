//
//
// Shader Model 4
// Fragment Shader
//
// id: 7002 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalburn.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r2.z = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*30*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*31*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*32*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*33*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*34*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*35*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*36*/	r4.z = vsOut_T6.z;
/*37*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*38*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*39*/	if(floatBitsToUint(r0.w) != 0u) {
/*40*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*41*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*43*/	  r0.w = -r0.w + 1.000000;
/*44*/	  r0.w = max(r0.w, 0.000000);
/*45*/	  r4.z = sqrt(r0.w);
/*46*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*48*/	  r0.w = r3.x * r7.w;
/*49*/	  r3.x = r0.w * -0.500000 + r3.x;
/*50*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*51*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*52*/	  r0.w = -r5.w * r6.w + 1.000000;
/*53*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*54*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*55*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*56*/	}
/*57*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*58*/	r4.x = r3.z;
/*59*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*60*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*61*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*62*/	r0.w = saturate(r4.x * 5.000000);
/*63*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*64*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*65*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*66*/	r1.w = log2(r5.z);
/*67*/	r1.w = r1.w * 1.800000;
/*68*/	r1.w = exp2(r1.w);
/*69*/	r1.w = r1.w * 10.000000;
/*70*/	r1.w = min(r1.w, 1.000000);
/*71*/	r0.w = r0.w + r1.w;
/*72*/	r0.w = r0.w * 0.500000;
/*73*/	r1.w = -r5.w + 1.000000;
/*74*/	r1.w = log2(r1.w);
/*75*/	r1.w = r1.w * vsOut_T7.z;
/*76*/	r1.w = exp2(r1.w);
/*77*/	r1.w = min(r1.w, 1.000000);
/*78*/	r1.w = r1.w * vsOut_T7.z;
/*79*/	r2.w = r5.z * 0.250000;
/*80*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*81*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*82*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*83*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*84*/	r0.w = vsOut_T7.z + -0.025000;
/*85*/	r0.w = max(r0.w, 0.000000);
/*86*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*87*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*88*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*89*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*90*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*91*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*92*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*93*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*94*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*95*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*96*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*97*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*98*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*99*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*100*/	r1.w = inversesqrt(r1.w);
/*101*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*102*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*103*/	r1.w = inversesqrt(r1.w);
/*104*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*105*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*106*/	r1.w = inversesqrt(r1.w);
/*107*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*108*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*109*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*110*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*111*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*112*/	r1.w = inversesqrt(r1.w);
/*113*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*114*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*115*/	r4.w = 1.000000;
/*116*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*117*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*118*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*119*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*120*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*121*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*122*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*123*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*124*/	r3.x = intBitsToFloat(int(r2.w));
/*125*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*126*/	if(floatBitsToUint(r3.z) != 0u) {
/*127*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*128*/	  r5.w = vsOut_T0.w;
/*129*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*130*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*131*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*132*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*133*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*134*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*135*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*136*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*137*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*138*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*139*/	  if(floatBitsToUint(r3.w) == 0u) {
/*140*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*141*/	    r7.xy = floor((r6.xyxx).xy);
/*142*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*143*/	    r3.z = -0.000400 / r3.z;
/*144*/	    r3.z = r3.z + r6.z;
/*145*/	    r8.z = -r8.y + 1.000000;
/*146*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*147*/	    r8.w = -r8.y;
/*148*/	    r10.x = cb1.data[0].z/**/;
/*149*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*150*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*151*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*152*/	    r10.w = -cb1.data[0].w/**/;
/*153*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*154*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*155*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*156*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*157*/	    r8.x = r9.x;
/*158*/	    r8.y = r11.x;
/*159*/	    r8.z = r10.x;
/*160*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*161*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*162*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*163*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*164*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*165*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*166*/	    r3.z = -r6.x + r6.y;
/*167*/	    r3.z = r3.w * r3.z + r6.x;
/*168*/	  } else {
/*169*/	    r3.z = 1.000000;
/*170*/	  }
/*171*/	} else {
/*172*/	  r3.z = 1.000000;
/*173*/	}
/*174*/	r3.w = cb1.data[34].w + -1.000000;
/*175*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*176*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*177*/	if(floatBitsToUint(r2.w) == 0u) {
/*178*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*179*/	  r2.w = floatBitsToInt(r2.w);
/*180*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*181*/	  if(floatBitsToUint(r2.w) != 0u) {
/*182*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*183*/	    r5.w = vsOut_T0.w;
/*184*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*185*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*186*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*187*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*188*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*189*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*190*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*191*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*192*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*193*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*194*/	    if(floatBitsToUint(r5.w) == 0u) {
/*195*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*196*/	      r6.xy = floor((r5.xyxx).xy);
/*197*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*198*/	      r2.w = -0.000400 / r2.w;
/*199*/	      r2.w = r2.w + r5.z;
/*200*/	      r7.z = -r7.y + 1.000000;
/*201*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*202*/	      r7.w = -r7.y;
/*203*/	      r9.x = cb1.data[0].z/**/;
/*204*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*205*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*206*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*207*/	      r9.w = -cb1.data[0].w/**/;
/*208*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*209*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*210*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*211*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*212*/	      r7.x = r8.x;
/*213*/	      r7.y = r10.x;
/*214*/	      r7.z = r9.x;
/*215*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*216*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*217*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*218*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*219*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*220*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*221*/	      r2.w = -r5.x + r5.z;
/*222*/	      r2.w = r5.y * r2.w + r5.x;
/*223*/	    } else {
/*224*/	      r2.w = 1.000000;
/*225*/	    }
/*226*/	  } else {
/*227*/	    r2.w = 1.000000;
/*228*/	  }
/*229*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*230*/	  r5.y = r5.x * cb1.data[34].x;
/*231*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*232*/	  r5.x = r1.w + -r5.x;
/*233*/	  r5.x = saturate(r5.x / r5.y);
/*234*/	  r2.w = -r3.z + r2.w;
/*235*/	  r3.z = r5.x * r2.w + r3.z;
/*236*/	}
/*237*/	if(floatBitsToUint(r3.w) != 0u) {
/*238*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*239*/	  r3.w = r2.w * cb1.data[34].y;
/*240*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*241*/	  r2.w = r1.w + -r2.w;
/*242*/	  r2.w = saturate(r2.w / r3.w);
/*243*/	  r3.x = -r3.z + 1.000000;
/*244*/	  r3.z = r2.w * r3.x + r3.z;
/*245*/	}
/*246*/	r3.z = saturate(r3.z);
/*247*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*248*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*249*/	r2.w = inversesqrt(r2.w);
/*250*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*251*/	r2.w = -r3.y + 1.000000;
/*252*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*253*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*254*/	r3.w = r3.w + r3.w;
/*255*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*256*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*257*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*258*/	r3.w = cos((r8.x));
/*259*/	r3.w = inversesqrt(r3.w);
/*260*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*261*/	r5.w = saturate(r0.w * 60.000000);
/*262*/	r5.w = -r0.w + r5.w;
/*263*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*264*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*265*/	r6.w = inversesqrt(r6.w);
/*266*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*267*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*268*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*269*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*270*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*271*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*272*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*273*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*274*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*275*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*276*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*277*/	r6.w = -r0.w + 1.000000;
/*278*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*279*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*280*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*281*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*282*/	  r6.w = max(r6.w, 0.000000);
/*283*/	  r6.w = log2(r6.w);
/*284*/	  r6.w = r6.w * 10.000000;
/*285*/	  r6.w = exp2(r6.w);
/*286*/	  r6.w = r3.w * r6.w;
/*287*/	  r6.w = r6.w * r5.w + r0.w;
/*288*/	  r7.y = r2.w * 8.000000;
/*289*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*290*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*291*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*292*/	}
/*293*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*294*/	r7.y = max(r6.w, 0.000000);
/*295*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*296*/	if(floatBitsToUint(r6.w) != 0u) {
/*297*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*298*/	  r6.x = max(r6.x, -1.000000);
/*299*/	  r6.x = min(r6.x, 1.000000);
/*300*/	  r6.y = -abs(r6.x) + 1.000000;
/*301*/	  r6.y = sqrt(r6.y);
/*302*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*303*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*304*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*305*/	  r6.w = r6.y * r6.z;
/*306*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*307*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*308*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*309*/	  r6.x = r6.z * r6.y + r6.x;
/*310*/	  r3.y = r3.y * r3.y;
/*311*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*312*/	  r3.x = r3.y * r3.x + r7.x;
/*313*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*314*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*315*/	  r3.y = -r3.x * r3.x + 1.000000;
/*316*/	  r3.y = max(r3.y, 0.001000);
/*317*/	  r3.y = log2(r3.y);
/*318*/	  r6.y = r3.y * 4.950617;
/*319*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*320*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*321*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*322*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*323*/	  r3.x = floatBitsToInt(r3.x);
/*324*/	  r6.y = r3.y * r3.y + -r6.y;
/*325*/	  r6.y = sqrt(r6.y);
/*326*/	  r3.y = -r3.y + r6.y;
/*327*/	  r3.y = max(r3.y, 0.000000);
/*328*/	  r3.y = sqrt(r3.y);
/*329*/	  r3.x = r3.y * r3.x;
/*330*/	  r3.x = r3.x * 1.414214;
/*331*/	  r3.x = 0.008727 / r3.x;
/*332*/	  r3.x = max(r3.x, 0.000100);
/*333*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*334*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*335*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*336*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*337*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*338*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*339*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*340*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*341*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*342*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*343*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*344*/	  r3.x = floatBitsToInt(r3.x);
/*345*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*346*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*347*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*348*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*349*/	  r3.x = r3.x * r6.x + 1.000000;
/*350*/	  r3.x = r3.x * 0.500000;
/*351*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*352*/	  r3.y = r3.y * r6.y + 1.000000;
/*353*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*354*/	  r3.y = min(r7.y, 1.000000);
/*355*/	  r2.w = r2.w * 1.570796;
/*356*/	  r2.w = sin(r2.w);
/*357*/	  r3.y = r3.y + -1.000000;
/*358*/	  r2.w = r2.w * r3.y + 1.000000;
/*359*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*360*/	  r3.y = max(r3.y, 0.000000);
/*361*/	  r3.y = log2(r3.y);
/*362*/	  r3.y = r3.y * 10.000000;
/*363*/	  r3.y = exp2(r3.y);
/*364*/	  r3.y = r3.w * r3.y;
/*365*/	  r3.y = r3.y * r5.w + r0.w;
/*366*/	  r2.w = r2.w * abs(r3.x);
/*367*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*368*/	} else {
/*369*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*370*/	}
/*371*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*372*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*373*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*374*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*375*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*376*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*377*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*378*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*379*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*380*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*381*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*382*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*383*/	r2.w = inversesqrt(r2.w);
/*384*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*385*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*386*/	r2.w = r2.w + r2.w;
/*387*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*388*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*389*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*390*/	r2.x = max(r2.x, 0.000000);
/*391*/	r2.x = log2(r2.x);
/*392*/	r2.x = r2.x * 10.000000;
/*393*/	r2.x = exp2(r2.x);
/*394*/	r2.x = r3.w * r2.x;
/*395*/	r0.w = r2.x * r5.w + r0.w;
/*396*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*397*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*398*/	color0.w = 2.000000;
/*399*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*400*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*401*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*402*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*403*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*404*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*405*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*406*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*407*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*408*/	if(r0.x != 0) discard;
/*409*/	color1.x = 1.000000;
/*410*/	return;
}
