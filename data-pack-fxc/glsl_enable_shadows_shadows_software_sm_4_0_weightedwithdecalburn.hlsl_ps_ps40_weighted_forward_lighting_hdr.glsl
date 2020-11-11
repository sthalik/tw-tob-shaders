//
//
// Shader Model 4
// Fragment Shader
//
// id: 7000 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalburn.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r2.z = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*33*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*34*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*35*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*36*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*37*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*38*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*39*/	r4.z = vsOut_T6.z;
/*40*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*41*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*42*/	if(floatBitsToUint(r0.w) != 0u) {
/*43*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*44*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*46*/	  r0.w = -r0.w + 1.000000;
/*47*/	  r0.w = max(r0.w, 0.000000);
/*48*/	  r4.z = sqrt(r0.w);
/*49*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*51*/	  r0.w = r3.x * r7.w;
/*52*/	  r3.x = r0.w * -0.500000 + r3.x;
/*53*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*54*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*55*/	  r0.w = -r5.w * r6.w + 1.000000;
/*56*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*57*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*58*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*59*/	}
/*60*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*61*/	r4.x = r3.z;
/*62*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*63*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*64*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*65*/	r0.w = saturate(r4.x * 5.000000);
/*66*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*67*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*68*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*69*/	r1.w = log2(r5.z);
/*70*/	r1.w = r1.w * 1.800000;
/*71*/	r1.w = exp2(r1.w);
/*72*/	r1.w = r1.w * 10.000000;
/*73*/	r1.w = min(r1.w, 1.000000);
/*74*/	r0.w = r0.w + r1.w;
/*75*/	r0.w = r0.w * 0.500000;
/*76*/	r1.w = -r5.w + 1.000000;
/*77*/	r1.w = log2(r1.w);
/*78*/	r1.w = r1.w * vsOut_T7.z;
/*79*/	r1.w = exp2(r1.w);
/*80*/	r1.w = min(r1.w, 1.000000);
/*81*/	r1.w = r1.w * vsOut_T7.z;
/*82*/	r2.w = r5.z * 0.250000;
/*83*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*84*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*85*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*86*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*87*/	r0.w = vsOut_T7.z + -0.025000;
/*88*/	r0.w = max(r0.w, 0.000000);
/*89*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*90*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*91*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*92*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*93*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*94*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*95*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*96*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*97*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*98*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*99*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*100*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*101*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*102*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*103*/	r1.w = inversesqrt(r1.w);
/*104*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*105*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*106*/	r1.w = inversesqrt(r1.w);
/*107*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*108*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*109*/	r1.w = inversesqrt(r1.w);
/*110*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*111*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*112*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*113*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*114*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*115*/	r1.w = inversesqrt(r1.w);
/*116*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*117*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*118*/	r4.w = 1.000000;
/*119*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*120*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*121*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*122*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*123*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*124*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*125*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*126*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*127*/	r3.x = intBitsToFloat(int(r2.w));
/*128*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*129*/	if(floatBitsToUint(r3.z) != 0u) {
/*130*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*131*/	  r5.w = vsOut_T0.w;
/*132*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*133*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*134*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*135*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*136*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*137*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*138*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*139*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*140*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*141*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*142*/	  if(floatBitsToUint(r3.w) == 0u) {
/*143*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*144*/	    r7.xy = floor((r6.xyxx).xy);
/*145*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*146*/	    r3.z = -0.000400 / r3.z;
/*147*/	    r3.z = r3.z + r6.z;
/*148*/	    r8.z = -r8.y + 1.000000;
/*149*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*150*/	    r8.w = -r8.y;
/*151*/	    r10.x = cb1.data[0].z/**/;
/*152*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*153*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*154*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*155*/	    r10.w = -cb1.data[0].w/**/;
/*156*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*157*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*158*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*159*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*160*/	    r8.x = r9.x;
/*161*/	    r8.y = r11.x;
/*162*/	    r8.z = r10.x;
/*163*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*164*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*165*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*166*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*167*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*168*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*169*/	    r3.z = -r6.x + r6.y;
/*170*/	    r3.z = r3.w * r3.z + r6.x;
/*171*/	  } else {
/*172*/	    r3.z = 1.000000;
/*173*/	  }
/*174*/	} else {
/*175*/	  r3.z = 1.000000;
/*176*/	}
/*177*/	r3.w = cb1.data[34].w + -1.000000;
/*178*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*179*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*180*/	if(floatBitsToUint(r2.w) == 0u) {
/*181*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*182*/	  r2.w = floatBitsToInt(r2.w);
/*183*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*184*/	  if(floatBitsToUint(r2.w) != 0u) {
/*185*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*186*/	    r5.w = vsOut_T0.w;
/*187*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*188*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*189*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*190*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*191*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*192*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*193*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*194*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*195*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*196*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*197*/	    if(floatBitsToUint(r5.w) == 0u) {
/*198*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*199*/	      r6.xy = floor((r5.xyxx).xy);
/*200*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*201*/	      r2.w = -0.000400 / r2.w;
/*202*/	      r2.w = r2.w + r5.z;
/*203*/	      r7.z = -r7.y + 1.000000;
/*204*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*205*/	      r7.w = -r7.y;
/*206*/	      r9.x = cb1.data[0].z/**/;
/*207*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*208*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*209*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*210*/	      r9.w = -cb1.data[0].w/**/;
/*211*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*212*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*213*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*214*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*215*/	      r7.x = r8.x;
/*216*/	      r7.y = r10.x;
/*217*/	      r7.z = r9.x;
/*218*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*219*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*220*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*221*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*222*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*223*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*224*/	      r2.w = -r5.x + r5.z;
/*225*/	      r2.w = r5.y * r2.w + r5.x;
/*226*/	    } else {
/*227*/	      r2.w = 1.000000;
/*228*/	    }
/*229*/	  } else {
/*230*/	    r2.w = 1.000000;
/*231*/	  }
/*232*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*233*/	  r5.y = r5.x * cb1.data[34].x;
/*234*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*235*/	  r5.x = r1.w + -r5.x;
/*236*/	  r5.x = saturate(r5.x / r5.y);
/*237*/	  r2.w = -r3.z + r2.w;
/*238*/	  r3.z = r5.x * r2.w + r3.z;
/*239*/	}
/*240*/	if(floatBitsToUint(r3.w) != 0u) {
/*241*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*242*/	  r3.w = r2.w * cb1.data[34].y;
/*243*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*244*/	  r2.w = r1.w + -r2.w;
/*245*/	  r2.w = saturate(r2.w / r3.w);
/*246*/	  r3.x = -r3.z + 1.000000;
/*247*/	  r3.z = r2.w * r3.x + r3.z;
/*248*/	}
/*249*/	r3.z = saturate(r3.z);
/*250*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*251*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*252*/	r2.w = inversesqrt(r2.w);
/*253*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*254*/	r2.w = -r3.y + 1.000000;
/*255*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*256*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*257*/	r3.w = r3.w + r3.w;
/*258*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*259*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*260*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*261*/	r3.w = cos((r8.x));
/*262*/	r3.w = inversesqrt(r3.w);
/*263*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*264*/	r5.w = saturate(r0.w * 60.000000);
/*265*/	r5.w = -r0.w + r5.w;
/*266*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*267*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*268*/	r6.w = inversesqrt(r6.w);
/*269*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*270*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*271*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*272*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*273*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*274*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*275*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*276*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*277*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*278*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*279*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*280*/	r6.w = -r0.w + 1.000000;
/*281*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*282*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*283*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*284*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*285*/	  r6.w = max(r6.w, 0.000000);
/*286*/	  r6.w = log2(r6.w);
/*287*/	  r6.w = r6.w * 10.000000;
/*288*/	  r6.w = exp2(r6.w);
/*289*/	  r6.w = r3.w * r6.w;
/*290*/	  r6.w = r6.w * r5.w + r0.w;
/*291*/	  r7.y = r2.w * 8.000000;
/*292*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*293*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*294*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*295*/	}
/*296*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*297*/	r7.y = max(r6.w, 0.000000);
/*298*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*299*/	if(floatBitsToUint(r6.w) != 0u) {
/*300*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*301*/	  r6.x = max(r6.x, -1.000000);
/*302*/	  r6.x = min(r6.x, 1.000000);
/*303*/	  r6.y = -abs(r6.x) + 1.000000;
/*304*/	  r6.y = sqrt(r6.y);
/*305*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*306*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*307*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*308*/	  r6.w = r6.y * r6.z;
/*309*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*310*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*311*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*312*/	  r6.x = r6.z * r6.y + r6.x;
/*313*/	  r3.y = r3.y * r3.y;
/*314*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*315*/	  r3.x = r3.y * r3.x + r7.x;
/*316*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*317*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*318*/	  r3.y = -r3.x * r3.x + 1.000000;
/*319*/	  r3.y = max(r3.y, 0.001000);
/*320*/	  r3.y = log2(r3.y);
/*321*/	  r6.y = r3.y * 4.950617;
/*322*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*323*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*324*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*325*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*326*/	  r3.x = floatBitsToInt(r3.x);
/*327*/	  r6.y = r3.y * r3.y + -r6.y;
/*328*/	  r6.y = sqrt(r6.y);
/*329*/	  r3.y = -r3.y + r6.y;
/*330*/	  r3.y = max(r3.y, 0.000000);
/*331*/	  r3.y = sqrt(r3.y);
/*332*/	  r3.x = r3.y * r3.x;
/*333*/	  r3.x = r3.x * 1.414214;
/*334*/	  r3.x = 0.008727 / r3.x;
/*335*/	  r3.x = max(r3.x, 0.000100);
/*336*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*337*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*338*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*339*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*340*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*341*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*342*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*343*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*344*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*345*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*346*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*347*/	  r3.x = floatBitsToInt(r3.x);
/*348*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*349*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*350*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*351*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*352*/	  r3.x = r3.x * r6.x + 1.000000;
/*353*/	  r3.x = r3.x * 0.500000;
/*354*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*355*/	  r3.y = r3.y * r6.y + 1.000000;
/*356*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*357*/	  r3.y = min(r7.y, 1.000000);
/*358*/	  r2.w = r2.w * 1.570796;
/*359*/	  r2.w = sin(r2.w);
/*360*/	  r3.y = r3.y + -1.000000;
/*361*/	  r2.w = r2.w * r3.y + 1.000000;
/*362*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*363*/	  r3.y = max(r3.y, 0.000000);
/*364*/	  r3.y = log2(r3.y);
/*365*/	  r3.y = r3.y * 10.000000;
/*366*/	  r3.y = exp2(r3.y);
/*367*/	  r3.y = r3.w * r3.y;
/*368*/	  r3.y = r3.y * r5.w + r0.w;
/*369*/	  r2.w = r2.w * abs(r3.x);
/*370*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*371*/	} else {
/*372*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*373*/	}
/*374*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*375*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*376*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*377*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*378*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*379*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*380*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*381*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*382*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*383*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*384*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*385*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*386*/	r2.w = inversesqrt(r2.w);
/*387*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*388*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*389*/	r2.w = r2.w + r2.w;
/*390*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*391*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*392*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*393*/	r2.x = max(r2.x, 0.000000);
/*394*/	r2.x = log2(r2.x);
/*395*/	r2.x = r2.x * 10.000000;
/*396*/	r2.x = exp2(r2.x);
/*397*/	r2.x = r3.w * r2.x;
/*398*/	r0.w = r2.x * r5.w + r0.w;
/*399*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*400*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*401*/	color0.w = 2.000000;
/*402*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*403*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*404*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*405*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*406*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*407*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*408*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*409*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*410*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*411*/	if(r0.x != 0) discard;
/*412*/	color1.x = 1.000000;
/*413*/	return;
}
