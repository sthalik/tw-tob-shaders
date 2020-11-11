//
//
// Shader Model 4
// Fragment Shader
//
// id: 5694 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weighted.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
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
/*29*/	r0.w = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r4.xyz = (-r0.xyzx + r1.wwww).xyz;
/*33*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*34*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r4.xyz = (-r1.xyzx + r1.wwww).xyz;
/*36*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*37*/	r1.w = vsOut_T7.y * -r3.y + r3.y;
/*38*/	r1.w = vsOut_T7.x * -r1.w + r1.w;
/*39*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*40*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*41*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*42*/	r2.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r2.z = inversesqrt(r2.z);
/*44*/	r3.yzw = (r2.zzzz * vsOut_T3.xxyz).yzw;
/*45*/	r2.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*46*/	r2.z = inversesqrt(r2.z);
/*47*/	r4.xyz = (r2.zzzz * vsOut_T5.xyzx).xyz;
/*48*/	r2.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r2.z = inversesqrt(r2.z);
/*50*/	r5.xyz = (r2.zzzz * vsOut_T2.xyzx).xyz;
/*51*/	r2.yzw = (r2.yyyy * r4.xxyz).yzw;
/*52*/	r2.xyz = (r2.xxxx * r3.yzwy + r2.yzwy).xyz;
/*53*/	r2.xyz = (r0.wwww * r5.xyzx + r2.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*57*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*58*/	r4.w = 1.000000;
/*59*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*60*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*61*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*62*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*64*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*65*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*66*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*67*/	r3.y = intBitsToFloat(int(r2.w));
/*68*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*69*/	if(floatBitsToUint(r3.z) != 0u) {
/*70*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*71*/	  r5.w = vsOut_T0.w;
/*72*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*73*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*74*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*75*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*76*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*77*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*78*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*79*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*80*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*81*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*82*/	  if(floatBitsToUint(r3.w) == 0u) {
/*83*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*84*/	    r7.xy = floor((r6.xyxx).xy);
/*85*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*86*/	    r3.z = -0.000400 / r3.z;
/*87*/	    r3.z = r3.z + r6.z;
/*88*/	    r8.z = -r8.y + 1.000000;
/*89*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*90*/	    r8.w = -r8.y;
/*91*/	    r10.x = cb1.data[0].z/**/;
/*92*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*93*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*94*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*95*/	    r10.w = -cb1.data[0].w/**/;
/*96*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*97*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*98*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*99*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*100*/	    r8.x = r9.x;
/*101*/	    r8.y = r11.x;
/*102*/	    r8.z = r10.x;
/*103*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*104*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*105*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*106*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*107*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*108*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*109*/	    r3.z = -r6.x + r6.y;
/*110*/	    r3.z = r3.w * r3.z + r6.x;
/*111*/	  } else {
/*112*/	    r3.z = 1.000000;
/*113*/	  }
/*114*/	} else {
/*115*/	  r3.z = 1.000000;
/*116*/	}
/*117*/	r3.w = cb1.data[34].w + -1.000000;
/*118*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*119*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*120*/	if(floatBitsToUint(r2.w) == 0u) {
/*121*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*122*/	  r2.w = floatBitsToInt(r2.w);
/*123*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*124*/	  if(floatBitsToUint(r2.w) != 0u) {
/*125*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*126*/	    r5.w = vsOut_T0.w;
/*127*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*128*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*129*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*130*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*131*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*132*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*133*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*134*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*135*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*136*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*137*/	    if(floatBitsToUint(r5.w) == 0u) {
/*138*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*139*/	      r6.xy = floor((r5.xyxx).xy);
/*140*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*141*/	      r2.w = -0.000400 / r2.w;
/*142*/	      r2.w = r2.w + r5.z;
/*143*/	      r7.z = -r7.y + 1.000000;
/*144*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*145*/	      r7.w = -r7.y;
/*146*/	      r9.x = cb1.data[0].z/**/;
/*147*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*148*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*149*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*150*/	      r9.w = -cb1.data[0].w/**/;
/*151*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*152*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*153*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*154*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*155*/	      r7.x = r8.x;
/*156*/	      r7.y = r10.x;
/*157*/	      r7.z = r9.x;
/*158*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*159*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*160*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*161*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*162*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*163*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*164*/	      r2.w = -r5.x + r5.z;
/*165*/	      r2.w = r5.y * r2.w + r5.x;
/*166*/	    } else {
/*167*/	      r2.w = 1.000000;
/*168*/	    }
/*169*/	  } else {
/*170*/	    r2.w = 1.000000;
/*171*/	  }
/*172*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*173*/	  r5.y = r5.x * cb1.data[34].x;
/*174*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*175*/	  r5.x = r0.w + -r5.x;
/*176*/	  r5.x = saturate(r5.x / r5.y);
/*177*/	  r2.w = -r3.z + r2.w;
/*178*/	  r3.z = r5.x * r2.w + r3.z;
/*179*/	}
/*180*/	if(floatBitsToUint(r3.w) != 0u) {
/*181*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*182*/	  r3.w = r2.w * cb1.data[34].y;
/*183*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*184*/	  r2.w = r0.w + -r2.w;
/*185*/	  r2.w = saturate(r2.w / r3.w);
/*186*/	  r3.y = -r3.z + 1.000000;
/*187*/	  r3.z = r2.w * r3.y + r3.z;
/*188*/	}
/*189*/	r3.z = saturate(r3.z);
/*190*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*191*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*192*/	r2.w = inversesqrt(r2.w);
/*193*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*194*/	r2.w = -r3.x + 1.000000;
/*195*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*196*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*197*/	r3.w = r3.w + r3.w;
/*198*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*199*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*200*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*201*/	r3.w = cos((r8.x));
/*202*/	r3.w = inversesqrt(r3.w);
/*203*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*204*/	r5.w = saturate(r1.w * 60.000000);
/*205*/	r5.w = -r1.w + r5.w;
/*206*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*207*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*208*/	r6.w = inversesqrt(r6.w);
/*209*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*210*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*211*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*212*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*213*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*214*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*215*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*216*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*217*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*218*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*219*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*220*/	r6.w = -r1.w + 1.000000;
/*221*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*222*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*223*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*224*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*225*/	  r6.w = max(r6.w, 0.000000);
/*226*/	  r6.w = log2(r6.w);
/*227*/	  r6.w = r6.w * 10.000000;
/*228*/	  r6.w = exp2(r6.w);
/*229*/	  r6.w = r3.w * r6.w;
/*230*/	  r6.w = r6.w * r5.w + r1.w;
/*231*/	  r7.y = r2.w * 8.000000;
/*232*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*233*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*234*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*235*/	}
/*236*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*237*/	r7.y = max(r6.w, 0.000000);
/*238*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*239*/	if(floatBitsToUint(r6.w) != 0u) {
/*240*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*241*/	  r6.x = max(r6.x, -1.000000);
/*242*/	  r6.x = min(r6.x, 1.000000);
/*243*/	  r6.y = -abs(r6.x) + 1.000000;
/*244*/	  r6.y = sqrt(r6.y);
/*245*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*246*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*247*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*248*/	  r6.w = r6.y * r6.z;
/*249*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*250*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*251*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*252*/	  r6.x = r6.z * r6.y + r6.x;
/*253*/	  r3.x = r3.x * r3.x;
/*254*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*255*/	  r3.x = r3.x * r3.y + r7.x;
/*256*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*257*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*258*/	  r3.y = -r3.x * r3.x + 1.000000;
/*259*/	  r3.y = max(r3.y, 0.001000);
/*260*/	  r3.y = log2(r3.y);
/*261*/	  r6.y = r3.y * 4.950617;
/*262*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*263*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*264*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*265*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*266*/	  r3.x = floatBitsToInt(r3.x);
/*267*/	  r6.y = r3.y * r3.y + -r6.y;
/*268*/	  r6.y = sqrt(r6.y);
/*269*/	  r3.y = -r3.y + r6.y;
/*270*/	  r3.y = max(r3.y, 0.000000);
/*271*/	  r3.y = sqrt(r3.y);
/*272*/	  r3.x = r3.y * r3.x;
/*273*/	  r3.x = r3.x * 1.414214;
/*274*/	  r3.x = 0.008727 / r3.x;
/*275*/	  r3.x = max(r3.x, 0.000100);
/*276*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*277*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*278*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*279*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*280*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*281*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*282*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*283*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*284*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*285*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*286*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*287*/	  r3.x = floatBitsToInt(r3.x);
/*288*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*289*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*290*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*291*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*292*/	  r3.x = r3.x * r6.x + 1.000000;
/*293*/	  r3.x = r3.x * 0.500000;
/*294*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*295*/	  r3.y = r3.y * r6.y + 1.000000;
/*296*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*297*/	  r3.y = min(r7.y, 1.000000);
/*298*/	  r2.w = r2.w * 1.570796;
/*299*/	  r2.w = sin(r2.w);
/*300*/	  r3.y = r3.y + -1.000000;
/*301*/	  r2.w = r2.w * r3.y + 1.000000;
/*302*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*303*/	  r3.y = max(r3.y, 0.000000);
/*304*/	  r3.y = log2(r3.y);
/*305*/	  r3.y = r3.y * 10.000000;
/*306*/	  r3.y = exp2(r3.y);
/*307*/	  r3.y = r3.w * r3.y;
/*308*/	  r3.y = r3.y * r5.w + r1.w;
/*309*/	  r2.w = r2.w * abs(r3.x);
/*310*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*311*/	} else {
/*312*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*313*/	}
/*314*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*315*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*316*/	r5.xyz = (max(r1.wwww, r5.xyzx)).xyz;
/*317*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*318*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*319*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*320*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*321*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*322*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*323*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*324*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*325*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*326*/	r2.w = inversesqrt(r2.w);
/*327*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*328*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*329*/	r2.w = r2.w + r2.w;
/*330*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*331*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*332*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*333*/	r2.x = max(r2.x, 0.000000);
/*334*/	r2.x = log2(r2.x);
/*335*/	r2.x = r2.x * 10.000000;
/*336*/	r2.x = exp2(r2.x);
/*337*/	r2.x = r3.w * r2.x;
/*338*/	r1.w = r2.x * r5.w + r1.w;
/*339*/	r2.xyz = (r6.xyzx * r1.wwww).xyz;
/*340*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*341*/	color0.w = 2.000000;
/*342*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*343*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*344*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*345*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*346*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*347*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*348*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*349*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*350*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*351*/	if(r0.x != 0) discard;
/*352*/	color1.x = 1.000000;
/*353*/	return;
}
