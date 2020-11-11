//
//
// Shader Model 4
// Fragment Shader
//
// id: 5698 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weighted.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
/*13*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*14*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*15*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*16*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*17*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*18*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*19*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*20*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*21*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*22*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*23*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*24*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*25*/	r2.z = inversesqrt(r2.z);
/*26*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*27*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*28*/	r2.z = inversesqrt(r2.z);
/*29*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*30*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*31*/	r2.z = inversesqrt(r2.z);
/*32*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*33*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*34*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*35*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*36*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*37*/	r0.w = inversesqrt(r0.w);
/*38*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*39*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*40*/	r4.w = 1.000000;
/*41*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*42*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*43*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*44*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*45*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*46*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*47*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*48*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*49*/	r3.y = intBitsToFloat(int(r2.w));
/*50*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*51*/	if(floatBitsToUint(r3.z) != 0u) {
/*52*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*53*/	  r5.w = vsOut_T0.w;
/*54*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*55*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*56*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*57*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*58*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*59*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*60*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*61*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*62*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*63*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*64*/	  if(floatBitsToUint(r3.w) == 0u) {
/*65*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*66*/	    r7.xy = floor((r6.xyxx).xy);
/*67*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*68*/	    r3.z = -0.000400 / r3.z;
/*69*/	    r3.z = r3.z + r6.z;
/*70*/	    r8.z = -r8.y + 1.000000;
/*71*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*72*/	    r8.w = -r8.y;
/*73*/	    r10.x = cb1.data[0].z/**/;
/*74*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*75*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*76*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*77*/	    r10.w = -cb1.data[0].w/**/;
/*78*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*79*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*80*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*81*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*82*/	    r8.x = r9.x;
/*83*/	    r8.y = r11.x;
/*84*/	    r8.z = r10.x;
/*85*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*86*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*87*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*88*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*89*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*90*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*91*/	    r3.z = -r6.x + r6.y;
/*92*/	    r3.z = r3.w * r3.z + r6.x;
/*93*/	  } else {
/*94*/	    r3.z = 1.000000;
/*95*/	  }
/*96*/	} else {
/*97*/	  r3.z = 1.000000;
/*98*/	}
/*99*/	r3.w = cb1.data[34].w + -1.000000;
/*100*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*101*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*102*/	if(floatBitsToUint(r2.w) == 0u) {
/*103*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*104*/	  r2.w = floatBitsToInt(r2.w);
/*105*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*106*/	  if(floatBitsToUint(r2.w) != 0u) {
/*107*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*108*/	    r5.w = vsOut_T0.w;
/*109*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*110*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*111*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*112*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*113*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*114*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*115*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*116*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*117*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*118*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*119*/	    if(floatBitsToUint(r5.w) == 0u) {
/*120*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*121*/	      r6.xy = floor((r5.xyxx).xy);
/*122*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*123*/	      r2.w = -0.000400 / r2.w;
/*124*/	      r2.w = r2.w + r5.z;
/*125*/	      r7.z = -r7.y + 1.000000;
/*126*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*127*/	      r7.w = -r7.y;
/*128*/	      r9.x = cb1.data[0].z/**/;
/*129*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*130*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*131*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*132*/	      r9.w = -cb1.data[0].w/**/;
/*133*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*134*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*135*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*136*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*137*/	      r7.x = r8.x;
/*138*/	      r7.y = r10.x;
/*139*/	      r7.z = r9.x;
/*140*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*141*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*142*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*143*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*144*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*145*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*146*/	      r2.w = -r5.x + r5.z;
/*147*/	      r2.w = r5.y * r2.w + r5.x;
/*148*/	    } else {
/*149*/	      r2.w = 1.000000;
/*150*/	    }
/*151*/	  } else {
/*152*/	    r2.w = 1.000000;
/*153*/	  }
/*154*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*155*/	  r5.y = r5.x * cb1.data[34].x;
/*156*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*157*/	  r5.x = r0.w + -r5.x;
/*158*/	  r5.x = saturate(r5.x / r5.y);
/*159*/	  r2.w = -r3.z + r2.w;
/*160*/	  r3.z = r5.x * r2.w + r3.z;
/*161*/	}
/*162*/	if(floatBitsToUint(r3.w) != 0u) {
/*163*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*164*/	  r3.w = r2.w * cb1.data[34].y;
/*165*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*166*/	  r2.w = r0.w + -r2.w;
/*167*/	  r2.w = saturate(r2.w / r3.w);
/*168*/	  r3.y = -r3.z + 1.000000;
/*169*/	  r3.z = r2.w * r3.y + r3.z;
/*170*/	}
/*171*/	r3.z = saturate(r3.z);
/*172*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*173*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*174*/	r2.w = inversesqrt(r2.w);
/*175*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*176*/	r2.w = -r3.x + 1.000000;
/*177*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*178*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*179*/	r3.w = r3.w + r3.w;
/*180*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*181*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*182*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*183*/	r3.w = cos((r8.x));
/*184*/	r3.w = inversesqrt(r3.w);
/*185*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*186*/	r5.w = saturate(r1.w * 60.000000);
/*187*/	r5.w = -r1.w + r5.w;
/*188*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*189*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*190*/	r6.w = inversesqrt(r6.w);
/*191*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*192*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*193*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*194*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*195*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*196*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*197*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*198*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*199*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*200*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*201*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*202*/	r6.w = -r1.w + 1.000000;
/*203*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*204*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*205*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*206*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*207*/	  r6.w = max(r6.w, 0.000000);
/*208*/	  r6.w = log2(r6.w);
/*209*/	  r6.w = r6.w * 10.000000;
/*210*/	  r6.w = exp2(r6.w);
/*211*/	  r6.w = r3.w * r6.w;
/*212*/	  r6.w = r6.w * r5.w + r1.w;
/*213*/	  r7.y = r2.w * 8.000000;
/*214*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*215*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*216*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*217*/	}
/*218*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*219*/	r7.y = max(r6.w, 0.000000);
/*220*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*221*/	if(floatBitsToUint(r6.w) != 0u) {
/*222*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*223*/	  r6.x = max(r6.x, -1.000000);
/*224*/	  r6.x = min(r6.x, 1.000000);
/*225*/	  r6.y = -abs(r6.x) + 1.000000;
/*226*/	  r6.y = sqrt(r6.y);
/*227*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*228*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*229*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*230*/	  r6.w = r6.y * r6.z;
/*231*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*232*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*233*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*234*/	  r6.x = r6.z * r6.y + r6.x;
/*235*/	  r3.x = r3.x * r3.x;
/*236*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*237*/	  r3.x = r3.x * r3.y + r7.x;
/*238*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*239*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*240*/	  r3.y = -r3.x * r3.x + 1.000000;
/*241*/	  r3.y = max(r3.y, 0.001000);
/*242*/	  r3.y = log2(r3.y);
/*243*/	  r6.y = r3.y * 4.950617;
/*244*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*245*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*246*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*247*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*248*/	  r3.x = floatBitsToInt(r3.x);
/*249*/	  r6.y = r3.y * r3.y + -r6.y;
/*250*/	  r6.y = sqrt(r6.y);
/*251*/	  r3.y = -r3.y + r6.y;
/*252*/	  r3.y = max(r3.y, 0.000000);
/*253*/	  r3.y = sqrt(r3.y);
/*254*/	  r3.x = r3.y * r3.x;
/*255*/	  r3.x = r3.x * 1.414214;
/*256*/	  r3.x = 0.008727 / r3.x;
/*257*/	  r3.x = max(r3.x, 0.000100);
/*258*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*259*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*260*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*261*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*262*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*263*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*264*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*265*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*266*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*267*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*268*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*269*/	  r3.x = floatBitsToInt(r3.x);
/*270*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*271*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*272*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*273*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*274*/	  r3.x = r3.x * r6.x + 1.000000;
/*275*/	  r3.x = r3.x * 0.500000;
/*276*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*277*/	  r3.y = r3.y * r6.y + 1.000000;
/*278*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*279*/	  r3.y = min(r7.y, 1.000000);
/*280*/	  r2.w = r2.w * 1.570796;
/*281*/	  r2.w = sin(r2.w);
/*282*/	  r3.y = r3.y + -1.000000;
/*283*/	  r2.w = r2.w * r3.y + 1.000000;
/*284*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*285*/	  r3.y = max(r3.y, 0.000000);
/*286*/	  r3.y = log2(r3.y);
/*287*/	  r3.y = r3.y * 10.000000;
/*288*/	  r3.y = exp2(r3.y);
/*289*/	  r3.y = r3.w * r3.y;
/*290*/	  r3.y = r3.y * r5.w + r1.w;
/*291*/	  r2.w = r2.w * abs(r3.x);
/*292*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*293*/	} else {
/*294*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*295*/	}
/*296*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*297*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*298*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*299*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*300*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*301*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*302*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*303*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*304*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*305*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*306*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*307*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*308*/	r2.w = inversesqrt(r2.w);
/*309*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*310*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*311*/	r2.w = r2.w + r2.w;
/*312*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*313*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*314*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*315*/	r2.x = max(r2.x, 0.000000);
/*316*/	r2.x = log2(r2.x);
/*317*/	r2.x = r2.x * 10.000000;
/*318*/	r2.x = exp2(r2.x);
/*319*/	r2.x = r3.w * r2.x;
/*320*/	r1.w = r2.x * r5.w + r1.w;
/*321*/	r2.xyz = (r6.xyzx * r1.wwww).xyz;
/*322*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*323*/	color0.w = 2.000000;
/*324*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*325*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*326*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*327*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*328*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*329*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*330*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*331*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*332*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*333*/	if(r0.x != 0) discard;
/*334*/	color1.x = 1.000000;
/*335*/	return;
}
