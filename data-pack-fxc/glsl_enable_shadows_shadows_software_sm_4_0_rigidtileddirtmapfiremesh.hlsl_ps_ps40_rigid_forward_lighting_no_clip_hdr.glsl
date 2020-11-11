//
//
// Shader Model 4
// Fragment Shader
//
// id: 4898 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
/*49*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*50*/	r7.x = 0;
/*51*/	r7.y = cb0.data[26].x * 0.050000;
/*52*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*53*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*54*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*55*/	r2.w = saturate(r7.x * 5.000000);
/*56*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*57*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*59*/	r3.z = log2(r8.z);
/*60*/	r3.z = r3.z * 1.800000;
/*61*/	r3.z = exp2(r3.z);
/*62*/	r3.z = r3.z * 10.000000;
/*63*/	r3.z = min(r3.z, 1.000000);
/*64*/	r2.w = r2.w + r3.z;
/*65*/	r2.w = r2.w * 0.500000;
/*66*/	r3.z = -r8.w + 1.000000;
/*67*/	r3.z = log2(r3.z);
/*68*/	r3.z = r3.z * vsOut_T7.x;
/*69*/	r3.z = exp2(r3.z);
/*70*/	r3.z = min(r3.z, 1.000000);
/*71*/	r3.z = r3.z * vsOut_T7.x;
/*72*/	r3.w = r8.z * 0.250000;
/*73*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*74*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*75*/	r0.xyw = (-r0.xyxw * r5.xyxz + r7.xyxz).xyw;
/*76*/	r0.xyw = (r3.zzzz * r0.xyxw + r6.xyxz).xyw;
/*77*/	r2.w = vsOut_T7.x + -0.025000;
/*78*/	r2.w = max(r2.w, 0.000000);
/*79*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*80*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*81*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*82*/	r2.w = inversesqrt(r2.w);
/*83*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*84*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*85*/	r2.w = inversesqrt(r2.w);
/*86*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*87*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*88*/	r2.w = inversesqrt(r2.w);
/*89*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*90*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*91*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*92*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*93*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*94*/	r2.w = inversesqrt(r2.w);
/*95*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*96*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*97*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*98*/	if(floatBitsToUint(r0.z) != 0u) {
/*99*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*100*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*101*/	  r0.z = r3.w * cb0.data[26].x;
/*102*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*103*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*104*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*105*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*106*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*107*/	}
/*108*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*109*/	if(floatBitsToUint(r0.z) != 0u) {
/*110*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*111*/	  if(floatBitsToUint(r0.z) != 0u) {
/*112*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*113*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*114*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*115*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*116*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*117*/	    r0.z = -r0.z + 1.000000;
/*118*/	    r0.z = max(r0.z, 0.000000);
/*119*/	    r9.z = sqrt(r0.z);
/*120*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*121*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*122*/	    r0.z = inversesqrt(r0.z);
/*123*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*124*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*125*/	    r11.y = -1.000000;
/*126*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*127*/	    r0.z = inversesqrt(r0.z);
/*128*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*129*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*130*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*131*/	    r2.w = r2.w * 1.250000;
/*132*/	    r2.w = min(r2.w, 1.000000);
/*133*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*134*/	    r3.z = r3.z * 4.000000;
/*135*/	    r2.w = r2.w * 0.200000 + r3.z;
/*136*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*137*/	    r0.z = r0.z + -r2.w;
/*138*/	    r0.z = saturate(r0.z * 200.000000);
/*139*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*140*/	    r0.z = r0.z * r0.z;
/*141*/	    r0.z = r0.z * r2.w;
/*142*/	    r3.x = r0.z * -r3.x + r3.x;
/*143*/	    r2.w = -r3.y + 0.200000;
/*144*/	    r3.y = r0.z * r2.w + r3.y;
/*145*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*146*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*147*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*148*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*149*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*150*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*151*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*152*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*153*/	    r2.w = -r2.w + 1.000000;
/*154*/	    r2.w = max(r2.w, 0.000000);
/*155*/	    r8.z = sqrt(r2.w);
/*156*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*157*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*158*/	    r2.w = sqrt(r2.w);
/*159*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*160*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*161*/	    r2.w = inversesqrt(r2.w);
/*162*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*163*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*164*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*165*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*166*/	    r2.w = -r1.y + 1.000000;
/*167*/	    r0.z = min(r0.z, r2.w);
/*168*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*169*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*170*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*171*/	    r0.z = inversesqrt(r0.z);
/*172*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*173*/	  }
/*174*/	}
/*175*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*176*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*177*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*178*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*179*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*180*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*181*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*182*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*183*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*184*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*185*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*186*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*187*/	r2.w = inversesqrt(r2.w);
/*188*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*189*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*190*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*191*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*192*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*193*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*194*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*195*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*196*/	r3.y = intBitsToFloat(int(r2.w));
/*197*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*198*/	if(floatBitsToUint(r3.z) != 0u) {
/*199*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*200*/	  r5.w = vsOut_T0.w;
/*201*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*202*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*203*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*204*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*205*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*206*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*207*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*208*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*209*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*210*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*211*/	  if(floatBitsToUint(r3.w) == 0u) {
/*212*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*213*/	    r7.xy = floor((r6.xyxx).xy);
/*214*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*215*/	    r3.z = -0.000400 / r3.z;
/*216*/	    r3.z = r3.z + r6.z;
/*217*/	    r8.z = -r8.y + 1.000000;
/*218*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*219*/	    r8.w = -r8.y;
/*220*/	    r10.x = cb1.data[0].z/**/;
/*221*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*222*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*223*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*224*/	    r10.w = -cb1.data[0].w/**/;
/*225*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*226*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*227*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*228*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*229*/	    r8.x = r9.x;
/*230*/	    r8.y = r11.x;
/*231*/	    r8.z = r10.x;
/*232*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*233*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*234*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*235*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*236*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*237*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*238*/	    r3.z = -r6.x + r6.y;
/*239*/	    r3.z = r3.w * r3.z + r6.x;
/*240*/	  } else {
/*241*/	    r3.z = 1.000000;
/*242*/	  }
/*243*/	} else {
/*244*/	  r3.z = 1.000000;
/*245*/	}
/*246*/	r3.w = cb1.data[34].w + -1.000000;
/*247*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*248*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*249*/	if(floatBitsToUint(r2.w) == 0u) {
/*250*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*251*/	  r2.w = floatBitsToInt(r2.w);
/*252*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*253*/	  if(floatBitsToUint(r2.w) != 0u) {
/*254*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*255*/	    r5.w = vsOut_T0.w;
/*256*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*257*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*258*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*259*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*260*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*261*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*262*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*263*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*264*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*265*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*266*/	    if(floatBitsToUint(r5.w) == 0u) {
/*267*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*268*/	      r6.xy = floor((r5.xyxx).xy);
/*269*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*270*/	      r2.w = -0.000400 / r2.w;
/*271*/	      r2.w = r2.w + r5.z;
/*272*/	      r7.z = -r7.y + 1.000000;
/*273*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*274*/	      r7.w = -r7.y;
/*275*/	      r9.x = cb1.data[0].z/**/;
/*276*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*277*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*278*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*279*/	      r9.w = -cb1.data[0].w/**/;
/*280*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*281*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*282*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*283*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*284*/	      r7.x = r8.x;
/*285*/	      r7.y = r10.x;
/*286*/	      r7.z = r9.x;
/*287*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*288*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*289*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*290*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*291*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*292*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*293*/	      r2.w = -r5.x + r5.z;
/*294*/	      r2.w = r5.y * r2.w + r5.x;
/*295*/	    } else {
/*296*/	      r2.w = 1.000000;
/*297*/	    }
/*298*/	  } else {
/*299*/	    r2.w = 1.000000;
/*300*/	  }
/*301*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*302*/	  r5.y = r5.x * cb1.data[34].x;
/*303*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*304*/	  r5.x = r1.w + -r5.x;
/*305*/	  r5.x = saturate(r5.x / r5.y);
/*306*/	  r2.w = -r3.z + r2.w;
/*307*/	  r3.z = r5.x * r2.w + r3.z;
/*308*/	}
/*309*/	if(floatBitsToUint(r3.w) != 0u) {
/*310*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*311*/	  r3.w = r2.w * cb1.data[34].y;
/*312*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*313*/	  r2.w = r1.w + -r2.w;
/*314*/	  r2.w = saturate(r2.w / r3.w);
/*315*/	  r3.y = -r3.z + 1.000000;
/*316*/	  r3.z = r2.w * r3.y + r3.z;
/*317*/	}
/*318*/	r3.z = saturate(r3.z);
/*319*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*320*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*321*/	r2.w = inversesqrt(r2.w);
/*322*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*323*/	r2.w = -r3.x + 1.000000;
/*324*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*325*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*326*/	r3.w = r3.w + r3.w;
/*327*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*328*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*329*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*330*/	r3.w = cos((r8.x));
/*331*/	r3.w = inversesqrt(r3.w);
/*332*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*333*/	r5.w = saturate(r0.z * 60.000000);
/*334*/	r5.w = -r0.z + r5.w;
/*335*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*336*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*337*/	r6.w = inversesqrt(r6.w);
/*338*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*339*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*340*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*341*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*342*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*343*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*344*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*345*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*346*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*347*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*348*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*349*/	r6.w = -r0.z + 1.000000;
/*350*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*351*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*352*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*353*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*354*/	  r6.w = max(r6.w, 0.000000);
/*355*/	  r6.w = log2(r6.w);
/*356*/	  r6.w = r6.w * 10.000000;
/*357*/	  r6.w = exp2(r6.w);
/*358*/	  r6.w = r3.w * r6.w;
/*359*/	  r6.w = r6.w * r5.w + r0.z;
/*360*/	  r7.y = r2.w * 8.000000;
/*361*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*362*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*363*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*364*/	}
/*365*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*366*/	r7.y = max(r6.w, 0.000000);
/*367*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*368*/	if(floatBitsToUint(r6.w) != 0u) {
/*369*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*370*/	  r6.x = max(r6.x, -1.000000);
/*371*/	  r6.x = min(r6.x, 1.000000);
/*372*/	  r6.y = -abs(r6.x) + 1.000000;
/*373*/	  r6.y = sqrt(r6.y);
/*374*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*375*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*376*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*377*/	  r6.w = r6.y * r6.z;
/*378*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*379*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*380*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*381*/	  r6.x = r6.z * r6.y + r6.x;
/*382*/	  r3.x = r3.x * r3.x;
/*383*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*384*/	  r3.x = r3.x * r3.y + r7.x;
/*385*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*386*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*387*/	  r3.y = -r3.x * r3.x + 1.000000;
/*388*/	  r3.y = max(r3.y, 0.001000);
/*389*/	  r3.y = log2(r3.y);
/*390*/	  r6.y = r3.y * 4.950617;
/*391*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*392*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*393*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*394*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*395*/	  r3.x = floatBitsToInt(r3.x);
/*396*/	  r6.y = r3.y * r3.y + -r6.y;
/*397*/	  r6.y = sqrt(r6.y);
/*398*/	  r3.y = -r3.y + r6.y;
/*399*/	  r3.y = max(r3.y, 0.000000);
/*400*/	  r3.y = sqrt(r3.y);
/*401*/	  r3.x = r3.y * r3.x;
/*402*/	  r3.x = r3.x * 1.414214;
/*403*/	  r3.x = 0.008727 / r3.x;
/*404*/	  r3.x = max(r3.x, 0.000100);
/*405*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*406*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*407*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*408*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*409*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*410*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*411*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*412*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*413*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*414*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*415*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*416*/	  r3.x = floatBitsToInt(r3.x);
/*417*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*418*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*419*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*420*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*421*/	  r3.x = r3.x * r6.x + 1.000000;
/*422*/	  r3.x = r3.x * 0.500000;
/*423*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*424*/	  r3.y = r3.y * r6.y + 1.000000;
/*425*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*426*/	  r3.y = min(r7.y, 1.000000);
/*427*/	  r2.w = r2.w * 1.570796;
/*428*/	  r2.w = sin(r2.w);
/*429*/	  r3.y = r3.y + -1.000000;
/*430*/	  r2.w = r2.w * r3.y + 1.000000;
/*431*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*432*/	  r3.y = max(r3.y, 0.000000);
/*433*/	  r3.y = log2(r3.y);
/*434*/	  r3.y = r3.y * 10.000000;
/*435*/	  r3.y = exp2(r3.y);
/*436*/	  r3.y = r3.w * r3.y;
/*437*/	  r3.y = r3.y * r5.w + r0.z;
/*438*/	  r2.w = r2.w * abs(r3.x);
/*439*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*440*/	} else {
/*441*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*442*/	}
/*443*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*444*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*445*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*446*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*447*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*448*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*449*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*450*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*451*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*452*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*453*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*454*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*455*/	r2.w = inversesqrt(r2.w);
/*456*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*457*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*458*/	r2.w = r2.w + r2.w;
/*459*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*460*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*461*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*462*/	r1.x = max(r1.x, 0.000000);
/*463*/	r1.x = log2(r1.x);
/*464*/	r1.x = r1.x * 10.000000;
/*465*/	r1.x = exp2(r1.x);
/*466*/	r1.x = r3.w * r1.x;
/*467*/	r0.z = r1.x * r5.w + r0.z;
/*468*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*469*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*470*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*471*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*472*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*473*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*474*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*475*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*476*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*477*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*478*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*479*/	if(r0.x != 0) discard;
/*480*/	color1.x = 1.000000;
/*481*/	return;
}
