//
//
// Shader Model 4
// Fragment Shader
//
// id: 7143 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtburn.hlsl_PS_ps40_weighted_forward_lighting_HDR.glsl
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
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D sHardShadowBuffer;

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
/*60*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*62*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*63*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*64*/	r0.w = r4.w * r5.w;
/*65*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*66*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*67*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*68*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*69*/	r1.w = inversesqrt(r1.w);
/*70*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*71*/	r4.xyz = (r0.wwww * r1.xyzx).xyz;
/*72*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*73*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*74*/	r4.x = r3.z;
/*75*/	r4.y = cb0.data[26].x * 0.050000 + r3.w;
/*76*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*77*/	r5.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*78*/	r0.w = saturate(r4.x * 5.000000);
/*79*/	r4.xyz = (r0.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*80*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*81*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*82*/	r1.w = log2(r5.z);
/*83*/	r1.w = r1.w * 1.800000;
/*84*/	r1.w = exp2(r1.w);
/*85*/	r1.w = r1.w * 10.000000;
/*86*/	r1.w = min(r1.w, 1.000000);
/*87*/	r0.w = r0.w + r1.w;
/*88*/	r0.w = r0.w * 0.500000;
/*89*/	r1.w = -r5.w + 1.000000;
/*90*/	r1.w = log2(r1.w);
/*91*/	r1.w = r1.w * vsOut_T7.z;
/*92*/	r1.w = exp2(r1.w);
/*93*/	r1.w = min(r1.w, 1.000000);
/*94*/	r1.w = r1.w * vsOut_T7.z;
/*95*/	r2.w = r5.z * 0.250000;
/*96*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r2.wwww).xyz;
/*97*/	r4.xyz = (r0.wwww * r4.xyzx + r2.wwww).xyz;
/*98*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*99*/	r0.xyz = (r1.wwww * r4.xyzx + r0.xyzx).xyz;
/*100*/	r0.w = vsOut_T7.z + -0.025000;
/*101*/	r0.w = max(r0.w, 0.000000);
/*102*/	r4.xyz = (r5.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*103*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*104*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*105*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*106*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*107*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*108*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*109*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*110*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*111*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*112*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*113*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*114*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*115*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*116*/	r1.w = inversesqrt(r1.w);
/*117*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*118*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*119*/	r1.w = inversesqrt(r1.w);
/*120*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*121*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*122*/	r1.w = inversesqrt(r1.w);
/*123*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*124*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*125*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*126*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*127*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*128*/	r1.w = inversesqrt(r1.w);
/*129*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*130*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*131*/	r4.w = 1.000000;
/*132*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*133*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*134*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*135*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*136*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*137*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*138*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*139*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*140*/	r3.x = intBitsToFloat(int(r2.w));
/*141*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*142*/	if(floatBitsToUint(r3.z) != 0u) {
/*143*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*144*/	  r5.w = vsOut_T0.w;
/*145*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*146*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*147*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*148*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*149*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*150*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*151*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*152*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*153*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*154*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*155*/	  if(floatBitsToUint(r3.w) == 0u) {
/*156*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*157*/	    r7.xy = floor((r6.xyxx).xy);
/*158*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*159*/	    r3.z = -0.000400 / r3.z;
/*160*/	    r3.z = r3.z + r6.z;
/*161*/	    r8.z = -r8.y + 1.000000;
/*162*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*163*/	    r8.w = -r8.y;
/*164*/	    r10.x = cb1.data[0].z/**/;
/*165*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*166*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*167*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*168*/	    r10.w = -cb1.data[0].w/**/;
/*169*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*170*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*171*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*172*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*173*/	    r8.x = r9.x;
/*174*/	    r8.y = r11.x;
/*175*/	    r8.z = r10.x;
/*176*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*177*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*178*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*179*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*180*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*181*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*182*/	    r3.z = -r6.x + r6.y;
/*183*/	    r3.z = r3.w * r3.z + r6.x;
/*184*/	  } else {
/*185*/	    r3.z = 1.000000;
/*186*/	  }
/*187*/	} else {
/*188*/	  r3.z = 1.000000;
/*189*/	}
/*190*/	r3.w = cb1.data[34].w + -1.000000;
/*191*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*192*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*193*/	if(floatBitsToUint(r2.w) == 0u) {
/*194*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*195*/	  r2.w = floatBitsToInt(r2.w);
/*196*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*197*/	  if(floatBitsToUint(r2.w) != 0u) {
/*198*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*199*/	    r5.w = vsOut_T0.w;
/*200*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*201*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*202*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*203*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*204*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*205*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*206*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*207*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*208*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*209*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*210*/	    if(floatBitsToUint(r5.w) == 0u) {
/*211*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*212*/	      r6.xy = floor((r5.xyxx).xy);
/*213*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*214*/	      r2.w = -0.000400 / r2.w;
/*215*/	      r2.w = r2.w + r5.z;
/*216*/	      r7.z = -r7.y + 1.000000;
/*217*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*218*/	      r7.w = -r7.y;
/*219*/	      r9.x = cb1.data[0].z/**/;
/*220*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*221*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*222*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*223*/	      r9.w = -cb1.data[0].w/**/;
/*224*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*225*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*226*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*227*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*228*/	      r7.x = r8.x;
/*229*/	      r7.y = r10.x;
/*230*/	      r7.z = r9.x;
/*231*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*232*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*233*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*234*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*235*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*236*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*237*/	      r2.w = -r5.x + r5.z;
/*238*/	      r2.w = r5.y * r2.w + r5.x;
/*239*/	    } else {
/*240*/	      r2.w = 1.000000;
/*241*/	    }
/*242*/	  } else {
/*243*/	    r2.w = 1.000000;
/*244*/	  }
/*245*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*246*/	  r5.y = r5.x * cb1.data[34].x;
/*247*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*248*/	  r5.x = r1.w + -r5.x;
/*249*/	  r5.x = saturate(r5.x / r5.y);
/*250*/	  r2.w = -r3.z + r2.w;
/*251*/	  r3.z = r5.x * r2.w + r3.z;
/*252*/	}
/*253*/	if(floatBitsToUint(r3.w) != 0u) {
/*254*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*255*/	  r3.w = r2.w * cb1.data[34].y;
/*256*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*257*/	  r2.w = r1.w + -r2.w;
/*258*/	  r2.w = saturate(r2.w / r3.w);
/*259*/	  r3.x = -r3.z + 1.000000;
/*260*/	  r3.z = r2.w * r3.x + r3.z;
/*261*/	}
/*262*/	r3.z = saturate(r3.z);
/*263*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*264*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*265*/	r2.w = inversesqrt(r2.w);
/*266*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*267*/	r2.w = -r3.y + 1.000000;
/*268*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*269*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*270*/	r3.w = r3.w + r3.w;
/*271*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*272*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*273*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*274*/	r3.w = cos((r8.x));
/*275*/	r3.w = inversesqrt(r3.w);
/*276*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*277*/	r5.w = saturate(r0.w * 60.000000);
/*278*/	r5.w = -r0.w + r5.w;
/*279*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*280*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*281*/	r6.w = inversesqrt(r6.w);
/*282*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*283*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*284*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*285*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*286*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*287*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*288*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*289*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*290*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*291*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*292*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*293*/	r6.w = -r0.w + 1.000000;
/*294*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*295*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*296*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*297*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*298*/	  r6.w = max(r6.w, 0.000000);
/*299*/	  r6.w = log2(r6.w);
/*300*/	  r6.w = r6.w * 10.000000;
/*301*/	  r6.w = exp2(r6.w);
/*302*/	  r6.w = r3.w * r6.w;
/*303*/	  r6.w = r6.w * r5.w + r0.w;
/*304*/	  r7.y = r2.w * 8.000000;
/*305*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*306*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*307*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*308*/	}
/*309*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*310*/	r7.y = max(r6.w, 0.000000);
/*311*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*312*/	if(floatBitsToUint(r6.w) != 0u) {
/*313*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*314*/	  r6.x = max(r6.x, -1.000000);
/*315*/	  r6.x = min(r6.x, 1.000000);
/*316*/	  r6.y = -abs(r6.x) + 1.000000;
/*317*/	  r6.y = sqrt(r6.y);
/*318*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*319*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*320*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*321*/	  r6.w = r6.y * r6.z;
/*322*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*323*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*324*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*325*/	  r6.x = r6.z * r6.y + r6.x;
/*326*/	  r3.y = r3.y * r3.y;
/*327*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*328*/	  r3.x = r3.y * r3.x + r7.x;
/*329*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*330*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*331*/	  r3.y = -r3.x * r3.x + 1.000000;
/*332*/	  r3.y = max(r3.y, 0.001000);
/*333*/	  r3.y = log2(r3.y);
/*334*/	  r6.y = r3.y * 4.950617;
/*335*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*336*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*337*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*338*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*339*/	  r3.x = floatBitsToInt(r3.x);
/*340*/	  r6.y = r3.y * r3.y + -r6.y;
/*341*/	  r6.y = sqrt(r6.y);
/*342*/	  r3.y = -r3.y + r6.y;
/*343*/	  r3.y = max(r3.y, 0.000000);
/*344*/	  r3.y = sqrt(r3.y);
/*345*/	  r3.x = r3.y * r3.x;
/*346*/	  r3.x = r3.x * 1.414214;
/*347*/	  r3.x = 0.008727 / r3.x;
/*348*/	  r3.x = max(r3.x, 0.000100);
/*349*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*350*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*351*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*352*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*353*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*354*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*355*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*356*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*357*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*358*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*359*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*360*/	  r3.x = floatBitsToInt(r3.x);
/*361*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*362*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*363*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*364*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*365*/	  r3.x = r3.x * r6.x + 1.000000;
/*366*/	  r3.x = r3.x * 0.500000;
/*367*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*368*/	  r3.y = r3.y * r6.y + 1.000000;
/*369*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*370*/	  r3.y = min(r7.y, 1.000000);
/*371*/	  r2.w = r2.w * 1.570796;
/*372*/	  r2.w = sin(r2.w);
/*373*/	  r3.y = r3.y + -1.000000;
/*374*/	  r2.w = r2.w * r3.y + 1.000000;
/*375*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*376*/	  r3.y = max(r3.y, 0.000000);
/*377*/	  r3.y = log2(r3.y);
/*378*/	  r3.y = r3.y * 10.000000;
/*379*/	  r3.y = exp2(r3.y);
/*380*/	  r3.y = r3.w * r3.y;
/*381*/	  r3.y = r3.y * r5.w + r0.w;
/*382*/	  r2.w = r2.w * abs(r3.x);
/*383*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*384*/	} else {
/*385*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*386*/	}
/*387*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*388*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*389*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*390*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*391*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*392*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*393*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*394*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*395*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*396*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*397*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*398*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*399*/	r2.w = inversesqrt(r2.w);
/*400*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*401*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*402*/	r2.w = r2.w + r2.w;
/*403*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*404*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*405*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*406*/	r2.x = max(r2.x, 0.000000);
/*407*/	r2.x = log2(r2.x);
/*408*/	r2.x = r2.x * 10.000000;
/*409*/	r2.x = exp2(r2.x);
/*410*/	r2.x = r3.w * r2.x;
/*411*/	r0.w = r2.x * r5.w + r0.w;
/*412*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*413*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*414*/	color0.w = 2.000000;
/*415*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*416*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*417*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*418*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*419*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*420*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*421*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*422*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*423*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*424*/	if(r0.x != 0) discard;
/*425*/	color1.x = 1.000000;
/*426*/	return;
}
