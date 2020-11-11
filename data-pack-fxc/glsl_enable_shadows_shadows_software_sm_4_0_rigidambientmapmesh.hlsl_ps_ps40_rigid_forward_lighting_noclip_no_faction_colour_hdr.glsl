//
//
// Shader Model 4
// Fragment Shader
//
// id: 4503 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
  vec4 r12;
  vec4 r13;
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
/*24*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*25*/	r2.w = inversesqrt(r2.w);
/*26*/	r7.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*27*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*28*/	r2.w = inversesqrt(r2.w);
/*29*/	r8.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*30*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*31*/	r2.w = inversesqrt(r2.w);
/*32*/	r9.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*33*/	r10.xyz = (r0.yyyy * r8.xyzx).xyz;
/*34*/	r10.xyz = (r0.xxxx * r7.xyzx + r10.xyzx).xyz;
/*35*/	r0.xyw = (r0.wwww * r9.xyxz + r10.xyxz).xyw;
/*36*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*37*/	r2.w = inversesqrt(r2.w);
/*38*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*39*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*40*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*41*/	if(floatBitsToUint(r0.w) != 0u) {
/*42*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*43*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*44*/	  r0.w = r3.w * cb0.data[26].x;
/*45*/	  r10.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*46*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r10.xxxy).zw;
/*47*/	  r10.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*48*/	  r2.xyz = (r10.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*49*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*50*/	}
/*51*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*52*/	if(floatBitsToUint(r0.w) != 0u) {
/*53*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*54*/	  if(floatBitsToUint(r0.w) != 0u) {
/*55*/	    r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*56*/	    r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*57*/	    r3.zw = (r11.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*58*/	    r11.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*59*/	    r0.w = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*60*/	    r0.w = -r0.w + 1.000000;
/*61*/	    r0.w = max(r0.w, 0.000000);
/*62*/	    r11.z = sqrt(r0.w);
/*63*/	    r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*64*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*65*/	    r0.w = inversesqrt(r0.w);
/*66*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*67*/	    r13.xz = (cb3.data[0].xxyx).xz/**/;
/*68*/	    r13.y = -1.000000;
/*69*/	    r0.w = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*70*/	    r0.w = inversesqrt(r0.w);
/*71*/	    r13.xyz = (r0.wwww * r13.xyzx).xyz;
/*72*/	    r0.w = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*73*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*74*/	    r2.w = r2.w * 1.250000;
/*75*/	    r2.w = min(r2.w, 1.000000);
/*76*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*77*/	    r3.z = r3.z * 4.000000;
/*78*/	    r2.w = r2.w * 0.200000 + r3.z;
/*79*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*80*/	    r0.w = r0.w + -r2.w;
/*81*/	    r0.w = saturate(r0.w * 200.000000);
/*82*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*83*/	    r0.w = r0.w * r0.w;
/*84*/	    r0.w = r0.w * r2.w;
/*85*/	    r3.x = r0.w * -r3.x + r3.x;
/*86*/	    r2.w = -r3.y + 0.200000;
/*87*/	    r3.y = r0.w * r2.w + r3.y;
/*88*/	    r1.xyz = (-r1.xyzx * r5.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*89*/	    r6.xyz = (r0.wwww * r1.xyzx + r6.xyzx).xyz;
/*90*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*91*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*92*/	    r5.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*93*/	    r1.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*94*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*95*/	    r2.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*96*/	    r2.w = -r2.w + 1.000000;
/*97*/	    r2.w = max(r2.w, 0.000000);
/*98*/	    r1.z = sqrt(r2.w);
/*99*/	    r5.xyz = (r11.xyzx + r11.xyzx).xyz;
/*100*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*101*/	    r2.w = sqrt(r2.w);
/*102*/	    r1.xyz = (r5.xyzx * r2.wwww + r1.xyzx).xyz;
/*103*/	    r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*104*/	    r2.w = inversesqrt(r2.w);
/*105*/	    r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*106*/	    r5.xyz = (r8.xyzx * r1.yyyy).xyz;
/*107*/	    r5.xyz = (r1.xxxx * r7.xyzx + r5.xyzx).xyz;
/*108*/	    r1.xyz = (r1.zzzz * r9.xyzx + r5.xyzx).xyz;
/*109*/	    r2.w = -r0.y + 1.000000;
/*110*/	    r0.w = min(r0.w, r2.w);
/*111*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*112*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*113*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*114*/	    r0.w = inversesqrt(r0.w);
/*115*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*116*/	  }
/*117*/	}
/*118*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*119*/	r1.xyz = (r6.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*120*/	r1.xyz = (-r6.xyzx + r1.xyzx).xyz;
/*121*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r6.xyzx).xyz;
/*122*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*123*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*124*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*125*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*126*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*127*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*128*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*129*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*130*/	r2.w = inversesqrt(r2.w);
/*131*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*132*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*133*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*134*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*135*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*136*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*137*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*138*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*139*/	r3.y = intBitsToFloat(int(r2.w));
/*140*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*141*/	if(floatBitsToUint(r3.z) != 0u) {
/*142*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*143*/	  r5.w = vsOut_T0.w;
/*144*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*145*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*146*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*147*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*148*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*149*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*150*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*151*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*152*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*153*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*154*/	  if(floatBitsToUint(r3.w) == 0u) {
/*155*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*156*/	    r7.xy = floor((r6.xyxx).xy);
/*157*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*158*/	    r3.z = -0.000400 / r3.z;
/*159*/	    r3.z = r3.z + r6.z;
/*160*/	    r8.z = -r8.y + 1.000000;
/*161*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*162*/	    r8.w = -r8.y;
/*163*/	    r10.x = cb1.data[0].z/**/;
/*164*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*165*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*166*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*167*/	    r10.w = -cb1.data[0].w/**/;
/*168*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*169*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*170*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*171*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*172*/	    r8.x = r9.x;
/*173*/	    r8.y = r11.x;
/*174*/	    r8.z = r10.x;
/*175*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*176*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*177*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*178*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*179*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*180*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*181*/	    r3.z = -r6.x + r6.y;
/*182*/	    r3.z = r3.w * r3.z + r6.x;
/*183*/	  } else {
/*184*/	    r3.z = 1.000000;
/*185*/	  }
/*186*/	} else {
/*187*/	  r3.z = 1.000000;
/*188*/	}
/*189*/	r3.w = cb1.data[34].w + -1.000000;
/*190*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*191*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*192*/	if(floatBitsToUint(r2.w) == 0u) {
/*193*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*194*/	  r2.w = floatBitsToInt(r2.w);
/*195*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*196*/	  if(floatBitsToUint(r2.w) != 0u) {
/*197*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*198*/	    r5.w = vsOut_T0.w;
/*199*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*200*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*201*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*202*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*203*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*204*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*205*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*206*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*207*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*208*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*209*/	    if(floatBitsToUint(r5.w) == 0u) {
/*210*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*211*/	      r6.xy = floor((r5.xyxx).xy);
/*212*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*213*/	      r2.w = -0.000400 / r2.w;
/*214*/	      r2.w = r2.w + r5.z;
/*215*/	      r7.z = -r7.y + 1.000000;
/*216*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*217*/	      r7.w = -r7.y;
/*218*/	      r9.x = cb1.data[0].z/**/;
/*219*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*220*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*221*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*222*/	      r9.w = -cb1.data[0].w/**/;
/*223*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*224*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*225*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*226*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*227*/	      r7.x = r8.x;
/*228*/	      r7.y = r10.x;
/*229*/	      r7.z = r9.x;
/*230*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*231*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*232*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*233*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*234*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*235*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*236*/	      r2.w = -r5.x + r5.z;
/*237*/	      r2.w = r5.y * r2.w + r5.x;
/*238*/	    } else {
/*239*/	      r2.w = 1.000000;
/*240*/	    }
/*241*/	  } else {
/*242*/	    r2.w = 1.000000;
/*243*/	  }
/*244*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*245*/	  r5.y = r5.x * cb1.data[34].x;
/*246*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*247*/	  r5.x = r1.w + -r5.x;
/*248*/	  r5.x = saturate(r5.x / r5.y);
/*249*/	  r2.w = -r3.z + r2.w;
/*250*/	  r3.z = r5.x * r2.w + r3.z;
/*251*/	}
/*252*/	if(floatBitsToUint(r3.w) != 0u) {
/*253*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*254*/	  r3.w = r2.w * cb1.data[34].y;
/*255*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*256*/	  r2.w = r1.w + -r2.w;
/*257*/	  r2.w = saturate(r2.w / r3.w);
/*258*/	  r3.y = -r3.z + 1.000000;
/*259*/	  r3.z = r2.w * r3.y + r3.z;
/*260*/	}
/*261*/	r3.z = saturate(r3.z);
/*262*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*263*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*264*/	r2.w = inversesqrt(r2.w);
/*265*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*266*/	r2.w = -r3.x + 1.000000;
/*267*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*268*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*269*/	r3.w = r3.w + r3.w;
/*270*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*271*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*272*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*273*/	r3.w = cos((r8.x));
/*274*/	r3.w = inversesqrt(r3.w);
/*275*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*276*/	r5.w = saturate(r0.w * 60.000000);
/*277*/	r5.w = -r0.w + r5.w;
/*278*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*279*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*280*/	r6.w = inversesqrt(r6.w);
/*281*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*282*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*283*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*284*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*285*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*286*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*287*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*288*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*289*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*290*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*291*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*292*/	r6.w = -r0.w + 1.000000;
/*293*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*294*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*295*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*296*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*297*/	  r6.w = max(r6.w, 0.000000);
/*298*/	  r6.w = log2(r6.w);
/*299*/	  r6.w = r6.w * 10.000000;
/*300*/	  r6.w = exp2(r6.w);
/*301*/	  r6.w = r3.w * r6.w;
/*302*/	  r6.w = r6.w * r5.w + r0.w;
/*303*/	  r7.y = r2.w * 8.000000;
/*304*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*305*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*306*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*307*/	}
/*308*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*309*/	r7.y = max(r6.w, 0.000000);
/*310*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*311*/	if(floatBitsToUint(r6.w) != 0u) {
/*312*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*313*/	  r6.x = max(r6.x, -1.000000);
/*314*/	  r6.x = min(r6.x, 1.000000);
/*315*/	  r6.y = -abs(r6.x) + 1.000000;
/*316*/	  r6.y = sqrt(r6.y);
/*317*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*318*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*319*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*320*/	  r6.w = r6.y * r6.z;
/*321*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*322*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*323*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*324*/	  r6.x = r6.z * r6.y + r6.x;
/*325*/	  r3.x = r3.x * r3.x;
/*326*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*327*/	  r3.x = r3.x * r3.y + r7.x;
/*328*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*329*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*330*/	  r3.y = -r3.x * r3.x + 1.000000;
/*331*/	  r3.y = max(r3.y, 0.001000);
/*332*/	  r3.y = log2(r3.y);
/*333*/	  r6.y = r3.y * 4.950617;
/*334*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*335*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*336*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*337*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*338*/	  r3.x = floatBitsToInt(r3.x);
/*339*/	  r6.y = r3.y * r3.y + -r6.y;
/*340*/	  r6.y = sqrt(r6.y);
/*341*/	  r3.y = -r3.y + r6.y;
/*342*/	  r3.y = max(r3.y, 0.000000);
/*343*/	  r3.y = sqrt(r3.y);
/*344*/	  r3.x = r3.y * r3.x;
/*345*/	  r3.x = r3.x * 1.414214;
/*346*/	  r3.x = 0.008727 / r3.x;
/*347*/	  r3.x = max(r3.x, 0.000100);
/*348*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*349*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*350*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*351*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*352*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*353*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*354*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*355*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*356*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*357*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*358*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*359*/	  r3.x = floatBitsToInt(r3.x);
/*360*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*361*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*362*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*363*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*364*/	  r3.x = r3.x * r6.x + 1.000000;
/*365*/	  r3.x = r3.x * 0.500000;
/*366*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*367*/	  r3.y = r3.y * r6.y + 1.000000;
/*368*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*369*/	  r3.y = min(r7.y, 1.000000);
/*370*/	  r2.w = r2.w * 1.570796;
/*371*/	  r2.w = sin(r2.w);
/*372*/	  r3.y = r3.y + -1.000000;
/*373*/	  r2.w = r2.w * r3.y + 1.000000;
/*374*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*375*/	  r3.y = max(r3.y, 0.000000);
/*376*/	  r3.y = log2(r3.y);
/*377*/	  r3.y = r3.y * 10.000000;
/*378*/	  r3.y = exp2(r3.y);
/*379*/	  r3.y = r3.w * r3.y;
/*380*/	  r3.y = r3.y * r5.w + r0.w;
/*381*/	  r2.w = r2.w * abs(r3.x);
/*382*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*383*/	} else {
/*384*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*385*/	}
/*386*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*387*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*388*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*389*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*390*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*391*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*392*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*393*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*394*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*395*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*396*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*397*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*398*/	r2.w = inversesqrt(r2.w);
/*399*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*400*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*401*/	r2.w = r2.w + r2.w;
/*402*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*403*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*404*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*405*/	r0.x = max(r0.x, 0.000000);
/*406*/	r0.x = log2(r0.x);
/*407*/	r0.x = r0.x * 10.000000;
/*408*/	r0.x = exp2(r0.x);
/*409*/	r0.x = r3.w * r0.x;
/*410*/	r0.x = r0.x * r5.w + r0.w;
/*411*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*412*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*413*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*414*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*415*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*416*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*417*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*418*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*419*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*420*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*421*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*422*/	if(r0.x != 0) discard;
/*423*/	color1.x = 1.000000;
/*424*/	return;
}
