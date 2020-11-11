//
//
// Shader Model 4
// Fragment Shader
//
// id: 5812 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecal.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_P1;
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
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
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
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r2.z = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*30*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*31*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*32*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*33*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*34*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*35*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*36*/	r4.z = vsOut_T6.z;
/*37*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*38*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*39*/	if(floatBitsToUint(r0.w) != 0u) {
/*40*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*41*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*43*/	  r0.w = -r0.w + 1.000000;
/*44*/	  r0.w = max(r0.w, 0.000000);
/*45*/	  r4.z = sqrt(r0.w);
/*46*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*48*/	  r0.w = r3.x * r7.w;
/*49*/	  r3.x = r0.w * -0.500000 + r3.x;
/*50*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*51*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*52*/	  r0.w = -r5.w * r6.w + 1.000000;
/*53*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*54*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*55*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*56*/	}
/*57*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*59*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*60*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*62*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*63*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*64*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*65*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*66*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*67*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*71*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*74*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*78*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*79*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*80*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*83*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*84*/	r4.w = 1.000000;
/*85*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*86*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*87*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*88*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*90*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*92*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*93*/	r3.x = intBitsToFloat(int(r2.w));
/*94*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*95*/	if(floatBitsToUint(r3.z) != 0u) {
/*96*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*97*/	  r5.w = vsOut_T0.w;
/*98*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*99*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*100*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*101*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*102*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*103*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*104*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*105*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*106*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*107*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*108*/	  if(floatBitsToUint(r3.w) == 0u) {
/*109*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*110*/	    r7.xy = floor((r6.xyxx).xy);
/*111*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*112*/	    r3.z = -0.000400 / r3.z;
/*113*/	    r3.z = r3.z + r6.z;
/*114*/	    r8.z = -r8.y + 1.000000;
/*115*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*116*/	    r8.w = -r8.y;
/*117*/	    r10.x = cb1.data[0].z/**/;
/*118*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*119*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*120*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*121*/	    r10.w = -cb1.data[0].w/**/;
/*122*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*123*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*124*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*125*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*126*/	    r8.x = r9.x;
/*127*/	    r8.y = r11.x;
/*128*/	    r8.z = r10.x;
/*129*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*130*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*131*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*132*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*133*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*134*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*135*/	    r3.z = -r6.x + r6.y;
/*136*/	    r3.z = r3.w * r3.z + r6.x;
/*137*/	  } else {
/*138*/	    r3.z = 1.000000;
/*139*/	  }
/*140*/	} else {
/*141*/	  r3.z = 1.000000;
/*142*/	}
/*143*/	r3.w = cb1.data[34].w + -1.000000;
/*144*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*145*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*146*/	if(floatBitsToUint(r2.w) == 0u) {
/*147*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*148*/	  r2.w = floatBitsToInt(r2.w);
/*149*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*150*/	  if(floatBitsToUint(r2.w) != 0u) {
/*151*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*152*/	    r5.w = vsOut_T0.w;
/*153*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*154*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*155*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*156*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*157*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*158*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*159*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*160*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*161*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*162*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*163*/	    if(floatBitsToUint(r5.w) == 0u) {
/*164*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*165*/	      r6.xy = floor((r5.xyxx).xy);
/*166*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*167*/	      r2.w = -0.000400 / r2.w;
/*168*/	      r2.w = r2.w + r5.z;
/*169*/	      r7.z = -r7.y + 1.000000;
/*170*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*171*/	      r7.w = -r7.y;
/*172*/	      r9.x = cb1.data[0].z/**/;
/*173*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*174*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*175*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*176*/	      r9.w = -cb1.data[0].w/**/;
/*177*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*178*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*179*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*180*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*181*/	      r7.x = r8.x;
/*182*/	      r7.y = r10.x;
/*183*/	      r7.z = r9.x;
/*184*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*185*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*186*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*187*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*188*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*189*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*190*/	      r2.w = -r5.x + r5.z;
/*191*/	      r2.w = r5.y * r2.w + r5.x;
/*192*/	    } else {
/*193*/	      r2.w = 1.000000;
/*194*/	    }
/*195*/	  } else {
/*196*/	    r2.w = 1.000000;
/*197*/	  }
/*198*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*199*/	  r5.y = r5.x * cb1.data[34].x;
/*200*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*201*/	  r5.x = r1.w + -r5.x;
/*202*/	  r5.x = saturate(r5.x / r5.y);
/*203*/	  r2.w = -r3.z + r2.w;
/*204*/	  r3.z = r5.x * r2.w + r3.z;
/*205*/	}
/*206*/	if(floatBitsToUint(r3.w) != 0u) {
/*207*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*208*/	  r3.w = r2.w * cb1.data[34].y;
/*209*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*210*/	  r2.w = r1.w + -r2.w;
/*211*/	  r2.w = saturate(r2.w / r3.w);
/*212*/	  r3.x = -r3.z + 1.000000;
/*213*/	  r3.z = r2.w * r3.x + r3.z;
/*214*/	}
/*215*/	r3.z = saturate(r3.z);
/*216*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*217*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*218*/	r2.w = inversesqrt(r2.w);
/*219*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*220*/	r2.w = -r3.y + 1.000000;
/*221*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*222*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*223*/	r3.w = r3.w + r3.w;
/*224*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*225*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*226*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*227*/	r3.w = cos((r8.x));
/*228*/	r3.w = inversesqrt(r3.w);
/*229*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*230*/	r5.w = saturate(r0.w * 60.000000);
/*231*/	r5.w = -r0.w + r5.w;
/*232*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*233*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*234*/	r6.w = inversesqrt(r6.w);
/*235*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*236*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*237*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*238*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*239*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*240*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*241*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*242*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*243*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*244*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*245*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*246*/	r6.w = -r0.w + 1.000000;
/*247*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*248*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*249*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*250*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*251*/	  r6.w = max(r6.w, 0.000000);
/*252*/	  r6.w = log2(r6.w);
/*253*/	  r6.w = r6.w * 10.000000;
/*254*/	  r6.w = exp2(r6.w);
/*255*/	  r6.w = r3.w * r6.w;
/*256*/	  r6.w = r6.w * r5.w + r0.w;
/*257*/	  r7.y = r2.w * 8.000000;
/*258*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*259*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*260*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*261*/	}
/*262*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*263*/	r7.y = max(r6.w, 0.000000);
/*264*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*265*/	if(floatBitsToUint(r6.w) != 0u) {
/*266*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*267*/	  r6.x = max(r6.x, -1.000000);
/*268*/	  r6.x = min(r6.x, 1.000000);
/*269*/	  r6.y = -abs(r6.x) + 1.000000;
/*270*/	  r6.y = sqrt(r6.y);
/*271*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*272*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*273*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*274*/	  r6.w = r6.y * r6.z;
/*275*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*276*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*277*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*278*/	  r6.x = r6.z * r6.y + r6.x;
/*279*/	  r3.y = r3.y * r3.y;
/*280*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*281*/	  r3.x = r3.y * r3.x + r7.x;
/*282*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*283*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*284*/	  r3.y = -r3.x * r3.x + 1.000000;
/*285*/	  r3.y = max(r3.y, 0.001000);
/*286*/	  r3.y = log2(r3.y);
/*287*/	  r6.y = r3.y * 4.950617;
/*288*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*289*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*290*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*291*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*292*/	  r3.x = floatBitsToInt(r3.x);
/*293*/	  r6.y = r3.y * r3.y + -r6.y;
/*294*/	  r6.y = sqrt(r6.y);
/*295*/	  r3.y = -r3.y + r6.y;
/*296*/	  r3.y = max(r3.y, 0.000000);
/*297*/	  r3.y = sqrt(r3.y);
/*298*/	  r3.x = r3.y * r3.x;
/*299*/	  r3.x = r3.x * 1.414214;
/*300*/	  r3.x = 0.008727 / r3.x;
/*301*/	  r3.x = max(r3.x, 0.000100);
/*302*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*303*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*304*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*305*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*306*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*307*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*308*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*309*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*310*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*311*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*312*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*313*/	  r3.x = floatBitsToInt(r3.x);
/*314*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*315*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*316*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*317*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*318*/	  r3.x = r3.x * r6.x + 1.000000;
/*319*/	  r3.x = r3.x * 0.500000;
/*320*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*321*/	  r3.y = r3.y * r6.y + 1.000000;
/*322*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*323*/	  r3.y = min(r7.y, 1.000000);
/*324*/	  r2.w = r2.w * 1.570796;
/*325*/	  r2.w = sin(r2.w);
/*326*/	  r3.y = r3.y + -1.000000;
/*327*/	  r2.w = r2.w * r3.y + 1.000000;
/*328*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*329*/	  r3.y = max(r3.y, 0.000000);
/*330*/	  r3.y = log2(r3.y);
/*331*/	  r3.y = r3.y * 10.000000;
/*332*/	  r3.y = exp2(r3.y);
/*333*/	  r3.y = r3.w * r3.y;
/*334*/	  r3.y = r3.y * r5.w + r0.w;
/*335*/	  r2.w = r2.w * abs(r3.x);
/*336*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*337*/	} else {
/*338*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*339*/	}
/*340*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*341*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*342*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*343*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*344*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*345*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*346*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*347*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*348*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*349*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*350*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*351*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*352*/	r2.w = inversesqrt(r2.w);
/*353*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*354*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*355*/	r2.w = r2.w + r2.w;
/*356*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*357*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*358*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*359*/	r2.x = max(r2.x, 0.000000);
/*360*/	r2.x = log2(r2.x);
/*361*/	r2.x = r2.x * 10.000000;
/*362*/	r2.x = exp2(r2.x);
/*363*/	r2.x = r3.w * r2.x;
/*364*/	r0.w = r2.x * r5.w + r0.w;
/*365*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*366*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*367*/	color0.w = 2.000000;
/*368*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*369*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*370*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*371*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*372*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*373*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*374*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*375*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*376*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*377*/	if(r0.x != 0) discard;
/*378*/	color1.x = 1.000000;
/*379*/	return;
}
