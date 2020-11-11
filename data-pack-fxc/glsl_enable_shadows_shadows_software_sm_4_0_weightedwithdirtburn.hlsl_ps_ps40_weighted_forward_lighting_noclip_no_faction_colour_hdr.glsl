//
//
// Shader Model 4
// Fragment Shader
//
// id: 6863 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r3.z = sqrt(r0.w);
/*9*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r5.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r2.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*12*/	r6.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*13*/	r2.zw = (r6.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*14*/	r0.w = r5.w * r6.w;
/*15*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*16*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*17*/	r3.xy = (r2.zwzz * r5.wwww + r2.xyxx).xy;
/*18*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*19*/	r1.w = inversesqrt(r1.w);
/*20*/	r2.xyz = (r1.wwww * r3.xyzx).xyz;
/*21*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*22*/	r1.xyz = (r3.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*23*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*24*/	r5.x = r3.x;
/*25*/	r5.y = cb0.data[26].x * 0.050000 + r3.y;
/*26*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*27*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*28*/	r0.w = saturate(r5.x * 5.000000);
/*29*/	r5.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*30*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*31*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*32*/	r1.w = log2(r3.z);
/*33*/	r1.w = r1.w * 1.800000;
/*34*/	r1.w = exp2(r1.w);
/*35*/	r1.w = r1.w * 10.000000;
/*36*/	r1.w = min(r1.w, 1.000000);
/*37*/	r0.w = r0.w + r1.w;
/*38*/	r0.w = r0.w * 0.500000;
/*39*/	r1.w = -r3.w + 1.000000;
/*40*/	r1.w = log2(r1.w);
/*41*/	r1.w = r1.w * vsOut_T7.z;
/*42*/	r1.w = exp2(r1.w);
/*43*/	r1.w = min(r1.w, 1.000000);
/*44*/	r1.w = r1.w * vsOut_T7.z;
/*45*/	r2.w = r3.z * 0.250000;
/*46*/	r3.xyw = (r5.xyxz * vec4(2.000000, 2.000000, 0.000000, 2.000000) + -r2.wwww).xyw;
/*47*/	r3.xyw = (r0.wwww * r3.xyxw + r2.wwww).xyw;
/*48*/	r3.xyw = (-r0.xyxz + r3.xyxw).xyw;
/*49*/	r0.xyz = (r1.wwww * r3.xywx + r0.xyzx).xyz;
/*50*/	r0.w = vsOut_T7.z + -0.025000;
/*51*/	r0.w = max(r0.w, 0.000000);
/*52*/	r3.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*53*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*55*/	r3.xyz = (-r0.xyzx + r0.wwww).xyz;
/*56*/	r0.xyz = (vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*57*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r3.xyz = (-r1.xyzx + r0.wwww).xyz;
/*59*/	r1.xyz = (vsOut_T7.yyyy * r3.xyzx + r1.xyzx).xyz;
/*60*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*61*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*62*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*63*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*64*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xyzx + r0.xyzx).xyz;
/*65*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r3.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*68*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r4.yzw = (r1.wwww * vsOut_T5.xxyz).yzw;
/*71*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*72*/	r1.w = inversesqrt(r1.w);
/*73*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*74*/	r4.yzw = (r2.yyyy * r4.yyzw).yzw;
/*75*/	r2.xyw = (r2.xxxx * r3.xyxz + r4.yzyw).xyw;
/*76*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*77*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*78*/	r1.w = inversesqrt(r1.w);
/*79*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*80*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*81*/	r3.w = 1.000000;
/*82*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*83*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*84*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*85*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*87*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*88*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*89*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*90*/	r4.y = intBitsToFloat(int(r2.w));
/*91*/	r4.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*92*/	if(floatBitsToUint(r4.z) != 0u) {
/*93*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*94*/	  r5.w = vsOut_T0.w;
/*95*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*96*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*97*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*98*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*99*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*100*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*101*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*102*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*103*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*104*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*105*/	  if(floatBitsToUint(r4.w) == 0u) {
/*106*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*107*/	    r7.xy = floor((r6.xyxx).xy);
/*108*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*109*/	    r4.z = -0.000400 / r4.z;
/*110*/	    r4.z = r4.z + r6.z;
/*111*/	    r8.z = -r8.y + 1.000000;
/*112*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*113*/	    r8.w = -r8.y;
/*114*/	    r10.x = cb1.data[0].z/**/;
/*115*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*116*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*117*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*118*/	    r10.w = -cb1.data[0].w/**/;
/*119*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*120*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*121*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*122*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*123*/	    r8.x = r9.x;
/*124*/	    r8.y = r11.x;
/*125*/	    r8.z = r10.x;
/*126*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*127*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*128*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*129*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*130*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*131*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*132*/	    r4.z = -r6.x + r6.y;
/*133*/	    r4.z = r4.w * r4.z + r6.x;
/*134*/	  } else {
/*135*/	    r4.z = 1.000000;
/*136*/	  }
/*137*/	} else {
/*138*/	  r4.z = 1.000000;
/*139*/	}
/*140*/	r4.w = cb1.data[34].w + -1.000000;
/*141*/	r2.w = uintBitsToFloat((r2.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*142*/	r4.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*143*/	if(floatBitsToUint(r2.w) == 0u) {
/*144*/	  r2.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*145*/	  r2.w = floatBitsToInt(r2.w);
/*146*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*147*/	  if(floatBitsToUint(r2.w) != 0u) {
/*148*/	    r2.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*149*/	    r5.w = vsOut_T0.w;
/*150*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*151*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*152*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*153*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*154*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*155*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*156*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*157*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*158*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*159*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*160*/	    if(floatBitsToUint(r5.w) == 0u) {
/*161*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*162*/	      r6.xy = floor((r5.xyxx).xy);
/*163*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*164*/	      r2.w = -0.000400 / r2.w;
/*165*/	      r2.w = r2.w + r5.z;
/*166*/	      r7.z = -r7.y + 1.000000;
/*167*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*168*/	      r7.w = -r7.y;
/*169*/	      r9.x = cb1.data[0].z/**/;
/*170*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*171*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*172*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*173*/	      r9.w = -cb1.data[0].w/**/;
/*174*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*175*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*176*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*177*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*178*/	      r7.x = r8.x;
/*179*/	      r7.y = r10.x;
/*180*/	      r7.z = r9.x;
/*181*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*182*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*183*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*184*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*185*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*186*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*187*/	      r2.w = -r5.x + r5.z;
/*188*/	      r2.w = r5.y * r2.w + r5.x;
/*189*/	    } else {
/*190*/	      r2.w = 1.000000;
/*191*/	    }
/*192*/	  } else {
/*193*/	    r2.w = 1.000000;
/*194*/	  }
/*195*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*196*/	  r5.y = r5.x * cb1.data[34].x;
/*197*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*198*/	  r5.x = r1.w + -r5.x;
/*199*/	  r5.x = saturate(r5.x / r5.y);
/*200*/	  r2.w = -r4.z + r2.w;
/*201*/	  r4.z = r5.x * r2.w + r4.z;
/*202*/	}
/*203*/	if(floatBitsToUint(r4.w) != 0u) {
/*204*/	  r2.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*205*/	  r4.w = r2.w * cb1.data[34].y;
/*206*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*207*/	  r2.w = r1.w + -r2.w;
/*208*/	  r2.w = saturate(r2.w / r4.w);
/*209*/	  r4.y = -r4.z + 1.000000;
/*210*/	  r4.z = r2.w * r4.y + r4.z;
/*211*/	}
/*212*/	r4.z = saturate(r4.z);
/*213*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*214*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*215*/	r2.w = inversesqrt(r2.w);
/*216*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*217*/	r2.w = -r4.x + 1.000000;
/*218*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*219*/	r4.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*220*/	r4.w = r4.w + r4.w;
/*221*/	r6.xyz = (r2.xyzx * -r4.wwww + r5.xyzx).xyz;
/*222*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*223*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*224*/	r4.w = cos((r8.x));
/*225*/	r4.w = inversesqrt(r4.w);
/*226*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*227*/	r5.w = saturate(r0.w * 60.000000);
/*228*/	r5.w = -r0.w + r5.w;
/*229*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*230*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*231*/	r6.w = inversesqrt(r6.w);
/*232*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*233*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*234*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*235*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*236*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*237*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*238*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*239*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*240*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*241*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*242*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*243*/	r6.w = -r0.w + 1.000000;
/*244*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*245*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*246*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*247*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*248*/	  r6.w = max(r6.w, 0.000000);
/*249*/	  r6.w = log2(r6.w);
/*250*/	  r6.w = r6.w * 10.000000;
/*251*/	  r6.w = exp2(r6.w);
/*252*/	  r6.w = r4.w * r6.w;
/*253*/	  r6.w = r6.w * r5.w + r0.w;
/*254*/	  r7.y = r2.w * 8.000000;
/*255*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*256*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*257*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*258*/	}
/*259*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*260*/	r7.y = max(r6.w, 0.000000);
/*261*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*262*/	if(floatBitsToUint(r6.w) != 0u) {
/*263*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*264*/	  r6.x = max(r6.x, -1.000000);
/*265*/	  r6.x = min(r6.x, 1.000000);
/*266*/	  r6.y = -abs(r6.x) + 1.000000;
/*267*/	  r6.y = sqrt(r6.y);
/*268*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*269*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*270*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*271*/	  r6.w = r6.y * r6.z;
/*272*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*273*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*274*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*275*/	  r6.x = r6.z * r6.y + r6.x;
/*276*/	  r4.x = r4.x * r4.x;
/*277*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*278*/	  r4.x = r4.x * r4.y + r7.x;
/*279*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*280*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*281*/	  r4.y = -r4.x * r4.x + 1.000000;
/*282*/	  r4.y = max(r4.y, 0.001000);
/*283*/	  r4.y = log2(r4.y);
/*284*/	  r6.y = r4.y * 4.950617;
/*285*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*286*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*287*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*288*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*289*/	  r4.x = floatBitsToInt(r4.x);
/*290*/	  r6.y = r4.y * r4.y + -r6.y;
/*291*/	  r6.y = sqrt(r6.y);
/*292*/	  r4.y = -r4.y + r6.y;
/*293*/	  r4.y = max(r4.y, 0.000000);
/*294*/	  r4.y = sqrt(r4.y);
/*295*/	  r4.x = r4.y * r4.x;
/*296*/	  r4.x = r4.x * 1.414214;
/*297*/	  r4.x = 0.008727 / r4.x;
/*298*/	  r4.x = max(r4.x, 0.000100);
/*299*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*300*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*301*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*302*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*303*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*304*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*305*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*306*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*307*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*308*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*309*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*310*/	  r4.x = floatBitsToInt(r4.x);
/*311*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*312*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*313*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*314*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*315*/	  r4.x = r4.x * r6.x + 1.000000;
/*316*/	  r4.x = r4.x * 0.500000;
/*317*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*318*/	  r4.y = r4.y * r6.y + 1.000000;
/*319*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*320*/	  r4.y = min(r7.y, 1.000000);
/*321*/	  r2.w = r2.w * 1.570796;
/*322*/	  r2.w = sin(r2.w);
/*323*/	  r4.y = r4.y + -1.000000;
/*324*/	  r2.w = r2.w * r4.y + 1.000000;
/*325*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*326*/	  r4.y = max(r4.y, 0.000000);
/*327*/	  r4.y = log2(r4.y);
/*328*/	  r4.y = r4.y * 10.000000;
/*329*/	  r4.y = exp2(r4.y);
/*330*/	  r4.y = r4.w * r4.y;
/*331*/	  r4.y = r4.y * r5.w + r0.w;
/*332*/	  r2.w = r2.w * abs(r4.x);
/*333*/	  r5.xyz = (r4.yyyy * r2.wwww).xyz;
/*334*/	} else {
/*335*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*336*/	}
/*337*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*338*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*339*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*340*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*341*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*342*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*343*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*344*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*345*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*346*/	r0.xyz = (r4.zzzz * r0.xyzx + r8.xzwx).xyz;
/*347*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*348*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*349*/	r2.w = inversesqrt(r2.w);
/*350*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*351*/	r2.w = dot(vec3(-r4.xyzx), vec3(r2.xyzx));
/*352*/	r2.w = r2.w + r2.w;
/*353*/	r2.xyz = (r2.xyzx * -r2.wwww + -r4.xyzx).xyz;
/*354*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*355*/	r2.x = dot(vec3(r2.xyzx), vec3(-r4.xyzx));
/*356*/	r2.x = max(r2.x, 0.000000);
/*357*/	r2.x = log2(r2.x);
/*358*/	r2.x = r2.x * 10.000000;
/*359*/	r2.x = exp2(r2.x);
/*360*/	r2.x = r4.w * r2.x;
/*361*/	r0.w = r2.x * r5.w + r0.w;
/*362*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*363*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*364*/	color0.w = 2.000000;
/*365*/	r0.x = dot(r3.xyzw, cb0.data[9].xyzw);
/*366*/	r0.y = dot(r3.xyzw, cb0.data[10].xyzw);
/*367*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*368*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*369*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*370*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*371*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*372*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*373*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*374*/	if(r0.x != 0) discard;
/*375*/	color1.x = 1.000000;
/*376*/	return;
}
