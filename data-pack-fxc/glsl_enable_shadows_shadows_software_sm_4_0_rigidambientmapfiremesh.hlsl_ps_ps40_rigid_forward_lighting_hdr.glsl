//
//
// Shader Model 4
// Fragment Shader
//
// id: 4549 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*44*/	r5.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*45*/	r6.xyz = (r0.xywx * r5.xyzx).xyz;
/*46*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*47*/	r7.x = 0;
/*48*/	r7.y = cb0.data[26].x * 0.050000;
/*49*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*50*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*51*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*52*/	r2.w = saturate(r7.x * 5.000000);
/*53*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*54*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*55*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*56*/	r3.z = log2(r8.z);
/*57*/	r3.z = r3.z * 1.800000;
/*58*/	r3.z = exp2(r3.z);
/*59*/	r3.z = r3.z * 10.000000;
/*60*/	r3.z = min(r3.z, 1.000000);
/*61*/	r2.w = r2.w + r3.z;
/*62*/	r2.w = r2.w * 0.500000;
/*63*/	r3.z = -r8.w + 1.000000;
/*64*/	r3.z = log2(r3.z);
/*65*/	r3.z = r3.z * vsOut_T7.x;
/*66*/	r3.z = exp2(r3.z);
/*67*/	r3.z = min(r3.z, 1.000000);
/*68*/	r3.z = r3.z * vsOut_T7.x;
/*69*/	r3.w = r8.z * 0.250000;
/*70*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*71*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*72*/	r0.xyw = (-r0.xyxw * r5.xyxz + r7.xyxz).xyw;
/*73*/	r0.xyw = (r3.zzzz * r0.xyxw + r6.xyxz).xyw;
/*74*/	r2.w = vsOut_T7.x + -0.025000;
/*75*/	r2.w = max(r2.w, 0.000000);
/*76*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*77*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*78*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*79*/	r2.w = inversesqrt(r2.w);
/*80*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*81*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*82*/	r2.w = inversesqrt(r2.w);
/*83*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*84*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*85*/	r2.w = inversesqrt(r2.w);
/*86*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*87*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*88*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*89*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*90*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*91*/	r2.w = inversesqrt(r2.w);
/*92*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*93*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*94*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*95*/	if(floatBitsToUint(r0.z) != 0u) {
/*96*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*97*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*98*/	  r0.z = r3.w * cb0.data[26].x;
/*99*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*100*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*101*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*102*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*103*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*104*/	}
/*105*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*106*/	if(floatBitsToUint(r0.z) != 0u) {
/*107*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*108*/	  if(floatBitsToUint(r0.z) != 0u) {
/*109*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*110*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*111*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*112*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*113*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*114*/	    r0.z = -r0.z + 1.000000;
/*115*/	    r0.z = max(r0.z, 0.000000);
/*116*/	    r9.z = sqrt(r0.z);
/*117*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*118*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*119*/	    r0.z = inversesqrt(r0.z);
/*120*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*121*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*122*/	    r11.y = -1.000000;
/*123*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*124*/	    r0.z = inversesqrt(r0.z);
/*125*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*126*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*127*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*128*/	    r2.w = r2.w * 1.250000;
/*129*/	    r2.w = min(r2.w, 1.000000);
/*130*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*131*/	    r3.z = r3.z * 4.000000;
/*132*/	    r2.w = r2.w * 0.200000 + r3.z;
/*133*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*134*/	    r0.z = r0.z + -r2.w;
/*135*/	    r0.z = saturate(r0.z * 200.000000);
/*136*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*137*/	    r0.z = r0.z * r0.z;
/*138*/	    r0.z = r0.z * r2.w;
/*139*/	    r3.x = r0.z * -r3.x + r3.x;
/*140*/	    r2.w = -r3.y + 0.200000;
/*141*/	    r3.y = r0.z * r2.w + r3.y;
/*142*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*143*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*144*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*145*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*146*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*147*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*148*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*149*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*150*/	    r2.w = -r2.w + 1.000000;
/*151*/	    r2.w = max(r2.w, 0.000000);
/*152*/	    r8.z = sqrt(r2.w);
/*153*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*154*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*155*/	    r2.w = sqrt(r2.w);
/*156*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*157*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*158*/	    r2.w = inversesqrt(r2.w);
/*159*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*160*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*161*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*162*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*163*/	    r2.w = -r1.y + 1.000000;
/*164*/	    r0.z = min(r0.z, r2.w);
/*165*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*166*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*167*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*168*/	    r0.z = inversesqrt(r0.z);
/*169*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*170*/	  }
/*171*/	}
/*172*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*173*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*174*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*175*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*176*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*177*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*178*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*179*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*180*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*181*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*182*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*183*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*184*/	r2.w = inversesqrt(r2.w);
/*185*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*186*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*187*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*188*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*189*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*190*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*191*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*192*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*193*/	r3.y = intBitsToFloat(int(r2.w));
/*194*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*195*/	if(floatBitsToUint(r3.z) != 0u) {
/*196*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*197*/	  r5.w = vsOut_T0.w;
/*198*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*199*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*200*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*201*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*202*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*203*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*204*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*205*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*206*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*207*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*208*/	  if(floatBitsToUint(r3.w) == 0u) {
/*209*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*210*/	    r7.xy = floor((r6.xyxx).xy);
/*211*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*212*/	    r3.z = -0.000400 / r3.z;
/*213*/	    r3.z = r3.z + r6.z;
/*214*/	    r8.z = -r8.y + 1.000000;
/*215*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*216*/	    r8.w = -r8.y;
/*217*/	    r10.x = cb1.data[0].z/**/;
/*218*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*219*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*220*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*221*/	    r10.w = -cb1.data[0].w/**/;
/*222*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*223*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*224*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*225*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*226*/	    r8.x = r9.x;
/*227*/	    r8.y = r11.x;
/*228*/	    r8.z = r10.x;
/*229*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*230*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*231*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*232*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*233*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*234*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*235*/	    r3.z = -r6.x + r6.y;
/*236*/	    r3.z = r3.w * r3.z + r6.x;
/*237*/	  } else {
/*238*/	    r3.z = 1.000000;
/*239*/	  }
/*240*/	} else {
/*241*/	  r3.z = 1.000000;
/*242*/	}
/*243*/	r3.w = cb1.data[34].w + -1.000000;
/*244*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*245*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*246*/	if(floatBitsToUint(r2.w) == 0u) {
/*247*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*248*/	  r2.w = floatBitsToInt(r2.w);
/*249*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*250*/	  if(floatBitsToUint(r2.w) != 0u) {
/*251*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*252*/	    r5.w = vsOut_T0.w;
/*253*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*254*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*255*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*256*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*257*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*258*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*259*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*260*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*261*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*262*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*263*/	    if(floatBitsToUint(r5.w) == 0u) {
/*264*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*265*/	      r6.xy = floor((r5.xyxx).xy);
/*266*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*267*/	      r2.w = -0.000400 / r2.w;
/*268*/	      r2.w = r2.w + r5.z;
/*269*/	      r7.z = -r7.y + 1.000000;
/*270*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*271*/	      r7.w = -r7.y;
/*272*/	      r9.x = cb1.data[0].z/**/;
/*273*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*274*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*275*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*276*/	      r9.w = -cb1.data[0].w/**/;
/*277*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*278*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*279*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*280*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*281*/	      r7.x = r8.x;
/*282*/	      r7.y = r10.x;
/*283*/	      r7.z = r9.x;
/*284*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*285*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*286*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*287*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*288*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*289*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*290*/	      r2.w = -r5.x + r5.z;
/*291*/	      r2.w = r5.y * r2.w + r5.x;
/*292*/	    } else {
/*293*/	      r2.w = 1.000000;
/*294*/	    }
/*295*/	  } else {
/*296*/	    r2.w = 1.000000;
/*297*/	  }
/*298*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*299*/	  r5.y = r5.x * cb1.data[34].x;
/*300*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*301*/	  r5.x = r1.w + -r5.x;
/*302*/	  r5.x = saturate(r5.x / r5.y);
/*303*/	  r2.w = -r3.z + r2.w;
/*304*/	  r3.z = r5.x * r2.w + r3.z;
/*305*/	}
/*306*/	if(floatBitsToUint(r3.w) != 0u) {
/*307*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*308*/	  r3.w = r2.w * cb1.data[34].y;
/*309*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*310*/	  r2.w = r1.w + -r2.w;
/*311*/	  r2.w = saturate(r2.w / r3.w);
/*312*/	  r3.y = -r3.z + 1.000000;
/*313*/	  r3.z = r2.w * r3.y + r3.z;
/*314*/	}
/*315*/	r3.z = saturate(r3.z);
/*316*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*317*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*318*/	r2.w = inversesqrt(r2.w);
/*319*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*320*/	r2.w = -r3.x + 1.000000;
/*321*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*322*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*323*/	r3.w = r3.w + r3.w;
/*324*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*325*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*326*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*327*/	r3.w = cos((r8.x));
/*328*/	r3.w = inversesqrt(r3.w);
/*329*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*330*/	r5.w = saturate(r0.z * 60.000000);
/*331*/	r5.w = -r0.z + r5.w;
/*332*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*333*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*334*/	r6.w = inversesqrt(r6.w);
/*335*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*336*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*337*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*338*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*339*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*340*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*341*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*342*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*343*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*344*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*345*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*346*/	r6.w = -r0.z + 1.000000;
/*347*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*348*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*349*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*350*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*351*/	  r6.w = max(r6.w, 0.000000);
/*352*/	  r6.w = log2(r6.w);
/*353*/	  r6.w = r6.w * 10.000000;
/*354*/	  r6.w = exp2(r6.w);
/*355*/	  r6.w = r3.w * r6.w;
/*356*/	  r6.w = r6.w * r5.w + r0.z;
/*357*/	  r7.y = r2.w * 8.000000;
/*358*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*359*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*360*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*361*/	}
/*362*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*363*/	r7.y = max(r6.w, 0.000000);
/*364*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*365*/	if(floatBitsToUint(r6.w) != 0u) {
/*366*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*367*/	  r6.x = max(r6.x, -1.000000);
/*368*/	  r6.x = min(r6.x, 1.000000);
/*369*/	  r6.y = -abs(r6.x) + 1.000000;
/*370*/	  r6.y = sqrt(r6.y);
/*371*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*372*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*373*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*374*/	  r6.w = r6.y * r6.z;
/*375*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*376*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*377*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*378*/	  r6.x = r6.z * r6.y + r6.x;
/*379*/	  r3.x = r3.x * r3.x;
/*380*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*381*/	  r3.x = r3.x * r3.y + r7.x;
/*382*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*383*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*384*/	  r3.y = -r3.x * r3.x + 1.000000;
/*385*/	  r3.y = max(r3.y, 0.001000);
/*386*/	  r3.y = log2(r3.y);
/*387*/	  r6.y = r3.y * 4.950617;
/*388*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*389*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*390*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*391*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*392*/	  r3.x = floatBitsToInt(r3.x);
/*393*/	  r6.y = r3.y * r3.y + -r6.y;
/*394*/	  r6.y = sqrt(r6.y);
/*395*/	  r3.y = -r3.y + r6.y;
/*396*/	  r3.y = max(r3.y, 0.000000);
/*397*/	  r3.y = sqrt(r3.y);
/*398*/	  r3.x = r3.y * r3.x;
/*399*/	  r3.x = r3.x * 1.414214;
/*400*/	  r3.x = 0.008727 / r3.x;
/*401*/	  r3.x = max(r3.x, 0.000100);
/*402*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*403*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*404*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*405*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*406*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*407*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*408*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*409*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*410*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*411*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*412*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*413*/	  r3.x = floatBitsToInt(r3.x);
/*414*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*415*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*416*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*417*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*418*/	  r3.x = r3.x * r6.x + 1.000000;
/*419*/	  r3.x = r3.x * 0.500000;
/*420*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*421*/	  r3.y = r3.y * r6.y + 1.000000;
/*422*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*423*/	  r3.y = min(r7.y, 1.000000);
/*424*/	  r2.w = r2.w * 1.570796;
/*425*/	  r2.w = sin(r2.w);
/*426*/	  r3.y = r3.y + -1.000000;
/*427*/	  r2.w = r2.w * r3.y + 1.000000;
/*428*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*429*/	  r3.y = max(r3.y, 0.000000);
/*430*/	  r3.y = log2(r3.y);
/*431*/	  r3.y = r3.y * 10.000000;
/*432*/	  r3.y = exp2(r3.y);
/*433*/	  r3.y = r3.w * r3.y;
/*434*/	  r3.y = r3.y * r5.w + r0.z;
/*435*/	  r2.w = r2.w * abs(r3.x);
/*436*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*437*/	} else {
/*438*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*439*/	}
/*440*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*441*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*442*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*443*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*444*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*445*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*446*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*447*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*448*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*449*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*450*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*451*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*452*/	r2.w = inversesqrt(r2.w);
/*453*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*454*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*455*/	r2.w = r2.w + r2.w;
/*456*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*457*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*458*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*459*/	r1.x = max(r1.x, 0.000000);
/*460*/	r1.x = log2(r1.x);
/*461*/	r1.x = r1.x * 10.000000;
/*462*/	r1.x = exp2(r1.x);
/*463*/	r1.x = r3.w * r1.x;
/*464*/	r0.z = r1.x * r5.w + r0.z;
/*465*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*466*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*467*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*468*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*469*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*470*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*471*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*472*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*473*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*474*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*475*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*476*/	if(r0.x != 0) discard;
/*477*/	color1.x = 1.000000;
/*478*/	return;
}
