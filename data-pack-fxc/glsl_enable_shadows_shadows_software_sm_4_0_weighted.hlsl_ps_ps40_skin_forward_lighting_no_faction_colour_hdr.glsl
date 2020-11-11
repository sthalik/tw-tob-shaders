//
//
// Shader Model 4
// Fragment Shader
//
// id: 5939 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weighted.hlsl_PS_ps40_skin_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;

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
  vec4 r12;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r0.w = sqrt(r0.w);
/*11*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*13*/	r1.z = inversesqrt(r1.z);
/*14*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*15*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*16*/	r1.z = inversesqrt(r1.z);
/*17*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*18*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*19*/	r1.z = inversesqrt(r1.z);
/*20*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*21*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*22*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*23*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*24*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*25*/	r0.w = inversesqrt(r0.w);
/*26*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*27*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*29*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*30*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*31*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*32*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*33*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*34*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*35*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*36*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*37*/	r5.w = 1.000000;
/*38*/	r2.y = dot(r5.xyzw, cb0.data[12].xyzw);
/*39*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*40*/	r7.x = uintBitsToFloat((r2.y >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*41*/	r7.y = uintBitsToFloat((r2.y >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*42*/	r7.z = uintBitsToFloat((r2.y >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*43*/	r7.w = uintBitsToFloat((r2.y >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*44*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*45*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*46*/	r2.w = intBitsToFloat(int(r2.z));
/*47*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r3.w) != 0u) {
/*49*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*50*/	  r6.w = vsOut_T0.w;
/*51*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*52*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*53*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*54*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*55*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*56*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*57*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*58*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*59*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*60*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*61*/	  if(floatBitsToUint(r4.w) == 0u) {
/*62*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*63*/	    r8.xy = floor((r7.xyxx).xy);
/*64*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*65*/	    r3.w = -0.000400 / r3.w;
/*66*/	    r3.w = r3.w + r7.z;
/*67*/	    r9.z = -r9.y + 1.000000;
/*68*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*69*/	    r9.w = -r9.y;
/*70*/	    r11.x = cb1.data[0].z/**/;
/*71*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*72*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*73*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*74*/	    r11.w = -cb1.data[0].w/**/;
/*75*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*76*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*77*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*78*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*79*/	    r9.x = r10.x;
/*80*/	    r9.y = r12.x;
/*81*/	    r9.z = r11.x;
/*82*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*83*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*84*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*85*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*86*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*87*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*88*/	    r3.w = -r7.x + r7.z;
/*89*/	    r3.w = r7.y * r3.w + r7.x;
/*90*/	  } else {
/*91*/	    r3.w = 1.000000;
/*92*/	  }
/*93*/	} else {
/*94*/	  r3.w = 1.000000;
/*95*/	}
/*96*/	r4.w = cb1.data[34].w + -1.000000;
/*97*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*98*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*99*/	if(floatBitsToUint(r2.z) == 0u) {
/*100*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*101*/	  r2.z = floatBitsToInt(r2.z);
/*102*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*103*/	  if(floatBitsToUint(r2.z) != 0u) {
/*104*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*105*/	    r6.w = vsOut_T0.w;
/*106*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*107*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*108*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*109*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*110*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*111*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*112*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*113*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*114*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*115*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*116*/	    if(floatBitsToUint(r6.w) == 0u) {
/*117*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*118*/	      r7.xy = floor((r6.xyxx).xy);
/*119*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*120*/	      r2.z = -0.000400 / r2.z;
/*121*/	      r2.z = r2.z + r6.z;
/*122*/	      r8.z = -r8.y + 1.000000;
/*123*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*124*/	      r8.w = -r8.y;
/*125*/	      r10.x = cb1.data[0].z/**/;
/*126*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*127*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*128*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*129*/	      r10.w = -cb1.data[0].w/**/;
/*130*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*131*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*132*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*133*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*134*/	      r8.x = r9.x;
/*135*/	      r8.y = r11.x;
/*136*/	      r8.z = r10.x;
/*137*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*138*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*139*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*140*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*141*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*142*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*143*/	      r2.z = -r6.x + r6.z;
/*144*/	      r2.z = r6.y * r2.z + r6.x;
/*145*/	    } else {
/*146*/	      r2.z = 1.000000;
/*147*/	    }
/*148*/	  } else {
/*149*/	    r2.z = 1.000000;
/*150*/	  }
/*151*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*152*/	  r6.y = r6.x * cb1.data[34].x;
/*153*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*154*/	  r6.x = r2.y + -r6.x;
/*155*/	  r6.x = saturate(r6.x / r6.y);
/*156*/	  r2.z = -r3.w + r2.z;
/*157*/	  r3.w = r6.x * r2.z + r3.w;
/*158*/	}
/*159*/	if(floatBitsToUint(r4.w) != 0u) {
/*160*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*161*/	  r4.w = r2.z * cb1.data[34].y;
/*162*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*163*/	  r2.z = -r2.z + r2.y;
/*164*/	  r2.z = saturate(r2.z / r4.w);
/*165*/	  r2.w = -r3.w + 1.000000;
/*166*/	  r3.w = r2.z * r2.w + r3.w;
/*167*/	}
/*168*/	r3.w = saturate(r3.w);
/*169*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*170*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*171*/	r2.z = inversesqrt(r2.z);
/*172*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*173*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*174*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*175*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*176*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*177*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*178*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*179*/	r2.w = r2.z * r8.x + 0.300000;
/*180*/	r2.w = saturate(-r2.w + 1.000000);
/*181*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*182*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*183*/	r4.w = -r2.z * r8.x + 1.000000;
/*184*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*185*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*186*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*187*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*188*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*189*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*190*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*191*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*192*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*193*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*194*/	r2.w = saturate(r2.z);
/*195*/	r2.w = r2.w * r2.w;
/*196*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*197*/	r4.w = r4.w * r4.w;
/*198*/	r4.w = r4.w * r4.w;
/*199*/	r2.w = r2.w * r4.w;
/*200*/	r2.w = r4.z * r2.w;
/*201*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*202*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*203*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*204*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*205*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*206*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*207*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*208*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*209*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*210*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*211*/	r2.w = inversesqrt(r2.w);
/*212*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*213*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*214*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*215*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*216*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*217*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*218*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*219*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*220*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*221*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*222*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*223*/	r2.w = r7.z * r7.x;
/*224*/	r2.x = r2.x * r2.x;
/*225*/	r2.z = r2.z + r2.z;
/*226*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*227*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*228*/	r2.z = max(r2.z, 0.000000);
/*229*/	r2.x = r2.x * 127.000000 + 1.600000;
/*230*/	r2.z = log2(r2.z);
/*231*/	r2.x = r2.z * r2.x;
/*232*/	r2.x = exp2(r2.x);
/*233*/	r2.x = min(r2.x, 1.000000);
/*234*/	r1.w = r1.w * r2.x;
/*235*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*236*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*237*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*238*/	r2.x = r1.w + r1.w;
/*239*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*240*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*241*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*242*/	r2.x = inversesqrt(r2.x);
/*243*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*244*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*245*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*246*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*247*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*248*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*249*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*250*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*251*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*252*/	r1.w = saturate(-r1.w + 1.000000);
/*253*/	r1.w = r1.w * r1.w;
/*254*/	r1.w = r4.x * r1.w;
/*255*/	r1.w = r1.w * 1.500000;
/*256*/	r1.w = r7.w * r1.w;
/*257*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*258*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*259*/	r0.w = inversesqrt(r0.w);
/*260*/	r0.w = r0.w * r1.y;
/*261*/	r0.w = max(r0.w, 0.000000);
/*262*/	r0.w = r0.w * r1.w;
/*263*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*264*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*265*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*266*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*267*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*268*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*269*/	r0.xy = (r0.xyxx / r2.yyyy).xy;
/*270*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*271*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*272*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*273*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*274*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*275*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*276*/	if(r0.x != 0) discard;
/*277*/	color0.w = 1.000000;
/*278*/	color1.x = 1.000000;
/*279*/	return;
}
