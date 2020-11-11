//
//
// Shader Model 4
// Fragment Shader
//
// id: 6210 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithblood.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
/*8*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*9*/	if(r1.z != 0) discard;
/*10*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*11*/	r1.zw = (r1.zzzw * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*13*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*14*/	r1.z = saturate(-r1.z + r2.w);
/*15*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*16*/	if(floatBitsToUint(r1.z) != 0u) {
/*17*/	  r1.z = -r2.w + 1.000000;
/*18*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*19*/	  r1.z = -r1.z + 1.000000;
/*20*/	  r1.z = -r1.z * r1.z + 1.000000;
/*21*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*22*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*23*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*24*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*25*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*26*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*27*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*28*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*29*/	} else {
/*30*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*31*/	}
/*32*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*33*/	r1.z = inversesqrt(r1.z);
/*34*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*35*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*36*/	r1.z = inversesqrt(r1.z);
/*37*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*38*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*39*/	r1.z = inversesqrt(r1.z);
/*40*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*41*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*42*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*43*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*44*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*47*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*48*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*49*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*50*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*51*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*52*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*54*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*55*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*56*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*57*/	r5.w = 1.000000;
/*58*/	r2.y = dot(r5.xyzw, cb1.data[12].xyzw);
/*59*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*60*/	r7.x = uintBitsToFloat((r2.y >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*61*/	r7.y = uintBitsToFloat((r2.y >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*62*/	r7.z = uintBitsToFloat((r2.y >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r7.w = uintBitsToFloat((r2.y >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*64*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*65*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*66*/	r2.w = intBitsToFloat(int(r2.z));
/*67*/	r3.w = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*68*/	if(floatBitsToUint(r3.w) != 0u) {
/*69*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*70*/	  r6.w = vsOut_T0.w;
/*71*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*72*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*73*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*74*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*75*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*76*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*77*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*78*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*79*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*80*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*81*/	  if(floatBitsToUint(r4.w) == 0u) {
/*82*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*83*/	    r8.xy = floor((r7.xyxx).xy);
/*84*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*85*/	    r3.w = -0.000400 / r3.w;
/*86*/	    r3.w = r3.w + r7.z;
/*87*/	    r9.z = -r9.y + 1.000000;
/*88*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*89*/	    r9.w = -r9.y;
/*90*/	    r11.x = cb2.data[0].z/**/;
/*91*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*92*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*93*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*94*/	    r11.w = -cb2.data[0].w/**/;
/*95*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*96*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*97*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*98*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*99*/	    r9.x = r10.x;
/*100*/	    r9.y = r12.x;
/*101*/	    r9.z = r11.x;
/*102*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*103*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*104*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*105*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*106*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*107*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*108*/	    r3.w = -r7.x + r7.z;
/*109*/	    r3.w = r7.y * r3.w + r7.x;
/*110*/	  } else {
/*111*/	    r3.w = 1.000000;
/*112*/	  }
/*113*/	} else {
/*114*/	  r3.w = 1.000000;
/*115*/	}
/*116*/	r4.w = cb2.data[34].w + -1.000000;
/*117*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*118*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*119*/	if(floatBitsToUint(r2.z) == 0u) {
/*120*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*121*/	  r2.z = floatBitsToInt(r2.z);
/*122*/	  r2.z = uintBitsToFloat((r2.z < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*123*/	  if(floatBitsToUint(r2.z) != 0u) {
/*124*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*125*/	    r6.w = vsOut_T0.w;
/*126*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+6u].xyzw);
/*127*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+7u].xyzw);
/*128*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+8u].xyzw);
/*129*/	    r2.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r2.z)+9u].xyzw);
/*130*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*131*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*132*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*133*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*134*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*135*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*136*/	    if(floatBitsToUint(r6.w) == 0u) {
/*137*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*138*/	      r7.xy = floor((r6.xyxx).xy);
/*139*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*140*/	      r2.z = -0.000400 / r2.z;
/*141*/	      r2.z = r2.z + r6.z;
/*142*/	      r8.z = -r8.y + 1.000000;
/*143*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*144*/	      r8.w = -r8.y;
/*145*/	      r10.x = cb2.data[0].z/**/;
/*146*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*147*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*148*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*149*/	      r10.w = -cb2.data[0].w/**/;
/*150*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*151*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*152*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*153*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*154*/	      r8.x = r9.x;
/*155*/	      r8.y = r11.x;
/*156*/	      r8.z = r10.x;
/*157*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*158*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*159*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*160*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*161*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*162*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*163*/	      r2.z = -r6.x + r6.z;
/*164*/	      r2.z = r6.y * r2.z + r6.x;
/*165*/	    } else {
/*166*/	      r2.z = 1.000000;
/*167*/	    }
/*168*/	  } else {
/*169*/	    r2.z = 1.000000;
/*170*/	  }
/*171*/	  r6.x = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*172*/	  r6.y = r6.x * cb2.data[34].x;
/*173*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*174*/	  r6.x = r2.y + -r6.x;
/*175*/	  r6.x = saturate(r6.x / r6.y);
/*176*/	  r2.z = -r3.w + r2.z;
/*177*/	  r3.w = r6.x * r2.z + r3.w;
/*178*/	}
/*179*/	if(floatBitsToUint(r4.w) != 0u) {
/*180*/	  r2.z = -cb2.data[floatBitsToUint(r2.w)+36u].x + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*181*/	  r4.w = r2.z * cb2.data[34].y;
/*182*/	  r2.z = -r2.z * cb2.data[34].y + cb2.data[floatBitsToUint(r2.w)+37u].x;
/*183*/	  r2.z = -r2.z + r2.y;
/*184*/	  r2.z = saturate(r2.z / r4.w);
/*185*/	  r2.w = -r3.w + 1.000000;
/*186*/	  r3.w = r2.z * r2.w + r3.w;
/*187*/	}
/*188*/	r3.w = saturate(r3.w);
/*189*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*190*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*191*/	r2.w = inversesqrt(r2.z);
/*192*/	r7.xyz = (r2.wwww * r6.xyzx).xyz;
/*193*/	r2.w = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*195*/	r2.w = dot(vec3(r3.xyzx), vec3(-cb3.data[0].yzwy));
/*196*/	r9.xyz = (r2.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*197*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*198*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*199*/	r4.w = r2.w * r9.x + 0.300000;
/*200*/	r4.w = saturate(-r4.w + 1.000000);
/*201*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*202*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*203*/	r7.w = -r2.w * r9.x + 1.000000;
/*204*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*205*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*206*/	r11.xyz = (r2.wwww * r9.xxxx + r11.xyzx).xyz;
/*207*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*208*/	r9.xyz = (-r2.wwww + r9.xyzx).xyz;
/*209*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r2.wwww).xyz;
/*210*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*211*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*212*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*213*/	r2.w = dot(vec3(r3.xyzx), vec3(cb3.data[0].yzwy));
/*214*/	r4.w = saturate(r2.w);
/*215*/	r4.w = r4.w * r4.w;
/*216*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*217*/	r7.w = r7.w * r7.w;
/*218*/	r7.w = r7.w * r7.w;
/*219*/	r4.w = r4.w * r7.w;
/*220*/	r4.z = r4.z * r4.w;
/*221*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*222*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*223*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*224*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*225*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*226*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*227*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*228*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*229*/	r9.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*230*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*231*/	r7.w = inversesqrt(r7.w);
/*232*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*233*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*234*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*235*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*236*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*237*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*238*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*239*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*240*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*241*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*242*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*243*/	r7.w = r8.z * r8.x;
/*244*/	r2.x = r2.x * r2.x;
/*245*/	r2.w = r2.w + r2.w;
/*246*/	r9.xyz = (r3.xyzx * -r2.wwww + cb3.data[0].yzwy).xyz;
/*247*/	r2.w = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*248*/	r2.w = max(r2.w, 0.000000);
/*249*/	r2.x = r2.x * 127.000000 + 1.600000;
/*250*/	r2.w = log2(r2.w);
/*251*/	r2.x = r2.w * r2.x;
/*252*/	r2.x = exp2(r2.x);
/*253*/	r2.x = min(r2.x, 1.000000);
/*254*/	r1.w = r1.w * r2.x;
/*255*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*256*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*257*/	r1.w = dot(vec3(-r7.xyzx), vec3(r3.xyzx));
/*258*/	r2.x = r1.w + r1.w;
/*259*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r7.xyzx).xyz;
/*260*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*261*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*262*/	r2.x = inversesqrt(r2.x);
/*263*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*264*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*265*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*266*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*267*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*268*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*269*/	r11.xyz = (r11.xyzx * r3.yyyy).xyz;
/*270*/	r10.xyz = (r3.xxxx * r10.xyzx + r11.xyzx).xyz;
/*271*/	r3.xyz = (r3.zzzz * r7.xyzx + r10.xyzx).xyz;
/*272*/	r1.w = saturate(-r1.w + 1.000000);
/*273*/	r1.w = r1.w * r1.w;
/*274*/	r1.w = r4.x * r1.w;
/*275*/	r1.w = r1.w * 1.500000;
/*276*/	r1.w = r8.w * r1.w;
/*277*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*278*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*279*/	r0.w = inversesqrt(r0.w);
/*280*/	r0.w = r0.w * r1.y;
/*281*/	r0.w = max(r0.w, 0.000000);
/*282*/	r0.w = r0.w * r1.w;
/*283*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*284*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*285*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*286*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*287*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*288*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*289*/	r1.xy = (r1.xyxx / r2.yyyy).xy;
/*290*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*291*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*292*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*293*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*294*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*295*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*296*/	if(r0.w != 0) discard;
/*297*/	r0.w = sqrt(r2.z);
/*298*/	r1.x = saturate(cb4.data[0].w)/**/;
/*299*/	r1.x = -r1.x + 1.000000;
/*300*/	r1.x = r1.x * 8.000000 + -4.000000;
/*301*/	r1.y = saturate(cb4.data[1].x)/**/;
/*302*/	r1.y = -r1.y + 1.000000;
/*303*/	r1.y = r1.y * 1000.000000;
/*304*/	r0.w = r0.w / r1.y;
/*305*/	r0.w = r0.w + r1.x;
/*306*/	r0.w = r0.w * 1.442695;
/*307*/	r0.w = exp2(r0.w);
/*308*/	r0.w = cb4.data[1].y / r0.w;
/*309*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*310*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*311*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*312*/	r1.x = r1.x + -cb4.data[1].z;
/*313*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*314*/	r1.x = saturate(r1.y * r1.x);
/*315*/	r1.y = r1.x * -2.000000 + 3.000000;
/*316*/	r1.x = r1.x * r1.x;
/*317*/	r1.x = r1.x * r1.y;
/*318*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*319*/	r1.y = sqrt(r1.y);
/*320*/	r1.z = max(cb4.data[2].z, 0.001000);
/*321*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*322*/	r1.y = r1.z * r1.y;
/*323*/	r1.y = min(r1.y, 1.000000);
/*324*/	r1.z = r1.y * -2.000000 + 3.000000;
/*325*/	r1.y = r1.y * r1.y;
/*326*/	r1.y = r1.y * r1.z;
/*327*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*328*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*329*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*330*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*331*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*332*/	r6.w = max(r6.y, 0.000000);
/*333*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*334*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*335*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*336*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*337*/	r0.w = saturate(r0.w * r1.y);
/*338*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*339*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*340*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*341*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*342*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*343*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*344*/	color0.w = 1.000000;
/*345*/	return;
}
