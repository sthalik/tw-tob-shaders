//
//
// Shader Model 4
// Fragment Shader
//
// id: 4726 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandardfire.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*44*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*45*/	r5.x = 0;
/*46*/	r5.y = cb0.data[26].x * 0.050000;
/*47*/	r5.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r5.xyxx).xy;
/*48*/	r5.xyzw = (texture(s_fire_map, r5.xyxx.st)).xyzw;
/*49*/	r6.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*50*/	r2.w = saturate(r5.x * 5.000000);
/*51*/	r5.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*52*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*53*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*54*/	r3.z = log2(r6.z);
/*55*/	r3.z = r3.z * 1.800000;
/*56*/	r3.z = exp2(r3.z);
/*57*/	r3.z = r3.z * 10.000000;
/*58*/	r3.z = min(r3.z, 1.000000);
/*59*/	r2.w = r2.w + r3.z;
/*60*/	r2.w = r2.w * 0.500000;
/*61*/	r3.z = -r6.w + 1.000000;
/*62*/	r3.z = log2(r3.z);
/*63*/	r3.z = r3.z * vsOut_T7.x;
/*64*/	r3.z = exp2(r3.z);
/*65*/	r3.z = min(r3.z, 1.000000);
/*66*/	r3.z = r3.z * vsOut_T7.x;
/*67*/	r3.w = r6.z * 0.250000;
/*68*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*69*/	r5.xyz = (r2.wwww * r5.xyzx + r3.wwww).xyz;
/*70*/	r5.xyz = (-r0.xywx + r5.xyzx).xyz;
/*71*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*72*/	r2.w = vsOut_T7.x + -0.025000;
/*73*/	r2.w = max(r2.w, 0.000000);
/*74*/	r5.xyz = (r6.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*75*/	r0.xyw = (r2.wwww * r5.xyxz + r0.xyxw).xyw;
/*76*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	r2.w = inversesqrt(r2.w);
/*78*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*79*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*82*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	r2.w = inversesqrt(r2.w);
/*84*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*85*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*86*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*87*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*88*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*89*/	r2.w = inversesqrt(r2.w);
/*90*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*91*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*92*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*93*/	if(floatBitsToUint(r0.z) != 0u) {
/*94*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*95*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*96*/	  r0.z = r3.w * cb0.data[26].x;
/*97*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*98*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*99*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*100*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*101*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*102*/	}
/*103*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*104*/	if(floatBitsToUint(r0.z) != 0u) {
/*105*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*106*/	  if(floatBitsToUint(r0.z) != 0u) {
/*107*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*108*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*109*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*110*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*111*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*112*/	    r0.z = -r0.z + 1.000000;
/*113*/	    r0.z = max(r0.z, 0.000000);
/*114*/	    r9.z = sqrt(r0.z);
/*115*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*116*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*117*/	    r0.z = inversesqrt(r0.z);
/*118*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*119*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*120*/	    r11.y = -1.000000;
/*121*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*122*/	    r0.z = inversesqrt(r0.z);
/*123*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*124*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*125*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*126*/	    r2.w = r2.w * 1.250000;
/*127*/	    r2.w = min(r2.w, 1.000000);
/*128*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*129*/	    r3.z = r3.z * 4.000000;
/*130*/	    r2.w = r2.w * 0.200000 + r3.z;
/*131*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*132*/	    r0.z = r0.z + -r2.w;
/*133*/	    r0.z = saturate(r0.z * 200.000000);
/*134*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*135*/	    r0.z = r0.z * r0.z;
/*136*/	    r0.z = r0.z * r2.w;
/*137*/	    r3.x = r0.z * -r3.x + r3.x;
/*138*/	    r2.w = -r3.y + 0.200000;
/*139*/	    r3.y = r0.z * r2.w + r3.y;
/*140*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*141*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*142*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*143*/	    r2.xyz = (r0.zzzz * r10.xyzx + r2.xyzx).xyz;
/*144*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*145*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*146*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*147*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*148*/	    r2.w = -r2.w + 1.000000;
/*149*/	    r2.w = max(r2.w, 0.000000);
/*150*/	    r8.z = sqrt(r2.w);
/*151*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*152*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*153*/	    r2.w = sqrt(r2.w);
/*154*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*155*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*156*/	    r2.w = inversesqrt(r2.w);
/*157*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*158*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*159*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*160*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*161*/	    r2.w = -r1.y + 1.000000;
/*162*/	    r0.z = min(r0.z, r2.w);
/*163*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*164*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*165*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*166*/	    r0.z = inversesqrt(r0.z);
/*167*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*168*/	  }
/*169*/	}
/*170*/	r0.z = vsOut_T7.y * -r3.y + r3.y;
/*171*/	r3.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*172*/	r3.yzw = (-r0.xxyw + r3.yyzw).yzw;
/*173*/	r0.xyw = saturate(vsOut_T7.yyyy * r3.yzyw + r0.xyxw).xyw;
/*174*/	r2.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*175*/	r3.yzw = (-r0.xxyw + r2.wwww).yzw;
/*176*/	r0.xyw = (vsOut_T7.zzzz * r3.yzyw + r0.xyxw).xyw;
/*177*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*178*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*179*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*180*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*181*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*182*/	r2.w = inversesqrt(r2.w);
/*183*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*184*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*185*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*187*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*188*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*189*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*190*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*191*/	r3.y = intBitsToFloat(int(r2.w));
/*192*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*193*/	if(floatBitsToUint(r3.z) != 0u) {
/*194*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*195*/	  r5.w = vsOut_T0.w;
/*196*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*197*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*198*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*199*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*200*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*201*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*202*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*203*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*204*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*205*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*206*/	  if(floatBitsToUint(r3.w) == 0u) {
/*207*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*208*/	    r7.xy = floor((r6.xyxx).xy);
/*209*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*210*/	    r3.z = -0.000400 / r3.z;
/*211*/	    r3.z = r3.z + r6.z;
/*212*/	    r8.z = -r8.y + 1.000000;
/*213*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*214*/	    r8.w = -r8.y;
/*215*/	    r10.x = cb1.data[0].z/**/;
/*216*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*217*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*218*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*219*/	    r10.w = -cb1.data[0].w/**/;
/*220*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*221*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*222*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*223*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*224*/	    r8.x = r9.x;
/*225*/	    r8.y = r11.x;
/*226*/	    r8.z = r10.x;
/*227*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*228*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*229*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*230*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*231*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*232*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*233*/	    r3.z = -r6.x + r6.y;
/*234*/	    r3.z = r3.w * r3.z + r6.x;
/*235*/	  } else {
/*236*/	    r3.z = 1.000000;
/*237*/	  }
/*238*/	} else {
/*239*/	  r3.z = 1.000000;
/*240*/	}
/*241*/	r3.w = cb1.data[34].w + -1.000000;
/*242*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*243*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*244*/	if(floatBitsToUint(r2.w) == 0u) {
/*245*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*246*/	  r2.w = floatBitsToInt(r2.w);
/*247*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*248*/	  if(floatBitsToUint(r2.w) != 0u) {
/*249*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*250*/	    r5.w = vsOut_T0.w;
/*251*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*252*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*253*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*254*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*255*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*256*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*257*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*258*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*259*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*260*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*261*/	    if(floatBitsToUint(r5.w) == 0u) {
/*262*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*263*/	      r6.xy = floor((r5.xyxx).xy);
/*264*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*265*/	      r2.w = -0.000400 / r2.w;
/*266*/	      r2.w = r2.w + r5.z;
/*267*/	      r7.z = -r7.y + 1.000000;
/*268*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*269*/	      r7.w = -r7.y;
/*270*/	      r9.x = cb1.data[0].z/**/;
/*271*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*272*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*273*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*274*/	      r9.w = -cb1.data[0].w/**/;
/*275*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*276*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*277*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*278*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*279*/	      r7.x = r8.x;
/*280*/	      r7.y = r10.x;
/*281*/	      r7.z = r9.x;
/*282*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*283*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*284*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*285*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*286*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*287*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*288*/	      r2.w = -r5.x + r5.z;
/*289*/	      r2.w = r5.y * r2.w + r5.x;
/*290*/	    } else {
/*291*/	      r2.w = 1.000000;
/*292*/	    }
/*293*/	  } else {
/*294*/	    r2.w = 1.000000;
/*295*/	  }
/*296*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*297*/	  r5.y = r5.x * cb1.data[34].x;
/*298*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*299*/	  r5.x = r1.w + -r5.x;
/*300*/	  r5.x = saturate(r5.x / r5.y);
/*301*/	  r2.w = -r3.z + r2.w;
/*302*/	  r3.z = r5.x * r2.w + r3.z;
/*303*/	}
/*304*/	if(floatBitsToUint(r3.w) != 0u) {
/*305*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*306*/	  r3.w = r2.w * cb1.data[34].y;
/*307*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*308*/	  r2.w = r1.w + -r2.w;
/*309*/	  r2.w = saturate(r2.w / r3.w);
/*310*/	  r3.y = -r3.z + 1.000000;
/*311*/	  r3.z = r2.w * r3.y + r3.z;
/*312*/	}
/*313*/	r3.z = saturate(r3.z);
/*314*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*315*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*316*/	r2.w = inversesqrt(r2.w);
/*317*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*318*/	r2.w = -r3.x + 1.000000;
/*319*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*320*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*321*/	r3.w = r3.w + r3.w;
/*322*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*323*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*324*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*325*/	r3.w = cos((r8.x));
/*326*/	r3.w = inversesqrt(r3.w);
/*327*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*328*/	r5.w = saturate(r0.z * 60.000000);
/*329*/	r5.w = -r0.z + r5.w;
/*330*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*331*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*332*/	r6.w = inversesqrt(r6.w);
/*333*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*334*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*335*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*336*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*337*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*338*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*339*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*340*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*341*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*342*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*343*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*344*/	r6.w = -r0.z + 1.000000;
/*345*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*346*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*347*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*348*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*349*/	  r6.w = max(r6.w, 0.000000);
/*350*/	  r6.w = log2(r6.w);
/*351*/	  r6.w = r6.w * 10.000000;
/*352*/	  r6.w = exp2(r6.w);
/*353*/	  r6.w = r3.w * r6.w;
/*354*/	  r6.w = r6.w * r5.w + r0.z;
/*355*/	  r7.y = r2.w * 8.000000;
/*356*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*357*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*358*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*359*/	}
/*360*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*361*/	r7.y = max(r6.w, 0.000000);
/*362*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*363*/	if(floatBitsToUint(r6.w) != 0u) {
/*364*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*365*/	  r6.x = max(r6.x, -1.000000);
/*366*/	  r6.x = min(r6.x, 1.000000);
/*367*/	  r6.y = -abs(r6.x) + 1.000000;
/*368*/	  r6.y = sqrt(r6.y);
/*369*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*370*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*371*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*372*/	  r6.w = r6.y * r6.z;
/*373*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*374*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*375*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*376*/	  r6.x = r6.z * r6.y + r6.x;
/*377*/	  r3.x = r3.x * r3.x;
/*378*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*379*/	  r3.x = r3.x * r3.y + r7.x;
/*380*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*381*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*382*/	  r3.y = -r3.x * r3.x + 1.000000;
/*383*/	  r3.y = max(r3.y, 0.001000);
/*384*/	  r3.y = log2(r3.y);
/*385*/	  r6.y = r3.y * 4.950617;
/*386*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*387*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*388*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*389*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*390*/	  r3.x = floatBitsToInt(r3.x);
/*391*/	  r6.y = r3.y * r3.y + -r6.y;
/*392*/	  r6.y = sqrt(r6.y);
/*393*/	  r3.y = -r3.y + r6.y;
/*394*/	  r3.y = max(r3.y, 0.000000);
/*395*/	  r3.y = sqrt(r3.y);
/*396*/	  r3.x = r3.y * r3.x;
/*397*/	  r3.x = r3.x * 1.414214;
/*398*/	  r3.x = 0.008727 / r3.x;
/*399*/	  r3.x = max(r3.x, 0.000100);
/*400*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*401*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*402*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*403*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*404*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*405*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*406*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*407*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*408*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*409*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*410*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*411*/	  r3.x = floatBitsToInt(r3.x);
/*412*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*413*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*414*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*415*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*416*/	  r3.x = r3.x * r6.x + 1.000000;
/*417*/	  r3.x = r3.x * 0.500000;
/*418*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*419*/	  r3.y = r3.y * r6.y + 1.000000;
/*420*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*421*/	  r3.y = min(r7.y, 1.000000);
/*422*/	  r2.w = r2.w * 1.570796;
/*423*/	  r2.w = sin(r2.w);
/*424*/	  r3.y = r3.y + -1.000000;
/*425*/	  r2.w = r2.w * r3.y + 1.000000;
/*426*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*427*/	  r3.y = max(r3.y, 0.000000);
/*428*/	  r3.y = log2(r3.y);
/*429*/	  r3.y = r3.y * 10.000000;
/*430*/	  r3.y = exp2(r3.y);
/*431*/	  r3.y = r3.w * r3.y;
/*432*/	  r3.y = r3.y * r5.w + r0.z;
/*433*/	  r2.w = r2.w * abs(r3.x);
/*434*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*435*/	} else {
/*436*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*437*/	}
/*438*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*439*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*440*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*441*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*442*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*443*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*444*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*445*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*446*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*447*/	r0.xyw = (r3.zzzz * r0.xyxw + r8.xzxw).xyw;
/*448*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*449*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*450*/	r2.w = inversesqrt(r2.w);
/*451*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*452*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*453*/	r2.w = r2.w + r2.w;
/*454*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*455*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*456*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*457*/	r1.x = max(r1.x, 0.000000);
/*458*/	r1.x = log2(r1.x);
/*459*/	r1.x = r1.x * 10.000000;
/*460*/	r1.x = exp2(r1.x);
/*461*/	r1.x = r3.w * r1.x;
/*462*/	r0.z = r1.x * r5.w + r0.z;
/*463*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*464*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.xywx).xyz;
/*465*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*466*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*467*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*468*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*469*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*470*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*471*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*472*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*473*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*474*/	if(r0.x != 0) discard;
/*475*/	color1.x = 1.000000;
/*476*/	return;
}
