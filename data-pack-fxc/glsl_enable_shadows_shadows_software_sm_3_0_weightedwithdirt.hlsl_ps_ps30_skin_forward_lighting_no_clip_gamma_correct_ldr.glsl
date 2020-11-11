//
//
// Shader Model 4
// Fragment Shader
//
// id: 5996 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirt.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
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
/*14*/	r2.z = sqrt(r0.w);
/*15*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*17*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*18*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*19*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*20*/	r0.w = r4.w * r5.w;
/*21*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*22*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*23*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*24*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*25*/	r0.w = inversesqrt(r0.w);
/*26*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*27*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*28*/	r0.w = inversesqrt(r0.w);
/*29*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*30*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*31*/	r0.w = inversesqrt(r0.w);
/*32*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*33*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*36*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*37*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*38*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*39*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*40*/	r0.w = inversesqrt(r0.w);
/*41*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*42*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r1.w = -vsOut_T4.z + 1.000000;
/*44*/	r5.xyz = (vsOut_T4.zzzz * cb6.data[3].xyzx).xyz;
/*45*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*46*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*47*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*48*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*49*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*50*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*51*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*52*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*53*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*54*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*55*/	r5.w = 1.000000;
/*56*/	r2.w = dot(r5.xyzw, cb1.data[12].xyzw);
/*57*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*58*/	r7.x = uintBitsToFloat((r2.w >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*59*/	r7.y = uintBitsToFloat((r2.w >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*60*/	r7.z = uintBitsToFloat((r2.w >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*61*/	r7.w = uintBitsToFloat((r2.w >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*62*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*63*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*64*/	r3.z = intBitsToFloat(int(r3.y));
/*65*/	r3.w = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*66*/	if(floatBitsToUint(r3.w) != 0u) {
/*67*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*68*/	  r6.w = vsOut_T0.w;
/*69*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*70*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*71*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*72*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*73*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*74*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*75*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*76*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*77*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*78*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*79*/	  if(floatBitsToUint(r4.w) == 0u) {
/*80*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*81*/	    r8.xy = floor((r7.xyxx).xy);
/*82*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*83*/	    r3.w = -0.000400 / r3.w;
/*84*/	    r3.w = r3.w + r7.z;
/*85*/	    r9.z = -r9.y + 1.000000;
/*86*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*87*/	    r9.w = -r9.y;
/*88*/	    r11.x = cb2.data[0].z/**/;
/*89*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*90*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*91*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*92*/	    r11.w = -cb2.data[0].w/**/;
/*93*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*94*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*95*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*96*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*97*/	    r9.x = r10.x;
/*98*/	    r9.y = r12.x;
/*99*/	    r9.z = r11.x;
/*100*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*101*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*102*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*103*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*104*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*105*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*106*/	    r3.w = -r7.x + r7.z;
/*107*/	    r3.w = r7.y * r3.w + r7.x;
/*108*/	  } else {
/*109*/	    r3.w = 1.000000;
/*110*/	  }
/*111*/	} else {
/*112*/	  r3.w = 1.000000;
/*113*/	}
/*114*/	r4.w = cb2.data[34].w + -1.000000;
/*115*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*116*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*117*/	if(floatBitsToUint(r3.y) == 0u) {
/*118*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*119*/	  r3.y = floatBitsToInt(r3.y);
/*120*/	  r3.y = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*121*/	  if(floatBitsToUint(r3.y) != 0u) {
/*122*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*123*/	    r6.w = vsOut_T0.w;
/*124*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+6u].xyzw);
/*125*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+7u].xyzw);
/*126*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+8u].xyzw);
/*127*/	    r3.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+9u].xyzw);
/*128*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*129*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*130*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*131*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*132*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*133*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*134*/	    if(floatBitsToUint(r6.w) == 0u) {
/*135*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*136*/	      r7.xy = floor((r6.xyxx).xy);
/*137*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*138*/	      r3.y = -0.000400 / r3.y;
/*139*/	      r3.y = r3.y + r6.z;
/*140*/	      r8.z = -r8.y + 1.000000;
/*141*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*142*/	      r8.w = -r8.y;
/*143*/	      r10.x = cb2.data[0].z/**/;
/*144*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*145*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*146*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*147*/	      r10.w = -cb2.data[0].w/**/;
/*148*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*149*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*150*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*151*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*152*/	      r8.x = r9.x;
/*153*/	      r8.y = r11.x;
/*154*/	      r8.z = r10.x;
/*155*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*156*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*157*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*158*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*159*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*160*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*161*/	      r3.y = -r6.x + r6.z;
/*162*/	      r3.y = r6.y * r3.y + r6.x;
/*163*/	    } else {
/*164*/	      r3.y = 1.000000;
/*165*/	    }
/*166*/	  } else {
/*167*/	    r3.y = 1.000000;
/*168*/	  }
/*169*/	  r6.x = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*170*/	  r6.y = r6.x * cb2.data[34].x;
/*171*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*172*/	  r6.x = r2.w + -r6.x;
/*173*/	  r6.x = saturate(r6.x / r6.y);
/*174*/	  r3.y = -r3.w + r3.y;
/*175*/	  r3.w = r6.x * r3.y + r3.w;
/*176*/	}
/*177*/	if(floatBitsToUint(r4.w) != 0u) {
/*178*/	  r3.y = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*179*/	  r4.w = r3.y * cb2.data[34].y;
/*180*/	  r3.y = -r3.y * cb2.data[34].y + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*181*/	  r3.y = r2.w + -r3.y;
/*182*/	  r3.y = saturate(r3.y / r4.w);
/*183*/	  r3.z = -r3.w + 1.000000;
/*184*/	  r3.w = r3.y * r3.z + r3.w;
/*185*/	}
/*186*/	r3.w = saturate(r3.w);
/*187*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*188*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*189*/	r3.z = inversesqrt(r3.y);
/*190*/	r7.xyz = (r3.zzzz * r6.xyzx).xyz;
/*191*/	r3.z = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*192*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)));
/*193*/	r3.z = dot(vec3(r2.xyzx), vec3(-cb3.data[0].yzwy));
/*194*/	r9.xyz = (r3.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*195*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*196*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*197*/	r4.w = r3.z * r9.x + 0.300000;
/*198*/	r4.w = saturate(-r4.w + 1.000000);
/*199*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*200*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*201*/	r7.w = -r3.z * r9.x + 1.000000;
/*202*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*203*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*204*/	r11.xyz = (r3.zzzz * r9.xxxx + r11.xyzx).xyz;
/*205*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*206*/	r9.xyz = (-r3.zzzz + r9.xyzx).xyz;
/*207*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r3.zzzz).xyz;
/*208*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*209*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*210*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*211*/	r3.z = dot(vec3(r2.xyzx), vec3(cb3.data[0].yzwy));
/*212*/	r4.w = saturate(r3.z);
/*213*/	r4.w = r4.w * r4.w;
/*214*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*215*/	r7.w = r7.w * r7.w;
/*216*/	r7.w = r7.w * r7.w;
/*217*/	r4.w = r4.w * r7.w;
/*218*/	r4.z = r4.z * r4.w;
/*219*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*220*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*221*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*222*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*223*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*224*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*225*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*226*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*227*/	r9.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*228*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*229*/	r7.w = inversesqrt(r7.w);
/*230*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*231*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*232*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*233*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*234*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*235*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*236*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*237*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*238*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*239*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*240*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*241*/	r7.w = r8.z * r8.x;
/*242*/	r3.x = r3.x * r3.x;
/*243*/	r3.z = r3.z + r3.z;
/*244*/	r9.xyz = (r2.xyzx * -r3.zzzz + cb3.data[0].yzwy).xyz;
/*245*/	r3.z = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*246*/	r3.z = max(r3.z, 0.000000);
/*247*/	r3.x = r3.x * 127.000000 + 1.600000;
/*248*/	r3.z = log2(r3.z);
/*249*/	r3.x = r3.z * r3.x;
/*250*/	r3.x = exp2(r3.x);
/*251*/	r3.x = min(r3.x, 1.000000);
/*252*/	r1.w = r1.w * r3.x;
/*253*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*254*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*255*/	r1.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*256*/	r3.x = r1.w + r1.w;
/*257*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r7.xyzx).xyz;
/*258*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*259*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*260*/	r3.x = inversesqrt(r3.x);
/*261*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*262*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*263*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*264*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*265*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*266*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*267*/	r11.xyz = (r11.xyzx * r2.yyyy).xyz;
/*268*/	r10.xyz = (r2.xxxx * r10.xyzx + r11.xyzx).xyz;
/*269*/	r2.xyz = (r2.zzzz * r7.xyzx + r10.xyzx).xyz;
/*270*/	r1.w = saturate(-r1.w + 1.000000);
/*271*/	r1.w = r1.w * r1.w;
/*272*/	r1.w = r4.x * r1.w;
/*273*/	r1.w = r1.w * 1.500000;
/*274*/	r1.w = r8.w * r1.w;
/*275*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*276*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*277*/	r0.w = inversesqrt(r0.w);
/*278*/	r0.w = r0.w * r1.y;
/*279*/	r0.w = max(r0.w, 0.000000);
/*280*/	r0.w = r0.w * r1.w;
/*281*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*282*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*283*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*284*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*285*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*286*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*287*/	r1.xy = (r1.xyxx / r2.wwww).xy;
/*288*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*289*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*290*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*291*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*292*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*293*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*294*/	if(r0.w != 0) discard;
/*295*/	r0.w = sqrt(r3.y);
/*296*/	r1.x = saturate(cb4.data[0].w)/**/;
/*297*/	r1.x = -r1.x + 1.000000;
/*298*/	r1.x = r1.x * 8.000000 + -4.000000;
/*299*/	r1.y = saturate(cb4.data[1].x)/**/;
/*300*/	r1.y = -r1.y + 1.000000;
/*301*/	r1.y = r1.y * 1000.000000;
/*302*/	r0.w = r0.w / r1.y;
/*303*/	r0.w = r0.w + r1.x;
/*304*/	r0.w = r0.w * 1.442695;
/*305*/	r0.w = exp2(r0.w);
/*306*/	r0.w = cb4.data[1].y / r0.w;
/*307*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*308*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*309*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*310*/	r1.x = r1.x + -cb4.data[1].z;
/*311*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*312*/	r1.x = saturate(r1.y * r1.x);
/*313*/	r1.y = r1.x * -2.000000 + 3.000000;
/*314*/	r1.x = r1.x * r1.x;
/*315*/	r1.x = r1.x * r1.y;
/*316*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*317*/	r1.y = sqrt(r1.y);
/*318*/	r1.z = max(cb4.data[2].z, 0.001000);
/*319*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*320*/	r1.y = r1.z * r1.y;
/*321*/	r1.y = min(r1.y, 1.000000);
/*322*/	r1.z = r1.y * -2.000000 + 3.000000;
/*323*/	r1.y = r1.y * r1.y;
/*324*/	r1.y = r1.y * r1.z;
/*325*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*326*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*327*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*328*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*329*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*330*/	r6.w = max(r6.y, 0.000000);
/*331*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*332*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*333*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*334*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*335*/	r0.w = saturate(r0.w * r1.y);
/*336*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*337*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*338*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*339*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*340*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*341*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*342*/	color0.w = 1.000000;
/*343*/	return;
}
