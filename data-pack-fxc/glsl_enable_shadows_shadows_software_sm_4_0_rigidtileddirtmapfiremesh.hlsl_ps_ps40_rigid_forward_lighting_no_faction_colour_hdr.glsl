//
//
// Shader Model 4
// Fragment Shader
//
// id: 4900 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*24*/	r4.w = 1.000000;
/*25*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*26*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*27*/	r5.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*28*/	r6.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*29*/	r2.w = r5.w + -1.000000;
/*30*/	r2.w = r6.x * r2.w + 1.000000;
/*31*/	r2.w = saturate(r2.w * r6.x);
/*32*/	r6.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*33*/	r5.xyz = (r2.wwww * r6.xyzx + r5.xyzx).xyz;
/*34*/	r6.xyz = (r1.xyzx * r5.xyzx).xyz;
/*35*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*36*/	r7.x = 0;
/*37*/	r7.y = cb0.data[26].x * 0.050000;
/*38*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*39*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*40*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*41*/	r2.w = saturate(r7.x * 5.000000);
/*42*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*43*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*44*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*45*/	r3.z = log2(r8.z);
/*46*/	r3.z = r3.z * 1.800000;
/*47*/	r3.z = exp2(r3.z);
/*48*/	r3.z = r3.z * 10.000000;
/*49*/	r3.z = min(r3.z, 1.000000);
/*50*/	r2.w = r2.w + r3.z;
/*51*/	r2.w = r2.w * 0.500000;
/*52*/	r3.z = -r8.w + 1.000000;
/*53*/	r3.z = log2(r3.z);
/*54*/	r3.z = r3.z * vsOut_T7.x;
/*55*/	r3.z = exp2(r3.z);
/*56*/	r3.z = min(r3.z, 1.000000);
/*57*/	r3.z = r3.z * vsOut_T7.x;
/*58*/	r3.w = r8.z * 0.250000;
/*59*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*60*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*61*/	r1.xyz = (-r1.xyzx * r5.xyzx + r7.xyzx).xyz;
/*62*/	r1.xyz = (r3.zzzz * r1.xyzx + r6.xyzx).xyz;
/*63*/	r2.w = vsOut_T7.x + -0.025000;
/*64*/	r2.w = max(r2.w, 0.000000);
/*65*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*66*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*67*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*70*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*71*/	r2.w = inversesqrt(r2.w);
/*72*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*73*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*74*/	r2.w = inversesqrt(r2.w);
/*75*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*76*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*77*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*78*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*79*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*82*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*83*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*84*/	if(floatBitsToUint(r0.w) != 0u) {
/*85*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*86*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*87*/	  r0.w = r3.w * cb0.data[26].x;
/*88*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*89*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*90*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*91*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*92*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*93*/	}
/*94*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*95*/	if(floatBitsToUint(r0.w) != 0u) {
/*96*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*97*/	  if(floatBitsToUint(r0.w) != 0u) {
/*98*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*99*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*100*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*101*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*102*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*103*/	    r0.w = -r0.w + 1.000000;
/*104*/	    r0.w = max(r0.w, 0.000000);
/*105*/	    r9.z = sqrt(r0.w);
/*106*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*107*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*108*/	    r0.w = inversesqrt(r0.w);
/*109*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*110*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*111*/	    r11.y = -1.000000;
/*112*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*115*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*116*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*117*/	    r2.w = r2.w * 1.250000;
/*118*/	    r2.w = min(r2.w, 1.000000);
/*119*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*120*/	    r3.z = r3.z * 4.000000;
/*121*/	    r2.w = r2.w * 0.200000 + r3.z;
/*122*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*123*/	    r0.w = r0.w + -r2.w;
/*124*/	    r0.w = saturate(r0.w * 200.000000);
/*125*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*126*/	    r0.w = r0.w * r0.w;
/*127*/	    r0.w = r0.w * r2.w;
/*128*/	    r3.x = r0.w * -r3.x + r3.x;
/*129*/	    r2.w = -r3.y + 0.200000;
/*130*/	    r3.y = r0.w * r2.w + r3.y;
/*131*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*132*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*133*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*134*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*135*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*136*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*137*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*138*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*139*/	    r2.w = -r2.w + 1.000000;
/*140*/	    r2.w = max(r2.w, 0.000000);
/*141*/	    r8.z = sqrt(r2.w);
/*142*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*143*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*144*/	    r2.w = sqrt(r2.w);
/*145*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*146*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*147*/	    r2.w = inversesqrt(r2.w);
/*148*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*149*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*150*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*151*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*152*/	    r2.w = -r0.y + 1.000000;
/*153*/	    r0.w = min(r0.w, r2.w);
/*154*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*155*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*156*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*157*/	    r0.w = inversesqrt(r0.w);
/*158*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*159*/	  }
/*160*/	}
/*161*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*162*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*163*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*164*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*165*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*166*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*167*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*168*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*169*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*170*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*171*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*172*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*173*/	r2.w = inversesqrt(r2.w);
/*174*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*175*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*176*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*177*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*178*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*179*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*180*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*181*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*182*/	r3.y = intBitsToFloat(int(r2.w));
/*183*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*184*/	if(floatBitsToUint(r3.z) != 0u) {
/*185*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*186*/	  r5.w = vsOut_T0.w;
/*187*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*188*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*189*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*190*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*191*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*192*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*193*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*194*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*195*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*196*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*197*/	  if(floatBitsToUint(r3.w) == 0u) {
/*198*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*199*/	    r7.xy = floor((r6.xyxx).xy);
/*200*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*201*/	    r3.z = -0.000400 / r3.z;
/*202*/	    r3.z = r3.z + r6.z;
/*203*/	    r8.z = -r8.y + 1.000000;
/*204*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*205*/	    r8.w = -r8.y;
/*206*/	    r10.x = cb1.data[0].z/**/;
/*207*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*208*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*209*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*210*/	    r10.w = -cb1.data[0].w/**/;
/*211*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*212*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*213*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*214*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*215*/	    r8.x = r9.x;
/*216*/	    r8.y = r11.x;
/*217*/	    r8.z = r10.x;
/*218*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*219*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*220*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*221*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*222*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*223*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*224*/	    r3.z = -r6.x + r6.y;
/*225*/	    r3.z = r3.w * r3.z + r6.x;
/*226*/	  } else {
/*227*/	    r3.z = 1.000000;
/*228*/	  }
/*229*/	} else {
/*230*/	  r3.z = 1.000000;
/*231*/	}
/*232*/	r3.w = cb1.data[34].w + -1.000000;
/*233*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*234*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*235*/	if(floatBitsToUint(r2.w) == 0u) {
/*236*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*237*/	  r2.w = floatBitsToInt(r2.w);
/*238*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*239*/	  if(floatBitsToUint(r2.w) != 0u) {
/*240*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*241*/	    r5.w = vsOut_T0.w;
/*242*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*243*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*244*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*245*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*246*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*247*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*248*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*249*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*250*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*251*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*252*/	    if(floatBitsToUint(r5.w) == 0u) {
/*253*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*254*/	      r6.xy = floor((r5.xyxx).xy);
/*255*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*256*/	      r2.w = -0.000400 / r2.w;
/*257*/	      r2.w = r2.w + r5.z;
/*258*/	      r7.z = -r7.y + 1.000000;
/*259*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*260*/	      r7.w = -r7.y;
/*261*/	      r9.x = cb1.data[0].z/**/;
/*262*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*263*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*264*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*265*/	      r9.w = -cb1.data[0].w/**/;
/*266*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*267*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*268*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*269*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*270*/	      r7.x = r8.x;
/*271*/	      r7.y = r10.x;
/*272*/	      r7.z = r9.x;
/*273*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*274*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*275*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*276*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*277*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*278*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*279*/	      r2.w = -r5.x + r5.z;
/*280*/	      r2.w = r5.y * r2.w + r5.x;
/*281*/	    } else {
/*282*/	      r2.w = 1.000000;
/*283*/	    }
/*284*/	  } else {
/*285*/	    r2.w = 1.000000;
/*286*/	  }
/*287*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*288*/	  r5.y = r5.x * cb1.data[34].x;
/*289*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*290*/	  r5.x = r1.w + -r5.x;
/*291*/	  r5.x = saturate(r5.x / r5.y);
/*292*/	  r2.w = -r3.z + r2.w;
/*293*/	  r3.z = r5.x * r2.w + r3.z;
/*294*/	}
/*295*/	if(floatBitsToUint(r3.w) != 0u) {
/*296*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*297*/	  r3.w = r2.w * cb1.data[34].y;
/*298*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*299*/	  r2.w = r1.w + -r2.w;
/*300*/	  r2.w = saturate(r2.w / r3.w);
/*301*/	  r3.y = -r3.z + 1.000000;
/*302*/	  r3.z = r2.w * r3.y + r3.z;
/*303*/	}
/*304*/	r3.z = saturate(r3.z);
/*305*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*306*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*307*/	r2.w = inversesqrt(r2.w);
/*308*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*309*/	r2.w = -r3.x + 1.000000;
/*310*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*311*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*312*/	r3.w = r3.w + r3.w;
/*313*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*314*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*315*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*316*/	r3.w = cos((r8.x));
/*317*/	r3.w = inversesqrt(r3.w);
/*318*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*319*/	r5.w = saturate(r0.w * 60.000000);
/*320*/	r5.w = -r0.w + r5.w;
/*321*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*322*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*323*/	r6.w = inversesqrt(r6.w);
/*324*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*325*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*326*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*327*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*328*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*329*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*330*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*331*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*332*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*333*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*334*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*335*/	r6.w = -r0.w + 1.000000;
/*336*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*337*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*338*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*339*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*340*/	  r6.w = max(r6.w, 0.000000);
/*341*/	  r6.w = log2(r6.w);
/*342*/	  r6.w = r6.w * 10.000000;
/*343*/	  r6.w = exp2(r6.w);
/*344*/	  r6.w = r3.w * r6.w;
/*345*/	  r6.w = r6.w * r5.w + r0.w;
/*346*/	  r7.y = r2.w * 8.000000;
/*347*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*348*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*349*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*350*/	}
/*351*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*352*/	r7.y = max(r6.w, 0.000000);
/*353*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*354*/	if(floatBitsToUint(r6.w) != 0u) {
/*355*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*356*/	  r6.x = max(r6.x, -1.000000);
/*357*/	  r6.x = min(r6.x, 1.000000);
/*358*/	  r6.y = -abs(r6.x) + 1.000000;
/*359*/	  r6.y = sqrt(r6.y);
/*360*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*361*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*362*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*363*/	  r6.w = r6.y * r6.z;
/*364*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*365*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*366*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*367*/	  r6.x = r6.z * r6.y + r6.x;
/*368*/	  r3.x = r3.x * r3.x;
/*369*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*370*/	  r3.x = r3.x * r3.y + r7.x;
/*371*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*372*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*373*/	  r3.y = -r3.x * r3.x + 1.000000;
/*374*/	  r3.y = max(r3.y, 0.001000);
/*375*/	  r3.y = log2(r3.y);
/*376*/	  r6.y = r3.y * 4.950617;
/*377*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*378*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*379*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*380*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*381*/	  r3.x = floatBitsToInt(r3.x);
/*382*/	  r6.y = r3.y * r3.y + -r6.y;
/*383*/	  r6.y = sqrt(r6.y);
/*384*/	  r3.y = -r3.y + r6.y;
/*385*/	  r3.y = max(r3.y, 0.000000);
/*386*/	  r3.y = sqrt(r3.y);
/*387*/	  r3.x = r3.y * r3.x;
/*388*/	  r3.x = r3.x * 1.414214;
/*389*/	  r3.x = 0.008727 / r3.x;
/*390*/	  r3.x = max(r3.x, 0.000100);
/*391*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*392*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*393*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*394*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*395*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*396*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*397*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*398*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*399*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*400*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*401*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*402*/	  r3.x = floatBitsToInt(r3.x);
/*403*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*404*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*405*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*406*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*407*/	  r3.x = r3.x * r6.x + 1.000000;
/*408*/	  r3.x = r3.x * 0.500000;
/*409*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*410*/	  r3.y = r3.y * r6.y + 1.000000;
/*411*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*412*/	  r3.y = min(r7.y, 1.000000);
/*413*/	  r2.w = r2.w * 1.570796;
/*414*/	  r2.w = sin(r2.w);
/*415*/	  r3.y = r3.y + -1.000000;
/*416*/	  r2.w = r2.w * r3.y + 1.000000;
/*417*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*418*/	  r3.y = max(r3.y, 0.000000);
/*419*/	  r3.y = log2(r3.y);
/*420*/	  r3.y = r3.y * 10.000000;
/*421*/	  r3.y = exp2(r3.y);
/*422*/	  r3.y = r3.w * r3.y;
/*423*/	  r3.y = r3.y * r5.w + r0.w;
/*424*/	  r2.w = r2.w * abs(r3.x);
/*425*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*426*/	} else {
/*427*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*428*/	}
/*429*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*430*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*431*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*432*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*433*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*434*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*435*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*436*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*437*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*438*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*439*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*440*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*441*/	r2.w = inversesqrt(r2.w);
/*442*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*443*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*444*/	r2.w = r2.w + r2.w;
/*445*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*446*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*447*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*448*/	r0.x = max(r0.x, 0.000000);
/*449*/	r0.x = log2(r0.x);
/*450*/	r0.x = r0.x * 10.000000;
/*451*/	r0.x = exp2(r0.x);
/*452*/	r0.x = r3.w * r0.x;
/*453*/	r0.x = r0.x * r5.w + r0.w;
/*454*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*455*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*456*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*457*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*458*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*459*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*460*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*461*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*462*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*463*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*464*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*465*/	if(r0.x != 0) discard;
/*466*/	color1.x = 1.000000;
/*467*/	return;
}
