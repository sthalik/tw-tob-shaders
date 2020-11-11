//
//
// Shader Model 4
// Fragment Shader
//
// id: 7089 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_weighted_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
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
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r2.z = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*15*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*16*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*17*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*20*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*21*/	r4.z = vsOut_T6.z;
/*22*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*23*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*24*/	if(floatBitsToUint(r0.w) != 0u) {
/*25*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*26*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*27*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*28*/	  r0.w = -r0.w + 1.000000;
/*29*/	  r0.w = max(r0.w, 0.000000);
/*30*/	  r4.z = sqrt(r0.w);
/*31*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*32*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*33*/	  r0.w = r3.x * r7.w;
/*34*/	  r3.x = r0.w * -0.500000 + r3.x;
/*35*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*36*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*37*/	  r0.w = -r5.w * r6.w + 1.000000;
/*38*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*39*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*40*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*41*/	}
/*42*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*44*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*45*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*46*/	r0.w = r4.w * r5.w;
/*47*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*48*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*49*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*50*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*51*/	r1.w = inversesqrt(r1.w);
/*52*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*53*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*54*/	if(r1.w != 0) discard;
/*55*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*56*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*57*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*58*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*59*/	r1.w = saturate(-r1.w + r4.w);
/*60*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*61*/	if(floatBitsToUint(r1.w) != 0u) {
/*62*/	  r1.w = -r4.w + 1.000000;
/*63*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*64*/	  r1.w = -r1.w + 1.000000;
/*65*/	  r1.w = -r1.w * r1.w + 1.000000;
/*66*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*67*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*68*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*69*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*70*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*71*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*72*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*73*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*74*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*75*/	} else {
/*76*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*77*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*78*/	}
/*79*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*81*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*83*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*84*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*85*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*86*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*87*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*88*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*89*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*90*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*93*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*94*/	r1.w = inversesqrt(r1.w);
/*95*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*96*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*97*/	r1.w = inversesqrt(r1.w);
/*98*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*99*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*100*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*101*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*102*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*103*/	r1.w = inversesqrt(r1.w);
/*104*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*105*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*106*/	r4.w = 1.000000;
/*107*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*108*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*109*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*110*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*111*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*112*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*113*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*114*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*115*/	r3.x = intBitsToFloat(int(r2.w));
/*116*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*117*/	if(floatBitsToUint(r3.z) != 0u) {
/*118*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*119*/	  r5.w = vsOut_T0.w;
/*120*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*121*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*122*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*123*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*124*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*125*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*126*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*127*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*128*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*129*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*130*/	  if(floatBitsToUint(r3.w) == 0u) {
/*131*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*132*/	    r7.xy = floor((r6.xyxx).xy);
/*133*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*134*/	    r3.z = -0.000400 / r3.z;
/*135*/	    r3.z = r3.z + r6.z;
/*136*/	    r8.z = -r8.y + 1.000000;
/*137*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*138*/	    r8.w = -r8.y;
/*139*/	    r10.x = cb1.data[0].z/**/;
/*140*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*141*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*142*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*143*/	    r10.w = -cb1.data[0].w/**/;
/*144*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*145*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*146*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*147*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*148*/	    r8.x = r9.x;
/*149*/	    r8.y = r11.x;
/*150*/	    r8.z = r10.x;
/*151*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*152*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*153*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*154*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*155*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*156*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*157*/	    r3.z = -r6.x + r6.y;
/*158*/	    r3.z = r3.w * r3.z + r6.x;
/*159*/	  } else {
/*160*/	    r3.z = 1.000000;
/*161*/	  }
/*162*/	} else {
/*163*/	  r3.z = 1.000000;
/*164*/	}
/*165*/	r3.w = cb1.data[34].w + -1.000000;
/*166*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*167*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*168*/	if(floatBitsToUint(r2.w) == 0u) {
/*169*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*170*/	  r2.w = floatBitsToInt(r2.w);
/*171*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*172*/	  if(floatBitsToUint(r2.w) != 0u) {
/*173*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*174*/	    r5.w = vsOut_T0.w;
/*175*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*176*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*177*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*178*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*179*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*180*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*181*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*182*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*183*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*184*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*185*/	    if(floatBitsToUint(r5.w) == 0u) {
/*186*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*187*/	      r6.xy = floor((r5.xyxx).xy);
/*188*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*189*/	      r2.w = -0.000400 / r2.w;
/*190*/	      r2.w = r2.w + r5.z;
/*191*/	      r7.z = -r7.y + 1.000000;
/*192*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*193*/	      r7.w = -r7.y;
/*194*/	      r9.x = cb1.data[0].z/**/;
/*195*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*196*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*197*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*198*/	      r9.w = -cb1.data[0].w/**/;
/*199*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*200*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*201*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*202*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*203*/	      r7.x = r8.x;
/*204*/	      r7.y = r10.x;
/*205*/	      r7.z = r9.x;
/*206*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*207*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*208*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*209*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*210*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*211*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*212*/	      r2.w = -r5.x + r5.z;
/*213*/	      r2.w = r5.y * r2.w + r5.x;
/*214*/	    } else {
/*215*/	      r2.w = 1.000000;
/*216*/	    }
/*217*/	  } else {
/*218*/	    r2.w = 1.000000;
/*219*/	  }
/*220*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*221*/	  r5.y = r5.x * cb1.data[34].x;
/*222*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*223*/	  r5.x = r1.w + -r5.x;
/*224*/	  r5.x = saturate(r5.x / r5.y);
/*225*/	  r2.w = -r3.z + r2.w;
/*226*/	  r3.z = r5.x * r2.w + r3.z;
/*227*/	}
/*228*/	if(floatBitsToUint(r3.w) != 0u) {
/*229*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*230*/	  r3.w = r2.w * cb1.data[34].y;
/*231*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*232*/	  r2.w = r1.w + -r2.w;
/*233*/	  r2.w = saturate(r2.w / r3.w);
/*234*/	  r3.x = -r3.z + 1.000000;
/*235*/	  r3.z = r2.w * r3.x + r3.z;
/*236*/	}
/*237*/	r3.z = saturate(r3.z);
/*238*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*239*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*240*/	r2.w = inversesqrt(r2.w);
/*241*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*242*/	r2.w = -r3.y + 1.000000;
/*243*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*244*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*245*/	r3.w = r3.w + r3.w;
/*246*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*247*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*248*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*249*/	r3.w = cos((r8.x));
/*250*/	r3.w = inversesqrt(r3.w);
/*251*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*252*/	r5.w = saturate(r0.w * 60.000000);
/*253*/	r5.w = -r0.w + r5.w;
/*254*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*255*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*256*/	r6.w = inversesqrt(r6.w);
/*257*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*258*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*259*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*260*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*261*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*262*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*263*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*264*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*265*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*266*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*267*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*268*/	r6.w = -r0.w + 1.000000;
/*269*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*270*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*271*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*272*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*273*/	  r6.w = max(r6.w, 0.000000);
/*274*/	  r6.w = log2(r6.w);
/*275*/	  r6.w = r6.w * 10.000000;
/*276*/	  r6.w = exp2(r6.w);
/*277*/	  r6.w = r3.w * r6.w;
/*278*/	  r6.w = r6.w * r5.w + r0.w;
/*279*/	  r7.y = r2.w * 8.000000;
/*280*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*281*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*282*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*283*/	}
/*284*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*285*/	r7.y = max(r6.w, 0.000000);
/*286*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*287*/	if(floatBitsToUint(r6.w) != 0u) {
/*288*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*289*/	  r6.x = max(r6.x, -1.000000);
/*290*/	  r6.x = min(r6.x, 1.000000);
/*291*/	  r6.y = -abs(r6.x) + 1.000000;
/*292*/	  r6.y = sqrt(r6.y);
/*293*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*294*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*295*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*296*/	  r6.w = r6.y * r6.z;
/*297*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*298*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*299*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*300*/	  r6.x = r6.z * r6.y + r6.x;
/*301*/	  r3.y = r3.y * r3.y;
/*302*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*303*/	  r3.x = r3.y * r3.x + r7.x;
/*304*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*305*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*306*/	  r3.y = -r3.x * r3.x + 1.000000;
/*307*/	  r3.y = max(r3.y, 0.001000);
/*308*/	  r3.y = log2(r3.y);
/*309*/	  r6.y = r3.y * 4.950617;
/*310*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*311*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*312*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*313*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*314*/	  r3.x = floatBitsToInt(r3.x);
/*315*/	  r6.y = r3.y * r3.y + -r6.y;
/*316*/	  r6.y = sqrt(r6.y);
/*317*/	  r3.y = -r3.y + r6.y;
/*318*/	  r3.y = max(r3.y, 0.000000);
/*319*/	  r3.y = sqrt(r3.y);
/*320*/	  r3.x = r3.y * r3.x;
/*321*/	  r3.x = r3.x * 1.414214;
/*322*/	  r3.x = 0.008727 / r3.x;
/*323*/	  r3.x = max(r3.x, 0.000100);
/*324*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*325*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*326*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*327*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*328*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*329*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*330*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*331*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*332*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*333*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*334*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*335*/	  r3.x = floatBitsToInt(r3.x);
/*336*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*337*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*338*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*339*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*340*/	  r3.x = r3.x * r6.x + 1.000000;
/*341*/	  r3.x = r3.x * 0.500000;
/*342*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*343*/	  r3.y = r3.y * r6.y + 1.000000;
/*344*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*345*/	  r3.y = min(r7.y, 1.000000);
/*346*/	  r2.w = r2.w * 1.570796;
/*347*/	  r2.w = sin(r2.w);
/*348*/	  r3.y = r3.y + -1.000000;
/*349*/	  r2.w = r2.w * r3.y + 1.000000;
/*350*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*351*/	  r3.y = max(r3.y, 0.000000);
/*352*/	  r3.y = log2(r3.y);
/*353*/	  r3.y = r3.y * 10.000000;
/*354*/	  r3.y = exp2(r3.y);
/*355*/	  r3.y = r3.w * r3.y;
/*356*/	  r3.y = r3.y * r5.w + r0.w;
/*357*/	  r2.w = r2.w * abs(r3.x);
/*358*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*359*/	} else {
/*360*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*361*/	}
/*362*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*363*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*364*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*365*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*366*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*367*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*368*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*369*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*370*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*371*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*372*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*373*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*374*/	r2.w = inversesqrt(r2.w);
/*375*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*376*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*377*/	r2.w = r2.w + r2.w;
/*378*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*379*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*380*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*381*/	r2.x = max(r2.x, 0.000000);
/*382*/	r2.x = log2(r2.x);
/*383*/	r2.x = r2.x * 10.000000;
/*384*/	r2.x = exp2(r2.x);
/*385*/	r2.x = r3.w * r2.x;
/*386*/	r0.w = r2.x * r5.w + r0.w;
/*387*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*388*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*389*/	color0.w = 2.000000;
/*390*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*391*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*392*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*393*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*394*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*395*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*396*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*397*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*398*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*399*/	if(r0.x != 0) discard;
/*400*/	color1.x = 1.000000;
/*401*/	return;
}
