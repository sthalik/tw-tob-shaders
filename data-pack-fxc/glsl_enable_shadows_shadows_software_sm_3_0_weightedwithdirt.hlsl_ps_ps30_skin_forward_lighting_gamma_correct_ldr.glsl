//
//
// Shader Model 4
// Fragment Shader
//
// id: 5994 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdirt.hlsl_PS_ps30_skin_forward_lighting_gamma_correct_LDR.glsl
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb6.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb6.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb6.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r2.z = sqrt(r0.w);
/*18*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r1.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy + vsOut_T6.xxxy).zw;
/*21*/	r5.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*22*/	r1.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*23*/	r0.w = r4.w * r5.w;
/*24*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*25*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*26*/	r2.xy = (r1.zwzz * r4.wwww + r1.xyxx).xy;
/*27*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*28*/	r0.w = inversesqrt(r0.w);
/*29*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*30*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*31*/	r0.w = inversesqrt(r0.w);
/*32*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*33*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*36*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*37*/	r0.w = inversesqrt(r0.w);
/*38*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*39*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*40*/	r1.xyw = (r1.xxxx * r2.xyxz + r4.xyxz).xyw;
/*41*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*42*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*43*/	r0.w = inversesqrt(r0.w);
/*44*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*45*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*46*/	r1.w = -vsOut_T4.z + 1.000000;
/*47*/	r5.xyz = (vsOut_T4.zzzz * cb6.data[3].xyzx).xyz;
/*48*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*49*/	r1.w = vsOut_T7.x * -r3.y + r3.y;
/*50*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*51*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*52*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*53*/	r2.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*54*/	r3.yzw = (-r0.xxyz + r2.wwww).yzw;
/*55*/	r0.xyz = (vsOut_T7.yyyy * r3.yzwy + r0.xyzx).xyz;
/*56*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*57*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*58*/	r5.w = 1.000000;
/*59*/	r2.w = dot(r5.xyzw, cb1.data[12].xyzw);
/*60*/	r6.xyz = (-cb2.data[35].xyzx * cb2.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*61*/	r7.x = uintBitsToFloat((r2.w >= cb2.data[37].x) ? 0xffffffffu : 0x00000000u);
/*62*/	r7.y = uintBitsToFloat((r2.w >= cb2.data[38].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r7.z = uintBitsToFloat((r2.w >= cb2.data[39].x) ? 0xffffffffu : 0x00000000u);
/*64*/	r7.w = uintBitsToFloat((r2.w >= cb2.data[40].x) ? 0xffffffffu : 0x00000000u);
/*65*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*66*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*67*/	r3.z = intBitsToFloat(int(r3.y));
/*68*/	r3.w = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*69*/	if(floatBitsToUint(r3.w) != 0u) {
/*70*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*71*/	  r6.w = vsOut_T0.w;
/*72*/	  r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+2u].xyzw);
/*73*/	  r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+3u].xyzw);
/*74*/	  r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+4u].xyzw);
/*75*/	  r3.w = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.w)+5u].xyzw);
/*76*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*77*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb2.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*78*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*79*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*80*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*81*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*82*/	  if(floatBitsToUint(r4.w) == 0u) {
/*83*/	    r7.xy = (r7.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*84*/	    r8.xy = floor((r7.xyxx).xy);
/*85*/	    r9.xy = (r8.xyxx / cb2.data[0].xyxx).xy;
/*86*/	    r3.w = -0.000400 / r3.w;
/*87*/	    r3.w = r3.w + r7.z;
/*88*/	    r9.z = -r9.y + 1.000000;
/*89*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*90*/	    r9.w = -r9.y;
/*91*/	    r11.x = cb2.data[0].z/**/;
/*92*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*93*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*94*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*95*/	    r11.w = -cb2.data[0].w/**/;
/*96*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*97*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*98*/	    r7.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*99*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*100*/	    r9.x = r10.x;
/*101*/	    r9.y = r12.x;
/*102*/	    r9.z = r11.x;
/*103*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*104*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*105*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*106*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*107*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*108*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*109*/	    r3.w = -r7.x + r7.z;
/*110*/	    r3.w = r7.y * r3.w + r7.x;
/*111*/	  } else {
/*112*/	    r3.w = 1.000000;
/*113*/	  }
/*114*/	} else {
/*115*/	  r3.w = 1.000000;
/*116*/	}
/*117*/	r4.w = cb2.data[34].w + -1.000000;
/*118*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*119*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*120*/	if(floatBitsToUint(r3.y) == 0u) {
/*121*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*122*/	  r3.y = floatBitsToInt(r3.y);
/*123*/	  r3.y = uintBitsToFloat((r3.y < cb2.data[34].w) ? 0xffffffffu : 0x00000000u);
/*124*/	  if(floatBitsToUint(r3.y) != 0u) {
/*125*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*126*/	    r6.w = vsOut_T0.w;
/*127*/	    r7.x = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+6u].xyzw);
/*128*/	    r7.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+7u].xyzw);
/*129*/	    r7.z = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+8u].xyzw);
/*130*/	    r3.y = dot(r6.xyzw, cb2.data[floatBitsToUint(r3.y)+9u].xyzw);
/*131*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*132*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb2.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*133*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*134*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb2.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*135*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*136*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*137*/	    if(floatBitsToUint(r6.w) == 0u) {
/*138*/	      r6.xy = (r6.xyxx * cb2.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*139*/	      r7.xy = floor((r6.xyxx).xy);
/*140*/	      r8.xy = (r7.xyxx / cb2.data[0].xyxx).xy;
/*141*/	      r3.y = -0.000400 / r3.y;
/*142*/	      r3.y = r3.y + r6.z;
/*143*/	      r8.z = -r8.y + 1.000000;
/*144*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*145*/	      r8.w = -r8.y;
/*146*/	      r10.x = cb2.data[0].z/**/;
/*147*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*148*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*149*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*150*/	      r10.w = -cb2.data[0].w/**/;
/*151*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*152*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*153*/	      r6.zw = (cb2.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*154*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*155*/	      r8.x = r9.x;
/*156*/	      r8.y = r11.x;
/*157*/	      r8.z = r10.x;
/*158*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.yyyy, r8.xyzw)) * 0xffffffffu);
/*159*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*160*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*161*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*162*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*163*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*164*/	      r3.y = -r6.x + r6.z;
/*165*/	      r3.y = r6.y * r3.y + r6.x;
/*166*/	    } else {
/*167*/	      r3.y = 1.000000;
/*168*/	    }
/*169*/	  } else {
/*170*/	    r3.y = 1.000000;
/*171*/	  }
/*172*/	  r6.x = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*173*/	  r6.y = r6.x * cb2.data[34].x;
/*174*/	  r6.x = -r6.x * cb2.data[34].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*175*/	  r6.x = r2.w + -r6.x;
/*176*/	  r6.x = saturate(r6.x / r6.y);
/*177*/	  r3.y = -r3.w + r3.y;
/*178*/	  r3.w = r6.x * r3.y + r3.w;
/*179*/	}
/*180*/	if(floatBitsToUint(r4.w) != 0u) {
/*181*/	  r3.y = -cb2.data[floatBitsToUint(r3.z)+36u].x + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*182*/	  r4.w = r3.y * cb2.data[34].y;
/*183*/	  r3.y = -r3.y * cb2.data[34].y + cb2.data[floatBitsToUint(r3.z)+37u].x;
/*184*/	  r3.y = r2.w + -r3.y;
/*185*/	  r3.y = saturate(r3.y / r4.w);
/*186*/	  r3.z = -r3.w + 1.000000;
/*187*/	  r3.w = r3.y * r3.z + r3.w;
/*188*/	}
/*189*/	r3.w = saturate(r3.w);
/*190*/	r6.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*191*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*192*/	r3.z = inversesqrt(r3.y);
/*193*/	r7.xyz = (r3.zzzz * r6.xyzx).xyz;
/*194*/	r3.z = uintBitsToFloat((0.000000 < cb3.data[11].x) ? 0xffffffffu : 0x00000000u);
/*195*/	r8.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)));
/*196*/	r3.z = dot(vec3(r2.xyzx), vec3(-cb3.data[0].yzwy));
/*197*/	r9.xyz = (r3.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*198*/	r9.xyz = saturate(r9.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*199*/	r10.xyz = (r9.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*200*/	r4.w = r3.z * r9.x + 0.300000;
/*201*/	r4.w = saturate(-r4.w + 1.000000);
/*202*/	r11.xyz = (r4.wwww * r10.xyzx).xyz;
/*203*/	r9.yzw = (r9.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*204*/	r7.w = -r3.z * r9.x + 1.000000;
/*205*/	r9.yzw = (r7.wwww * r9.yyzw).yzw;
/*206*/	r10.xyz = (-r10.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*207*/	r11.xyz = (r3.zzzz * r9.xxxx + r11.xyzx).xyz;
/*208*/	r9.xyz = (r9.yzwy * r10.xyzx + r11.xyzx).xyz;
/*209*/	r9.xyz = (-r3.zzzz + r9.xyzx).xyz;
/*210*/	r9.xyz = saturate(r4.yyyy * r9.xyzx + r3.zzzz).xyz;
/*211*/	r9.xyz = (r0.xyzx * r9.xyzx).xyz;
/*212*/	r9.xyz = (r9.xyzx * cb3.data[1].xyzx).xyz;
/*213*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*214*/	r3.z = dot(vec3(r2.xyzx), vec3(cb3.data[0].yzwy));
/*215*/	r4.w = saturate(r3.z);
/*216*/	r4.w = r4.w * r4.w;
/*217*/	r7.w = saturate(dot(vec3(r7.xyzx), vec3(-cb3.data[0].yzwy)));
/*218*/	r7.w = r7.w * r7.w;
/*219*/	r7.w = r7.w * r7.w;
/*220*/	r4.w = r4.w * r7.w;
/*221*/	r4.z = r4.z * r4.w;
/*222*/	r10.xyz = (r4.yyyy * cb3.data[1].xyzx).xyz;
/*223*/	r10.xyz = (r10.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb3.data[1].xyzx).xyz;
/*224*/	r10.xyz = (r8.xxxx * r10.xyzx).xyz;
/*225*/	r4.yzw = (r4.zzzz * r10.xxyz).yzw;
/*226*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*227*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*228*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*229*/	r4.yzw = (r9.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*230*/	r9.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*231*/	r7.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*232*/	r7.w = inversesqrt(r7.w);
/*233*/	r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*234*/	r10.xyz = (uintBitsToFloat(uvec4(lessThan(r9.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*235*/	r11.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r10.xxxx), uvec4(0)))).xyz/**/;
/*236*/	r10.xyw = (mix(cb3.data[4].xyxz, cb3.data[5].xyxz, greaterThan(floatBitsToUint(r10.yyyy), uvec4(0)))).xyw/**/;
/*237*/	r12.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r10.zzzz), uvec4(0)))).xyz/**/;
/*238*/	r9.xyz = (r9.xyzx * r9.xyzx).xyz;
/*239*/	r10.xyz = (r10.xywx * r9.yyyy).xyz;
/*240*/	r9.xyw = (r9.xxxx * r11.xyxz + r10.xyxz).xyw;
/*241*/	r9.xyz = (r9.zzzz * r12.xyzx + r9.xywx).xyz;
/*242*/	r0.xyz = (r0.xyzx * r9.xyzx).xyz;
/*243*/	r0.xyz = (r8.yyyy * r0.xyzx).xyz;
/*244*/	r7.w = r8.z * r8.x;
/*245*/	r3.x = r3.x * r3.x;
/*246*/	r3.z = r3.z + r3.z;
/*247*/	r9.xyz = (r2.xyzx * -r3.zzzz + cb3.data[0].yzwy).xyz;
/*248*/	r3.z = dot(vec3(r9.xyzx), vec3(-r7.xyzx));
/*249*/	r3.z = max(r3.z, 0.000000);
/*250*/	r3.x = r3.x * 127.000000 + 1.600000;
/*251*/	r3.z = log2(r3.z);
/*252*/	r3.x = r3.z * r3.x;
/*253*/	r3.x = exp2(r3.x);
/*254*/	r3.x = min(r3.x, 1.000000);
/*255*/	r1.w = r1.w * r3.x;
/*256*/	r9.xyz = (r1.wwww * cb3.data[1].xyzx).xyz;
/*257*/	r9.xyz = (r8.xxxx * r9.xyzx).xyz;
/*258*/	r1.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*259*/	r3.x = r1.w + r1.w;
/*260*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r7.xyzx).xyz;
/*261*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*262*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*263*/	r3.x = inversesqrt(r3.x);
/*264*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*265*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*266*/	r10.xyz = (mix(cb3.data[2].xyzx, cb3.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*267*/	r11.xyz = (mix(cb3.data[4].xyzx, cb3.data[5].xyzx, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyz/**/;
/*268*/	r7.xyz = (mix(cb3.data[6].xyzx, cb3.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*269*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*270*/	r11.xyz = (r11.xyzx * r2.yyyy).xyz;
/*271*/	r10.xyz = (r2.xxxx * r10.xyzx + r11.xyzx).xyz;
/*272*/	r2.xyz = (r2.zzzz * r7.xyzx + r10.xyzx).xyz;
/*273*/	r1.w = saturate(-r1.w + 1.000000);
/*274*/	r1.w = r1.w * r1.w;
/*275*/	r1.w = r4.x * r1.w;
/*276*/	r1.w = r1.w * 1.500000;
/*277*/	r1.w = r8.w * r1.w;
/*278*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*279*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*280*/	r0.w = inversesqrt(r0.w);
/*281*/	r0.w = r0.w * r1.y;
/*282*/	r0.w = max(r0.w, 0.000000);
/*283*/	r0.w = r0.w * r1.w;
/*284*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*285*/	r0.xyz = (r0.xyzx * r7.wwww + r1.xyzx).xyz;
/*286*/	r1.xyz = (r9.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*287*/	r0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*288*/	r1.x = dot(r5.xyzw, cb1.data[9].xyzw);
/*289*/	r1.y = dot(r5.xyzw, cb1.data[10].xyzw);
/*290*/	r1.xy = (r1.xyxx / r2.wwww).xy;
/*291*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*292*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*293*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*294*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*295*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*296*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*297*/	if(r0.w != 0) discard;
/*298*/	r0.w = sqrt(r3.y);
/*299*/	r1.x = saturate(cb4.data[0].w)/**/;
/*300*/	r1.x = -r1.x + 1.000000;
/*301*/	r1.x = r1.x * 8.000000 + -4.000000;
/*302*/	r1.y = saturate(cb4.data[1].x)/**/;
/*303*/	r1.y = -r1.y + 1.000000;
/*304*/	r1.y = r1.y * 1000.000000;
/*305*/	r0.w = r0.w / r1.y;
/*306*/	r0.w = r0.w + r1.x;
/*307*/	r0.w = r0.w * 1.442695;
/*308*/	r0.w = exp2(r0.w);
/*309*/	r0.w = cb4.data[1].y / r0.w;
/*310*/	r0.w = saturate(-r0.w + cb4.data[1].y);
/*311*/	r1.x = -vsOut_T0.y + cb4.data[1].w;
/*312*/	r1.y = -cb4.data[1].z + cb4.data[1].w;
/*313*/	r1.x = r1.x + -cb4.data[1].z;
/*314*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*315*/	r1.x = saturate(r1.y * r1.x);
/*316*/	r1.y = r1.x * -2.000000 + 3.000000;
/*317*/	r1.x = r1.x * r1.x;
/*318*/	r1.x = r1.x * r1.y;
/*319*/	r1.y = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*320*/	r1.y = sqrt(r1.y);
/*321*/	r1.z = max(cb4.data[2].z, 0.001000);
/*322*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*323*/	r1.y = r1.z * r1.y;
/*324*/	r1.y = min(r1.y, 1.000000);
/*325*/	r1.z = r1.y * -2.000000 + 3.000000;
/*326*/	r1.y = r1.y * r1.y;
/*327*/	r1.y = r1.y * r1.z;
/*328*/	r0.w = cb4.data[2].x * r1.x + r0.w;
/*329*/	r1.xzw = (cb3.data[1].xxyz * cb4.data[0].xxyz).xzw;
/*330*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*331*/	r1.xzw = (r1.xxzw * abs(cb3.data[0].zzzz)).xzw;
/*332*/	r2.xyz = (r8.xxxx * r1.xzwx).xyz;
/*333*/	r6.w = max(r6.y, 0.000000);
/*334*/	r3.xyzw = (texture(s_sky, r6.xwzx.stp)).xyzw;
/*335*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb4.data[2].yyyy)));
/*336*/	r1.xzw = (-r1.xxzw * r8.xxxx + r3.xxyz).xzw;
/*337*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*338*/	r0.w = saturate(r0.w * r1.y);
/*339*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*340*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*341*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*342*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*343*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*344*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*345*/	color0.w = 1.000000;
/*346*/	return;
}
