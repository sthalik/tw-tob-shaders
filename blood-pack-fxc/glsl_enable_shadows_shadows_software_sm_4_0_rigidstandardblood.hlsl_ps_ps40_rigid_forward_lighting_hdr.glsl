//
//
// Shader Model 4
// Fragment Shader
//
// id: 4778 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandardblood.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*8*/	r0.y = r1.w + -0.500000;
/*9*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	if(r0.y != 0) discard;
/*11*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*12*/	color0.w = r0.x * r1.w;
/*13*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*15*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*16*/	r0.x = saturate(vsOut_N0.w);
/*17*/	r3.xyz = (r3.xyzx + -cb5.data[0].xyzx).xyz;
/*18*/	r3.xyz = (r0.xxxx * r3.xyzx + cb5.data[0].xyzx).xyz;
/*19*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*20*/	r4.xyz = (r4.xyzx + -cb5.data[1].xyzx).xyz;
/*21*/	r4.xyz = (r0.xxxx * r4.xyzx + cb5.data[1].xyzx).xyz;
/*22*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*23*/	r5.xyz = (r5.xyzx + -cb5.data[2].xyzx).xyz;
/*24*/	r0.xyw = (r0.xxxx * r5.xyxz + cb5.data[2].xyxz).xyw;
/*25*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r2.xxxx * r3.xyzx + r1.xyzx).xyz;
/*27*/	r3.xyz = (r4.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r2.yyyy * r3.xyzx + r1.xyzx).xyz;
/*29*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*30*/	r0.xyw = (r2.zzzz * r0.xyxw + r1.xyxz).xyw;
/*31*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*32*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*33*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*34*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*35*/	r1.w = -r1.w + 1.000000;
/*36*/	r1.w = max(r1.w, 0.000000);
/*37*/	r1.z = sqrt(r1.w);
/*38*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*39*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*40*/	r2.w = 1.000000;
/*41*/	r1.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*42*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*43*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*44*/	r3.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*45*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*46*/	r3.x = saturate(-r3.x + r3.w);
/*47*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*48*/	if(floatBitsToUint(r3.x) != 0u) {
/*49*/	  r3.x = -r3.w + 1.000000;
/*50*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*51*/	  r3.x = -r3.x + 1.000000;
/*52*/	  r3.x = -r3.x * r3.x + 1.000000;
/*53*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*54*/	  r3.xyz = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*55*/	  r3.w = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*56*/	  r3.w = uintBitsToFloat((r3.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*57*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & uint(0x3f800000u));
/*58*/	  r4.xyz = (r0.xywx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*59*/	  r0.xyw = (r3.wwww * r4.xyxz + r3.xyxz).xyw;
/*60*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*61*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*62*/	} else {
/*63*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*64*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*65*/	}
/*66*/	r3.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*67*/	r3.w = inversesqrt(r3.w);
/*68*/	r5.xyz = (r3.wwww * vsOut_T3.xyzx).xyz;
/*69*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*70*/	r3.w = inversesqrt(r3.w);
/*71*/	r6.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*72*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*73*/	r3.w = inversesqrt(r3.w);
/*74*/	r7.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*75*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*76*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*77*/	r1.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*78*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*79*/	r3.w = inversesqrt(r3.w);
/*80*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*81*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*82*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*83*/	if(floatBitsToUint(r0.z) != 0u) {
/*84*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*85*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*86*/	  r0.z = r4.w * cb0.data[26].x;
/*87*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*88*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*89*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*90*/	  r3.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*91*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*92*/	}
/*93*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*94*/	if(floatBitsToUint(r0.z) != 0u) {
/*95*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*96*/	  if(floatBitsToUint(r0.z) != 0u) {
/*97*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*98*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*99*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*100*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*101*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*102*/	    r0.z = -r0.z + 1.000000;
/*103*/	    r0.z = max(r0.z, 0.000000);
/*104*/	    r9.z = sqrt(r0.z);
/*105*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*106*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*107*/	    r0.z = inversesqrt(r0.z);
/*108*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*109*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*110*/	    r11.y = -1.000000;
/*111*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*112*/	    r0.z = inversesqrt(r0.z);
/*113*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*114*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*115*/	    r3.w = cb3.data[1].x * cb3.data[1].x;
/*116*/	    r3.w = r3.w * 1.250000;
/*117*/	    r3.w = min(r3.w, 1.000000);
/*118*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*119*/	    r4.z = r4.z * 4.000000;
/*120*/	    r3.w = r3.w * 0.200000 + r4.z;
/*121*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*122*/	    r0.z = r0.z + -r3.w;
/*123*/	    r0.z = saturate(r0.z * 200.000000);
/*124*/	    r3.w = r0.z * -2.000000 + 3.000000;
/*125*/	    r0.z = r0.z * r0.z;
/*126*/	    r0.z = r0.z * r3.w;
/*127*/	    r4.x = r0.z * -r4.x + r4.x;
/*128*/	    r3.w = -r4.y + 0.200000;
/*129*/	    r4.y = r0.z * r3.w + r4.y;
/*130*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*131*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*132*/	    r10.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*133*/	    r3.xyz = (r0.zzzz * r10.xyzx + r3.xyzx).xyz;
/*134*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*135*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*136*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*137*/	    r3.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*138*/	    r3.w = -r3.w + 1.000000;
/*139*/	    r3.w = max(r3.w, 0.000000);
/*140*/	    r8.z = sqrt(r3.w);
/*141*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*142*/	    r3.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*143*/	    r3.w = sqrt(r3.w);
/*144*/	    r8.xyz = (r9.xyzx * r3.wwww + r8.xyzx).xyz;
/*145*/	    r3.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*146*/	    r3.w = inversesqrt(r3.w);
/*147*/	    r8.xyz = (r3.wwww * r8.xyzx).xyz;
/*148*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*149*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*150*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*151*/	    r3.w = -r1.y + 1.000000;
/*152*/	    r0.z = min(r0.z, r3.w);
/*153*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*154*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*155*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*156*/	    r0.z = inversesqrt(r0.z);
/*157*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*158*/	  }
/*159*/	}
/*160*/	r0.z = vsOut_T7.y * -r4.y + r4.y;
/*161*/	r4.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*162*/	r4.yzw = (-r0.xxyw + r4.yyzw).yzw;
/*163*/	r0.xyw = saturate(vsOut_T7.yyyy * r4.yzyw + r0.xyxw).xyw;
/*164*/	r3.w = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*165*/	r4.yzw = (-r0.xxyw + r3.wwww).yzw;
/*166*/	r0.xyw = (vsOut_T7.zzzz * r4.yzyw + r0.xyxw).xyw;
/*167*/	r3.w = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*168*/	r4.yzw = (-r3.xxyz + r3.wwww).yzw;
/*169*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xyzx).xyz;
/*170*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*171*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*172*/	r3.w = inversesqrt(r3.w);
/*173*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*174*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*175*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*176*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*177*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*178*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*179*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*180*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*181*/	r4.y = intBitsToFloat(int(r3.w));
/*182*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*183*/	if(floatBitsToUint(r4.z) != 0u) {
/*184*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*185*/	  r5.w = vsOut_T0.w;
/*186*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*187*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*188*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*189*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*190*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*191*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*192*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*193*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*194*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*195*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*196*/	  if(floatBitsToUint(r4.w) == 0u) {
/*197*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*198*/	    r7.xy = floor((r6.xyxx).xy);
/*199*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*200*/	    r4.z = -0.000400 / r4.z;
/*201*/	    r4.z = r4.z + r6.z;
/*202*/	    r8.z = -r8.y + 1.000000;
/*203*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*204*/	    r8.w = -r8.y;
/*205*/	    r10.x = cb1.data[0].z/**/;
/*206*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*207*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*208*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*209*/	    r10.w = -cb1.data[0].w/**/;
/*210*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*211*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*212*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*213*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*214*/	    r8.x = r9.x;
/*215*/	    r8.y = r11.x;
/*216*/	    r8.z = r10.x;
/*217*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*218*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*219*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*220*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*221*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*222*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*223*/	    r4.z = -r6.x + r6.y;
/*224*/	    r4.z = r4.w * r4.z + r6.x;
/*225*/	  } else {
/*226*/	    r4.z = 1.000000;
/*227*/	  }
/*228*/	} else {
/*229*/	  r4.z = 1.000000;
/*230*/	}
/*231*/	r4.w = cb1.data[34].w + -1.000000;
/*232*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*233*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*234*/	if(floatBitsToUint(r3.w) == 0u) {
/*235*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*236*/	  r3.w = floatBitsToInt(r3.w);
/*237*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*238*/	  if(floatBitsToUint(r3.w) != 0u) {
/*239*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*240*/	    r5.w = vsOut_T0.w;
/*241*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*242*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*243*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*244*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*245*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*246*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*247*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*248*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*249*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*250*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*251*/	    if(floatBitsToUint(r5.w) == 0u) {
/*252*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*253*/	      r6.xy = floor((r5.xyxx).xy);
/*254*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*255*/	      r3.w = -0.000400 / r3.w;
/*256*/	      r3.w = r3.w + r5.z;
/*257*/	      r7.z = -r7.y + 1.000000;
/*258*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*259*/	      r7.w = -r7.y;
/*260*/	      r9.x = cb1.data[0].z/**/;
/*261*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*262*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*263*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*264*/	      r9.w = -cb1.data[0].w/**/;
/*265*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*266*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*267*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*268*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*269*/	      r7.x = r8.x;
/*270*/	      r7.y = r10.x;
/*271*/	      r7.z = r9.x;
/*272*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*273*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*274*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*275*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*276*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*277*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*278*/	      r3.w = -r5.x + r5.z;
/*279*/	      r3.w = r5.y * r3.w + r5.x;
/*280*/	    } else {
/*281*/	      r3.w = 1.000000;
/*282*/	    }
/*283*/	  } else {
/*284*/	    r3.w = 1.000000;
/*285*/	  }
/*286*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*287*/	  r5.y = r5.x * cb1.data[34].x;
/*288*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*289*/	  r5.x = r1.w + -r5.x;
/*290*/	  r5.x = saturate(r5.x / r5.y);
/*291*/	  r3.w = -r4.z + r3.w;
/*292*/	  r4.z = r5.x * r3.w + r4.z;
/*293*/	}
/*294*/	if(floatBitsToUint(r4.w) != 0u) {
/*295*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*296*/	  r4.w = r3.w * cb1.data[34].y;
/*297*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*298*/	  r3.w = r1.w + -r3.w;
/*299*/	  r3.w = saturate(r3.w / r4.w);
/*300*/	  r4.y = -r4.z + 1.000000;
/*301*/	  r4.z = r3.w * r4.y + r4.z;
/*302*/	}
/*303*/	r4.z = saturate(r4.z);
/*304*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*305*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*306*/	r3.w = inversesqrt(r3.w);
/*307*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*308*/	r3.w = -r4.x + 1.000000;
/*309*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*310*/	r4.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*311*/	r4.w = r4.w + r4.w;
/*312*/	r6.xyz = (r1.xyzx * -r4.wwww + r5.xyzx).xyz;
/*313*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*314*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*315*/	r4.w = cos((r8.x));
/*316*/	r4.w = inversesqrt(r4.w);
/*317*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*318*/	r5.w = saturate(r0.z * 60.000000);
/*319*/	r5.w = -r0.z + r5.w;
/*320*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*321*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*322*/	r6.w = inversesqrt(r6.w);
/*323*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*324*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*325*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*326*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*327*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*328*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*329*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*330*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*331*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*332*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*333*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*334*/	r6.w = -r0.z + 1.000000;
/*335*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*336*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*337*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*338*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*339*/	  r6.w = max(r6.w, 0.000000);
/*340*/	  r6.w = log2(r6.w);
/*341*/	  r6.w = r6.w * 10.000000;
/*342*/	  r6.w = exp2(r6.w);
/*343*/	  r6.w = r4.w * r6.w;
/*344*/	  r6.w = r6.w * r5.w + r0.z;
/*345*/	  r7.y = r3.w * 8.000000;
/*346*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*347*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*348*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*349*/	}
/*350*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*351*/	r7.y = max(r6.w, 0.000000);
/*352*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*353*/	if(floatBitsToUint(r6.w) != 0u) {
/*354*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*355*/	  r6.x = max(r6.x, -1.000000);
/*356*/	  r6.x = min(r6.x, 1.000000);
/*357*/	  r6.y = -abs(r6.x) + 1.000000;
/*358*/	  r6.y = sqrt(r6.y);
/*359*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*360*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*361*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*362*/	  r6.w = r6.y * r6.z;
/*363*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*364*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*365*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*366*/	  r6.x = r6.z * r6.y + r6.x;
/*367*/	  r4.x = r4.x * r4.x;
/*368*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*369*/	  r4.x = r4.x * r4.y + r7.x;
/*370*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*371*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*372*/	  r4.y = -r4.x * r4.x + 1.000000;
/*373*/	  r4.y = max(r4.y, 0.001000);
/*374*/	  r4.y = log2(r4.y);
/*375*/	  r6.y = r4.y * 4.950617;
/*376*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*377*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*378*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*379*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*380*/	  r4.x = floatBitsToInt(r4.x);
/*381*/	  r6.y = r4.y * r4.y + -r6.y;
/*382*/	  r6.y = sqrt(r6.y);
/*383*/	  r4.y = -r4.y + r6.y;
/*384*/	  r4.y = max(r4.y, 0.000000);
/*385*/	  r4.y = sqrt(r4.y);
/*386*/	  r4.x = r4.y * r4.x;
/*387*/	  r4.x = r4.x * 1.414214;
/*388*/	  r4.x = 0.008727 / r4.x;
/*389*/	  r4.x = max(r4.x, 0.000100);
/*390*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*391*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*392*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*393*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*394*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*395*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*396*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*397*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*398*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*399*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*400*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*401*/	  r4.x = floatBitsToInt(r4.x);
/*402*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*403*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*404*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*405*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*406*/	  r4.x = r4.x * r6.x + 1.000000;
/*407*/	  r4.x = r4.x * 0.500000;
/*408*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*409*/	  r4.y = r4.y * r6.y + 1.000000;
/*410*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*411*/	  r4.y = min(r7.y, 1.000000);
/*412*/	  r3.w = r3.w * 1.570796;
/*413*/	  r3.w = sin(r3.w);
/*414*/	  r4.y = r4.y + -1.000000;
/*415*/	  r3.w = r3.w * r4.y + 1.000000;
/*416*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*417*/	  r4.y = max(r4.y, 0.000000);
/*418*/	  r4.y = log2(r4.y);
/*419*/	  r4.y = r4.y * 10.000000;
/*420*/	  r4.y = exp2(r4.y);
/*421*/	  r4.y = r4.w * r4.y;
/*422*/	  r4.y = r4.y * r5.w + r0.z;
/*423*/	  r3.w = r3.w * abs(r4.x);
/*424*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*425*/	} else {
/*426*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*427*/	}
/*428*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*429*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*430*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*431*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*432*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*433*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*434*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*435*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*436*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*437*/	r0.xyw = (r4.zzzz * r0.xyxw + r8.xzxw).xyw;
/*438*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*439*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*440*/	r3.w = inversesqrt(r3.w);
/*441*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*442*/	r3.w = dot(vec3(-r4.xyzx), vec3(r1.xyzx));
/*443*/	r3.w = r3.w + r3.w;
/*444*/	r1.xyz = (r1.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*445*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*446*/	r1.x = dot(vec3(r1.xyzx), vec3(-r4.xyzx));
/*447*/	r1.x = max(r1.x, 0.000000);
/*448*/	r1.x = log2(r1.x);
/*449*/	r1.x = r1.x * 10.000000;
/*450*/	r1.x = exp2(r1.x);
/*451*/	r1.x = r4.w * r1.x;
/*452*/	r0.z = r1.x * r5.w + r0.z;
/*453*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*454*/	color0.xyz = (r1.xyzx * r3.xyzx + r0.xywx).xyz;
/*455*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*456*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*457*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*458*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*459*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*460*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*461*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*462*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*463*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*464*/	if(r0.x != 0) discard;
/*465*/	color1.x = 1.000000;
/*466*/	return;
}
