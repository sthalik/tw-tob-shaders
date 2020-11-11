//
//
// Shader Model 4
// Fragment Shader
//
// id: 4500 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
/*28*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*29*/	r2.w = inversesqrt(r2.w);
/*30*/	r7.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*31*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*32*/	r2.w = inversesqrt(r2.w);
/*33*/	r8.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*34*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*35*/	r2.w = inversesqrt(r2.w);
/*36*/	r9.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*37*/	r10.xyz = (r0.yyyy * r8.xyzx).xyz;
/*38*/	r10.xyz = (r0.xxxx * r7.xyzx + r10.xyzx).xyz;
/*39*/	r0.xyw = (r0.wwww * r9.xyxz + r10.xyxz).xyw;
/*40*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*41*/	r2.w = inversesqrt(r2.w);
/*42*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*43*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*44*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*45*/	if(floatBitsToUint(r0.w) != 0u) {
/*46*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*47*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*48*/	  r0.w = r3.w * cb0.data[26].x;
/*49*/	  r10.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*50*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r10.xxxy).zw;
/*51*/	  r10.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*52*/	  r2.xyz = (r10.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*53*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*54*/	}
/*55*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*56*/	if(floatBitsToUint(r0.w) != 0u) {
/*57*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*58*/	  if(floatBitsToUint(r0.w) != 0u) {
/*59*/	    r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*60*/	    r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*61*/	    r3.zw = (r11.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*62*/	    r11.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*63*/	    r0.w = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*64*/	    r0.w = -r0.w + 1.000000;
/*65*/	    r0.w = max(r0.w, 0.000000);
/*66*/	    r11.z = sqrt(r0.w);
/*67*/	    r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*68*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*69*/	    r0.w = inversesqrt(r0.w);
/*70*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*71*/	    r13.xz = (cb3.data[0].xxyx).xz/**/;
/*72*/	    r13.y = -1.000000;
/*73*/	    r0.w = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*74*/	    r0.w = inversesqrt(r0.w);
/*75*/	    r13.xyz = (r0.wwww * r13.xyzx).xyz;
/*76*/	    r0.w = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*77*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*78*/	    r2.w = r2.w * 1.250000;
/*79*/	    r2.w = min(r2.w, 1.000000);
/*80*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*81*/	    r3.z = r3.z * 4.000000;
/*82*/	    r2.w = r2.w * 0.200000 + r3.z;
/*83*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*84*/	    r0.w = r0.w + -r2.w;
/*85*/	    r0.w = saturate(r0.w * 200.000000);
/*86*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*87*/	    r0.w = r0.w * r0.w;
/*88*/	    r0.w = r0.w * r2.w;
/*89*/	    r3.x = r0.w * -r3.x + r3.x;
/*90*/	    r2.w = -r3.y + 0.200000;
/*91*/	    r3.y = r0.w * r2.w + r3.y;
/*92*/	    r1.xyz = (-r1.xyzx * r5.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*93*/	    r6.xyz = (r0.wwww * r1.xyzx + r6.xyzx).xyz;
/*94*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*95*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*96*/	    r5.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*97*/	    r1.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*98*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*99*/	    r2.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*100*/	    r2.w = -r2.w + 1.000000;
/*101*/	    r2.w = max(r2.w, 0.000000);
/*102*/	    r1.z = sqrt(r2.w);
/*103*/	    r5.xyz = (r11.xyzx + r11.xyzx).xyz;
/*104*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*105*/	    r2.w = sqrt(r2.w);
/*106*/	    r1.xyz = (r5.xyzx * r2.wwww + r1.xyzx).xyz;
/*107*/	    r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*108*/	    r2.w = inversesqrt(r2.w);
/*109*/	    r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*110*/	    r5.xyz = (r8.xyzx * r1.yyyy).xyz;
/*111*/	    r5.xyz = (r1.xxxx * r7.xyzx + r5.xyzx).xyz;
/*112*/	    r1.xyz = (r1.zzzz * r9.xyzx + r5.xyzx).xyz;
/*113*/	    r2.w = -r0.y + 1.000000;
/*114*/	    r0.w = min(r0.w, r2.w);
/*115*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*116*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*117*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*118*/	    r0.w = inversesqrt(r0.w);
/*119*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*120*/	  }
/*121*/	}
/*122*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*123*/	r1.xyz = (r6.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*124*/	r1.xyz = (-r6.xyzx + r1.xyzx).xyz;
/*125*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r6.xyzx).xyz;
/*126*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*127*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*128*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*129*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*131*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*132*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*133*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*134*/	r2.w = inversesqrt(r2.w);
/*135*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*136*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*137*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*138*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*139*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*140*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*141*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*142*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*143*/	r3.y = intBitsToFloat(int(r2.w));
/*144*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*145*/	if(floatBitsToUint(r3.z) != 0u) {
/*146*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*147*/	  r5.w = vsOut_T0.w;
/*148*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*149*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*150*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*151*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*152*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*153*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*154*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*155*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*156*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*157*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*158*/	  if(floatBitsToUint(r3.w) == 0u) {
/*159*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*160*/	    r7.xy = floor((r6.xyxx).xy);
/*161*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*162*/	    r3.z = -0.000400 / r3.z;
/*163*/	    r3.z = r3.z + r6.z;
/*164*/	    r8.z = -r8.y + 1.000000;
/*165*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*166*/	    r8.w = -r8.y;
/*167*/	    r10.x = cb1.data[0].z/**/;
/*168*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*169*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*170*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*171*/	    r10.w = -cb1.data[0].w/**/;
/*172*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*173*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*174*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*175*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*176*/	    r8.x = r9.x;
/*177*/	    r8.y = r11.x;
/*178*/	    r8.z = r10.x;
/*179*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*180*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*181*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*182*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*183*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*184*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*185*/	    r3.z = -r6.x + r6.y;
/*186*/	    r3.z = r3.w * r3.z + r6.x;
/*187*/	  } else {
/*188*/	    r3.z = 1.000000;
/*189*/	  }
/*190*/	} else {
/*191*/	  r3.z = 1.000000;
/*192*/	}
/*193*/	r3.w = cb1.data[34].w + -1.000000;
/*194*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*195*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*196*/	if(floatBitsToUint(r2.w) == 0u) {
/*197*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*198*/	  r2.w = floatBitsToInt(r2.w);
/*199*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*200*/	  if(floatBitsToUint(r2.w) != 0u) {
/*201*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*202*/	    r5.w = vsOut_T0.w;
/*203*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*204*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*205*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*206*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*207*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*208*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*209*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*210*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*211*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*212*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*213*/	    if(floatBitsToUint(r5.w) == 0u) {
/*214*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*215*/	      r6.xy = floor((r5.xyxx).xy);
/*216*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*217*/	      r2.w = -0.000400 / r2.w;
/*218*/	      r2.w = r2.w + r5.z;
/*219*/	      r7.z = -r7.y + 1.000000;
/*220*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*221*/	      r7.w = -r7.y;
/*222*/	      r9.x = cb1.data[0].z/**/;
/*223*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*224*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*225*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*226*/	      r9.w = -cb1.data[0].w/**/;
/*227*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*228*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*229*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*230*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*231*/	      r7.x = r8.x;
/*232*/	      r7.y = r10.x;
/*233*/	      r7.z = r9.x;
/*234*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*235*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*236*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*237*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*238*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*239*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*240*/	      r2.w = -r5.x + r5.z;
/*241*/	      r2.w = r5.y * r2.w + r5.x;
/*242*/	    } else {
/*243*/	      r2.w = 1.000000;
/*244*/	    }
/*245*/	  } else {
/*246*/	    r2.w = 1.000000;
/*247*/	  }
/*248*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*249*/	  r5.y = r5.x * cb1.data[34].x;
/*250*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*251*/	  r5.x = r1.w + -r5.x;
/*252*/	  r5.x = saturate(r5.x / r5.y);
/*253*/	  r2.w = -r3.z + r2.w;
/*254*/	  r3.z = r5.x * r2.w + r3.z;
/*255*/	}
/*256*/	if(floatBitsToUint(r3.w) != 0u) {
/*257*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*258*/	  r3.w = r2.w * cb1.data[34].y;
/*259*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*260*/	  r2.w = r1.w + -r2.w;
/*261*/	  r2.w = saturate(r2.w / r3.w);
/*262*/	  r3.y = -r3.z + 1.000000;
/*263*/	  r3.z = r2.w * r3.y + r3.z;
/*264*/	}
/*265*/	r3.z = saturate(r3.z);
/*266*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*267*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*268*/	r2.w = inversesqrt(r2.w);
/*269*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*270*/	r2.w = -r3.x + 1.000000;
/*271*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*272*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*273*/	r3.w = r3.w + r3.w;
/*274*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*275*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*276*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*277*/	r3.w = cos((r8.x));
/*278*/	r3.w = inversesqrt(r3.w);
/*279*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*280*/	r5.w = saturate(r0.w * 60.000000);
/*281*/	r5.w = -r0.w + r5.w;
/*282*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*283*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*284*/	r6.w = inversesqrt(r6.w);
/*285*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*286*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*287*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*288*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*289*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*290*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*291*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*292*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*293*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*294*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*295*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*296*/	r6.w = -r0.w + 1.000000;
/*297*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*298*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*299*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*300*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*301*/	  r6.w = max(r6.w, 0.000000);
/*302*/	  r6.w = log2(r6.w);
/*303*/	  r6.w = r6.w * 10.000000;
/*304*/	  r6.w = exp2(r6.w);
/*305*/	  r6.w = r3.w * r6.w;
/*306*/	  r6.w = r6.w * r5.w + r0.w;
/*307*/	  r7.y = r2.w * 8.000000;
/*308*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*309*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*310*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*311*/	}
/*312*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*313*/	r7.y = max(r6.w, 0.000000);
/*314*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*315*/	if(floatBitsToUint(r6.w) != 0u) {
/*316*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*317*/	  r6.x = max(r6.x, -1.000000);
/*318*/	  r6.x = min(r6.x, 1.000000);
/*319*/	  r6.y = -abs(r6.x) + 1.000000;
/*320*/	  r6.y = sqrt(r6.y);
/*321*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*322*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*323*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*324*/	  r6.w = r6.y * r6.z;
/*325*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*326*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*327*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*328*/	  r6.x = r6.z * r6.y + r6.x;
/*329*/	  r3.x = r3.x * r3.x;
/*330*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*331*/	  r3.x = r3.x * r3.y + r7.x;
/*332*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*333*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*334*/	  r3.y = -r3.x * r3.x + 1.000000;
/*335*/	  r3.y = max(r3.y, 0.001000);
/*336*/	  r3.y = log2(r3.y);
/*337*/	  r6.y = r3.y * 4.950617;
/*338*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*339*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*340*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*341*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*342*/	  r3.x = floatBitsToInt(r3.x);
/*343*/	  r6.y = r3.y * r3.y + -r6.y;
/*344*/	  r6.y = sqrt(r6.y);
/*345*/	  r3.y = -r3.y + r6.y;
/*346*/	  r3.y = max(r3.y, 0.000000);
/*347*/	  r3.y = sqrt(r3.y);
/*348*/	  r3.x = r3.y * r3.x;
/*349*/	  r3.x = r3.x * 1.414214;
/*350*/	  r3.x = 0.008727 / r3.x;
/*351*/	  r3.x = max(r3.x, 0.000100);
/*352*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*353*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*354*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*355*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*356*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*357*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*358*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*359*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*360*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*361*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*362*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*363*/	  r3.x = floatBitsToInt(r3.x);
/*364*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*365*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*366*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*367*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*368*/	  r3.x = r3.x * r6.x + 1.000000;
/*369*/	  r3.x = r3.x * 0.500000;
/*370*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*371*/	  r3.y = r3.y * r6.y + 1.000000;
/*372*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*373*/	  r3.y = min(r7.y, 1.000000);
/*374*/	  r2.w = r2.w * 1.570796;
/*375*/	  r2.w = sin(r2.w);
/*376*/	  r3.y = r3.y + -1.000000;
/*377*/	  r2.w = r2.w * r3.y + 1.000000;
/*378*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*379*/	  r3.y = max(r3.y, 0.000000);
/*380*/	  r3.y = log2(r3.y);
/*381*/	  r3.y = r3.y * 10.000000;
/*382*/	  r3.y = exp2(r3.y);
/*383*/	  r3.y = r3.w * r3.y;
/*384*/	  r3.y = r3.y * r5.w + r0.w;
/*385*/	  r2.w = r2.w * abs(r3.x);
/*386*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*387*/	} else {
/*388*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*389*/	}
/*390*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*391*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*392*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*393*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*394*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*395*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*396*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*397*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*398*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*399*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*400*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*401*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*402*/	r2.w = inversesqrt(r2.w);
/*403*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*404*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*405*/	r2.w = r2.w + r2.w;
/*406*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*407*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*408*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*409*/	r0.x = max(r0.x, 0.000000);
/*410*/	r0.x = log2(r0.x);
/*411*/	r0.x = r0.x * 10.000000;
/*412*/	r0.x = exp2(r0.x);
/*413*/	r0.x = r3.w * r0.x;
/*414*/	r0.x = r0.x * r5.w + r0.w;
/*415*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*416*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*417*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*418*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*419*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*420*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*421*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*422*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*423*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*424*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*425*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*426*/	if(r0.x != 0) discard;
/*427*/	color1.x = 1.000000;
/*428*/	return;
}
