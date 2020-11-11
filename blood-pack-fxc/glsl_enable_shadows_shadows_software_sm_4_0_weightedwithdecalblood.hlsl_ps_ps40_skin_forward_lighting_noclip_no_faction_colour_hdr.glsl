//
//
// Shader Model 4
// Fragment Shader
//
// id: 6507 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalblood.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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
/*7*/	r1.z = sqrt(r0.w);
/*8*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*9*/	r2.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*10*/	r3.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*11*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*12*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*13*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*17*/	r3.z = vsOut_T6.z;
/*18*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*19*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*20*/	if(floatBitsToUint(r0.w) != 0u) {
/*21*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*22*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*24*/	  r0.w = -r0.w + 1.000000;
/*25*/	  r0.w = max(r0.w, 0.000000);
/*26*/	  r3.z = sqrt(r0.w);
/*27*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*29*/	  r0.w = r2.x * r6.w;
/*30*/	  r2.x = r0.w * -0.500000 + r2.x;
/*31*/	  r0.w = -r4.w * r5.w + 1.000000;
/*32*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*33*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*34*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*35*/	}
/*36*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*37*/	if(r0.w != 0) discard;
/*38*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*39*/	r2.zw = (r2.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*40*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*41*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*42*/	r0.w = saturate(-r0.w + r3.w);
/*43*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*44*/	if(floatBitsToUint(r0.w) != 0u) {
/*45*/	  r0.w = -r3.w + 1.000000;
/*46*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*47*/	  r0.w = -r0.w + 1.000000;
/*48*/	  r0.w = -r0.w * r0.w + 1.000000;
/*49*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*50*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*51*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*52*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*53*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*54*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*55*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*56*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*57*/	}
/*58*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r0.w = inversesqrt(r0.w);
/*60*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*61*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*64*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r0.w = inversesqrt(r0.w);
/*66*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*68*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*69*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*70*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*71*/	r0.w = inversesqrt(r0.w);
/*72*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*73*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*74*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*75*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*76*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*77*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*78*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*79*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*80*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*81*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*82*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*83*/	r5.w = 1.000000;
/*84*/	r2.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*85*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*86*/	r7.x = uintBitsToFloat((r2.x >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*87*/	r7.y = uintBitsToFloat((r2.x >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*88*/	r7.z = uintBitsToFloat((r2.x >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r7.w = uintBitsToFloat((r2.x >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*90*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*91*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*92*/	r2.w = intBitsToFloat(int(r2.z));
/*93*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*94*/	if(floatBitsToUint(r3.w) != 0u) {
/*95*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*96*/	  r6.w = vsOut_T0.w;
/*97*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*98*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*99*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*100*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*101*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*102*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*103*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*104*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*105*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*106*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*107*/	  if(floatBitsToUint(r4.w) == 0u) {
/*108*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*109*/	    r8.xy = floor((r7.xyxx).xy);
/*110*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*111*/	    r3.w = -0.000400 / r3.w;
/*112*/	    r3.w = r3.w + r7.z;
/*113*/	    r9.z = -r9.y + 1.000000;
/*114*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*115*/	    r9.w = -r9.y;
/*116*/	    r11.x = cb1.data[0].z/**/;
/*117*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*118*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*119*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*120*/	    r11.w = -cb1.data[0].w/**/;
/*121*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*122*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*123*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*124*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*125*/	    r9.x = r10.x;
/*126*/	    r9.y = r12.x;
/*127*/	    r9.z = r11.x;
/*128*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*129*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*130*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*131*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*132*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*133*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*134*/	    r3.w = -r7.x + r7.z;
/*135*/	    r3.w = r7.y * r3.w + r7.x;
/*136*/	  } else {
/*137*/	    r3.w = 1.000000;
/*138*/	  }
/*139*/	} else {
/*140*/	  r3.w = 1.000000;
/*141*/	}
/*142*/	r4.w = cb1.data[34].w + -1.000000;
/*143*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*144*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*145*/	if(floatBitsToUint(r2.z) == 0u) {
/*146*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*147*/	  r2.z = floatBitsToInt(r2.z);
/*148*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*149*/	  if(floatBitsToUint(r2.z) != 0u) {
/*150*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*151*/	    r6.w = vsOut_T0.w;
/*152*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*153*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*154*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*155*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*156*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*157*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*158*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*159*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*160*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*161*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*162*/	    if(floatBitsToUint(r6.w) == 0u) {
/*163*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*164*/	      r7.xy = floor((r6.xyxx).xy);
/*165*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*166*/	      r2.z = -0.000400 / r2.z;
/*167*/	      r2.z = r2.z + r6.z;
/*168*/	      r8.z = -r8.y + 1.000000;
/*169*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*170*/	      r8.w = -r8.y;
/*171*/	      r10.x = cb1.data[0].z/**/;
/*172*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*173*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*174*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*175*/	      r10.w = -cb1.data[0].w/**/;
/*176*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*177*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*178*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*179*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*180*/	      r8.x = r9.x;
/*181*/	      r8.y = r11.x;
/*182*/	      r8.z = r10.x;
/*183*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*184*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*185*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*186*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*187*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*188*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*189*/	      r2.z = -r6.x + r6.z;
/*190*/	      r2.z = r6.y * r2.z + r6.x;
/*191*/	    } else {
/*192*/	      r2.z = 1.000000;
/*193*/	    }
/*194*/	  } else {
/*195*/	    r2.z = 1.000000;
/*196*/	  }
/*197*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*198*/	  r6.y = r6.x * cb1.data[34].x;
/*199*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*200*/	  r6.x = r2.x + -r6.x;
/*201*/	  r6.x = saturate(r6.x / r6.y);
/*202*/	  r2.z = -r3.w + r2.z;
/*203*/	  r3.w = r6.x * r2.z + r3.w;
/*204*/	}
/*205*/	if(floatBitsToUint(r4.w) != 0u) {
/*206*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*207*/	  r4.w = r2.z * cb1.data[34].y;
/*208*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*209*/	  r2.z = -r2.z + r2.x;
/*210*/	  r2.z = saturate(r2.z / r4.w);
/*211*/	  r2.w = -r3.w + 1.000000;
/*212*/	  r3.w = r2.z * r2.w + r3.w;
/*213*/	}
/*214*/	r3.w = saturate(r3.w);
/*215*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*216*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*217*/	r2.z = inversesqrt(r2.z);
/*218*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*219*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*220*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*221*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*222*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*223*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*224*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*225*/	r2.w = r2.z * r8.x + 0.300000;
/*226*/	r2.w = saturate(-r2.w + 1.000000);
/*227*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*228*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*229*/	r4.w = -r2.z * r8.x + 1.000000;
/*230*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*231*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*232*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*233*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*234*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*235*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*236*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*237*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*238*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*239*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*240*/	r2.w = saturate(r2.z);
/*241*/	r2.w = r2.w * r2.w;
/*242*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*243*/	r4.w = r4.w * r4.w;
/*244*/	r4.w = r4.w * r4.w;
/*245*/	r2.w = r2.w * r4.w;
/*246*/	r2.w = r4.z * r2.w;
/*247*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*248*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*249*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*250*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*251*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*252*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*253*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*254*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*255*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*256*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*257*/	r2.w = inversesqrt(r2.w);
/*258*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*259*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*260*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*261*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*262*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*263*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*264*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*265*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*266*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*267*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*268*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*269*/	r2.w = r7.z * r7.x;
/*270*/	r2.y = r2.y * r2.y;
/*271*/	r2.z = r2.z + r2.z;
/*272*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*273*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*274*/	r2.z = max(r2.z, 0.000000);
/*275*/	r2.y = r2.y * 127.000000 + 1.600000;
/*276*/	r2.z = log2(r2.z);
/*277*/	r2.y = r2.z * r2.y;
/*278*/	r2.y = exp2(r2.y);
/*279*/	r2.y = min(r2.y, 1.000000);
/*280*/	r1.w = r1.w * r2.y;
/*281*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*282*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*283*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*284*/	r2.y = r1.w + r1.w;
/*285*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*286*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*287*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*288*/	r2.y = inversesqrt(r2.y);
/*289*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*290*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*291*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*292*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*293*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*294*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*295*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*296*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*297*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*298*/	r1.w = saturate(-r1.w + 1.000000);
/*299*/	r1.w = r1.w * r1.w;
/*300*/	r1.w = r4.x * r1.w;
/*301*/	r1.w = r1.w * 1.500000;
/*302*/	r1.w = r7.w * r1.w;
/*303*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*304*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*305*/	r0.w = inversesqrt(r0.w);
/*306*/	r0.w = r0.w * r1.y;
/*307*/	r0.w = max(r0.w, 0.000000);
/*308*/	r0.w = r0.w * r1.w;
/*309*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*310*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*311*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*312*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*313*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*314*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*315*/	r0.xy = (r0.xyxx / r2.xxxx).xy;
/*316*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*317*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*318*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*319*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*320*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*321*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*322*/	if(r0.x != 0) discard;
/*323*/	color0.w = 1.000000;
/*324*/	color1.x = 1.000000;
/*325*/	return;
}
