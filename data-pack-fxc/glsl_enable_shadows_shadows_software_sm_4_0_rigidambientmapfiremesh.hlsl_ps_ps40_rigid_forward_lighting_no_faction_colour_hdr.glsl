//
//
// Shader Model 4
// Fragment Shader
//
// id: 4555 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*24*/	r4.w = 1.000000;
/*25*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*26*/	r5.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*27*/	r6.xyz = (r1.xyzx * r5.xyzx).xyz;
/*28*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*29*/	r7.x = 0;
/*30*/	r7.y = cb0.data[26].x * 0.050000;
/*31*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*32*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*33*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*34*/	r2.w = saturate(r7.x * 5.000000);
/*35*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*36*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*37*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*38*/	r3.z = log2(r8.z);
/*39*/	r3.z = r3.z * 1.800000;
/*40*/	r3.z = exp2(r3.z);
/*41*/	r3.z = r3.z * 10.000000;
/*42*/	r3.z = min(r3.z, 1.000000);
/*43*/	r2.w = r2.w + r3.z;
/*44*/	r2.w = r2.w * 0.500000;
/*45*/	r3.z = -r8.w + 1.000000;
/*46*/	r3.z = log2(r3.z);
/*47*/	r3.z = r3.z * vsOut_T7.x;
/*48*/	r3.z = exp2(r3.z);
/*49*/	r3.z = min(r3.z, 1.000000);
/*50*/	r3.z = r3.z * vsOut_T7.x;
/*51*/	r3.w = r8.z * 0.250000;
/*52*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*53*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*54*/	r1.xyz = (-r1.xyzx * r5.xyzx + r7.xyzx).xyz;
/*55*/	r1.xyz = (r3.zzzz * r1.xyzx + r6.xyzx).xyz;
/*56*/	r2.w = vsOut_T7.x + -0.025000;
/*57*/	r2.w = max(r2.w, 0.000000);
/*58*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*59*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*60*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*61*/	r2.w = inversesqrt(r2.w);
/*62*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*63*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*64*/	r2.w = inversesqrt(r2.w);
/*65*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*66*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r2.w = inversesqrt(r2.w);
/*68*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*70*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*71*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*72*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*73*/	r2.w = inversesqrt(r2.w);
/*74*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*75*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*76*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*77*/	if(floatBitsToUint(r0.w) != 0u) {
/*78*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*79*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*80*/	  r0.w = r3.w * cb0.data[26].x;
/*81*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*82*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*83*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*84*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*85*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*86*/	}
/*87*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*88*/	if(floatBitsToUint(r0.w) != 0u) {
/*89*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*90*/	  if(floatBitsToUint(r0.w) != 0u) {
/*91*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*92*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*93*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*94*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*95*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*96*/	    r0.w = -r0.w + 1.000000;
/*97*/	    r0.w = max(r0.w, 0.000000);
/*98*/	    r9.z = sqrt(r0.w);
/*99*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*100*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*101*/	    r0.w = inversesqrt(r0.w);
/*102*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*103*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*104*/	    r11.y = -1.000000;
/*105*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*106*/	    r0.w = inversesqrt(r0.w);
/*107*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*108*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*109*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*110*/	    r2.w = r2.w * 1.250000;
/*111*/	    r2.w = min(r2.w, 1.000000);
/*112*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*113*/	    r3.z = r3.z * 4.000000;
/*114*/	    r2.w = r2.w * 0.200000 + r3.z;
/*115*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*116*/	    r0.w = r0.w + -r2.w;
/*117*/	    r0.w = saturate(r0.w * 200.000000);
/*118*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*119*/	    r0.w = r0.w * r0.w;
/*120*/	    r0.w = r0.w * r2.w;
/*121*/	    r3.x = r0.w * -r3.x + r3.x;
/*122*/	    r2.w = -r3.y + 0.200000;
/*123*/	    r3.y = r0.w * r2.w + r3.y;
/*124*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*125*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*126*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*127*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*128*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*129*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*130*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*131*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*132*/	    r2.w = -r2.w + 1.000000;
/*133*/	    r2.w = max(r2.w, 0.000000);
/*134*/	    r8.z = sqrt(r2.w);
/*135*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*136*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*137*/	    r2.w = sqrt(r2.w);
/*138*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*139*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*140*/	    r2.w = inversesqrt(r2.w);
/*141*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*142*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*143*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*144*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*145*/	    r2.w = -r0.y + 1.000000;
/*146*/	    r0.w = min(r0.w, r2.w);
/*147*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*148*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*149*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*150*/	    r0.w = inversesqrt(r0.w);
/*151*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*152*/	  }
/*153*/	}
/*154*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*155*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*156*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*157*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*158*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*159*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*160*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*161*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*162*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*163*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*164*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*165*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*166*/	r2.w = inversesqrt(r2.w);
/*167*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*168*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*169*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*170*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*171*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*172*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*173*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*174*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*175*/	r3.y = intBitsToFloat(int(r2.w));
/*176*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*177*/	if(floatBitsToUint(r3.z) != 0u) {
/*178*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*179*/	  r5.w = vsOut_T0.w;
/*180*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*181*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*182*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*183*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*184*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*185*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*186*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*187*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*188*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*189*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*190*/	  if(floatBitsToUint(r3.w) == 0u) {
/*191*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*192*/	    r7.xy = floor((r6.xyxx).xy);
/*193*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*194*/	    r3.z = -0.000400 / r3.z;
/*195*/	    r3.z = r3.z + r6.z;
/*196*/	    r8.z = -r8.y + 1.000000;
/*197*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*198*/	    r8.w = -r8.y;
/*199*/	    r10.x = cb1.data[0].z/**/;
/*200*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*201*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*202*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*203*/	    r10.w = -cb1.data[0].w/**/;
/*204*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*205*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*206*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*207*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*208*/	    r8.x = r9.x;
/*209*/	    r8.y = r11.x;
/*210*/	    r8.z = r10.x;
/*211*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*212*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*213*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*214*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*215*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*216*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*217*/	    r3.z = -r6.x + r6.y;
/*218*/	    r3.z = r3.w * r3.z + r6.x;
/*219*/	  } else {
/*220*/	    r3.z = 1.000000;
/*221*/	  }
/*222*/	} else {
/*223*/	  r3.z = 1.000000;
/*224*/	}
/*225*/	r3.w = cb1.data[34].w + -1.000000;
/*226*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*227*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*228*/	if(floatBitsToUint(r2.w) == 0u) {
/*229*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*230*/	  r2.w = floatBitsToInt(r2.w);
/*231*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*232*/	  if(floatBitsToUint(r2.w) != 0u) {
/*233*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*234*/	    r5.w = vsOut_T0.w;
/*235*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*236*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*237*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*238*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*239*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*240*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*241*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*242*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*243*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*244*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*245*/	    if(floatBitsToUint(r5.w) == 0u) {
/*246*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*247*/	      r6.xy = floor((r5.xyxx).xy);
/*248*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*249*/	      r2.w = -0.000400 / r2.w;
/*250*/	      r2.w = r2.w + r5.z;
/*251*/	      r7.z = -r7.y + 1.000000;
/*252*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*253*/	      r7.w = -r7.y;
/*254*/	      r9.x = cb1.data[0].z/**/;
/*255*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*256*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*257*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*258*/	      r9.w = -cb1.data[0].w/**/;
/*259*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*260*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*261*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*262*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*263*/	      r7.x = r8.x;
/*264*/	      r7.y = r10.x;
/*265*/	      r7.z = r9.x;
/*266*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*267*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*268*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*269*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*270*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*271*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*272*/	      r2.w = -r5.x + r5.z;
/*273*/	      r2.w = r5.y * r2.w + r5.x;
/*274*/	    } else {
/*275*/	      r2.w = 1.000000;
/*276*/	    }
/*277*/	  } else {
/*278*/	    r2.w = 1.000000;
/*279*/	  }
/*280*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*281*/	  r5.y = r5.x * cb1.data[34].x;
/*282*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*283*/	  r5.x = r1.w + -r5.x;
/*284*/	  r5.x = saturate(r5.x / r5.y);
/*285*/	  r2.w = -r3.z + r2.w;
/*286*/	  r3.z = r5.x * r2.w + r3.z;
/*287*/	}
/*288*/	if(floatBitsToUint(r3.w) != 0u) {
/*289*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*290*/	  r3.w = r2.w * cb1.data[34].y;
/*291*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*292*/	  r2.w = r1.w + -r2.w;
/*293*/	  r2.w = saturate(r2.w / r3.w);
/*294*/	  r3.y = -r3.z + 1.000000;
/*295*/	  r3.z = r2.w * r3.y + r3.z;
/*296*/	}
/*297*/	r3.z = saturate(r3.z);
/*298*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*299*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*300*/	r2.w = inversesqrt(r2.w);
/*301*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*302*/	r2.w = -r3.x + 1.000000;
/*303*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*304*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*305*/	r3.w = r3.w + r3.w;
/*306*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*307*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*308*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*309*/	r3.w = cos((r8.x));
/*310*/	r3.w = inversesqrt(r3.w);
/*311*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*312*/	r5.w = saturate(r0.w * 60.000000);
/*313*/	r5.w = -r0.w + r5.w;
/*314*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*315*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*316*/	r6.w = inversesqrt(r6.w);
/*317*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*318*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*319*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*320*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*321*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*322*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*323*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*324*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*325*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*326*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*327*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*328*/	r6.w = -r0.w + 1.000000;
/*329*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*330*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*331*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*332*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*333*/	  r6.w = max(r6.w, 0.000000);
/*334*/	  r6.w = log2(r6.w);
/*335*/	  r6.w = r6.w * 10.000000;
/*336*/	  r6.w = exp2(r6.w);
/*337*/	  r6.w = r3.w * r6.w;
/*338*/	  r6.w = r6.w * r5.w + r0.w;
/*339*/	  r7.y = r2.w * 8.000000;
/*340*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*341*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*342*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*343*/	}
/*344*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*345*/	r7.y = max(r6.w, 0.000000);
/*346*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*347*/	if(floatBitsToUint(r6.w) != 0u) {
/*348*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*349*/	  r6.x = max(r6.x, -1.000000);
/*350*/	  r6.x = min(r6.x, 1.000000);
/*351*/	  r6.y = -abs(r6.x) + 1.000000;
/*352*/	  r6.y = sqrt(r6.y);
/*353*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*354*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*355*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*356*/	  r6.w = r6.y * r6.z;
/*357*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*358*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*359*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*360*/	  r6.x = r6.z * r6.y + r6.x;
/*361*/	  r3.x = r3.x * r3.x;
/*362*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*363*/	  r3.x = r3.x * r3.y + r7.x;
/*364*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*365*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*366*/	  r3.y = -r3.x * r3.x + 1.000000;
/*367*/	  r3.y = max(r3.y, 0.001000);
/*368*/	  r3.y = log2(r3.y);
/*369*/	  r6.y = r3.y * 4.950617;
/*370*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*371*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*372*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*373*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*374*/	  r3.x = floatBitsToInt(r3.x);
/*375*/	  r6.y = r3.y * r3.y + -r6.y;
/*376*/	  r6.y = sqrt(r6.y);
/*377*/	  r3.y = -r3.y + r6.y;
/*378*/	  r3.y = max(r3.y, 0.000000);
/*379*/	  r3.y = sqrt(r3.y);
/*380*/	  r3.x = r3.y * r3.x;
/*381*/	  r3.x = r3.x * 1.414214;
/*382*/	  r3.x = 0.008727 / r3.x;
/*383*/	  r3.x = max(r3.x, 0.000100);
/*384*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*385*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*386*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*387*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*388*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*389*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*390*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*391*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*392*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*393*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*394*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*395*/	  r3.x = floatBitsToInt(r3.x);
/*396*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*397*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*398*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*399*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*400*/	  r3.x = r3.x * r6.x + 1.000000;
/*401*/	  r3.x = r3.x * 0.500000;
/*402*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*403*/	  r3.y = r3.y * r6.y + 1.000000;
/*404*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*405*/	  r3.y = min(r7.y, 1.000000);
/*406*/	  r2.w = r2.w * 1.570796;
/*407*/	  r2.w = sin(r2.w);
/*408*/	  r3.y = r3.y + -1.000000;
/*409*/	  r2.w = r2.w * r3.y + 1.000000;
/*410*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*411*/	  r3.y = max(r3.y, 0.000000);
/*412*/	  r3.y = log2(r3.y);
/*413*/	  r3.y = r3.y * 10.000000;
/*414*/	  r3.y = exp2(r3.y);
/*415*/	  r3.y = r3.w * r3.y;
/*416*/	  r3.y = r3.y * r5.w + r0.w;
/*417*/	  r2.w = r2.w * abs(r3.x);
/*418*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*419*/	} else {
/*420*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*421*/	}
/*422*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*423*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*424*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*425*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*426*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*427*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*428*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*429*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*430*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*431*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*432*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*433*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*434*/	r2.w = inversesqrt(r2.w);
/*435*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*436*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*437*/	r2.w = r2.w + r2.w;
/*438*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*439*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*440*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*441*/	r0.x = max(r0.x, 0.000000);
/*442*/	r0.x = log2(r0.x);
/*443*/	r0.x = r0.x * 10.000000;
/*444*/	r0.x = exp2(r0.x);
/*445*/	r0.x = r3.w * r0.x;
/*446*/	r0.x = r0.x * r5.w + r0.w;
/*447*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*448*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*449*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*450*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*451*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*452*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*453*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*454*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*455*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*456*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*457*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*458*/	if(r0.x != 0) discard;
/*459*/	color1.x = 1.000000;
/*460*/	return;
}
