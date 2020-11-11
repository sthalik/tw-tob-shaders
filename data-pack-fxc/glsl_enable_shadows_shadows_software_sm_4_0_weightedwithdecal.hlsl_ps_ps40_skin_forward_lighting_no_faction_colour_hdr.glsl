//
//
// Shader Model 4
// Fragment Shader
//
// id: 6073 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecal.hlsl_PS_ps40_skin_forward_lighting_no_faction_colour_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r1.z = sqrt(r0.w);
/*11*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*12*/	r2.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*13*/	r3.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*14*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*15*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*20*/	r3.z = vsOut_T6.z;
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*22*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*23*/	if(floatBitsToUint(r0.w) != 0u) {
/*24*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	  r0.w = -r0.w + 1.000000;
/*28*/	  r0.w = max(r0.w, 0.000000);
/*29*/	  r3.z = sqrt(r0.w);
/*30*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*32*/	  r0.w = r2.x * r6.w;
/*33*/	  r2.x = r0.w * -0.500000 + r2.x;
/*34*/	  r0.w = -r4.w * r5.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*36*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*37*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*38*/	}
/*39*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r0.w = inversesqrt(r0.w);
/*41*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*42*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*43*/	r0.w = inversesqrt(r0.w);
/*44*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*45*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r0.w = inversesqrt(r0.w);
/*47*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*48*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*49*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*50*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*51*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*54*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*56*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*57*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*58*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*59*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*61*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*62*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*63*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*64*/	r5.w = 1.000000;
/*65*/	r2.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*66*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*67*/	r7.x = uintBitsToFloat((r2.x >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*68*/	r7.y = uintBitsToFloat((r2.x >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*69*/	r7.z = uintBitsToFloat((r2.x >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*70*/	r7.w = uintBitsToFloat((r2.x >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*71*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*72*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*73*/	r2.w = intBitsToFloat(int(r2.z));
/*74*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*75*/	if(floatBitsToUint(r3.w) != 0u) {
/*76*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*77*/	  r6.w = vsOut_T0.w;
/*78*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*79*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*80*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*81*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*82*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*83*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*84*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*85*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*86*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*87*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*88*/	  if(floatBitsToUint(r4.w) == 0u) {
/*89*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*90*/	    r8.xy = floor((r7.xyxx).xy);
/*91*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*92*/	    r3.w = -0.000400 / r3.w;
/*93*/	    r3.w = r3.w + r7.z;
/*94*/	    r9.z = -r9.y + 1.000000;
/*95*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*96*/	    r9.w = -r9.y;
/*97*/	    r11.x = cb1.data[0].z/**/;
/*98*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*99*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*100*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*101*/	    r11.w = -cb1.data[0].w/**/;
/*102*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*103*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*104*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*105*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*106*/	    r9.x = r10.x;
/*107*/	    r9.y = r12.x;
/*108*/	    r9.z = r11.x;
/*109*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*110*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*111*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*112*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*113*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*114*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*115*/	    r3.w = -r7.x + r7.z;
/*116*/	    r3.w = r7.y * r3.w + r7.x;
/*117*/	  } else {
/*118*/	    r3.w = 1.000000;
/*119*/	  }
/*120*/	} else {
/*121*/	  r3.w = 1.000000;
/*122*/	}
/*123*/	r4.w = cb1.data[34].w + -1.000000;
/*124*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*125*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*126*/	if(floatBitsToUint(r2.z) == 0u) {
/*127*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*128*/	  r2.z = floatBitsToInt(r2.z);
/*129*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*130*/	  if(floatBitsToUint(r2.z) != 0u) {
/*131*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*132*/	    r6.w = vsOut_T0.w;
/*133*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*134*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*135*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*136*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*137*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*138*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*139*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*140*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*141*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*142*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*143*/	    if(floatBitsToUint(r6.w) == 0u) {
/*144*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*145*/	      r7.xy = floor((r6.xyxx).xy);
/*146*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*147*/	      r2.z = -0.000400 / r2.z;
/*148*/	      r2.z = r2.z + r6.z;
/*149*/	      r8.z = -r8.y + 1.000000;
/*150*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*151*/	      r8.w = -r8.y;
/*152*/	      r10.x = cb1.data[0].z/**/;
/*153*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*154*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*155*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*156*/	      r10.w = -cb1.data[0].w/**/;
/*157*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*158*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*159*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*160*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*161*/	      r8.x = r9.x;
/*162*/	      r8.y = r11.x;
/*163*/	      r8.z = r10.x;
/*164*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*165*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*166*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*167*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*168*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*169*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*170*/	      r2.z = -r6.x + r6.z;
/*171*/	      r2.z = r6.y * r2.z + r6.x;
/*172*/	    } else {
/*173*/	      r2.z = 1.000000;
/*174*/	    }
/*175*/	  } else {
/*176*/	    r2.z = 1.000000;
/*177*/	  }
/*178*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*179*/	  r6.y = r6.x * cb1.data[34].x;
/*180*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*181*/	  r6.x = r2.x + -r6.x;
/*182*/	  r6.x = saturate(r6.x / r6.y);
/*183*/	  r2.z = -r3.w + r2.z;
/*184*/	  r3.w = r6.x * r2.z + r3.w;
/*185*/	}
/*186*/	if(floatBitsToUint(r4.w) != 0u) {
/*187*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*188*/	  r4.w = r2.z * cb1.data[34].y;
/*189*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*190*/	  r2.z = -r2.z + r2.x;
/*191*/	  r2.z = saturate(r2.z / r4.w);
/*192*/	  r2.w = -r3.w + 1.000000;
/*193*/	  r3.w = r2.z * r2.w + r3.w;
/*194*/	}
/*195*/	r3.w = saturate(r3.w);
/*196*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*197*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*198*/	r2.z = inversesqrt(r2.z);
/*199*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*200*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*201*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*202*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*203*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*204*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*205*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*206*/	r2.w = r2.z * r8.x + 0.300000;
/*207*/	r2.w = saturate(-r2.w + 1.000000);
/*208*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*209*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*210*/	r4.w = -r2.z * r8.x + 1.000000;
/*211*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*212*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*213*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*214*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*215*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*216*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*217*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*218*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*219*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*220*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*221*/	r2.w = saturate(r2.z);
/*222*/	r2.w = r2.w * r2.w;
/*223*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*224*/	r4.w = r4.w * r4.w;
/*225*/	r4.w = r4.w * r4.w;
/*226*/	r2.w = r2.w * r4.w;
/*227*/	r2.w = r4.z * r2.w;
/*228*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*229*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*230*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*231*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*232*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*233*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*234*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*235*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*236*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*237*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*238*/	r2.w = inversesqrt(r2.w);
/*239*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*240*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*241*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*242*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*243*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*244*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*245*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*246*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*247*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*248*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*249*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*250*/	r2.w = r7.z * r7.x;
/*251*/	r2.y = r2.y * r2.y;
/*252*/	r2.z = r2.z + r2.z;
/*253*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*254*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*255*/	r2.z = max(r2.z, 0.000000);
/*256*/	r2.y = r2.y * 127.000000 + 1.600000;
/*257*/	r2.z = log2(r2.z);
/*258*/	r2.y = r2.z * r2.y;
/*259*/	r2.y = exp2(r2.y);
/*260*/	r2.y = min(r2.y, 1.000000);
/*261*/	r1.w = r1.w * r2.y;
/*262*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*263*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*264*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*265*/	r2.y = r1.w + r1.w;
/*266*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*267*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*268*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*269*/	r2.y = inversesqrt(r2.y);
/*270*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*271*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*272*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*273*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*274*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*275*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*276*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*277*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*278*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*279*/	r1.w = saturate(-r1.w + 1.000000);
/*280*/	r1.w = r1.w * r1.w;
/*281*/	r1.w = r4.x * r1.w;
/*282*/	r1.w = r1.w * 1.500000;
/*283*/	r1.w = r7.w * r1.w;
/*284*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*285*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*286*/	r0.w = inversesqrt(r0.w);
/*287*/	r0.w = r0.w * r1.y;
/*288*/	r0.w = max(r0.w, 0.000000);
/*289*/	r0.w = r0.w * r1.w;
/*290*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*291*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*292*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*293*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*294*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*295*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*296*/	r0.xy = (r0.xyxx / r2.xxxx).xy;
/*297*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*298*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*299*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*300*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*301*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*302*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*303*/	if(r0.x != 0) discard;
/*304*/	color0.w = 1.000000;
/*305*/	color1.x = 1.000000;
/*306*/	return;
}
