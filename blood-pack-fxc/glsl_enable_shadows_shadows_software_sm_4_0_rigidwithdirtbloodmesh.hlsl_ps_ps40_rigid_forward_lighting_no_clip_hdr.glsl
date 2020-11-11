//
//
// Shader Model 4
// Fragment Shader
//
// id: 5305 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D sHardShadowBuffer;
uniform samplerCube s_environment;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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
/*38*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*40*/	r4.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*41*/	r4.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*42*/	r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*43*/	r3.z = r3.w * r4.w;
/*44*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*45*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*46*/	r1.xy = (r4.xyxx * r3.wwww + r1.xyxx).xy;
/*47*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*48*/	r3.w = inversesqrt(r3.w);
/*49*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*50*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*51*/	r4.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*52*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*53*/	r3.x = saturate(-r3.x + r4.w);
/*54*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*55*/	if(floatBitsToUint(r3.x) != 0u) {
/*56*/	  r3.x = -r4.w + 1.000000;
/*57*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*58*/	  r3.x = -r3.x + 1.000000;
/*59*/	  r3.x = -r3.x * r3.x + 1.000000;
/*60*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*61*/	  r3.xyw = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*62*/	  r4.x = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*63*/	  r4.x = uintBitsToFloat((r4.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*64*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & uint(0x3f800000u));
/*65*/	  r4.yzw = (r0.xxyw * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r3.xxww).yzw;
/*66*/	  r0.xyw = (r4.xxxx * r4.yzyw + r3.xyxw).xyw;
/*67*/	  r3.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*68*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*69*/	} else {
/*70*/	  r5.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*71*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*72*/	  r6.xyz = (r3.zzzz * r5.xyzx).xyz;
/*73*/	  r3.xyw = (r6.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r5.xyxz).xyw;
/*74*/	}
/*75*/	r3.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*76*/	r3.z = inversesqrt(r3.z);
/*77*/	r5.xyz = (r3.zzzz * vsOut_T3.xyzx).xyz;
/*78*/	r3.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*79*/	r3.z = inversesqrt(r3.z);
/*80*/	r6.xyz = (r3.zzzz * vsOut_T4.xyzx).xyz;
/*81*/	r3.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*82*/	r3.z = inversesqrt(r3.z);
/*83*/	r7.xyz = (r3.zzzz * vsOut_T2.xyzx).xyz;
/*84*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*85*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*86*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*87*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*88*/	r3.z = inversesqrt(r3.z);
/*89*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*90*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*91*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*92*/	if(floatBitsToUint(r0.z) != 0u) {
/*93*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*94*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*95*/	  r0.z = r4.w * cb0.data[26].x;
/*96*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*97*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*98*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*99*/	  r3.xyw = (r8.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r3.xyxw).xyw;
/*100*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*101*/	}
/*102*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*103*/	if(floatBitsToUint(r0.z) != 0u) {
/*104*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*105*/	  if(floatBitsToUint(r0.z) != 0u) {
/*106*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*107*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*108*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*109*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*110*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*111*/	    r0.z = -r0.z + 1.000000;
/*112*/	    r0.z = max(r0.z, 0.000000);
/*113*/	    r9.z = sqrt(r0.z);
/*114*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*115*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*116*/	    r0.z = inversesqrt(r0.z);
/*117*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*118*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*119*/	    r11.y = -1.000000;
/*120*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*121*/	    r0.z = inversesqrt(r0.z);
/*122*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*123*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*124*/	    r3.z = cb3.data[1].x * cb3.data[1].x;
/*125*/	    r3.z = r3.z * 1.250000;
/*126*/	    r3.z = min(r3.z, 1.000000);
/*127*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*128*/	    r4.z = r4.z * 4.000000;
/*129*/	    r3.z = r3.z * 0.200000 + r4.z;
/*130*/	    r3.z = r3.z * -0.700000 + 1.000000;
/*131*/	    r0.z = r0.z + -r3.z;
/*132*/	    r0.z = saturate(r0.z * 200.000000);
/*133*/	    r3.z = r0.z * -2.000000 + 3.000000;
/*134*/	    r0.z = r0.z * r0.z;
/*135*/	    r0.z = r0.z * r3.z;
/*136*/	    r4.x = r0.z * -r4.x + r4.x;
/*137*/	    r3.z = -r4.y + 0.200000;
/*138*/	    r4.y = r0.z * r3.z + r4.y;
/*139*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*140*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*141*/	    r10.xyz = (-r3.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*142*/	    r3.xyw = (r0.zzzz * r10.xyxz + r3.xyxw).xyw;
/*143*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*144*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*145*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*146*/	    r3.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*147*/	    r3.z = -r3.z + 1.000000;
/*148*/	    r3.z = max(r3.z, 0.000000);
/*149*/	    r8.z = sqrt(r3.z);
/*150*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*151*/	    r3.z = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*152*/	    r3.z = sqrt(r3.z);
/*153*/	    r8.xyz = (r9.xyzx * r3.zzzz + r8.xyzx).xyz;
/*154*/	    r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*155*/	    r3.z = inversesqrt(r3.z);
/*156*/	    r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*157*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*158*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*159*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*160*/	    r3.z = -r1.y + 1.000000;
/*161*/	    r0.z = min(r0.z, r3.z);
/*162*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*163*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*164*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*165*/	    r0.z = inversesqrt(r0.z);
/*166*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*167*/	  }
/*168*/	}
/*169*/	r0.z = vsOut_T7.y * -r4.y + r4.y;
/*170*/	r4.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*171*/	r4.yzw = (-r0.xxyw + r4.yyzw).yzw;
/*172*/	r0.xyw = saturate(vsOut_T7.yyyy * r4.yzyw + r0.xyxw).xyw;
/*173*/	r3.z = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*174*/	r4.yzw = (-r0.xxyw + r3.zzzz).yzw;
/*175*/	r0.xyw = (vsOut_T7.zzzz * r4.yzyw + r0.xyxw).xyw;
/*176*/	r3.z = dot(vec3(r3.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*177*/	r4.yzw = (-r3.xxyw + r3.zzzz).yzw;
/*178*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xywx).xyz;
/*179*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*180*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*181*/	r3.w = inversesqrt(r3.w);
/*182*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*183*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*184*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*185*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*186*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*187*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*188*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*189*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*190*/	r4.y = intBitsToFloat(int(r3.w));
/*191*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*192*/	if(floatBitsToUint(r4.z) != 0u) {
/*193*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*194*/	  r5.w = vsOut_T0.w;
/*195*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*196*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*197*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*198*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*199*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*200*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*201*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*202*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*203*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*204*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*205*/	  if(floatBitsToUint(r4.w) == 0u) {
/*206*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*207*/	    r7.xy = floor((r6.xyxx).xy);
/*208*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*209*/	    r4.z = -0.000400 / r4.z;
/*210*/	    r4.z = r4.z + r6.z;
/*211*/	    r8.z = -r8.y + 1.000000;
/*212*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*213*/	    r8.w = -r8.y;
/*214*/	    r10.x = cb1.data[0].z/**/;
/*215*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*216*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*217*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*218*/	    r10.w = -cb1.data[0].w/**/;
/*219*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*220*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*221*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*222*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*223*/	    r8.x = r9.x;
/*224*/	    r8.y = r11.x;
/*225*/	    r8.z = r10.x;
/*226*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*227*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*228*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*229*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*230*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*231*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*232*/	    r4.z = -r6.x + r6.y;
/*233*/	    r4.z = r4.w * r4.z + r6.x;
/*234*/	  } else {
/*235*/	    r4.z = 1.000000;
/*236*/	  }
/*237*/	} else {
/*238*/	  r4.z = 1.000000;
/*239*/	}
/*240*/	r4.w = cb1.data[34].w + -1.000000;
/*241*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*242*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*243*/	if(floatBitsToUint(r3.w) == 0u) {
/*244*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*245*/	  r3.w = floatBitsToInt(r3.w);
/*246*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*247*/	  if(floatBitsToUint(r3.w) != 0u) {
/*248*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*249*/	    r5.w = vsOut_T0.w;
/*250*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*251*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*252*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*253*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*254*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*255*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*256*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*257*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*258*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*259*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*260*/	    if(floatBitsToUint(r5.w) == 0u) {
/*261*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*262*/	      r6.xy = floor((r5.xyxx).xy);
/*263*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*264*/	      r3.w = -0.000400 / r3.w;
/*265*/	      r3.w = r3.w + r5.z;
/*266*/	      r7.z = -r7.y + 1.000000;
/*267*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*268*/	      r7.w = -r7.y;
/*269*/	      r9.x = cb1.data[0].z/**/;
/*270*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*271*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*272*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*273*/	      r9.w = -cb1.data[0].w/**/;
/*274*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*275*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*276*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*277*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*278*/	      r7.x = r8.x;
/*279*/	      r7.y = r10.x;
/*280*/	      r7.z = r9.x;
/*281*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*282*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*283*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*284*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*285*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*286*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*287*/	      r3.w = -r5.x + r5.z;
/*288*/	      r3.w = r5.y * r3.w + r5.x;
/*289*/	    } else {
/*290*/	      r3.w = 1.000000;
/*291*/	    }
/*292*/	  } else {
/*293*/	    r3.w = 1.000000;
/*294*/	  }
/*295*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*296*/	  r5.y = r5.x * cb1.data[34].x;
/*297*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*298*/	  r5.x = r1.w + -r5.x;
/*299*/	  r5.x = saturate(r5.x / r5.y);
/*300*/	  r3.w = -r4.z + r3.w;
/*301*/	  r4.z = r5.x * r3.w + r4.z;
/*302*/	}
/*303*/	if(floatBitsToUint(r4.w) != 0u) {
/*304*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*305*/	  r4.w = r3.w * cb1.data[34].y;
/*306*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*307*/	  r3.w = r1.w + -r3.w;
/*308*/	  r3.w = saturate(r3.w / r4.w);
/*309*/	  r4.y = -r4.z + 1.000000;
/*310*/	  r4.z = r3.w * r4.y + r4.z;
/*311*/	}
/*312*/	r4.z = saturate(r4.z);
/*313*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*314*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*315*/	r3.w = inversesqrt(r3.w);
/*316*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*317*/	r3.w = -r4.x + 1.000000;
/*318*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*319*/	r4.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*320*/	r4.w = r4.w + r4.w;
/*321*/	r6.xyz = (r1.xyzx * -r4.wwww + r5.xyzx).xyz;
/*322*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*323*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*324*/	r4.w = cos((r8.x));
/*325*/	r4.w = inversesqrt(r4.w);
/*326*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*327*/	r5.w = saturate(r0.z * 60.000000);
/*328*/	r5.w = -r0.z + r5.w;
/*329*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*330*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*331*/	r6.w = inversesqrt(r6.w);
/*332*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*333*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*334*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*335*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*336*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*337*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*338*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*339*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*340*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*341*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*342*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*343*/	r6.w = -r0.z + 1.000000;
/*344*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*345*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*346*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*347*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*348*/	  r6.w = max(r6.w, 0.000000);
/*349*/	  r6.w = log2(r6.w);
/*350*/	  r6.w = r6.w * 10.000000;
/*351*/	  r6.w = exp2(r6.w);
/*352*/	  r6.w = r4.w * r6.w;
/*353*/	  r6.w = r6.w * r5.w + r0.z;
/*354*/	  r7.y = r3.w * 8.000000;
/*355*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*356*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*357*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*358*/	}
/*359*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*360*/	r7.y = max(r6.w, 0.000000);
/*361*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*362*/	if(floatBitsToUint(r6.w) != 0u) {
/*363*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*364*/	  r6.x = max(r6.x, -1.000000);
/*365*/	  r6.x = min(r6.x, 1.000000);
/*366*/	  r6.y = -abs(r6.x) + 1.000000;
/*367*/	  r6.y = sqrt(r6.y);
/*368*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*369*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*370*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*371*/	  r6.w = r6.y * r6.z;
/*372*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*373*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*374*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*375*/	  r6.x = r6.z * r6.y + r6.x;
/*376*/	  r4.x = r4.x * r4.x;
/*377*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*378*/	  r4.x = r4.x * r4.y + r7.x;
/*379*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*380*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*381*/	  r4.y = -r4.x * r4.x + 1.000000;
/*382*/	  r4.y = max(r4.y, 0.001000);
/*383*/	  r4.y = log2(r4.y);
/*384*/	  r6.y = r4.y * 4.950617;
/*385*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*386*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*387*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*388*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*389*/	  r4.x = floatBitsToInt(r4.x);
/*390*/	  r6.y = r4.y * r4.y + -r6.y;
/*391*/	  r6.y = sqrt(r6.y);
/*392*/	  r4.y = -r4.y + r6.y;
/*393*/	  r4.y = max(r4.y, 0.000000);
/*394*/	  r4.y = sqrt(r4.y);
/*395*/	  r4.x = r4.y * r4.x;
/*396*/	  r4.x = r4.x * 1.414214;
/*397*/	  r4.x = 0.008727 / r4.x;
/*398*/	  r4.x = max(r4.x, 0.000100);
/*399*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*400*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*401*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*402*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*403*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*404*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*405*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*406*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*407*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*408*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*409*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*410*/	  r4.x = floatBitsToInt(r4.x);
/*411*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*412*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*413*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*414*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*415*/	  r4.x = r4.x * r6.x + 1.000000;
/*416*/	  r4.x = r4.x * 0.500000;
/*417*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*418*/	  r4.y = r4.y * r6.y + 1.000000;
/*419*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*420*/	  r4.y = min(r7.y, 1.000000);
/*421*/	  r3.w = r3.w * 1.570796;
/*422*/	  r3.w = sin(r3.w);
/*423*/	  r4.y = r4.y + -1.000000;
/*424*/	  r3.w = r3.w * r4.y + 1.000000;
/*425*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*426*/	  r4.y = max(r4.y, 0.000000);
/*427*/	  r4.y = log2(r4.y);
/*428*/	  r4.y = r4.y * 10.000000;
/*429*/	  r4.y = exp2(r4.y);
/*430*/	  r4.y = r4.w * r4.y;
/*431*/	  r4.y = r4.y * r5.w + r0.z;
/*432*/	  r3.w = r3.w * abs(r4.x);
/*433*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*434*/	} else {
/*435*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*436*/	}
/*437*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*438*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*439*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*440*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*441*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*442*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*443*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*444*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*445*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*446*/	r0.xyw = (r4.zzzz * r0.xyxw + r8.xzxw).xyw;
/*447*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*448*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*449*/	r3.w = inversesqrt(r3.w);
/*450*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*451*/	r3.w = dot(vec3(-r4.xyzx), vec3(r1.xyzx));
/*452*/	r3.w = r3.w + r3.w;
/*453*/	r1.xyz = (r1.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*454*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*455*/	r1.x = dot(vec3(r1.xyzx), vec3(-r4.xyzx));
/*456*/	r1.x = max(r1.x, 0.000000);
/*457*/	r1.x = log2(r1.x);
/*458*/	r1.x = r1.x * 10.000000;
/*459*/	r1.x = exp2(r1.x);
/*460*/	r1.x = r4.w * r1.x;
/*461*/	r0.z = r1.x * r5.w + r0.z;
/*462*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*463*/	color0.xyz = (r1.xyzx * r3.xyzx + r0.xywx).xyz;
/*464*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*465*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*466*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*467*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*468*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*469*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*470*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*471*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*472*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*473*/	if(r0.x != 0) discard;
/*474*/	color1.x = 1.000000;
/*475*/	return;
}
