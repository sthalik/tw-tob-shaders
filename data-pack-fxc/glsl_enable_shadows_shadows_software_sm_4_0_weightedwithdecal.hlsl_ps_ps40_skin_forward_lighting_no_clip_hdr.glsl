//
//
// Shader Model 4
// Fragment Shader
//
// id: 6071 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecal.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
/*14*/	r1.z = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*16*/	r2.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*17*/	r3.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*18*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*19*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*20*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*21*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*23*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*24*/	r3.z = vsOut_T6.z;
/*25*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*26*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*27*/	if(floatBitsToUint(r0.w) != 0u) {
/*28*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*29*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*31*/	  r0.w = -r0.w + 1.000000;
/*32*/	  r0.w = max(r0.w, 0.000000);
/*33*/	  r3.z = sqrt(r0.w);
/*34*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*35*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*36*/	  r0.w = r2.x * r6.w;
/*37*/	  r2.x = r0.w * -0.500000 + r2.x;
/*38*/	  r0.w = -r4.w * r5.w + 1.000000;
/*39*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*40*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*41*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*42*/	}
/*43*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*46*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*47*/	r0.w = inversesqrt(r0.w);
/*48*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*49*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*52*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*53*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*54*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*55*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*56*/	r0.w = inversesqrt(r0.w);
/*57*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*58*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*59*/	r1.w = -vsOut_T4.z + 1.000000;
/*60*/	r5.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*61*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*62*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*63*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*64*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*66*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*68*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*69*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*70*/	r5.xyz = (vsOut_T0.xyzx).xyz;
/*71*/	r5.w = 1.000000;
/*72*/	r2.x = dot(r5.xyzw, cb0.data[12].xyzw);
/*73*/	r6.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*74*/	r7.x = uintBitsToFloat((r2.x >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r7.y = uintBitsToFloat((r2.x >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*76*/	r7.z = uintBitsToFloat((r2.x >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*77*/	r7.w = uintBitsToFloat((r2.x >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*78*/	r7.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*79*/	r2.z = dot(r7.xyzw, r7.xyzw);
/*80*/	r2.w = intBitsToFloat(int(r2.z));
/*81*/	r3.w = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r3.w) != 0u) {
/*83*/	  r3.w = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*84*/	  r6.w = vsOut_T0.w;
/*85*/	  r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+2u].xyzw);
/*86*/	  r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+3u].xyzw);
/*87*/	  r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+4u].xyzw);
/*88*/	  r3.w = dot(r6.xyzw, cb1.data[floatBitsToUint(r3.w)+5u].xyzw);
/*89*/	  r7.xyz = (r7.xyzx / r3.wwww).xyz;
/*90*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(r7.xyxx, cb1.data[floatBitsToUint(r2.w)+41u].xyxx)) * 0xffffffffu)).xy;
/*91*/	  r4.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*92*/	  r8.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+41u].zwzz, r7.xyxx)) * 0xffffffffu)).xy;
/*93*/	  r7.w = uintBitsToFloat(floatBitsToUint(r8.y) | floatBitsToUint(r8.x));
/*94*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r7.w));
/*95*/	  if(floatBitsToUint(r4.w) == 0u) {
/*96*/	    r7.xy = (r7.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*97*/	    r8.xy = floor((r7.xyxx).xy);
/*98*/	    r9.xy = (r8.xyxx / cb1.data[0].xyxx).xy;
/*99*/	    r3.w = -0.000400 / r3.w;
/*100*/	    r3.w = r3.w + r7.z;
/*101*/	    r9.z = -r9.y + 1.000000;
/*102*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r9.xzxx.st, 0.000000)).xyzw;
/*103*/	    r9.w = -r9.y;
/*104*/	    r11.x = cb1.data[0].z/**/;
/*105*/	    r11.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*106*/	    r7.zw = (r9.xxxw + r11.xxxy).zw;
/*107*/	    r12.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*108*/	    r11.w = -cb1.data[0].w/**/;
/*109*/	    r7.zw = (r9.xxxz + r11.zzzw).zw;
/*110*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).xyzw;
/*111*/	    r7.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r9.xxxz).zw;
/*112*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r7.zwzz.st, 0.000000)).yzwx;
/*113*/	    r9.x = r10.x;
/*114*/	    r9.y = r12.x;
/*115*/	    r9.z = r11.x;
/*116*/	    r9.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r9.xyzw)) * 0xffffffffu);
/*117*/	    r10.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*118*/	    r7.xy = (r7.xyxx + -r8.xyxx).xy;
/*119*/	    r7.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r9.xxxz), uvec4(0)))).zw;
/*120*/	    r7.zw = (r7.zzzw + r10.yyyw).zw;
/*121*/	    r7.xz = (r7.xxxx * r7.zzwz + r10.xxzx).xz;
/*122*/	    r3.w = -r7.x + r7.z;
/*123*/	    r3.w = r7.y * r3.w + r7.x;
/*124*/	  } else {
/*125*/	    r3.w = 1.000000;
/*126*/	  }
/*127*/	} else {
/*128*/	  r3.w = 1.000000;
/*129*/	}
/*130*/	r4.w = cb1.data[34].w + -1.000000;
/*131*/	r2.z = uintBitsToFloat((r2.z == r4.w) ? 0xffffffffu : 0x00000000u);
/*132*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*133*/	if(floatBitsToUint(r2.z) == 0u) {
/*134*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.w) + int(1));
/*135*/	  r2.z = floatBitsToInt(r2.z);
/*136*/	  r2.z = uintBitsToFloat((r2.z < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*137*/	  if(floatBitsToUint(r2.z) != 0u) {
/*138*/	    r2.z = intBitsToFloat(floatBitsToInt(r2.w) << int(2));
/*139*/	    r6.w = vsOut_T0.w;
/*140*/	    r7.x = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+6u].xyzw);
/*141*/	    r7.y = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+7u].xyzw);
/*142*/	    r7.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+8u].xyzw);
/*143*/	    r2.z = dot(r6.xyzw, cb1.data[floatBitsToUint(r2.z)+9u].xyzw);
/*144*/	    r6.xyz = (r7.xyzx / r2.zzzz).xyz;
/*145*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r2.w)+42u].xyxx)) * 0xffffffffu)).xy;
/*146*/	    r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*147*/	    r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r2.w)+42u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*148*/	    r7.x = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*149*/	    r6.w = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r7.x));
/*150*/	    if(floatBitsToUint(r6.w) == 0u) {
/*151*/	      r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*152*/	      r7.xy = floor((r6.xyxx).xy);
/*153*/	      r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*154*/	      r2.z = -0.000400 / r2.z;
/*155*/	      r2.z = r2.z + r6.z;
/*156*/	      r8.z = -r8.y + 1.000000;
/*157*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*158*/	      r8.w = -r8.y;
/*159*/	      r10.x = cb1.data[0].z/**/;
/*160*/	      r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*161*/	      r6.zw = (r8.xxxw + r10.xxxy).zw;
/*162*/	      r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*163*/	      r10.w = -cb1.data[0].w/**/;
/*164*/	      r6.zw = (r8.xxxz + r10.zzzw).zw;
/*165*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*166*/	      r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*167*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*168*/	      r8.x = r9.x;
/*169*/	      r8.y = r11.x;
/*170*/	      r8.z = r10.x;
/*171*/	      r8.xyzw = uintBitsToFloat(uvec4(lessThan(r2.zzzz, r8.xyzw)) * 0xffffffffu);
/*172*/	      r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*173*/	      r6.xy = (r6.xyxx + -r7.xyxx).xy;
/*174*/	      r6.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r8.xxxz), uvec4(0)))).zw;
/*175*/	      r6.zw = (r6.zzzw + r9.yyyw).zw;
/*176*/	      r6.xz = (r6.xxxx * r6.zzwz + r9.xxzx).xz;
/*177*/	      r2.z = -r6.x + r6.z;
/*178*/	      r2.z = r6.y * r2.z + r6.x;
/*179*/	    } else {
/*180*/	      r2.z = 1.000000;
/*181*/	    }
/*182*/	  } else {
/*183*/	    r2.z = 1.000000;
/*184*/	  }
/*185*/	  r6.x = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*186*/	  r6.y = r6.x * cb1.data[34].x;
/*187*/	  r6.x = -r6.x * cb1.data[34].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*188*/	  r6.x = r2.x + -r6.x;
/*189*/	  r6.x = saturate(r6.x / r6.y);
/*190*/	  r2.z = -r3.w + r2.z;
/*191*/	  r3.w = r6.x * r2.z + r3.w;
/*192*/	}
/*193*/	if(floatBitsToUint(r4.w) != 0u) {
/*194*/	  r2.z = -cb1.data[floatBitsToUint(r2.w)+36u].x + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*195*/	  r4.w = r2.z * cb1.data[34].y;
/*196*/	  r2.z = -r2.z * cb1.data[34].y + cb1.data[floatBitsToUint(r2.w)+37u].x;
/*197*/	  r2.z = -r2.z + r2.x;
/*198*/	  r2.z = saturate(r2.z / r4.w);
/*199*/	  r2.w = -r3.w + 1.000000;
/*200*/	  r3.w = r2.z * r2.w + r3.w;
/*201*/	}
/*202*/	r3.w = saturate(r3.w);
/*203*/	r6.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*204*/	r2.z = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*205*/	r2.z = inversesqrt(r2.z);
/*206*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*207*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*208*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*209*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*210*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*211*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*212*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*213*/	r2.w = r2.z * r8.x + 0.300000;
/*214*/	r2.w = saturate(-r2.w + 1.000000);
/*215*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*216*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*217*/	r4.w = -r2.z * r8.x + 1.000000;
/*218*/	r8.yzw = (r4.wwww * r8.yyzw).yzw;
/*219*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*220*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*221*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*222*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*223*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*224*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*225*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*226*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*227*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*228*/	r2.w = saturate(r2.z);
/*229*/	r2.w = r2.w * r2.w;
/*230*/	r4.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*231*/	r4.w = r4.w * r4.w;
/*232*/	r4.w = r4.w * r4.w;
/*233*/	r2.w = r2.w * r4.w;
/*234*/	r2.w = r4.z * r2.w;
/*235*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*236*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*237*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*238*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*239*/	r4.yzw = (r3.wwww * r4.yyzw).yzw;
/*240*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*241*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*242*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*243*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*244*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*245*/	r2.w = inversesqrt(r2.w);
/*246*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*247*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*248*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*249*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*250*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*251*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*252*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*253*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*254*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*255*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*256*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*257*/	r2.w = r7.z * r7.x;
/*258*/	r2.y = r2.y * r2.y;
/*259*/	r2.z = r2.z + r2.z;
/*260*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*261*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*262*/	r2.z = max(r2.z, 0.000000);
/*263*/	r2.y = r2.y * 127.000000 + 1.600000;
/*264*/	r2.z = log2(r2.z);
/*265*/	r2.y = r2.z * r2.y;
/*266*/	r2.y = exp2(r2.y);
/*267*/	r2.y = min(r2.y, 1.000000);
/*268*/	r1.w = r1.w * r2.y;
/*269*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*270*/	r7.xyz = (r7.xxxx * r8.xyzx).xyz;
/*271*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*272*/	r2.y = r1.w + r1.w;
/*273*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*274*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*275*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*276*/	r2.y = inversesqrt(r2.y);
/*277*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*278*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*279*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*280*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*281*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*282*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*283*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*284*/	r6.xyz = (r3.xxxx * r8.xyzx + r6.xyzx).xyz;
/*285*/	r3.xyz = (r3.zzzz * r9.xyzx + r6.xyzx).xyz;
/*286*/	r1.w = saturate(-r1.w + 1.000000);
/*287*/	r1.w = r1.w * r1.w;
/*288*/	r1.w = r4.x * r1.w;
/*289*/	r1.w = r1.w * 1.500000;
/*290*/	r1.w = r7.w * r1.w;
/*291*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*292*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*293*/	r0.w = inversesqrt(r0.w);
/*294*/	r0.w = r0.w * r1.y;
/*295*/	r0.w = max(r0.w, 0.000000);
/*296*/	r0.w = r0.w * r1.w;
/*297*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*298*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*299*/	r1.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*300*/	color0.xyz = (r3.wwww * r1.xyzx + r0.xyzx).xyz;
/*301*/	r0.x = dot(r5.xyzw, cb0.data[9].xyzw);
/*302*/	r0.y = dot(r5.xyzw, cb0.data[10].xyzw);
/*303*/	r0.xy = (r0.xyxx / r2.xxxx).xy;
/*304*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*305*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*306*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*307*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*308*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*309*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*310*/	if(r0.x != 0) discard;
/*311*/	color0.w = 1.000000;
/*312*/	color1.x = 1.000000;
/*313*/	return;
}
