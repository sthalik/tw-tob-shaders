//
//
// Shader Model 4
// Fragment Shader
//
// id: 4896 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*53*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*54*/	r7.x = 0;
/*55*/	r7.y = cb0.data[26].x * 0.050000;
/*56*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*57*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*58*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*59*/	r2.w = saturate(r7.x * 5.000000);
/*60*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*61*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*62*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*63*/	r3.z = log2(r8.z);
/*64*/	r3.z = r3.z * 1.800000;
/*65*/	r3.z = exp2(r3.z);
/*66*/	r3.z = r3.z * 10.000000;
/*67*/	r3.z = min(r3.z, 1.000000);
/*68*/	r2.w = r2.w + r3.z;
/*69*/	r2.w = r2.w * 0.500000;
/*70*/	r3.z = -r8.w + 1.000000;
/*71*/	r3.z = log2(r3.z);
/*72*/	r3.z = r3.z * vsOut_T7.x;
/*73*/	r3.z = exp2(r3.z);
/*74*/	r3.z = min(r3.z, 1.000000);
/*75*/	r3.z = r3.z * vsOut_T7.x;
/*76*/	r3.w = r8.z * 0.250000;
/*77*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*78*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*79*/	r0.xyw = (-r0.xyxw * r5.xyxz + r7.xyxz).xyw;
/*80*/	r0.xyw = (r3.zzzz * r0.xyxw + r6.xyxz).xyw;
/*81*/	r2.w = vsOut_T7.x + -0.025000;
/*82*/	r2.w = max(r2.w, 0.000000);
/*83*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*84*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*85*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*86*/	r2.w = inversesqrt(r2.w);
/*87*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*88*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*89*/	r2.w = inversesqrt(r2.w);
/*90*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*91*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*92*/	r2.w = inversesqrt(r2.w);
/*93*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*94*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*95*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*96*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*97*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*98*/	r2.w = inversesqrt(r2.w);
/*99*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*100*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*101*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*102*/	if(floatBitsToUint(r0.z) != 0u) {
/*103*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*104*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*105*/	  r0.z = r3.w * cb0.data[26].x;
/*106*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*107*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*108*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*109*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*110*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*111*/	}
/*112*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*113*/	if(floatBitsToUint(r0.z) != 0u) {
/*114*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*115*/	  if(floatBitsToUint(r0.z) != 0u) {
/*116*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*117*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*118*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*119*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*120*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*121*/	    r0.z = -r0.z + 1.000000;
/*122*/	    r0.z = max(r0.z, 0.000000);
/*123*/	    r9.z = sqrt(r0.z);
/*124*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*125*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*126*/	    r0.z = inversesqrt(r0.z);
/*127*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*128*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*129*/	    r11.y = -1.000000;
/*130*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*131*/	    r0.z = inversesqrt(r0.z);
/*132*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*133*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*134*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*135*/	    r2.w = r2.w * 1.250000;
/*136*/	    r2.w = min(r2.w, 1.000000);
/*137*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*138*/	    r3.z = r3.z * 4.000000;
/*139*/	    r2.w = r2.w * 0.200000 + r3.z;
/*140*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*141*/	    r0.z = r0.z + -r2.w;
/*142*/	    r0.z = saturate(r0.z * 200.000000);
/*143*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*144*/	    r0.z = r0.z * r0.z;
/*145*/	    r0.z = r0.z * r2.w;
/*146*/	    r3.x = r0.z * -r3.x + r3.x;
/*147*/	    r2.w = -r3.y + 0.200000;
/*148*/	    r3.y = r0.z * r2.w + r3.y;
/*149*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*150*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*151*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*152*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*153*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*154*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*155*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*156*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*157*/	    r2.w = -r2.w + 1.000000;
/*158*/	    r2.w = max(r2.w, 0.000000);
/*159*/	    r8.z = sqrt(r2.w);
/*160*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*161*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*162*/	    r2.w = sqrt(r2.w);
/*163*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*164*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*165*/	    r2.w = inversesqrt(r2.w);
/*166*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*167*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*168*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*169*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*170*/	    r2.w = -r1.y + 1.000000;
/*171*/	    r0.z = min(r0.z, r2.w);
/*172*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*173*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*174*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*175*/	    r0.z = inversesqrt(r0.z);
/*176*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*177*/	  }
/*178*/	}
/*179*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*180*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*181*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*182*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*183*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*184*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*185*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*186*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*187*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*188*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*189*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*190*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*191*/	r2.w = inversesqrt(r2.w);
/*192*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*193*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*194*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*195*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*196*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*197*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*198*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*199*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*200*/	r3.y = intBitsToFloat(int(r2.w));
/*201*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*202*/	if(floatBitsToUint(r3.z) != 0u) {
/*203*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*204*/	  r5.w = vsOut_T0.w;
/*205*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*206*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*207*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*208*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*209*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*210*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*211*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*212*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*213*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*214*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*215*/	  if(floatBitsToUint(r3.w) == 0u) {
/*216*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*217*/	    r7.xy = floor((r6.xyxx).xy);
/*218*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*219*/	    r3.z = -0.000400 / r3.z;
/*220*/	    r3.z = r3.z + r6.z;
/*221*/	    r8.z = -r8.y + 1.000000;
/*222*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*223*/	    r8.w = -r8.y;
/*224*/	    r10.x = cb1.data[0].z/**/;
/*225*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*226*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*227*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*228*/	    r10.w = -cb1.data[0].w/**/;
/*229*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*230*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*231*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*232*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*233*/	    r8.x = r9.x;
/*234*/	    r8.y = r11.x;
/*235*/	    r8.z = r10.x;
/*236*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*237*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*238*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*239*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*240*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*241*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*242*/	    r3.z = -r6.x + r6.y;
/*243*/	    r3.z = r3.w * r3.z + r6.x;
/*244*/	  } else {
/*245*/	    r3.z = 1.000000;
/*246*/	  }
/*247*/	} else {
/*248*/	  r3.z = 1.000000;
/*249*/	}
/*250*/	r3.w = cb1.data[34].w + -1.000000;
/*251*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*252*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*253*/	if(floatBitsToUint(r2.w) == 0u) {
/*254*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*255*/	  r2.w = floatBitsToInt(r2.w);
/*256*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*257*/	  if(floatBitsToUint(r2.w) != 0u) {
/*258*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*259*/	    r5.w = vsOut_T0.w;
/*260*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*261*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*262*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*263*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*264*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*265*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*266*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*267*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*268*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*269*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*270*/	    if(floatBitsToUint(r5.w) == 0u) {
/*271*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*272*/	      r6.xy = floor((r5.xyxx).xy);
/*273*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*274*/	      r2.w = -0.000400 / r2.w;
/*275*/	      r2.w = r2.w + r5.z;
/*276*/	      r7.z = -r7.y + 1.000000;
/*277*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*278*/	      r7.w = -r7.y;
/*279*/	      r9.x = cb1.data[0].z/**/;
/*280*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*281*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*282*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*283*/	      r9.w = -cb1.data[0].w/**/;
/*284*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*285*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*286*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*287*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*288*/	      r7.x = r8.x;
/*289*/	      r7.y = r10.x;
/*290*/	      r7.z = r9.x;
/*291*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*292*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*293*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*294*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*295*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*296*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*297*/	      r2.w = -r5.x + r5.z;
/*298*/	      r2.w = r5.y * r2.w + r5.x;
/*299*/	    } else {
/*300*/	      r2.w = 1.000000;
/*301*/	    }
/*302*/	  } else {
/*303*/	    r2.w = 1.000000;
/*304*/	  }
/*305*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*306*/	  r5.y = r5.x * cb1.data[34].x;
/*307*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*308*/	  r5.x = r1.w + -r5.x;
/*309*/	  r5.x = saturate(r5.x / r5.y);
/*310*/	  r2.w = -r3.z + r2.w;
/*311*/	  r3.z = r5.x * r2.w + r3.z;
/*312*/	}
/*313*/	if(floatBitsToUint(r3.w) != 0u) {
/*314*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*315*/	  r3.w = r2.w * cb1.data[34].y;
/*316*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*317*/	  r2.w = r1.w + -r2.w;
/*318*/	  r2.w = saturate(r2.w / r3.w);
/*319*/	  r3.y = -r3.z + 1.000000;
/*320*/	  r3.z = r2.w * r3.y + r3.z;
/*321*/	}
/*322*/	r3.z = saturate(r3.z);
/*323*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*324*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*325*/	r2.w = inversesqrt(r2.w);
/*326*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*327*/	r2.w = -r3.x + 1.000000;
/*328*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*329*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*330*/	r3.w = r3.w + r3.w;
/*331*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*332*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*333*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*334*/	r3.w = cos((r8.x));
/*335*/	r3.w = inversesqrt(r3.w);
/*336*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*337*/	r5.w = saturate(r0.z * 60.000000);
/*338*/	r5.w = -r0.z + r5.w;
/*339*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*340*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*341*/	r6.w = inversesqrt(r6.w);
/*342*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*343*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*344*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*345*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*346*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*347*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*348*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*349*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*350*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*351*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*352*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*353*/	r6.w = -r0.z + 1.000000;
/*354*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*355*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*356*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*357*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*358*/	  r6.w = max(r6.w, 0.000000);
/*359*/	  r6.w = log2(r6.w);
/*360*/	  r6.w = r6.w * 10.000000;
/*361*/	  r6.w = exp2(r6.w);
/*362*/	  r6.w = r3.w * r6.w;
/*363*/	  r6.w = r6.w * r5.w + r0.z;
/*364*/	  r7.y = r2.w * 8.000000;
/*365*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*366*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*367*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*368*/	}
/*369*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*370*/	r7.y = max(r6.w, 0.000000);
/*371*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*372*/	if(floatBitsToUint(r6.w) != 0u) {
/*373*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*374*/	  r6.x = max(r6.x, -1.000000);
/*375*/	  r6.x = min(r6.x, 1.000000);
/*376*/	  r6.y = -abs(r6.x) + 1.000000;
/*377*/	  r6.y = sqrt(r6.y);
/*378*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*379*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*380*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*381*/	  r6.w = r6.y * r6.z;
/*382*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*383*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*384*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*385*/	  r6.x = r6.z * r6.y + r6.x;
/*386*/	  r3.x = r3.x * r3.x;
/*387*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*388*/	  r3.x = r3.x * r3.y + r7.x;
/*389*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*390*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*391*/	  r3.y = -r3.x * r3.x + 1.000000;
/*392*/	  r3.y = max(r3.y, 0.001000);
/*393*/	  r3.y = log2(r3.y);
/*394*/	  r6.y = r3.y * 4.950617;
/*395*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*396*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*397*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*398*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*399*/	  r3.x = floatBitsToInt(r3.x);
/*400*/	  r6.y = r3.y * r3.y + -r6.y;
/*401*/	  r6.y = sqrt(r6.y);
/*402*/	  r3.y = -r3.y + r6.y;
/*403*/	  r3.y = max(r3.y, 0.000000);
/*404*/	  r3.y = sqrt(r3.y);
/*405*/	  r3.x = r3.y * r3.x;
/*406*/	  r3.x = r3.x * 1.414214;
/*407*/	  r3.x = 0.008727 / r3.x;
/*408*/	  r3.x = max(r3.x, 0.000100);
/*409*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*410*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*411*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*412*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*413*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*414*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*415*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*416*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*417*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*418*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*419*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*420*/	  r3.x = floatBitsToInt(r3.x);
/*421*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*422*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*423*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*424*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*425*/	  r3.x = r3.x * r6.x + 1.000000;
/*426*/	  r3.x = r3.x * 0.500000;
/*427*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*428*/	  r3.y = r3.y * r6.y + 1.000000;
/*429*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*430*/	  r3.y = min(r7.y, 1.000000);
/*431*/	  r2.w = r2.w * 1.570796;
/*432*/	  r2.w = sin(r2.w);
/*433*/	  r3.y = r3.y + -1.000000;
/*434*/	  r2.w = r2.w * r3.y + 1.000000;
/*435*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*436*/	  r3.y = max(r3.y, 0.000000);
/*437*/	  r3.y = log2(r3.y);
/*438*/	  r3.y = r3.y * 10.000000;
/*439*/	  r3.y = exp2(r3.y);
/*440*/	  r3.y = r3.w * r3.y;
/*441*/	  r3.y = r3.y * r5.w + r0.z;
/*442*/	  r2.w = r2.w * abs(r3.x);
/*443*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*444*/	} else {
/*445*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*446*/	}
/*447*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*448*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*449*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*450*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*451*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*452*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*453*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*454*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*455*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*456*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*457*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*458*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*459*/	r2.w = inversesqrt(r2.w);
/*460*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*461*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*462*/	r2.w = r2.w + r2.w;
/*463*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*464*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*465*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*466*/	r1.x = max(r1.x, 0.000000);
/*467*/	r1.x = log2(r1.x);
/*468*/	r1.x = r1.x * 10.000000;
/*469*/	r1.x = exp2(r1.x);
/*470*/	r1.x = r3.w * r1.x;
/*471*/	r0.z = r1.x * r5.w + r0.z;
/*472*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*473*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*474*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*475*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*476*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*477*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*478*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*479*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*480*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*481*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*482*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*483*/	if(r0.x != 0) discard;
/*484*/	color1.x = 1.000000;
/*485*/	return;
}
