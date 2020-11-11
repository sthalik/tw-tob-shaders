//
//
// Shader Model 4
// Fragment Shader
//
// id: 4848 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_faction_colour_HDR.glsl
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
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
/*26*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*27*/	r5.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*28*/	r6.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*29*/	r2.w = r5.w + -1.000000;
/*30*/	r2.w = r6.x * r2.w + 1.000000;
/*31*/	r2.w = saturate(r2.w * r6.x);
/*32*/	r6.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*33*/	r5.xyz = (r2.wwww * r6.xyzx + r5.xyzx).xyz;
/*34*/	r6.xyz = (r1.xyzx * r5.xyzx).xyz;
/*35*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*36*/	r2.w = inversesqrt(r2.w);
/*37*/	r7.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*38*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*39*/	r2.w = inversesqrt(r2.w);
/*40*/	r8.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*41*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*42*/	r2.w = inversesqrt(r2.w);
/*43*/	r9.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*44*/	r10.xyz = (r0.yyyy * r8.xyzx).xyz;
/*45*/	r10.xyz = (r0.xxxx * r7.xyzx + r10.xyzx).xyz;
/*46*/	r0.xyw = (r0.wwww * r9.xyxz + r10.xyxz).xyw;
/*47*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*48*/	r2.w = inversesqrt(r2.w);
/*49*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*50*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*51*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*52*/	if(floatBitsToUint(r0.w) != 0u) {
/*53*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*54*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*55*/	  r0.w = r3.w * cb0.data[26].x;
/*56*/	  r10.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*57*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r10.xxxy).zw;
/*58*/	  r10.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*59*/	  r2.xyz = (r10.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*60*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*61*/	}
/*62*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*63*/	if(floatBitsToUint(r0.w) != 0u) {
/*64*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*65*/	  if(floatBitsToUint(r0.w) != 0u) {
/*66*/	    r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*67*/	    r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*68*/	    r3.zw = (r11.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*69*/	    r11.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*70*/	    r0.w = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*71*/	    r0.w = -r0.w + 1.000000;
/*72*/	    r0.w = max(r0.w, 0.000000);
/*73*/	    r11.z = sqrt(r0.w);
/*74*/	    r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*75*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*76*/	    r0.w = inversesqrt(r0.w);
/*77*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*78*/	    r13.xz = (cb3.data[0].xxyx).xz/**/;
/*79*/	    r13.y = -1.000000;
/*80*/	    r0.w = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*81*/	    r0.w = inversesqrt(r0.w);
/*82*/	    r13.xyz = (r0.wwww * r13.xyzx).xyz;
/*83*/	    r0.w = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*84*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*85*/	    r2.w = r2.w * 1.250000;
/*86*/	    r2.w = min(r2.w, 1.000000);
/*87*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*88*/	    r3.z = r3.z * 4.000000;
/*89*/	    r2.w = r2.w * 0.200000 + r3.z;
/*90*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*91*/	    r0.w = r0.w + -r2.w;
/*92*/	    r0.w = saturate(r0.w * 200.000000);
/*93*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*94*/	    r0.w = r0.w * r0.w;
/*95*/	    r0.w = r0.w * r2.w;
/*96*/	    r3.x = r0.w * -r3.x + r3.x;
/*97*/	    r2.w = -r3.y + 0.200000;
/*98*/	    r3.y = r0.w * r2.w + r3.y;
/*99*/	    r1.xyz = (-r1.xyzx * r5.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*100*/	    r6.xyz = (r0.wwww * r1.xyzx + r6.xyzx).xyz;
/*101*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*102*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*103*/	    r5.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*104*/	    r1.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*105*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*106*/	    r2.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*107*/	    r2.w = -r2.w + 1.000000;
/*108*/	    r2.w = max(r2.w, 0.000000);
/*109*/	    r1.z = sqrt(r2.w);
/*110*/	    r5.xyz = (r11.xyzx + r11.xyzx).xyz;
/*111*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*112*/	    r2.w = sqrt(r2.w);
/*113*/	    r1.xyz = (r5.xyzx * r2.wwww + r1.xyzx).xyz;
/*114*/	    r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*115*/	    r2.w = inversesqrt(r2.w);
/*116*/	    r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*117*/	    r5.xyz = (r8.xyzx * r1.yyyy).xyz;
/*118*/	    r5.xyz = (r1.xxxx * r7.xyzx + r5.xyzx).xyz;
/*119*/	    r1.xyz = (r1.zzzz * r9.xyzx + r5.xyzx).xyz;
/*120*/	    r2.w = -r0.y + 1.000000;
/*121*/	    r0.w = min(r0.w, r2.w);
/*122*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*123*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*124*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*125*/	    r0.w = inversesqrt(r0.w);
/*126*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*127*/	  }
/*128*/	}
/*129*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*130*/	r1.xyz = (r6.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*131*/	r1.xyz = (-r6.xyzx + r1.xyzx).xyz;
/*132*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r6.xyzx).xyz;
/*133*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*134*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*135*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*136*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*137*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*138*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*139*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*140*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*141*/	r2.w = inversesqrt(r2.w);
/*142*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*143*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*144*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*145*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*146*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*147*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*148*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*149*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*150*/	r3.y = intBitsToFloat(int(r2.w));
/*151*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*152*/	if(floatBitsToUint(r3.z) != 0u) {
/*153*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*154*/	  r5.w = vsOut_T0.w;
/*155*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*156*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*157*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*158*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*159*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*160*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*161*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*162*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*163*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*164*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*165*/	  if(floatBitsToUint(r3.w) == 0u) {
/*166*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*167*/	    r7.xy = floor((r6.xyxx).xy);
/*168*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*169*/	    r3.z = -0.000400 / r3.z;
/*170*/	    r3.z = r3.z + r6.z;
/*171*/	    r8.z = -r8.y + 1.000000;
/*172*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*173*/	    r8.w = -r8.y;
/*174*/	    r10.x = cb1.data[0].z/**/;
/*175*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*176*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*177*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*178*/	    r10.w = -cb1.data[0].w/**/;
/*179*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*180*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*181*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*182*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*183*/	    r8.x = r9.x;
/*184*/	    r8.y = r11.x;
/*185*/	    r8.z = r10.x;
/*186*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*187*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*188*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*189*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*190*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*191*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*192*/	    r3.z = -r6.x + r6.y;
/*193*/	    r3.z = r3.w * r3.z + r6.x;
/*194*/	  } else {
/*195*/	    r3.z = 1.000000;
/*196*/	  }
/*197*/	} else {
/*198*/	  r3.z = 1.000000;
/*199*/	}
/*200*/	r3.w = cb1.data[34].w + -1.000000;
/*201*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*202*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*203*/	if(floatBitsToUint(r2.w) == 0u) {
/*204*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*205*/	  r2.w = floatBitsToInt(r2.w);
/*206*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*207*/	  if(floatBitsToUint(r2.w) != 0u) {
/*208*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*209*/	    r5.w = vsOut_T0.w;
/*210*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*211*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*212*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*213*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*214*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*215*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*216*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*217*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*218*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*219*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*220*/	    if(floatBitsToUint(r5.w) == 0u) {
/*221*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*222*/	      r6.xy = floor((r5.xyxx).xy);
/*223*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*224*/	      r2.w = -0.000400 / r2.w;
/*225*/	      r2.w = r2.w + r5.z;
/*226*/	      r7.z = -r7.y + 1.000000;
/*227*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*228*/	      r7.w = -r7.y;
/*229*/	      r9.x = cb1.data[0].z/**/;
/*230*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*231*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*232*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*233*/	      r9.w = -cb1.data[0].w/**/;
/*234*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*235*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*236*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*237*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*238*/	      r7.x = r8.x;
/*239*/	      r7.y = r10.x;
/*240*/	      r7.z = r9.x;
/*241*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*242*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*243*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*244*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*245*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*246*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*247*/	      r2.w = -r5.x + r5.z;
/*248*/	      r2.w = r5.y * r2.w + r5.x;
/*249*/	    } else {
/*250*/	      r2.w = 1.000000;
/*251*/	    }
/*252*/	  } else {
/*253*/	    r2.w = 1.000000;
/*254*/	  }
/*255*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*256*/	  r5.y = r5.x * cb1.data[34].x;
/*257*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*258*/	  r5.x = r1.w + -r5.x;
/*259*/	  r5.x = saturate(r5.x / r5.y);
/*260*/	  r2.w = -r3.z + r2.w;
/*261*/	  r3.z = r5.x * r2.w + r3.z;
/*262*/	}
/*263*/	if(floatBitsToUint(r3.w) != 0u) {
/*264*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*265*/	  r3.w = r2.w * cb1.data[34].y;
/*266*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*267*/	  r2.w = r1.w + -r2.w;
/*268*/	  r2.w = saturate(r2.w / r3.w);
/*269*/	  r3.y = -r3.z + 1.000000;
/*270*/	  r3.z = r2.w * r3.y + r3.z;
/*271*/	}
/*272*/	r3.z = saturate(r3.z);
/*273*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*274*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*275*/	r2.w = inversesqrt(r2.w);
/*276*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*277*/	r2.w = -r3.x + 1.000000;
/*278*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*279*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*280*/	r3.w = r3.w + r3.w;
/*281*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*282*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*283*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*284*/	r3.w = cos((r8.x));
/*285*/	r3.w = inversesqrt(r3.w);
/*286*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*287*/	r5.w = saturate(r0.w * 60.000000);
/*288*/	r5.w = -r0.w + r5.w;
/*289*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*290*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*291*/	r6.w = inversesqrt(r6.w);
/*292*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*293*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*294*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*295*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*296*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*297*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*298*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*299*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*300*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*301*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*302*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*303*/	r6.w = -r0.w + 1.000000;
/*304*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*305*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*306*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*307*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*308*/	  r6.w = max(r6.w, 0.000000);
/*309*/	  r6.w = log2(r6.w);
/*310*/	  r6.w = r6.w * 10.000000;
/*311*/	  r6.w = exp2(r6.w);
/*312*/	  r6.w = r3.w * r6.w;
/*313*/	  r6.w = r6.w * r5.w + r0.w;
/*314*/	  r7.y = r2.w * 8.000000;
/*315*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*316*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*317*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*318*/	}
/*319*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*320*/	r7.y = max(r6.w, 0.000000);
/*321*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*322*/	if(floatBitsToUint(r6.w) != 0u) {
/*323*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*324*/	  r6.x = max(r6.x, -1.000000);
/*325*/	  r6.x = min(r6.x, 1.000000);
/*326*/	  r6.y = -abs(r6.x) + 1.000000;
/*327*/	  r6.y = sqrt(r6.y);
/*328*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*329*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*330*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*331*/	  r6.w = r6.y * r6.z;
/*332*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*333*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*334*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*335*/	  r6.x = r6.z * r6.y + r6.x;
/*336*/	  r3.x = r3.x * r3.x;
/*337*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*338*/	  r3.x = r3.x * r3.y + r7.x;
/*339*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*340*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*341*/	  r3.y = -r3.x * r3.x + 1.000000;
/*342*/	  r3.y = max(r3.y, 0.001000);
/*343*/	  r3.y = log2(r3.y);
/*344*/	  r6.y = r3.y * 4.950617;
/*345*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*346*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*347*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*348*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*349*/	  r3.x = floatBitsToInt(r3.x);
/*350*/	  r6.y = r3.y * r3.y + -r6.y;
/*351*/	  r6.y = sqrt(r6.y);
/*352*/	  r3.y = -r3.y + r6.y;
/*353*/	  r3.y = max(r3.y, 0.000000);
/*354*/	  r3.y = sqrt(r3.y);
/*355*/	  r3.x = r3.y * r3.x;
/*356*/	  r3.x = r3.x * 1.414214;
/*357*/	  r3.x = 0.008727 / r3.x;
/*358*/	  r3.x = max(r3.x, 0.000100);
/*359*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*360*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*361*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*362*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*363*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*364*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*365*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*366*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*367*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*368*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*369*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*370*/	  r3.x = floatBitsToInt(r3.x);
/*371*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*372*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*373*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*374*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*375*/	  r3.x = r3.x * r6.x + 1.000000;
/*376*/	  r3.x = r3.x * 0.500000;
/*377*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*378*/	  r3.y = r3.y * r6.y + 1.000000;
/*379*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*380*/	  r3.y = min(r7.y, 1.000000);
/*381*/	  r2.w = r2.w * 1.570796;
/*382*/	  r2.w = sin(r2.w);
/*383*/	  r3.y = r3.y + -1.000000;
/*384*/	  r2.w = r2.w * r3.y + 1.000000;
/*385*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*386*/	  r3.y = max(r3.y, 0.000000);
/*387*/	  r3.y = log2(r3.y);
/*388*/	  r3.y = r3.y * 10.000000;
/*389*/	  r3.y = exp2(r3.y);
/*390*/	  r3.y = r3.w * r3.y;
/*391*/	  r3.y = r3.y * r5.w + r0.w;
/*392*/	  r2.w = r2.w * abs(r3.x);
/*393*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*394*/	} else {
/*395*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*396*/	}
/*397*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*398*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*399*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*400*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*401*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*402*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*403*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*404*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*405*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*406*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*407*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*408*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*409*/	r2.w = inversesqrt(r2.w);
/*410*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*411*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*412*/	r2.w = r2.w + r2.w;
/*413*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*414*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*415*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*416*/	r0.x = max(r0.x, 0.000000);
/*417*/	r0.x = log2(r0.x);
/*418*/	r0.x = r0.x * 10.000000;
/*419*/	r0.x = exp2(r0.x);
/*420*/	r0.x = r3.w * r0.x;
/*421*/	r0.x = r0.x * r5.w + r0.w;
/*422*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*423*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*424*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*425*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*426*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*427*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*428*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*429*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*430*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*431*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*432*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*433*/	if(r0.x != 0) discard;
/*434*/	color1.x = 1.000000;
/*435*/	return;
}
