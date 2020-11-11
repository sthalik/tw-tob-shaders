//
//
// Shader Model 4
// Fragment Shader
//
// id: 7087 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_weighted_forward_lighting_no_clip_HDR.glsl
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
uniform samplerCube s_environment;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*57*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*58*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*59*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*60*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*61*/	r0.w = r4.w * r5.w;
/*62*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*63*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*64*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*65*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*66*/	r1.w = inversesqrt(r1.w);
/*67*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*68*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*69*/	if(r1.w != 0) discard;
/*70*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*71*/	r3.zw = (r3.zzzw * cb3.data[2].xxxy + vsOut_T6.xxxy).zw;
/*72*/	r4.xyzw = (texture(s_decal_blood_map, r3.zwzz.st)).xyzw;
/*73*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*74*/	r1.w = saturate(-r1.w + r4.w);
/*75*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r1.w) != 0u) {
/*77*/	  r1.w = -r4.w + 1.000000;
/*78*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*79*/	  r1.w = -r1.w + 1.000000;
/*80*/	  r1.w = -r1.w * r1.w + 1.000000;
/*81*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*82*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*83*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*84*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*85*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*86*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*87*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*88*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*89*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*90*/	} else {
/*91*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*92*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*93*/	}
/*94*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*95*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*96*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*97*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*98*/	r1.xyz = (-r4.xyzx + r0.wwww).xyz;
/*99*/	r1.xyz = (vsOut_T7.yyyy * r1.xyzx + r4.xyzx).xyz;
/*100*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*101*/	r0.w = vsOut_T7.x * -r0.w + r0.w;
/*102*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*103*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*104*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*105*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*106*/	r1.w = inversesqrt(r1.w);
/*107*/	r3.xzw = (r1.wwww * vsOut_T3.xxyz).xzw;
/*108*/	r1.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*109*/	r1.w = inversesqrt(r1.w);
/*110*/	r4.xyz = (r1.wwww * vsOut_T5.xyzx).xyz;
/*111*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*112*/	r1.w = inversesqrt(r1.w);
/*113*/	r5.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*114*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*115*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*116*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*117*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*118*/	r1.w = inversesqrt(r1.w);
/*119*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*120*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*121*/	r4.w = 1.000000;
/*122*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*123*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*124*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*125*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*126*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*127*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*128*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*129*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*130*/	r3.x = intBitsToFloat(int(r2.w));
/*131*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*132*/	if(floatBitsToUint(r3.z) != 0u) {
/*133*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*134*/	  r5.w = vsOut_T0.w;
/*135*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*136*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*137*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*138*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*139*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*140*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.x)+41u].xyxx)) * 0xffffffffu)).xy;
/*141*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*142*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*143*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*144*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*145*/	  if(floatBitsToUint(r3.w) == 0u) {
/*146*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*147*/	    r7.xy = floor((r6.xyxx).xy);
/*148*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*149*/	    r3.z = -0.000400 / r3.z;
/*150*/	    r3.z = r3.z + r6.z;
/*151*/	    r8.z = -r8.y + 1.000000;
/*152*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*153*/	    r8.w = -r8.y;
/*154*/	    r10.x = cb1.data[0].z/**/;
/*155*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*156*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*157*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*158*/	    r10.w = -cb1.data[0].w/**/;
/*159*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*160*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*161*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*162*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*163*/	    r8.x = r9.x;
/*164*/	    r8.y = r11.x;
/*165*/	    r8.z = r10.x;
/*166*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*167*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*168*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*169*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*170*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*171*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*172*/	    r3.z = -r6.x + r6.y;
/*173*/	    r3.z = r3.w * r3.z + r6.x;
/*174*/	  } else {
/*175*/	    r3.z = 1.000000;
/*176*/	  }
/*177*/	} else {
/*178*/	  r3.z = 1.000000;
/*179*/	}
/*180*/	r3.w = cb1.data[34].w + -1.000000;
/*181*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*182*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*183*/	if(floatBitsToUint(r2.w) == 0u) {
/*184*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*185*/	  r2.w = floatBitsToInt(r2.w);
/*186*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*187*/	  if(floatBitsToUint(r2.w) != 0u) {
/*188*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.x) << int(2));
/*189*/	    r5.w = vsOut_T0.w;
/*190*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*191*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*192*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*193*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*194*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*195*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.x)+42u].xyxx)) * 0xffffffffu)).xy;
/*196*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*197*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.x)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*198*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*199*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*200*/	    if(floatBitsToUint(r5.w) == 0u) {
/*201*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*202*/	      r6.xy = floor((r5.xyxx).xy);
/*203*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*204*/	      r2.w = -0.000400 / r2.w;
/*205*/	      r2.w = r2.w + r5.z;
/*206*/	      r7.z = -r7.y + 1.000000;
/*207*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*208*/	      r7.w = -r7.y;
/*209*/	      r9.x = cb1.data[0].z/**/;
/*210*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*211*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*212*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*213*/	      r9.w = -cb1.data[0].w/**/;
/*214*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*215*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*216*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*217*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*218*/	      r7.x = r8.x;
/*219*/	      r7.y = r10.x;
/*220*/	      r7.z = r9.x;
/*221*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*222*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*223*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*224*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*225*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*226*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*227*/	      r2.w = -r5.x + r5.z;
/*228*/	      r2.w = r5.y * r2.w + r5.x;
/*229*/	    } else {
/*230*/	      r2.w = 1.000000;
/*231*/	    }
/*232*/	  } else {
/*233*/	    r2.w = 1.000000;
/*234*/	  }
/*235*/	  r5.x = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*236*/	  r5.y = r5.x * cb1.data[34].x;
/*237*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*238*/	  r5.x = r1.w + -r5.x;
/*239*/	  r5.x = saturate(r5.x / r5.y);
/*240*/	  r2.w = -r3.z + r2.w;
/*241*/	  r3.z = r5.x * r2.w + r3.z;
/*242*/	}
/*243*/	if(floatBitsToUint(r3.w) != 0u) {
/*244*/	  r2.w = -cb1.data[floatBitsToUint(r3.x)+36u].x + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*245*/	  r3.w = r2.w * cb1.data[34].y;
/*246*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.x)+37u].x;
/*247*/	  r2.w = r1.w + -r2.w;
/*248*/	  r2.w = saturate(r2.w / r3.w);
/*249*/	  r3.x = -r3.z + 1.000000;
/*250*/	  r3.z = r2.w * r3.x + r3.z;
/*251*/	}
/*252*/	r3.z = saturate(r3.z);
/*253*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*254*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*255*/	r2.w = inversesqrt(r2.w);
/*256*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*257*/	r2.w = -r3.y + 1.000000;
/*258*/	r3.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*259*/	r3.w = dot(vec3(r5.xyzx), vec3(r2.xyzx));
/*260*/	r3.w = r3.w + r3.w;
/*261*/	r6.xyz = (r2.xyzx * -r3.wwww + r5.xyzx).xyz;
/*262*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*263*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*264*/	r3.w = cos((r8.x));
/*265*/	r3.w = inversesqrt(r3.w);
/*266*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*267*/	r5.w = saturate(r0.w * 60.000000);
/*268*/	r5.w = -r0.w + r5.w;
/*269*/	r8.xzw = (r2.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*270*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*271*/	r6.w = inversesqrt(r6.w);
/*272*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*273*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*274*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*275*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*276*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*277*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*278*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*279*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*280*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*281*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*282*/	r8.xzw = (r0.xxyz * r8.xxzw).xzw;
/*283*/	r6.w = -r0.w + 1.000000;
/*284*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*285*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*286*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*287*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*288*/	  r6.w = max(r6.w, 0.000000);
/*289*/	  r6.w = log2(r6.w);
/*290*/	  r6.w = r6.w * 10.000000;
/*291*/	  r6.w = exp2(r6.w);
/*292*/	  r6.w = r3.w * r6.w;
/*293*/	  r6.w = r6.w * r5.w + r0.w;
/*294*/	  r7.y = r2.w * 8.000000;
/*295*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*296*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*297*/	  r8.xzw = (r9.xxyz * r1.xxyz + r8.xxzw).xzw;
/*298*/	}
/*299*/	r6.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*300*/	r7.y = max(r6.w, 0.000000);
/*301*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*302*/	if(floatBitsToUint(r6.w) != 0u) {
/*303*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*304*/	  r6.x = max(r6.x, -1.000000);
/*305*/	  r6.x = min(r6.x, 1.000000);
/*306*/	  r6.y = -abs(r6.x) + 1.000000;
/*307*/	  r6.y = sqrt(r6.y);
/*308*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*309*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*310*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*311*/	  r6.w = r6.y * r6.z;
/*312*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*313*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*314*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*315*/	  r6.x = r6.z * r6.y + r6.x;
/*316*/	  r3.y = r3.y * r3.y;
/*317*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*318*/	  r3.x = r3.y * r3.x + r7.x;
/*319*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*320*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*321*/	  r3.y = -r3.x * r3.x + 1.000000;
/*322*/	  r3.y = max(r3.y, 0.001000);
/*323*/	  r3.y = log2(r3.y);
/*324*/	  r6.y = r3.y * 4.950617;
/*325*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*326*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*327*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*328*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*329*/	  r3.x = floatBitsToInt(r3.x);
/*330*/	  r6.y = r3.y * r3.y + -r6.y;
/*331*/	  r6.y = sqrt(r6.y);
/*332*/	  r3.y = -r3.y + r6.y;
/*333*/	  r3.y = max(r3.y, 0.000000);
/*334*/	  r3.y = sqrt(r3.y);
/*335*/	  r3.x = r3.y * r3.x;
/*336*/	  r3.x = r3.x * 1.414214;
/*337*/	  r3.x = 0.008727 / r3.x;
/*338*/	  r3.x = max(r3.x, 0.000100);
/*339*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*340*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*341*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*342*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*343*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*344*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*345*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*346*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*347*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*348*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*349*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*350*/	  r3.x = floatBitsToInt(r3.x);
/*351*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*352*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*353*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*354*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*355*/	  r3.x = r3.x * r6.x + 1.000000;
/*356*/	  r3.x = r3.x * 0.500000;
/*357*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*358*/	  r3.y = r3.y * r6.y + 1.000000;
/*359*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*360*/	  r3.y = min(r7.y, 1.000000);
/*361*/	  r2.w = r2.w * 1.570796;
/*362*/	  r2.w = sin(r2.w);
/*363*/	  r3.y = r3.y + -1.000000;
/*364*/	  r2.w = r2.w * r3.y + 1.000000;
/*365*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*366*/	  r3.y = max(r3.y, 0.000000);
/*367*/	  r3.y = log2(r3.y);
/*368*/	  r3.y = r3.y * 10.000000;
/*369*/	  r3.y = exp2(r3.y);
/*370*/	  r3.y = r3.w * r3.y;
/*371*/	  r3.y = r3.y * r5.w + r0.w;
/*372*/	  r2.w = r2.w * abs(r3.x);
/*373*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*374*/	} else {
/*375*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*376*/	}
/*377*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*378*/	r6.xyz = (r1.xyzx * r6.xyzx).xyz;
/*379*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*380*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*381*/	r0.xyz = (r0.xyzx * r7.yyyy).xyz;
/*382*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*383*/	r0.xyz = (r5.xyzx * r0.xyzx).xyz;
/*384*/	r0.xyz = (r7.xxxx * r0.xyzx).xyz;
/*385*/	r0.xyz = (r6.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*386*/	r0.xyz = (r3.zzzz * r0.xyzx + r8.xzwx).xyz;
/*387*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*388*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*389*/	r2.w = inversesqrt(r2.w);
/*390*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*391*/	r2.w = dot(vec3(-r3.xyzx), vec3(r2.xyzx));
/*392*/	r2.w = r2.w + r2.w;
/*393*/	r2.xyz = (r2.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*394*/	r6.xyzw = (textureLod(s_environment, r2.xyzx.stp, r8.y)).xyzw;
/*395*/	r2.x = dot(vec3(r2.xyzx), vec3(-r3.xyzx));
/*396*/	r2.x = max(r2.x, 0.000000);
/*397*/	r2.x = log2(r2.x);
/*398*/	r2.x = r2.x * 10.000000;
/*399*/	r2.x = exp2(r2.x);
/*400*/	r2.x = r3.w * r2.x;
/*401*/	r0.w = r2.x * r5.w + r0.w;
/*402*/	r2.xyz = (r6.xyzx * r0.wwww).xyz;
/*403*/	color0.xyz = (r2.xyzx * r1.xyzx + r0.xyzx).xyz;
/*404*/	color0.w = 2.000000;
/*405*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*406*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*407*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*408*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*409*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*410*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*411*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*412*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*413*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*414*/	if(r0.x != 0) discard;
/*415*/	color1.x = 1.000000;
/*416*/	return;
}
