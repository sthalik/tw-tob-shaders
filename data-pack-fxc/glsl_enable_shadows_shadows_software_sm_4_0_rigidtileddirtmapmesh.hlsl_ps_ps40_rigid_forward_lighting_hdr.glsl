//
//
// Shader Model 4
// Fragment Shader
//
// id: 4844 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
/*27*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*29*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*30*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*31*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*32*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*33*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*35*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*37*/	r1.w = -r1.w + 1.000000;
/*38*/	r1.w = max(r1.w, 0.000000);
/*39*/	r1.z = sqrt(r1.w);
/*40*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*42*/	r4.w = 1.000000;
/*43*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*44*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*45*/	r5.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*46*/	r6.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*47*/	r2.w = r5.w + -1.000000;
/*48*/	r2.w = r6.x * r2.w + 1.000000;
/*49*/	r2.w = saturate(r2.w * r6.x);
/*50*/	r6.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*51*/	r5.xyz = (r2.wwww * r6.xyzx + r5.xyzx).xyz;
/*52*/	r6.xyz = (r0.xywx * r5.xyzx).xyz;
/*53*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*54*/	r2.w = inversesqrt(r2.w);
/*55*/	r7.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*56*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*57*/	r2.w = inversesqrt(r2.w);
/*58*/	r8.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*59*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*60*/	r2.w = inversesqrt(r2.w);
/*61*/	r9.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*62*/	r10.xyz = (r1.yyyy * r8.xyzx).xyz;
/*63*/	r10.xyz = (r1.xxxx * r7.xyzx + r10.xyzx).xyz;
/*64*/	r1.xyz = (r1.zzzz * r9.xyzx + r10.xyzx).xyz;
/*65*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*66*/	r2.w = inversesqrt(r2.w);
/*67*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*68*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*69*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*70*/	if(floatBitsToUint(r0.z) != 0u) {
/*71*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*72*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*73*/	  r0.z = r3.w * cb0.data[26].x;
/*74*/	  r10.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*75*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r10.xxxy).zw;
/*76*/	  r10.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*77*/	  r2.xyz = (r10.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*78*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*79*/	}
/*80*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*81*/	if(floatBitsToUint(r0.z) != 0u) {
/*82*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*83*/	  if(floatBitsToUint(r0.z) != 0u) {
/*84*/	    r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*85*/	    r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*86*/	    r3.zw = (r11.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*87*/	    r11.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*88*/	    r0.z = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*89*/	    r0.z = -r0.z + 1.000000;
/*90*/	    r0.z = max(r0.z, 0.000000);
/*91*/	    r11.z = sqrt(r0.z);
/*92*/	    r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*93*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*94*/	    r0.z = inversesqrt(r0.z);
/*95*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*96*/	    r13.xz = (cb3.data[0].xxyx).xz/**/;
/*97*/	    r13.y = -1.000000;
/*98*/	    r0.z = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*99*/	    r0.z = inversesqrt(r0.z);
/*100*/	    r13.xyz = (r0.zzzz * r13.xyzx).xyz;
/*101*/	    r0.z = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*102*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*103*/	    r2.w = r2.w * 1.250000;
/*104*/	    r2.w = min(r2.w, 1.000000);
/*105*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*106*/	    r3.z = r3.z * 4.000000;
/*107*/	    r2.w = r2.w * 0.200000 + r3.z;
/*108*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*109*/	    r0.z = r0.z + -r2.w;
/*110*/	    r0.z = saturate(r0.z * 200.000000);
/*111*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*112*/	    r0.z = r0.z * r0.z;
/*113*/	    r0.z = r0.z * r2.w;
/*114*/	    r3.x = r0.z * -r3.x + r3.x;
/*115*/	    r2.w = -r3.y + 0.200000;
/*116*/	    r3.y = r0.z * r2.w + r3.y;
/*117*/	    r0.xyw = (-r0.xyxw * r5.xyxz + vec4(0.400000, 0.400000, 0.000000, 0.400000)).xyw;
/*118*/	    r6.xyz = (r0.zzzz * r0.xywx + r6.xyzx).xyz;
/*119*/	    r0.xyw = (-r2.xyxz + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*120*/	    r2.xyz = (r0.zzzz * r0.xywx + r2.xyzx).xyz;
/*121*/	    r5.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*122*/	    r0.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*123*/	    r5.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*124*/	    r0.x = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*125*/	    r0.x = -r0.x + 1.000000;
/*126*/	    r0.x = max(r0.x, 0.000000);
/*127*/	    r5.z = sqrt(r0.x);
/*128*/	    r0.xyw = (r11.xyxz + r11.xyxz).xyw;
/*129*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*130*/	    r2.w = sqrt(r2.w);
/*131*/	    r0.xyw = (r0.xyxw * r2.wwww + r5.xyxz).xyw;
/*132*/	    r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*133*/	    r2.w = inversesqrt(r2.w);
/*134*/	    r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*135*/	    r5.xyz = (r8.xyzx * r0.yyyy).xyz;
/*136*/	    r5.xyz = (r0.xxxx * r7.xyzx + r5.xyzx).xyz;
/*137*/	    r0.xyw = (r0.wwww * r9.xyxz + r5.xyxz).xyw;
/*138*/	    r2.w = -r1.y + 1.000000;
/*139*/	    r0.z = min(r0.z, r2.w);
/*140*/	    r0.xyw = (-r1.xyxz + r0.xyxw).xyw;
/*141*/	    r0.xyz = (r0.zzzz * r0.xywx + r1.xyzx).xyz;
/*142*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*143*/	    r0.w = inversesqrt(r0.w);
/*144*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*145*/	  }
/*146*/	}
/*147*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*148*/	r0.yzw = (r6.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*149*/	r0.yzw = (-r6.xxyz + r0.yyzw).yzw;
/*150*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r6.xxyz).yzw;
/*151*/	r2.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*152*/	r3.yzw = (-r0.yyzw + r2.wwww).yzw;
/*153*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*154*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*155*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*156*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*157*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*158*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*159*/	r2.w = inversesqrt(r2.w);
/*160*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*161*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*162*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*163*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*164*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*165*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*166*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*167*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*168*/	r3.y = intBitsToFloat(int(r2.w));
/*169*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*170*/	if(floatBitsToUint(r3.z) != 0u) {
/*171*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*172*/	  r5.w = vsOut_T0.w;
/*173*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*174*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*175*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*176*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*177*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*178*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*179*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*180*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*181*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*182*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*183*/	  if(floatBitsToUint(r3.w) == 0u) {
/*184*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*185*/	    r7.xy = floor((r6.xyxx).xy);
/*186*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*187*/	    r3.z = -0.000400 / r3.z;
/*188*/	    r3.z = r3.z + r6.z;
/*189*/	    r8.z = -r8.y + 1.000000;
/*190*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*191*/	    r8.w = -r8.y;
/*192*/	    r10.x = cb1.data[0].z/**/;
/*193*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*194*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*195*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*196*/	    r10.w = -cb1.data[0].w/**/;
/*197*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*198*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*199*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*200*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*201*/	    r8.x = r9.x;
/*202*/	    r8.y = r11.x;
/*203*/	    r8.z = r10.x;
/*204*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*205*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*206*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*207*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*208*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*209*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*210*/	    r3.z = -r6.x + r6.y;
/*211*/	    r3.z = r3.w * r3.z + r6.x;
/*212*/	  } else {
/*213*/	    r3.z = 1.000000;
/*214*/	  }
/*215*/	} else {
/*216*/	  r3.z = 1.000000;
/*217*/	}
/*218*/	r3.w = cb1.data[34].w + -1.000000;
/*219*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*220*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*221*/	if(floatBitsToUint(r2.w) == 0u) {
/*222*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*223*/	  r2.w = floatBitsToInt(r2.w);
/*224*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*225*/	  if(floatBitsToUint(r2.w) != 0u) {
/*226*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*227*/	    r5.w = vsOut_T0.w;
/*228*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*229*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*230*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*231*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*232*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*233*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*234*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*235*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*236*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*237*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*238*/	    if(floatBitsToUint(r5.w) == 0u) {
/*239*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*240*/	      r6.xy = floor((r5.xyxx).xy);
/*241*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*242*/	      r2.w = -0.000400 / r2.w;
/*243*/	      r2.w = r2.w + r5.z;
/*244*/	      r7.z = -r7.y + 1.000000;
/*245*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*246*/	      r7.w = -r7.y;
/*247*/	      r9.x = cb1.data[0].z/**/;
/*248*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*249*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*250*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*251*/	      r9.w = -cb1.data[0].w/**/;
/*252*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*253*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*254*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*255*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*256*/	      r7.x = r8.x;
/*257*/	      r7.y = r10.x;
/*258*/	      r7.z = r9.x;
/*259*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*260*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*261*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*262*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*263*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*264*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*265*/	      r2.w = -r5.x + r5.z;
/*266*/	      r2.w = r5.y * r2.w + r5.x;
/*267*/	    } else {
/*268*/	      r2.w = 1.000000;
/*269*/	    }
/*270*/	  } else {
/*271*/	    r2.w = 1.000000;
/*272*/	  }
/*273*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*274*/	  r5.y = r5.x * cb1.data[34].x;
/*275*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*276*/	  r5.x = r1.w + -r5.x;
/*277*/	  r5.x = saturate(r5.x / r5.y);
/*278*/	  r2.w = -r3.z + r2.w;
/*279*/	  r3.z = r5.x * r2.w + r3.z;
/*280*/	}
/*281*/	if(floatBitsToUint(r3.w) != 0u) {
/*282*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*283*/	  r3.w = r2.w * cb1.data[34].y;
/*284*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*285*/	  r2.w = r1.w + -r2.w;
/*286*/	  r2.w = saturate(r2.w / r3.w);
/*287*/	  r3.y = -r3.z + 1.000000;
/*288*/	  r3.z = r2.w * r3.y + r3.z;
/*289*/	}
/*290*/	r3.z = saturate(r3.z);
/*291*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*292*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*293*/	r2.w = inversesqrt(r2.w);
/*294*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*295*/	r2.w = -r3.x + 1.000000;
/*296*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*297*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*298*/	r3.w = r3.w + r3.w;
/*299*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*300*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*301*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*302*/	r3.w = cos((r8.x));
/*303*/	r3.w = inversesqrt(r3.w);
/*304*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*305*/	r5.w = saturate(r0.x * 60.000000);
/*306*/	r5.w = -r0.x + r5.w;
/*307*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*308*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*309*/	r6.w = inversesqrt(r6.w);
/*310*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*311*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*312*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*313*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*314*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*315*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*316*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*317*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*318*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*319*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*320*/	r8.xzw = (r0.yyzw * r8.xxzw).xzw;
/*321*/	r6.w = -r0.x + 1.000000;
/*322*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*323*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*324*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*325*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*326*/	  r6.w = max(r6.w, 0.000000);
/*327*/	  r6.w = log2(r6.w);
/*328*/	  r6.w = r6.w * 10.000000;
/*329*/	  r6.w = exp2(r6.w);
/*330*/	  r6.w = r3.w * r6.w;
/*331*/	  r6.w = r6.w * r5.w + r0.x;
/*332*/	  r7.y = r2.w * 8.000000;
/*333*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*334*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*335*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*336*/	}
/*337*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*338*/	r7.y = max(r6.w, 0.000000);
/*339*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*340*/	if(floatBitsToUint(r6.w) != 0u) {
/*341*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*342*/	  r6.x = max(r6.x, -1.000000);
/*343*/	  r6.x = min(r6.x, 1.000000);
/*344*/	  r6.y = -abs(r6.x) + 1.000000;
/*345*/	  r6.y = sqrt(r6.y);
/*346*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*347*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*348*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*349*/	  r6.w = r6.y * r6.z;
/*350*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*351*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*352*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*353*/	  r6.x = r6.z * r6.y + r6.x;
/*354*/	  r3.x = r3.x * r3.x;
/*355*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*356*/	  r3.x = r3.x * r3.y + r7.x;
/*357*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*358*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*359*/	  r3.y = -r3.x * r3.x + 1.000000;
/*360*/	  r3.y = max(r3.y, 0.001000);
/*361*/	  r3.y = log2(r3.y);
/*362*/	  r6.y = r3.y * 4.950617;
/*363*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*364*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*365*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*366*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*367*/	  r3.x = floatBitsToInt(r3.x);
/*368*/	  r6.y = r3.y * r3.y + -r6.y;
/*369*/	  r6.y = sqrt(r6.y);
/*370*/	  r3.y = -r3.y + r6.y;
/*371*/	  r3.y = max(r3.y, 0.000000);
/*372*/	  r3.y = sqrt(r3.y);
/*373*/	  r3.x = r3.y * r3.x;
/*374*/	  r3.x = r3.x * 1.414214;
/*375*/	  r3.x = 0.008727 / r3.x;
/*376*/	  r3.x = max(r3.x, 0.000100);
/*377*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*378*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*379*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*380*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*381*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*382*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*383*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*384*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*385*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*386*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*387*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*388*/	  r3.x = floatBitsToInt(r3.x);
/*389*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*390*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*391*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*392*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*393*/	  r3.x = r3.x * r6.x + 1.000000;
/*394*/	  r3.x = r3.x * 0.500000;
/*395*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*396*/	  r3.y = r3.y * r6.y + 1.000000;
/*397*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*398*/	  r3.y = min(r7.y, 1.000000);
/*399*/	  r2.w = r2.w * 1.570796;
/*400*/	  r2.w = sin(r2.w);
/*401*/	  r3.y = r3.y + -1.000000;
/*402*/	  r2.w = r2.w * r3.y + 1.000000;
/*403*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*404*/	  r3.y = max(r3.y, 0.000000);
/*405*/	  r3.y = log2(r3.y);
/*406*/	  r3.y = r3.y * 10.000000;
/*407*/	  r3.y = exp2(r3.y);
/*408*/	  r3.y = r3.w * r3.y;
/*409*/	  r3.y = r3.y * r5.w + r0.x;
/*410*/	  r2.w = r2.w * abs(r3.x);
/*411*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*412*/	} else {
/*413*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*414*/	}
/*415*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*416*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*417*/	r5.xyz = (max(r0.xxxx, r5.xyzx)).xyz;
/*418*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*419*/	r0.yzw = (r0.yyzw * r7.yyyy).yzw;
/*420*/	r0.yzw = (r0.yyzw * cb2.data[1].xxyz).yzw;
/*421*/	r0.yzw = (r5.xxyz * r0.yyzw).yzw;
/*422*/	r0.yzw = (r7.xxxx * r0.yyzw).yzw;
/*423*/	r0.yzw = (r6.xxyz * cb2.data[1].xxyz + r0.yyzw).yzw;
/*424*/	r0.yzw = (r3.zzzz * r0.yyzw + r8.xxzw).yzw;
/*425*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*426*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*427*/	r2.w = inversesqrt(r2.w);
/*428*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*429*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*430*/	r2.w = r2.w + r2.w;
/*431*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*432*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*433*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*434*/	r1.x = max(r1.x, 0.000000);
/*435*/	r1.x = log2(r1.x);
/*436*/	r1.x = r1.x * 10.000000;
/*437*/	r1.x = exp2(r1.x);
/*438*/	r1.x = r3.w * r1.x;
/*439*/	r0.x = r1.x * r5.w + r0.x;
/*440*/	r1.xyz = (r6.xyzx * r0.xxxx).xyz;
/*441*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.yzwy).xyz;
/*442*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*443*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*444*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*445*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*446*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*447*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*448*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*449*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*450*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*451*/	if(r0.x != 0) discard;
/*452*/	color1.x = 1.000000;
/*453*/	return;
}
