//
//
// Shader Model 4
// Fragment Shader
//
// id: 6810 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r2.z = sqrt(r0.w);
/*8*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*10*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*11*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*12*/	r0.w = r3.w * r4.w;
/*13*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*14*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*16*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r1.x = inversesqrt(r1.x);
/*18*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*19*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r1.w != 0) discard;
/*21*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * cb3.data[2].xyxx + vsOut_T6.xyxx).xy;
/*23*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*25*/	r1.w = saturate(-r1.w + r2.w);
/*26*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r1.w) != 0u) {
/*28*/	  r1.w = -r2.w + 1.000000;
/*29*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*30*/	  r1.w = -r1.w + 1.000000;
/*31*/	  r1.w = -r1.w * r1.w + 1.000000;
/*32*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*33*/	  r2.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*37*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*38*/	  r0.xyz = (r1.wwww * r3.xyzx + r2.xyzx).xyz;
/*39*/	  r2.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*40*/	  r3.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*41*/	} else {
/*42*/	  r4.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	  r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*44*/	  r5.xyz = (r0.wwww * r4.xyzx).xyz;
/*45*/	  r2.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r4.xyzx).xyz;
/*46*/	}
/*47*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*48*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*49*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*50*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*51*/	r4.xyz = (-r2.xyzx + r0.wwww).xyz;
/*52*/	r2.xyz = (vsOut_T7.yyyy * r4.xyzx + r2.xyzx).xyz;
/*53*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*54*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*55*/	r3.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*56*/	r3.yzw = (-r0.xxyz + r3.yyzw).yzw;
/*57*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.yzwy + r0.xyzx).xyz;
/*58*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r3.yzw = (r1.wwww * vsOut_T3.xxyz).yzw;
/*61*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*64*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r1.w = inversesqrt(r1.w);
/*66*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*68*/	r1.xyw = (r1.xxxx * r3.yzyw + r4.xyxz).xyw;
/*69*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*70*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*73*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*74*/	r4.w = 1.000000;
/*75*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*76*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*77*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*78*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*79*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*80*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*81*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*82*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*83*/	r3.y = intBitsToFloat(int(r2.w));
/*84*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*85*/	if(floatBitsToUint(r3.z) != 0u) {
/*86*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*87*/	  r5.w = vsOut_T0.w;
/*88*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*89*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*90*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*91*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*92*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*93*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*94*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*95*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*96*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*97*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*98*/	  if(floatBitsToUint(r3.w) == 0u) {
/*99*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*100*/	    r7.xy = floor((r6.xyxx).xy);
/*101*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*102*/	    r3.z = -0.000400 / r3.z;
/*103*/	    r3.z = r3.z + r6.z;
/*104*/	    r8.z = -r8.y + 1.000000;
/*105*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*106*/	    r8.w = -r8.y;
/*107*/	    r10.x = cb1.data[0].z/**/;
/*108*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*109*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*110*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*111*/	    r10.w = -cb1.data[0].w/**/;
/*112*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*113*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*114*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*115*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*116*/	    r8.x = r9.x;
/*117*/	    r8.y = r11.x;
/*118*/	    r8.z = r10.x;
/*119*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*120*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*121*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*122*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*123*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*124*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*125*/	    r3.z = -r6.x + r6.y;
/*126*/	    r3.z = r3.w * r3.z + r6.x;
/*127*/	  } else {
/*128*/	    r3.z = 1.000000;
/*129*/	  }
/*130*/	} else {
/*131*/	  r3.z = 1.000000;
/*132*/	}
/*133*/	r3.w = cb1.data[34].w + -1.000000;
/*134*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*135*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*136*/	if(floatBitsToUint(r2.w) == 0u) {
/*137*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*138*/	  r2.w = floatBitsToInt(r2.w);
/*139*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*140*/	  if(floatBitsToUint(r2.w) != 0u) {
/*141*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*142*/	    r5.w = vsOut_T0.w;
/*143*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*144*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*145*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*146*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*147*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*148*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*149*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*150*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*151*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*152*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*153*/	    if(floatBitsToUint(r5.w) == 0u) {
/*154*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*155*/	      r6.xy = floor((r5.xyxx).xy);
/*156*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*157*/	      r2.w = -0.000400 / r2.w;
/*158*/	      r2.w = r2.w + r5.z;
/*159*/	      r7.z = -r7.y + 1.000000;
/*160*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*161*/	      r7.w = -r7.y;
/*162*/	      r9.x = cb1.data[0].z/**/;
/*163*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*164*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*165*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*166*/	      r9.w = -cb1.data[0].w/**/;
/*167*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*168*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*169*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*170*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*171*/	      r7.x = r8.x;
/*172*/	      r7.y = r10.x;
/*173*/	      r7.z = r9.x;
/*174*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*175*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*176*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*177*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*178*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*179*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*180*/	      r2.w = -r5.x + r5.z;
/*181*/	      r2.w = r5.y * r2.w + r5.x;
/*182*/	    } else {
/*183*/	      r2.w = 1.000000;
/*184*/	    }
/*185*/	  } else {
/*186*/	    r2.w = 1.000000;
/*187*/	  }
/*188*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*189*/	  r5.y = r5.x * cb1.data[34].x;
/*190*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*191*/	  r5.x = r1.w + -r5.x;
/*192*/	  r5.x = saturate(r5.x / r5.y);
/*193*/	  r2.w = -r3.z + r2.w;
/*194*/	  r3.z = r5.x * r2.w + r3.z;
/*195*/	}
/*196*/	if(floatBitsToUint(r3.w) != 0u) {
/*197*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*198*/	  r3.w = r2.w * cb1.data[34].y;
/*199*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*200*/	  r2.w = r1.w + -r2.w;
/*201*/	  r2.w = saturate(r2.w / r3.w);
/*202*/	  r3.y = -r3.z + 1.000000;
/*203*/	  r3.z = r2.w * r3.y + r3.z;
/*204*/	}
/*205*/	r3.z = saturate(r3.z);
/*206*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*207*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*208*/	r2.w = inversesqrt(r2.w);
/*209*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*210*/	r2.w = -r3.x + 1.000000;
/*211*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*212*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*213*/	r3.w = r3.w + r3.w;
/*214*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*215*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*216*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*217*/	r3.w = cos((r8.x));
/*218*/	r3.w = inversesqrt(r3.w);
/*219*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*220*/	r5.w = saturate(r0.w * 60.000000);
/*221*/	r5.w = -r0.w + r5.w;
/*222*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*223*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*224*/	r6.w = inversesqrt(r6.w);
/*225*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*226*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*227*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*228*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*229*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*230*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*231*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*232*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*233*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*234*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*235*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*236*/	r6.w = -r0.w + 1.000000;
/*237*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*238*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*239*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*240*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*241*/	  r6.w = max(r6.w, 0.000000);
/*242*/	  r6.w = log2(r6.w);
/*243*/	  r6.w = r6.w * 10.000000;
/*244*/	  r6.w = exp2(r6.w);
/*245*/	  r6.w = r3.w * r6.w;
/*246*/	  r6.w = r6.w * r5.w + r0.w;
/*247*/	  r7.y = r2.w * 8.000000;
/*248*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*249*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*250*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*251*/	}
/*252*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*253*/	r7.y = max(r6.w, 0.000000);
/*254*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*255*/	if(floatBitsToUint(r6.w) != 0u) {
/*256*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*257*/	  r6.x = max(r6.x, -1.000000);
/*258*/	  r6.x = min(r6.x, 1.000000);
/*259*/	  r6.y = -abs(r6.x) + 1.000000;
/*260*/	  r6.y = sqrt(r6.y);
/*261*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*262*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*263*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*264*/	  r6.w = r6.y * r6.z;
/*265*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*266*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*267*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*268*/	  r6.x = r6.z * r6.y + r6.x;
/*269*/	  r3.x = r3.x * r3.x;
/*270*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*271*/	  r3.x = r3.x * r3.y + r7.x;
/*272*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*273*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*274*/	  r3.y = -r3.x * r3.x + 1.000000;
/*275*/	  r3.y = max(r3.y, 0.001000);
/*276*/	  r3.y = log2(r3.y);
/*277*/	  r6.y = r3.y * 4.950617;
/*278*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*279*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*280*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*281*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*282*/	  r3.x = floatBitsToInt(r3.x);
/*283*/	  r6.y = r3.y * r3.y + -r6.y;
/*284*/	  r6.y = sqrt(r6.y);
/*285*/	  r3.y = -r3.y + r6.y;
/*286*/	  r3.y = max(r3.y, 0.000000);
/*287*/	  r3.y = sqrt(r3.y);
/*288*/	  r3.x = r3.y * r3.x;
/*289*/	  r3.x = r3.x * 1.414214;
/*290*/	  r3.x = 0.008727 / r3.x;
/*291*/	  r3.x = max(r3.x, 0.000100);
/*292*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*293*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*294*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*295*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*296*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*297*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*298*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*299*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*300*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*301*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*302*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*303*/	  r3.x = floatBitsToInt(r3.x);
/*304*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*305*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*306*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*307*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*308*/	  r3.x = r3.x * r6.x + 1.000000;
/*309*/	  r3.x = r3.x * 0.500000;
/*310*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*311*/	  r3.y = r3.y * r6.y + 1.000000;
/*312*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*313*/	  r3.y = min(r7.y, 1.000000);
/*314*/	  r2.w = r2.w * 1.570796;
/*315*/	  r2.w = sin(r2.w);
/*316*/	  r3.y = r3.y + -1.000000;
/*317*/	  r2.w = r2.w * r3.y + 1.000000;
/*318*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*319*/	  r3.y = max(r3.y, 0.000000);
/*320*/	  r3.y = log2(r3.y);
/*321*/	  r3.y = r3.y * 10.000000;
/*322*/	  r3.y = exp2(r3.y);
/*323*/	  r3.y = r3.w * r3.y;
/*324*/	  r3.y = r3.y * r5.w + r0.w;
/*325*/	  r2.w = r2.w * abs(r3.x);
/*326*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*327*/	} else {
/*328*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*329*/	}
/*330*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*331*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*332*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*333*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*334*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*335*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*336*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*337*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*338*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*339*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*340*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*341*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*342*/	r2.w = inversesqrt(r2.w);
/*343*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*344*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*345*/	r2.w = r2.w + r2.w;
/*346*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*347*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*348*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*349*/	r1.x = max(r1.x, 0.000000);
/*350*/	r1.x = log2(r1.x);
/*351*/	r1.x = r1.x * 10.000000;
/*352*/	r1.x = exp2(r1.x);
/*353*/	r1.x = r3.w * r1.x;
/*354*/	r0.w = r1.x * r5.w + r0.w;
/*355*/	r1.xyz = (r6.xyzx * r0.wwww).xyz;
/*356*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xyzx).xyz;
/*357*/	color0.w = 2.000000;
/*358*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*359*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*360*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*361*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*362*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*363*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*364*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*365*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*366*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*367*/	if(r0.x != 0) discard;
/*368*/	color1.x = 1.000000;
/*369*/	return;
}
