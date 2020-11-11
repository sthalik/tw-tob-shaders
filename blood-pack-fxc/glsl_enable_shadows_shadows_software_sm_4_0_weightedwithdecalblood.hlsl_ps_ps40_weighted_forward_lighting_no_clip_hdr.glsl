//
//
// Shader Model 4
// Fragment Shader
//
// id: 6944 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecalblood.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_blood_map;
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;

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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*4*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*5*/	r0.w = saturate(vsOut_P1.w);
/*6*/	r4.xyz = (r4.xyzx + -cb4.data[0].xyzx).xyz;
/*7*/	r4.xyz = (r0.wwww * r4.xyzx + cb4.data[0].xyzx).xyz;
/*8*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_P1.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*9*/	r3.xyw = (r3.xyxw + -cb4.data[1].xyxz).xyw;
/*10*/	r3.xyw = (r0.wwww * r3.xyxw + cb4.data[1].xyxz).xyw;
/*11*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*12*/	r5.xyz = (r5.xyzx + -cb4.data[2].xyzx).xyz;
/*13*/	r5.xyz = (r0.wwww * r5.xyzx + cb4.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*16*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*18*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*19*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*20*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*21*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*24*/	r0.w = -r0.w + 1.000000;
/*25*/	r0.w = max(r0.w, 0.000000);
/*26*/	r2.z = sqrt(r0.w);
/*27*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*28*/	r3.zw = (-cb3.data[3].xxxy + cb3.data[3].zzzw).zw;
/*29*/	r4.xy = (vsOut_T1.xyxx + -cb3.data[3].xyxx).xy;
/*30*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*31*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*32*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*33*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*34*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*35*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*36*/	r4.z = vsOut_T6.z;
/*37*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*38*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*39*/	if(floatBitsToUint(r0.w) != 0u) {
/*40*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*41*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*43*/	  r0.w = -r0.w + 1.000000;
/*44*/	  r0.w = max(r0.w, 0.000000);
/*45*/	  r4.z = sqrt(r0.w);
/*46*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*48*/	  r0.w = r3.x * r7.w;
/*49*/	  r3.x = r0.w * -0.500000 + r3.x;
/*50*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*51*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*52*/	  r0.w = -r5.w * r6.w + 1.000000;
/*53*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*54*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*55*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*56*/	}
/*57*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*58*/	if(r0.w != 0) discard;
/*59*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*60*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*61*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*62*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*63*/	r0.w = saturate(-r0.w + r4.w);
/*64*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r0.w) != 0u) {
/*66*/	  r0.w = -r4.w + 1.000000;
/*67*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*68*/	  r0.w = -r0.w + 1.000000;
/*69*/	  r0.w = -r0.w * r0.w + 1.000000;
/*70*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*71*/	  r4.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*72*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*73*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*74*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*75*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*76*/	  r0.xyz = (r0.wwww * r5.xyzx + r4.xyzx).xyz;
/*77*/	  r1.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*78*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*79*/	}
/*80*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*81*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*82*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*83*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*84*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*85*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*86*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*87*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*88*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*89*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*90*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*91*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*92*/	r1.w = inversesqrt(r1.w);
/*93*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*94*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*95*/	r1.w = inversesqrt(r1.w);
/*96*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*97*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*98*/	r1.w = inversesqrt(r1.w);
/*99*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*100*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*101*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*102*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*103*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*104*/	r1.w = inversesqrt(r1.w);
/*105*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*106*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*107*/	r4.w = 1.000000;
/*108*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*109*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*110*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*111*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*112*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*113*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*114*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*115*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*116*/	r3.x = intBitsToFloat(int(r2.w));
/*117*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*118*/	if(floatBitsToUint(r3.z) != 0u) {
/*119*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*120*/	  r5.w = vsOut_T0.w;
/*121*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*122*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*123*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*124*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*125*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*126*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*127*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*128*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*129*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*130*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*131*/	  if(floatBitsToUint(r3.w) == 0u) {
/*132*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*133*/	    r7.xy = floor((r6.xyxx).xy);
/*134*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*135*/	    r3.z = -0.000400 / r3.z;
/*136*/	    r3.z = r3.z + r6.z;
/*137*/	    r8.z = -r8.y + 1.000000;
/*138*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*139*/	    r8.w = -r8.y;
/*140*/	    r10.x = cb1.data[0].z/**/;
/*141*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*142*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*143*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*144*/	    r10.w = -cb1.data[0].w/**/;
/*145*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*146*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*147*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*148*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*149*/	    r8.x = r9.x;
/*150*/	    r8.y = r11.x;
/*151*/	    r8.z = r10.x;
/*152*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*153*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*154*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*155*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*156*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*157*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*158*/	    r3.z = -r6.x + r6.y;
/*159*/	    r3.z = r3.w * r3.z + r6.x;
/*160*/	  } else {
/*161*/	    r3.z = 1.000000;
/*162*/	  }
/*163*/	} else {
/*164*/	  r3.z = 1.000000;
/*165*/	}
/*166*/	r3.w = cb1.data[34].w + -1.000000;
/*167*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*168*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*169*/	if(floatBitsToUint(r2.w) == 0u) {
/*170*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*171*/	  r2.w = floatBitsToInt(r2.w);
/*172*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*173*/	  if(floatBitsToUint(r2.w) != 0u) {
/*174*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*175*/	    r5.w = vsOut_T0.w;
/*176*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*177*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*178*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*179*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*180*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*181*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*182*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*183*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*184*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*185*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*186*/	    if(floatBitsToUint(r5.w) == 0u) {
/*187*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*188*/	      r6.xy = floor((r5.xyxx).xy);
/*189*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*190*/	      r2.w = -0.000400 / r2.w;
/*191*/	      r2.w = r2.w + r5.z;
/*192*/	      r7.z = -r7.y + 1.000000;
/*193*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*194*/	      r7.w = -r7.y;
/*195*/	      r9.x = cb1.data[0].z/**/;
/*196*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*197*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*198*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*199*/	      r9.w = -cb1.data[0].w/**/;
/*200*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*201*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*202*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*203*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*204*/	      r7.x = r8.x;
/*205*/	      r7.y = r10.x;
/*206*/	      r7.z = r9.x;
/*207*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*208*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*209*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*210*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*211*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*212*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*213*/	      r2.w = -r5.x + r5.z;
/*214*/	      r2.w = r5.y * r2.w + r5.x;
/*215*/	    } else {
/*216*/	      r2.w = 1.000000;
/*217*/	    }
/*218*/	  } else {
/*219*/	    r2.w = 1.000000;
/*220*/	  }
/*221*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*222*/	  r5.y = r5.x * cb1.data[34].x;
/*223*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*224*/	  r5.x = r1.w + -r5.x;
/*225*/	  r5.x = saturate(r5.x / r5.y);
/*226*/	  r2.w = -r3.z + r2.w;
/*227*/	  r3.z = r5.x * r2.w + r3.z;
/*228*/	}
/*229*/	if(floatBitsToUint(r3.w) != 0u) {
/*230*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*231*/	  r3.w = r2.w * cb1.data[34].y;
/*232*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*233*/	  r2.w = r1.w + -r2.w;
/*234*/	  r2.w = saturate(r2.w / r3.w);
/*235*/	  r3.x = -r3.z + 1.000000;
/*236*/	  r3.z = r2.w * r3.x + r3.z;
/*237*/	}
/*238*/	r3.z = saturate(r3.z);
/*239*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*240*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*241*/	r2.w = inversesqrt(r2.w);
/*242*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*243*/	r2.w = -r3.y + 1.000000;
/*244*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*245*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*246*/	r3.w = r3.w + r3.w;
/*247*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*248*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*249*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*250*/	r3.w = cos((r8.x));
/*251*/	r3.w = inversesqrt(r3.w);
/*252*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*253*/	r5.w = saturate(r0.w * 60.000000);
/*254*/	r5.w = -r0.w + r5.w;
/*255*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*256*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*257*/	r6.w = inversesqrt(r6.w);
/*258*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*259*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*260*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*261*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*262*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*263*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*264*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*265*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*266*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*267*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*268*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*269*/	r6.w = -r0.w + 1.000000;
/*270*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*271*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*272*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*273*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*274*/	  r6.w = max(r6.w, 0.000000);
/*275*/	  r6.w = log2(r6.w);
/*276*/	  r6.w = r6.w * 10.000000;
/*277*/	  r6.w = exp2(r6.w);
/*278*/	  r6.w = r3.w * r6.w;
/*279*/	  r6.w = r6.w * r5.w + r0.w;
/*280*/	  r7.y = r2.w * 8.000000;
/*281*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*282*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*283*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*284*/	}
/*285*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*286*/	r7.y = max(r6.w, 0.000000);
/*287*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*288*/	if(floatBitsToUint(r6.w) != 0u) {
/*289*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*290*/	  r6.x = max(r6.x, -1.000000);
/*291*/	  r6.x = min(r6.x, 1.000000);
/*292*/	  r6.y = -abs(r6.x) + 1.000000;
/*293*/	  r6.y = sqrt(r6.y);
/*294*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*295*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*296*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*297*/	  r6.w = r6.y * r6.z;
/*298*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*299*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*300*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*301*/	  r6.x = r6.z * r6.y + r6.x;
/*302*/	  r3.y = r3.y * r3.y;
/*303*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*304*/	  r3.x = r3.y * r3.x + r7.x;
/*305*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*306*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*307*/	  r3.y = -r3.x * r3.x + 1.000000;
/*308*/	  r3.y = max(r3.y, 0.001000);
/*309*/	  r3.y = log2(r3.y);
/*310*/	  r6.y = r3.y * 4.950617;
/*311*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*312*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*313*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*314*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*315*/	  r3.x = floatBitsToInt(r3.x);
/*316*/	  r6.y = r3.y * r3.y + -r6.y;
/*317*/	  r6.y = sqrt(r6.y);
/*318*/	  r3.y = -r3.y + r6.y;
/*319*/	  r3.y = max(r3.y, 0.000000);
/*320*/	  r3.y = sqrt(r3.y);
/*321*/	  r3.x = r3.y * r3.x;
/*322*/	  r3.x = r3.x * 1.414214;
/*323*/	  r3.x = 0.008727 / r3.x;
/*324*/	  r3.x = max(r3.x, 0.000100);
/*325*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*326*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*327*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*328*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*329*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*330*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*331*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*332*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*333*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*334*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*335*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*336*/	  r3.x = floatBitsToInt(r3.x);
/*337*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*338*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*339*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*340*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*341*/	  r3.x = r3.x * r6.x + 1.000000;
/*342*/	  r3.x = r3.x * 0.500000;
/*343*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*344*/	  r3.y = r3.y * r6.y + 1.000000;
/*345*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*346*/	  r3.y = min(r7.y, 1.000000);
/*347*/	  r2.w = r2.w * 1.570796;
/*348*/	  r2.w = sin(r2.w);
/*349*/	  r3.y = r3.y + -1.000000;
/*350*/	  r2.w = r2.w * r3.y + 1.000000;
/*351*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*352*/	  r3.y = max(r3.y, 0.000000);
/*353*/	  r3.y = log2(r3.y);
/*354*/	  r3.y = r3.y * 10.000000;
/*355*/	  r3.y = exp2(r3.y);
/*356*/	  r3.y = r3.w * r3.y;
/*357*/	  r3.y = r3.y * r5.w + r0.w;
/*358*/	  r2.w = r2.w * abs(r3.x);
/*359*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*360*/	} else {
/*361*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*362*/	}
/*363*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*364*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*365*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*366*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*367*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*368*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*369*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*370*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*371*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*372*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*373*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*374*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*375*/	r2.w = inversesqrt(r2.w);
/*376*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*377*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*378*/	r2.w = r2.w + r2.w;
/*379*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*380*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*381*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*382*/	r2.x = max(r2.x, 0.000000);
/*383*/	r2.x = log2(r2.x);
/*384*/	r2.x = r2.x * 10.000000;
/*385*/	r2.x = exp2(r2.x);
/*386*/	r2.x = r3.w * r2.x;
/*387*/	r0.w = r2.x * r5.w + r0.w;
/*388*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*389*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*390*/	color0.w = 2.000000;
/*391*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*392*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*393*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*394*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*395*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*396*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*397*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*398*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*399*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*400*/	if(r0.x != 0) discard;
/*401*/	color1.x = 1.000000;
/*402*/	return;
}
