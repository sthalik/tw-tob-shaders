//
//
// Shader Model 4
// Fragment Shader
//
// id: 4781 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandardblood.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_decal_blood_map;
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
/*7*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*8*/	color0.w = r0.x * r1.w;
/*9*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*11*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*12*/	r0.x = saturate(vsOut_N0.w);
/*13*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*14*/	r3.xyz = (r0.xxxx * r3.xyzx + cb5.data[0].xyzx).xyz;
/*15*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*16*/	r4.xyz = (r4.xyzx + -cb5.data[1].xyzx).xyz;
/*17*/	r4.xyz = (r0.xxxx * r4.xyzx + cb5.data[1].xyzx).xyz;
/*18*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*20*/	r0.xyw = (r0.xxxx * r5.xyxz + cb5.data[2].xyxz).xyw;
/*21*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*22*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*23*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*25*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*26*/	r0.xyw = (r2.zzzz * r0.xyxw + r1.xyxz).xyw;
/*27*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*29*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*31*/	r1.w = -r1.w + 1.000000;
/*32*/	r1.w = max(r1.w, 0.000000);
/*33*/	r1.z = sqrt(r1.w);
/*34*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*35*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*36*/	r2.w = 1.000000;
/*37*/	r1.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*38*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*39*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*40*/	r3.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*41*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*42*/	r3.x = saturate(-r3.x + r3.w);
/*43*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*44*/	if(floatBitsToUint(r3.x) != 0u) {
/*45*/	  r3.x = -r3.w + 1.000000;
/*46*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*47*/	  r3.x = -r3.x + 1.000000;
/*48*/	  r3.x = -r3.x * r3.x + 1.000000;
/*49*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*50*/	  r3.xyz = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*51*/	  r3.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*52*/	  r3.w = uintBitsToFloat((r3.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*53*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & uint(0x3f800000u));
/*54*/	  r4.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*55*/	  r0.xyw = (r3.wwww * r4.xyxz + r3.xyxz).xyw;
/*56*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*57*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*58*/	} else {
/*59*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*60*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	}
/*62*/	r3.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*63*/	r3.w = inversesqrt(r3.w);
/*64*/	r5.xyz = (r3.wwww * vsOut_T3.xyzx).xyz;
/*65*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*66*/	r3.w = inversesqrt(r3.w);
/*67*/	r6.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*68*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*69*/	r3.w = inversesqrt(r3.w);
/*70*/	r7.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*71*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*72*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*73*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*74*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*75*/	r3.w = inversesqrt(r3.w);
/*76*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*77*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*78*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*79*/	if(floatBitsToUint(r0.z) != 0u) {
/*80*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*81*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*82*/	  r0.z = r4.w * cb0.data[26].x;
/*83*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*84*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*85*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*86*/	  r3.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*87*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*88*/	}
/*89*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*90*/	if(floatBitsToUint(r0.z) != 0u) {
/*91*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*92*/	  if(floatBitsToUint(r0.z) != 0u) {
/*93*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*94*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*95*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*96*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*97*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*98*/	    r0.z = -r0.z + 1.000000;
/*99*/	    r0.z = max(r0.z, 0.000000);
/*100*/	    r9.z = sqrt(r0.z);
/*101*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*102*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*103*/	    r0.z = inversesqrt(r0.z);
/*104*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*105*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*106*/	    r11.y = -1.000000;
/*107*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*108*/	    r0.z = inversesqrt(r0.z);
/*109*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*110*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*111*/	    r3.w = cb3.data[1].x * cb3.data[1].x;
/*112*/	    r3.w = r3.w * 1.250000;
/*113*/	    r3.w = min(r3.w, 1.000000);
/*114*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*115*/	    r4.z = r4.z * 4.000000;
/*116*/	    r3.w = r3.w * 0.200000 + r4.z;
/*117*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*118*/	    r0.z = r0.z + -r3.w;
/*119*/	    r0.z = saturate(r0.z * 200.000000);
/*120*/	    r3.w = r0.z * -2.000000 + 3.000000;
/*121*/	    r0.z = r0.z * r0.z;
/*122*/	    r0.z = r0.z * r3.w;
/*123*/	    r4.x = r0.z * -r4.x + r4.x;
/*124*/	    r3.w = -r4.y + 0.200000;
/*125*/	    r4.y = r0.z * r3.w + r4.y;
/*126*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*127*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*128*/	    r10.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*129*/	    r3.xyz = (r0.zzzz * r10.xyzx + r3.xyzx).xyz;
/*130*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*131*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*132*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*133*/	    r3.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*134*/	    r3.w = -r3.w + 1.000000;
/*135*/	    r3.w = max(r3.w, 0.000000);
/*136*/	    r8.z = sqrt(r3.w);
/*137*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*138*/	    r3.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*139*/	    r3.w = sqrt(r3.w);
/*140*/	    r8.xyz = (r9.xyzx * r3.wwww + r8.xyzx).xyz;
/*141*/	    r3.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*142*/	    r3.w = inversesqrt(r3.w);
/*143*/	    r8.xyz = (r3.wwww * r8.xyzx).xyz;
/*144*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*145*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*146*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*147*/	    r3.w = -r1.y + 1.000000;
/*148*/	    r0.z = min(r0.z, r3.w);
/*149*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*150*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*151*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*152*/	    r0.z = inversesqrt(r0.z);
/*153*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*154*/	  }
/*155*/	}
/*156*/	r0.z = vsOut_T7.y * -r4.y + r4.y;
/*157*/	r4.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*158*/	r4.yzw = (-r0.xxyw + r4.yyzw).yzw;
/*159*/	r0.xyw = saturate(vsOut_T7.yyyy * r4.yzyw + r0.xyxw).xyw;
/*160*/	r3.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*161*/	r4.yzw = (-r0.xxyw + r3.wwww).yzw;
/*162*/	r0.xyw = (vsOut_T7.zzzz * r4.yzyw + r0.xyxw).xyw;
/*163*/	r3.w = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*164*/	r4.yzw = (-r3.xxyz + r3.wwww).yzw;
/*165*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xyzx).xyz;
/*166*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*167*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*168*/	r3.w = inversesqrt(r3.w);
/*169*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*170*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*171*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*172*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*173*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*174*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*175*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*176*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*177*/	r4.y = intBitsToFloat(int(r3.w));
/*178*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*179*/	if(floatBitsToUint(r4.z) != 0u) {
/*180*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*181*/	  r5.w = vsOut_T0.w;
/*182*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*183*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*184*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*185*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*186*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*187*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*188*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*189*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*190*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*191*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*192*/	  if(floatBitsToUint(r4.w) == 0u) {
/*193*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*194*/	    r7.xy = floor((r6.xyxx).xy);
/*195*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*196*/	    r4.z = -0.000400 / r4.z;
/*197*/	    r4.z = r4.z + r6.z;
/*198*/	    r8.z = -r8.y + 1.000000;
/*199*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*200*/	    r8.w = -r8.y;
/*201*/	    r10.x = cb1.data[0].z/**/;
/*202*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*203*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*204*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*205*/	    r10.w = -cb1.data[0].w/**/;
/*206*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*207*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*208*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*209*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*210*/	    r8.x = r9.x;
/*211*/	    r8.y = r11.x;
/*212*/	    r8.z = r10.x;
/*213*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*214*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*215*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*216*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*217*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*218*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*219*/	    r4.z = -r6.x + r6.y;
/*220*/	    r4.z = r4.w * r4.z + r6.x;
/*221*/	  } else {
/*222*/	    r4.z = 1.000000;
/*223*/	  }
/*224*/	} else {
/*225*/	  r4.z = 1.000000;
/*226*/	}
/*227*/	r4.w = cb1.data[34].w + -1.000000;
/*228*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*229*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*230*/	if(floatBitsToUint(r3.w) == 0u) {
/*231*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*232*/	  r3.w = floatBitsToInt(r3.w);
/*233*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*234*/	  if(floatBitsToUint(r3.w) != 0u) {
/*235*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*236*/	    r5.w = vsOut_T0.w;
/*237*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*238*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*239*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*240*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*241*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*242*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*243*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*244*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*245*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*246*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*247*/	    if(floatBitsToUint(r5.w) == 0u) {
/*248*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*249*/	      r6.xy = floor((r5.xyxx).xy);
/*250*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*251*/	      r3.w = -0.000400 / r3.w;
/*252*/	      r3.w = r3.w + r5.z;
/*253*/	      r7.z = -r7.y + 1.000000;
/*254*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*255*/	      r7.w = -r7.y;
/*256*/	      r9.x = cb1.data[0].z/**/;
/*257*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*258*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*259*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*260*/	      r9.w = -cb1.data[0].w/**/;
/*261*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*262*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*263*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*264*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*265*/	      r7.x = r8.x;
/*266*/	      r7.y = r10.x;
/*267*/	      r7.z = r9.x;
/*268*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*269*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*270*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*271*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*272*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*273*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*274*/	      r3.w = -r5.x + r5.z;
/*275*/	      r3.w = r5.y * r3.w + r5.x;
/*276*/	    } else {
/*277*/	      r3.w = 1.000000;
/*278*/	    }
/*279*/	  } else {
/*280*/	    r3.w = 1.000000;
/*281*/	  }
/*282*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*283*/	  r5.y = r5.x * cb1.data[34].x;
/*284*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*285*/	  r5.x = r1.w + -r5.x;
/*286*/	  r5.x = saturate(r5.x / r5.y);
/*287*/	  r3.w = -r4.z + r3.w;
/*288*/	  r4.z = r5.x * r3.w + r4.z;
/*289*/	}
/*290*/	if(floatBitsToUint(r4.w) != 0u) {
/*291*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*292*/	  r4.w = r3.w * cb1.data[34].y;
/*293*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*294*/	  r3.w = r1.w + -r3.w;
/*295*/	  r3.w = saturate(r3.w / r4.w);
/*296*/	  r4.y = -r4.z + 1.000000;
/*297*/	  r4.z = r3.w * r4.y + r4.z;
/*298*/	}
/*299*/	r4.z = saturate(r4.z);
/*300*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*301*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*302*/	r3.w = inversesqrt(r3.w);
/*303*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*304*/	r3.w = -r4.x + 1.000000;
/*305*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*306*/	r4.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*307*/	r4.w = r4.w + r4.w;
/*308*/	r6.xyz = (r1.xyzx * -r4.wwww + r5.xyzx).xyz;
/*309*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*310*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*311*/	r4.w = cos((r8.x));
/*312*/	r4.w = inversesqrt(r4.w);
/*313*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*314*/	r5.w = saturate(r0.z * 60.000000);
/*315*/	r5.w = -r0.z + r5.w;
/*316*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*317*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*318*/	r6.w = inversesqrt(r6.w);
/*319*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*320*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*321*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*322*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*323*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*324*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*325*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*326*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*327*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*328*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*329*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*330*/	r6.w = -r0.z + 1.000000;
/*331*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*332*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*333*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*334*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*335*/	  r6.w = max(r6.w, 0.000000);
/*336*/	  r6.w = log2(r6.w);
/*337*/	  r6.w = r6.w * 10.000000;
/*338*/	  r6.w = exp2(r6.w);
/*339*/	  r6.w = r4.w * r6.w;
/*340*/	  r6.w = r6.w * r5.w + r0.z;
/*341*/	  r7.y = r3.w * 8.000000;
/*342*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*343*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*344*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*345*/	}
/*346*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*347*/	r7.y = max(r6.w, 0.000000);
/*348*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*349*/	if(floatBitsToUint(r6.w) != 0u) {
/*350*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*351*/	  r6.x = max(r6.x, -1.000000);
/*352*/	  r6.x = min(r6.x, 1.000000);
/*353*/	  r6.y = -abs(r6.x) + 1.000000;
/*354*/	  r6.y = sqrt(r6.y);
/*355*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*356*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*357*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*358*/	  r6.w = r6.y * r6.z;
/*359*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*360*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*361*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*362*/	  r6.x = r6.z * r6.y + r6.x;
/*363*/	  r4.x = r4.x * r4.x;
/*364*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*365*/	  r4.x = r4.x * r4.y + r7.x;
/*366*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*367*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*368*/	  r4.y = -r4.x * r4.x + 1.000000;
/*369*/	  r4.y = max(r4.y, 0.001000);
/*370*/	  r4.y = log2(r4.y);
/*371*/	  r6.y = r4.y * 4.950617;
/*372*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*373*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*374*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*375*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*376*/	  r4.x = floatBitsToInt(r4.x);
/*377*/	  r6.y = r4.y * r4.y + -r6.y;
/*378*/	  r6.y = sqrt(r6.y);
/*379*/	  r4.y = -r4.y + r6.y;
/*380*/	  r4.y = max(r4.y, 0.000000);
/*381*/	  r4.y = sqrt(r4.y);
/*382*/	  r4.x = r4.y * r4.x;
/*383*/	  r4.x = r4.x * 1.414214;
/*384*/	  r4.x = 0.008727 / r4.x;
/*385*/	  r4.x = max(r4.x, 0.000100);
/*386*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*387*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*388*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*389*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*390*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*391*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*392*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*393*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*394*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*395*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*396*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*397*/	  r4.x = floatBitsToInt(r4.x);
/*398*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*399*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*400*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*401*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*402*/	  r4.x = r4.x * r6.x + 1.000000;
/*403*/	  r4.x = r4.x * 0.500000;
/*404*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*405*/	  r4.y = r4.y * r6.y + 1.000000;
/*406*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*407*/	  r4.y = min(r7.y, 1.000000);
/*408*/	  r3.w = r3.w * 1.570796;
/*409*/	  r3.w = sin(r3.w);
/*410*/	  r4.y = r4.y + -1.000000;
/*411*/	  r3.w = r3.w * r4.y + 1.000000;
/*412*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*413*/	  r4.y = max(r4.y, 0.000000);
/*414*/	  r4.y = log2(r4.y);
/*415*/	  r4.y = r4.y * 10.000000;
/*416*/	  r4.y = exp2(r4.y);
/*417*/	  r4.y = r4.w * r4.y;
/*418*/	  r4.y = r4.y * r5.w + r0.z;
/*419*/	  r3.w = r3.w * abs(r4.x);
/*420*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*421*/	} else {
/*422*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*423*/	}
/*424*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*425*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*426*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*427*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*428*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*429*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*430*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*431*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*432*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*433*/	r0.xyw = (r4.zzzz * r0.xyxw + r8.xzxw).xyw;
/*434*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*435*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*436*/	r3.w = inversesqrt(r3.w);
/*437*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*438*/	r3.w = dot(vec3(-r4.xyzx), vec3(r1.xyzx));
/*439*/	r3.w = r3.w + r3.w;
/*440*/	r1.xyz = (r1.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*441*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*442*/	r1.x = dot(vec3(r1.xyzx), vec3(-r4.xyzx));
/*443*/	r1.x = max(r1.x, 0.000000);
/*444*/	r1.x = log2(r1.x);
/*445*/	r1.x = r1.x * 10.000000;
/*446*/	r1.x = exp2(r1.x);
/*447*/	r1.x = r4.w * r1.x;
/*448*/	r0.z = r1.x * r5.w + r0.z;
/*449*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*450*/	color0.xyz = (r1.xyzx * r3.xyzx + r0.xywx).xyz;
/*451*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*452*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*453*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*454*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*455*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*456*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*457*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*458*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*459*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*460*/	if(r0.x != 0) discard;
/*461*/	color1.x = 1.000000;
/*462*/	return;
}
