//
//
// Shader Model 4
// Fragment Shader
//
// id: 6666 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithblood.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;

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
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*6*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*7*/	r0.w = saturate(vsOut_P1.w);
/*8*/	r3.xyz = (r3.xyzx + -cb4.data[0].xyzx).xyz;
/*9*/	r3.xyz = (r0.wwww * r3.xyzx + cb4.data[0].xyzx).xyz;
/*10*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*11*/	r2.xyw = (r2.xyxw + -cb4.data[1].xyxz).xyw;
/*12*/	r2.xyw = (r0.wwww * r2.xyxw + cb4.data[1].xyxz).xyw;
/*13*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*14*/	r4.xyz = (r4.xyzx + -cb4.data[2].xyzx).xyz;
/*15*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[2].xyzx).xyz;
/*16*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*19*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*21*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*22*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*23*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*26*/	r0.w = -r0.w + 1.000000;
/*27*/	r0.w = max(r0.w, 0.000000);
/*28*/	r0.w = sqrt(r0.w);
/*29*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*30*/	if(r1.z != 0) discard;
/*31*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*32*/	r1.zw = (r1.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*33*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*34*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*35*/	r1.z = saturate(-r1.z + r2.w);
/*36*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r1.z) != 0u) {
/*38*/	  r1.z = -r2.w + 1.000000;
/*39*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*40*/	  r1.z = -r1.z + 1.000000;
/*41*/	  r1.z = -r1.z * r1.z + 1.000000;
/*42*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*43*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*44*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*47*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*48*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*49*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*50*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*51*/	} else {
/*52*/	  r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*53*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	}
/*55*/	r1.z = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r4.xyz = (-r0.xyzx + r1.zzzz).xyz;
/*57*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*58*/	r1.z = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r4.xyz = (-r2.xyzx + r1.zzzz).xyz;
/*60*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*61*/	r1.z = vsOut_T7.y * -r3.y + r3.y;
/*62*/	r1.z = vsOut_T7.x * -r1.z + r1.z;
/*63*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*64*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*66*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*69*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*70*/	r1.w = inversesqrt(r1.w);
/*71*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*72*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	r1.w = inversesqrt(r1.w);
/*74*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*75*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*76*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*77*/	r1.xyw = (r0.wwww * r5.xyxz + r1.xyxw).xyw;
/*78*/	r0.w = dot(vec3(r1.xywx), vec3(r1.xywx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r1.xyw = (r0.wwww * r1.xyxw).xyw;
/*81*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*82*/	r4.w = 1.000000;
/*83*/	r0.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*84*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*85*/	r6.x = uintBitsToFloat((r0.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r6.y = uintBitsToFloat((r0.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*87*/	r6.z = uintBitsToFloat((r0.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*88*/	r6.w = uintBitsToFloat((r0.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*90*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*91*/	r3.y = intBitsToFloat(int(r2.w));
/*92*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*93*/	if(floatBitsToUint(r3.z) != 0u) {
/*94*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*95*/	  r5.w = vsOut_T0.w;
/*96*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*97*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*98*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*99*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*100*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*101*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*102*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*103*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*104*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*105*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*106*/	  if(floatBitsToUint(r3.w) == 0u) {
/*107*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*108*/	    r7.xy = floor((r6.xyxx).xy);
/*109*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*110*/	    r3.z = -0.000400 / r3.z;
/*111*/	    r3.z = r3.z + r6.z;
/*112*/	    r8.z = -r8.y + 1.000000;
/*113*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*114*/	    r8.w = -r8.y;
/*115*/	    r10.x = cb1.data[0].z/**/;
/*116*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*117*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*118*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*119*/	    r10.w = -cb1.data[0].w/**/;
/*120*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*121*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*122*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*123*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*124*/	    r8.x = r9.x;
/*125*/	    r8.y = r11.x;
/*126*/	    r8.z = r10.x;
/*127*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*128*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*129*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*130*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*131*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*132*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*133*/	    r3.z = -r6.x + r6.y;
/*134*/	    r3.z = r3.w * r3.z + r6.x;
/*135*/	  } else {
/*136*/	    r3.z = 1.000000;
/*137*/	  }
/*138*/	} else {
/*139*/	  r3.z = 1.000000;
/*140*/	}
/*141*/	r3.w = cb1.data[34].w + -1.000000;
/*142*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*143*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*144*/	if(floatBitsToUint(r2.w) == 0u) {
/*145*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*146*/	  r2.w = floatBitsToInt(r2.w);
/*147*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*148*/	  if(floatBitsToUint(r2.w) != 0u) {
/*149*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*150*/	    r5.w = vsOut_T0.w;
/*151*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*152*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*153*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*154*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*155*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*156*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*157*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*158*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*159*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*160*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*161*/	    if(floatBitsToUint(r5.w) == 0u) {
/*162*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*163*/	      r6.xy = floor((r5.xyxx).xy);
/*164*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*165*/	      r2.w = -0.000400 / r2.w;
/*166*/	      r2.w = r2.w + r5.z;
/*167*/	      r7.z = -r7.y + 1.000000;
/*168*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*169*/	      r7.w = -r7.y;
/*170*/	      r9.x = cb1.data[0].z/**/;
/*171*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*172*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*173*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*174*/	      r9.w = -cb1.data[0].w/**/;
/*175*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*176*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*177*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*178*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*179*/	      r7.x = r8.x;
/*180*/	      r7.y = r10.x;
/*181*/	      r7.z = r9.x;
/*182*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*183*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*184*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*185*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*186*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*187*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*188*/	      r2.w = -r5.x + r5.z;
/*189*/	      r2.w = r5.y * r2.w + r5.x;
/*190*/	    } else {
/*191*/	      r2.w = 1.000000;
/*192*/	    }
/*193*/	  } else {
/*194*/	    r2.w = 1.000000;
/*195*/	  }
/*196*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*197*/	  r5.y = r5.x * cb1.data[34].x;
/*198*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*199*/	  r5.x = r0.w + -r5.x;
/*200*/	  r5.x = saturate(r5.x / r5.y);
/*201*/	  r2.w = -r3.z + r2.w;
/*202*/	  r3.z = r5.x * r2.w + r3.z;
/*203*/	}
/*204*/	if(floatBitsToUint(r3.w) != 0u) {
/*205*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*206*/	  r3.w = r2.w * cb1.data[34].y;
/*207*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*208*/	  r2.w = r0.w + -r2.w;
/*209*/	  r2.w = saturate(r2.w / r3.w);
/*210*/	  r3.y = -r3.z + 1.000000;
/*211*/	  r3.z = r2.w * r3.y + r3.z;
/*212*/	}
/*213*/	r3.z = saturate(r3.z);
/*214*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*215*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*216*/	r2.w = inversesqrt(r2.w);
/*217*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*218*/	r2.w = -r3.x + 1.000000;
/*219*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*220*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xywx));
/*221*/	r3.w = r3.w + r3.w;
/*222*/	r6.xyz = (r1.xywx * -r3.wwww + r5.xyzx).xyz;
/*223*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*224*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*225*/	r3.w = cos((r8.x));
/*226*/	r3.w = inversesqrt(r3.w);
/*227*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*228*/	r5.w = saturate(r1.z * 60.000000);
/*229*/	r5.w = -r1.z + r5.w;
/*230*/	r8.xzw = (r1.xxyw * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*231*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*232*/	r6.w = inversesqrt(r6.w);
/*233*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*234*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*235*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*236*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*237*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*238*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*239*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*240*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*241*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*242*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*243*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*244*/	r6.w = -r1.z + 1.000000;
/*245*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*246*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*247*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*248*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*249*/	  r6.w = max(r6.w, 0.000000);
/*250*/	  r6.w = log2(r6.w);
/*251*/	  r6.w = r6.w * 10.000000;
/*252*/	  r6.w = exp2(r6.w);
/*253*/	  r6.w = r3.w * r6.w;
/*254*/	  r6.w = r6.w * r5.w + r1.z;
/*255*/	  r7.y = r2.w * 8.000000;
/*256*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*257*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*258*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*259*/	}
/*260*/	r6.w = dot(vec3(r1.xywx), vec3(-cb2.data[0].yzwy));
/*261*/	r7.y = max(r6.w, 0.000000);
/*262*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*263*/	if(floatBitsToUint(r6.w) != 0u) {
/*264*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*265*/	  r6.x = max(r6.x, -1.000000);
/*266*/	  r6.x = min(r6.x, 1.000000);
/*267*/	  r6.y = -abs(r6.x) + 1.000000;
/*268*/	  r6.y = sqrt(r6.y);
/*269*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*270*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*271*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*272*/	  r6.w = r6.y * r6.z;
/*273*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*274*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*275*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*276*/	  r6.x = r6.z * r6.y + r6.x;
/*277*/	  r3.x = r3.x * r3.x;
/*278*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*279*/	  r3.x = r3.x * r3.y + r7.x;
/*280*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*281*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*282*/	  r3.y = -r3.x * r3.x + 1.000000;
/*283*/	  r3.y = max(r3.y, 0.001000);
/*284*/	  r3.y = log2(r3.y);
/*285*/	  r6.y = r3.y * 4.950617;
/*286*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*287*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*288*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*289*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*290*/	  r3.x = floatBitsToInt(r3.x);
/*291*/	  r6.y = r3.y * r3.y + -r6.y;
/*292*/	  r6.y = sqrt(r6.y);
/*293*/	  r3.y = -r3.y + r6.y;
/*294*/	  r3.y = max(r3.y, 0.000000);
/*295*/	  r3.y = sqrt(r3.y);
/*296*/	  r3.x = r3.y * r3.x;
/*297*/	  r3.x = r3.x * 1.414214;
/*298*/	  r3.x = 0.008727 / r3.x;
/*299*/	  r3.x = max(r3.x, 0.000100);
/*300*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*301*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*302*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*303*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*304*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*305*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*306*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*307*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*308*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*309*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*310*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*311*/	  r3.x = floatBitsToInt(r3.x);
/*312*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*313*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*314*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*315*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*316*/	  r3.x = r3.x * r6.x + 1.000000;
/*317*/	  r3.x = r3.x * 0.500000;
/*318*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*319*/	  r3.y = r3.y * r6.y + 1.000000;
/*320*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*321*/	  r3.y = min(r7.y, 1.000000);
/*322*/	  r2.w = r2.w * 1.570796;
/*323*/	  r2.w = sin(r2.w);
/*324*/	  r3.y = r3.y + -1.000000;
/*325*/	  r2.w = r2.w * r3.y + 1.000000;
/*326*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*327*/	  r3.y = max(r3.y, 0.000000);
/*328*/	  r3.y = log2(r3.y);
/*329*/	  r3.y = r3.y * 10.000000;
/*330*/	  r3.y = exp2(r3.y);
/*331*/	  r3.y = r3.w * r3.y;
/*332*/	  r3.y = r3.y * r5.w + r1.z;
/*333*/	  r2.w = r2.w * abs(r3.x);
/*334*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*335*/	} else {
/*336*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*337*/	}
/*338*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*339*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*340*/	r5.xyz = (max(r1.zzzz, r5.xyzx)).xyz;
/*341*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*342*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*343*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*344*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*345*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*346*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*347*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*348*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*349*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*350*/	r2.w = inversesqrt(r2.w);
/*351*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*352*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xywx));
/*353*/	r2.w = r2.w + r2.w;
/*354*/	r1.xyw = (r1.xyxw * -r2.wwww + -r3.xyxz).xyw;
/*355*/	r6.xyzw = (textureLod(s_environment, r1.xywx.stp, r8.y)).xyzw;
/*356*/	r1.x = dot(vec3(r1.xywx), vec3(-r3.xyzx));
/*357*/	r1.x = max(r1.x, 0.000000);
/*358*/	r1.x = log2(r1.x);
/*359*/	r1.x = r1.x * 10.000000;
/*360*/	r1.x = exp2(r1.x);
/*361*/	r1.x = r3.w * r1.x;
/*362*/	r1.x = r1.x * r5.w + r1.z;
/*363*/	r1.xyz = (r6.xyzx * r1.xxxx).xyz;
/*364*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*365*/	color0.w = 2.000000;
/*366*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*367*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*368*/	r0.xy = (r0.xyxx / r0.wwww).xy;
/*369*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*370*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*371*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*372*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*373*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*374*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*375*/	if(r0.x != 0) discard;
/*376*/	color1.x = 1.000000;
/*377*/	return;
}
