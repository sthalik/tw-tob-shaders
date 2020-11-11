//
//
// Shader Model 4
// Fragment Shader
//
// id: 6723 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithburn.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
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
/*11*/	r0.w = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*14*/	r4.x = r2.z;
/*15*/	r4.y = cb0.data[26].x * 0.050000 + r2.w;
/*16*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*17*/	r5.xyzw = (texture(s_fire_map, r2.zwzz.st)).xyzw;
/*18*/	r1.w = saturate(r4.x * 5.000000);
/*19*/	r4.xyz = (r1.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*20*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*21*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*22*/	r2.z = log2(r5.z);
/*23*/	r2.z = r2.z * 1.800000;
/*24*/	r2.z = exp2(r2.z);
/*25*/	r2.z = r2.z * 10.000000;
/*26*/	r2.z = min(r2.z, 1.000000);
/*27*/	r1.w = r1.w + r2.z;
/*28*/	r1.w = r1.w * 0.500000;
/*29*/	r2.z = -r5.w + 1.000000;
/*30*/	r2.z = log2(r2.z);
/*31*/	r2.z = r2.z * vsOut_T7.z;
/*32*/	r2.z = exp2(r2.z);
/*33*/	r2.z = min(r2.z, 1.000000);
/*34*/	r2.z = r2.z * vsOut_T7.z;
/*35*/	r2.w = r5.z * 0.250000;
/*36*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*37*/	r4.xyz = (r1.wwww * r4.xyzx + r2.wwww).xyz;
/*38*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*39*/	r0.xyz = (r2.zzzz * r4.xyzx + r0.xyzx).xyz;
/*40*/	r1.w = vsOut_T7.z + -0.025000;
/*41*/	r1.w = max(r1.w, 0.000000);
/*42*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*43*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*44*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*45*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*46*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*47*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*49*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*50*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*51*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*52*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*53*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*55*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r2.z = inversesqrt(r2.z);
/*57*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*58*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*59*/	r2.z = inversesqrt(r2.z);
/*60*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*61*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*62*/	r2.z = inversesqrt(r2.z);
/*63*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*64*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*65*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*66*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*67*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*68*/	r0.w = inversesqrt(r0.w);
/*69*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*70*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*71*/	r4.w = 1.000000;
/*72*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*73*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*74*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*77*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*78*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*79*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*80*/	r3.y = intBitsToFloat(int(r2.w));
/*81*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r3.z) != 0u) {
/*83*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*84*/	  r5.w = vsOut_T0.w;
/*85*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*86*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*87*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*88*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*89*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*90*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*91*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*92*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*93*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*94*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*95*/	  if(floatBitsToUint(r3.w) == 0u) {
/*96*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*97*/	    r7.xy = floor((r6.xyxx).xy);
/*98*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*99*/	    r3.z = -0.000400 / r3.z;
/*100*/	    r3.z = r3.z + r6.z;
/*101*/	    r8.z = -r8.y + 1.000000;
/*102*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*103*/	    r8.w = -r8.y;
/*104*/	    r10.x = cb1.data[0].z/**/;
/*105*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*106*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*107*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*108*/	    r10.w = -cb1.data[0].w/**/;
/*109*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*110*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*111*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*112*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*113*/	    r8.x = r9.x;
/*114*/	    r8.y = r11.x;
/*115*/	    r8.z = r10.x;
/*116*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*117*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*118*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*119*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*120*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*121*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*122*/	    r3.z = -r6.x + r6.y;
/*123*/	    r3.z = r3.w * r3.z + r6.x;
/*124*/	  } else {
/*125*/	    r3.z = 1.000000;
/*126*/	  }
/*127*/	} else {
/*128*/	  r3.z = 1.000000;
/*129*/	}
/*130*/	r3.w = cb1.data[34].w + -1.000000;
/*131*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*132*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*133*/	if(floatBitsToUint(r2.w) == 0u) {
/*134*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*135*/	  r2.w = floatBitsToInt(r2.w);
/*136*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*137*/	  if(floatBitsToUint(r2.w) != 0u) {
/*138*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*139*/	    r5.w = vsOut_T0.w;
/*140*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*141*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*142*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*143*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*144*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*145*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*146*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*147*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*148*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*149*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*150*/	    if(floatBitsToUint(r5.w) == 0u) {
/*151*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*152*/	      r6.xy = floor((r5.xyxx).xy);
/*153*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*154*/	      r2.w = -0.000400 / r2.w;
/*155*/	      r2.w = r2.w + r5.z;
/*156*/	      r7.z = -r7.y + 1.000000;
/*157*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*158*/	      r7.w = -r7.y;
/*159*/	      r9.x = cb1.data[0].z/**/;
/*160*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*161*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*162*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*163*/	      r9.w = -cb1.data[0].w/**/;
/*164*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*165*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*166*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*167*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*168*/	      r7.x = r8.x;
/*169*/	      r7.y = r10.x;
/*170*/	      r7.z = r9.x;
/*171*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*172*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*173*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*174*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*175*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*176*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*177*/	      r2.w = -r5.x + r5.z;
/*178*/	      r2.w = r5.y * r2.w + r5.x;
/*179*/	    } else {
/*180*/	      r2.w = 1.000000;
/*181*/	    }
/*182*/	  } else {
/*183*/	    r2.w = 1.000000;
/*184*/	  }
/*185*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*186*/	  r5.y = r5.x * cb1.data[34].x;
/*187*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*188*/	  r5.x = r0.w + -r5.x;
/*189*/	  r5.x = saturate(r5.x / r5.y);
/*190*/	  r2.w = -r3.z + r2.w;
/*191*/	  r3.z = r5.x * r2.w + r3.z;
/*192*/	}
/*193*/	if(floatBitsToUint(r3.w) != 0u) {
/*194*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*195*/	  r3.w = r2.w * cb1.data[34].y;
/*196*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*197*/	  r2.w = r0.w + -r2.w;
/*198*/	  r2.w = saturate(r2.w / r3.w);
/*199*/	  r3.y = -r3.z + 1.000000;
/*200*/	  r3.z = r2.w * r3.y + r3.z;
/*201*/	}
/*202*/	r3.z = saturate(r3.z);
/*203*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*204*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*205*/	r2.w = inversesqrt(r2.w);
/*206*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*207*/	r2.w = -r3.x + 1.000000;
/*208*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*209*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*210*/	r3.w = r3.w + r3.w;
/*211*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*212*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*213*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*214*/	r3.w = cos((r8.x));
/*215*/	r3.w = inversesqrt(r3.w);
/*216*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*217*/	r5.w = saturate(r1.w * 60.000000);
/*218*/	r5.w = -r1.w + r5.w;
/*219*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*220*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*221*/	r6.w = inversesqrt(r6.w);
/*222*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*223*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*224*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*225*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*226*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*227*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*228*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*229*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*230*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*231*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*232*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*233*/	r6.w = -r1.w + 1.000000;
/*234*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*235*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*236*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*237*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*238*/	  r6.w = max(r6.w, 0.000000);
/*239*/	  r6.w = log2(r6.w);
/*240*/	  r6.w = r6.w * 10.000000;
/*241*/	  r6.w = exp2(r6.w);
/*242*/	  r6.w = r3.w * r6.w;
/*243*/	  r6.w = r6.w * r5.w + r1.w;
/*244*/	  r7.y = r2.w * 8.000000;
/*245*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*246*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*247*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*248*/	}
/*249*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*250*/	r7.y = max(r6.w, 0.000000);
/*251*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*252*/	if(floatBitsToUint(r6.w) != 0u) {
/*253*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*254*/	  r6.x = max(r6.x, -1.000000);
/*255*/	  r6.x = min(r6.x, 1.000000);
/*256*/	  r6.y = -abs(r6.x) + 1.000000;
/*257*/	  r6.y = sqrt(r6.y);
/*258*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*259*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*260*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*261*/	  r6.w = r6.y * r6.z;
/*262*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*263*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*264*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*265*/	  r6.x = r6.z * r6.y + r6.x;
/*266*/	  r3.x = r3.x * r3.x;
/*267*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*268*/	  r3.x = r3.x * r3.y + r7.x;
/*269*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*270*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*271*/	  r3.y = -r3.x * r3.x + 1.000000;
/*272*/	  r3.y = max(r3.y, 0.001000);
/*273*/	  r3.y = log2(r3.y);
/*274*/	  r6.y = r3.y * 4.950617;
/*275*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*276*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*277*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*278*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*279*/	  r3.x = floatBitsToInt(r3.x);
/*280*/	  r6.y = r3.y * r3.y + -r6.y;
/*281*/	  r6.y = sqrt(r6.y);
/*282*/	  r3.y = -r3.y + r6.y;
/*283*/	  r3.y = max(r3.y, 0.000000);
/*284*/	  r3.y = sqrt(r3.y);
/*285*/	  r3.x = r3.y * r3.x;
/*286*/	  r3.x = r3.x * 1.414214;
/*287*/	  r3.x = 0.008727 / r3.x;
/*288*/	  r3.x = max(r3.x, 0.000100);
/*289*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*290*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*291*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*292*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*293*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*294*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*295*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*296*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*297*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*298*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*299*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*300*/	  r3.x = floatBitsToInt(r3.x);
/*301*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*302*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*303*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*304*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*305*/	  r3.x = r3.x * r6.x + 1.000000;
/*306*/	  r3.x = r3.x * 0.500000;
/*307*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*308*/	  r3.y = r3.y * r6.y + 1.000000;
/*309*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*310*/	  r3.y = min(r7.y, 1.000000);
/*311*/	  r2.w = r2.w * 1.570796;
/*312*/	  r2.w = sin(r2.w);
/*313*/	  r3.y = r3.y + -1.000000;
/*314*/	  r2.w = r2.w * r3.y + 1.000000;
/*315*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*316*/	  r3.y = max(r3.y, 0.000000);
/*317*/	  r3.y = log2(r3.y);
/*318*/	  r3.y = r3.y * 10.000000;
/*319*/	  r3.y = exp2(r3.y);
/*320*/	  r3.y = r3.w * r3.y;
/*321*/	  r3.y = r3.y * r5.w + r1.w;
/*322*/	  r2.w = r2.w * abs(r3.x);
/*323*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*324*/	} else {
/*325*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*326*/	}
/*327*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*328*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*329*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*330*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*331*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*332*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*333*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*334*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*335*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*336*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*337*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*338*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*339*/	r2.w = inversesqrt(r2.w);
/*340*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*341*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*342*/	r2.w = r2.w + r2.w;
/*343*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*344*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*345*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*346*/	r2.x = max(r2.x, 0.000000);
/*347*/	r2.x = log2(r2.x);
/*348*/	r2.x = r2.x * 10.000000;
/*349*/	r2.x = exp2(r2.x);
/*350*/	r2.x = r3.w * r2.x;
/*351*/	r1.w = r2.x * r5.w + r1.w;
/*352*/	r2.xyz = (r6.xyzx * r1.wwww).xyz;
/*353*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*354*/	color0.w = 2.000000;
/*355*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*356*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*357*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*358*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*359*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*360*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*361*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*362*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*363*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*364*/	if(r0.x != 0) discard;
/*365*/	color1.x = 1.000000;
/*366*/	return;
}
