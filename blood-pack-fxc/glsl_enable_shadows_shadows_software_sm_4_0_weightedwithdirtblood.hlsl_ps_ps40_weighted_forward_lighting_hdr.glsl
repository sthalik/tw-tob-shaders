//
//
// Shader Model 4
// Fragment Shader
//
// id: 6804 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*28*/	r2.z = sqrt(r0.w);
/*29*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*31*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*32*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*33*/	r0.w = r3.w * r4.w;
/*34*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*35*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*36*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*37*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*38*/	r1.x = inversesqrt(r1.x);
/*39*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*40*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*41*/	if(r1.w != 0) discard;
/*42*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*43*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*44*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*45*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*46*/	r1.w = saturate(-r1.w + r2.w);
/*47*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r1.w) != 0u) {
/*49*/	  r1.w = -r2.w + 1.000000;
/*50*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*51*/	  r1.w = -r1.w + 1.000000;
/*52*/	  r1.w = -r1.w * r1.w + 1.000000;
/*53*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*54*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*55*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*56*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*57*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*58*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*59*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*60*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*61*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*62*/	} else {
/*63*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*64*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*65*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*66*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*67*/	}
/*68*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*70*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*71*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*72*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*73*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*74*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*75*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*76*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*77*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*78*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*79*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r1.w = inversesqrt(r1.w);
/*81*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*82*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*83*/	r1.w = inversesqrt(r1.w);
/*84*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*85*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r1.w = inversesqrt(r1.w);
/*87*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*88*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*89*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*90*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*91*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*94*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*95*/	r4.w = 1.000000;
/*96*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*97*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*98*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*99*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*100*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*101*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*102*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*103*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*104*/	r3.y = intBitsToFloat(int(r2.w));
/*105*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r3.z) != 0u) {
/*107*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*108*/	  r5.w = vsOut_T0.w;
/*109*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*110*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*111*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*112*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*113*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*114*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*115*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*116*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*117*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*118*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*119*/	  if(floatBitsToUint(r3.w) == 0u) {
/*120*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*121*/	    r7.xy = floor((r6.xyxx).xy);
/*122*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*123*/	    r3.z = -0.000400 / r3.z;
/*124*/	    r3.z = r3.z + r6.z;
/*125*/	    r8.z = -r8.y + 1.000000;
/*126*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*127*/	    r8.w = -r8.y;
/*128*/	    r10.x = cb1.data[0].z/**/;
/*129*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*130*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*131*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*132*/	    r10.w = -cb1.data[0].w/**/;
/*133*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*134*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*135*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*136*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*137*/	    r8.x = r9.x;
/*138*/	    r8.y = r11.x;
/*139*/	    r8.z = r10.x;
/*140*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*141*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*142*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*143*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*144*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*145*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*146*/	    r3.z = -r6.x + r6.y;
/*147*/	    r3.z = r3.w * r3.z + r6.x;
/*148*/	  } else {
/*149*/	    r3.z = 1.000000;
/*150*/	  }
/*151*/	} else {
/*152*/	  r3.z = 1.000000;
/*153*/	}
/*154*/	r3.w = cb1.data[34].w + -1.000000;
/*155*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*156*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*157*/	if(floatBitsToUint(r2.w) == 0u) {
/*158*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*159*/	  r2.w = floatBitsToInt(r2.w);
/*160*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*161*/	  if(floatBitsToUint(r2.w) != 0u) {
/*162*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*163*/	    r5.w = vsOut_T0.w;
/*164*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*165*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*166*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*167*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*168*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*169*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*170*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*171*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*172*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*173*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*174*/	    if(floatBitsToUint(r5.w) == 0u) {
/*175*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*176*/	      r6.xy = floor((r5.xyxx).xy);
/*177*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*178*/	      r2.w = -0.000400 / r2.w;
/*179*/	      r2.w = r2.w + r5.z;
/*180*/	      r7.z = -r7.y + 1.000000;
/*181*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*182*/	      r7.w = -r7.y;
/*183*/	      r9.x = cb1.data[0].z/**/;
/*184*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*185*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*186*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*187*/	      r9.w = -cb1.data[0].w/**/;
/*188*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*189*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*190*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*191*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*192*/	      r7.x = r8.x;
/*193*/	      r7.y = r10.x;
/*194*/	      r7.z = r9.x;
/*195*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*196*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*197*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*198*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*199*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*200*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*201*/	      r2.w = -r5.x + r5.z;
/*202*/	      r2.w = r5.y * r2.w + r5.x;
/*203*/	    } else {
/*204*/	      r2.w = 1.000000;
/*205*/	    }
/*206*/	  } else {
/*207*/	    r2.w = 1.000000;
/*208*/	  }
/*209*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*210*/	  r5.y = r5.x * cb1.data[34].x;
/*211*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*212*/	  r5.x = r1.w + -r5.x;
/*213*/	  r5.x = saturate(r5.x / r5.y);
/*214*/	  r2.w = -r3.z + r2.w;
/*215*/	  r3.z = r5.x * r2.w + r3.z;
/*216*/	}
/*217*/	if(floatBitsToUint(r3.w) != 0u) {
/*218*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*219*/	  r3.w = r2.w * cb1.data[34].y;
/*220*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*221*/	  r2.w = r1.w + -r2.w;
/*222*/	  r2.w = saturate(r2.w / r3.w);
/*223*/	  r3.y = -r3.z + 1.000000;
/*224*/	  r3.z = r2.w * r3.y + r3.z;
/*225*/	}
/*226*/	r3.z = saturate(r3.z);
/*227*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*228*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*229*/	r2.w = inversesqrt(r2.w);
/*230*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*231*/	r2.w = -r3.x + 1.000000;
/*232*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*233*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*234*/	r3.w = r3.w + r3.w;
/*235*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*236*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*237*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*238*/	r3.w = cos((r8.x));
/*239*/	r3.w = inversesqrt(r3.w);
/*240*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*241*/	r5.w = saturate(r0.w * 60.000000);
/*242*/	r5.w = -r0.w + r5.w;
/*243*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*244*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*245*/	r6.w = inversesqrt(r6.w);
/*246*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*247*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*248*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*249*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*250*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*251*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*252*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*253*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*254*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*255*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*256*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*257*/	r6.w = -r0.w + 1.000000;
/*258*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*259*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*260*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*261*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*262*/	  r6.w = max(r6.w, 0.000000);
/*263*/	  r6.w = log2(r6.w);
/*264*/	  r6.w = r6.w * 10.000000;
/*265*/	  r6.w = exp2(r6.w);
/*266*/	  r6.w = r3.w * r6.w;
/*267*/	  r6.w = r6.w * r5.w + r0.w;
/*268*/	  r7.y = r2.w * 8.000000;
/*269*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*270*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*271*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*272*/	}
/*273*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*274*/	r7.y = max(r6.w, 0.000000);
/*275*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*276*/	if(floatBitsToUint(r6.w) != 0u) {
/*277*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*278*/	  r6.x = max(r6.x, -1.000000);
/*279*/	  r6.x = min(r6.x, 1.000000);
/*280*/	  r6.y = -abs(r6.x) + 1.000000;
/*281*/	  r6.y = sqrt(r6.y);
/*282*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*283*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*284*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*285*/	  r6.w = r6.y * r6.z;
/*286*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*287*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*288*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*289*/	  r6.x = r6.z * r6.y + r6.x;
/*290*/	  r3.x = r3.x * r3.x;
/*291*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*292*/	  r3.x = r3.x * r3.y + r7.x;
/*293*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*294*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*295*/	  r3.y = -r3.x * r3.x + 1.000000;
/*296*/	  r3.y = max(r3.y, 0.001000);
/*297*/	  r3.y = log2(r3.y);
/*298*/	  r6.y = r3.y * 4.950617;
/*299*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*300*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*301*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*302*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*303*/	  r3.x = floatBitsToInt(r3.x);
/*304*/	  r6.y = r3.y * r3.y + -r6.y;
/*305*/	  r6.y = sqrt(r6.y);
/*306*/	  r3.y = -r3.y + r6.y;
/*307*/	  r3.y = max(r3.y, 0.000000);
/*308*/	  r3.y = sqrt(r3.y);
/*309*/	  r3.x = r3.y * r3.x;
/*310*/	  r3.x = r3.x * 1.414214;
/*311*/	  r3.x = 0.008727 / r3.x;
/*312*/	  r3.x = max(r3.x, 0.000100);
/*313*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*314*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*315*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*316*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*317*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*318*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*319*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*320*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*321*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*322*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*323*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*324*/	  r3.x = floatBitsToInt(r3.x);
/*325*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*326*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*327*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*328*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*329*/	  r3.x = r3.x * r6.x + 1.000000;
/*330*/	  r3.x = r3.x * 0.500000;
/*331*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*332*/	  r3.y = r3.y * r6.y + 1.000000;
/*333*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*334*/	  r3.y = min(r7.y, 1.000000);
/*335*/	  r2.w = r2.w * 1.570796;
/*336*/	  r2.w = sin(r2.w);
/*337*/	  r3.y = r3.y + -1.000000;
/*338*/	  r2.w = r2.w * r3.y + 1.000000;
/*339*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*340*/	  r3.y = max(r3.y, 0.000000);
/*341*/	  r3.y = log2(r3.y);
/*342*/	  r3.y = r3.y * 10.000000;
/*343*/	  r3.y = exp2(r3.y);
/*344*/	  r3.y = r3.w * r3.y;
/*345*/	  r3.y = r3.y * r5.w + r0.w;
/*346*/	  r2.w = r2.w * abs(r3.x);
/*347*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*348*/	} else {
/*349*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*350*/	}
/*351*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*352*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*353*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*354*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*355*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*356*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*357*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*358*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*359*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*360*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*361*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*362*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*363*/	r2.w = inversesqrt(r2.w);
/*364*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*365*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*366*/	r2.w = r2.w + r2.w;
/*367*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*368*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*369*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*370*/	r1.x = max(r1.x, 0.000000);
/*371*/	r1.x = log2(r1.x);
/*372*/	r1.x = r1.x * 10.000000;
/*373*/	r1.x = exp2(r1.x);
/*374*/	r1.x = r3.w * r1.x;
/*375*/	r0.w = r1.x * r5.w + r0.w;
/*376*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*377*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*378*/	color0.w = 2.000000;
/*379*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*380*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*381*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*382*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*383*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*384*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*385*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*386*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*387*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*388*/	if(r0.x != 0) discard;
/*389*/	color1.x = 1.000000;
/*390*/	return;
}
