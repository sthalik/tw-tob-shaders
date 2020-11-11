//
//
// Shader Model 4
// Fragment Shader
//
// id: 6206 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithblood.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform shadowmap_PS
{
  vec4 data[45];
} cb2;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb3;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb4;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb5;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*2*/	r2.xyz = (cb6.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb6.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb6.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
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
/*18*/	r1.zw = (r1.zzzw * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*56*/	r5.xyz = (vsOut_T4.zzzz * cb6.data[3].xyzx).xyz;
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
/*68*/	r2.y = dot(r5.xyzw, cb1.data[12].xyzw);
/*69*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*70*/	r7.x = uintBitsToFloat((r2.y >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*71*/	r7.y = uintBitsToFloat((r2.y >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r7.z = uintBitsToFloat((r2.y >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r7.w = uintBitsToFloat((r2.y >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*74*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*75*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*76*/	r2.w = intBitsToFloat(int(r2.z));
/*77*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*78*/	if(floatBitsToUint(r3.w) != 0u) {
/*79*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*80*/	  r6.w = vsOut_T0.w;
/*81*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*82*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*83*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*84*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*85*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*86*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*87*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*88*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*89*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*90*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*91*/	  if(floatBitsToUint(r4.w) == 0u) {
/*92*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*93*/	    r8.xy = floor((r7.xyxx).xy);
/*94*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*95*/	    r3.w = -0.000400 / r3.w;
/*96*/	    r3.w = r3.w + r7.z;
/*97*/	    r9.z = -r9.y + 1.000000;
/*98*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*99*/	    r9.w = -r9.y;
/*100*/	    r11.x = cb2.data[0].z/**/;
/*101*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*102*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*103*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*104*/	    r11.w = -cb2.data[0].w/**/;
/*105*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*106*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*107*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
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
/*126*/	r4.w = cb2.data[34].w + -1.000000;
/*127*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*128*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*129*/	if(floatBitsToUint(r2.z) == 0u) {
/*130*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*131*/	  r2.z = floatBitsToInt(r2.z);
/*132*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*133*/	  if(floatBitsToUint(r2.z) != 0u) {
/*134*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*135*/	    r6.w = vsOut_T0.w;
/*136*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*137*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*138*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*139*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*140*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*141*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*142*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*143*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*144*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*145*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*146*/	    if(floatBitsToUint(r6.w) == 0u) {
/*147*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*148*/	      r7.xy = floor((r6.xyxx).xy);
/*149*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*150*/	      r2.z = -0.000400 / r2.z;
/*151*/	      r2.z = r2.z + r6.z;
/*152*/	      r8.z = -r8.y + 1.000000;
/*153*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*154*/	      r8.w = -r8.y;
/*155*/	      r10.x = cb2.data[0].z/**/;
/*156*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*157*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*158*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*159*/	      r10.w = -cb2.data[0].w/**/;
/*160*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*161*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*162*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
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
/*181*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*182*/	  r6.y = r6.x * cb2.data[34].x;
/*183*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*184*/	  r6.x = r2.y + -r6.x;
/*185*/	  r6.x = saturate(r6.x / r6.y);
/*186*/	  r2.z = -r3.w + r2.z;
/*187*/	  r3.w = r6.x * r2.z + r3.w;
/*188*/	}
/*189*/	if(floatBitsToUint(r4.w) != 0u) {
/*190*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*191*/	  r4.w = r2.z * cb2.data[34].y;
/*192*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*193*/	  r2.z = -r2.z + r2.y;
/*194*/	  r2.z = saturate(r2.z / r4.w);
/*195*/	  r2.w = -r3.w + 1.000000;
/*196*/	  r3.w = r2.z * r2.w + r3.w;
/*197*/	}
/*198*/	r3.w = saturate(r3.w);
/*199*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*200*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*201*/	r2.w = inversesqrt(r2.z);
/*202*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*203*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*204*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*205*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*206*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*207*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*208*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*209*/	r4.w = r2.w * r9.x + 0.300000;
/*210*/	r4.w = saturate(-r4.w + 1.000000);
/*211*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*212*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*213*/	r7.w = -r2.w * r9.x + 1.000000;
/*214*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*215*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*216*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*217*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*218*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*219*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*220*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*221*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*222*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*223*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*224*/	r4.w = saturate(r2.w);
/*225*/	r4.w = r4.w * r4.w;
/*226*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*227*/	r7.w = r7.w * r7.w;
/*228*/	r7.w = r7.w * r7.w;
/*229*/	r4.w = r4.w * r7.w;
/*230*/	r4.z = r4.z * r4.w;
/*231*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*232*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*233*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*234*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*235*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*236*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*237*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*238*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*239*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*240*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*241*/	r7.w = inversesqrt(r7.w);
/*242*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*243*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*244*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*245*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*246*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*247*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*248*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*249*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*250*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*251*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*252*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*253*/	r7.w = r8.z * r8.x;
/*254*/	r2.x = r2.x * r2.x;
/*255*/	r2.w = r2.w + r2.w;
/*256*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*257*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*258*/	r2.w = max(r2.w, 0.000000);
/*259*/	r2.x = r2.x * 127.000000 + 1.600000;
/*260*/	r2.w = log2(r2.w);
/*261*/	r2.x = r2.w * r2.x;
/*262*/	r2.x = exp2(r2.x);
/*263*/	r2.x = min(r2.x, 1.000000);
/*264*/	r1.w = r1.w * r2.x;
/*265*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*266*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*267*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*268*/	r2.x = r1.w + r1.w;
/*269*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r7.xyzx).xyz;
/*270*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*271*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*272*/	r2.x = inversesqrt(r2.x);
/*273*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*274*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*275*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*276*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*277*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*278*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*279*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*280*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*281*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*282*/	r1.w = saturate(-r1.w + 1.000000);
/*283*/	r1.w = r1.w * r1.w;
/*284*/	r1.w = r4.x * r1.w;
/*285*/	r1.w = r1.w * 1.500000;
/*286*/	r1.w = r8.w * r1.w;
/*287*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*288*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*289*/	r0.w = inversesqrt(r0.w);
/*290*/	r0.w = r0.w * r1.y;
/*291*/	r0.w = max(r0.w, 0.000000);
/*292*/	r0.w = r0.w * r1.w;
/*293*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*294*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*295*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*296*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*297*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*298*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*299*/	r1.xy = (r1.xyxx / r2.yyyy).xy;
/*300*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*301*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*302*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*303*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*304*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*305*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*306*/	if(r0.w != 0) discard;
/*307*/	r0.w = sqrt(r2.z);
/*308*/	r1.x = saturate(cb4.data[0].w)/**/;
/*309*/	r1.x = -r1.x + 1.000000;
/*310*/	r1.x = r1.x * 8.000000 + -4.000000;
/*311*/	r1.y = saturate(cb4.data[1].x)/**/;
/*312*/	r1.y = -r1.y + 1.000000;
/*313*/	r1.y = r1.y * 1000.000000;
/*314*/	r0.w = r0.w / r1.y;
/*315*/	r0.w = r0.w + r1.x;
/*316*/	r0.w = r0.w * 1.442695;
/*317*/	r0.w = exp2(r0.w);
/*318*/	r0.w = cb4.data[1].y / r0.w;
/*319*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*320*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*321*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*322*/	r1.x = r1.x + -cb4.data[1].z;
/*323*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*324*/	r1.x = saturate(r1.y * r1.x);
/*325*/	r1.y = r1.x * -2.000000 + 3.000000;
/*326*/	r1.x = r1.x * r1.x;
/*327*/	r1.x = r1.x * r1.y;
/*328*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*329*/	r1.y = sqrt(r1.y);
/*330*/	r1.z = max(cb4.data[2].z, 0.001000);
/*331*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*332*/	r1.y = r1.z * r1.y;
/*333*/	r1.y = min(r1.y, 1.000000);
/*334*/	r1.z = r1.y * -2.000000 + 3.000000;
/*335*/	r1.y = r1.y * r1.y;
/*336*/	r1.y = r1.y * r1.z;
/*337*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*338*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*339*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*340*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*341*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*342*/	r6.w = max(r6.y, 0.000000);
/*343*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*344*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*345*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*346*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*347*/	r0.w = saturate(r0.w * r1.y);
/*348*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*349*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*350*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*351*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*352*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*353*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*354*/	color0.w = 1.000000;
/*355*/	return;
}
