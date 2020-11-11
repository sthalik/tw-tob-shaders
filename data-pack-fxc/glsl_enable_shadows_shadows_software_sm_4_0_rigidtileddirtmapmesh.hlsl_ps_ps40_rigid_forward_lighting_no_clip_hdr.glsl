//
//
// Shader Model 4
// Fragment Shader
//
// id: 4846 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C2;
flat in vec4 vsOut_N0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform samplerCube s_environment;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
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
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*14*/	r0.x = saturate(vsOut_N0.w);
/*15*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
/*23*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*25*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*27*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*28*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*29*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*33*/	r1.w = -r1.w + 1.000000;
/*34*/	r1.w = max(r1.w, 0.000000);
/*35*/	r1.z = sqrt(r1.w);
/*36*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*38*/	r4.w = 1.000000;
/*39*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*40*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*41*/	r5.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*42*/	r6.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*43*/	r2.w = r5.w + -1.000000;
/*44*/	r2.w = r6.x * r2.w + 1.000000;
/*45*/	r2.w = saturate(r2.w * r6.x);
/*46*/	r6.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*47*/	r5.xyz = (r2.wwww * r6.xyzx + r5.xyzx).xyz;
/*48*/	r6.xyz = (r0.xywx * r5.xyzx).xyz;
/*49*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*50*/	r2.w = inversesqrt(r2.w);
/*51*/	r7.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*52*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*53*/	r2.w = inversesqrt(r2.w);
/*54*/	r8.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*55*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*56*/	r2.w = inversesqrt(r2.w);
/*57*/	r9.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*58*/	r10.xyz = (r1.yyyy * r8.xyzx).xyz;
/*59*/	r10.xyz = (r1.xxxx * r7.xyzx + r10.xyzx).xyz;
/*60*/	r1.xyz = (r1.zzzz * r9.xyzx + r10.xyzx).xyz;
/*61*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*64*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*65*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*66*/	if(floatBitsToUint(r0.z) != 0u) {
/*67*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*68*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*69*/	  r0.z = r3.w * cb0.data[26].x;
/*70*/	  r10.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*71*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r10.xxxy).zw;
/*72*/	  r10.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*73*/	  r2.xyz = (r10.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*74*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*75*/	}
/*76*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*77*/	if(floatBitsToUint(r0.z) != 0u) {
/*78*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*79*/	  if(floatBitsToUint(r0.z) != 0u) {
/*80*/	    r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*81*/	    r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*82*/	    r3.zw = (r11.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*83*/	    r11.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*84*/	    r0.z = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*85*/	    r0.z = -r0.z + 1.000000;
/*86*/	    r0.z = max(r0.z, 0.000000);
/*87*/	    r11.z = sqrt(r0.z);
/*88*/	    r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*89*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*90*/	    r0.z = inversesqrt(r0.z);
/*91*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*92*/	    r13.xz = (cb3.data[0].xxyx).xz/**/;
/*93*/	    r13.y = -1.000000;
/*94*/	    r0.z = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*95*/	    r0.z = inversesqrt(r0.z);
/*96*/	    r13.xyz = (r0.zzzz * r13.xyzx).xyz;
/*97*/	    r0.z = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*98*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*99*/	    r2.w = r2.w * 1.250000;
/*100*/	    r2.w = min(r2.w, 1.000000);
/*101*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*102*/	    r3.z = r3.z * 4.000000;
/*103*/	    r2.w = r2.w * 0.200000 + r3.z;
/*104*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*105*/	    r0.z = r0.z + -r2.w;
/*106*/	    r0.z = saturate(r0.z * 200.000000);
/*107*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*108*/	    r0.z = r0.z * r0.z;
/*109*/	    r0.z = r0.z * r2.w;
/*110*/	    r3.x = r0.z * -r3.x + r3.x;
/*111*/	    r2.w = -r3.y + 0.200000;
/*112*/	    r3.y = r0.z * r2.w + r3.y;
/*113*/	    r0.xyw = (-r0.xyxw * r5.xyxz + vec4(0.400000, 0.400000, 0.000000, 0.400000)).xyw;
/*114*/	    r6.xyz = (r0.zzzz * r0.xywx + r6.xyzx).xyz;
/*115*/	    r0.xyw = (-r2.xyxz + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*116*/	    r2.xyz = (r0.zzzz * r0.xywx + r2.xyzx).xyz;
/*117*/	    r5.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*118*/	    r0.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*119*/	    r5.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*120*/	    r0.x = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*121*/	    r0.x = -r0.x + 1.000000;
/*122*/	    r0.x = max(r0.x, 0.000000);
/*123*/	    r5.z = sqrt(r0.x);
/*124*/	    r0.xyw = (r11.xyxz + r11.xyxz).xyw;
/*125*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*126*/	    r2.w = sqrt(r2.w);
/*127*/	    r0.xyw = (r0.xyxw * r2.wwww + r5.xyxz).xyw;
/*128*/	    r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*129*/	    r2.w = inversesqrt(r2.w);
/*130*/	    r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*131*/	    r5.xyz = (r8.xyzx * r0.yyyy).xyz;
/*132*/	    r5.xyz = (r0.xxxx * r7.xyzx + r5.xyzx).xyz;
/*133*/	    r0.xyw = (r0.wwww * r9.xyxz + r5.xyxz).xyw;
/*134*/	    r2.w = -r1.y + 1.000000;
/*135*/	    r0.z = min(r0.z, r2.w);
/*136*/	    r0.xyw = (-r1.xyxz + r0.xyxw).xyw;
/*137*/	    r0.xyz = (r0.zzzz * r0.xywx + r1.xyzx).xyz;
/*138*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*139*/	    r0.w = inversesqrt(r0.w);
/*140*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*141*/	  }
/*142*/	}
/*143*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*144*/	r0.yzw = (r6.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*145*/	r0.yzw = (-r6.xxyz + r0.yyzw).yzw;
/*146*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r6.xxyz).yzw;
/*147*/	r2.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*148*/	r3.yzw = (-r0.yyzw + r2.wwww).yzw;
/*149*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*150*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*151*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*152*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*153*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*154*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*155*/	r2.w = inversesqrt(r2.w);
/*156*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*157*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*158*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*159*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*160*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*161*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*162*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*163*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*164*/	r3.y = intBitsToFloat(int(r2.w));
/*165*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*166*/	if(floatBitsToUint(r3.z) != 0u) {
/*167*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*168*/	  r5.w = vsOut_T0.w;
/*169*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*170*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*171*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*172*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*173*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*174*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*175*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*176*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*177*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*178*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*179*/	  if(floatBitsToUint(r3.w) == 0u) {
/*180*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*181*/	    r7.xy = floor((r6.xyxx).xy);
/*182*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*183*/	    r3.z = -0.000400 / r3.z;
/*184*/	    r3.z = r3.z + r6.z;
/*185*/	    r8.z = -r8.y + 1.000000;
/*186*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*187*/	    r8.w = -r8.y;
/*188*/	    r10.x = cb1.data[0].z/**/;
/*189*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*190*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*191*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*192*/	    r10.w = -cb1.data[0].w/**/;
/*193*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*194*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*195*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*196*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*197*/	    r8.x = r9.x;
/*198*/	    r8.y = r11.x;
/*199*/	    r8.z = r10.x;
/*200*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*201*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*202*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*203*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*204*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*205*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*206*/	    r3.z = -r6.x + r6.y;
/*207*/	    r3.z = r3.w * r3.z + r6.x;
/*208*/	  } else {
/*209*/	    r3.z = 1.000000;
/*210*/	  }
/*211*/	} else {
/*212*/	  r3.z = 1.000000;
/*213*/	}
/*214*/	r3.w = cb1.data[34].w + -1.000000;
/*215*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*216*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*217*/	if(floatBitsToUint(r2.w) == 0u) {
/*218*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*219*/	  r2.w = floatBitsToInt(r2.w);
/*220*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*221*/	  if(floatBitsToUint(r2.w) != 0u) {
/*222*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*223*/	    r5.w = vsOut_T0.w;
/*224*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*225*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*226*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*227*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*228*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*229*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*230*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*231*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*232*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*233*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*234*/	    if(floatBitsToUint(r5.w) == 0u) {
/*235*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*236*/	      r6.xy = floor((r5.xyxx).xy);
/*237*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*238*/	      r2.w = -0.000400 / r2.w;
/*239*/	      r2.w = r2.w + r5.z;
/*240*/	      r7.z = -r7.y + 1.000000;
/*241*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*242*/	      r7.w = -r7.y;
/*243*/	      r9.x = cb1.data[0].z/**/;
/*244*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*245*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*246*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*247*/	      r9.w = -cb1.data[0].w/**/;
/*248*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*249*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*250*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*251*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*252*/	      r7.x = r8.x;
/*253*/	      r7.y = r10.x;
/*254*/	      r7.z = r9.x;
/*255*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*256*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*257*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*258*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*259*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*260*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*261*/	      r2.w = -r5.x + r5.z;
/*262*/	      r2.w = r5.y * r2.w + r5.x;
/*263*/	    } else {
/*264*/	      r2.w = 1.000000;
/*265*/	    }
/*266*/	  } else {
/*267*/	    r2.w = 1.000000;
/*268*/	  }
/*269*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*270*/	  r5.y = r5.x * cb1.data[34].x;
/*271*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*272*/	  r5.x = r1.w + -r5.x;
/*273*/	  r5.x = saturate(r5.x / r5.y);
/*274*/	  r2.w = -r3.z + r2.w;
/*275*/	  r3.z = r5.x * r2.w + r3.z;
/*276*/	}
/*277*/	if(floatBitsToUint(r3.w) != 0u) {
/*278*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*279*/	  r3.w = r2.w * cb1.data[34].y;
/*280*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*281*/	  r2.w = r1.w + -r2.w;
/*282*/	  r2.w = saturate(r2.w / r3.w);
/*283*/	  r3.y = -r3.z + 1.000000;
/*284*/	  r3.z = r2.w * r3.y + r3.z;
/*285*/	}
/*286*/	r3.z = saturate(r3.z);
/*287*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*288*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*289*/	r2.w = inversesqrt(r2.w);
/*290*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*291*/	r2.w = -r3.x + 1.000000;
/*292*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*293*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*294*/	r3.w = r3.w + r3.w;
/*295*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*296*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*297*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*298*/	r3.w = cos((r8.x));
/*299*/	r3.w = inversesqrt(r3.w);
/*300*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*301*/	r5.w = saturate(r0.x * 60.000000);
/*302*/	r5.w = -r0.x + r5.w;
/*303*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*304*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*305*/	r6.w = inversesqrt(r6.w);
/*306*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*307*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*308*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*309*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*310*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*311*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*312*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*313*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*314*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*315*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*316*/	r8.xzw = (r0.yyzw * r8.xxzw).xzw;
/*317*/	r6.w = -r0.x + 1.000000;
/*318*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*319*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*320*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*321*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*322*/	  r6.w = max(r6.w, 0.000000);
/*323*/	  r6.w = log2(r6.w);
/*324*/	  r6.w = r6.w * 10.000000;
/*325*/	  r6.w = exp2(r6.w);
/*326*/	  r6.w = r3.w * r6.w;
/*327*/	  r6.w = r6.w * r5.w + r0.x;
/*328*/	  r7.y = r2.w * 8.000000;
/*329*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*330*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*331*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*332*/	}
/*333*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*334*/	r7.y = max(r6.w, 0.000000);
/*335*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*336*/	if(floatBitsToUint(r6.w) != 0u) {
/*337*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*338*/	  r6.x = max(r6.x, -1.000000);
/*339*/	  r6.x = min(r6.x, 1.000000);
/*340*/	  r6.y = -abs(r6.x) + 1.000000;
/*341*/	  r6.y = sqrt(r6.y);
/*342*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*343*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*344*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*345*/	  r6.w = r6.y * r6.z;
/*346*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*347*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*348*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*349*/	  r6.x = r6.z * r6.y + r6.x;
/*350*/	  r3.x = r3.x * r3.x;
/*351*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*352*/	  r3.x = r3.x * r3.y + r7.x;
/*353*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*354*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*355*/	  r3.y = -r3.x * r3.x + 1.000000;
/*356*/	  r3.y = max(r3.y, 0.001000);
/*357*/	  r3.y = log2(r3.y);
/*358*/	  r6.y = r3.y * 4.950617;
/*359*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*360*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*361*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*362*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*363*/	  r3.x = floatBitsToInt(r3.x);
/*364*/	  r6.y = r3.y * r3.y + -r6.y;
/*365*/	  r6.y = sqrt(r6.y);
/*366*/	  r3.y = -r3.y + r6.y;
/*367*/	  r3.y = max(r3.y, 0.000000);
/*368*/	  r3.y = sqrt(r3.y);
/*369*/	  r3.x = r3.y * r3.x;
/*370*/	  r3.x = r3.x * 1.414214;
/*371*/	  r3.x = 0.008727 / r3.x;
/*372*/	  r3.x = max(r3.x, 0.000100);
/*373*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*374*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*375*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*376*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*377*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*378*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*379*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*380*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*381*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*382*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*383*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*384*/	  r3.x = floatBitsToInt(r3.x);
/*385*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*386*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*387*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*388*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*389*/	  r3.x = r3.x * r6.x + 1.000000;
/*390*/	  r3.x = r3.x * 0.500000;
/*391*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*392*/	  r3.y = r3.y * r6.y + 1.000000;
/*393*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*394*/	  r3.y = min(r7.y, 1.000000);
/*395*/	  r2.w = r2.w * 1.570796;
/*396*/	  r2.w = sin(r2.w);
/*397*/	  r3.y = r3.y + -1.000000;
/*398*/	  r2.w = r2.w * r3.y + 1.000000;
/*399*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*400*/	  r3.y = max(r3.y, 0.000000);
/*401*/	  r3.y = log2(r3.y);
/*402*/	  r3.y = r3.y * 10.000000;
/*403*/	  r3.y = exp2(r3.y);
/*404*/	  r3.y = r3.w * r3.y;
/*405*/	  r3.y = r3.y * r5.w + r0.x;
/*406*/	  r2.w = r2.w * abs(r3.x);
/*407*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*408*/	} else {
/*409*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*410*/	}
/*411*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*412*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*413*/	r5.xyz = (max(r0.xxxx, r5.xyzx)).xyz;
/*414*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*415*/	r0.yzw = (r0.yyzw * r7.yyyy).yzw;
/*416*/	r0.yzw = (r0.yyzw * cb2.data[1].xxyz).yzw;
/*417*/	r0.yzw = (r5.xxyz * r0.yyzw).yzw;
/*418*/	r0.yzw = (r7.xxxx * r0.yyzw).yzw;
/*419*/	r0.yzw = (r6.xxyz * cb2.data[1].xxyz + r0.yyzw).yzw;
/*420*/	r0.yzw = (r3.zzzz * r0.yyzw + r8.xxzw).yzw;
/*421*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*422*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*423*/	r2.w = inversesqrt(r2.w);
/*424*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*425*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*426*/	r2.w = r2.w + r2.w;
/*427*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*428*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*429*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*430*/	r1.x = max(r1.x, 0.000000);
/*431*/	r1.x = log2(r1.x);
/*432*/	r1.x = r1.x * 10.000000;
/*433*/	r1.x = exp2(r1.x);
/*434*/	r1.x = r3.w * r1.x;
/*435*/	r0.x = r1.x * r5.w + r0.x;
/*436*/	r1.xyz = (r6.xyzx * r0.xxxx).xyz;
/*437*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.yzwy).xyz;
/*438*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*439*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*440*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*441*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*442*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*443*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*444*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*445*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*446*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*447*/	if(r0.x != 0) discard;
/*448*/	color1.x = 1.000000;
/*449*/	return;
}
