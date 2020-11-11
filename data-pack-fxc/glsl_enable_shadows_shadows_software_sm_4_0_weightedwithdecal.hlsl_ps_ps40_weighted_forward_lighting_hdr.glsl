//
//
// Shader Model 4
// Fragment Shader
//
// id: 5810 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecal.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*8*/	r0.w = saturate(vsOut_P1.w);
/*9*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*10*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*11*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*12*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*13*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*14*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*16*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*17*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*19*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*21*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*23*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*24*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r0.w = max(r0.w, 0.000000);
/*29*/	r2.z = sqrt(r0.w);
/*30*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*31*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*32*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*33*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*34*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*35*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*36*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*37*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*38*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*39*/	r4.z = vsOut_T6.z;
/*40*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*41*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*42*/	if(floatBitsToUint(r0.w) != 0u) {
/*43*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*44*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*46*/	  r0.w = -r0.w + 1.000000;
/*47*/	  r0.w = max(r0.w, 0.000000);
/*48*/	  r4.z = sqrt(r0.w);
/*49*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*50*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*51*/	  r0.w = r3.x * r7.w;
/*52*/	  r3.x = r0.w * -0.500000 + r3.x;
/*53*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*54*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*55*/	  r0.w = -r5.w * r6.w + 1.000000;
/*56*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*57*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*58*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*59*/	}
/*60*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*62*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*63*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*65*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*66*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*67*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*68*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*69*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*70*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*71*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*74*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*75*/	r1.w = inversesqrt(r1.w);
/*76*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*77*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*78*/	r1.w = inversesqrt(r1.w);
/*79*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*80*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*81*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*82*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*83*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*86*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*87*/	r4.w = 1.000000;
/*88*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*89*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*90*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*91*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*92*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*93*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*94*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*95*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*96*/	r3.x = intBitsToFloat(int(r2.w));
/*97*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*98*/	if(floatBitsToUint(r3.z) != 0u) {
/*99*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*100*/	  r5.w = vsOut_T0.w;
/*101*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*102*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*103*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*104*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*105*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*106*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*107*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*108*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*109*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*110*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*111*/	  if(floatBitsToUint(r3.w) == 0u) {
/*112*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*113*/	    r7.xy = floor((r6.xyxx).xy);
/*114*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*115*/	    r3.z = -0.000400 / r3.z;
/*116*/	    r3.z = r3.z + r6.z;
/*117*/	    r8.z = -r8.y + 1.000000;
/*118*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*119*/	    r8.w = -r8.y;
/*120*/	    r10.x = cb1.data[0].z/**/;
/*121*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*122*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*123*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*124*/	    r10.w = -cb1.data[0].w/**/;
/*125*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*126*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*127*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*128*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*129*/	    r8.x = r9.x;
/*130*/	    r8.y = r11.x;
/*131*/	    r8.z = r10.x;
/*132*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*133*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*134*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*135*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*136*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*137*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*138*/	    r3.z = -r6.x + r6.y;
/*139*/	    r3.z = r3.w * r3.z + r6.x;
/*140*/	  } else {
/*141*/	    r3.z = 1.000000;
/*142*/	  }
/*143*/	} else {
/*144*/	  r3.z = 1.000000;
/*145*/	}
/*146*/	r3.w = cb1.data[34].w + -1.000000;
/*147*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*148*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*149*/	if(floatBitsToUint(r2.w) == 0u) {
/*150*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*151*/	  r2.w = floatBitsToInt(r2.w);
/*152*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*153*/	  if(floatBitsToUint(r2.w) != 0u) {
/*154*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*155*/	    r5.w = vsOut_T0.w;
/*156*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*157*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*158*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*159*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*160*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*161*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*162*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*163*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*164*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*165*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*166*/	    if(floatBitsToUint(r5.w) == 0u) {
/*167*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*168*/	      r6.xy = floor((r5.xyxx).xy);
/*169*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*170*/	      r2.w = -0.000400 / r2.w;
/*171*/	      r2.w = r2.w + r5.z;
/*172*/	      r7.z = -r7.y + 1.000000;
/*173*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*174*/	      r7.w = -r7.y;
/*175*/	      r9.x = cb1.data[0].z/**/;
/*176*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*177*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*178*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*179*/	      r9.w = -cb1.data[0].w/**/;
/*180*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*181*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*182*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*183*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*184*/	      r7.x = r8.x;
/*185*/	      r7.y = r10.x;
/*186*/	      r7.z = r9.x;
/*187*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*188*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*189*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*190*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*191*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*192*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*193*/	      r2.w = -r5.x + r5.z;
/*194*/	      r2.w = r5.y * r2.w + r5.x;
/*195*/	    } else {
/*196*/	      r2.w = 1.000000;
/*197*/	    }
/*198*/	  } else {
/*199*/	    r2.w = 1.000000;
/*200*/	  }
/*201*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*202*/	  r5.y = r5.x * cb1.data[34].x;
/*203*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*204*/	  r5.x = r1.w + -r5.x;
/*205*/	  r5.x = saturate(r5.x / r5.y);
/*206*/	  r2.w = -r3.z + r2.w;
/*207*/	  r3.z = r5.x * r2.w + r3.z;
/*208*/	}
/*209*/	if(floatBitsToUint(r3.w) != 0u) {
/*210*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*211*/	  r3.w = r2.w * cb1.data[34].y;
/*212*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*213*/	  r2.w = r1.w + -r2.w;
/*214*/	  r2.w = saturate(r2.w / r3.w);
/*215*/	  r3.x = -r3.z + 1.000000;
/*216*/	  r3.z = r2.w * r3.x + r3.z;
/*217*/	}
/*218*/	r3.z = saturate(r3.z);
/*219*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*220*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*221*/	r2.w = inversesqrt(r2.w);
/*222*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*223*/	r2.w = -r3.y + 1.000000;
/*224*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*225*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*226*/	r3.w = r3.w + r3.w;
/*227*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*228*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*229*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*230*/	r3.w = cos((r8.x));
/*231*/	r3.w = inversesqrt(r3.w);
/*232*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*233*/	r5.w = saturate(r0.w * 60.000000);
/*234*/	r5.w = -r0.w + r5.w;
/*235*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*236*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*237*/	r6.w = inversesqrt(r6.w);
/*238*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*239*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*240*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*241*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*242*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*243*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*244*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*245*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*246*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*247*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*248*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*249*/	r6.w = -r0.w + 1.000000;
/*250*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*251*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*252*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*253*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*254*/	  r6.w = max(r6.w, 0.000000);
/*255*/	  r6.w = log2(r6.w);
/*256*/	  r6.w = r6.w * 10.000000;
/*257*/	  r6.w = exp2(r6.w);
/*258*/	  r6.w = r3.w * r6.w;
/*259*/	  r6.w = r6.w * r5.w + r0.w;
/*260*/	  r7.y = r2.w * 8.000000;
/*261*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*262*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*263*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*264*/	}
/*265*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*266*/	r7.y = max(r6.w, 0.000000);
/*267*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*268*/	if(floatBitsToUint(r6.w) != 0u) {
/*269*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*270*/	  r6.x = max(r6.x, -1.000000);
/*271*/	  r6.x = min(r6.x, 1.000000);
/*272*/	  r6.y = -abs(r6.x) + 1.000000;
/*273*/	  r6.y = sqrt(r6.y);
/*274*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*275*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*276*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*277*/	  r6.w = r6.y * r6.z;
/*278*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*279*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*280*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*281*/	  r6.x = r6.z * r6.y + r6.x;
/*282*/	  r3.y = r3.y * r3.y;
/*283*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*284*/	  r3.x = r3.y * r3.x + r7.x;
/*285*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*286*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*287*/	  r3.y = -r3.x * r3.x + 1.000000;
/*288*/	  r3.y = max(r3.y, 0.001000);
/*289*/	  r3.y = log2(r3.y);
/*290*/	  r6.y = r3.y * 4.950617;
/*291*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*292*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*293*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*294*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*295*/	  r3.x = floatBitsToInt(r3.x);
/*296*/	  r6.y = r3.y * r3.y + -r6.y;
/*297*/	  r6.y = sqrt(r6.y);
/*298*/	  r3.y = -r3.y + r6.y;
/*299*/	  r3.y = max(r3.y, 0.000000);
/*300*/	  r3.y = sqrt(r3.y);
/*301*/	  r3.x = r3.y * r3.x;
/*302*/	  r3.x = r3.x * 1.414214;
/*303*/	  r3.x = 0.008727 / r3.x;
/*304*/	  r3.x = max(r3.x, 0.000100);
/*305*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*306*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*307*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*308*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*309*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*310*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*311*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*312*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*313*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*314*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*315*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*316*/	  r3.x = floatBitsToInt(r3.x);
/*317*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*318*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*319*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*320*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*321*/	  r3.x = r3.x * r6.x + 1.000000;
/*322*/	  r3.x = r3.x * 0.500000;
/*323*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*324*/	  r3.y = r3.y * r6.y + 1.000000;
/*325*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*326*/	  r3.y = min(r7.y, 1.000000);
/*327*/	  r2.w = r2.w * 1.570796;
/*328*/	  r2.w = sin(r2.w);
/*329*/	  r3.y = r3.y + -1.000000;
/*330*/	  r2.w = r2.w * r3.y + 1.000000;
/*331*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*332*/	  r3.y = max(r3.y, 0.000000);
/*333*/	  r3.y = log2(r3.y);
/*334*/	  r3.y = r3.y * 10.000000;
/*335*/	  r3.y = exp2(r3.y);
/*336*/	  r3.y = r3.w * r3.y;
/*337*/	  r3.y = r3.y * r5.w + r0.w;
/*338*/	  r2.w = r2.w * abs(r3.x);
/*339*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*340*/	} else {
/*341*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*342*/	}
/*343*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*344*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*345*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*346*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*347*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*348*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*349*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*350*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*351*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*352*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*353*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*354*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*355*/	r2.w = inversesqrt(r2.w);
/*356*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*357*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*358*/	r2.w = r2.w + r2.w;
/*359*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*360*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*361*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*362*/	r2.x = max(r2.x, 0.000000);
/*363*/	r2.x = log2(r2.x);
/*364*/	r2.x = r2.x * 10.000000;
/*365*/	r2.x = exp2(r2.x);
/*366*/	r2.x = r3.w * r2.x;
/*367*/	r0.w = r2.x * r5.w + r0.w;
/*368*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*369*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*370*/	color0.w = 2.000000;
/*371*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*372*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*373*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*374*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*375*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*376*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*377*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*378*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*379*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*380*/	if(r0.x != 0) discard;
/*381*/	color1.x = 1.000000;
/*382*/	return;
}
