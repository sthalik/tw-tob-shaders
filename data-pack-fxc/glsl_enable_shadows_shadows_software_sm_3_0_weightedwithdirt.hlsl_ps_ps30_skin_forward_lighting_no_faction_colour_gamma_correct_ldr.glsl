//
//
// Shader Model 4
// Fragment Shader
//
// id: 5998 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirt.hlsl_PS_ps30_skin_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r2.z = sqrt(r0.w);
/*11*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*13*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*14*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*15*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*16*/	r0.w = r4.w * r5.w;
/*17*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*18*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*19*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*20*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*21*/	r0.w = inversesqrt(r0.w);
/*22*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*23*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*24*/	r0.w = inversesqrt(r0.w);
/*25*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*26*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*27*/	r0.w = inversesqrt(r0.w);
/*28*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*29*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*30*/	r0.w = inversesqrt(r0.w);
/*31*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*32*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*33*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*34*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*35*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*36*/	r0.w = inversesqrt(r0.w);
/*37*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*38*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*40*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*41*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*42*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*43*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*44*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*45*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*46*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*47*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*48*/	r5.w = 1.000000;
/*49*/	r2.w = dot(r5.xyzw, cb1.data[12].xyzw);
/*50*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*51*/	r7.x = uintBitsToFloat((r2.w >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*52*/	r7.y = uintBitsToFloat((r2.w >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*53*/	r7.z = uintBitsToFloat((r2.w >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*54*/	r7.w = uintBitsToFloat((r2.w >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*55*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*56*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*57*/	r3.z = intBitsToFloat(int(r3.y));
/*58*/	r3.w = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*59*/	if(floatBitsToUint(r3.w) != 0u) {
/*60*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*61*/	  r6.w = vsOut_T0.w;
/*62*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*63*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*64*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*65*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*66*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*67*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*68*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*69*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*70*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*71*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*72*/	  if(floatBitsToUint(r4.w) == 0u) {
/*73*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*74*/	    r8.xy = floor((r7.xyxx).xy);
/*75*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*76*/	    r3.w = -0.000400 / r3.w;
/*77*/	    r3.w = r3.w + r7.z;
/*78*/	    r9.z = -r9.y + 1.000000;
/*79*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*80*/	    r9.w = -r9.y;
/*81*/	    r11.x = cb2.data[0].z/**/;
/*82*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*83*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*84*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*85*/	    r11.w = -cb2.data[0].w/**/;
/*86*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*87*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*88*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*89*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*90*/	    r9.x = r10.x;
/*91*/	    r9.y = r12.x;
/*92*/	    r9.z = r11.x;
/*93*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*94*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*95*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*96*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*97*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*98*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*99*/	    r3.w = -r7.x + r7.z;
/*100*/	    r3.w = r7.y * r3.w + r7.x;
/*101*/	  } else {
/*102*/	    r3.w = 1.000000;
/*103*/	  }
/*104*/	} else {
/*105*/	  r3.w = 1.000000;
/*106*/	}
/*107*/	r4.w = cb2.data[34].w + -1.000000;
/*108*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*109*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*110*/	if(floatBitsToUint(r3.y) == 0u) {
/*111*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*112*/	  r3.y = floatBitsToInt(r3.y);
/*113*/	  r3.y = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*114*/	  if(floatBitsToUint(r3.y) != 0u) {
/*115*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*116*/	    r6.w = vsOut_T0.w;
/*117*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+6u].xyzw);
/*118*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+7u].xyzw);
/*119*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+8u].xyzw);
/*120*/	    r3.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+9u].xyzw);
/*121*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*122*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*123*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*124*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*125*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*126*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*127*/	    if(floatBitsToUint(r6.w) == 0u) {
/*128*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*129*/	      r7.xy = floor((r6.xyxx).xy);
/*130*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*131*/	      r3.y = -0.000400 / r3.y;
/*132*/	      r3.y = r3.y + r6.z;
/*133*/	      r8.z = -r8.y + 1.000000;
/*134*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*135*/	      r8.w = -r8.y;
/*136*/	      r10.x = cb2.data[0].z/**/;
/*137*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*138*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*139*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*140*/	      r10.w = -cb2.data[0].w/**/;
/*141*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*142*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*143*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*144*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*145*/	      r8.x = r9.x;
/*146*/	      r8.y = r11.x;
/*147*/	      r8.z = r10.x;
/*148*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*149*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*150*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*151*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*152*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*153*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*154*/	      r3.y = -r6.x + r6.z;
/*155*/	      r3.y = r6.y * r3.y + r6.x;
/*156*/	    } else {
/*157*/	      r3.y = 1.000000;
/*158*/	    }
/*159*/	  } else {
/*160*/	    r3.y = 1.000000;
/*161*/	  }
/*162*/	  r6.x = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*163*/	  r6.y = r6.x * cb2.data[34].x;
/*164*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*165*/	  r6.x = r2.w + -r6.x;
/*166*/	  r6.x = saturate(r6.x / r6.y);
/*167*/	  r3.y = -r3.w + r3.y;
/*168*/	  r3.w = r6.x * r3.y + r3.w;
/*169*/	}
/*170*/	if(floatBitsToUint(r4.w) != 0u) {
/*171*/	  r3.y = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*172*/	  r4.w = r3.y * cb2.data[34].y;
/*173*/	  r3.y = -r3.y * cb2.data[34].y + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*174*/	  r3.y = r2.w + -r3.y;
/*175*/	  r3.y = saturate(r3.y / r4.w);
/*176*/	  r3.z = -r3.w + 1.000000;
/*177*/	  r3.w = r3.y * r3.z + r3.w;
/*178*/	}
/*179*/	r3.w = saturate(r3.w);
/*180*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*181*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*182*/	r3.z = inversesqrt(r3.y);
/*183*/	r7.xyz = (r3.zzzz * r6.xyzx).xyz;
/*184*/	r3.z = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*185*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)));
/*186*/	r3.z = dot(vec3(r2.xyzx), vec3(-cb3.data[0].yzwy));
/*187*/	r9.xyz = (r3.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*188*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*189*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*190*/	r4.w = r3.z * r9.x + 0.300000;
/*191*/	r4.w = saturate(-r4.w + 1.000000);
/*192*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*193*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*194*/	r7.w = -r3.z * r9.x + 1.000000;
/*195*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*196*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*197*/	r11.xyz = (r3.zzzz * r9.xxxx + r11.xyzx).xyz;
/*198*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*199*/	r9.xyz = (-r3.zzzz + r9.xyzx).xyz;
/*200*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r3.zzzz).xyz;
/*201*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*202*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*203*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*204*/	r3.z = dot(vec3(r2.xyzx), vec3(cb3.data[0].yzwy));
/*205*/	r4.w = saturate(r3.z);
/*206*/	r4.w = r4.w * r4.w;
/*207*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*208*/	r7.w = r7.w * r7.w;
/*209*/	r7.w = r7.w * r7.w;
/*210*/	r4.w = r4.w * r7.w;
/*211*/	r4.z = r4.z * r4.w;
/*212*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*213*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*214*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*215*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*216*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*217*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*218*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*219*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*220*/	r9.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*221*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*222*/	r7.w = inversesqrt(r7.w);
/*223*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*224*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*225*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*226*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*227*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*228*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*229*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*230*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*231*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*232*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*233*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*234*/	r7.w = r8.z * r8.x;
/*235*/	r3.x = r3.x * r3.x;
/*236*/	r3.z = r3.z + r3.z;
/*237*/	r9.xyz = (r2.xyzx * -r3.zzzz + cb3.data[0].yzwy).xyz;
/*238*/	r3.z = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*239*/	r3.z = max(r3.z, 0.000000);
/*240*/	r3.x = r3.x * 127.000000 + 1.600000;
/*241*/	r3.z = log2(r3.z);
/*242*/	r3.x = r3.z * r3.x;
/*243*/	r3.x = exp2(r3.x);
/*244*/	r3.x = min(r3.x, 1.000000);
/*245*/	r1.w = r1.w * r3.x;
/*246*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*247*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*248*/	r1.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*249*/	r3.x = r1.w + r1.w;
/*250*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r7.xyzx).xyz;
/*251*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*252*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*253*/	r3.x = inversesqrt(r3.x);
/*254*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*255*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*256*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*257*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*258*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*259*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*260*/	r11.xyz = (r11.xyzx * r2.yyyy).xyz;
/*261*/	r10.xyz = (r2.xxxx * r10.xyzx + r11.xyzx).xyz;
/*262*/	r2.xyz = (r2.zzzz * r7.xyzx + r10.xyzx).xyz;
/*263*/	r1.w = saturate(-r1.w + 1.000000);
/*264*/	r1.w = r1.w * r1.w;
/*265*/	r1.w = r4.x * r1.w;
/*266*/	r1.w = r1.w * 1.500000;
/*267*/	r1.w = r8.w * r1.w;
/*268*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*269*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*270*/	r0.w = inversesqrt(r0.w);
/*271*/	r0.w = r0.w * r1.y;
/*272*/	r0.w = max(r0.w, 0.000000);
/*273*/	r0.w = r0.w * r1.w;
/*274*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*275*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*276*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*277*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*278*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*279*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*280*/	r1.xy = (r1.xyxx / r2.wwww).xy;
/*281*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*282*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*283*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*284*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*285*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*286*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*287*/	if(r0.w != 0) discard;
/*288*/	r0.w = sqrt(r3.y);
/*289*/	r1.x = saturate(cb4.data[0].w)/**/;
/*290*/	r1.x = -r1.x + 1.000000;
/*291*/	r1.x = r1.x * 8.000000 + -4.000000;
/*292*/	r1.y = saturate(cb4.data[1].x)/**/;
/*293*/	r1.y = -r1.y + 1.000000;
/*294*/	r1.y = r1.y * 1000.000000;
/*295*/	r0.w = r0.w / r1.y;
/*296*/	r0.w = r0.w + r1.x;
/*297*/	r0.w = r0.w * 1.442695;
/*298*/	r0.w = exp2(r0.w);
/*299*/	r0.w = cb4.data[1].y / r0.w;
/*300*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*301*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*302*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*303*/	r1.x = r1.x + -cb4.data[1].z;
/*304*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*305*/	r1.x = saturate(r1.y * r1.x);
/*306*/	r1.y = r1.x * -2.000000 + 3.000000;
/*307*/	r1.x = r1.x * r1.x;
/*308*/	r1.x = r1.x * r1.y;
/*309*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*310*/	r1.y = sqrt(r1.y);
/*311*/	r1.z = max(cb4.data[2].z, 0.001000);
/*312*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*313*/	r1.y = r1.z * r1.y;
/*314*/	r1.y = min(r1.y, 1.000000);
/*315*/	r1.z = r1.y * -2.000000 + 3.000000;
/*316*/	r1.y = r1.y * r1.y;
/*317*/	r1.y = r1.y * r1.z;
/*318*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*319*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*320*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*321*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*322*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*323*/	r6.w = max(r6.y, 0.000000);
/*324*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*325*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*326*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*327*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*328*/	r0.w = saturate(r0.w * r1.y);
/*329*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*330*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*331*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*332*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*333*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*334*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*335*/	color0.w = 1.000000;
/*336*/	return;
}
