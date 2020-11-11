//
//
// Shader Model 4
// Fragment Shader
//
// id: 6859 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;

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
/*26*/	r3.z = sqrt(r0.w);
/*27*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*30*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*31*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*32*/	r0.w = r5.w * r6.w;
/*33*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*35*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*36*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*37*/	r1.w = inversesqrt(r1.w);
/*38*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*39*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*40*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*41*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*42*/	r5.x = r3.x;
/*43*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*44*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*45*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*46*/	r0.w = saturate(r5.x * 5.000000);
/*47*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*48*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*50*/	r1.w = log2(r3.z);
/*51*/	r1.w = r1.w * 1.800000;
/*52*/	r1.w = exp2(r1.w);
/*53*/	r1.w = r1.w * 10.000000;
/*54*/	r1.w = min(r1.w, 1.000000);
/*55*/	r0.w = r0.w + r1.w;
/*56*/	r0.w = r0.w * 0.500000;
/*57*/	r1.w = -r3.w + 1.000000;
/*58*/	r1.w = log2(r1.w);
/*59*/	r1.w = r1.w * vsOut_T7.z;
/*60*/	r1.w = exp2(r1.w);
/*61*/	r1.w = min(r1.w, 1.000000);
/*62*/	r1.w = r1.w * vsOut_T7.z;
/*63*/	r2.w = r3.z * 0.250000;
/*64*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*65*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*66*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*67*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*68*/	r0.w = vsOut_T7.z + -0.025000;
/*69*/	r0.w = max(r0.w, 0.000000);
/*70*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*71*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*72*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*73*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*74*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*75*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*76*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*77*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*78*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*79*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*80*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*81*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*82*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*83*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*86*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*87*/	r1.w = inversesqrt(r1.w);
/*88*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*89*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*90*/	r1.w = inversesqrt(r1.w);
/*91*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*92*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*93*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*94*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*95*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*96*/	r1.w = inversesqrt(r1.w);
/*97*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*98*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*99*/	r3.w = 1.000000;
/*100*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*101*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*102*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*103*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*104*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*105*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*106*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*107*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*108*/	r4.y = intBitsToFloat(int(r2.w));
/*109*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*110*/	if(floatBitsToUint(r4.z) != 0u) {
/*111*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*112*/	  r5.w = vsOut_T0.w;
/*113*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*114*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*115*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*116*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*117*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*118*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*119*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*120*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*121*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*122*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*123*/	  if(floatBitsToUint(r4.w) == 0u) {
/*124*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*125*/	    r7.xy = floor((r6.xyxx).xy);
/*126*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*127*/	    r4.z = -0.000400 / r4.z;
/*128*/	    r4.z = r4.z + r6.z;
/*129*/	    r8.z = -r8.y + 1.000000;
/*130*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*131*/	    r8.w = -r8.y;
/*132*/	    r10.x = cb1.data[0].z/**/;
/*133*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*134*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*135*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*136*/	    r10.w = -cb1.data[0].w/**/;
/*137*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*138*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*139*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*140*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*141*/	    r8.x = r9.x;
/*142*/	    r8.y = r11.x;
/*143*/	    r8.z = r10.x;
/*144*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*145*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*146*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*147*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*148*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*149*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*150*/	    r4.z = -r6.x + r6.y;
/*151*/	    r4.z = r4.w * r4.z + r6.x;
/*152*/	  } else {
/*153*/	    r4.z = 1.000000;
/*154*/	  }
/*155*/	} else {
/*156*/	  r4.z = 1.000000;
/*157*/	}
/*158*/	r4.w = cb1.data[34].w + -1.000000;
/*159*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*160*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*161*/	if(floatBitsToUint(r2.w) == 0u) {
/*162*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*163*/	  r2.w = floatBitsToInt(r2.w);
/*164*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*165*/	  if(floatBitsToUint(r2.w) != 0u) {
/*166*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*167*/	    r5.w = vsOut_T0.w;
/*168*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*169*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*170*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*171*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*172*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*173*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*174*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*175*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*176*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*177*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*178*/	    if(floatBitsToUint(r5.w) == 0u) {
/*179*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*180*/	      r6.xy = floor((r5.xyxx).xy);
/*181*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*182*/	      r2.w = -0.000400 / r2.w;
/*183*/	      r2.w = r2.w + r5.z;
/*184*/	      r7.z = -r7.y + 1.000000;
/*185*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*186*/	      r7.w = -r7.y;
/*187*/	      r9.x = cb1.data[0].z/**/;
/*188*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*189*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*190*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*191*/	      r9.w = -cb1.data[0].w/**/;
/*192*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*193*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*194*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*195*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*196*/	      r7.x = r8.x;
/*197*/	      r7.y = r10.x;
/*198*/	      r7.z = r9.x;
/*199*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*200*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*201*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*202*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*203*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*204*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*205*/	      r2.w = -r5.x + r5.z;
/*206*/	      r2.w = r5.y * r2.w + r5.x;
/*207*/	    } else {
/*208*/	      r2.w = 1.000000;
/*209*/	    }
/*210*/	  } else {
/*211*/	    r2.w = 1.000000;
/*212*/	  }
/*213*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*214*/	  r5.y = r5.x * cb1.data[34].x;
/*215*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*216*/	  r5.x = r1.w + -r5.x;
/*217*/	  r5.x = saturate(r5.x / r5.y);
/*218*/	  r2.w = -r4.z + r2.w;
/*219*/	  r4.z = r5.x * r2.w + r4.z;
/*220*/	}
/*221*/	if(floatBitsToUint(r4.w) != 0u) {
/*222*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*223*/	  r4.w = r2.w * cb1.data[34].y;
/*224*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*225*/	  r2.w = r1.w + -r2.w;
/*226*/	  r2.w = saturate(r2.w / r4.w);
/*227*/	  r4.y = -r4.z + 1.000000;
/*228*/	  r4.z = r2.w * r4.y + r4.z;
/*229*/	}
/*230*/	r4.z = saturate(r4.z);
/*231*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*232*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*233*/	r2.w = inversesqrt(r2.w);
/*234*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*235*/	r2.w = -r4.x + 1.000000;
/*236*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*237*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*238*/	r4.w = r4.w + r4.w;
/*239*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*240*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*241*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*242*/	r4.w = cos((r8.x));
/*243*/	r4.w = inversesqrt(r4.w);
/*244*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*245*/	r5.w = saturate(r0.w * 60.000000);
/*246*/	r5.w = -r0.w + r5.w;
/*247*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*248*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*249*/	r6.w = inversesqrt(r6.w);
/*250*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*251*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*252*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*253*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*254*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*255*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*256*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*257*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*258*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*259*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*260*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*261*/	r6.w = -r0.w + 1.000000;
/*262*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*263*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*264*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*265*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*266*/	  r6.w = max(r6.w, 0.000000);
/*267*/	  r6.w = log2(r6.w);
/*268*/	  r6.w = r6.w * 10.000000;
/*269*/	  r6.w = exp2(r6.w);
/*270*/	  r6.w = r4.w * r6.w;
/*271*/	  r6.w = r6.w * r5.w + r0.w;
/*272*/	  r7.y = r2.w * 8.000000;
/*273*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*274*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*275*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*276*/	}
/*277*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*278*/	r7.y = max(r6.w, 0.000000);
/*279*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*280*/	if(floatBitsToUint(r6.w) != 0u) {
/*281*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*282*/	  r6.x = max(r6.x, -1.000000);
/*283*/	  r6.x = min(r6.x, 1.000000);
/*284*/	  r6.y = -abs(r6.x) + 1.000000;
/*285*/	  r6.y = sqrt(r6.y);
/*286*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*287*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*288*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*289*/	  r6.w = r6.y * r6.z;
/*290*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*291*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*292*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*293*/	  r6.x = r6.z * r6.y + r6.x;
/*294*/	  r4.x = r4.x * r4.x;
/*295*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*296*/	  r4.x = r4.x * r4.y + r7.x;
/*297*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*298*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*299*/	  r4.y = -r4.x * r4.x + 1.000000;
/*300*/	  r4.y = max(r4.y, 0.001000);
/*301*/	  r4.y = log2(r4.y);
/*302*/	  r6.y = r4.y * 4.950617;
/*303*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*304*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*305*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*306*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*307*/	  r4.x = floatBitsToInt(r4.x);
/*308*/	  r6.y = r4.y * r4.y + -r6.y;
/*309*/	  r6.y = sqrt(r6.y);
/*310*/	  r4.y = -r4.y + r6.y;
/*311*/	  r4.y = max(r4.y, 0.000000);
/*312*/	  r4.y = sqrt(r4.y);
/*313*/	  r4.x = r4.y * r4.x;
/*314*/	  r4.x = r4.x * 1.414214;
/*315*/	  r4.x = 0.008727 / r4.x;
/*316*/	  r4.x = max(r4.x, 0.000100);
/*317*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*318*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*319*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*320*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*321*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*322*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*323*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*324*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*325*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*326*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*327*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*328*/	  r4.x = floatBitsToInt(r4.x);
/*329*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*330*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*331*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*332*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*333*/	  r4.x = r4.x * r6.x + 1.000000;
/*334*/	  r4.x = r4.x * 0.500000;
/*335*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*336*/	  r4.y = r4.y * r6.y + 1.000000;
/*337*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*338*/	  r4.y = min(r7.y, 1.000000);
/*339*/	  r2.w = r2.w * 1.570796;
/*340*/	  r2.w = sin(r2.w);
/*341*/	  r4.y = r4.y + -1.000000;
/*342*/	  r2.w = r2.w * r4.y + 1.000000;
/*343*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*344*/	  r4.y = max(r4.y, 0.000000);
/*345*/	  r4.y = log2(r4.y);
/*346*/	  r4.y = r4.y * 10.000000;
/*347*/	  r4.y = exp2(r4.y);
/*348*/	  r4.y = r4.w * r4.y;
/*349*/	  r4.y = r4.y * r5.w + r0.w;
/*350*/	  r2.w = r2.w * abs(r4.x);
/*351*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*352*/	} else {
/*353*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*354*/	}
/*355*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*356*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*357*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*358*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*359*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*360*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*361*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*362*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*363*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*364*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*365*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*366*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*367*/	r2.w = inversesqrt(r2.w);
/*368*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*369*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*370*/	r2.w = r2.w + r2.w;
/*371*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*372*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*373*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*374*/	r2.x = max(r2.x, 0.000000);
/*375*/	r2.x = log2(r2.x);
/*376*/	r2.x = r2.x * 10.000000;
/*377*/	r2.x = exp2(r2.x);
/*378*/	r2.x = r4.w * r2.x;
/*379*/	r0.w = r2.x * r5.w + r0.w;
/*380*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*381*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*382*/	color0.w = 2.000000;
/*383*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*384*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*385*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*386*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*387*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*388*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*389*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*390*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*391*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*392*/	if(r0.x != 0) discard;
/*393*/	color1.x = 1.000000;
/*394*/	return;
}
