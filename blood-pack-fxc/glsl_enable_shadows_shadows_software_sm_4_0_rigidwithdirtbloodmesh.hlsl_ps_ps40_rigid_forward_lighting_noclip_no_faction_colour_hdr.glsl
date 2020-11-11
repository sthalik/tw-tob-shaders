//
//
// Shader Model 4
// Fragment Shader
//
// id: 5309 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform samplerCube s_environment;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*9*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*10*/	r0.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*11*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*12*/	r0.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*13*/	r0.x = -r0.x + 1.000000;
/*14*/	r0.x = max(r0.x, 0.000000);
/*15*/	r2.z = sqrt(r0.x);
/*16*/	r0.xyw = (mix(r2.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*17*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*18*/	r2.w = 1.000000;
/*19*/	r1.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*20*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*21*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*22*/	r4.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*23*/	r4.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*24*/	r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	r3.z = r3.w * r4.w;
/*26*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*27*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*28*/	r0.xy = (r4.xyxx * r3.wwww + r0.xyxx).xy;
/*29*/	r3.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*30*/	r3.w = inversesqrt(r3.w);
/*31*/	r0.xyw = (r0.xyxw * r3.wwww).xyw;
/*32*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*33*/	r4.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*34*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*35*/	r3.x = saturate(-r3.x + r4.w);
/*36*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r3.x) != 0u) {
/*38*/	  r3.x = -r4.w + 1.000000;
/*39*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*40*/	  r3.x = -r3.x + 1.000000;
/*41*/	  r3.x = -r3.x * r3.x + 1.000000;
/*42*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*43*/	  r3.xyw = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*44*/	  r4.x = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r4.x = uintBitsToFloat((r4.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & uint(0x3f800000u));
/*47*/	  r4.yzw = (r1.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r3.xxww).yzw;
/*48*/	  r1.xyz = (r4.xxxx * r4.yzwy + r3.xywx).xyz;
/*49*/	  r3.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*50*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*51*/	} else {
/*52*/	  r5.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*53*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*54*/	  r6.xyz = (r3.zzzz * r5.xyzx).xyz;
/*55*/	  r3.xyw = (r6.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r5.xyxz).xyw;
/*56*/	}
/*57*/	r3.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*58*/	r3.z = inversesqrt(r3.z);
/*59*/	r5.xyz = (r3.zzzz * vsOut_T3.xyzx).xyz;
/*60*/	r3.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*61*/	r3.z = inversesqrt(r3.z);
/*62*/	r6.xyz = (r3.zzzz * vsOut_T4.xyzx).xyz;
/*63*/	r3.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*64*/	r3.z = inversesqrt(r3.z);
/*65*/	r7.xyz = (r3.zzzz * vsOut_T2.xyzx).xyz;
/*66*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*67*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*68*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*69*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*70*/	r3.z = inversesqrt(r3.z);
/*71*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*72*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*73*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*74*/	if(floatBitsToUint(r0.w) != 0u) {
/*75*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*76*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*77*/	  r0.w = r4.w * cb0.data[26].x;
/*78*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*79*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*80*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*81*/	  r3.xyw = (r8.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r3.xyxw).xyw;
/*82*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*83*/	}
/*84*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*85*/	if(floatBitsToUint(r0.w) != 0u) {
/*86*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*87*/	  if(floatBitsToUint(r0.w) != 0u) {
/*88*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*89*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*90*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*91*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*92*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*93*/	    r0.w = -r0.w + 1.000000;
/*94*/	    r0.w = max(r0.w, 0.000000);
/*95*/	    r9.z = sqrt(r0.w);
/*96*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*97*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*98*/	    r0.w = inversesqrt(r0.w);
/*99*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*100*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*101*/	    r11.y = -1.000000;
/*102*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*103*/	    r0.w = inversesqrt(r0.w);
/*104*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*105*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*106*/	    r3.z = cb3.data[1].x * cb3.data[1].x;
/*107*/	    r3.z = r3.z * 1.250000;
/*108*/	    r3.z = min(r3.z, 1.000000);
/*109*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*110*/	    r4.z = r4.z * 4.000000;
/*111*/	    r3.z = r3.z * 0.200000 + r4.z;
/*112*/	    r3.z = r3.z * -0.700000 + 1.000000;
/*113*/	    r0.w = r0.w + -r3.z;
/*114*/	    r0.w = saturate(r0.w * 200.000000);
/*115*/	    r3.z = r0.w * -2.000000 + 3.000000;
/*116*/	    r0.w = r0.w * r0.w;
/*117*/	    r0.w = r0.w * r3.z;
/*118*/	    r4.x = r0.w * -r4.x + r4.x;
/*119*/	    r3.z = -r4.y + 0.200000;
/*120*/	    r4.y = r0.w * r3.z + r4.y;
/*121*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*122*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*123*/	    r10.xyz = (-r3.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*124*/	    r3.xyw = (r0.wwww * r10.xyxz + r3.xyxw).xyw;
/*125*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*126*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*127*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*128*/	    r3.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*129*/	    r3.z = -r3.z + 1.000000;
/*130*/	    r3.z = max(r3.z, 0.000000);
/*131*/	    r8.z = sqrt(r3.z);
/*132*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*133*/	    r3.z = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*134*/	    r3.z = sqrt(r3.z);
/*135*/	    r8.xyz = (r9.xyzx * r3.zzzz + r8.xyzx).xyz;
/*136*/	    r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*137*/	    r3.z = inversesqrt(r3.z);
/*138*/	    r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*139*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*140*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*141*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*142*/	    r3.z = -r0.y + 1.000000;
/*143*/	    r0.w = min(r0.w, r3.z);
/*144*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*145*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*146*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*147*/	    r0.w = inversesqrt(r0.w);
/*148*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*149*/	  }
/*150*/	}
/*151*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*152*/	r4.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*153*/	r4.yzw = (-r1.xxyz + r4.yyzw).yzw;
/*154*/	r1.xyz = saturate(vsOut_T7.yyyy * r4.yzwy + r1.xyzx).xyz;
/*155*/	r3.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*156*/	r4.yzw = (-r1.xxyz + r3.zzzz).yzw;
/*157*/	r1.xyz = (vsOut_T7.zzzz * r4.yzwy + r1.xyzx).xyz;
/*158*/	r3.z = dot(vec3(r3.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*159*/	r4.yzw = (-r3.xxyw + r3.zzzz).yzw;
/*160*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xywx).xyz;
/*161*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*162*/	r3.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*163*/	r3.w = inversesqrt(r3.w);
/*164*/	r0.xyz = (r0.xyzx * r3.wwww).xyz;
/*165*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*166*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*167*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*168*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*169*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*170*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*171*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*172*/	r4.y = intBitsToFloat(int(r3.w));
/*173*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*174*/	if(floatBitsToUint(r4.z) != 0u) {
/*175*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*176*/	  r5.w = vsOut_T0.w;
/*177*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*178*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*179*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*180*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*181*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*182*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*183*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*184*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*185*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*186*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*187*/	  if(floatBitsToUint(r4.w) == 0u) {
/*188*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*189*/	    r7.xy = floor((r6.xyxx).xy);
/*190*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*191*/	    r4.z = -0.000400 / r4.z;
/*192*/	    r4.z = r4.z + r6.z;
/*193*/	    r8.z = -r8.y + 1.000000;
/*194*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*195*/	    r8.w = -r8.y;
/*196*/	    r10.x = cb1.data[0].z/**/;
/*197*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*198*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*199*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*200*/	    r10.w = -cb1.data[0].w/**/;
/*201*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*202*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*203*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*204*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*205*/	    r8.x = r9.x;
/*206*/	    r8.y = r11.x;
/*207*/	    r8.z = r10.x;
/*208*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*209*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*210*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*211*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*212*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*213*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*214*/	    r4.z = -r6.x + r6.y;
/*215*/	    r4.z = r4.w * r4.z + r6.x;
/*216*/	  } else {
/*217*/	    r4.z = 1.000000;
/*218*/	  }
/*219*/	} else {
/*220*/	  r4.z = 1.000000;
/*221*/	}
/*222*/	r4.w = cb1.data[34].w + -1.000000;
/*223*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*224*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*225*/	if(floatBitsToUint(r3.w) == 0u) {
/*226*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*227*/	  r3.w = floatBitsToInt(r3.w);
/*228*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*229*/	  if(floatBitsToUint(r3.w) != 0u) {
/*230*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*231*/	    r5.w = vsOut_T0.w;
/*232*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*233*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*234*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*235*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*236*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*237*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*238*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*239*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*240*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*241*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*242*/	    if(floatBitsToUint(r5.w) == 0u) {
/*243*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*244*/	      r6.xy = floor((r5.xyxx).xy);
/*245*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*246*/	      r3.w = -0.000400 / r3.w;
/*247*/	      r3.w = r3.w + r5.z;
/*248*/	      r7.z = -r7.y + 1.000000;
/*249*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*250*/	      r7.w = -r7.y;
/*251*/	      r9.x = cb1.data[0].z/**/;
/*252*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*253*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*254*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*255*/	      r9.w = -cb1.data[0].w/**/;
/*256*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*257*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*258*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*259*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*260*/	      r7.x = r8.x;
/*261*/	      r7.y = r10.x;
/*262*/	      r7.z = r9.x;
/*263*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*264*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*265*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*266*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*267*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*268*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*269*/	      r3.w = -r5.x + r5.z;
/*270*/	      r3.w = r5.y * r3.w + r5.x;
/*271*/	    } else {
/*272*/	      r3.w = 1.000000;
/*273*/	    }
/*274*/	  } else {
/*275*/	    r3.w = 1.000000;
/*276*/	  }
/*277*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*278*/	  r5.y = r5.x * cb1.data[34].x;
/*279*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*280*/	  r5.x = r1.w + -r5.x;
/*281*/	  r5.x = saturate(r5.x / r5.y);
/*282*/	  r3.w = -r4.z + r3.w;
/*283*/	  r4.z = r5.x * r3.w + r4.z;
/*284*/	}
/*285*/	if(floatBitsToUint(r4.w) != 0u) {
/*286*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*287*/	  r4.w = r3.w * cb1.data[34].y;
/*288*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*289*/	  r3.w = r1.w + -r3.w;
/*290*/	  r3.w = saturate(r3.w / r4.w);
/*291*/	  r4.y = -r4.z + 1.000000;
/*292*/	  r4.z = r3.w * r4.y + r4.z;
/*293*/	}
/*294*/	r4.z = saturate(r4.z);
/*295*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*296*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*297*/	r3.w = inversesqrt(r3.w);
/*298*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*299*/	r3.w = -r4.x + 1.000000;
/*300*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*301*/	r4.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*302*/	r4.w = r4.w + r4.w;
/*303*/	r6.xyz = (r0.xyzx * -r4.wwww + r5.xyzx).xyz;
/*304*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*305*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*306*/	r4.w = cos((r8.x));
/*307*/	r4.w = inversesqrt(r4.w);
/*308*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*309*/	r5.w = saturate(r0.w * 60.000000);
/*310*/	r5.w = -r0.w + r5.w;
/*311*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*312*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*313*/	r6.w = inversesqrt(r6.w);
/*314*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*315*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*316*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*317*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*318*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*319*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*320*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*321*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*322*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*323*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*324*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*325*/	r6.w = -r0.w + 1.000000;
/*326*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*327*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*328*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*329*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*330*/	  r6.w = max(r6.w, 0.000000);
/*331*/	  r6.w = log2(r6.w);
/*332*/	  r6.w = r6.w * 10.000000;
/*333*/	  r6.w = exp2(r6.w);
/*334*/	  r6.w = r4.w * r6.w;
/*335*/	  r6.w = r6.w * r5.w + r0.w;
/*336*/	  r7.y = r3.w * 8.000000;
/*337*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*338*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*339*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*340*/	}
/*341*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*342*/	r7.y = max(r6.w, 0.000000);
/*343*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*344*/	if(floatBitsToUint(r6.w) != 0u) {
/*345*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*346*/	  r6.x = max(r6.x, -1.000000);
/*347*/	  r6.x = min(r6.x, 1.000000);
/*348*/	  r6.y = -abs(r6.x) + 1.000000;
/*349*/	  r6.y = sqrt(r6.y);
/*350*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*351*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*352*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*353*/	  r6.w = r6.y * r6.z;
/*354*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*355*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*356*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*357*/	  r6.x = r6.z * r6.y + r6.x;
/*358*/	  r4.x = r4.x * r4.x;
/*359*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*360*/	  r4.x = r4.x * r4.y + r7.x;
/*361*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*362*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*363*/	  r4.y = -r4.x * r4.x + 1.000000;
/*364*/	  r4.y = max(r4.y, 0.001000);
/*365*/	  r4.y = log2(r4.y);
/*366*/	  r6.y = r4.y * 4.950617;
/*367*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*368*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*369*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*370*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*371*/	  r4.x = floatBitsToInt(r4.x);
/*372*/	  r6.y = r4.y * r4.y + -r6.y;
/*373*/	  r6.y = sqrt(r6.y);
/*374*/	  r4.y = -r4.y + r6.y;
/*375*/	  r4.y = max(r4.y, 0.000000);
/*376*/	  r4.y = sqrt(r4.y);
/*377*/	  r4.x = r4.y * r4.x;
/*378*/	  r4.x = r4.x * 1.414214;
/*379*/	  r4.x = 0.008727 / r4.x;
/*380*/	  r4.x = max(r4.x, 0.000100);
/*381*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*382*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*383*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*384*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*385*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*386*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*387*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*388*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*389*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*390*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*391*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*392*/	  r4.x = floatBitsToInt(r4.x);
/*393*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*394*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*395*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*396*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*397*/	  r4.x = r4.x * r6.x + 1.000000;
/*398*/	  r4.x = r4.x * 0.500000;
/*399*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*400*/	  r4.y = r4.y * r6.y + 1.000000;
/*401*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*402*/	  r4.y = min(r7.y, 1.000000);
/*403*/	  r3.w = r3.w * 1.570796;
/*404*/	  r3.w = sin(r3.w);
/*405*/	  r4.y = r4.y + -1.000000;
/*406*/	  r3.w = r3.w * r4.y + 1.000000;
/*407*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*408*/	  r4.y = max(r4.y, 0.000000);
/*409*/	  r4.y = log2(r4.y);
/*410*/	  r4.y = r4.y * 10.000000;
/*411*/	  r4.y = exp2(r4.y);
/*412*/	  r4.y = r4.w * r4.y;
/*413*/	  r4.y = r4.y * r5.w + r0.w;
/*414*/	  r3.w = r3.w * abs(r4.x);
/*415*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*416*/	} else {
/*417*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*418*/	}
/*419*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*420*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*421*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*422*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*423*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*424*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*425*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*426*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*427*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*428*/	r1.xyz = (r4.zzzz * r1.xyzx + r8.xzwx).xyz;
/*429*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*430*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*431*/	r3.w = inversesqrt(r3.w);
/*432*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*433*/	r3.w = dot(vec3(-r4.xyzx), vec3(r0.xyzx));
/*434*/	r3.w = r3.w + r3.w;
/*435*/	r0.xyz = (r0.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*436*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*437*/	r0.x = dot(vec3(r0.xyzx), vec3(-r4.xyzx));
/*438*/	r0.x = max(r0.x, 0.000000);
/*439*/	r0.x = log2(r0.x);
/*440*/	r0.x = r0.x * 10.000000;
/*441*/	r0.x = exp2(r0.x);
/*442*/	r0.x = r4.w * r0.x;
/*443*/	r0.x = r0.x * r5.w + r0.w;
/*444*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*445*/	color0.xyz = (r0.xyzx * r3.xyzx + r1.xyzx).xyz;
/*446*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*447*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*448*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*449*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*450*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*451*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*452*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*453*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*454*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*455*/	if(r0.x != 0) discard;
/*456*/	color1.x = 1.000000;
/*457*/	return;
}
