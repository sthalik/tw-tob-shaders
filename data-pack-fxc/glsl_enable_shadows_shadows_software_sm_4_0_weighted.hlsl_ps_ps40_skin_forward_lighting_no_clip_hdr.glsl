//
//
// Shader Model 4
// Fragment Shader
//
// id: 5937 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weighted.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb3.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb3.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb3.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*9*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*11*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r0.w = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*17*/	r1.z = inversesqrt(r1.z);
/*18*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*19*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*20*/	r1.z = inversesqrt(r1.z);
/*21*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*22*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*23*/	r1.z = inversesqrt(r1.z);
/*24*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*25*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*26*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*27*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*28*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*29*/	r0.w = inversesqrt(r0.w);
/*30*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*31*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r1.w = -vsOut_T4.z + 1.000000;
/*33*/	r5.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*34*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*35*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*36*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*37*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*38*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*39*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*41*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*42*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*43*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*44*/	r5.w = 1.000000;
/*45*/	r2.y = dot(r5.xyzw, cb0.data[12].xyzw);
/*46*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*47*/	r7.x = uintBitsToFloat((r2.y >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*48*/	r7.y = uintBitsToFloat((r2.y >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*49*/	r7.z = uintBitsToFloat((r2.y >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*50*/	r7.w = uintBitsToFloat((r2.y >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*51*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*52*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*53*/	r2.w = intBitsToFloat(int(r2.z));
/*54*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*55*/	if(floatBitsToUint(r3.w) != 0u) {
/*56*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*57*/	  r6.w = vsOut_T0.w;
/*58*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*59*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*60*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*61*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*62*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*63*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*64*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*65*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*66*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*67*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*68*/	  if(floatBitsToUint(r4.w) == 0u) {
/*69*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*70*/	    r8.xy = floor((r7.xyxx).xy);
/*71*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*72*/	    r3.w = -0.000400 / r3.w;
/*73*/	    r3.w = r3.w + r7.z;
/*74*/	    r9.z = -r9.y + 1.000000;
/*75*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*76*/	    r9.w = -r9.y;
/*77*/	    r11.x = cb1.data[0].z/**/;
/*78*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*79*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*80*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*81*/	    r11.w = -cb1.data[0].w/**/;
/*82*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*83*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*84*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*85*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*86*/	    r9.x = r10.x;
/*87*/	    r9.y = r12.x;
/*88*/	    r9.z = r11.x;
/*89*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*90*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*91*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*92*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*93*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*94*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*95*/	    r3.w = -r7.x + r7.z;
/*96*/	    r3.w = r7.y * r3.w + r7.x;
/*97*/	  } else {
/*98*/	    r3.w = 1.000000;
/*99*/	  }
/*100*/	} else {
/*101*/	  r3.w = 1.000000;
/*102*/	}
/*103*/	r4.w = cb1.data[34].w + -1.000000;
/*104*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*105*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*106*/	if(floatBitsToUint(r2.z) == 0u) {
/*107*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*108*/	  r2.z = floatBitsToInt(r2.z);
/*109*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*110*/	  if(floatBitsToUint(r2.z) != 0u) {
/*111*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*112*/	    r6.w = vsOut_T0.w;
/*113*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*114*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*115*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*116*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*117*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*118*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*119*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*120*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*121*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*122*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*123*/	    if(floatBitsToUint(r6.w) == 0u) {
/*124*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*125*/	      r7.xy = floor((r6.xyxx).xy);
/*126*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*127*/	      r2.z = -0.000400 / r2.z;
/*128*/	      r2.z = r2.z + r6.z;
/*129*/	      r8.z = -r8.y + 1.000000;
/*130*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*131*/	      r8.w = -r8.y;
/*132*/	      r10.x = cb1.data[0].z/**/;
/*133*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*134*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*135*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*136*/	      r10.w = -cb1.data[0].w/**/;
/*137*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*138*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*139*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*140*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*141*/	      r8.x = r9.x;
/*142*/	      r8.y = r11.x;
/*143*/	      r8.z = r10.x;
/*144*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*145*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*146*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*147*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*148*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*149*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*150*/	      r2.z = -r6.x + r6.z;
/*151*/	      r2.z = r6.y * r2.z + r6.x;
/*152*/	    } else {
/*153*/	      r2.z = 1.000000;
/*154*/	    }
/*155*/	  } else {
/*156*/	    r2.z = 1.000000;
/*157*/	  }
/*158*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*159*/	  r6.y = r6.x * cb1.data[34].x;
/*160*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*161*/	  r6.x = r2.y + -r6.x;
/*162*/	  r6.x = saturate(r6.x / r6.y);
/*163*/	  r2.z = -r3.w + r2.z;
/*164*/	  r3.w = r6.x * r2.z + r3.w;
/*165*/	}
/*166*/	if(floatBitsToUint(r4.w) != 0u) {
/*167*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*168*/	  r4.w = r2.z * cb1.data[34].y;
/*169*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*170*/	  r2.z = -r2.z + r2.y;
/*171*/	  r2.z = saturate(r2.z / r4.w);
/*172*/	  r2.w = -r3.w + 1.000000;
/*173*/	  r3.w = r2.z * r2.w + r3.w;
/*174*/	}
/*175*/	r3.w = saturate(r3.w);
/*176*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*177*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*178*/	r2.z = inversesqrt(r2.z);
/*179*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*180*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*181*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*182*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*183*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*184*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*185*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*186*/	r2.w = r2.z * r8.x + 0.300000;
/*187*/	r2.w = saturate(-r2.w + 1.000000);
/*188*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*189*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*190*/	r4.w = -r2.z * r8.x + 1.000000;
/*191*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*192*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*193*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*194*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*195*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*196*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*197*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*198*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*199*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*200*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*201*/	r2.w = saturate(r2.z);
/*202*/	r2.w = r2.w * r2.w;
/*203*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*204*/	r4.w = r4.w * r4.w;
/*205*/	r4.w = r4.w * r4.w;
/*206*/	r2.w = r2.w * r4.w;
/*207*/	r2.w = r4.z * r2.w;
/*208*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*209*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*210*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*211*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*212*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*213*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*214*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*215*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*216*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*217*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*218*/	r2.w = inversesqrt(r2.w);
/*219*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*220*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*221*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*222*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*223*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*224*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*225*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*226*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*227*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*228*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*229*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*230*/	r2.w = r7.z * r7.x;
/*231*/	r2.x = r2.x * r2.x;
/*232*/	r2.z = r2.z + r2.z;
/*233*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*234*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*235*/	r2.z = max(r2.z, 0.000000);
/*236*/	r2.x = r2.x * 127.000000 + 1.600000;
/*237*/	r2.z = log2(r2.z);
/*238*/	r2.x = r2.z * r2.x;
/*239*/	r2.x = exp2(r2.x);
/*240*/	r2.x = min(r2.x, 1.000000);
/*241*/	r1.w = r1.w * r2.x;
/*242*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*243*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*244*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*245*/	r2.x = r1.w + r1.w;
/*246*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*247*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*248*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*249*/	r2.x = inversesqrt(r2.x);
/*250*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*251*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*252*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*253*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*254*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*255*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*256*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*257*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*258*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*259*/	r1.w = saturate(-r1.w + 1.000000);
/*260*/	r1.w = r1.w * r1.w;
/*261*/	r1.w = r4.x * r1.w;
/*262*/	r1.w = r1.w * 1.500000;
/*263*/	r1.w = r7.w * r1.w;
/*264*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*265*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*266*/	r0.w = inversesqrt(r0.w);
/*267*/	r0.w = r0.w * r1.y;
/*268*/	r0.w = max(r0.w, 0.000000);
/*269*/	r0.w = r0.w * r1.w;
/*270*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*271*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*272*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*273*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*274*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*275*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*276*/	r0.xy = (r0.xyxx / r2.yyyy).xy;
/*277*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*278*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*279*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*280*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*281*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*282*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*283*/	if(r0.x != 0) discard;
/*284*/	color0.w = 1.000000;
/*285*/	color1.x = 1.000000;
/*286*/	return;
}
