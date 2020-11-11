//
//
// Shader Model 4
// Fragment Shader
//
// id: 4557 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapfiremesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*20*/	r4.w = 1.000000;
/*21*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*22*/	r5.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*23*/	r6.xyz = (r1.xyzx * r5.xyzx).xyz;
/*24*/	r3.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000)).zw;
/*25*/	r7.x = 0;
/*26*/	r7.y = cb0.data[26].x * 0.050000;
/*27*/	r7.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r7.xyxx).xy;
/*28*/	r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*29*/	r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*30*/	r2.w = saturate(r7.x * 5.000000);
/*31*/	r7.xyz = (r2.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*32*/	r2.w = dot(vec3(r6.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*33*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*34*/	r3.z = log2(r8.z);
/*35*/	r3.z = r3.z * 1.800000;
/*36*/	r3.z = exp2(r3.z);
/*37*/	r3.z = r3.z * 10.000000;
/*38*/	r3.z = min(r3.z, 1.000000);
/*39*/	r2.w = r2.w + r3.z;
/*40*/	r2.w = r2.w * 0.500000;
/*41*/	r3.z = -r8.w + 1.000000;
/*42*/	r3.z = log2(r3.z);
/*43*/	r3.z = r3.z * vsOut_T7.x;
/*44*/	r3.z = exp2(r3.z);
/*45*/	r3.z = min(r3.z, 1.000000);
/*46*/	r3.z = r3.z * vsOut_T7.x;
/*47*/	r3.w = r8.z * 0.250000;
/*48*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.wwww).xyz;
/*49*/	r7.xyz = (r2.wwww * r7.xyzx + r3.wwww).xyz;
/*50*/	r1.xyz = (-r1.xyzx * r5.xyzx + r7.xyzx).xyz;
/*51*/	r1.xyz = (r3.zzzz * r1.xyzx + r6.xyzx).xyz;
/*52*/	r2.w = vsOut_T7.x + -0.025000;
/*53*/	r2.w = max(r2.w, 0.000000);
/*54*/	r5.xyz = (r8.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r1.xyzx).xyz;
/*55*/	r1.xyz = (r2.wwww * r5.xyzx + r1.xyzx).xyz;
/*56*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*57*/	r2.w = inversesqrt(r2.w);
/*58*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*59*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*60*/	r2.w = inversesqrt(r2.w);
/*61*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*62*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*63*/	r2.w = inversesqrt(r2.w);
/*64*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*65*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*66*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*67*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*68*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*69*/	r2.w = inversesqrt(r2.w);
/*70*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*71*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*72*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*73*/	if(floatBitsToUint(r0.w) != 0u) {
/*74*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*75*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*76*/	  r0.w = r3.w * cb0.data[26].x;
/*77*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*78*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*79*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*80*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*81*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*82*/	}
/*83*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*84*/	if(floatBitsToUint(r0.w) != 0u) {
/*85*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*86*/	  if(floatBitsToUint(r0.w) != 0u) {
/*87*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*88*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*89*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*90*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*91*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*92*/	    r0.w = -r0.w + 1.000000;
/*93*/	    r0.w = max(r0.w, 0.000000);
/*94*/	    r9.z = sqrt(r0.w);
/*95*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*96*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*97*/	    r0.w = inversesqrt(r0.w);
/*98*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*99*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*100*/	    r11.y = -1.000000;
/*101*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*102*/	    r0.w = inversesqrt(r0.w);
/*103*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*104*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*105*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*106*/	    r2.w = r2.w * 1.250000;
/*107*/	    r2.w = min(r2.w, 1.000000);
/*108*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*109*/	    r3.z = r3.z * 4.000000;
/*110*/	    r2.w = r2.w * 0.200000 + r3.z;
/*111*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*112*/	    r0.w = r0.w + -r2.w;
/*113*/	    r0.w = saturate(r0.w * 200.000000);
/*114*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*115*/	    r0.w = r0.w * r0.w;
/*116*/	    r0.w = r0.w * r2.w;
/*117*/	    r3.x = r0.w * -r3.x + r3.x;
/*118*/	    r2.w = -r3.y + 0.200000;
/*119*/	    r3.y = r0.w * r2.w + r3.y;
/*120*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*121*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*122*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*123*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*124*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*125*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*126*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*127*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*128*/	    r2.w = -r2.w + 1.000000;
/*129*/	    r2.w = max(r2.w, 0.000000);
/*130*/	    r8.z = sqrt(r2.w);
/*131*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*132*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*133*/	    r2.w = sqrt(r2.w);
/*134*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*135*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*136*/	    r2.w = inversesqrt(r2.w);
/*137*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*138*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*139*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*140*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*141*/	    r2.w = -r0.y + 1.000000;
/*142*/	    r0.w = min(r0.w, r2.w);
/*143*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*144*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*145*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*146*/	    r0.w = inversesqrt(r0.w);
/*147*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*148*/	  }
/*149*/	}
/*150*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*151*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*152*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*153*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*154*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*155*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*156*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*157*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*158*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*159*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*160*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*161*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*162*/	r2.w = inversesqrt(r2.w);
/*163*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*164*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*165*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*166*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*167*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*168*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*169*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*170*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*171*/	r3.y = intBitsToFloat(int(r2.w));
/*172*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*173*/	if(floatBitsToUint(r3.z) != 0u) {
/*174*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*175*/	  r5.w = vsOut_T0.w;
/*176*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*177*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*178*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*179*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*180*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*181*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*182*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*183*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*184*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*185*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*186*/	  if(floatBitsToUint(r3.w) == 0u) {
/*187*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*188*/	    r7.xy = floor((r6.xyxx).xy);
/*189*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*190*/	    r3.z = -0.000400 / r3.z;
/*191*/	    r3.z = r3.z + r6.z;
/*192*/	    r8.z = -r8.y + 1.000000;
/*193*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*194*/	    r8.w = -r8.y;
/*195*/	    r10.x = cb1.data[0].z/**/;
/*196*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*197*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*198*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*199*/	    r10.w = -cb1.data[0].w/**/;
/*200*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*201*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*202*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*203*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*204*/	    r8.x = r9.x;
/*205*/	    r8.y = r11.x;
/*206*/	    r8.z = r10.x;
/*207*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*208*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*209*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*210*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*211*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*212*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*213*/	    r3.z = -r6.x + r6.y;
/*214*/	    r3.z = r3.w * r3.z + r6.x;
/*215*/	  } else {
/*216*/	    r3.z = 1.000000;
/*217*/	  }
/*218*/	} else {
/*219*/	  r3.z = 1.000000;
/*220*/	}
/*221*/	r3.w = cb1.data[34].w + -1.000000;
/*222*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*223*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*224*/	if(floatBitsToUint(r2.w) == 0u) {
/*225*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*226*/	  r2.w = floatBitsToInt(r2.w);
/*227*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*228*/	  if(floatBitsToUint(r2.w) != 0u) {
/*229*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*230*/	    r5.w = vsOut_T0.w;
/*231*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*232*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*233*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*234*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*235*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*236*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*237*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*238*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*239*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*240*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*241*/	    if(floatBitsToUint(r5.w) == 0u) {
/*242*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*243*/	      r6.xy = floor((r5.xyxx).xy);
/*244*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*245*/	      r2.w = -0.000400 / r2.w;
/*246*/	      r2.w = r2.w + r5.z;
/*247*/	      r7.z = -r7.y + 1.000000;
/*248*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*249*/	      r7.w = -r7.y;
/*250*/	      r9.x = cb1.data[0].z/**/;
/*251*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*252*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*253*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*254*/	      r9.w = -cb1.data[0].w/**/;
/*255*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*256*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*257*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*258*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*259*/	      r7.x = r8.x;
/*260*/	      r7.y = r10.x;
/*261*/	      r7.z = r9.x;
/*262*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*263*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*264*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*265*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*266*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*267*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*268*/	      r2.w = -r5.x + r5.z;
/*269*/	      r2.w = r5.y * r2.w + r5.x;
/*270*/	    } else {
/*271*/	      r2.w = 1.000000;
/*272*/	    }
/*273*/	  } else {
/*274*/	    r2.w = 1.000000;
/*275*/	  }
/*276*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*277*/	  r5.y = r5.x * cb1.data[34].x;
/*278*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*279*/	  r5.x = r1.w + -r5.x;
/*280*/	  r5.x = saturate(r5.x / r5.y);
/*281*/	  r2.w = -r3.z + r2.w;
/*282*/	  r3.z = r5.x * r2.w + r3.z;
/*283*/	}
/*284*/	if(floatBitsToUint(r3.w) != 0u) {
/*285*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*286*/	  r3.w = r2.w * cb1.data[34].y;
/*287*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*288*/	  r2.w = r1.w + -r2.w;
/*289*/	  r2.w = saturate(r2.w / r3.w);
/*290*/	  r3.y = -r3.z + 1.000000;
/*291*/	  r3.z = r2.w * r3.y + r3.z;
/*292*/	}
/*293*/	r3.z = saturate(r3.z);
/*294*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*295*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*296*/	r2.w = inversesqrt(r2.w);
/*297*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*298*/	r2.w = -r3.x + 1.000000;
/*299*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*300*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*301*/	r3.w = r3.w + r3.w;
/*302*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*303*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*304*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*305*/	r3.w = cos((r8.x));
/*306*/	r3.w = inversesqrt(r3.w);
/*307*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*308*/	r5.w = saturate(r0.w * 60.000000);
/*309*/	r5.w = -r0.w + r5.w;
/*310*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*311*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*312*/	r6.w = inversesqrt(r6.w);
/*313*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*314*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*315*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*316*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*317*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*318*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*319*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*320*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*321*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*322*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*323*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*324*/	r6.w = -r0.w + 1.000000;
/*325*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*326*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*327*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*328*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*329*/	  r6.w = max(r6.w, 0.000000);
/*330*/	  r6.w = log2(r6.w);
/*331*/	  r6.w = r6.w * 10.000000;
/*332*/	  r6.w = exp2(r6.w);
/*333*/	  r6.w = r3.w * r6.w;
/*334*/	  r6.w = r6.w * r5.w + r0.w;
/*335*/	  r7.y = r2.w * 8.000000;
/*336*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*337*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*338*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*339*/	}
/*340*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*341*/	r7.y = max(r6.w, 0.000000);
/*342*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*343*/	if(floatBitsToUint(r6.w) != 0u) {
/*344*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*345*/	  r6.x = max(r6.x, -1.000000);
/*346*/	  r6.x = min(r6.x, 1.000000);
/*347*/	  r6.y = -abs(r6.x) + 1.000000;
/*348*/	  r6.y = sqrt(r6.y);
/*349*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*350*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*351*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*352*/	  r6.w = r6.y * r6.z;
/*353*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*354*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*355*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*356*/	  r6.x = r6.z * r6.y + r6.x;
/*357*/	  r3.x = r3.x * r3.x;
/*358*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*359*/	  r3.x = r3.x * r3.y + r7.x;
/*360*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*361*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*362*/	  r3.y = -r3.x * r3.x + 1.000000;
/*363*/	  r3.y = max(r3.y, 0.001000);
/*364*/	  r3.y = log2(r3.y);
/*365*/	  r6.y = r3.y * 4.950617;
/*366*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*367*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*368*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*369*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*370*/	  r3.x = floatBitsToInt(r3.x);
/*371*/	  r6.y = r3.y * r3.y + -r6.y;
/*372*/	  r6.y = sqrt(r6.y);
/*373*/	  r3.y = -r3.y + r6.y;
/*374*/	  r3.y = max(r3.y, 0.000000);
/*375*/	  r3.y = sqrt(r3.y);
/*376*/	  r3.x = r3.y * r3.x;
/*377*/	  r3.x = r3.x * 1.414214;
/*378*/	  r3.x = 0.008727 / r3.x;
/*379*/	  r3.x = max(r3.x, 0.000100);
/*380*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*381*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*382*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*383*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*384*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*385*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*386*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*387*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*388*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*389*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*390*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*391*/	  r3.x = floatBitsToInt(r3.x);
/*392*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*393*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*394*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*395*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*396*/	  r3.x = r3.x * r6.x + 1.000000;
/*397*/	  r3.x = r3.x * 0.500000;
/*398*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*399*/	  r3.y = r3.y * r6.y + 1.000000;
/*400*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*401*/	  r3.y = min(r7.y, 1.000000);
/*402*/	  r2.w = r2.w * 1.570796;
/*403*/	  r2.w = sin(r2.w);
/*404*/	  r3.y = r3.y + -1.000000;
/*405*/	  r2.w = r2.w * r3.y + 1.000000;
/*406*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*407*/	  r3.y = max(r3.y, 0.000000);
/*408*/	  r3.y = log2(r3.y);
/*409*/	  r3.y = r3.y * 10.000000;
/*410*/	  r3.y = exp2(r3.y);
/*411*/	  r3.y = r3.w * r3.y;
/*412*/	  r3.y = r3.y * r5.w + r0.w;
/*413*/	  r2.w = r2.w * abs(r3.x);
/*414*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*415*/	} else {
/*416*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*417*/	}
/*418*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*419*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*420*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*421*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*422*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*423*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*424*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*425*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*426*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*427*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*428*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*429*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*430*/	r2.w = inversesqrt(r2.w);
/*431*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*432*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*433*/	r2.w = r2.w + r2.w;
/*434*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*435*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*436*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*437*/	r0.x = max(r0.x, 0.000000);
/*438*/	r0.x = log2(r0.x);
/*439*/	r0.x = r0.x * 10.000000;
/*440*/	r0.x = exp2(r0.x);
/*441*/	r0.x = r3.w * r0.x;
/*442*/	r0.x = r0.x * r5.w + r0.w;
/*443*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*444*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*445*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*446*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*447*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*448*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*449*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*450*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*451*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*452*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*453*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*454*/	if(r0.x != 0) discard;
/*455*/	color1.x = 1.000000;
/*456*/	return;
}
