//
//
// Shader Model 4
// Fragment Shader
//
// id: 7091 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_weighted_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*50*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*51*/	if(r1.w != 0) discard;
/*52*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*53*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*54*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*55*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*56*/	r1.w = saturate(-r1.w + r4.w);
/*57*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*58*/	if(floatBitsToUint(r1.w) != 0u) {
/*59*/	  r1.w = -r4.w + 1.000000;
/*60*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*61*/	  r1.w = -r1.w + 1.000000;
/*62*/	  r1.w = -r1.w * r1.w + 1.000000;
/*63*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*64*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*65*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*66*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*67*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*68*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*69*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*70*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*71*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*72*/	} else {
/*73*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*74*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*75*/	}
/*76*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*78*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*79*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*80*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*81*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*82*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*83*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*84*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*85*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*86*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*87*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*88*/	r1.w = inversesqrt(r1.w);
/*89*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*90*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*91*/	r1.w = inversesqrt(r1.w);
/*92*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*93*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*94*/	r1.w = inversesqrt(r1.w);
/*95*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*96*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*97*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*98*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*99*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*100*/	r1.w = inversesqrt(r1.w);
/*101*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*102*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*103*/	r4.w = 1.000000;
/*104*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*105*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*106*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*107*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*108*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*109*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*110*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*111*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*112*/	r3.x = intBitsToFloat(int(r2.w));
/*113*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*114*/	if(floatBitsToUint(r3.z) != 0u) {
/*115*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*116*/	  r5.w = vsOut_T0.w;
/*117*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*118*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*119*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*120*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*121*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*122*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*123*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*124*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*125*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*126*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*127*/	  if(floatBitsToUint(r3.w) == 0u) {
/*128*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*129*/	    r7.xy = floor((r6.xyxx).xy);
/*130*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*131*/	    r3.z = -0.000400 / r3.z;
/*132*/	    r3.z = r3.z + r6.z;
/*133*/	    r8.z = -r8.y + 1.000000;
/*134*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*135*/	    r8.w = -r8.y;
/*136*/	    r10.x = cb1.data[0].z/**/;
/*137*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*138*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*139*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*140*/	    r10.w = -cb1.data[0].w/**/;
/*141*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*142*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*143*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*144*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*145*/	    r8.x = r9.x;
/*146*/	    r8.y = r11.x;
/*147*/	    r8.z = r10.x;
/*148*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*149*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*150*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*151*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*152*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*153*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*154*/	    r3.z = -r6.x + r6.y;
/*155*/	    r3.z = r3.w * r3.z + r6.x;
/*156*/	  } else {
/*157*/	    r3.z = 1.000000;
/*158*/	  }
/*159*/	} else {
/*160*/	  r3.z = 1.000000;
/*161*/	}
/*162*/	r3.w = cb1.data[34].w + -1.000000;
/*163*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*164*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*165*/	if(floatBitsToUint(r2.w) == 0u) {
/*166*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*167*/	  r2.w = floatBitsToInt(r2.w);
/*168*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*169*/	  if(floatBitsToUint(r2.w) != 0u) {
/*170*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*171*/	    r5.w = vsOut_T0.w;
/*172*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*173*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*174*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*175*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*176*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*177*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*178*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*179*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*180*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*181*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*182*/	    if(floatBitsToUint(r5.w) == 0u) {
/*183*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*184*/	      r6.xy = floor((r5.xyxx).xy);
/*185*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*186*/	      r2.w = -0.000400 / r2.w;
/*187*/	      r2.w = r2.w + r5.z;
/*188*/	      r7.z = -r7.y + 1.000000;
/*189*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*190*/	      r7.w = -r7.y;
/*191*/	      r9.x = cb1.data[0].z/**/;
/*192*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*193*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*194*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*195*/	      r9.w = -cb1.data[0].w/**/;
/*196*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*197*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*198*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*199*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*200*/	      r7.x = r8.x;
/*201*/	      r7.y = r10.x;
/*202*/	      r7.z = r9.x;
/*203*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*204*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*205*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*206*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*207*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*208*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*209*/	      r2.w = -r5.x + r5.z;
/*210*/	      r2.w = r5.y * r2.w + r5.x;
/*211*/	    } else {
/*212*/	      r2.w = 1.000000;
/*213*/	    }
/*214*/	  } else {
/*215*/	    r2.w = 1.000000;
/*216*/	  }
/*217*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*218*/	  r5.y = r5.x * cb1.data[34].x;
/*219*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*220*/	  r5.x = r1.w + -r5.x;
/*221*/	  r5.x = saturate(r5.x / r5.y);
/*222*/	  r2.w = -r3.z + r2.w;
/*223*/	  r3.z = r5.x * r2.w + r3.z;
/*224*/	}
/*225*/	if(floatBitsToUint(r3.w) != 0u) {
/*226*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*227*/	  r3.w = r2.w * cb1.data[34].y;
/*228*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*229*/	  r2.w = r1.w + -r2.w;
/*230*/	  r2.w = saturate(r2.w / r3.w);
/*231*/	  r3.x = -r3.z + 1.000000;
/*232*/	  r3.z = r2.w * r3.x + r3.z;
/*233*/	}
/*234*/	r3.z = saturate(r3.z);
/*235*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*236*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*237*/	r2.w = inversesqrt(r2.w);
/*238*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*239*/	r2.w = -r3.y + 1.000000;
/*240*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*241*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*242*/	r3.w = r3.w + r3.w;
/*243*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*244*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*245*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*246*/	r3.w = cos((r8.x));
/*247*/	r3.w = inversesqrt(r3.w);
/*248*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*249*/	r5.w = saturate(r0.w * 60.000000);
/*250*/	r5.w = -r0.w + r5.w;
/*251*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*252*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*253*/	r6.w = inversesqrt(r6.w);
/*254*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*255*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*256*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*257*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*258*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*259*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*260*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*261*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*262*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*263*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*264*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*265*/	r6.w = -r0.w + 1.000000;
/*266*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*267*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*268*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*269*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*270*/	  r6.w = max(r6.w, 0.000000);
/*271*/	  r6.w = log2(r6.w);
/*272*/	  r6.w = r6.w * 10.000000;
/*273*/	  r6.w = exp2(r6.w);
/*274*/	  r6.w = r3.w * r6.w;
/*275*/	  r6.w = r6.w * r5.w + r0.w;
/*276*/	  r7.y = r2.w * 8.000000;
/*277*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*278*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*279*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*280*/	}
/*281*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*282*/	r7.y = max(r6.w, 0.000000);
/*283*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*284*/	if(floatBitsToUint(r6.w) != 0u) {
/*285*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*286*/	  r6.x = max(r6.x, -1.000000);
/*287*/	  r6.x = min(r6.x, 1.000000);
/*288*/	  r6.y = -abs(r6.x) + 1.000000;
/*289*/	  r6.y = sqrt(r6.y);
/*290*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*291*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*292*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*293*/	  r6.w = r6.y * r6.z;
/*294*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*295*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*296*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*297*/	  r6.x = r6.z * r6.y + r6.x;
/*298*/	  r3.y = r3.y * r3.y;
/*299*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*300*/	  r3.x = r3.y * r3.x + r7.x;
/*301*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*302*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*303*/	  r3.y = -r3.x * r3.x + 1.000000;
/*304*/	  r3.y = max(r3.y, 0.001000);
/*305*/	  r3.y = log2(r3.y);
/*306*/	  r6.y = r3.y * 4.950617;
/*307*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*308*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*309*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*310*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*311*/	  r3.x = floatBitsToInt(r3.x);
/*312*/	  r6.y = r3.y * r3.y + -r6.y;
/*313*/	  r6.y = sqrt(r6.y);
/*314*/	  r3.y = -r3.y + r6.y;
/*315*/	  r3.y = max(r3.y, 0.000000);
/*316*/	  r3.y = sqrt(r3.y);
/*317*/	  r3.x = r3.y * r3.x;
/*318*/	  r3.x = r3.x * 1.414214;
/*319*/	  r3.x = 0.008727 / r3.x;
/*320*/	  r3.x = max(r3.x, 0.000100);
/*321*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*322*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*323*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*324*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*325*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*326*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*327*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*328*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*329*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*330*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*331*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*332*/	  r3.x = floatBitsToInt(r3.x);
/*333*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*334*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*335*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*336*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*337*/	  r3.x = r3.x * r6.x + 1.000000;
/*338*/	  r3.x = r3.x * 0.500000;
/*339*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*340*/	  r3.y = r3.y * r6.y + 1.000000;
/*341*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*342*/	  r3.y = min(r7.y, 1.000000);
/*343*/	  r2.w = r2.w * 1.570796;
/*344*/	  r2.w = sin(r2.w);
/*345*/	  r3.y = r3.y + -1.000000;
/*346*/	  r2.w = r2.w * r3.y + 1.000000;
/*347*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*348*/	  r3.y = max(r3.y, 0.000000);
/*349*/	  r3.y = log2(r3.y);
/*350*/	  r3.y = r3.y * 10.000000;
/*351*/	  r3.y = exp2(r3.y);
/*352*/	  r3.y = r3.w * r3.y;
/*353*/	  r3.y = r3.y * r5.w + r0.w;
/*354*/	  r2.w = r2.w * abs(r3.x);
/*355*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*356*/	} else {
/*357*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*358*/	}
/*359*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*360*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*361*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*362*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*363*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*364*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*365*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*366*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*367*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*368*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*369*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*370*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*371*/	r2.w = inversesqrt(r2.w);
/*372*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*373*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*374*/	r2.w = r2.w + r2.w;
/*375*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*376*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*377*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*378*/	r2.x = max(r2.x, 0.000000);
/*379*/	r2.x = log2(r2.x);
/*380*/	r2.x = r2.x * 10.000000;
/*381*/	r2.x = exp2(r2.x);
/*382*/	r2.x = r3.w * r2.x;
/*383*/	r0.w = r2.x * r5.w + r0.w;
/*384*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*385*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*386*/	color0.w = 2.000000;
/*387*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*388*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*389*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*390*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*391*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*392*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*393*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*394*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*395*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*396*/	if(r0.x != 0) discard;
/*397*/	color1.x = 1.000000;
/*398*/	return;
}
