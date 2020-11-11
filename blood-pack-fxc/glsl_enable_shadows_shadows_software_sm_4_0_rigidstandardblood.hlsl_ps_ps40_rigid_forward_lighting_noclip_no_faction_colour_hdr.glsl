//
//
// Shader Model 4
// Fragment Shader
//
// id: 4785 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandardblood.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
uniform sampler2D s_gloss_map;
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
/*20*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*21*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*22*/	r3.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*23*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*24*/	r3.x = saturate(-r3.x + r3.w);
/*25*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*26*/	if(floatBitsToUint(r3.x) != 0u) {
/*27*/	  r3.x = -r3.w + 1.000000;
/*28*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*29*/	  r3.x = -r3.x + 1.000000;
/*30*/	  r3.x = -r3.x * r3.x + 1.000000;
/*31*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*32*/	  r3.xyz = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*33*/	  r3.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*34*/	  r3.w = uintBitsToFloat((r3.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*35*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & uint(0x3f800000u));
/*36*/	  r4.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*37*/	  r1.xyz = (r3.wwww * r4.xyzx + r3.xyzx).xyz;
/*38*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*39*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*40*/	} else {
/*41*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*42*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	}
/*44*/	r3.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*45*/	r3.w = inversesqrt(r3.w);
/*46*/	r5.xyz = (r3.wwww * vsOut_T3.xyzx).xyz;
/*47*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*48*/	r3.w = inversesqrt(r3.w);
/*49*/	r6.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*50*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*51*/	r3.w = inversesqrt(r3.w);
/*52*/	r7.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*53*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*54*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*55*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*56*/	r3.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*57*/	r3.w = inversesqrt(r3.w);
/*58*/	r0.xyw = (r0.xyxw * r3.wwww).xyw;
/*59*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*60*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*61*/	if(floatBitsToUint(r0.w) != 0u) {
/*62*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*63*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*64*/	  r0.w = r4.w * cb0.data[26].x;
/*65*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*66*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*67*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*68*/	  r3.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*69*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*70*/	}
/*71*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*72*/	if(floatBitsToUint(r0.w) != 0u) {
/*73*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*74*/	  if(floatBitsToUint(r0.w) != 0u) {
/*75*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*76*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*77*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*78*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*79*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*80*/	    r0.w = -r0.w + 1.000000;
/*81*/	    r0.w = max(r0.w, 0.000000);
/*82*/	    r9.z = sqrt(r0.w);
/*83*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*84*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*85*/	    r0.w = inversesqrt(r0.w);
/*86*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*87*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*88*/	    r11.y = -1.000000;
/*89*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*90*/	    r0.w = inversesqrt(r0.w);
/*91*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*92*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*93*/	    r3.w = cb3.data[1].x * cb3.data[1].x;
/*94*/	    r3.w = r3.w * 1.250000;
/*95*/	    r3.w = min(r3.w, 1.000000);
/*96*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*97*/	    r4.z = r4.z * 4.000000;
/*98*/	    r3.w = r3.w * 0.200000 + r4.z;
/*99*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*100*/	    r0.w = r0.w + -r3.w;
/*101*/	    r0.w = saturate(r0.w * 200.000000);
/*102*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*103*/	    r0.w = r0.w * r0.w;
/*104*/	    r0.w = r0.w * r3.w;
/*105*/	    r4.x = r0.w * -r4.x + r4.x;
/*106*/	    r3.w = -r4.y + 0.200000;
/*107*/	    r4.y = r0.w * r3.w + r4.y;
/*108*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*109*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*110*/	    r10.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*111*/	    r3.xyz = (r0.wwww * r10.xyzx + r3.xyzx).xyz;
/*112*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*113*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*114*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*115*/	    r3.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*116*/	    r3.w = -r3.w + 1.000000;
/*117*/	    r3.w = max(r3.w, 0.000000);
/*118*/	    r8.z = sqrt(r3.w);
/*119*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*120*/	    r3.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*121*/	    r3.w = sqrt(r3.w);
/*122*/	    r8.xyz = (r9.xyzx * r3.wwww + r8.xyzx).xyz;
/*123*/	    r3.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*124*/	    r3.w = inversesqrt(r3.w);
/*125*/	    r8.xyz = (r3.wwww * r8.xyzx).xyz;
/*126*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*127*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*128*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*129*/	    r3.w = -r0.y + 1.000000;
/*130*/	    r0.w = min(r0.w, r3.w);
/*131*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*132*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*133*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*134*/	    r0.w = inversesqrt(r0.w);
/*135*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*136*/	  }
/*137*/	}
/*138*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*139*/	r4.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*140*/	r4.yzw = (-r1.xxyz + r4.yyzw).yzw;
/*141*/	r1.xyz = saturate(vsOut_T7.yyyy * r4.yzwy + r1.xyzx).xyz;
/*142*/	r3.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*143*/	r4.yzw = (-r1.xxyz + r3.wwww).yzw;
/*144*/	r1.xyz = (vsOut_T7.zzzz * r4.yzwy + r1.xyzx).xyz;
/*145*/	r3.w = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*146*/	r4.yzw = (-r3.xxyz + r3.wwww).yzw;
/*147*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xyzx).xyz;
/*148*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*149*/	r3.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*150*/	r3.w = inversesqrt(r3.w);
/*151*/	r0.xyz = (r0.xyzx * r3.wwww).xyz;
/*152*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*153*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*154*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*155*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*156*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*157*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*158*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*159*/	r4.y = intBitsToFloat(int(r3.w));
/*160*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*161*/	if(floatBitsToUint(r4.z) != 0u) {
/*162*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*163*/	  r5.w = vsOut_T0.w;
/*164*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*165*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*166*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*167*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*168*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*169*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*170*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*171*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*172*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*173*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*174*/	  if(floatBitsToUint(r4.w) == 0u) {
/*175*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*176*/	    r7.xy = floor((r6.xyxx).xy);
/*177*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*178*/	    r4.z = -0.000400 / r4.z;
/*179*/	    r4.z = r4.z + r6.z;
/*180*/	    r8.z = -r8.y + 1.000000;
/*181*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*182*/	    r8.w = -r8.y;
/*183*/	    r10.x = cb1.data[0].z/**/;
/*184*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*185*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*186*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*187*/	    r10.w = -cb1.data[0].w/**/;
/*188*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*189*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*190*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*191*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*192*/	    r8.x = r9.x;
/*193*/	    r8.y = r11.x;
/*194*/	    r8.z = r10.x;
/*195*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*196*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*197*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*198*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*199*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*200*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*201*/	    r4.z = -r6.x + r6.y;
/*202*/	    r4.z = r4.w * r4.z + r6.x;
/*203*/	  } else {
/*204*/	    r4.z = 1.000000;
/*205*/	  }
/*206*/	} else {
/*207*/	  r4.z = 1.000000;
/*208*/	}
/*209*/	r4.w = cb1.data[34].w + -1.000000;
/*210*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*211*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*212*/	if(floatBitsToUint(r3.w) == 0u) {
/*213*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*214*/	  r3.w = floatBitsToInt(r3.w);
/*215*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*216*/	  if(floatBitsToUint(r3.w) != 0u) {
/*217*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*218*/	    r5.w = vsOut_T0.w;
/*219*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*220*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*221*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*222*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*223*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*224*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*225*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*226*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*227*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*228*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*229*/	    if(floatBitsToUint(r5.w) == 0u) {
/*230*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*231*/	      r6.xy = floor((r5.xyxx).xy);
/*232*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*233*/	      r3.w = -0.000400 / r3.w;
/*234*/	      r3.w = r3.w + r5.z;
/*235*/	      r7.z = -r7.y + 1.000000;
/*236*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*237*/	      r7.w = -r7.y;
/*238*/	      r9.x = cb1.data[0].z/**/;
/*239*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*240*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*241*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*242*/	      r9.w = -cb1.data[0].w/**/;
/*243*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*244*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*245*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*246*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*247*/	      r7.x = r8.x;
/*248*/	      r7.y = r10.x;
/*249*/	      r7.z = r9.x;
/*250*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*251*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*252*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*253*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*254*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*255*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*256*/	      r3.w = -r5.x + r5.z;
/*257*/	      r3.w = r5.y * r3.w + r5.x;
/*258*/	    } else {
/*259*/	      r3.w = 1.000000;
/*260*/	    }
/*261*/	  } else {
/*262*/	    r3.w = 1.000000;
/*263*/	  }
/*264*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*265*/	  r5.y = r5.x * cb1.data[34].x;
/*266*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*267*/	  r5.x = r1.w + -r5.x;
/*268*/	  r5.x = saturate(r5.x / r5.y);
/*269*/	  r3.w = -r4.z + r3.w;
/*270*/	  r4.z = r5.x * r3.w + r4.z;
/*271*/	}
/*272*/	if(floatBitsToUint(r4.w) != 0u) {
/*273*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*274*/	  r4.w = r3.w * cb1.data[34].y;
/*275*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*276*/	  r3.w = r1.w + -r3.w;
/*277*/	  r3.w = saturate(r3.w / r4.w);
/*278*/	  r4.y = -r4.z + 1.000000;
/*279*/	  r4.z = r3.w * r4.y + r4.z;
/*280*/	}
/*281*/	r4.z = saturate(r4.z);
/*282*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*283*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*284*/	r3.w = inversesqrt(r3.w);
/*285*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*286*/	r3.w = -r4.x + 1.000000;
/*287*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*288*/	r4.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*289*/	r4.w = r4.w + r4.w;
/*290*/	r6.xyz = (r0.xyzx * -r4.wwww + r5.xyzx).xyz;
/*291*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*292*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*293*/	r4.w = cos((r8.x));
/*294*/	r4.w = inversesqrt(r4.w);
/*295*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*296*/	r5.w = saturate(r0.w * 60.000000);
/*297*/	r5.w = -r0.w + r5.w;
/*298*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*299*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*300*/	r6.w = inversesqrt(r6.w);
/*301*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*302*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*303*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*304*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*305*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*306*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*307*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*308*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*309*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*310*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*311*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*312*/	r6.w = -r0.w + 1.000000;
/*313*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*314*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*315*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*316*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*317*/	  r6.w = max(r6.w, 0.000000);
/*318*/	  r6.w = log2(r6.w);
/*319*/	  r6.w = r6.w * 10.000000;
/*320*/	  r6.w = exp2(r6.w);
/*321*/	  r6.w = r4.w * r6.w;
/*322*/	  r6.w = r6.w * r5.w + r0.w;
/*323*/	  r7.y = r3.w * 8.000000;
/*324*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*325*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*326*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*327*/	}
/*328*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*329*/	r7.y = max(r6.w, 0.000000);
/*330*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*331*/	if(floatBitsToUint(r6.w) != 0u) {
/*332*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*333*/	  r6.x = max(r6.x, -1.000000);
/*334*/	  r6.x = min(r6.x, 1.000000);
/*335*/	  r6.y = -abs(r6.x) + 1.000000;
/*336*/	  r6.y = sqrt(r6.y);
/*337*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*338*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*339*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*340*/	  r6.w = r6.y * r6.z;
/*341*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*342*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*343*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*344*/	  r6.x = r6.z * r6.y + r6.x;
/*345*/	  r4.x = r4.x * r4.x;
/*346*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*347*/	  r4.x = r4.x * r4.y + r7.x;
/*348*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*349*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*350*/	  r4.y = -r4.x * r4.x + 1.000000;
/*351*/	  r4.y = max(r4.y, 0.001000);
/*352*/	  r4.y = log2(r4.y);
/*353*/	  r6.y = r4.y * 4.950617;
/*354*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*355*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*356*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*357*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*358*/	  r4.x = floatBitsToInt(r4.x);
/*359*/	  r6.y = r4.y * r4.y + -r6.y;
/*360*/	  r6.y = sqrt(r6.y);
/*361*/	  r4.y = -r4.y + r6.y;
/*362*/	  r4.y = max(r4.y, 0.000000);
/*363*/	  r4.y = sqrt(r4.y);
/*364*/	  r4.x = r4.y * r4.x;
/*365*/	  r4.x = r4.x * 1.414214;
/*366*/	  r4.x = 0.008727 / r4.x;
/*367*/	  r4.x = max(r4.x, 0.000100);
/*368*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*369*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*370*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*371*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*372*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*373*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*374*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*375*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*376*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*377*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*378*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*379*/	  r4.x = floatBitsToInt(r4.x);
/*380*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*381*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*382*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*383*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*384*/	  r4.x = r4.x * r6.x + 1.000000;
/*385*/	  r4.x = r4.x * 0.500000;
/*386*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*387*/	  r4.y = r4.y * r6.y + 1.000000;
/*388*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*389*/	  r4.y = min(r7.y, 1.000000);
/*390*/	  r3.w = r3.w * 1.570796;
/*391*/	  r3.w = sin(r3.w);
/*392*/	  r4.y = r4.y + -1.000000;
/*393*/	  r3.w = r3.w * r4.y + 1.000000;
/*394*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*395*/	  r4.y = max(r4.y, 0.000000);
/*396*/	  r4.y = log2(r4.y);
/*397*/	  r4.y = r4.y * 10.000000;
/*398*/	  r4.y = exp2(r4.y);
/*399*/	  r4.y = r4.w * r4.y;
/*400*/	  r4.y = r4.y * r5.w + r0.w;
/*401*/	  r3.w = r3.w * abs(r4.x);
/*402*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*403*/	} else {
/*404*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*405*/	}
/*406*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*407*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*408*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*409*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*410*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*411*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*412*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*413*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*414*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*415*/	r1.xyz = (r4.zzzz * r1.xyzx + r8.xzwx).xyz;
/*416*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*417*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*418*/	r3.w = inversesqrt(r3.w);
/*419*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*420*/	r3.w = dot(vec3(-r4.xyzx), vec3(r0.xyzx));
/*421*/	r3.w = r3.w + r3.w;
/*422*/	r0.xyz = (r0.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*423*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*424*/	r0.x = dot(vec3(r0.xyzx), vec3(-r4.xyzx));
/*425*/	r0.x = max(r0.x, 0.000000);
/*426*/	r0.x = log2(r0.x);
/*427*/	r0.x = r0.x * 10.000000;
/*428*/	r0.x = exp2(r0.x);
/*429*/	r0.x = r4.w * r0.x;
/*430*/	r0.x = r0.x * r5.w + r0.w;
/*431*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*432*/	color0.xyz = (r0.xyzx * r3.xyzx + r1.xyzx).xyz;
/*433*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*434*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*435*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*436*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*437*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*438*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*439*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*440*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*441*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*442*/	if(r0.x != 0) discard;
/*443*/	color1.x = 1.000000;
/*444*/	return;
}
