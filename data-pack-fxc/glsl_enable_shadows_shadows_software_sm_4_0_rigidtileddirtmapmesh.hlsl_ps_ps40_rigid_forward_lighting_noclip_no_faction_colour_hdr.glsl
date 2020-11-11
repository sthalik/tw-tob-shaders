//
//
// Shader Model 4
// Fragment Shader
//
// id: 4851 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps40_rigid_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*22*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*23*/	r5.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*24*/	r6.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*25*/	r2.w = r5.w + -1.000000;
/*26*/	r2.w = r6.x * r2.w + 1.000000;
/*27*/	r2.w = saturate(r2.w * r6.x);
/*28*/	r6.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*29*/	r5.xyz = (r2.wwww * r6.xyzx + r5.xyzx).xyz;
/*30*/	r6.xyz = (r1.xyzx * r5.xyzx).xyz;
/*31*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*32*/	r2.w = inversesqrt(r2.w);
/*33*/	r7.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*34*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*35*/	r2.w = inversesqrt(r2.w);
/*36*/	r8.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*37*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*38*/	r2.w = inversesqrt(r2.w);
/*39*/	r9.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*40*/	r10.xyz = (r0.yyyy * r8.xyzx).xyz;
/*41*/	r10.xyz = (r0.xxxx * r7.xyzx + r10.xyzx).xyz;
/*42*/	r0.xyw = (r0.wwww * r9.xyxz + r10.xyxz).xyw;
/*43*/	r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*44*/	r2.w = inversesqrt(r2.w);
/*45*/	r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*46*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*47*/	r0.w = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*48*/	if(floatBitsToUint(r0.w) != 0u) {
/*49*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*50*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*51*/	  r0.w = r3.w * cb0.data[26].x;
/*52*/	  r10.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*53*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r10.xxxy).zw;
/*54*/	  r10.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*55*/	  r2.xyz = (r10.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*56*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*57*/	}
/*58*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*59*/	if(floatBitsToUint(r0.w) != 0u) {
/*60*/	  r0.w = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*61*/	  if(floatBitsToUint(r0.w) != 0u) {
/*62*/	    r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*63*/	    r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*64*/	    r3.zw = (r11.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*65*/	    r11.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*66*/	    r0.w = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*67*/	    r0.w = -r0.w + 1.000000;
/*68*/	    r0.w = max(r0.w, 0.000000);
/*69*/	    r11.z = sqrt(r0.w);
/*70*/	    r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*71*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*72*/	    r0.w = inversesqrt(r0.w);
/*73*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*74*/	    r13.xz = (cb3.data[0].xxyx).xz/**/;
/*75*/	    r13.y = -1.000000;
/*76*/	    r0.w = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*77*/	    r0.w = inversesqrt(r0.w);
/*78*/	    r13.xyz = (r0.wwww * r13.xyzx).xyz;
/*79*/	    r0.w = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*80*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*81*/	    r2.w = r2.w * 1.250000;
/*82*/	    r2.w = min(r2.w, 1.000000);
/*83*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*84*/	    r3.z = r3.z * 4.000000;
/*85*/	    r2.w = r2.w * 0.200000 + r3.z;
/*86*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*87*/	    r0.w = r0.w + -r2.w;
/*88*/	    r0.w = saturate(r0.w * 200.000000);
/*89*/	    r2.w = r0.w * -2.000000 + 3.000000;
/*90*/	    r0.w = r0.w * r0.w;
/*91*/	    r0.w = r0.w * r2.w;
/*92*/	    r3.x = r0.w * -r3.x + r3.x;
/*93*/	    r2.w = -r3.y + 0.200000;
/*94*/	    r3.y = r0.w * r2.w + r3.y;
/*95*/	    r1.xyz = (-r1.xyzx * r5.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*96*/	    r6.xyz = (r0.wwww * r1.xyzx + r6.xyzx).xyz;
/*97*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*98*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*99*/	    r5.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*100*/	    r1.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*101*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*102*/	    r2.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*103*/	    r2.w = -r2.w + 1.000000;
/*104*/	    r2.w = max(r2.w, 0.000000);
/*105*/	    r1.z = sqrt(r2.w);
/*106*/	    r5.xyz = (r11.xyzx + r11.xyzx).xyz;
/*107*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*108*/	    r2.w = sqrt(r2.w);
/*109*/	    r1.xyz = (r5.xyzx * r2.wwww + r1.xyzx).xyz;
/*110*/	    r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*111*/	    r2.w = inversesqrt(r2.w);
/*112*/	    r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*113*/	    r5.xyz = (r8.xyzx * r1.yyyy).xyz;
/*114*/	    r5.xyz = (r1.xxxx * r7.xyzx + r5.xyzx).xyz;
/*115*/	    r1.xyz = (r1.zzzz * r9.xyzx + r5.xyzx).xyz;
/*116*/	    r2.w = -r0.y + 1.000000;
/*117*/	    r0.w = min(r0.w, r2.w);
/*118*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*119*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*120*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*121*/	    r0.w = inversesqrt(r0.w);
/*122*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*123*/	  }
/*124*/	}
/*125*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*126*/	r1.xyz = (r6.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*127*/	r1.xyz = (-r6.xyzx + r1.xyzx).xyz;
/*128*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r6.xyzx).xyz;
/*129*/	r2.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r3.yzw = (-r1.xxyz + r2.wwww).yzw;
/*131*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*132*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*133*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*134*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*135*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*136*/	r2.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*137*/	r2.w = inversesqrt(r2.w);
/*138*/	r0.xyz = (r0.xyzx * r2.wwww).xyz;
/*139*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*140*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*141*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*142*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*143*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*144*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*145*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*146*/	r3.y = intBitsToFloat(int(r2.w));
/*147*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*148*/	if(floatBitsToUint(r3.z) != 0u) {
/*149*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*150*/	  r5.w = vsOut_T0.w;
/*151*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*152*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*153*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*154*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*155*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*156*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*157*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*158*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*159*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*160*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*161*/	  if(floatBitsToUint(r3.w) == 0u) {
/*162*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*163*/	    r7.xy = floor((r6.xyxx).xy);
/*164*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*165*/	    r3.z = -0.000400 / r3.z;
/*166*/	    r3.z = r3.z + r6.z;
/*167*/	    r8.z = -r8.y + 1.000000;
/*168*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*169*/	    r8.w = -r8.y;
/*170*/	    r10.x = cb1.data[0].z/**/;
/*171*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*172*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*173*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*174*/	    r10.w = -cb1.data[0].w/**/;
/*175*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*176*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*177*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*178*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*179*/	    r8.x = r9.x;
/*180*/	    r8.y = r11.x;
/*181*/	    r8.z = r10.x;
/*182*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*183*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*184*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*185*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*186*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*187*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*188*/	    r3.z = -r6.x + r6.y;
/*189*/	    r3.z = r3.w * r3.z + r6.x;
/*190*/	  } else {
/*191*/	    r3.z = 1.000000;
/*192*/	  }
/*193*/	} else {
/*194*/	  r3.z = 1.000000;
/*195*/	}
/*196*/	r3.w = cb1.data[34].w + -1.000000;
/*197*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*198*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*199*/	if(floatBitsToUint(r2.w) == 0u) {
/*200*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*201*/	  r2.w = floatBitsToInt(r2.w);
/*202*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*203*/	  if(floatBitsToUint(r2.w) != 0u) {
/*204*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*205*/	    r5.w = vsOut_T0.w;
/*206*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*207*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*208*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*209*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*210*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*211*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*212*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*213*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*214*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*215*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*216*/	    if(floatBitsToUint(r5.w) == 0u) {
/*217*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*218*/	      r6.xy = floor((r5.xyxx).xy);
/*219*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*220*/	      r2.w = -0.000400 / r2.w;
/*221*/	      r2.w = r2.w + r5.z;
/*222*/	      r7.z = -r7.y + 1.000000;
/*223*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*224*/	      r7.w = -r7.y;
/*225*/	      r9.x = cb1.data[0].z/**/;
/*226*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*227*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*228*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*229*/	      r9.w = -cb1.data[0].w/**/;
/*230*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*231*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*232*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*233*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*234*/	      r7.x = r8.x;
/*235*/	      r7.y = r10.x;
/*236*/	      r7.z = r9.x;
/*237*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*238*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*239*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*240*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*241*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*242*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*243*/	      r2.w = -r5.x + r5.z;
/*244*/	      r2.w = r5.y * r2.w + r5.x;
/*245*/	    } else {
/*246*/	      r2.w = 1.000000;
/*247*/	    }
/*248*/	  } else {
/*249*/	    r2.w = 1.000000;
/*250*/	  }
/*251*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*252*/	  r5.y = r5.x * cb1.data[34].x;
/*253*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*254*/	  r5.x = r1.w + -r5.x;
/*255*/	  r5.x = saturate(r5.x / r5.y);
/*256*/	  r2.w = -r3.z + r2.w;
/*257*/	  r3.z = r5.x * r2.w + r3.z;
/*258*/	}
/*259*/	if(floatBitsToUint(r3.w) != 0u) {
/*260*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*261*/	  r3.w = r2.w * cb1.data[34].y;
/*262*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*263*/	  r2.w = r1.w + -r2.w;
/*264*/	  r2.w = saturate(r2.w / r3.w);
/*265*/	  r3.y = -r3.z + 1.000000;
/*266*/	  r3.z = r2.w * r3.y + r3.z;
/*267*/	}
/*268*/	r3.z = saturate(r3.z);
/*269*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*270*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*271*/	r2.w = inversesqrt(r2.w);
/*272*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*273*/	r2.w = -r3.x + 1.000000;
/*274*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*275*/	r3.w = dot(vec3(r5.xyzx), vec3(r0.xyzx));
/*276*/	r3.w = r3.w + r3.w;
/*277*/	r6.xyz = (r0.xyzx * -r3.wwww + r5.xyzx).xyz;
/*278*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*279*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*280*/	r3.w = cos((r8.x));
/*281*/	r3.w = inversesqrt(r3.w);
/*282*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*283*/	r5.w = saturate(r0.w * 60.000000);
/*284*/	r5.w = -r0.w + r5.w;
/*285*/	r8.xzw = (r0.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*286*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*287*/	r6.w = inversesqrt(r6.w);
/*288*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*289*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*290*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*291*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*292*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*293*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*294*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*295*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*296*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*297*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*298*/	r8.xzw = (r1.xxyz * r8.xxzw).xzw;
/*299*/	r6.w = -r0.w + 1.000000;
/*300*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*301*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*302*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*303*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*304*/	  r6.w = max(r6.w, 0.000000);
/*305*/	  r6.w = log2(r6.w);
/*306*/	  r6.w = r6.w * 10.000000;
/*307*/	  r6.w = exp2(r6.w);
/*308*/	  r6.w = r3.w * r6.w;
/*309*/	  r6.w = r6.w * r5.w + r0.w;
/*310*/	  r7.y = r2.w * 8.000000;
/*311*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*312*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*313*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*314*/	}
/*315*/	r6.w = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*316*/	r7.y = max(r6.w, 0.000000);
/*317*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*318*/	if(floatBitsToUint(r6.w) != 0u) {
/*319*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*320*/	  r6.x = max(r6.x, -1.000000);
/*321*/	  r6.x = min(r6.x, 1.000000);
/*322*/	  r6.y = -abs(r6.x) + 1.000000;
/*323*/	  r6.y = sqrt(r6.y);
/*324*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*325*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*326*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*327*/	  r6.w = r6.y * r6.z;
/*328*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*329*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*330*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*331*/	  r6.x = r6.z * r6.y + r6.x;
/*332*/	  r3.x = r3.x * r3.x;
/*333*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*334*/	  r3.x = r3.x * r3.y + r7.x;
/*335*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*336*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*337*/	  r3.y = -r3.x * r3.x + 1.000000;
/*338*/	  r3.y = max(r3.y, 0.001000);
/*339*/	  r3.y = log2(r3.y);
/*340*/	  r6.y = r3.y * 4.950617;
/*341*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*342*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*343*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*344*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*345*/	  r3.x = floatBitsToInt(r3.x);
/*346*/	  r6.y = r3.y * r3.y + -r6.y;
/*347*/	  r6.y = sqrt(r6.y);
/*348*/	  r3.y = -r3.y + r6.y;
/*349*/	  r3.y = max(r3.y, 0.000000);
/*350*/	  r3.y = sqrt(r3.y);
/*351*/	  r3.x = r3.y * r3.x;
/*352*/	  r3.x = r3.x * 1.414214;
/*353*/	  r3.x = 0.008727 / r3.x;
/*354*/	  r3.x = max(r3.x, 0.000100);
/*355*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*356*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*357*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*358*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*359*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*360*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*361*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*362*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*363*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*364*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*365*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*366*/	  r3.x = floatBitsToInt(r3.x);
/*367*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*368*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*369*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*370*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*371*/	  r3.x = r3.x * r6.x + 1.000000;
/*372*/	  r3.x = r3.x * 0.500000;
/*373*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*374*/	  r3.y = r3.y * r6.y + 1.000000;
/*375*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*376*/	  r3.y = min(r7.y, 1.000000);
/*377*/	  r2.w = r2.w * 1.570796;
/*378*/	  r2.w = sin(r2.w);
/*379*/	  r3.y = r3.y + -1.000000;
/*380*/	  r2.w = r2.w * r3.y + 1.000000;
/*381*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*382*/	  r3.y = max(r3.y, 0.000000);
/*383*/	  r3.y = log2(r3.y);
/*384*/	  r3.y = r3.y * 10.000000;
/*385*/	  r3.y = exp2(r3.y);
/*386*/	  r3.y = r3.w * r3.y;
/*387*/	  r3.y = r3.y * r5.w + r0.w;
/*388*/	  r2.w = r2.w * abs(r3.x);
/*389*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*390*/	} else {
/*391*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*392*/	}
/*393*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*394*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*395*/	r5.xyz = (max(r0.wwww, r5.xyzx)).xyz;
/*396*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*397*/	r1.xyz = (r1.xyzx * r7.yyyy).xyz;
/*398*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*399*/	r1.xyz = (r5.xyzx * r1.xyzx).xyz;
/*400*/	r1.xyz = (r7.xxxx * r1.xyzx).xyz;
/*401*/	r1.xyz = (r6.xyzx * cb2.data[1].xyzx + r1.xyzx).xyz;
/*402*/	r1.xyz = (r3.zzzz * r1.xyzx + r8.xzwx).xyz;
/*403*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*404*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*405*/	r2.w = inversesqrt(r2.w);
/*406*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*407*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*408*/	r2.w = r2.w + r2.w;
/*409*/	r0.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*410*/	r6.xyzw = (textureLod(s_environment, r0.xyzx.stp, r8.y)).xyzw;
/*411*/	r0.x = dot(vec3(r0.xyzx), vec3(-r3.xyzx));
/*412*/	r0.x = max(r0.x, 0.000000);
/*413*/	r0.x = log2(r0.x);
/*414*/	r0.x = r0.x * 10.000000;
/*415*/	r0.x = exp2(r0.x);
/*416*/	r0.x = r3.w * r0.x;
/*417*/	r0.x = r0.x * r5.w + r0.w;
/*418*/	r0.xyz = (r6.xyzx * r0.xxxx).xyz;
/*419*/	color0.xyz = (r0.xyzx * r2.xyzx + r1.xyzx).xyz;
/*420*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*421*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*422*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*423*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*424*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*425*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*426*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*427*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*428*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*429*/	if(r0.x != 0) discard;
/*430*/	color1.x = 1.000000;
/*431*/	return;
}
