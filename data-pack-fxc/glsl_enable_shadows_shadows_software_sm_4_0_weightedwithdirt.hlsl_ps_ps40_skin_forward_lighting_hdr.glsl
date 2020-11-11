//
//
// Shader Model 4
// Fragment Shader
//
// id: 6002 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirt.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*17*/	r2.z = sqrt(r0.w);
/*18*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
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
/*47*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
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
/*59*/	r2.w = dot(r5.xyzw, cb0.data[12].xyzw);
/*60*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*61*/	r7.x = uintBitsToFloat((r2.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*62*/	r7.y = uintBitsToFloat((r2.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*63*/	r7.z = uintBitsToFloat((r2.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*64*/	r7.w = uintBitsToFloat((r2.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*65*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*66*/	r3.y = dot(r7.xyzw, r7.xyzw);
/*67*/	r3.z = intBitsToFloat(int(r3.y));
/*68*/	r3.w = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*69*/	if(floatBitsToUint(r3.w) != 0u) {
/*70*/	  r3.w = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*71*/	  r6.w = vsOut_T0.w;
/*72*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*73*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*74*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*75*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*76*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*77*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r3.z)+41u].xyxx)) * 0xffffffffu)).xy;
/*78*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*79*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*80*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*81*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*82*/	  if(floatBitsToUint(r4.w) == 0u) {
/*83*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*84*/	    r8.xy = floor((r7.xyxx).xy);
/*85*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*86*/	    r3.w = -0.000400 / r3.w;
/*87*/	    r3.w = r3.w + r7.z;
/*88*/	    r9.z = -r9.y + 1.000000;
/*89*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*90*/	    r9.w = -r9.y;
/*91*/	    r11.x = cb1.data[0].z/**/;
/*92*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*93*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*94*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*95*/	    r11.w = -cb1.data[0].w/**/;
/*96*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*97*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*98*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
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
/*117*/	r4.w = cb1.data[34].w + -1.000000;
/*118*/	r3.y = uintBitsToFloat((r3.y == r4.w) ? 0xffffffffu : 0x00000000u);
/*119*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.y) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*120*/	if(floatBitsToUint(r3.y) == 0u) {
/*121*/	  r3.y = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*122*/	  r3.y = floatBitsToInt(r3.y);
/*123*/	  r3.y = uintBitsToFloat((r3.y < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*124*/	  if(floatBitsToUint(r3.y) != 0u) {
/*125*/	    r3.y = intBitsToFloat(floatBitsToInt(r3.z) << int(2));
/*126*/	    r6.w = vsOut_T0.w;
/*127*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+6u].xyzw);
/*128*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+7u].xyzw);
/*129*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+8u].xyzw);
/*130*/	    r3.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.y)+9u].xyzw);
/*131*/	    r6.xyz = (r7.xyzx / r3.yyyy).xyz;
/*132*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.z)+42u].xyxx)) * 0xffffffffu)).xy;
/*133*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*134*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.z)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*135*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*136*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*137*/	    if(floatBitsToUint(r6.w) == 0u) {
/*138*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*139*/	      r7.xy = floor((r6.xyxx).xy);
/*140*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*141*/	      r3.y = -0.000400 / r3.y;
/*142*/	      r3.y = r3.y + r6.z;
/*143*/	      r8.z = -r8.y + 1.000000;
/*144*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*145*/	      r8.w = -r8.y;
/*146*/	      r10.x = cb1.data[0].z/**/;
/*147*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*148*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*149*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*150*/	      r10.w = -cb1.data[0].w/**/;
/*151*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*152*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*153*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
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
/*172*/	  r6.x = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*173*/	  r6.y = r6.x * cb1.data[34].x;
/*174*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*175*/	  r6.x = r2.w + -r6.x;
/*176*/	  r6.x = saturate(r6.x / r6.y);
/*177*/	  r3.y = -r3.w + r3.y;
/*178*/	  r3.w = r6.x * r3.y + r3.w;
/*179*/	}
/*180*/	if(floatBitsToUint(r4.w) != 0u) {
/*181*/	  r3.y = -cb1.data[floatBitsToUint(r3.z)+36u].x + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*182*/	  r4.w = r3.y * cb1.data[34].y;
/*183*/	  r3.y = -r3.y * cb1.data[34].y + cb1.data[floatBitsToUint(r3.z)+37u].x;
/*184*/	  r3.y = r2.w + -r3.y;
/*185*/	  r3.y = saturate(r3.y / r4.w);
/*186*/	  r3.z = -r3.w + 1.000000;
/*187*/	  r3.w = r3.y * r3.z + r3.w;
/*188*/	}
/*189*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*190*/	r3.y = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*191*/	r3.y = inversesqrt(r3.y);
/*192*/	r6.xyz = (r3.yyyy * r6.xyzx).xyz;
/*193*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*195*/	r3.y = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*196*/	r8.xyz = (r3.yyyy * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*197*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*198*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*199*/	r3.z = r3.y * r8.x + 0.300000;
/*200*/	r3.z = saturate(-r3.z + 1.000000);
/*201*/	r10.xyz = (r3.zzzz * r9.xyzx).xyz;
/*202*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*203*/	r4.w = -r3.y * r8.x + 1.000000;
/*204*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*205*/	r9.xyz = (-r9.xyzx * r3.zzzz + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*206*/	r10.xyz = (r3.yyyy * r8.xxxx + r10.xyzx).xyz;
/*207*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*208*/	r8.xyz = (-r3.yyyy + r8.xyzx).xyz;
/*209*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r3.yyyy).xyz;
/*210*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*211*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*212*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*213*/	r3.y = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*214*/	r3.zw = saturate(r3.yyyw).zw;
/*215*/	r3.z = r3.z * r3.z;
/*216*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*217*/	r4.w = r4.w * r4.w;
/*218*/	r4.w = r4.w * r4.w;
/*219*/	r3.z = r3.z * r4.w;
/*220*/	r3.z = r4.z * r3.z;
/*221*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*222*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*223*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*224*/	r4.yzw = (r3.zzzz * r4.yyzw).yzw;
/*225*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*226*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*227*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*228*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*229*/	r8.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*230*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*231*/	r3.z = inversesqrt(r3.z);
/*232*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*233*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*234*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*235*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*236*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*237*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*238*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*239*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*240*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*241*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*242*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*243*/	r3.z = r7.z * r7.x;
/*244*/	r3.x = r3.x * r3.x;
/*245*/	r3.y = r3.y + r3.y;
/*246*/	r8.xyz = (r2.xyzx * -r3.yyyy + cb2.data[0].yzwy).xyz;
/*247*/	r3.y = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*248*/	r3.y = max(r3.y, 0.000000);
/*249*/	r3.x = r3.x * 127.000000 + 1.600000;
/*250*/	r3.y = log2(r3.y);
/*251*/	r3.x = r3.y * r3.x;
/*252*/	r3.x = exp2(r3.x);
/*253*/	r3.x = min(r3.x, 1.000000);
/*254*/	r1.w = r1.w * r3.x;
/*255*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*256*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*257*/	r1.w = dot(vec3(-r6.xyzx), vec3(r2.xyzx));
/*258*/	r3.x = r1.w + r1.w;
/*259*/	r2.xyz = (r2.xyzx * -r3.xxxx + -r6.xyzx).xyz;
/*260*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*261*/	r3.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*262*/	r3.x = inversesqrt(r3.x);
/*263*/	r2.xyz = (r2.xyzx * r3.xxxx).xyz;
/*264*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*265*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*266*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*267*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*268*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*269*/	r6.xyz = (r6.xywx * r2.yyyy).xyz;
/*270*/	r6.xyz = (r2.xxxx * r8.xyzx + r6.xyzx).xyz;
/*271*/	r2.xyz = (r2.zzzz * r9.xyzx + r6.xyzx).xyz;
/*272*/	r1.w = saturate(-r1.w + 1.000000);
/*273*/	r1.w = r1.w * r1.w;
/*274*/	r1.w = r4.x * r1.w;
/*275*/	r1.w = r1.w * 1.500000;
/*276*/	r1.w = r7.w * r1.w;
/*277*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*278*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*279*/	r0.w = inversesqrt(r0.w);
/*280*/	r0.w = r0.w * r1.y;
/*281*/	r0.w = max(r0.w, 0.000000);
/*282*/	r0.w = r0.w * r1.w;
/*283*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*284*/	r0.xyz = (r0.xyzx * r3.zzzz + r1.xyzx).xyz;
/*285*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*286*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*287*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*288*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*289*/	r0.xy = (r0.xyxx / r2.wwww).xy;
/*290*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*291*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*292*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*293*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*294*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*295*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*296*/	if(r0.x != 0) discard;
/*297*/	color0.w = 1.000000;
/*298*/	color1.x = 1.000000;
/*299*/	return;
}
