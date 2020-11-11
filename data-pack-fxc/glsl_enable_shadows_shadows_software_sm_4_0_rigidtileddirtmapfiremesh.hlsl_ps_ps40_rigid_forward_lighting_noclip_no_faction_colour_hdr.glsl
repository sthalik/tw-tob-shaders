//
//
// Shader Model 4
// Fragment Shader
//
// id: 4902 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
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
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
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
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*20*/	r4.w = 1.000000;
/*21*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*22*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*23*/	r5.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*24*/	r6.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*25*/	r2.w = r5.w + -1.000000;
/*26*/	r2.w = r6.x * r2.w + 1.000000;
/*27*/	r2.w = saturate(r2.w * r6.x);
/*28*/	r6.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*29*/	r5.xyz = (r2.wwww * r6.xyzx + r5.xyzx).xyz;
/*30*/	r6.xyz = (r1.xyzx * r5.xyzx).xyz;
/*31*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*32*/	r7.x = 0;
/*33*/	r7.y = cb0.data[26].x * 0.050000;
/*34*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*35*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*36*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*37*/	r2.w = saturate(r7.x * 5.000000);
/*38*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*39*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*41*/	r3.z = log2(r8.z);
/*42*/	r3.z = r3.z * 1.800000;
/*43*/	r3.z = exp2(r3.z);
/*44*/	r3.z = r3.z * 10.000000;
/*45*/	r3.z = min(r3.z, 1.000000);
/*46*/	r2.w = r2.w + r3.z;
/*47*/	r2.w = r2.w * 0.500000;
/*48*/	r3.z = -r8.w + 1.000000;
/*49*/	r3.z = log2(r3.z);
/*50*/	r3.z = r3.z * vsOut_T7.x;
/*51*/	r3.z = exp2(r3.z);
/*52*/	r3.z = min(r3.z, 1.000000);
/*53*/	r3.z = r3.z * vsOut_T7.x;
/*54*/	r3.w = r8.z * 0.250000;
/*55*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*56*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*57*/	r1.xyz = (-r1.xyzx * r5.xyzx + r7.xyzx).xyz;
/*58*/	r1.xyz = (r3.zzzz * r1.xyzx + r6.xyzx).xyz;
/*59*/	r2.w = vsOut_T7.x + -0.025000;
/*60*/	r2.w = max(r2.w, 0.000000);
/*61*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*62*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*63*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r2.w = inversesqrt(r2.w);
/*65*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*66*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*67*/	r2.w = inversesqrt(r2.w);
/*68*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*69*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*70*/	r2.w = inversesqrt(r2.w);
/*71*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*72*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*73*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*74*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*75*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*76*/	r2.w = inversesqrt(r2.w);
/*77*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*78*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*79*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*80*/	if(floatBitsToUint(r0.w) != 0u) {
/*81*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*82*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*83*/	  r0.w = r3.w * cb0.data[26].x;
/*84*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*85*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*86*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*87*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*88*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*89*/	}
/*90*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*91*/	if(floatBitsToUint(r0.w) != 0u) {
/*92*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*93*/	  if(floatBitsToUint(r0.w) != 0u) {
/*94*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*95*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*96*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*97*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*98*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*99*/	    r0.w = -r0.w + 1.000000;
/*100*/	    r0.w = max(r0.w, 0.000000);
/*101*/	    r9.z = sqrt(r0.w);
/*102*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*103*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*104*/	    r0.w = inversesqrt(r0.w);
/*105*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*106*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*107*/	    r11.y = -1.000000;
/*108*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*109*/	    r0.w = inversesqrt(r0.w);
/*110*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*111*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*112*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*113*/	    r2.w = r2.w * 1.250000;
/*114*/	    r2.w = min(r2.w, 1.000000);
/*115*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*116*/	    r3.z = r3.z * 4.000000;
/*117*/	    r2.w = r2.w * 0.200000 + r3.z;
/*118*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*119*/	    r0.w = r0.w + -r2.w;
/*120*/	    r0.w = saturate(r0.w * 200.000000);
/*121*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*122*/	    r0.w = r0.w * r0.w;
/*123*/	    r0.w = r0.w * r2.w;
/*124*/	    r3.x = r0.w * -r3.x + r3.x;
/*125*/	    r2.w = -r3.y + 0.200000;
/*126*/	    r3.y = r0.w * r2.w + r3.y;
/*127*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*128*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*129*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*130*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*131*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*132*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*133*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*134*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*135*/	    r2.w = -r2.w + 1.000000;
/*136*/	    r2.w = max(r2.w, 0.000000);
/*137*/	    r8.z = sqrt(r2.w);
/*138*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*139*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*140*/	    r2.w = sqrt(r2.w);
/*141*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*142*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*143*/	    r2.w = inversesqrt(r2.w);
/*144*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*145*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*146*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*147*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*148*/	    r2.w = -r0.y + 1.000000;
/*149*/	    r0.w = min(r0.w, r2.w);
/*150*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*151*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*152*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*153*/	    r0.w = inversesqrt(r0.w);
/*154*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*155*/	  }
/*156*/	}
/*157*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*158*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*159*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*160*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*161*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*162*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*163*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*164*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*165*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*166*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*167*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*168*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*169*/	r2.w = inversesqrt(r2.w);
/*170*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*171*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*172*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*173*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*174*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*175*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*176*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*177*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*178*/	r3.y = intBitsToFloat(int(r2.w));
/*179*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*180*/	if(floatBitsToUint(r3.z) != 0u) {
/*181*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*182*/	  r5.w = vsOut_T0.w;
/*183*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*184*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*185*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*186*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*187*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*188*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*189*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*190*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*191*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*192*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*193*/	  if(floatBitsToUint(r3.w) == 0u) {
/*194*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*195*/	    r7.xy = floor((r6.xyxx).xy);
/*196*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*197*/	    r3.z = -0.000400 / r3.z;
/*198*/	    r3.z = r3.z + r6.z;
/*199*/	    r8.z = -r8.y + 1.000000;
/*200*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*201*/	    r8.w = -r8.y;
/*202*/	    r10.x = cb1.data[0].z/**/;
/*203*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*204*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*205*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*206*/	    r10.w = -cb1.data[0].w/**/;
/*207*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*208*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*209*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*210*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*211*/	    r8.x = r9.x;
/*212*/	    r8.y = r11.x;
/*213*/	    r8.z = r10.x;
/*214*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*215*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*216*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*217*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*218*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*219*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*220*/	    r3.z = -r6.x + r6.y;
/*221*/	    r3.z = r3.w * r3.z + r6.x;
/*222*/	  } else {
/*223*/	    r3.z = 1.000000;
/*224*/	  }
/*225*/	} else {
/*226*/	  r3.z = 1.000000;
/*227*/	}
/*228*/	r3.w = cb1.data[34].w + -1.000000;
/*229*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*230*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*231*/	if(floatBitsToUint(r2.w) == 0u) {
/*232*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*233*/	  r2.w = floatBitsToInt(r2.w);
/*234*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*235*/	  if(floatBitsToUint(r2.w) != 0u) {
/*236*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*237*/	    r5.w = vsOut_T0.w;
/*238*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*239*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*240*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*241*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*242*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*243*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*244*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*245*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*246*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*247*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*248*/	    if(floatBitsToUint(r5.w) == 0u) {
/*249*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*250*/	      r6.xy = floor((r5.xyxx).xy);
/*251*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*252*/	      r2.w = -0.000400 / r2.w;
/*253*/	      r2.w = r2.w + r5.z;
/*254*/	      r7.z = -r7.y + 1.000000;
/*255*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*256*/	      r7.w = -r7.y;
/*257*/	      r9.x = cb1.data[0].z/**/;
/*258*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*259*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*260*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*261*/	      r9.w = -cb1.data[0].w/**/;
/*262*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*263*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*264*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*265*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*266*/	      r7.x = r8.x;
/*267*/	      r7.y = r10.x;
/*268*/	      r7.z = r9.x;
/*269*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*270*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*271*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*272*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*273*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*274*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*275*/	      r2.w = -r5.x + r5.z;
/*276*/	      r2.w = r5.y * r2.w + r5.x;
/*277*/	    } else {
/*278*/	      r2.w = 1.000000;
/*279*/	    }
/*280*/	  } else {
/*281*/	    r2.w = 1.000000;
/*282*/	  }
/*283*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*284*/	  r5.y = r5.x * cb1.data[34].x;
/*285*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*286*/	  r5.x = r1.w + -r5.x;
/*287*/	  r5.x = saturate(r5.x / r5.y);
/*288*/	  r2.w = -r3.z + r2.w;
/*289*/	  r3.z = r5.x * r2.w + r3.z;
/*290*/	}
/*291*/	if(floatBitsToUint(r3.w) != 0u) {
/*292*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*293*/	  r3.w = r2.w * cb1.data[34].y;
/*294*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*295*/	  r2.w = r1.w + -r2.w;
/*296*/	  r2.w = saturate(r2.w / r3.w);
/*297*/	  r3.y = -r3.z + 1.000000;
/*298*/	  r3.z = r2.w * r3.y + r3.z;
/*299*/	}
/*300*/	r3.z = saturate(r3.z);
/*301*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*302*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*303*/	r2.w = inversesqrt(r2.w);
/*304*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*305*/	r2.w = -r3.x + 1.000000;
/*306*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*307*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*308*/	r3.w = r3.w + r3.w;
/*309*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*310*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*311*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*312*/	r3.w = cos((r8.x));
/*313*/	r3.w = inversesqrt(r3.w);
/*314*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*315*/	r5.w = saturate(r0.w * 60.000000);
/*316*/	r5.w = -r0.w + r5.w;
/*317*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*318*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*319*/	r6.w = inversesqrt(r6.w);
/*320*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*321*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*322*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*323*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*324*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*325*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*326*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*327*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*328*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*329*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*330*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*331*/	r6.w = -r0.w + 1.000000;
/*332*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*333*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*334*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*335*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*336*/	  r6.w = max(r6.w, 0.000000);
/*337*/	  r6.w = log2(r6.w);
/*338*/	  r6.w = r6.w * 10.000000;
/*339*/	  r6.w = exp2(r6.w);
/*340*/	  r6.w = r3.w * r6.w;
/*341*/	  r6.w = r6.w * r5.w + r0.w;
/*342*/	  r7.y = r2.w * 8.000000;
/*343*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*344*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*345*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*346*/	}
/*347*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*348*/	r7.y = max(r6.w, 0.000000);
/*349*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*350*/	if(floatBitsToUint(r6.w) != 0u) {
/*351*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*352*/	  r6.x = max(r6.x, -1.000000);
/*353*/	  r6.x = min(r6.x, 1.000000);
/*354*/	  r6.y = -abs(r6.x) + 1.000000;
/*355*/	  r6.y = sqrt(r6.y);
/*356*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*357*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*358*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*359*/	  r6.w = r6.y * r6.z;
/*360*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*361*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*362*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*363*/	  r6.x = r6.z * r6.y + r6.x;
/*364*/	  r3.x = r3.x * r3.x;
/*365*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*366*/	  r3.x = r3.x * r3.y + r7.x;
/*367*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*368*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*369*/	  r3.y = -r3.x * r3.x + 1.000000;
/*370*/	  r3.y = max(r3.y, 0.001000);
/*371*/	  r3.y = log2(r3.y);
/*372*/	  r6.y = r3.y * 4.950617;
/*373*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*374*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*375*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*376*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*377*/	  r3.x = floatBitsToInt(r3.x);
/*378*/	  r6.y = r3.y * r3.y + -r6.y;
/*379*/	  r6.y = sqrt(r6.y);
/*380*/	  r3.y = -r3.y + r6.y;
/*381*/	  r3.y = max(r3.y, 0.000000);
/*382*/	  r3.y = sqrt(r3.y);
/*383*/	  r3.x = r3.y * r3.x;
/*384*/	  r3.x = r3.x * 1.414214;
/*385*/	  r3.x = 0.008727 / r3.x;
/*386*/	  r3.x = max(r3.x, 0.000100);
/*387*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*388*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*389*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*390*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*391*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*392*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*393*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*394*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*395*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*396*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*397*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*398*/	  r3.x = floatBitsToInt(r3.x);
/*399*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*400*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*401*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*402*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*403*/	  r3.x = r3.x * r6.x + 1.000000;
/*404*/	  r3.x = r3.x * 0.500000;
/*405*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*406*/	  r3.y = r3.y * r6.y + 1.000000;
/*407*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*408*/	  r3.y = min(r7.y, 1.000000);
/*409*/	  r2.w = r2.w * 1.570796;
/*410*/	  r2.w = sin(r2.w);
/*411*/	  r3.y = r3.y + -1.000000;
/*412*/	  r2.w = r2.w * r3.y + 1.000000;
/*413*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*414*/	  r3.y = max(r3.y, 0.000000);
/*415*/	  r3.y = log2(r3.y);
/*416*/	  r3.y = r3.y * 10.000000;
/*417*/	  r3.y = exp2(r3.y);
/*418*/	  r3.y = r3.w * r3.y;
/*419*/	  r3.y = r3.y * r5.w + r0.w;
/*420*/	  r2.w = r2.w * abs(r3.x);
/*421*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*422*/	} else {
/*423*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*424*/	}
/*425*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*426*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*427*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*428*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*429*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*430*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*431*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*432*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*433*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*434*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*435*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*436*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*437*/	r2.w = inversesqrt(r2.w);
/*438*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*439*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*440*/	r2.w = r2.w + r2.w;
/*441*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*442*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*443*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*444*/	r0.x = max(r0.x, 0.000000);
/*445*/	r0.x = log2(r0.x);
/*446*/	r0.x = r0.x * 10.000000;
/*447*/	r0.x = exp2(r0.x);
/*448*/	r0.x = r3.w * r0.x;
/*449*/	r0.x = r0.x * r5.w + r0.w;
/*450*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*451*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*452*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*453*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*454*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*455*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*456*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*457*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*458*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*459*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*460*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*461*/	if(r0.x != 0) discard;
/*462*/	color1.x = 1.000000;
/*463*/	return;
}
