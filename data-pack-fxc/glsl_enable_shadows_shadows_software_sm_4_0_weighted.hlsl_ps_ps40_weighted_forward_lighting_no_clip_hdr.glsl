//
//
// Shader Model 4
// Fragment Shader
//
// id: 5696 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weighted.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
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
/*26*/	r0.w = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*29*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*30*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*31*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*33*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*34*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*35*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*36*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*37*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*38*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*39*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r2.z = inversesqrt(r2.z);
/*41*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*42*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*43*/	r2.z = inversesqrt(r2.z);
/*44*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*45*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r2.z = inversesqrt(r2.z);
/*47*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*48*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*49*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*50*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*51*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*54*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*55*/	r4.w = 1.000000;
/*56*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*57*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*58*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*59*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*60*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*61*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*62*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*63*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*64*/	r3.y = intBitsToFloat(int(r2.w));
/*65*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*66*/	if(floatBitsToUint(r3.z) != 0u) {
/*67*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*68*/	  r5.w = vsOut_T0.w;
/*69*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*70*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*71*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*72*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*73*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*74*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*75*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*76*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*77*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*78*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*79*/	  if(floatBitsToUint(r3.w) == 0u) {
/*80*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*81*/	    r7.xy = floor((r6.xyxx).xy);
/*82*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*83*/	    r3.z = -0.000400 / r3.z;
/*84*/	    r3.z = r3.z + r6.z;
/*85*/	    r8.z = -r8.y + 1.000000;
/*86*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*87*/	    r8.w = -r8.y;
/*88*/	    r10.x = cb1.data[0].z/**/;
/*89*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*90*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*91*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*92*/	    r10.w = -cb1.data[0].w/**/;
/*93*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*94*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*95*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*96*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*97*/	    r8.x = r9.x;
/*98*/	    r8.y = r11.x;
/*99*/	    r8.z = r10.x;
/*100*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*101*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*102*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*103*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*104*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*105*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*106*/	    r3.z = -r6.x + r6.y;
/*107*/	    r3.z = r3.w * r3.z + r6.x;
/*108*/	  } else {
/*109*/	    r3.z = 1.000000;
/*110*/	  }
/*111*/	} else {
/*112*/	  r3.z = 1.000000;
/*113*/	}
/*114*/	r3.w = cb1.data[34].w + -1.000000;
/*115*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*116*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*117*/	if(floatBitsToUint(r2.w) == 0u) {
/*118*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*119*/	  r2.w = floatBitsToInt(r2.w);
/*120*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*121*/	  if(floatBitsToUint(r2.w) != 0u) {
/*122*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*123*/	    r5.w = vsOut_T0.w;
/*124*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*125*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*126*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*127*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*128*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*129*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*130*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*131*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*132*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*133*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*134*/	    if(floatBitsToUint(r5.w) == 0u) {
/*135*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*136*/	      r6.xy = floor((r5.xyxx).xy);
/*137*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*138*/	      r2.w = -0.000400 / r2.w;
/*139*/	      r2.w = r2.w + r5.z;
/*140*/	      r7.z = -r7.y + 1.000000;
/*141*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*142*/	      r7.w = -r7.y;
/*143*/	      r9.x = cb1.data[0].z/**/;
/*144*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*145*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*146*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*147*/	      r9.w = -cb1.data[0].w/**/;
/*148*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*149*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*150*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*151*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*152*/	      r7.x = r8.x;
/*153*/	      r7.y = r10.x;
/*154*/	      r7.z = r9.x;
/*155*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*156*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*157*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*158*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*159*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*160*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*161*/	      r2.w = -r5.x + r5.z;
/*162*/	      r2.w = r5.y * r2.w + r5.x;
/*163*/	    } else {
/*164*/	      r2.w = 1.000000;
/*165*/	    }
/*166*/	  } else {
/*167*/	    r2.w = 1.000000;
/*168*/	  }
/*169*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*170*/	  r5.y = r5.x * cb1.data[34].x;
/*171*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*172*/	  r5.x = r0.w + -r5.x;
/*173*/	  r5.x = saturate(r5.x / r5.y);
/*174*/	  r2.w = -r3.z + r2.w;
/*175*/	  r3.z = r5.x * r2.w + r3.z;
/*176*/	}
/*177*/	if(floatBitsToUint(r3.w) != 0u) {
/*178*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*179*/	  r3.w = r2.w * cb1.data[34].y;
/*180*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*181*/	  r2.w = r0.w + -r2.w;
/*182*/	  r2.w = saturate(r2.w / r3.w);
/*183*/	  r3.y = -r3.z + 1.000000;
/*184*/	  r3.z = r2.w * r3.y + r3.z;
/*185*/	}
/*186*/	r3.z = saturate(r3.z);
/*187*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*188*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*189*/	r2.w = inversesqrt(r2.w);
/*190*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*191*/	r2.w = -r3.x + 1.000000;
/*192*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*193*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*194*/	r3.w = r3.w + r3.w;
/*195*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*196*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*197*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*198*/	r3.w = cos((r8.x));
/*199*/	r3.w = inversesqrt(r3.w);
/*200*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*201*/	r5.w = saturate(r1.w * 60.000000);
/*202*/	r5.w = -r1.w + r5.w;
/*203*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*204*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*205*/	r6.w = inversesqrt(r6.w);
/*206*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*207*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*208*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*209*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*210*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*211*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*212*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*213*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*214*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*215*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*216*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*217*/	r6.w = -r1.w + 1.000000;
/*218*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*219*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*220*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*221*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*222*/	  r6.w = max(r6.w, 0.000000);
/*223*/	  r6.w = log2(r6.w);
/*224*/	  r6.w = r6.w * 10.000000;
/*225*/	  r6.w = exp2(r6.w);
/*226*/	  r6.w = r3.w * r6.w;
/*227*/	  r6.w = r6.w * r5.w + r1.w;
/*228*/	  r7.y = r2.w * 8.000000;
/*229*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*230*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*231*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*232*/	}
/*233*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*234*/	r7.y = max(r6.w, 0.000000);
/*235*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*236*/	if(floatBitsToUint(r6.w) != 0u) {
/*237*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*238*/	  r6.x = max(r6.x, -1.000000);
/*239*/	  r6.x = min(r6.x, 1.000000);
/*240*/	  r6.y = -abs(r6.x) + 1.000000;
/*241*/	  r6.y = sqrt(r6.y);
/*242*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*243*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*244*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*245*/	  r6.w = r6.y * r6.z;
/*246*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*247*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*248*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*249*/	  r6.x = r6.z * r6.y + r6.x;
/*250*/	  r3.x = r3.x * r3.x;
/*251*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*252*/	  r3.x = r3.x * r3.y + r7.x;
/*253*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*254*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*255*/	  r3.y = -r3.x * r3.x + 1.000000;
/*256*/	  r3.y = max(r3.y, 0.001000);
/*257*/	  r3.y = log2(r3.y);
/*258*/	  r6.y = r3.y * 4.950617;
/*259*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*260*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*261*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*262*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*263*/	  r3.x = floatBitsToInt(r3.x);
/*264*/	  r6.y = r3.y * r3.y + -r6.y;
/*265*/	  r6.y = sqrt(r6.y);
/*266*/	  r3.y = -r3.y + r6.y;
/*267*/	  r3.y = max(r3.y, 0.000000);
/*268*/	  r3.y = sqrt(r3.y);
/*269*/	  r3.x = r3.y * r3.x;
/*270*/	  r3.x = r3.x * 1.414214;
/*271*/	  r3.x = 0.008727 / r3.x;
/*272*/	  r3.x = max(r3.x, 0.000100);
/*273*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*274*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*275*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*276*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*277*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*278*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*279*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*280*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*281*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*282*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*283*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*284*/	  r3.x = floatBitsToInt(r3.x);
/*285*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*286*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*287*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*288*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*289*/	  r3.x = r3.x * r6.x + 1.000000;
/*290*/	  r3.x = r3.x * 0.500000;
/*291*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*292*/	  r3.y = r3.y * r6.y + 1.000000;
/*293*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*294*/	  r3.y = min(r7.y, 1.000000);
/*295*/	  r2.w = r2.w * 1.570796;
/*296*/	  r2.w = sin(r2.w);
/*297*/	  r3.y = r3.y + -1.000000;
/*298*/	  r2.w = r2.w * r3.y + 1.000000;
/*299*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*300*/	  r3.y = max(r3.y, 0.000000);
/*301*/	  r3.y = log2(r3.y);
/*302*/	  r3.y = r3.y * 10.000000;
/*303*/	  r3.y = exp2(r3.y);
/*304*/	  r3.y = r3.w * r3.y;
/*305*/	  r3.y = r3.y * r5.w + r1.w;
/*306*/	  r2.w = r2.w * abs(r3.x);
/*307*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*308*/	} else {
/*309*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*310*/	}
/*311*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*312*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*313*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*314*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*315*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*316*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*317*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*318*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*319*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*320*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*321*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*322*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*323*/	r2.w = inversesqrt(r2.w);
/*324*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*325*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*326*/	r2.w = r2.w + r2.w;
/*327*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*328*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*329*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*330*/	r2.x = max(r2.x, 0.000000);
/*331*/	r2.x = log2(r2.x);
/*332*/	r2.x = r2.x * 10.000000;
/*333*/	r2.x = exp2(r2.x);
/*334*/	r2.x = r3.w * r2.x;
/*335*/	r1.w = r2.x * r5.w + r1.w;
/*336*/	r2.xyz = (r6.xyzx * r1.wwww).xyz;
/*337*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*338*/	color0.w = 2.000000;
/*339*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*340*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*341*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*342*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*343*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*344*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*345*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*346*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*347*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*348*/	if(r0.x != 0) discard;
/*349*/	color1.x = 1.000000;
/*350*/	return;
}
