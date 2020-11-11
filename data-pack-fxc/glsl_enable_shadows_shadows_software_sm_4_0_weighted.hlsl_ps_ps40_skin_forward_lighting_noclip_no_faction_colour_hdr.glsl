//
//
// Shader Model 4
// Fragment Shader
//
// id: 5941 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weighted.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r0.w = sqrt(r0.w);
/*8*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*10*/	r1.z = inversesqrt(r1.z);
/*11*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*12*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*13*/	r1.z = inversesqrt(r1.z);
/*14*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*15*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*16*/	r1.z = inversesqrt(r1.z);
/*17*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*18*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*19*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*20*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*21*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*22*/	r0.w = inversesqrt(r0.w);
/*23*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*24*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*26*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*27*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*28*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*29*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*30*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*31*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*32*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*33*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*34*/	r5.w = 1.000000;
/*35*/	r2.y = dot(r5.xyzw, cb0.data[12].xyzw);
/*36*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*37*/	r7.x = uintBitsToFloat((r2.y >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*38*/	r7.y = uintBitsToFloat((r2.y >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*39*/	r7.z = uintBitsToFloat((r2.y >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*40*/	r7.w = uintBitsToFloat((r2.y >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*41*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*42*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*43*/	r2.w = intBitsToFloat(int(r2.z));
/*44*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*45*/	if(floatBitsToUint(r3.w) != 0u) {
/*46*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*47*/	  r6.w = vsOut_T0.w;
/*48*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*49*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*50*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*51*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*52*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*53*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*54*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*55*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*56*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*57*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*58*/	  if(floatBitsToUint(r4.w) == 0u) {
/*59*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*60*/	    r8.xy = floor((r7.xyxx).xy);
/*61*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*62*/	    r3.w = -0.000400 / r3.w;
/*63*/	    r3.w = r3.w + r7.z;
/*64*/	    r9.z = -r9.y + 1.000000;
/*65*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*66*/	    r9.w = -r9.y;
/*67*/	    r11.x = cb1.data[0].z/**/;
/*68*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*69*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*70*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*71*/	    r11.w = -cb1.data[0].w/**/;
/*72*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*73*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*74*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*75*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*76*/	    r9.x = r10.x;
/*77*/	    r9.y = r12.x;
/*78*/	    r9.z = r11.x;
/*79*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*80*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*81*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*82*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*83*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*84*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*85*/	    r3.w = -r7.x + r7.z;
/*86*/	    r3.w = r7.y * r3.w + r7.x;
/*87*/	  } else {
/*88*/	    r3.w = 1.000000;
/*89*/	  }
/*90*/	} else {
/*91*/	  r3.w = 1.000000;
/*92*/	}
/*93*/	r4.w = cb1.data[34].w + -1.000000;
/*94*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*95*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*96*/	if(floatBitsToUint(r2.z) == 0u) {
/*97*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*98*/	  r2.z = floatBitsToInt(r2.z);
/*99*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*100*/	  if(floatBitsToUint(r2.z) != 0u) {
/*101*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*102*/	    r6.w = vsOut_T0.w;
/*103*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*104*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*105*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*106*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*107*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*108*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*109*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*110*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*111*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*112*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*113*/	    if(floatBitsToUint(r6.w) == 0u) {
/*114*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*115*/	      r7.xy = floor((r6.xyxx).xy);
/*116*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*117*/	      r2.z = -0.000400 / r2.z;
/*118*/	      r2.z = r2.z + r6.z;
/*119*/	      r8.z = -r8.y + 1.000000;
/*120*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*121*/	      r8.w = -r8.y;
/*122*/	      r10.x = cb1.data[0].z/**/;
/*123*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*124*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*125*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*126*/	      r10.w = -cb1.data[0].w/**/;
/*127*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*128*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*129*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*130*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*131*/	      r8.x = r9.x;
/*132*/	      r8.y = r11.x;
/*133*/	      r8.z = r10.x;
/*134*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*135*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*136*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*137*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*138*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*139*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*140*/	      r2.z = -r6.x + r6.z;
/*141*/	      r2.z = r6.y * r2.z + r6.x;
/*142*/	    } else {
/*143*/	      r2.z = 1.000000;
/*144*/	    }
/*145*/	  } else {
/*146*/	    r2.z = 1.000000;
/*147*/	  }
/*148*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*149*/	  r6.y = r6.x * cb1.data[34].x;
/*150*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*151*/	  r6.x = r2.y + -r6.x;
/*152*/	  r6.x = saturate(r6.x / r6.y);
/*153*/	  r2.z = -r3.w + r2.z;
/*154*/	  r3.w = r6.x * r2.z + r3.w;
/*155*/	}
/*156*/	if(floatBitsToUint(r4.w) != 0u) {
/*157*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*158*/	  r4.w = r2.z * cb1.data[34].y;
/*159*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*160*/	  r2.z = -r2.z + r2.y;
/*161*/	  r2.z = saturate(r2.z / r4.w);
/*162*/	  r2.w = -r3.w + 1.000000;
/*163*/	  r3.w = r2.z * r2.w + r3.w;
/*164*/	}
/*165*/	r3.w = saturate(r3.w);
/*166*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*167*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*168*/	r2.z = inversesqrt(r2.z);
/*169*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*170*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*171*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*172*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*173*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*174*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*175*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*176*/	r2.w = r2.z * r8.x + 0.300000;
/*177*/	r2.w = saturate(-r2.w + 1.000000);
/*178*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*179*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*180*/	r4.w = -r2.z * r8.x + 1.000000;
/*181*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*182*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*183*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*184*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*185*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*186*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*187*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*188*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*189*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*190*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*191*/	r2.w = saturate(r2.z);
/*192*/	r2.w = r2.w * r2.w;
/*193*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*194*/	r4.w = r4.w * r4.w;
/*195*/	r4.w = r4.w * r4.w;
/*196*/	r2.w = r2.w * r4.w;
/*197*/	r2.w = r4.z * r2.w;
/*198*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*199*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*200*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*201*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*202*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*203*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*204*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*205*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*206*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*207*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*208*/	r2.w = inversesqrt(r2.w);
/*209*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*210*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*211*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*212*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*213*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*214*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*215*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*216*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*217*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*218*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*219*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*220*/	r2.w = r7.z * r7.x;
/*221*/	r2.x = r2.x * r2.x;
/*222*/	r2.z = r2.z + r2.z;
/*223*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*224*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*225*/	r2.z = max(r2.z, 0.000000);
/*226*/	r2.x = r2.x * 127.000000 + 1.600000;
/*227*/	r2.z = log2(r2.z);
/*228*/	r2.x = r2.z * r2.x;
/*229*/	r2.x = exp2(r2.x);
/*230*/	r2.x = min(r2.x, 1.000000);
/*231*/	r1.w = r1.w * r2.x;
/*232*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*233*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*234*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*235*/	r2.x = r1.w + r1.w;
/*236*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*237*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*238*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*239*/	r2.x = inversesqrt(r2.x);
/*240*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*241*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*242*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*243*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*244*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*245*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*246*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*247*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*248*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*249*/	r1.w = saturate(-r1.w + 1.000000);
/*250*/	r1.w = r1.w * r1.w;
/*251*/	r1.w = r4.x * r1.w;
/*252*/	r1.w = r1.w * 1.500000;
/*253*/	r1.w = r7.w * r1.w;
/*254*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*255*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*256*/	r0.w = inversesqrt(r0.w);
/*257*/	r0.w = r0.w * r1.y;
/*258*/	r0.w = max(r0.w, 0.000000);
/*259*/	r0.w = r0.w * r1.w;
/*260*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*261*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*262*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*263*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*264*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*265*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*266*/	r0.xy = (r0.xyxx / r2.yyyy).xy;
/*267*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*268*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*269*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*270*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*271*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*272*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*273*/	if(r0.x != 0) discard;
/*274*/	color0.w = 1.000000;
/*275*/	color1.x = 1.000000;
/*276*/	return;
}
