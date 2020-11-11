//
//
// Shader Model 4
// Fragment Shader
//
// id: 6214 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithblood.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_blood_map;
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
/*2*/	r2.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb4.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*9*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*11*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r0.w = sqrt(r0.w);
/*15*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*16*/	if(r1.z != 0) discard;
/*17*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*18*/	r1.zw = (r1.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*19*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*20*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*21*/	r1.z = saturate(-r1.z + r2.w);
/*22*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*23*/	if(floatBitsToUint(r1.z) != 0u) {
/*24*/	  r1.z = -r2.w + 1.000000;
/*25*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*26*/	  r1.z = -r1.z + 1.000000;
/*27*/	  r1.z = -r1.z * r1.z + 1.000000;
/*28*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*29*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*30*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*31*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*32*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*33*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*34*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*35*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*36*/	} else {
/*37*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*38*/	}
/*39*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r1.z = inversesqrt(r1.z);
/*41*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*42*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*43*/	r1.z = inversesqrt(r1.z);
/*44*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*45*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r1.z = inversesqrt(r1.z);
/*47*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*48*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*49*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*50*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*51*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*54*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	r1.w = -vsOut_T4.z + 1.000000;
/*56*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*57*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*58*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*59*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*60*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*61*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*62*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*64*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*65*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*66*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*67*/	r5.w = 1.000000;
/*68*/	r2.y = dot(r5.xyzw, cb0.data[12].xyzw);
/*69*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*70*/	r7.x = uintBitsToFloat((r2.y >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*71*/	r7.y = uintBitsToFloat((r2.y >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r7.z = uintBitsToFloat((r2.y >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r7.w = uintBitsToFloat((r2.y >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*74*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*75*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*76*/	r2.w = intBitsToFloat(int(r2.z));
/*77*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*78*/	if(floatBitsToUint(r3.w) != 0u) {
/*79*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*80*/	  r6.w = vsOut_T0.w;
/*81*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*82*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*83*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*84*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*85*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*86*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*87*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*88*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*89*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*90*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*91*/	  if(floatBitsToUint(r4.w) == 0u) {
/*92*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*93*/	    r8.xy = floor((r7.xyxx).xy);
/*94*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*95*/	    r3.w = -0.000400 / r3.w;
/*96*/	    r3.w = r3.w + r7.z;
/*97*/	    r9.z = -r9.y + 1.000000;
/*98*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*99*/	    r9.w = -r9.y;
/*100*/	    r11.x = cb1.data[0].z/**/;
/*101*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*102*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*103*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*104*/	    r11.w = -cb1.data[0].w/**/;
/*105*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*106*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*107*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*108*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*109*/	    r9.x = r10.x;
/*110*/	    r9.y = r12.x;
/*111*/	    r9.z = r11.x;
/*112*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*113*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*114*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*115*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*116*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*117*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*118*/	    r3.w = -r7.x + r7.z;
/*119*/	    r3.w = r7.y * r3.w + r7.x;
/*120*/	  } else {
/*121*/	    r3.w = 1.000000;
/*122*/	  }
/*123*/	} else {
/*124*/	  r3.w = 1.000000;
/*125*/	}
/*126*/	r4.w = cb1.data[34].w + -1.000000;
/*127*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*128*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*129*/	if(floatBitsToUint(r2.z) == 0u) {
/*130*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*131*/	  r2.z = floatBitsToInt(r2.z);
/*132*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*133*/	  if(floatBitsToUint(r2.z) != 0u) {
/*134*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*135*/	    r6.w = vsOut_T0.w;
/*136*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*137*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*138*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*139*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*140*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*141*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*142*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*143*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*144*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*145*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*146*/	    if(floatBitsToUint(r6.w) == 0u) {
/*147*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*148*/	      r7.xy = floor((r6.xyxx).xy);
/*149*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*150*/	      r2.z = -0.000400 / r2.z;
/*151*/	      r2.z = r2.z + r6.z;
/*152*/	      r8.z = -r8.y + 1.000000;
/*153*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*154*/	      r8.w = -r8.y;
/*155*/	      r10.x = cb1.data[0].z/**/;
/*156*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*157*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*158*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*159*/	      r10.w = -cb1.data[0].w/**/;
/*160*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*161*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*162*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*163*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*164*/	      r8.x = r9.x;
/*165*/	      r8.y = r11.x;
/*166*/	      r8.z = r10.x;
/*167*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*168*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*169*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*170*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*171*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*172*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*173*/	      r2.z = -r6.x + r6.z;
/*174*/	      r2.z = r6.y * r2.z + r6.x;
/*175*/	    } else {
/*176*/	      r2.z = 1.000000;
/*177*/	    }
/*178*/	  } else {
/*179*/	    r2.z = 1.000000;
/*180*/	  }
/*181*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*182*/	  r6.y = r6.x * cb1.data[34].x;
/*183*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*184*/	  r6.x = r2.y + -r6.x;
/*185*/	  r6.x = saturate(r6.x / r6.y);
/*186*/	  r2.z = -r3.w + r2.z;
/*187*/	  r3.w = r6.x * r2.z + r3.w;
/*188*/	}
/*189*/	if(floatBitsToUint(r4.w) != 0u) {
/*190*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*191*/	  r4.w = r2.z * cb1.data[34].y;
/*192*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*193*/	  r2.z = -r2.z + r2.y;
/*194*/	  r2.z = saturate(r2.z / r4.w);
/*195*/	  r2.w = -r3.w + 1.000000;
/*196*/	  r3.w = r2.z * r2.w + r3.w;
/*197*/	}
/*198*/	r3.w = saturate(r3.w);
/*199*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*200*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*201*/	r2.z = inversesqrt(r2.z);
/*202*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*203*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*204*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*205*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*206*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*207*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*208*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*209*/	r2.w = r2.z * r8.x + 0.300000;
/*210*/	r2.w = saturate(-r2.w + 1.000000);
/*211*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*212*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*213*/	r4.w = -r2.z * r8.x + 1.000000;
/*214*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*215*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*216*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*217*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*218*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*219*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*220*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*221*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*222*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*223*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*224*/	r2.w = saturate(r2.z);
/*225*/	r2.w = r2.w * r2.w;
/*226*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*227*/	r4.w = r4.w * r4.w;
/*228*/	r4.w = r4.w * r4.w;
/*229*/	r2.w = r2.w * r4.w;
/*230*/	r2.w = r4.z * r2.w;
/*231*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*232*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*233*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*234*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*235*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*236*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*237*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*238*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*239*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*240*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*241*/	r2.w = inversesqrt(r2.w);
/*242*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*243*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*244*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*245*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*246*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*247*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*248*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*249*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*250*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*251*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*252*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*253*/	r2.w = r7.z * r7.x;
/*254*/	r2.x = r2.x * r2.x;
/*255*/	r2.z = r2.z + r2.z;
/*256*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*257*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*258*/	r2.z = max(r2.z, 0.000000);
/*259*/	r2.x = r2.x * 127.000000 + 1.600000;
/*260*/	r2.z = log2(r2.z);
/*261*/	r2.x = r2.z * r2.x;
/*262*/	r2.x = exp2(r2.x);
/*263*/	r2.x = min(r2.x, 1.000000);
/*264*/	r1.w = r1.w * r2.x;
/*265*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*266*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*267*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*268*/	r2.x = r1.w + r1.w;
/*269*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*270*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*271*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*272*/	r2.x = inversesqrt(r2.x);
/*273*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*274*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*275*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*276*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*277*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*278*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*279*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*280*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*281*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*282*/	r1.w = saturate(-r1.w + 1.000000);
/*283*/	r1.w = r1.w * r1.w;
/*284*/	r1.w = r4.x * r1.w;
/*285*/	r1.w = r1.w * 1.500000;
/*286*/	r1.w = r7.w * r1.w;
/*287*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*288*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*289*/	r0.w = inversesqrt(r0.w);
/*290*/	r0.w = r0.w * r1.y;
/*291*/	r0.w = max(r0.w, 0.000000);
/*292*/	r0.w = r0.w * r1.w;
/*293*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*294*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*295*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*296*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*297*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*298*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*299*/	r0.xy = (r0.xyxx / r2.yyyy).xy;
/*300*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*301*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*302*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*303*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*304*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*305*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*306*/	if(r0.x != 0) discard;
/*307*/	color0.w = 1.000000;
/*308*/	color1.x = 1.000000;
/*309*/	return;
}
