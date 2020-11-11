//
//
// Shader Model 4
// Fragment Shader
//
// id: 7149 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtburn.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
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
/*8*/	r2.z = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*12*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*14*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*18*/	r4.z = vsOut_T6.z;
/*19*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*20*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*21*/	if(floatBitsToUint(r0.w) != 0u) {
/*22*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*23*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*25*/	  r0.w = -r0.w + 1.000000;
/*26*/	  r0.w = max(r0.w, 0.000000);
/*27*/	  r4.z = sqrt(r0.w);
/*28*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*30*/	  r0.w = r3.x * r7.w;
/*31*/	  r3.x = r0.w * -0.500000 + r3.x;
/*32*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*33*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*34*/	  r0.w = -r5.w * r6.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*36*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*37*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*38*/	}
/*39*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*40*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*41*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*42*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*43*/	r0.w = r4.w * r5.w;
/*44*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*45*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*46*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*47*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*50*/	r4.xyz = (r0.wwww * r1.xyzx).xyz;
/*51*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*52*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*53*/	r4.x = r3.z;
/*54*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*55*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*56*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*57*/	r0.w = saturate(r4.x * 5.000000);
/*58*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*59*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*60*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*61*/	r1.w = log2(r5.z);
/*62*/	r1.w = r1.w * 1.800000;
/*63*/	r1.w = exp2(r1.w);
/*64*/	r1.w = r1.w * 10.000000;
/*65*/	r1.w = min(r1.w, 1.000000);
/*66*/	r0.w = r0.w + r1.w;
/*67*/	r0.w = r0.w * 0.500000;
/*68*/	r1.w = -r5.w + 1.000000;
/*69*/	r1.w = log2(r1.w);
/*70*/	r1.w = r1.w * vsOut_T7.z;
/*71*/	r1.w = exp2(r1.w);
/*72*/	r1.w = min(r1.w, 1.000000);
/*73*/	r1.w = r1.w * vsOut_T7.z;
/*74*/	r2.w = r5.z * 0.250000;
/*75*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*76*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*77*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*78*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*79*/	r0.w = vsOut_T7.z + -0.025000;
/*80*/	r0.w = max(r0.w, 0.000000);
/*81*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*82*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*83*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*84*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*85*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*86*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*87*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*88*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*89*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*90*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*91*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*92*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*93*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*94*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*95*/	r1.w = inversesqrt(r1.w);
/*96*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*97*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*98*/	r1.w = inversesqrt(r1.w);
/*99*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*100*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*101*/	r1.w = inversesqrt(r1.w);
/*102*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*103*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*104*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*105*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*106*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*107*/	r1.w = inversesqrt(r1.w);
/*108*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*109*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*110*/	r4.w = 1.000000;
/*111*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*112*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*113*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*114*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*115*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*116*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*117*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*118*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*119*/	r3.x = intBitsToFloat(int(r2.w));
/*120*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*121*/	if(floatBitsToUint(r3.z) != 0u) {
/*122*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*123*/	  r5.w = vsOut_T0.w;
/*124*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*125*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*126*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*127*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*128*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*129*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*130*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*131*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*132*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*133*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*134*/	  if(floatBitsToUint(r3.w) == 0u) {
/*135*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*136*/	    r7.xy = floor((r6.xyxx).xy);
/*137*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*138*/	    r3.z = -0.000400 / r3.z;
/*139*/	    r3.z = r3.z + r6.z;
/*140*/	    r8.z = -r8.y + 1.000000;
/*141*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*142*/	    r8.w = -r8.y;
/*143*/	    r10.x = cb1.data[0].z/**/;
/*144*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*145*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*146*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*147*/	    r10.w = -cb1.data[0].w/**/;
/*148*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*149*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*150*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*151*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*152*/	    r8.x = r9.x;
/*153*/	    r8.y = r11.x;
/*154*/	    r8.z = r10.x;
/*155*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*156*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*157*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*158*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*159*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*160*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*161*/	    r3.z = -r6.x + r6.y;
/*162*/	    r3.z = r3.w * r3.z + r6.x;
/*163*/	  } else {
/*164*/	    r3.z = 1.000000;
/*165*/	  }
/*166*/	} else {
/*167*/	  r3.z = 1.000000;
/*168*/	}
/*169*/	r3.w = cb1.data[34].w + -1.000000;
/*170*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*171*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*172*/	if(floatBitsToUint(r2.w) == 0u) {
/*173*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*174*/	  r2.w = floatBitsToInt(r2.w);
/*175*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*176*/	  if(floatBitsToUint(r2.w) != 0u) {
/*177*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*178*/	    r5.w = vsOut_T0.w;
/*179*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*180*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*181*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*182*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*183*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*184*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*185*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*186*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*187*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*188*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*189*/	    if(floatBitsToUint(r5.w) == 0u) {
/*190*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*191*/	      r6.xy = floor((r5.xyxx).xy);
/*192*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*193*/	      r2.w = -0.000400 / r2.w;
/*194*/	      r2.w = r2.w + r5.z;
/*195*/	      r7.z = -r7.y + 1.000000;
/*196*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*197*/	      r7.w = -r7.y;
/*198*/	      r9.x = cb1.data[0].z/**/;
/*199*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*200*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*201*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*202*/	      r9.w = -cb1.data[0].w/**/;
/*203*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*204*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*205*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*206*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*207*/	      r7.x = r8.x;
/*208*/	      r7.y = r10.x;
/*209*/	      r7.z = r9.x;
/*210*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*211*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*212*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*213*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*214*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*215*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*216*/	      r2.w = -r5.x + r5.z;
/*217*/	      r2.w = r5.y * r2.w + r5.x;
/*218*/	    } else {
/*219*/	      r2.w = 1.000000;
/*220*/	    }
/*221*/	  } else {
/*222*/	    r2.w = 1.000000;
/*223*/	  }
/*224*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*225*/	  r5.y = r5.x * cb1.data[34].x;
/*226*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*227*/	  r5.x = r1.w + -r5.x;
/*228*/	  r5.x = saturate(r5.x / r5.y);
/*229*/	  r2.w = -r3.z + r2.w;
/*230*/	  r3.z = r5.x * r2.w + r3.z;
/*231*/	}
/*232*/	if(floatBitsToUint(r3.w) != 0u) {
/*233*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*234*/	  r3.w = r2.w * cb1.data[34].y;
/*235*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*236*/	  r2.w = r1.w + -r2.w;
/*237*/	  r2.w = saturate(r2.w / r3.w);
/*238*/	  r3.x = -r3.z + 1.000000;
/*239*/	  r3.z = r2.w * r3.x + r3.z;
/*240*/	}
/*241*/	r3.z = saturate(r3.z);
/*242*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*243*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*244*/	r2.w = inversesqrt(r2.w);
/*245*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*246*/	r2.w = -r3.y + 1.000000;
/*247*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*248*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*249*/	r3.w = r3.w + r3.w;
/*250*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*251*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*252*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*253*/	r3.w = cos((r8.x));
/*254*/	r3.w = inversesqrt(r3.w);
/*255*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*256*/	r5.w = saturate(r0.w * 60.000000);
/*257*/	r5.w = -r0.w + r5.w;
/*258*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*259*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*260*/	r6.w = inversesqrt(r6.w);
/*261*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*262*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*263*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*264*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*265*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*266*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*267*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*268*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*269*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*270*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*271*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*272*/	r6.w = -r0.w + 1.000000;
/*273*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*274*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*275*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*276*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*277*/	  r6.w = max(r6.w, 0.000000);
/*278*/	  r6.w = log2(r6.w);
/*279*/	  r6.w = r6.w * 10.000000;
/*280*/	  r6.w = exp2(r6.w);
/*281*/	  r6.w = r3.w * r6.w;
/*282*/	  r6.w = r6.w * r5.w + r0.w;
/*283*/	  r7.y = r2.w * 8.000000;
/*284*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*285*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*286*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*287*/	}
/*288*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*289*/	r7.y = max(r6.w, 0.000000);
/*290*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*291*/	if(floatBitsToUint(r6.w) != 0u) {
/*292*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*293*/	  r6.x = max(r6.x, -1.000000);
/*294*/	  r6.x = min(r6.x, 1.000000);
/*295*/	  r6.y = -abs(r6.x) + 1.000000;
/*296*/	  r6.y = sqrt(r6.y);
/*297*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*298*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*299*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*300*/	  r6.w = r6.y * r6.z;
/*301*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*302*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*303*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*304*/	  r6.x = r6.z * r6.y + r6.x;
/*305*/	  r3.y = r3.y * r3.y;
/*306*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*307*/	  r3.x = r3.y * r3.x + r7.x;
/*308*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*309*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*310*/	  r3.y = -r3.x * r3.x + 1.000000;
/*311*/	  r3.y = max(r3.y, 0.001000);
/*312*/	  r3.y = log2(r3.y);
/*313*/	  r6.y = r3.y * 4.950617;
/*314*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*315*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*316*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*317*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*318*/	  r3.x = floatBitsToInt(r3.x);
/*319*/	  r6.y = r3.y * r3.y + -r6.y;
/*320*/	  r6.y = sqrt(r6.y);
/*321*/	  r3.y = -r3.y + r6.y;
/*322*/	  r3.y = max(r3.y, 0.000000);
/*323*/	  r3.y = sqrt(r3.y);
/*324*/	  r3.x = r3.y * r3.x;
/*325*/	  r3.x = r3.x * 1.414214;
/*326*/	  r3.x = 0.008727 / r3.x;
/*327*/	  r3.x = max(r3.x, 0.000100);
/*328*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*329*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*330*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*331*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*332*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*333*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*334*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*335*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*336*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*337*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*338*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*339*/	  r3.x = floatBitsToInt(r3.x);
/*340*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*341*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*342*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*343*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*344*/	  r3.x = r3.x * r6.x + 1.000000;
/*345*/	  r3.x = r3.x * 0.500000;
/*346*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*347*/	  r3.y = r3.y * r6.y + 1.000000;
/*348*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*349*/	  r3.y = min(r7.y, 1.000000);
/*350*/	  r2.w = r2.w * 1.570796;
/*351*/	  r2.w = sin(r2.w);
/*352*/	  r3.y = r3.y + -1.000000;
/*353*/	  r2.w = r2.w * r3.y + 1.000000;
/*354*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*355*/	  r3.y = max(r3.y, 0.000000);
/*356*/	  r3.y = log2(r3.y);
/*357*/	  r3.y = r3.y * 10.000000;
/*358*/	  r3.y = exp2(r3.y);
/*359*/	  r3.y = r3.w * r3.y;
/*360*/	  r3.y = r3.y * r5.w + r0.w;
/*361*/	  r2.w = r2.w * abs(r3.x);
/*362*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*363*/	} else {
/*364*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*365*/	}
/*366*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*367*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*368*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*369*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*370*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*371*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*372*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*373*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*374*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*375*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*376*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*377*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*378*/	r2.w = inversesqrt(r2.w);
/*379*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*380*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*381*/	r2.w = r2.w + r2.w;
/*382*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*383*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*384*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*385*/	r2.x = max(r2.x, 0.000000);
/*386*/	r2.x = log2(r2.x);
/*387*/	r2.x = r2.x * 10.000000;
/*388*/	r2.x = exp2(r2.x);
/*389*/	r2.x = r3.w * r2.x;
/*390*/	r0.w = r2.x * r5.w + r0.w;
/*391*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*392*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*393*/	color0.w = 2.000000;
/*394*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*395*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*396*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*397*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*398*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*399*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*400*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*401*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*402*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*403*/	if(r0.x != 0) discard;
/*404*/	color1.x = 1.000000;
/*405*/	return;
}
