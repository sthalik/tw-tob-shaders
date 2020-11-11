//
//
// Shader Model 4
// Fragment Shader
//
// id: 5307 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidwithdirtbloodmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*8*/	r0.y = r1.w + -0.500000;
/*9*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*10*/	if(r0.y != 0) discard;
/*11*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*12*/	color0.w = r0.x * r1.w;
/*13*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r0.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*15*/	r2.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*16*/	r0.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*17*/	r0.x = -r0.x + 1.000000;
/*18*/	r0.x = max(r0.x, 0.000000);
/*19*/	r2.z = sqrt(r0.x);
/*20*/	r0.xyw = (mix(r2.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*21*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*22*/	r2.w = 1.000000;
/*23*/	r1.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*24*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*26*/	r4.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.yzyy).xy;
/*27*/	r4.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*28*/	r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*29*/	r3.z = r3.w * r4.w;
/*30*/	r5.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*31*/	r1.xyz = (r3.zzzz * r5.xyzx + r1.xyzx).xyz;
/*32*/	r0.xy = (r4.xyxx * r3.wwww + r0.xyxx).xy;
/*33*/	r3.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*34*/	r3.w = inversesqrt(r3.w);
/*35*/	r0.xyw = (r0.xyxw * r3.wwww).xyw;
/*36*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*37*/	r4.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*38*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*39*/	r3.x = saturate(-r3.x + r4.w);
/*40*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*41*/	if(floatBitsToUint(r3.x) != 0u) {
/*42*/	  r3.x = -r4.w + 1.000000;
/*43*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*44*/	  r3.x = -r3.x + 1.000000;
/*45*/	  r3.x = -r3.x * r3.x + 1.000000;
/*46*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*47*/	  r3.xyw = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyw;
/*48*/	  r4.x = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*49*/	  r4.x = uintBitsToFloat((r4.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*50*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & uint(0x3f800000u));
/*51*/	  r4.yzw = (r1.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r3.xxww).yzw;
/*52*/	  r1.xyz = (r4.xxxx * r4.yzwy + r3.xywx).xyz;
/*53*/	  r3.xyw = (vec4(1.000000, 0.800000, 0, 0.800000)).xyw;
/*54*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*55*/	} else {
/*56*/	  r5.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*57*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*58*/	  r6.xyz = (r3.zzzz * r5.xyzx).xyz;
/*59*/	  r3.xyw = (r6.xyxz * vec4(-0.990000, -0.990000, 0.000000, -0.990000) + r5.xyxz).xyw;
/*60*/	}
/*61*/	r3.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*62*/	r3.z = inversesqrt(r3.z);
/*63*/	r5.xyz = (r3.zzzz * vsOut_T3.xyzx).xyz;
/*64*/	r3.z = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*65*/	r3.z = inversesqrt(r3.z);
/*66*/	r6.xyz = (r3.zzzz * vsOut_T4.xyzx).xyz;
/*67*/	r3.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*68*/	r3.z = inversesqrt(r3.z);
/*69*/	r7.xyz = (r3.zzzz * vsOut_T2.xyzx).xyz;
/*70*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*71*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*72*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*73*/	r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*74*/	r3.z = inversesqrt(r3.z);
/*75*/	r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*76*/	r0.xyz = (mix(r8.xyzx, r0.xywx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*77*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*78*/	if(floatBitsToUint(r0.w) != 0u) {
/*79*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*80*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*81*/	  r0.w = r4.w * cb0.data[26].x;
/*82*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*83*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*84*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*85*/	  r3.xyw = (r8.xxxx * vec4(0.600000, 0.600000, 0.000000, 0.600000) + r3.xyxw).xyw;
/*86*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*87*/	}
/*88*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*89*/	if(floatBitsToUint(r0.w) != 0u) {
/*90*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*91*/	  if(floatBitsToUint(r0.w) != 0u) {
/*92*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*93*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*94*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*95*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*96*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*97*/	    r0.w = -r0.w + 1.000000;
/*98*/	    r0.w = max(r0.w, 0.000000);
/*99*/	    r9.z = sqrt(r0.w);
/*100*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*101*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*102*/	    r0.w = inversesqrt(r0.w);
/*103*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*104*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*105*/	    r11.y = -1.000000;
/*106*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*107*/	    r0.w = inversesqrt(r0.w);
/*108*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*109*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*110*/	    r3.z = cb3.data[1].x * cb3.data[1].x;
/*111*/	    r3.z = r3.z * 1.250000;
/*112*/	    r3.z = min(r3.z, 1.000000);
/*113*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*114*/	    r4.z = r4.z * 4.000000;
/*115*/	    r3.z = r3.z * 0.200000 + r4.z;
/*116*/	    r3.z = r3.z * -0.700000 + 1.000000;
/*117*/	    r0.w = r0.w + -r3.z;
/*118*/	    r0.w = saturate(r0.w * 200.000000);
/*119*/	    r3.z = r0.w * -2.000000 + 3.000000;
/*120*/	    r0.w = r0.w * r0.w;
/*121*/	    r0.w = r0.w * r3.z;
/*122*/	    r4.x = r0.w * -r4.x + r4.x;
/*123*/	    r3.z = -r4.y + 0.200000;
/*124*/	    r4.y = r0.w * r3.z + r4.y;
/*125*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*126*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*127*/	    r10.xyz = (-r3.xywx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*128*/	    r3.xyw = (r0.wwww * r10.xyxz + r3.xyxw).xyw;
/*129*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*130*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*131*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*132*/	    r3.z = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*133*/	    r3.z = -r3.z + 1.000000;
/*134*/	    r3.z = max(r3.z, 0.000000);
/*135*/	    r8.z = sqrt(r3.z);
/*136*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*137*/	    r3.z = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*138*/	    r3.z = sqrt(r3.z);
/*139*/	    r8.xyz = (r9.xyzx * r3.zzzz + r8.xyzx).xyz;
/*140*/	    r3.z = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*141*/	    r3.z = inversesqrt(r3.z);
/*142*/	    r8.xyz = (r3.zzzz * r8.xyzx).xyz;
/*143*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*144*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*145*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*146*/	    r3.z = -r0.y + 1.000000;
/*147*/	    r0.w = min(r0.w, r3.z);
/*148*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*149*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*150*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*151*/	    r0.w = inversesqrt(r0.w);
/*152*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*153*/	  }
/*154*/	}
/*155*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*156*/	r4.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*157*/	r4.yzw = (-r1.xxyz + r4.yyzw).yzw;
/*158*/	r1.xyz = saturate(vsOut_T7.yyyy * r4.yzwy + r1.xyzx).xyz;
/*159*/	r3.z = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*160*/	r4.yzw = (-r1.xxyz + r3.zzzz).yzw;
/*161*/	r1.xyz = (vsOut_T7.zzzz * r4.yzwy + r1.xyzx).xyz;
/*162*/	r3.z = dot(vec3(r3.xywx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*163*/	r4.yzw = (-r3.xxyw + r3.zzzz).yzw;
/*164*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xywx).xyz;
/*165*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*166*/	r3.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*167*/	r3.w = inversesqrt(r3.w);
/*168*/	r0.xyz = (r0.xyzx * r3.wwww).xyz;
/*169*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*170*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*171*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*172*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*173*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*174*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*175*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*176*/	r4.y = intBitsToFloat(int(r3.w));
/*177*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*178*/	if(floatBitsToUint(r4.z) != 0u) {
/*179*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*180*/	  r5.w = vsOut_T0.w;
/*181*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*182*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*183*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*184*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*185*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*186*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*187*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*188*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*189*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*190*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*191*/	  if(floatBitsToUint(r4.w) == 0u) {
/*192*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*193*/	    r7.xy = floor((r6.xyxx).xy);
/*194*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*195*/	    r4.z = -0.000400 / r4.z;
/*196*/	    r4.z = r4.z + r6.z;
/*197*/	    r8.z = -r8.y + 1.000000;
/*198*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*199*/	    r8.w = -r8.y;
/*200*/	    r10.x = cb1.data[0].z/**/;
/*201*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*202*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*203*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*204*/	    r10.w = -cb1.data[0].w/**/;
/*205*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*206*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*207*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*208*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*209*/	    r8.x = r9.x;
/*210*/	    r8.y = r11.x;
/*211*/	    r8.z = r10.x;
/*212*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*213*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*214*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*215*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*216*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*217*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*218*/	    r4.z = -r6.x + r6.y;
/*219*/	    r4.z = r4.w * r4.z + r6.x;
/*220*/	  } else {
/*221*/	    r4.z = 1.000000;
/*222*/	  }
/*223*/	} else {
/*224*/	  r4.z = 1.000000;
/*225*/	}
/*226*/	r4.w = cb1.data[34].w + -1.000000;
/*227*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*228*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*229*/	if(floatBitsToUint(r3.w) == 0u) {
/*230*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*231*/	  r3.w = floatBitsToInt(r3.w);
/*232*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*233*/	  if(floatBitsToUint(r3.w) != 0u) {
/*234*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*235*/	    r5.w = vsOut_T0.w;
/*236*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*237*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*238*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*239*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*240*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*241*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*242*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*243*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*244*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*245*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*246*/	    if(floatBitsToUint(r5.w) == 0u) {
/*247*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*248*/	      r6.xy = floor((r5.xyxx).xy);
/*249*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*250*/	      r3.w = -0.000400 / r3.w;
/*251*/	      r3.w = r3.w + r5.z;
/*252*/	      r7.z = -r7.y + 1.000000;
/*253*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*254*/	      r7.w = -r7.y;
/*255*/	      r9.x = cb1.data[0].z/**/;
/*256*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*257*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*258*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*259*/	      r9.w = -cb1.data[0].w/**/;
/*260*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*261*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*262*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*263*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*264*/	      r7.x = r8.x;
/*265*/	      r7.y = r10.x;
/*266*/	      r7.z = r9.x;
/*267*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*268*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*269*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*270*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*271*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*272*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*273*/	      r3.w = -r5.x + r5.z;
/*274*/	      r3.w = r5.y * r3.w + r5.x;
/*275*/	    } else {
/*276*/	      r3.w = 1.000000;
/*277*/	    }
/*278*/	  } else {
/*279*/	    r3.w = 1.000000;
/*280*/	  }
/*281*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*282*/	  r5.y = r5.x * cb1.data[34].x;
/*283*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*284*/	  r5.x = r1.w + -r5.x;
/*285*/	  r5.x = saturate(r5.x / r5.y);
/*286*/	  r3.w = -r4.z + r3.w;
/*287*/	  r4.z = r5.x * r3.w + r4.z;
/*288*/	}
/*289*/	if(floatBitsToUint(r4.w) != 0u) {
/*290*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*291*/	  r4.w = r3.w * cb1.data[34].y;
/*292*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*293*/	  r3.w = r1.w + -r3.w;
/*294*/	  r3.w = saturate(r3.w / r4.w);
/*295*/	  r4.y = -r4.z + 1.000000;
/*296*/	  r4.z = r3.w * r4.y + r4.z;
/*297*/	}
/*298*/	r4.z = saturate(r4.z);
/*299*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*300*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*301*/	r3.w = inversesqrt(r3.w);
/*302*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*303*/	r3.w = -r4.x + 1.000000;
/*304*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*305*/	r4.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*306*/	r4.w = r4.w + r4.w;
/*307*/	r6.xyz = (r0.xyzx * -r4.wwww + r5.xyzx).xyz;
/*308*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*309*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*310*/	r4.w = cos((r8.x));
/*311*/	r4.w = inversesqrt(r4.w);
/*312*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*313*/	r5.w = saturate(r0.w * 60.000000);
/*314*/	r5.w = -r0.w + r5.w;
/*315*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*316*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*317*/	r6.w = inversesqrt(r6.w);
/*318*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*319*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*320*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*321*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*322*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*323*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*324*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*325*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*326*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*327*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*328*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*329*/	r6.w = -r0.w + 1.000000;
/*330*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*331*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*332*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*333*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*334*/	  r6.w = max(r6.w, 0.000000);
/*335*/	  r6.w = log2(r6.w);
/*336*/	  r6.w = r6.w * 10.000000;
/*337*/	  r6.w = exp2(r6.w);
/*338*/	  r6.w = r4.w * r6.w;
/*339*/	  r6.w = r6.w * r5.w + r0.w;
/*340*/	  r7.y = r3.w * 8.000000;
/*341*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*342*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*343*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*344*/	}
/*345*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*346*/	r7.y = max(r6.w, 0.000000);
/*347*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*348*/	if(floatBitsToUint(r6.w) != 0u) {
/*349*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*350*/	  r6.x = max(r6.x, -1.000000);
/*351*/	  r6.x = min(r6.x, 1.000000);
/*352*/	  r6.y = -abs(r6.x) + 1.000000;
/*353*/	  r6.y = sqrt(r6.y);
/*354*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*355*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*356*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*357*/	  r6.w = r6.y * r6.z;
/*358*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*359*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*360*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*361*/	  r6.x = r6.z * r6.y + r6.x;
/*362*/	  r4.x = r4.x * r4.x;
/*363*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*364*/	  r4.x = r4.x * r4.y + r7.x;
/*365*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*366*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*367*/	  r4.y = -r4.x * r4.x + 1.000000;
/*368*/	  r4.y = max(r4.y, 0.001000);
/*369*/	  r4.y = log2(r4.y);
/*370*/	  r6.y = r4.y * 4.950617;
/*371*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*372*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*373*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*374*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*375*/	  r4.x = floatBitsToInt(r4.x);
/*376*/	  r6.y = r4.y * r4.y + -r6.y;
/*377*/	  r6.y = sqrt(r6.y);
/*378*/	  r4.y = -r4.y + r6.y;
/*379*/	  r4.y = max(r4.y, 0.000000);
/*380*/	  r4.y = sqrt(r4.y);
/*381*/	  r4.x = r4.y * r4.x;
/*382*/	  r4.x = r4.x * 1.414214;
/*383*/	  r4.x = 0.008727 / r4.x;
/*384*/	  r4.x = max(r4.x, 0.000100);
/*385*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*386*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*387*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*388*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*389*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*390*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*391*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*392*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*393*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*394*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*395*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*396*/	  r4.x = floatBitsToInt(r4.x);
/*397*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*398*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*399*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*400*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*401*/	  r4.x = r4.x * r6.x + 1.000000;
/*402*/	  r4.x = r4.x * 0.500000;
/*403*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*404*/	  r4.y = r4.y * r6.y + 1.000000;
/*405*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*406*/	  r4.y = min(r7.y, 1.000000);
/*407*/	  r3.w = r3.w * 1.570796;
/*408*/	  r3.w = sin(r3.w);
/*409*/	  r4.y = r4.y + -1.000000;
/*410*/	  r3.w = r3.w * r4.y + 1.000000;
/*411*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*412*/	  r4.y = max(r4.y, 0.000000);
/*413*/	  r4.y = log2(r4.y);
/*414*/	  r4.y = r4.y * 10.000000;
/*415*/	  r4.y = exp2(r4.y);
/*416*/	  r4.y = r4.w * r4.y;
/*417*/	  r4.y = r4.y * r5.w + r0.w;
/*418*/	  r3.w = r3.w * abs(r4.x);
/*419*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*420*/	} else {
/*421*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*422*/	}
/*423*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*424*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*425*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*426*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*427*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*428*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*429*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*430*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*431*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*432*/	r1.xyz = (r4.zzzz * r1.xyzx + r8.xzwx).xyz;
/*433*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*434*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*435*/	r3.w = inversesqrt(r3.w);
/*436*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*437*/	r3.w = dot(vec3(-r4.xyzx), vec3(r0.xyzx));
/*438*/	r3.w = r3.w + r3.w;
/*439*/	r0.xyz = (r0.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*440*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*441*/	r0.x = dot(vec3(r0.xyzx), vec3(-r4.xyzx));
/*442*/	r0.x = max(r0.x, 0.000000);
/*443*/	r0.x = log2(r0.x);
/*444*/	r0.x = r0.x * 10.000000;
/*445*/	r0.x = exp2(r0.x);
/*446*/	r0.x = r4.w * r0.x;
/*447*/	r0.x = r0.x * r5.w + r0.w;
/*448*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*449*/	color0.xyz = (r0.xyzx * r3.xyzx + r1.xyzx).xyz;
/*450*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*451*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*452*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*453*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*454*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*455*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*456*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*457*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*458*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*459*/	if(r0.x != 0) discard;
/*460*/	color1.x = 1.000000;
/*461*/	return;
}
