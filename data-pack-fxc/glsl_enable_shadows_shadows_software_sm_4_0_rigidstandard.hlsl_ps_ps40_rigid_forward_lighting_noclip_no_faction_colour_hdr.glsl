//
//
// Shader Model 4
// Fragment Shader
//
// id: 4681 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidstandard.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*22*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*23*/	r2.w = inversesqrt(r2.w);
/*24*/	r5.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*25*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*26*/	r2.w = inversesqrt(r2.w);
/*27*/	r6.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*28*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*29*/	r2.w = inversesqrt(r2.w);
/*30*/	r7.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*31*/	r8.xyz = (r0.yyyy * r6.xyzx).xyz;
/*32*/	r8.xyz = (r0.xxxx * r5.xyzx + r8.xyzx).xyz;
/*33*/	r0.xyw = (r0.wwww * r7.xyxz + r8.xyxz).xyw;
/*34*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*35*/	r2.w = inversesqrt(r2.w);
/*36*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*37*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*38*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*39*/	if(floatBitsToUint(r0.w) != 0u) {
/*40*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*41*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*42*/	  r0.w = r3.w * cb0.data[26].x;
/*43*/	  r8.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*44*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r8.xxxy).zw;
/*45*/	  r8.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*46*/	  r2.xyz = (r8.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*47*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*48*/	}
/*49*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*50*/	if(floatBitsToUint(r0.w) != 0u) {
/*51*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*52*/	  if(floatBitsToUint(r0.w) != 0u) {
/*53*/	    r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*54*/	    r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*55*/	    r3.zw = (r9.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*56*/	    r9.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*57*/	    r0.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*58*/	    r0.w = -r0.w + 1.000000;
/*59*/	    r0.w = max(r0.w, 0.000000);
/*60*/	    r9.z = sqrt(r0.w);
/*61*/	    r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*62*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*63*/	    r0.w = inversesqrt(r0.w);
/*64*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*65*/	    r11.xz = (cb3.data[0].xxyx).xz/**/;
/*66*/	    r11.y = -1.000000;
/*67*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*68*/	    r0.w = inversesqrt(r0.w);
/*69*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*70*/	    r0.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*71*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*72*/	    r2.w = r2.w * 1.250000;
/*73*/	    r2.w = min(r2.w, 1.000000);
/*74*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*75*/	    r3.z = r3.z * 4.000000;
/*76*/	    r2.w = r2.w * 0.200000 + r3.z;
/*77*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*78*/	    r0.w = r0.w + -r2.w;
/*79*/	    r0.w = saturate(r0.w * 200.000000);
/*80*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*81*/	    r0.w = r0.w * r0.w;
/*82*/	    r0.w = r0.w * r2.w;
/*83*/	    r3.x = r0.w * -r3.x + r3.x;
/*84*/	    r2.w = -r3.y + 0.200000;
/*85*/	    r3.y = r0.w * r2.w + r3.y;
/*86*/	    r10.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*87*/	    r1.xyz = (r0.wwww * r10.xyzx + r1.xyzx).xyz;
/*88*/	    r10.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*89*/	    r2.xyz = (r0.wwww * r10.xyzx + r2.xyzx).xyz;
/*90*/	    r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*91*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*92*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*93*/	    r2.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*94*/	    r2.w = -r2.w + 1.000000;
/*95*/	    r2.w = max(r2.w, 0.000000);
/*96*/	    r8.z = sqrt(r2.w);
/*97*/	    r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*98*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*99*/	    r2.w = sqrt(r2.w);
/*100*/	    r8.xyz = (r9.xyzx * r2.wwww + r8.xyzx).xyz;
/*101*/	    r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*102*/	    r2.w = inversesqrt(r2.w);
/*103*/	    r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*104*/	    r6.xyz = (r6.xyzx * r8.yyyy).xyz;
/*105*/	    r5.xyz = (r8.xxxx * r5.xyzx + r6.xyzx).xyz;
/*106*/	    r5.xyz = (r8.zzzz * r7.xyzx + r5.xyzx).xyz;
/*107*/	    r2.w = -r0.y + 1.000000;
/*108*/	    r0.w = min(r0.w, r2.w);
/*109*/	    r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*110*/	    r5.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*111*/	    r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*112*/	    r0.w = inversesqrt(r0.w);
/*113*/	    r0.xyz = (r0.wwww * r5.xyzx).xyz;
/*114*/	  }
/*115*/	}
/*116*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*117*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*118*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*119*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*120*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*121*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*122*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*123*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*124*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*125*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*126*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*127*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*128*/	r2.w = inversesqrt(r2.w);
/*129*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*130*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*131*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*132*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*133*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*134*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*135*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*136*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*137*/	r3.y = intBitsToFloat(int(r2.w));
/*138*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*139*/	if(floatBitsToUint(r3.z) != 0u) {
/*140*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*141*/	  r5.w = vsOut_T0.w;
/*142*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*143*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*144*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*145*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*146*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*147*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*148*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*149*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*150*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*151*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*152*/	  if(floatBitsToUint(r3.w) == 0u) {
/*153*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*154*/	    r7.xy = floor((r6.xyxx).xy);
/*155*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*156*/	    r3.z = -0.000400 / r3.z;
/*157*/	    r3.z = r3.z + r6.z;
/*158*/	    r8.z = -r8.y + 1.000000;
/*159*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*160*/	    r8.w = -r8.y;
/*161*/	    r10.x = cb1.data[0].z/**/;
/*162*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*163*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*164*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*165*/	    r10.w = -cb1.data[0].w/**/;
/*166*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*167*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*168*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*169*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*170*/	    r8.x = r9.x;
/*171*/	    r8.y = r11.x;
/*172*/	    r8.z = r10.x;
/*173*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*174*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*175*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*176*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*177*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*178*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*179*/	    r3.z = -r6.x + r6.y;
/*180*/	    r3.z = r3.w * r3.z + r6.x;
/*181*/	  } else {
/*182*/	    r3.z = 1.000000;
/*183*/	  }
/*184*/	} else {
/*185*/	  r3.z = 1.000000;
/*186*/	}
/*187*/	r3.w = cb1.data[34].w + -1.000000;
/*188*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*189*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*190*/	if(floatBitsToUint(r2.w) == 0u) {
/*191*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*192*/	  r2.w = floatBitsToInt(r2.w);
/*193*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*194*/	  if(floatBitsToUint(r2.w) != 0u) {
/*195*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*196*/	    r5.w = vsOut_T0.w;
/*197*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*198*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*199*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*200*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*201*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*202*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*203*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*204*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*205*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*206*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*207*/	    if(floatBitsToUint(r5.w) == 0u) {
/*208*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*209*/	      r6.xy = floor((r5.xyxx).xy);
/*210*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*211*/	      r2.w = -0.000400 / r2.w;
/*212*/	      r2.w = r2.w + r5.z;
/*213*/	      r7.z = -r7.y + 1.000000;
/*214*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*215*/	      r7.w = -r7.y;
/*216*/	      r9.x = cb1.data[0].z/**/;
/*217*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*218*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*219*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*220*/	      r9.w = -cb1.data[0].w/**/;
/*221*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*222*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*223*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*224*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*225*/	      r7.x = r8.x;
/*226*/	      r7.y = r10.x;
/*227*/	      r7.z = r9.x;
/*228*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*229*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*230*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*231*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*232*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*233*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*234*/	      r2.w = -r5.x + r5.z;
/*235*/	      r2.w = r5.y * r2.w + r5.x;
/*236*/	    } else {
/*237*/	      r2.w = 1.000000;
/*238*/	    }
/*239*/	  } else {
/*240*/	    r2.w = 1.000000;
/*241*/	  }
/*242*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*243*/	  r5.y = r5.x * cb1.data[34].x;
/*244*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*245*/	  r5.x = r1.w + -r5.x;
/*246*/	  r5.x = saturate(r5.x / r5.y);
/*247*/	  r2.w = -r3.z + r2.w;
/*248*/	  r3.z = r5.x * r2.w + r3.z;
/*249*/	}
/*250*/	if(floatBitsToUint(r3.w) != 0u) {
/*251*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*252*/	  r3.w = r2.w * cb1.data[34].y;
/*253*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*254*/	  r2.w = r1.w + -r2.w;
/*255*/	  r2.w = saturate(r2.w / r3.w);
/*256*/	  r3.y = -r3.z + 1.000000;
/*257*/	  r3.z = r2.w * r3.y + r3.z;
/*258*/	}
/*259*/	r3.z = saturate(r3.z);
/*260*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*261*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*262*/	r2.w = inversesqrt(r2.w);
/*263*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*264*/	r2.w = -r3.x + 1.000000;
/*265*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*266*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*267*/	r3.w = r3.w + r3.w;
/*268*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*269*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*270*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*271*/	r3.w = cos((r8.x));
/*272*/	r3.w = inversesqrt(r3.w);
/*273*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*274*/	r5.w = saturate(r0.w * 60.000000);
/*275*/	r5.w = -r0.w + r5.w;
/*276*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*277*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*278*/	r6.w = inversesqrt(r6.w);
/*279*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*280*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*281*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*282*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*283*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*284*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*285*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*286*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*287*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*288*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*289*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*290*/	r6.w = -r0.w + 1.000000;
/*291*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*292*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*293*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*294*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*295*/	  r6.w = max(r6.w, 0.000000);
/*296*/	  r6.w = log2(r6.w);
/*297*/	  r6.w = r6.w * 10.000000;
/*298*/	  r6.w = exp2(r6.w);
/*299*/	  r6.w = r3.w * r6.w;
/*300*/	  r6.w = r6.w * r5.w + r0.w;
/*301*/	  r7.y = r2.w * 8.000000;
/*302*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*303*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*304*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*305*/	}
/*306*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*307*/	r7.y = max(r6.w, 0.000000);
/*308*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*309*/	if(floatBitsToUint(r6.w) != 0u) {
/*310*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*311*/	  r6.x = max(r6.x, -1.000000);
/*312*/	  r6.x = min(r6.x, 1.000000);
/*313*/	  r6.y = -abs(r6.x) + 1.000000;
/*314*/	  r6.y = sqrt(r6.y);
/*315*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*316*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*317*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*318*/	  r6.w = r6.y * r6.z;
/*319*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*320*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*321*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*322*/	  r6.x = r6.z * r6.y + r6.x;
/*323*/	  r3.x = r3.x * r3.x;
/*324*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*325*/	  r3.x = r3.x * r3.y + r7.x;
/*326*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*327*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*328*/	  r3.y = -r3.x * r3.x + 1.000000;
/*329*/	  r3.y = max(r3.y, 0.001000);
/*330*/	  r3.y = log2(r3.y);
/*331*/	  r6.y = r3.y * 4.950617;
/*332*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*333*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*334*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*335*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*336*/	  r3.x = floatBitsToInt(r3.x);
/*337*/	  r6.y = r3.y * r3.y + -r6.y;
/*338*/	  r6.y = sqrt(r6.y);
/*339*/	  r3.y = -r3.y + r6.y;
/*340*/	  r3.y = max(r3.y, 0.000000);
/*341*/	  r3.y = sqrt(r3.y);
/*342*/	  r3.x = r3.y * r3.x;
/*343*/	  r3.x = r3.x * 1.414214;
/*344*/	  r3.x = 0.008727 / r3.x;
/*345*/	  r3.x = max(r3.x, 0.000100);
/*346*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*347*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*348*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*349*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*350*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*351*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*352*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*353*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*354*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*355*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*356*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*357*/	  r3.x = floatBitsToInt(r3.x);
/*358*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*359*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*360*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*361*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*362*/	  r3.x = r3.x * r6.x + 1.000000;
/*363*/	  r3.x = r3.x * 0.500000;
/*364*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*365*/	  r3.y = r3.y * r6.y + 1.000000;
/*366*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*367*/	  r3.y = min(r7.y, 1.000000);
/*368*/	  r2.w = r2.w * 1.570796;
/*369*/	  r2.w = sin(r2.w);
/*370*/	  r3.y = r3.y + -1.000000;
/*371*/	  r2.w = r2.w * r3.y + 1.000000;
/*372*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*373*/	  r3.y = max(r3.y, 0.000000);
/*374*/	  r3.y = log2(r3.y);
/*375*/	  r3.y = r3.y * 10.000000;
/*376*/	  r3.y = exp2(r3.y);
/*377*/	  r3.y = r3.w * r3.y;
/*378*/	  r3.y = r3.y * r5.w + r0.w;
/*379*/	  r2.w = r2.w * abs(r3.x);
/*380*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*381*/	} else {
/*382*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*383*/	}
/*384*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*385*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*386*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*387*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*388*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*389*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*390*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*391*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*392*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*393*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*394*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*395*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*396*/	r2.w = inversesqrt(r2.w);
/*397*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*398*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*399*/	r2.w = r2.w + r2.w;
/*400*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*401*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*402*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*403*/	r0.x = max(r0.x, 0.000000);
/*404*/	r0.x = log2(r0.x);
/*405*/	r0.x = r0.x * 10.000000;
/*406*/	r0.x = exp2(r0.x);
/*407*/	r0.x = r3.w * r0.x;
/*408*/	r0.x = r0.x * r5.w + r0.w;
/*409*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*410*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*411*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*412*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*413*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*414*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*415*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*416*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*417*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*418*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*419*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*420*/	if(r0.x != 0) discard;
/*421*/	color1.x = 1.000000;
/*422*/	return;
}
