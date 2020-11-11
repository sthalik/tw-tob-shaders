//
//
// Shader Model 4
// Fragment Shader
//
// id: 4783 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandardblood.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*24*/	r3.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx).xy;
/*25*/	r3.xy = (r3.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000) + vsOut_T6.yzyy).xy;
/*26*/	r3.xyzw = (texture(s_decal_blood_map, r3.xyxx.st)).xyzw;
/*27*/	r3.x = -vsOut_T7.w * 0.900000 + 1.000000;
/*28*/	r3.x = saturate(-r3.x + r3.w);
/*29*/	r3.x = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*30*/	if(floatBitsToUint(r3.x) != 0u) {
/*31*/	  r3.x = -r3.w + 1.000000;
/*32*/	  r3.x = saturate(vsOut_T7.w * 0.900000 + -r3.x);
/*33*/	  r3.x = -r3.x + 1.000000;
/*34*/	  r3.x = -r3.x * r3.x + 1.000000;
/*35*/	  r3.x = r3.x * -0.600000 + 1.000000;
/*36*/	  r3.xyz = (r3.xxxx * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*37*/	  r3.w = saturate(dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*38*/	  r3.w = uintBitsToFloat((r3.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*39*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & uint(0x3f800000u));
/*40*/	  r4.xyz = (r1.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*41*/	  r1.xyz = (r3.wwww * r4.xyzx + r3.xyzx).xyz;
/*42*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*43*/	  r4.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*44*/	} else {
/*45*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*46*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*47*/	}
/*48*/	r3.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*49*/	r3.w = inversesqrt(r3.w);
/*50*/	r5.xyz = (r3.wwww * vsOut_T3.xyzx).xyz;
/*51*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*52*/	r3.w = inversesqrt(r3.w);
/*53*/	r6.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*54*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*55*/	r3.w = inversesqrt(r3.w);
/*56*/	r7.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*57*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*58*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*59*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*60*/	r3.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*61*/	r3.w = inversesqrt(r3.w);
/*62*/	r0.xyw = (r0.xyxw * r3.wwww).xyw;
/*63*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*64*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*65*/	if(floatBitsToUint(r0.w) != 0u) {
/*66*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*67*/	  r4.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*68*/	  r0.w = r4.w * cb0.data[26].x;
/*69*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*70*/	  r4.zw = (vsOut_T1.xxxy * r4.zzzz + r8.xxxy).zw;
/*71*/	  r8.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*72*/	  r3.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*73*/	  r4.xy = (r4.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*74*/	}
/*75*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r0.w) != 0u) {
/*77*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*78*/	  if(floatBitsToUint(r0.w) != 0u) {
/*79*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*80*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*81*/	    r4.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*82*/	    r9.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*83*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*84*/	    r0.w = -r0.w + 1.000000;
/*85*/	    r0.w = max(r0.w, 0.000000);
/*86*/	    r9.z = sqrt(r0.w);
/*87*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*88*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*89*/	    r0.w = inversesqrt(r0.w);
/*90*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*91*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*92*/	    r11.y = -1.000000;
/*93*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*94*/	    r0.w = inversesqrt(r0.w);
/*95*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*96*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*97*/	    r3.w = cb3.data[1].x * cb3.data[1].x;
/*98*/	    r3.w = r3.w * 1.250000;
/*99*/	    r3.w = min(r3.w, 1.000000);
/*100*/	    r4.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*101*/	    r4.z = r4.z * 4.000000;
/*102*/	    r3.w = r3.w * 0.200000 + r4.z;
/*103*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*104*/	    r0.w = r0.w + -r3.w;
/*105*/	    r0.w = saturate(r0.w * 200.000000);
/*106*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*107*/	    r0.w = r0.w * r0.w;
/*108*/	    r0.w = r0.w * r3.w;
/*109*/	    r4.x = r0.w * -r4.x + r4.x;
/*110*/	    r3.w = -r4.y + 0.200000;
/*111*/	    r4.y = r0.w * r3.w + r4.y;
/*112*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*113*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*114*/	    r10.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*115*/	    r3.xyz = (r0.wwww * r10.xyzx + r3.xyzx).xyz;
/*116*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*117*/	    r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*118*/	    r8.xy = (r4.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*119*/	    r3.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*120*/	    r3.w = -r3.w + 1.000000;
/*121*/	    r3.w = max(r3.w, 0.000000);
/*122*/	    r8.z = sqrt(r3.w);
/*123*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*124*/	    r3.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*125*/	    r3.w = sqrt(r3.w);
/*126*/	    r8.xyz = (r9.xyzx * r3.wwww + r8.xyzx).xyz;
/*127*/	    r3.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*128*/	    r3.w = inversesqrt(r3.w);
/*129*/	    r8.xyz = (r3.wwww * r8.xyzx).xyz;
/*130*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*131*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*132*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*133*/	    r3.w = -r0.y + 1.000000;
/*134*/	    r0.w = min(r0.w, r3.w);
/*135*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*136*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*137*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*138*/	    r0.w = inversesqrt(r0.w);
/*139*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*140*/	  }
/*141*/	}
/*142*/	r0.w = vsOut_T7.y * -r4.y + r4.y;
/*143*/	r4.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*144*/	r4.yzw = (-r1.xxyz + r4.yyzw).yzw;
/*145*/	r1.xyz = saturate(vsOut_T7.yyyy * r4.yzwy + r1.xyzx).xyz;
/*146*/	r3.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*147*/	r4.yzw = (-r1.xxyz + r3.wwww).yzw;
/*148*/	r1.xyz = (vsOut_T7.zzzz * r4.yzwy + r1.xyzx).xyz;
/*149*/	r3.w = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*150*/	r4.yzw = (-r3.xxyz + r3.wwww).yzw;
/*151*/	r3.xyz = (vsOut_T7.zzzz * r4.yzwy + r3.xyzx).xyz;
/*152*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*153*/	r3.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*154*/	r3.w = inversesqrt(r3.w);
/*155*/	r0.xyz = (r0.xyzx * r3.wwww).xyz;
/*156*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*157*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*158*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*159*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*160*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*161*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*162*/	r3.w = dot(r6.xyzw, r6.xyzw);
/*163*/	r4.y = intBitsToFloat(int(r3.w));
/*164*/	r4.z = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*165*/	if(floatBitsToUint(r4.z) != 0u) {
/*166*/	  r4.z = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*167*/	  r5.w = vsOut_T0.w;
/*168*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+2u].xyzw);
/*169*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+3u].xyzw);
/*170*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+4u].xyzw);
/*171*/	  r4.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r4.z)+5u].xyzw);
/*172*/	  r6.xyz = (r6.xyzx / r4.zzzz).xyz;
/*173*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r4.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*174*/	  r4.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*175*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*176*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*177*/	  r4.w = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r6.w));
/*178*/	  if(floatBitsToUint(r4.w) == 0u) {
/*179*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*180*/	    r7.xy = floor((r6.xyxx).xy);
/*181*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*182*/	    r4.z = -0.000400 / r4.z;
/*183*/	    r4.z = r4.z + r6.z;
/*184*/	    r8.z = -r8.y + 1.000000;
/*185*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*186*/	    r8.w = -r8.y;
/*187*/	    r10.x = cb1.data[0].z/**/;
/*188*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*189*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*190*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*191*/	    r10.w = -cb1.data[0].w/**/;
/*192*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*193*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*194*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*195*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*196*/	    r8.x = r9.x;
/*197*/	    r8.y = r11.x;
/*198*/	    r8.z = r10.x;
/*199*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r4.zzzz, r8.xyzw)) * 0xffffffffu);
/*200*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*201*/	    r4.zw = (r6.xxxy + -r7.xxxy).zw;
/*202*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*203*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*204*/	    r6.xy = (r4.zzzz * r6.xyxx + r9.xzxx).xy;
/*205*/	    r4.z = -r6.x + r6.y;
/*206*/	    r4.z = r4.w * r4.z + r6.x;
/*207*/	  } else {
/*208*/	    r4.z = 1.000000;
/*209*/	  }
/*210*/	} else {
/*211*/	  r4.z = 1.000000;
/*212*/	}
/*213*/	r4.w = cb1.data[34].w + -1.000000;
/*214*/	r3.w = uintBitsToFloat((r3.w == r4.w) ? 0xffffffffu : 0x00000000u);
/*215*/	r4.w = uintBitsToFloat((floatBitsToInt(r3.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*216*/	if(floatBitsToUint(r3.w) == 0u) {
/*217*/	  r3.w = intBitsToFloat(floatBitsToInt(r4.y) + int(1));
/*218*/	  r3.w = floatBitsToInt(r3.w);
/*219*/	  r3.w = uintBitsToFloat((r3.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*220*/	  if(floatBitsToUint(r3.w) != 0u) {
/*221*/	    r3.w = intBitsToFloat(floatBitsToInt(r4.y) << int(2));
/*222*/	    r5.w = vsOut_T0.w;
/*223*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+6u].xyzw);
/*224*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+7u].xyzw);
/*225*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+8u].xyzw);
/*226*/	    r3.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.w)+9u].xyzw);
/*227*/	    r5.xyz = (r6.xyzx / r3.wwww).xyz;
/*228*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r4.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*229*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*230*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r4.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*231*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*232*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*233*/	    if(floatBitsToUint(r5.w) == 0u) {
/*234*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*235*/	      r6.xy = floor((r5.xyxx).xy);
/*236*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*237*/	      r3.w = -0.000400 / r3.w;
/*238*/	      r3.w = r3.w + r5.z;
/*239*/	      r7.z = -r7.y + 1.000000;
/*240*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*241*/	      r7.w = -r7.y;
/*242*/	      r9.x = cb1.data[0].z/**/;
/*243*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*244*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*245*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*246*/	      r9.w = -cb1.data[0].w/**/;
/*247*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*248*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*249*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*250*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*251*/	      r7.x = r8.x;
/*252*/	      r7.y = r10.x;
/*253*/	      r7.z = r9.x;
/*254*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r3.wwww, r7.xyzw)) * 0xffffffffu);
/*255*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*256*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*257*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*258*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*259*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*260*/	      r3.w = -r5.x + r5.z;
/*261*/	      r3.w = r5.y * r3.w + r5.x;
/*262*/	    } else {
/*263*/	      r3.w = 1.000000;
/*264*/	    }
/*265*/	  } else {
/*266*/	    r3.w = 1.000000;
/*267*/	  }
/*268*/	  r5.x = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*269*/	  r5.y = r5.x * cb1.data[34].x;
/*270*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*271*/	  r5.x = r1.w + -r5.x;
/*272*/	  r5.x = saturate(r5.x / r5.y);
/*273*/	  r3.w = -r4.z + r3.w;
/*274*/	  r4.z = r5.x * r3.w + r4.z;
/*275*/	}
/*276*/	if(floatBitsToUint(r4.w) != 0u) {
/*277*/	  r3.w = -cb1.data[floatBitsToUint(r4.y)+36u].x + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*278*/	  r4.w = r3.w * cb1.data[34].y;
/*279*/	  r3.w = -r3.w * cb1.data[34].y + cb1.data[floatBitsToUint(r4.y)+37u].x;
/*280*/	  r3.w = r1.w + -r3.w;
/*281*/	  r3.w = saturate(r3.w / r4.w);
/*282*/	  r4.y = -r4.z + 1.000000;
/*283*/	  r4.z = r3.w * r4.y + r4.z;
/*284*/	}
/*285*/	r4.z = saturate(r4.z);
/*286*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*287*/	r3.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*288*/	r3.w = inversesqrt(r3.w);
/*289*/	r5.xyz = (r3.wwww * r5.xyzx).xyz;
/*290*/	r3.w = -r4.x + 1.000000;
/*291*/	r4.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*292*/	r4.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*293*/	r4.w = r4.w + r4.w;
/*294*/	r6.xyz = (r0.xyzx * -r4.wwww + r5.xyzx).xyz;
/*295*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyz;
/*296*/	r8.xy = (r3.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*297*/	r4.w = cos((r8.x));
/*298*/	r4.w = inversesqrt(r4.w);
/*299*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*300*/	r5.w = saturate(r0.w * 60.000000);
/*301*/	r5.w = -r0.w + r5.w;
/*302*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*303*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*304*/	r6.w = inversesqrt(r6.w);
/*305*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*306*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*307*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*308*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*309*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*310*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*311*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*312*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*313*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*314*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*315*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*316*/	r6.w = -r0.w + 1.000000;
/*317*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*318*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*319*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*320*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*321*/	  r6.w = max(r6.w, 0.000000);
/*322*/	  r6.w = log2(r6.w);
/*323*/	  r6.w = r6.w * 10.000000;
/*324*/	  r6.w = exp2(r6.w);
/*325*/	  r6.w = r4.w * r6.w;
/*326*/	  r6.w = r6.w * r5.w + r0.w;
/*327*/	  r7.y = r3.w * 8.000000;
/*328*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*329*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*330*/	  r8.xzw = (r9.xxyz * r3.xxyz + r8.xxzw).xzw;
/*331*/	}
/*332*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*333*/	r7.y = max(r6.w, 0.000000);
/*334*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*335*/	if(floatBitsToUint(r6.w) != 0u) {
/*336*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*337*/	  r6.x = max(r6.x, -1.000000);
/*338*/	  r6.x = min(r6.x, 1.000000);
/*339*/	  r6.y = -abs(r6.x) + 1.000000;
/*340*/	  r6.y = sqrt(r6.y);
/*341*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*342*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*343*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*344*/	  r6.w = r6.y * r6.z;
/*345*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*346*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*347*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*348*/	  r6.x = r6.z * r6.y + r6.x;
/*349*/	  r4.x = r4.x * r4.x;
/*350*/	    r4.y = (floatBitsToUint(r4.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*351*/	  r4.x = r4.x * r4.y + r7.x;
/*352*/	  r4.x = r4.x * 0.500000 + 0.500000;
/*353*/	  r4.x = r4.x * 2.000000 + -1.000000;
/*354*/	  r4.y = -r4.x * r4.x + 1.000000;
/*355*/	  r4.y = max(r4.y, 0.001000);
/*356*/	  r4.y = log2(r4.y);
/*357*/	  r6.y = r4.y * 4.950617;
/*358*/	  r4.y = r4.y * 0.346574 + 4.546885;
/*359*/	  r6.z = uintBitsToFloat((0.000000 < r4.x) ? 0xffffffffu : 0x00000000u);
/*360*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*361*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*362*/	  r4.x = floatBitsToInt(r4.x);
/*363*/	  r6.y = r4.y * r4.y + -r6.y;
/*364*/	  r6.y = sqrt(r6.y);
/*365*/	  r4.y = -r4.y + r6.y;
/*366*/	  r4.y = max(r4.y, 0.000000);
/*367*/	  r4.y = sqrt(r4.y);
/*368*/	  r4.x = r4.y * r4.x;
/*369*/	  r4.x = r4.x * 1.414214;
/*370*/	  r4.x = 0.008727 / r4.x;
/*371*/	  r4.x = max(r4.x, 0.000100);
/*372*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*373*/	  r4.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).x;
/*374*/	  r4.xy = (r4.xxxx * r6.xyxx).xy;
/*375*/	  r6.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*376*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*377*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*378*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*379*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*380*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*381*/	  r4.x = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*382*/	  r4.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r4.x));
/*383*/	  r4.x = floatBitsToInt(r4.x);
/*384*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*385*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*386*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*387*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*388*/	  r4.x = r4.x * r6.x + 1.000000;
/*389*/	  r4.x = r4.x * 0.500000;
/*390*/	  r4.y = 1 + ~floatBitsToInt(r6.w);
/*391*/	  r4.y = r4.y * r6.y + 1.000000;
/*392*/	  r4.x = r4.y * 0.500000 + -r4.x;
/*393*/	  r4.y = min(r7.y, 1.000000);
/*394*/	  r3.w = r3.w * 1.570796;
/*395*/	  r3.w = sin(r3.w);
/*396*/	  r4.y = r4.y + -1.000000;
/*397*/	  r3.w = r3.w * r4.y + 1.000000;
/*398*/	  r4.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*399*/	  r4.y = max(r4.y, 0.000000);
/*400*/	  r4.y = log2(r4.y);
/*401*/	  r4.y = r4.y * 10.000000;
/*402*/	  r4.y = exp2(r4.y);
/*403*/	  r4.y = r4.w * r4.y;
/*404*/	  r4.y = r4.y * r5.w + r0.w;
/*405*/	  r3.w = r3.w * abs(r4.x);
/*406*/	  r5.xyz = (r4.yyyy * r3.wwww).xyz;
/*407*/	} else {
/*408*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*409*/	}
/*410*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*411*/	r6.xyz = (r3.xyzx * r6.xyzx).xyz;
/*412*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*413*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*414*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*415*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*416*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*417*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*418*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*419*/	r1.xyz = (r4.zzzz * r1.xyzx + r8.xzwx).xyz;
/*420*/	r4.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*421*/	r3.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*422*/	r3.w = inversesqrt(r3.w);
/*423*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*424*/	r3.w = dot(vec3(-r4.xyzx), vec3(r0.xyzx));
/*425*/	r3.w = r3.w + r3.w;
/*426*/	r0.xyz = (r0.xyzx * -r3.wwww + -r4.xyzx).xyz;
/*427*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*428*/	r0.x = dot(vec3(r0.xyzx), vec3(-r4.xyzx));
/*429*/	r0.x = max(r0.x, 0.000000);
/*430*/	r0.x = log2(r0.x);
/*431*/	r0.x = r0.x * 10.000000;
/*432*/	r0.x = exp2(r0.x);
/*433*/	r0.x = r4.w * r0.x;
/*434*/	r0.x = r0.x * r5.w + r0.w;
/*435*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*436*/	color0.xyz = (r0.xyzx * r3.xyzx + r1.xyzx).xyz;
/*437*/	r0.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*438*/	r0.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*439*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*440*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*441*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*442*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*443*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*444*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*445*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*446*/	if(r0.x != 0) discard;
/*447*/	color1.x = 1.000000;
/*448*/	return;
}
