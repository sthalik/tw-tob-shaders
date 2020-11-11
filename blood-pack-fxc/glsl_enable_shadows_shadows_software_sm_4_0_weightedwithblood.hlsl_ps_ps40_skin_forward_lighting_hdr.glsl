//
//
// Shader Model 4
// Fragment Shader
//
// id: 6212 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithblood.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb4.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r0.w = sqrt(r0.w);
/*18*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*19*/	if(r1.z != 0) discard;
/*20*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*21*/	r1.zw = (r1.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*22*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*23*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*24*/	r1.z = saturate(-r1.z + r2.w);
/*25*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*26*/	if(floatBitsToUint(r1.z) != 0u) {
/*27*/	  r1.z = -r2.w + 1.000000;
/*28*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*29*/	  r1.z = -r1.z + 1.000000;
/*30*/	  r1.z = -r1.z * r1.z + 1.000000;
/*31*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*32*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*33*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*34*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*35*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*36*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*37*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*38*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*39*/	} else {
/*40*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*41*/	}
/*42*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r1.z = inversesqrt(r1.z);
/*44*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*45*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*46*/	r1.z = inversesqrt(r1.z);
/*47*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*48*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r1.z = inversesqrt(r1.z);
/*50*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*51*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*52*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*53*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*57*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*58*/	r1.w = -vsOut_T4.z + 1.000000;
/*59*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*60*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*61*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*62*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*63*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*64*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*65*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*67*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*68*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*69*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*70*/	r5.w = 1.000000;
/*71*/	r2.y = dot(r5.xyzw, cb0.data[12].xyzw);
/*72*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*73*/	r7.x = uintBitsToFloat((r2.y >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*74*/	r7.y = uintBitsToFloat((r2.y >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r7.z = uintBitsToFloat((r2.y >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r7.w = uintBitsToFloat((r2.y >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*77*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*78*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*79*/	r2.w = intBitsToFloat(int(r2.z));
/*80*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*81*/	if(floatBitsToUint(r3.w) != 0u) {
/*82*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*83*/	  r6.w = vsOut_T0.w;
/*84*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*85*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*86*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*87*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*88*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*89*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*90*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*91*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*92*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*93*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*94*/	  if(floatBitsToUint(r4.w) == 0u) {
/*95*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*96*/	    r8.xy = floor((r7.xyxx).xy);
/*97*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*98*/	    r3.w = -0.000400 / r3.w;
/*99*/	    r3.w = r3.w + r7.z;
/*100*/	    r9.z = -r9.y + 1.000000;
/*101*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*102*/	    r9.w = -r9.y;
/*103*/	    r11.x = cb1.data[0].z/**/;
/*104*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*105*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*106*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*107*/	    r11.w = -cb1.data[0].w/**/;
/*108*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*109*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*110*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*111*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*112*/	    r9.x = r10.x;
/*113*/	    r9.y = r12.x;
/*114*/	    r9.z = r11.x;
/*115*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*116*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*117*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*118*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*119*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*120*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*121*/	    r3.w = -r7.x + r7.z;
/*122*/	    r3.w = r7.y * r3.w + r7.x;
/*123*/	  } else {
/*124*/	    r3.w = 1.000000;
/*125*/	  }
/*126*/	} else {
/*127*/	  r3.w = 1.000000;
/*128*/	}
/*129*/	r4.w = cb1.data[34].w + -1.000000;
/*130*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*131*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*132*/	if(floatBitsToUint(r2.z) == 0u) {
/*133*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*134*/	  r2.z = floatBitsToInt(r2.z);
/*135*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*136*/	  if(floatBitsToUint(r2.z) != 0u) {
/*137*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*138*/	    r6.w = vsOut_T0.w;
/*139*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*140*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*141*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*142*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*143*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*144*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*145*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*146*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*147*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*148*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*149*/	    if(floatBitsToUint(r6.w) == 0u) {
/*150*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*151*/	      r7.xy = floor((r6.xyxx).xy);
/*152*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*153*/	      r2.z = -0.000400 / r2.z;
/*154*/	      r2.z = r2.z + r6.z;
/*155*/	      r8.z = -r8.y + 1.000000;
/*156*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*157*/	      r8.w = -r8.y;
/*158*/	      r10.x = cb1.data[0].z/**/;
/*159*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*160*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*161*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*162*/	      r10.w = -cb1.data[0].w/**/;
/*163*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*164*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*165*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*166*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*167*/	      r8.x = r9.x;
/*168*/	      r8.y = r11.x;
/*169*/	      r8.z = r10.x;
/*170*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*171*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*172*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*173*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*174*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*175*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*176*/	      r2.z = -r6.x + r6.z;
/*177*/	      r2.z = r6.y * r2.z + r6.x;
/*178*/	    } else {
/*179*/	      r2.z = 1.000000;
/*180*/	    }
/*181*/	  } else {
/*182*/	    r2.z = 1.000000;
/*183*/	  }
/*184*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*185*/	  r6.y = r6.x * cb1.data[34].x;
/*186*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*187*/	  r6.x = r2.y + -r6.x;
/*188*/	  r6.x = saturate(r6.x / r6.y);
/*189*/	  r2.z = -r3.w + r2.z;
/*190*/	  r3.w = r6.x * r2.z + r3.w;
/*191*/	}
/*192*/	if(floatBitsToUint(r4.w) != 0u) {
/*193*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*194*/	  r4.w = r2.z * cb1.data[34].y;
/*195*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*196*/	  r2.z = -r2.z + r2.y;
/*197*/	  r2.z = saturate(r2.z / r4.w);
/*198*/	  r2.w = -r3.w + 1.000000;
/*199*/	  r3.w = r2.z * r2.w + r3.w;
/*200*/	}
/*201*/	r3.w = saturate(r3.w);
/*202*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*203*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*204*/	r2.z = inversesqrt(r2.z);
/*205*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*206*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*207*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*208*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*209*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*210*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*211*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*212*/	r2.w = r2.z * r8.x + 0.300000;
/*213*/	r2.w = saturate(-r2.w + 1.000000);
/*214*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*215*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*216*/	r4.w = -r2.z * r8.x + 1.000000;
/*217*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*218*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*219*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*220*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*221*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*222*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*223*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*224*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*225*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*226*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*227*/	r2.w = saturate(r2.z);
/*228*/	r2.w = r2.w * r2.w;
/*229*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*230*/	r4.w = r4.w * r4.w;
/*231*/	r4.w = r4.w * r4.w;
/*232*/	r2.w = r2.w * r4.w;
/*233*/	r2.w = r4.z * r2.w;
/*234*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*235*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*236*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*237*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*238*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*239*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*240*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*241*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*242*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*243*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*244*/	r2.w = inversesqrt(r2.w);
/*245*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*246*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*247*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*248*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*249*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*250*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*251*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*252*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*253*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*254*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*255*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*256*/	r2.w = r7.z * r7.x;
/*257*/	r2.x = r2.x * r2.x;
/*258*/	r2.z = r2.z + r2.z;
/*259*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*260*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*261*/	r2.z = max(r2.z, 0.000000);
/*262*/	r2.x = r2.x * 127.000000 + 1.600000;
/*263*/	r2.z = log2(r2.z);
/*264*/	r2.x = r2.z * r2.x;
/*265*/	r2.x = exp2(r2.x);
/*266*/	r2.x = min(r2.x, 1.000000);
/*267*/	r1.w = r1.w * r2.x;
/*268*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*269*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*270*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*271*/	r2.x = r1.w + r1.w;
/*272*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*273*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*274*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*275*/	r2.x = inversesqrt(r2.x);
/*276*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*277*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*278*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*279*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*280*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*281*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*282*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*283*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*284*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*285*/	r1.w = saturate(-r1.w + 1.000000);
/*286*/	r1.w = r1.w * r1.w;
/*287*/	r1.w = r4.x * r1.w;
/*288*/	r1.w = r1.w * 1.500000;
/*289*/	r1.w = r7.w * r1.w;
/*290*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*291*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*292*/	r0.w = inversesqrt(r0.w);
/*293*/	r0.w = r0.w * r1.y;
/*294*/	r0.w = max(r0.w, 0.000000);
/*295*/	r0.w = r0.w * r1.w;
/*296*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*297*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*298*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*299*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*300*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*301*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*302*/	r0.xy = (r0.xyxx / r2.yyyy).xy;
/*303*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*304*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*305*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*306*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*307*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*308*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*309*/	if(r0.x != 0) discard;
/*310*/	color0.w = 1.000000;
/*311*/	color1.x = 1.000000;
/*312*/	return;
}
