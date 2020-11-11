//
//
// Shader Model 4
// Fragment Shader
//
// id: 4551 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_ambient_map;
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
/*40*/	r5.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*41*/	r6.xyz = (r0.xywx * r5.xyzx).xyz;
/*42*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*43*/	r7.x = 0;
/*44*/	r7.y = cb0.data[26].x * 0.050000;
/*45*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*46*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*47*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*48*/	r2.w = saturate(r7.x * 5.000000);
/*49*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*50*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*51*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*52*/	r3.z = log2(r8.z);
/*53*/	r3.z = r3.z * 1.800000;
/*54*/	r3.z = exp2(r3.z);
/*55*/	r3.z = r3.z * 10.000000;
/*56*/	r3.z = min(r3.z, 1.000000);
/*57*/	r2.w = r2.w + r3.z;
/*58*/	r2.w = r2.w * 0.500000;
/*59*/	r3.z = -r8.w + 1.000000;
/*60*/	r3.z = log2(r3.z);
/*61*/	r3.z = r3.z * vsOut_T7.x;
/*62*/	r3.z = exp2(r3.z);
/*63*/	r3.z = min(r3.z, 1.000000);
/*64*/	r3.z = r3.z * vsOut_T7.x;
/*65*/	r3.w = r8.z * 0.250000;
/*66*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*67*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*68*/	r0.xyw = (-r0.xyxw * r5.xyxz + r7.xyxz).xyw;
/*69*/	r0.xyw = (r3.zzzz * r0.xyxw + r6.xyxz).xyw;
/*70*/	r2.w = vsOut_T7.x + -0.025000;
/*71*/	r2.w = max(r2.w, 0.000000);
/*72*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*73*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*74*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*75*/	r2.w = inversesqrt(r2.w);
/*76*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*77*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*78*/	r2.w = inversesqrt(r2.w);
/*79*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*80*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*81*/	r2.w = inversesqrt(r2.w);
/*82*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*83*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*84*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*85*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*86*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*87*/	r2.w = inversesqrt(r2.w);
/*88*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*89*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*90*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*91*/	if(floatBitsToUint(r0.z) != 0u) {
/*92*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*93*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*94*/	  r0.z = r3.w * cb0.data[26].x;
/*95*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*96*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*97*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*98*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*99*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*100*/	}
/*101*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*102*/	if(floatBitsToUint(r0.z) != 0u) {
/*103*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*104*/	  if(floatBitsToUint(r0.z) != 0u) {
/*105*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*106*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*107*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*108*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*109*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*110*/	    r0.z = -r0.z + 1.000000;
/*111*/	    r0.z = max(r0.z, 0.000000);
/*112*/	    r9.z = sqrt(r0.z);
/*113*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*114*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*115*/	    r0.z = inversesqrt(r0.z);
/*116*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*117*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*118*/	    r11.y = -1.000000;
/*119*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*120*/	    r0.z = inversesqrt(r0.z);
/*121*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*122*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*123*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*124*/	    r2.w = r2.w * 1.250000;
/*125*/	    r2.w = min(r2.w, 1.000000);
/*126*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*127*/	    r3.z = r3.z * 4.000000;
/*128*/	    r2.w = r2.w * 0.200000 + r3.z;
/*129*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*130*/	    r0.z = r0.z + -r2.w;
/*131*/	    r0.z = saturate(r0.z * 200.000000);
/*132*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*133*/	    r0.z = r0.z * r0.z;
/*134*/	    r0.z = r0.z * r2.w;
/*135*/	    r3.x = r0.z * -r3.x + r3.x;
/*136*/	    r2.w = -r3.y + 0.200000;
/*137*/	    r3.y = r0.z * r2.w + r3.y;
/*138*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*139*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*140*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*141*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*142*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*143*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*144*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*145*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*146*/	    r2.w = -r2.w + 1.000000;
/*147*/	    r2.w = max(r2.w, 0.000000);
/*148*/	    r8.z = sqrt(r2.w);
/*149*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*150*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*151*/	    r2.w = sqrt(r2.w);
/*152*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*153*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*154*/	    r2.w = inversesqrt(r2.w);
/*155*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*156*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*157*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*158*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*159*/	    r2.w = -r1.y + 1.000000;
/*160*/	    r0.z = min(r0.z, r2.w);
/*161*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*162*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*163*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*164*/	    r0.z = inversesqrt(r0.z);
/*165*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*166*/	  }
/*167*/	}
/*168*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*169*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*170*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*171*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*172*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*173*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*174*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*175*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*176*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*177*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*178*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*179*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*180*/	r2.w = inversesqrt(r2.w);
/*181*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*182*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*183*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*184*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*185*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*187*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*188*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*189*/	r3.y = intBitsToFloat(int(r2.w));
/*190*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*191*/	if(floatBitsToUint(r3.z) != 0u) {
/*192*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*193*/	  r5.w = vsOut_T0.w;
/*194*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*195*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*196*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*197*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*198*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*199*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*200*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*201*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*202*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*203*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*204*/	  if(floatBitsToUint(r3.w) == 0u) {
/*205*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*206*/	    r7.xy = floor((r6.xyxx).xy);
/*207*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*208*/	    r3.z = -0.000400 / r3.z;
/*209*/	    r3.z = r3.z + r6.z;
/*210*/	    r8.z = -r8.y + 1.000000;
/*211*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*212*/	    r8.w = -r8.y;
/*213*/	    r10.x = cb1.data[0].z/**/;
/*214*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*215*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*216*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*217*/	    r10.w = -cb1.data[0].w/**/;
/*218*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*219*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*220*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*221*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*222*/	    r8.x = r9.x;
/*223*/	    r8.y = r11.x;
/*224*/	    r8.z = r10.x;
/*225*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*226*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*227*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*228*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*229*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*230*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*231*/	    r3.z = -r6.x + r6.y;
/*232*/	    r3.z = r3.w * r3.z + r6.x;
/*233*/	  } else {
/*234*/	    r3.z = 1.000000;
/*235*/	  }
/*236*/	} else {
/*237*/	  r3.z = 1.000000;
/*238*/	}
/*239*/	r3.w = cb1.data[34].w + -1.000000;
/*240*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*241*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*242*/	if(floatBitsToUint(r2.w) == 0u) {
/*243*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*244*/	  r2.w = floatBitsToInt(r2.w);
/*245*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*246*/	  if(floatBitsToUint(r2.w) != 0u) {
/*247*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*248*/	    r5.w = vsOut_T0.w;
/*249*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*250*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*251*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*252*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*253*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*254*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*255*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*256*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*257*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*258*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*259*/	    if(floatBitsToUint(r5.w) == 0u) {
/*260*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*261*/	      r6.xy = floor((r5.xyxx).xy);
/*262*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*263*/	      r2.w = -0.000400 / r2.w;
/*264*/	      r2.w = r2.w + r5.z;
/*265*/	      r7.z = -r7.y + 1.000000;
/*266*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*267*/	      r7.w = -r7.y;
/*268*/	      r9.x = cb1.data[0].z/**/;
/*269*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*270*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*271*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*272*/	      r9.w = -cb1.data[0].w/**/;
/*273*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*274*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*275*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*276*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*277*/	      r7.x = r8.x;
/*278*/	      r7.y = r10.x;
/*279*/	      r7.z = r9.x;
/*280*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*281*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*282*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*283*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*284*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*285*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*286*/	      r2.w = -r5.x + r5.z;
/*287*/	      r2.w = r5.y * r2.w + r5.x;
/*288*/	    } else {
/*289*/	      r2.w = 1.000000;
/*290*/	    }
/*291*/	  } else {
/*292*/	    r2.w = 1.000000;
/*293*/	  }
/*294*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*295*/	  r5.y = r5.x * cb1.data[34].x;
/*296*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*297*/	  r5.x = r1.w + -r5.x;
/*298*/	  r5.x = saturate(r5.x / r5.y);
/*299*/	  r2.w = -r3.z + r2.w;
/*300*/	  r3.z = r5.x * r2.w + r3.z;
/*301*/	}
/*302*/	if(floatBitsToUint(r3.w) != 0u) {
/*303*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*304*/	  r3.w = r2.w * cb1.data[34].y;
/*305*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*306*/	  r2.w = r1.w + -r2.w;
/*307*/	  r2.w = saturate(r2.w / r3.w);
/*308*/	  r3.y = -r3.z + 1.000000;
/*309*/	  r3.z = r2.w * r3.y + r3.z;
/*310*/	}
/*311*/	r3.z = saturate(r3.z);
/*312*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*313*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*314*/	r2.w = inversesqrt(r2.w);
/*315*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*316*/	r2.w = -r3.x + 1.000000;
/*317*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*318*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*319*/	r3.w = r3.w + r3.w;
/*320*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*321*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*322*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*323*/	r3.w = cos((r8.x));
/*324*/	r3.w = inversesqrt(r3.w);
/*325*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*326*/	r5.w = saturate(r0.z * 60.000000);
/*327*/	r5.w = -r0.z + r5.w;
/*328*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*329*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*330*/	r6.w = inversesqrt(r6.w);
/*331*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*332*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*333*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*334*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*335*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*336*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*337*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*338*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*339*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*340*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*341*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*342*/	r6.w = -r0.z + 1.000000;
/*343*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*344*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*345*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*346*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*347*/	  r6.w = max(r6.w, 0.000000);
/*348*/	  r6.w = log2(r6.w);
/*349*/	  r6.w = r6.w * 10.000000;
/*350*/	  r6.w = exp2(r6.w);
/*351*/	  r6.w = r3.w * r6.w;
/*352*/	  r6.w = r6.w * r5.w + r0.z;
/*353*/	  r7.y = r2.w * 8.000000;
/*354*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*355*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*356*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*357*/	}
/*358*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*359*/	r7.y = max(r6.w, 0.000000);
/*360*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*361*/	if(floatBitsToUint(r6.w) != 0u) {
/*362*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*363*/	  r6.x = max(r6.x, -1.000000);
/*364*/	  r6.x = min(r6.x, 1.000000);
/*365*/	  r6.y = -abs(r6.x) + 1.000000;
/*366*/	  r6.y = sqrt(r6.y);
/*367*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*368*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*369*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*370*/	  r6.w = r6.y * r6.z;
/*371*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*372*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*373*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*374*/	  r6.x = r6.z * r6.y + r6.x;
/*375*/	  r3.x = r3.x * r3.x;
/*376*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*377*/	  r3.x = r3.x * r3.y + r7.x;
/*378*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*379*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*380*/	  r3.y = -r3.x * r3.x + 1.000000;
/*381*/	  r3.y = max(r3.y, 0.001000);
/*382*/	  r3.y = log2(r3.y);
/*383*/	  r6.y = r3.y * 4.950617;
/*384*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*385*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*386*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*387*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*388*/	  r3.x = floatBitsToInt(r3.x);
/*389*/	  r6.y = r3.y * r3.y + -r6.y;
/*390*/	  r6.y = sqrt(r6.y);
/*391*/	  r3.y = -r3.y + r6.y;
/*392*/	  r3.y = max(r3.y, 0.000000);
/*393*/	  r3.y = sqrt(r3.y);
/*394*/	  r3.x = r3.y * r3.x;
/*395*/	  r3.x = r3.x * 1.414214;
/*396*/	  r3.x = 0.008727 / r3.x;
/*397*/	  r3.x = max(r3.x, 0.000100);
/*398*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*399*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*400*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*401*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*402*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*403*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*404*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*405*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*406*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*407*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*408*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*409*/	  r3.x = floatBitsToInt(r3.x);
/*410*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*411*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*412*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*413*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*414*/	  r3.x = r3.x * r6.x + 1.000000;
/*415*/	  r3.x = r3.x * 0.500000;
/*416*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*417*/	  r3.y = r3.y * r6.y + 1.000000;
/*418*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*419*/	  r3.y = min(r7.y, 1.000000);
/*420*/	  r2.w = r2.w * 1.570796;
/*421*/	  r2.w = sin(r2.w);
/*422*/	  r3.y = r3.y + -1.000000;
/*423*/	  r2.w = r2.w * r3.y + 1.000000;
/*424*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*425*/	  r3.y = max(r3.y, 0.000000);
/*426*/	  r3.y = log2(r3.y);
/*427*/	  r3.y = r3.y * 10.000000;
/*428*/	  r3.y = exp2(r3.y);
/*429*/	  r3.y = r3.w * r3.y;
/*430*/	  r3.y = r3.y * r5.w + r0.z;
/*431*/	  r2.w = r2.w * abs(r3.x);
/*432*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*433*/	} else {
/*434*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*435*/	}
/*436*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*437*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*438*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*439*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*440*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*441*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*442*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*443*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*444*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*445*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*446*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*447*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*448*/	r2.w = inversesqrt(r2.w);
/*449*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*450*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*451*/	r2.w = r2.w + r2.w;
/*452*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*453*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*454*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*455*/	r1.x = max(r1.x, 0.000000);
/*456*/	r1.x = log2(r1.x);
/*457*/	r1.x = r1.x * 10.000000;
/*458*/	r1.x = exp2(r1.x);
/*459*/	r1.x = r3.w * r1.x;
/*460*/	r0.z = r1.x * r5.w + r0.z;
/*461*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*462*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*463*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*464*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*465*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*466*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*467*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*468*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*469*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*470*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*471*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*472*/	if(r0.x != 0) discard;
/*473*/	color1.x = 1.000000;
/*474*/	return;
}
