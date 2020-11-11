//
//
// Shader Model 4
// Fragment Shader
//
// id: 5700 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weighted.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r0.w = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*11*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*12*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*13*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*14*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*15*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*16*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*17*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*18*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*19*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*20*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*21*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*22*/	r2.z = inversesqrt(r2.z);
/*23*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*24*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*25*/	r2.z = inversesqrt(r2.z);
/*26*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*27*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*28*/	r2.z = inversesqrt(r2.z);
/*29*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*30*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*31*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*32*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*33*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*36*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*37*/	r4.w = 1.000000;
/*38*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*39*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*40*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*41*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*42*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*43*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*44*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*45*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*46*/	r3.y = intBitsToFloat(int(r2.w));
/*47*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r3.z) != 0u) {
/*49*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*50*/	  r5.w = vsOut_T0.w;
/*51*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*52*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*53*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*54*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*55*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*56*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*57*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*58*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*59*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*60*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*61*/	  if(floatBitsToUint(r3.w) == 0u) {
/*62*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*63*/	    r7.xy = floor((r6.xyxx).xy);
/*64*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*65*/	    r3.z = -0.000400 / r3.z;
/*66*/	    r3.z = r3.z + r6.z;
/*67*/	    r8.z = -r8.y + 1.000000;
/*68*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*69*/	    r8.w = -r8.y;
/*70*/	    r10.x = cb1.data[0].z/**/;
/*71*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*72*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*73*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*74*/	    r10.w = -cb1.data[0].w/**/;
/*75*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*76*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*77*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*78*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*79*/	    r8.x = r9.x;
/*80*/	    r8.y = r11.x;
/*81*/	    r8.z = r10.x;
/*82*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*83*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*84*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*85*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*86*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*87*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*88*/	    r3.z = -r6.x + r6.y;
/*89*/	    r3.z = r3.w * r3.z + r6.x;
/*90*/	  } else {
/*91*/	    r3.z = 1.000000;
/*92*/	  }
/*93*/	} else {
/*94*/	  r3.z = 1.000000;
/*95*/	}
/*96*/	r3.w = cb1.data[34].w + -1.000000;
/*97*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*98*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*99*/	if(floatBitsToUint(r2.w) == 0u) {
/*100*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*101*/	  r2.w = floatBitsToInt(r2.w);
/*102*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*103*/	  if(floatBitsToUint(r2.w) != 0u) {
/*104*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*105*/	    r5.w = vsOut_T0.w;
/*106*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*107*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*108*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*109*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*110*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*111*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*112*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*113*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*114*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*115*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*116*/	    if(floatBitsToUint(r5.w) == 0u) {
/*117*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*118*/	      r6.xy = floor((r5.xyxx).xy);
/*119*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*120*/	      r2.w = -0.000400 / r2.w;
/*121*/	      r2.w = r2.w + r5.z;
/*122*/	      r7.z = -r7.y + 1.000000;
/*123*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*124*/	      r7.w = -r7.y;
/*125*/	      r9.x = cb1.data[0].z/**/;
/*126*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*127*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*128*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*129*/	      r9.w = -cb1.data[0].w/**/;
/*130*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*131*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*132*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*133*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*134*/	      r7.x = r8.x;
/*135*/	      r7.y = r10.x;
/*136*/	      r7.z = r9.x;
/*137*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*138*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*139*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*140*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*141*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*142*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*143*/	      r2.w = -r5.x + r5.z;
/*144*/	      r2.w = r5.y * r2.w + r5.x;
/*145*/	    } else {
/*146*/	      r2.w = 1.000000;
/*147*/	    }
/*148*/	  } else {
/*149*/	    r2.w = 1.000000;
/*150*/	  }
/*151*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*152*/	  r5.y = r5.x * cb1.data[34].x;
/*153*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*154*/	  r5.x = r0.w + -r5.x;
/*155*/	  r5.x = saturate(r5.x / r5.y);
/*156*/	  r2.w = -r3.z + r2.w;
/*157*/	  r3.z = r5.x * r2.w + r3.z;
/*158*/	}
/*159*/	if(floatBitsToUint(r3.w) != 0u) {
/*160*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*161*/	  r3.w = r2.w * cb1.data[34].y;
/*162*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*163*/	  r2.w = r0.w + -r2.w;
/*164*/	  r2.w = saturate(r2.w / r3.w);
/*165*/	  r3.y = -r3.z + 1.000000;
/*166*/	  r3.z = r2.w * r3.y + r3.z;
/*167*/	}
/*168*/	r3.z = saturate(r3.z);
/*169*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*170*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*171*/	r2.w = inversesqrt(r2.w);
/*172*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*173*/	r2.w = -r3.x + 1.000000;
/*174*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*175*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*176*/	r3.w = r3.w + r3.w;
/*177*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*178*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*179*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*180*/	r3.w = cos((r8.x));
/*181*/	r3.w = inversesqrt(r3.w);
/*182*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*183*/	r5.w = saturate(r1.w * 60.000000);
/*184*/	r5.w = -r1.w + r5.w;
/*185*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*186*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*187*/	r6.w = inversesqrt(r6.w);
/*188*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*189*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*190*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*191*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*192*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*193*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*194*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*195*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*196*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*197*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*198*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*199*/	r6.w = -r1.w + 1.000000;
/*200*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*201*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*202*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*203*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*204*/	  r6.w = max(r6.w, 0.000000);
/*205*/	  r6.w = log2(r6.w);
/*206*/	  r6.w = r6.w * 10.000000;
/*207*/	  r6.w = exp2(r6.w);
/*208*/	  r6.w = r3.w * r6.w;
/*209*/	  r6.w = r6.w * r5.w + r1.w;
/*210*/	  r7.y = r2.w * 8.000000;
/*211*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*212*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*213*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*214*/	}
/*215*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*216*/	r7.y = max(r6.w, 0.000000);
/*217*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*218*/	if(floatBitsToUint(r6.w) != 0u) {
/*219*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*220*/	  r6.x = max(r6.x, -1.000000);
/*221*/	  r6.x = min(r6.x, 1.000000);
/*222*/	  r6.y = -abs(r6.x) + 1.000000;
/*223*/	  r6.y = sqrt(r6.y);
/*224*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*225*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*226*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*227*/	  r6.w = r6.y * r6.z;
/*228*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*229*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*230*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*231*/	  r6.x = r6.z * r6.y + r6.x;
/*232*/	  r3.x = r3.x * r3.x;
/*233*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*234*/	  r3.x = r3.x * r3.y + r7.x;
/*235*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*236*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*237*/	  r3.y = -r3.x * r3.x + 1.000000;
/*238*/	  r3.y = max(r3.y, 0.001000);
/*239*/	  r3.y = log2(r3.y);
/*240*/	  r6.y = r3.y * 4.950617;
/*241*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*242*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*243*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*244*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*245*/	  r3.x = floatBitsToInt(r3.x);
/*246*/	  r6.y = r3.y * r3.y + -r6.y;
/*247*/	  r6.y = sqrt(r6.y);
/*248*/	  r3.y = -r3.y + r6.y;
/*249*/	  r3.y = max(r3.y, 0.000000);
/*250*/	  r3.y = sqrt(r3.y);
/*251*/	  r3.x = r3.y * r3.x;
/*252*/	  r3.x = r3.x * 1.414214;
/*253*/	  r3.x = 0.008727 / r3.x;
/*254*/	  r3.x = max(r3.x, 0.000100);
/*255*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*256*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*257*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*258*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*259*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*260*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*261*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*262*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*263*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*264*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*265*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*266*/	  r3.x = floatBitsToInt(r3.x);
/*267*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*268*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*269*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*270*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*271*/	  r3.x = r3.x * r6.x + 1.000000;
/*272*/	  r3.x = r3.x * 0.500000;
/*273*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*274*/	  r3.y = r3.y * r6.y + 1.000000;
/*275*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*276*/	  r3.y = min(r7.y, 1.000000);
/*277*/	  r2.w = r2.w * 1.570796;
/*278*/	  r2.w = sin(r2.w);
/*279*/	  r3.y = r3.y + -1.000000;
/*280*/	  r2.w = r2.w * r3.y + 1.000000;
/*281*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*282*/	  r3.y = max(r3.y, 0.000000);
/*283*/	  r3.y = log2(r3.y);
/*284*/	  r3.y = r3.y * 10.000000;
/*285*/	  r3.y = exp2(r3.y);
/*286*/	  r3.y = r3.w * r3.y;
/*287*/	  r3.y = r3.y * r5.w + r1.w;
/*288*/	  r2.w = r2.w * abs(r3.x);
/*289*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*290*/	} else {
/*291*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*292*/	}
/*293*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*294*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*295*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*296*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*297*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*298*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*299*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*300*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*301*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*302*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*303*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*304*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*305*/	r2.w = inversesqrt(r2.w);
/*306*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*307*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*308*/	r2.w = r2.w + r2.w;
/*309*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*310*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*311*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*312*/	r2.x = max(r2.x, 0.000000);
/*313*/	r2.x = log2(r2.x);
/*314*/	r2.x = r2.x * 10.000000;
/*315*/	r2.x = exp2(r2.x);
/*316*/	r2.x = r3.w * r2.x;
/*317*/	r1.w = r2.x * r5.w + r1.w;
/*318*/	r2.xyz = (r6.xyzx * r1.wwww).xyz;
/*319*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*320*/	color0.w = 2.000000;
/*321*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*322*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*323*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*324*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*325*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*326*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*327*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*328*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*329*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*330*/	if(r0.x != 0) discard;
/*331*/	color1.x = 1.000000;
/*332*/	return;
}
