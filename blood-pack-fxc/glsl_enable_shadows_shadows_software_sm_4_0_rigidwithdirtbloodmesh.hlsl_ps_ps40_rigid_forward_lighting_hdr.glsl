//
//
// Shader Model 4
// Fragment Shader
//
// id: 5302 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*42*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*44*/	r4.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*45*/	r4.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*46*/	r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*47*/	r3.z = r3.w * r4.w;
/*48*/	r5.xyz = (-r0.xywx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*49*/	r0.xyw = (r3.zzzz * r5.xyxz + r0.xyxw).xyw;
/*50*/	r1.xy = (r4.xyxx * r3.wwww + r1.xyxx).xy;
/*51*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r3.w = inversesqrt(r3.w);
/*53*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*54*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*55*/	r4.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*56*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*57*/	r3.x = saturate(-r3.x + r4.w);
/*58*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*59*/	if(floatBitsToUint(r3.x) != 0u) {
/*60*/	  r3.x = -r4.w + 1.000000;
/*61*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*62*/	  r3.x = -r3.x + 1.000000;
/*63*/	  r3.x = -r3.x * r3.x + 1.000000;
/*64*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*65*/	  r3.xyw = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*66*/	  r4.x = saturate(dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*67*/	  r4.x = uintBitsToFloat((r4.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*68*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & uint(0x3f800000u));
/*69*/	  r4.yzw = (r0.xxyw * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r3.xxww).yzw;
/*70*/	  r0.xyw = (r4.xxxx * r4.yzyw + r3.xyxw).xyw;
/*71*/	  r3.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*72*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*73*/	} else {
/*74*/	  r5.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*75*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*76*/	  r6.xyz = (r3.zzzz * r5.xyzx).xyz;
/*77*/	  r3.xyw = (r6.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r5.xyxz).xyw;
/*78*/	}
/*79*/	r3.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r3.z = inversesqrt(r3.z);
/*81*/	r5.xyz = (r3.zzzz * vsOut_T3.xyzx).xyz;
/*82*/	r3.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*83*/	r3.z = inversesqrt(r3.z);
/*84*/	r6.xyz = (r3.zzzz * vsOut_T4.xyzx).xyz;
/*85*/	r3.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r3.z = inversesqrt(r3.z);
/*87*/	r7.xyz = (r3.zzzz * vsOut_T2.xyzx).xyz;
/*88*/	r8.xyz = (r1.yyyy * r6.xyzx).xyz;
/*89*/	r8.xyz = (r1.xxxx * r5.xyzx + r8.xyzx).xyz;
/*90*/	r8.xyz = (r1.zzzz * r7.xyzx + r8.xyzx).xyz;
/*91*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*92*/	r3.z = inversesqrt(r3.z);
/*93*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*94*/	r1.xyz = (mix(r8.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*95*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*96*/	if(floatBitsToUint(r0.z) != 0u) {
/*97*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*98*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*99*/	  r0.z = r4.w * cb0.data[26].x;
/*100*/	  r8.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*101*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*102*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*103*/	  r3.xyw = (r8.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r3.xyxw).xyw;
/*104*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*105*/	}
/*106*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*107*/	if(floatBitsToUint(r0.z) != 0u) {
/*108*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*109*/	  if(floatBitsToUint(r0.z) != 0u) {
/*110*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*111*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*112*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*113*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*114*/	    r0.z = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*115*/	    r0.z = -r0.z + 1.000000;
/*116*/	    r0.z = max(r0.z, 0.000000);
/*117*/	    r9.z = sqrt(r0.z);
/*118*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*119*/	    r0.z = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*120*/	    r0.z = inversesqrt(r0.z);
/*121*/	    r10.xyz = (r0.zzzz * r10.xyzx).xyz;
/*122*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*123*/	    r11.y = -1.000000;
/*124*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*125*/	    r0.z = inversesqrt(r0.z);
/*126*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*127*/	    r0.z = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*128*/	    r3.z = cb3.data[1].x * cb3.data[1].x;
/*129*/	    r3.z = r3.z * 1.250000;
/*130*/	    r3.z = min(r3.z, 1.000000);
/*131*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*132*/	    r4.z = r4.z * 4.000000;
/*133*/	    r3.z = r3.z * 0.200000 + r4.z;
/*134*/	    r3.z = r3.z * -0.700000 + 1.000000;
/*135*/	    r0.z = r0.z + -r3.z;
/*136*/	    r0.z = saturate(r0.z * 200.000000);
/*137*/	    r3.z = r0.z * -2.000000 + 3.000000;
/*138*/	    r0.z = r0.z * r0.z;
/*139*/	    r0.z = r0.z * r3.z;
/*140*/	    r4.x = r0.z * -r4.x + r4.x;
/*141*/	    r3.z = -r4.y + 0.200000;
/*142*/	    r4.y = r0.z * r3.z + r4.y;
/*143*/	    r10.xyz = (-r0.xywx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*144*/	    r0.xyw = (r0.zzzz * r10.xyxz + r0.xyxw).xyw;
/*145*/	    r10.xyz = (-r3.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*146*/	    r3.xyw = (r0.zzzz * r10.xyxz + r3.xyxw).xyw;
/*147*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*148*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*149*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*150*/	    r3.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*151*/	    r3.z = -r3.z + 1.000000;
/*152*/	    r3.z = max(r3.z, 0.000000);
/*153*/	    r8.z = sqrt(r3.z);
/*154*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*155*/	    r3.z = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*156*/	    r3.z = sqrt(r3.z);
/*157*/	    r8.xyz = (r9.xyzx * r3.zzzz + r8.xyzx).xyz;
/*158*/	    r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*159*/	    r3.z = inversesqrt(r3.z);
/*160*/	    r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*161*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*162*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*163*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*164*/	    r3.z = -r1.y + 1.000000;
/*165*/	    r0.z = min(r0.z, r3.z);
/*166*/	    r5.xyz = (-r1.xyzx + r5.xyzx).xyz;
/*167*/	    r5.xyz = (r0.zzzz * r5.xyzx + r1.xyzx).xyz;
/*168*/	    r0.z = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*169*/	    r0.z = inversesqrt(r0.z);
/*170*/	    r1.xyz = (r0.zzzz * r5.xyzx).xyz;
/*171*/	  }
/*172*/	}
/*173*/	r0.z = vsOut_T7.y * -r4.y + r4.y;
/*174*/	r4.yzw = (r0.xxyw * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*175*/	r4.yzw = (-r0.xxyw + r4.yyzw).yzw;
/*176*/	r0.xyw = saturate(vsOut_T7.yyyy * r4.yzyw + r0.xyxw).xyw;
/*177*/	r3.z = dot(vec3(r0.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*178*/	r4.yzw = (-r0.xxyw + r3.zzzz).yzw;
/*179*/	r0.xyw = (vsOut_T7.zzzz * r4.yzyw + r0.xyxw).xyw;
/*180*/	r3.z = dot(vec3(r3.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*181*/	r4.yzw = (-r3.xxyw + r3.zzzz).yzw;
/*182*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xywx).xyz;
/*183*/	r0.z = vsOut_T7.z * -r0.z + r0.z;
/*184*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*185*/	r3.w = inversesqrt(r3.w);
/*186*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*187*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*188*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*189*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*190*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*191*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*192*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*193*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*194*/	r4.y = intBitsToFloat(int(r3.w));
/*195*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*196*/	if(floatBitsToUint(r4.z) != 0u) {
/*197*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*198*/	  r5.w = vsOut_T0.w;
/*199*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*200*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*201*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*202*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*203*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*204*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*205*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*206*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*207*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*208*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*209*/	  if(floatBitsToUint(r4.w) == 0u) {
/*210*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*211*/	    r7.xy = floor((r6.xyxx).xy);
/*212*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*213*/	    r4.z = -0.000400 / r4.z;
/*214*/	    r4.z = r4.z + r6.z;
/*215*/	    r8.z = -r8.y + 1.000000;
/*216*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*217*/	    r8.w = -r8.y;
/*218*/	    r10.x = cb1.data[0].z/**/;
/*219*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*220*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*221*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*222*/	    r10.w = -cb1.data[0].w/**/;
/*223*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*224*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*225*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*226*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*227*/	    r8.x = r9.x;
/*228*/	    r8.y = r11.x;
/*229*/	    r8.z = r10.x;
/*230*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*231*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*232*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*233*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*234*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*235*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*236*/	    r4.z = -r6.x + r6.y;
/*237*/	    r4.z = r4.w * r4.z + r6.x;
/*238*/	  } else {
/*239*/	    r4.z = 1.000000;
/*240*/	  }
/*241*/	} else {
/*242*/	  r4.z = 1.000000;
/*243*/	}
/*244*/	r4.w = cb1.data[34].w + -1.000000;
/*245*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*246*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*247*/	if(floatBitsToUint(r3.w) == 0u) {
/*248*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*249*/	  r3.w = floatBitsToInt(r3.w);
/*250*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*251*/	  if(floatBitsToUint(r3.w) != 0u) {
/*252*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*253*/	    r5.w = vsOut_T0.w;
/*254*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*255*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*256*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*257*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*258*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*259*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*260*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*261*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*262*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*263*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*264*/	    if(floatBitsToUint(r5.w) == 0u) {
/*265*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*266*/	      r6.xy = floor((r5.xyxx).xy);
/*267*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*268*/	      r3.w = -0.000400 / r3.w;
/*269*/	      r3.w = r3.w + r5.z;
/*270*/	      r7.z = -r7.y + 1.000000;
/*271*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*272*/	      r7.w = -r7.y;
/*273*/	      r9.x = cb1.data[0].z/**/;
/*274*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*275*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*276*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*277*/	      r9.w = -cb1.data[0].w/**/;
/*278*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*279*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*280*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*281*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*282*/	      r7.x = r8.x;
/*283*/	      r7.y = r10.x;
/*284*/	      r7.z = r9.x;
/*285*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*286*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*287*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*288*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*289*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*290*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*291*/	      r3.w = -r5.x + r5.z;
/*292*/	      r3.w = r5.y * r3.w + r5.x;
/*293*/	    } else {
/*294*/	      r3.w = 1.000000;
/*295*/	    }
/*296*/	  } else {
/*297*/	    r3.w = 1.000000;
/*298*/	  }
/*299*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*300*/	  r5.y = r5.x * cb1.data[34].x;
/*301*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*302*/	  r5.x = r1.w + -r5.x;
/*303*/	  r5.x = saturate(r5.x / r5.y);
/*304*/	  r3.w = -r4.z + r3.w;
/*305*/	  r4.z = r5.x * r3.w + r4.z;
/*306*/	}
/*307*/	if(floatBitsToUint(r4.w) != 0u) {
/*308*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*309*/	  r4.w = r3.w * cb1.data[34].y;
/*310*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*311*/	  r3.w = r1.w + -r3.w;
/*312*/	  r3.w = saturate(r3.w / r4.w);
/*313*/	  r4.y = -r4.z + 1.000000;
/*314*/	  r4.z = r3.w * r4.y + r4.z;
/*315*/	}
/*316*/	r4.z = saturate(r4.z);
/*317*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*318*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*319*/	r3.w = inversesqrt(r3.w);
/*320*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*321*/	r3.w = -r4.x + 1.000000;
/*322*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*323*/	r4.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*324*/	r4.w = r4.w + r4.w;
/*325*/	r6.xyz = (r1.xyzx * -r4.wwww + r5.xyzx).xyz;
/*326*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*327*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*328*/	r4.w = cos((r8.x));
/*329*/	r4.w = inversesqrt(r4.w);
/*330*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*331*/	r5.w = saturate(r0.z * 60.000000);
/*332*/	r5.w = -r0.z + r5.w;
/*333*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*334*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*335*/	r6.w = inversesqrt(r6.w);
/*336*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*337*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*338*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*339*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*340*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*341*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*342*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*343*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*344*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*345*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*346*/	r8.xzw = (r0.xxyw * r8.xxzw).xzw;
/*347*/	r6.w = -r0.z + 1.000000;
/*348*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*349*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*350*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*351*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*352*/	  r6.w = max(r6.w, 0.000000);
/*353*/	  r6.w = log2(r6.w);
/*354*/	  r6.w = r6.w * 10.000000;
/*355*/	  r6.w = exp2(r6.w);
/*356*/	  r6.w = r4.w * r6.w;
/*357*/	  r6.w = r6.w * r5.w + r0.z;
/*358*/	  r7.y = r3.w * 8.000000;
/*359*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*360*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*361*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*362*/	}
/*363*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*364*/	r7.y = max(r6.w, 0.000000);
/*365*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*366*/	if(floatBitsToUint(r6.w) != 0u) {
/*367*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*368*/	  r6.x = max(r6.x, -1.000000);
/*369*/	  r6.x = min(r6.x, 1.000000);
/*370*/	  r6.y = -abs(r6.x) + 1.000000;
/*371*/	  r6.y = sqrt(r6.y);
/*372*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*373*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*374*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*375*/	  r6.w = r6.y * r6.z;
/*376*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*377*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*378*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*379*/	  r6.x = r6.z * r6.y + r6.x;
/*380*/	  r4.x = r4.x * r4.x;
/*381*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*382*/	  r4.x = r4.x * r4.y + r7.x;
/*383*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*384*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*385*/	  r4.y = -r4.x * r4.x + 1.000000;
/*386*/	  r4.y = max(r4.y, 0.001000);
/*387*/	  r4.y = log2(r4.y);
/*388*/	  r6.y = r4.y * 4.950617;
/*389*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*390*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*391*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*392*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*393*/	  r4.x = floatBitsToInt(r4.x);
/*394*/	  r6.y = r4.y * r4.y + -r6.y;
/*395*/	  r6.y = sqrt(r6.y);
/*396*/	  r4.y = -r4.y + r6.y;
/*397*/	  r4.y = max(r4.y, 0.000000);
/*398*/	  r4.y = sqrt(r4.y);
/*399*/	  r4.x = r4.y * r4.x;
/*400*/	  r4.x = r4.x * 1.414214;
/*401*/	  r4.x = 0.008727 / r4.x;
/*402*/	  r4.x = max(r4.x, 0.000100);
/*403*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*404*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*405*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*406*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*407*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*408*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*409*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*410*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*411*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*412*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*413*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*414*/	  r4.x = floatBitsToInt(r4.x);
/*415*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*416*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*417*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*418*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*419*/	  r4.x = r4.x * r6.x + 1.000000;
/*420*/	  r4.x = r4.x * 0.500000;
/*421*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*422*/	  r4.y = r4.y * r6.y + 1.000000;
/*423*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*424*/	  r4.y = min(r7.y, 1.000000);
/*425*/	  r3.w = r3.w * 1.570796;
/*426*/	  r3.w = sin(r3.w);
/*427*/	  r4.y = r4.y + -1.000000;
/*428*/	  r3.w = r3.w * r4.y + 1.000000;
/*429*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*430*/	  r4.y = max(r4.y, 0.000000);
/*431*/	  r4.y = log2(r4.y);
/*432*/	  r4.y = r4.y * 10.000000;
/*433*/	  r4.y = exp2(r4.y);
/*434*/	  r4.y = r4.w * r4.y;
/*435*/	  r4.y = r4.y * r5.w + r0.z;
/*436*/	  r3.w = r3.w * abs(r4.x);
/*437*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*438*/	} else {
/*439*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*440*/	}
/*441*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*442*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*443*/	r5.xyz = (max(r0.zzzz, r5.xyzx)).xyz;
/*444*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*445*/	r0.xyw = (r0.xyxw * r7.yyyy).xyw;
/*446*/	r0.xyw = (r0.xyxw * cb2.data[1].xyxz).xyw;
/*447*/	r0.xyw = (r5.xyxz * r0.xyxw).xyw;
/*448*/	r0.xyw = (r7.xxxx * r0.xyxw).xyw;
/*449*/	r0.xyw = (r6.xyxz * cb2.data[1].xyxz + r0.xyxw).xyw;
/*450*/	r0.xyw = (r4.zzzz * r0.xyxw + r8.xzxw).xyw;
/*451*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*452*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*453*/	r3.w = inversesqrt(r3.w);
/*454*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*455*/	r3.w = dot(vec3(-r4.xyzx), vec3(r1.xyzx));
/*456*/	r3.w = r3.w + r3.w;
/*457*/	r1.xyz = (r1.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*458*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*459*/	r1.x = dot(vec3(r1.xyzx), vec3(-r4.xyzx));
/*460*/	r1.x = max(r1.x, 0.000000);
/*461*/	r1.x = log2(r1.x);
/*462*/	r1.x = r1.x * 10.000000;
/*463*/	r1.x = exp2(r1.x);
/*464*/	r1.x = r4.w * r1.x;
/*465*/	r0.z = r1.x * r5.w + r0.z;
/*466*/	r1.xyz = (r6.xyzx * r0.zzzz).xyz;
/*467*/	color0.xyz = (r1.xyzx * r3.xyzx + r0.xywx).xyz;
/*468*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*469*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*470*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*471*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*472*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*473*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*474*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*475*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*476*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*477*/	if(r0.x != 0) discard;
/*478*/	color1.x = 1.000000;
/*479*/	return;
}
