//
//
// Shader Model 4
// Fragment Shader
//
// id: 6808 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
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
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r2.z = sqrt(r0.w);
/*11*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*13*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*14*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*15*/	r0.w = r3.w * r4.w;
/*16*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*17*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*19*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*20*/	r1.x = inversesqrt(r1.x);
/*21*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*22*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*23*/	if(r1.w != 0) discard;
/*24*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*25*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*27*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*28*/	r1.w = saturate(-r1.w + r2.w);
/*29*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*30*/	if(floatBitsToUint(r1.w) != 0u) {
/*31*/	  r1.w = -r2.w + 1.000000;
/*32*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*33*/	  r1.w = -r1.w + 1.000000;
/*34*/	  r1.w = -r1.w * r1.w + 1.000000;
/*35*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*36*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*37*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*38*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*39*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*40*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*41*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*42*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*43*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*44*/	} else {
/*45*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*48*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*49*/	}
/*50*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*51*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*52*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*53*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*54*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*55*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*56*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*57*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*58*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*59*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*60*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*61*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*64*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*67*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*68*/	r1.w = inversesqrt(r1.w);
/*69*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*70*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*71*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*72*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*73*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*74*/	r1.w = inversesqrt(r1.w);
/*75*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*76*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*77*/	r4.w = 1.000000;
/*78*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*79*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*80*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*81*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*82*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*84*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*85*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*86*/	r3.y = intBitsToFloat(int(r2.w));
/*87*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*88*/	if(floatBitsToUint(r3.z) != 0u) {
/*89*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*90*/	  r5.w = vsOut_T0.w;
/*91*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*92*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*93*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*94*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*95*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*96*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*97*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*98*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*99*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*100*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*101*/	  if(floatBitsToUint(r3.w) == 0u) {
/*102*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*103*/	    r7.xy = floor((r6.xyxx).xy);
/*104*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*105*/	    r3.z = -0.000400 / r3.z;
/*106*/	    r3.z = r3.z + r6.z;
/*107*/	    r8.z = -r8.y + 1.000000;
/*108*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*109*/	    r8.w = -r8.y;
/*110*/	    r10.x = cb1.data[0].z/**/;
/*111*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*112*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*113*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*114*/	    r10.w = -cb1.data[0].w/**/;
/*115*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*116*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*117*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*118*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*119*/	    r8.x = r9.x;
/*120*/	    r8.y = r11.x;
/*121*/	    r8.z = r10.x;
/*122*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*123*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*124*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*125*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*126*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*127*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*128*/	    r3.z = -r6.x + r6.y;
/*129*/	    r3.z = r3.w * r3.z + r6.x;
/*130*/	  } else {
/*131*/	    r3.z = 1.000000;
/*132*/	  }
/*133*/	} else {
/*134*/	  r3.z = 1.000000;
/*135*/	}
/*136*/	r3.w = cb1.data[34].w + -1.000000;
/*137*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*138*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*139*/	if(floatBitsToUint(r2.w) == 0u) {
/*140*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*141*/	  r2.w = floatBitsToInt(r2.w);
/*142*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*143*/	  if(floatBitsToUint(r2.w) != 0u) {
/*144*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*145*/	    r5.w = vsOut_T0.w;
/*146*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*147*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*148*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*149*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*150*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*151*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*152*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*153*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*154*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*155*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*156*/	    if(floatBitsToUint(r5.w) == 0u) {
/*157*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*158*/	      r6.xy = floor((r5.xyxx).xy);
/*159*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*160*/	      r2.w = -0.000400 / r2.w;
/*161*/	      r2.w = r2.w + r5.z;
/*162*/	      r7.z = -r7.y + 1.000000;
/*163*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*164*/	      r7.w = -r7.y;
/*165*/	      r9.x = cb1.data[0].z/**/;
/*166*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*167*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*168*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*169*/	      r9.w = -cb1.data[0].w/**/;
/*170*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*171*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*172*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*173*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*174*/	      r7.x = r8.x;
/*175*/	      r7.y = r10.x;
/*176*/	      r7.z = r9.x;
/*177*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*178*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*179*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*180*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*181*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*182*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*183*/	      r2.w = -r5.x + r5.z;
/*184*/	      r2.w = r5.y * r2.w + r5.x;
/*185*/	    } else {
/*186*/	      r2.w = 1.000000;
/*187*/	    }
/*188*/	  } else {
/*189*/	    r2.w = 1.000000;
/*190*/	  }
/*191*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*192*/	  r5.y = r5.x * cb1.data[34].x;
/*193*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*194*/	  r5.x = r1.w + -r5.x;
/*195*/	  r5.x = saturate(r5.x / r5.y);
/*196*/	  r2.w = -r3.z + r2.w;
/*197*/	  r3.z = r5.x * r2.w + r3.z;
/*198*/	}
/*199*/	if(floatBitsToUint(r3.w) != 0u) {
/*200*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*201*/	  r3.w = r2.w * cb1.data[34].y;
/*202*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*203*/	  r2.w = r1.w + -r2.w;
/*204*/	  r2.w = saturate(r2.w / r3.w);
/*205*/	  r3.y = -r3.z + 1.000000;
/*206*/	  r3.z = r2.w * r3.y + r3.z;
/*207*/	}
/*208*/	r3.z = saturate(r3.z);
/*209*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*210*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*211*/	r2.w = inversesqrt(r2.w);
/*212*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*213*/	r2.w = -r3.x + 1.000000;
/*214*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*215*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*216*/	r3.w = r3.w + r3.w;
/*217*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*218*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*219*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*220*/	r3.w = cos((r8.x));
/*221*/	r3.w = inversesqrt(r3.w);
/*222*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*223*/	r5.w = saturate(r0.w * 60.000000);
/*224*/	r5.w = -r0.w + r5.w;
/*225*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*226*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*227*/	r6.w = inversesqrt(r6.w);
/*228*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*229*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*230*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*231*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*232*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*233*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*234*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*235*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*236*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*237*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*238*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*239*/	r6.w = -r0.w + 1.000000;
/*240*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*241*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*242*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*243*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*244*/	  r6.w = max(r6.w, 0.000000);
/*245*/	  r6.w = log2(r6.w);
/*246*/	  r6.w = r6.w * 10.000000;
/*247*/	  r6.w = exp2(r6.w);
/*248*/	  r6.w = r3.w * r6.w;
/*249*/	  r6.w = r6.w * r5.w + r0.w;
/*250*/	  r7.y = r2.w * 8.000000;
/*251*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*252*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*253*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*254*/	}
/*255*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*256*/	r7.y = max(r6.w, 0.000000);
/*257*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*258*/	if(floatBitsToUint(r6.w) != 0u) {
/*259*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*260*/	  r6.x = max(r6.x, -1.000000);
/*261*/	  r6.x = min(r6.x, 1.000000);
/*262*/	  r6.y = -abs(r6.x) + 1.000000;
/*263*/	  r6.y = sqrt(r6.y);
/*264*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*265*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*266*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*267*/	  r6.w = r6.y * r6.z;
/*268*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*269*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*270*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*271*/	  r6.x = r6.z * r6.y + r6.x;
/*272*/	  r3.x = r3.x * r3.x;
/*273*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*274*/	  r3.x = r3.x * r3.y + r7.x;
/*275*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*276*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*277*/	  r3.y = -r3.x * r3.x + 1.000000;
/*278*/	  r3.y = max(r3.y, 0.001000);
/*279*/	  r3.y = log2(r3.y);
/*280*/	  r6.y = r3.y * 4.950617;
/*281*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*282*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*283*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*284*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*285*/	  r3.x = floatBitsToInt(r3.x);
/*286*/	  r6.y = r3.y * r3.y + -r6.y;
/*287*/	  r6.y = sqrt(r6.y);
/*288*/	  r3.y = -r3.y + r6.y;
/*289*/	  r3.y = max(r3.y, 0.000000);
/*290*/	  r3.y = sqrt(r3.y);
/*291*/	  r3.x = r3.y * r3.x;
/*292*/	  r3.x = r3.x * 1.414214;
/*293*/	  r3.x = 0.008727 / r3.x;
/*294*/	  r3.x = max(r3.x, 0.000100);
/*295*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*296*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*297*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*298*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*299*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*300*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*301*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*302*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*303*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*304*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*305*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*306*/	  r3.x = floatBitsToInt(r3.x);
/*307*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*308*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*309*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*310*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*311*/	  r3.x = r3.x * r6.x + 1.000000;
/*312*/	  r3.x = r3.x * 0.500000;
/*313*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*314*/	  r3.y = r3.y * r6.y + 1.000000;
/*315*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*316*/	  r3.y = min(r7.y, 1.000000);
/*317*/	  r2.w = r2.w * 1.570796;
/*318*/	  r2.w = sin(r2.w);
/*319*/	  r3.y = r3.y + -1.000000;
/*320*/	  r2.w = r2.w * r3.y + 1.000000;
/*321*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*322*/	  r3.y = max(r3.y, 0.000000);
/*323*/	  r3.y = log2(r3.y);
/*324*/	  r3.y = r3.y * 10.000000;
/*325*/	  r3.y = exp2(r3.y);
/*326*/	  r3.y = r3.w * r3.y;
/*327*/	  r3.y = r3.y * r5.w + r0.w;
/*328*/	  r2.w = r2.w * abs(r3.x);
/*329*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*330*/	} else {
/*331*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*332*/	}
/*333*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*334*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*335*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*336*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*337*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*338*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*339*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*340*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*341*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*342*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*343*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*344*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*345*/	r2.w = inversesqrt(r2.w);
/*346*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*347*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*348*/	r2.w = r2.w + r2.w;
/*349*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*350*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*351*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*352*/	r1.x = max(r1.x, 0.000000);
/*353*/	r1.x = log2(r1.x);
/*354*/	r1.x = r1.x * 10.000000;
/*355*/	r1.x = exp2(r1.x);
/*356*/	r1.x = r3.w * r1.x;
/*357*/	r0.w = r1.x * r5.w + r0.w;
/*358*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*359*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*360*/	color0.w = 2.000000;
/*361*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*362*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*363*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*364*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*365*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*366*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*367*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*368*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*369*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*370*/	if(r0.x != 0) discard;
/*371*/	color1.x = 1.000000;
/*372*/	return;
}
