//
//
// Shader Model 4
// Fragment Shader
//
// id: 4497 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_rigidambientmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
flat in vec4 vsOut_N0;
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
uniform sampler2D s_colour_mask_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

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
/*11*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*14*/	r0.x = saturate(vsOut_N0.w);
/*15*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
/*23*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*25*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*27*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*28*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*29*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*33*/	r1.w = -r1.w + 1.000000;
/*34*/	r1.w = max(r1.w, 0.000000);
/*35*/	r1.z = sqrt(r1.w);
/*36*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*38*/	r4.w = 1.000000;
/*39*/	r1.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*40*/	r5.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*41*/	r6.xyz = (r0.xywx * r5.xyzx).xyz;
/*42*/	r2.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r2.w = inversesqrt(r2.w);
/*44*/	r7.xyz = (r2.wwww * vsOut_T3.xyzx).xyz;
/*45*/	r2.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*46*/	r2.w = inversesqrt(r2.w);
/*47*/	r8.xyz = (r2.wwww * vsOut_T4.xyzx).xyz;
/*48*/	r2.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r2.w = inversesqrt(r2.w);
/*50*/	r9.xyz = (r2.wwww * vsOut_T2.xyzx).xyz;
/*51*/	r10.xyz = (r1.yyyy * r8.xyzx).xyz;
/*52*/	r10.xyz = (r1.xxxx * r7.xyzx + r10.xyzx).xyz;
/*53*/	r1.xyz = (r1.zzzz * r9.xyzx + r10.xyzx).xyz;
/*54*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*55*/	r2.w = inversesqrt(r2.w);
/*56*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*57*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*58*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*59*/	if(floatBitsToUint(r0.z) != 0u) {
/*60*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*61*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*62*/	  r0.z = r3.w * cb0.data[26].x;
/*63*/	  r10.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*64*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r10.xxxy).zw;
/*65*/	  r10.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*66*/	  r2.xyz = (r10.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*67*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*68*/	}
/*69*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*70*/	if(floatBitsToUint(r0.z) != 0u) {
/*71*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*72*/	  if(floatBitsToUint(r0.z) != 0u) {
/*73*/	    r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*74*/	    r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*75*/	    r3.zw = (r11.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*76*/	    r11.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*77*/	    r0.z = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*78*/	    r0.z = -r0.z + 1.000000;
/*79*/	    r0.z = max(r0.z, 0.000000);
/*80*/	    r11.z = sqrt(r0.z);
/*81*/	    r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*82*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*83*/	    r0.z = inversesqrt(r0.z);
/*84*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*85*/	    r13.xz = (cb3.data[0].xxyx).xz/**/;
/*86*/	    r13.y = -1.000000;
/*87*/	    r0.z = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*88*/	    r0.z = inversesqrt(r0.z);
/*89*/	    r13.xyz = (r0.zzzz * r13.xyzx).xyz;
/*90*/	    r0.z = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*91*/	    r2.w = cb3.data[1].x * cb3.data[1].x;
/*92*/	    r2.w = r2.w * 1.250000;
/*93*/	    r2.w = min(r2.w, 1.000000);
/*94*/	    r3.z = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*95*/	    r3.z = r3.z * 4.000000;
/*96*/	    r2.w = r2.w * 0.200000 + r3.z;
/*97*/	    r2.w = r2.w * -0.700000 + 1.000000;
/*98*/	    r0.z = r0.z + -r2.w;
/*99*/	    r0.z = saturate(r0.z * 200.000000);
/*100*/	    r2.w = r0.z * -2.000000 + 3.000000;
/*101*/	    r0.z = r0.z * r0.z;
/*102*/	    r0.z = r0.z * r2.w;
/*103*/	    r3.x = r0.z * -r3.x + r3.x;
/*104*/	    r2.w = -r3.y + 0.200000;
/*105*/	    r3.y = r0.z * r2.w + r3.y;
/*106*/	    r0.xyw = (-r0.xyxw * r5.xyxz + vec4(0.400000, 0.400000, 0.000000, 0.400000)).xyw;
/*107*/	    r6.xyz = (r0.zzzz * r0.xywx + r6.xyzx).xyz;
/*108*/	    r0.xyw = (-r2.xyxz + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*109*/	    r2.xyz = (r0.zzzz * r0.xywx + r2.xyzx).xyz;
/*110*/	    r5.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*111*/	    r0.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*112*/	    r5.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*113*/	    r0.x = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*114*/	    r0.x = -r0.x + 1.000000;
/*115*/	    r0.x = max(r0.x, 0.000000);
/*116*/	    r5.z = sqrt(r0.x);
/*117*/	    r0.xyw = (r11.xyxz + r11.xyxz).xyw;
/*118*/	    r2.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*119*/	    r2.w = sqrt(r2.w);
/*120*/	    r0.xyw = (r0.xyxw * r2.wwww + r5.xyxz).xyw;
/*121*/	    r2.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*122*/	    r2.w = inversesqrt(r2.w);
/*123*/	    r0.xyw = (r0.xyxw * r2.wwww).xyw;
/*124*/	    r5.xyz = (r8.xyzx * r0.yyyy).xyz;
/*125*/	    r5.xyz = (r0.xxxx * r7.xyzx + r5.xyzx).xyz;
/*126*/	    r0.xyw = (r0.wwww * r9.xyxz + r5.xyxz).xyw;
/*127*/	    r2.w = -r1.y + 1.000000;
/*128*/	    r0.z = min(r0.z, r2.w);
/*129*/	    r0.xyw = (-r1.xyxz + r0.xyxw).xyw;
/*130*/	    r0.xyz = (r0.zzzz * r0.xywx + r1.xyzx).xyz;
/*131*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*132*/	    r0.w = inversesqrt(r0.w);
/*133*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*134*/	  }
/*135*/	}
/*136*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*137*/	r0.yzw = (r6.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*138*/	r0.yzw = (-r6.xxyz + r0.yyzw).yzw;
/*139*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r6.xxyz).yzw;
/*140*/	r2.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*141*/	r3.yzw = (-r0.yyzw + r2.wwww).yzw;
/*142*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*143*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*144*/	r3.yzw = (-r2.xxyz + r2.wwww).yzw;
/*145*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*146*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*147*/	r2.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*148*/	r2.w = inversesqrt(r2.w);
/*149*/	r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*150*/	r5.xyz = (-cb1.data[35].xyzx * cb1.data[34].zzzz + vsOut_T0.xyzx).xyz;
/*151*/	r6.x = uintBitsToFloat((r1.w >= cb1.data[37].x) ? 0xffffffffu : 0x00000000u);
/*152*/	r6.y = uintBitsToFloat((r1.w >= cb1.data[38].x) ? 0xffffffffu : 0x00000000u);
/*153*/	r6.z = uintBitsToFloat((r1.w >= cb1.data[39].x) ? 0xffffffffu : 0x00000000u);
/*154*/	r6.w = uintBitsToFloat((r1.w >= cb1.data[40].x) ? 0xffffffffu : 0x00000000u);
/*155*/	r6.xyzw = uintBitsToFloat(floatBitsToUint(r6.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*156*/	r2.w = dot(r6.xyzw, r6.xyzw);
/*157*/	r3.y = intBitsToFloat(int(r2.w));
/*158*/	r3.z = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*159*/	if(floatBitsToUint(r3.z) != 0u) {
/*160*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*161*/	  r5.w = vsOut_T0.w;
/*162*/	  r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+2u].xyzw);
/*163*/	  r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+3u].xyzw);
/*164*/	  r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+4u].xyzw);
/*165*/	  r3.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r3.z)+5u].xyzw);
/*166*/	  r6.xyz = (r6.xyzx / r3.zzzz).xyz;
/*167*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(r6.xyxx, cb1.data[floatBitsToUint(r3.y)+41u].xyxx)) * 0xffffffffu)).xy;
/*168*/	  r3.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*169*/	  r7.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+41u].zwzz, r6.xyxx)) * 0xffffffffu)).xy;
/*170*/	  r6.w = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*171*/	  r3.w = uintBitsToFloat(floatBitsToUint(r3.w) | floatBitsToUint(r6.w));
/*172*/	  if(floatBitsToUint(r3.w) == 0u) {
/*173*/	    r6.xy = (r6.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*174*/	    r7.xy = floor((r6.xyxx).xy);
/*175*/	    r8.xy = (r7.xyxx / cb1.data[0].xyxx).xy;
/*176*/	    r3.z = -0.000400 / r3.z;
/*177*/	    r3.z = r3.z + r6.z;
/*178*/	    r8.z = -r8.y + 1.000000;
/*179*/	    r9.xyzw = (textureLod(sHardShadowBuffer, r8.xzxx.st, 0.000000)).xyzw;
/*180*/	    r8.w = -r8.y;
/*181*/	    r10.x = cb1.data[0].z/**/;
/*182*/	    r10.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*183*/	    r6.zw = (r8.xxxw + r10.xxxy).zw;
/*184*/	    r11.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*185*/	    r10.w = -cb1.data[0].w/**/;
/*186*/	    r6.zw = (r8.xxxz + r10.zzzw).zw;
/*187*/	    r10.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).xyzw;
/*188*/	    r6.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r8.xxxz).zw;
/*189*/	    r8.xyzw = (textureLod(sHardShadowBuffer, r6.zwzz.st, 0.000000)).yzwx;
/*190*/	    r8.x = r9.x;
/*191*/	    r8.y = r11.x;
/*192*/	    r8.z = r10.x;
/*193*/	    r8.xyzw = uintBitsToFloat(uvec4(lessThan(r3.zzzz, r8.xyzw)) * 0xffffffffu);
/*194*/	    r9.xyzw = uintBitsToFloat(floatBitsToUint(r8.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*195*/	    r3.zw = (r6.xxxy + -r7.xxxy).zw;
/*196*/	    r6.xy = (mix(vec4(-0.000000, -0.000000, 0, 0), vec4(-1.000000, -1.000000, 0, 0), greaterThan(floatBitsToUint(r8.xzxx), uvec4(0)))).xy;
/*197*/	    r6.xy = (r6.xyxx + r9.ywyy).xy;
/*198*/	    r6.xy = (r3.zzzz * r6.xyxx + r9.xzxx).xy;
/*199*/	    r3.z = -r6.x + r6.y;
/*200*/	    r3.z = r3.w * r3.z + r6.x;
/*201*/	  } else {
/*202*/	    r3.z = 1.000000;
/*203*/	  }
/*204*/	} else {
/*205*/	  r3.z = 1.000000;
/*206*/	}
/*207*/	r3.w = cb1.data[34].w + -1.000000;
/*208*/	r2.w = uintBitsToFloat((r2.w == r3.w) ? 0xffffffffu : 0x00000000u);
/*209*/	r3.w = uintBitsToFloat((floatBitsToInt(r2.w) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*210*/	if(floatBitsToUint(r2.w) == 0u) {
/*211*/	  r2.w = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*212*/	  r2.w = floatBitsToInt(r2.w);
/*213*/	  r2.w = uintBitsToFloat((r2.w < cb1.data[34].w) ? 0xffffffffu : 0x00000000u);
/*214*/	  if(floatBitsToUint(r2.w) != 0u) {
/*215*/	    r2.w = intBitsToFloat(floatBitsToInt(r3.y) << int(2));
/*216*/	    r5.w = vsOut_T0.w;
/*217*/	    r6.x = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+6u].xyzw);
/*218*/	    r6.y = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+7u].xyzw);
/*219*/	    r6.z = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+8u].xyzw);
/*220*/	    r2.w = dot(r5.xyzw, cb1.data[floatBitsToUint(r2.w)+9u].xyzw);
/*221*/	    r5.xyz = (r6.xyzx / r2.wwww).xyz;
/*222*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(r5.xyxx, cb1.data[floatBitsToUint(r3.y)+42u].xyxx)) * 0xffffffffu)).xy;
/*223*/	    r5.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*224*/	    r6.xy = (uintBitsToFloat(uvec4(lessThan(cb1.data[floatBitsToUint(r3.y)+42u].zwzz, r5.xyxx)) * 0xffffffffu)).xy;
/*225*/	    r6.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*226*/	    r5.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r6.x));
/*227*/	    if(floatBitsToUint(r5.w) == 0u) {
/*228*/	      r5.xy = (r5.xyxx * cb1.data[0].xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*229*/	      r6.xy = floor((r5.xyxx).xy);
/*230*/	      r7.xy = (r6.xyxx / cb1.data[0].xyxx).xy;
/*231*/	      r2.w = -0.000400 / r2.w;
/*232*/	      r2.w = r2.w + r5.z;
/*233*/	      r7.z = -r7.y + 1.000000;
/*234*/	      r8.xyzw = (textureLod(sHardShadowBuffer, r7.xzxx.st, 0.000000)).xyzw;
/*235*/	      r7.w = -r7.y;
/*236*/	      r9.x = cb1.data[0].z/**/;
/*237*/	      r9.yz = (vec4(0, 1.000000, 0, 0)).yz;
/*238*/	      r5.zw = (r7.xxxw + r9.xxxy).zw;
/*239*/	      r10.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*240*/	      r9.w = -cb1.data[0].w/**/;
/*241*/	      r5.zw = (r7.xxxz + r9.zzzw).zw;
/*242*/	      r9.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).xyzw;
/*243*/	      r5.zw = (cb1.data[0].zzzw * vec4(0.000000, 0.000000, 1.000000, -1.000000) + r7.xxxz).zw;
/*244*/	      r7.xyzw = (textureLod(sHardShadowBuffer, r5.zwzz.st, 0.000000)).yzwx;
/*245*/	      r7.x = r8.x;
/*246*/	      r7.y = r10.x;
/*247*/	      r7.z = r9.x;
/*248*/	      r7.xyzw = uintBitsToFloat(uvec4(lessThan(r2.wwww, r7.xyzw)) * 0xffffffffu);
/*249*/	      r8.xyzw = uintBitsToFloat(floatBitsToUint(r7.xyzw) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0x3f800000u, 0x3f800000u)));
/*250*/	      r5.xy = (r5.xyxx + -r6.xyxx).xy;
/*251*/	      r5.zw = (mix(vec4(0, 0, -0.000000, -0.000000), vec4(0, 0, -1.000000, -1.000000), greaterThan(floatBitsToUint(r7.xxxz), uvec4(0)))).zw;
/*252*/	      r5.zw = (r5.zzzw + r8.yyyw).zw;
/*253*/	      r5.xz = (r5.xxxx * r5.zzwz + r8.xxzx).xz;
/*254*/	      r2.w = -r5.x + r5.z;
/*255*/	      r2.w = r5.y * r2.w + r5.x;
/*256*/	    } else {
/*257*/	      r2.w = 1.000000;
/*258*/	    }
/*259*/	  } else {
/*260*/	    r2.w = 1.000000;
/*261*/	  }
/*262*/	  r5.x = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*263*/	  r5.y = r5.x * cb1.data[34].x;
/*264*/	  r5.x = -r5.x * cb1.data[34].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*265*/	  r5.x = r1.w + -r5.x;
/*266*/	  r5.x = saturate(r5.x / r5.y);
/*267*/	  r2.w = -r3.z + r2.w;
/*268*/	  r3.z = r5.x * r2.w + r3.z;
/*269*/	}
/*270*/	if(floatBitsToUint(r3.w) != 0u) {
/*271*/	  r2.w = -cb1.data[floatBitsToUint(r3.y)+36u].x + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*272*/	  r3.w = r2.w * cb1.data[34].y;
/*273*/	  r2.w = -r2.w * cb1.data[34].y + cb1.data[floatBitsToUint(r3.y)+37u].x;
/*274*/	  r2.w = r1.w + -r2.w;
/*275*/	  r2.w = saturate(r2.w / r3.w);
/*276*/	  r3.y = -r3.z + 1.000000;
/*277*/	  r3.z = r2.w * r3.y + r3.z;
/*278*/	}
/*279*/	r3.z = saturate(r3.z);
/*280*/	r5.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*281*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*282*/	r2.w = inversesqrt(r2.w);
/*283*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*284*/	r2.w = -r3.x + 1.000000;
/*285*/	r3.y = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*286*/	r3.w = dot(vec3(r5.xyzx), vec3(r1.xyzx));
/*287*/	r3.w = r3.w + r3.w;
/*288*/	r6.xyz = (r1.xyzx * -r3.wwww + r5.xyzx).xyz;
/*289*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*290*/	r8.xy = (r2.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*291*/	r3.w = cos((r8.x));
/*292*/	r3.w = inversesqrt(r3.w);
/*293*/	r3.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.w)).w;
/*294*/	r5.w = saturate(r0.x * 60.000000);
/*295*/	r5.w = -r0.x + r5.w;
/*296*/	r8.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*297*/	r6.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*298*/	r6.w = inversesqrt(r6.w);
/*299*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*300*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*301*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*302*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*303*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*304*/	r8.xzw = (r8.xxzw * r8.xxzw).xzw;
/*305*/	r9.xyz = (r9.xywx * r8.zzzz).xyz;
/*306*/	r9.xyz = (r8.xxxx * r10.xyzx + r9.xyzx).xyz;
/*307*/	r8.xzw = (r8.wwww * r11.xxyz + r9.xxyz).xzw;
/*308*/	r8.xzw = (r7.yyyy * r8.xxzw).xzw;
/*309*/	r8.xzw = (r0.yyzw * r8.xxzw).xzw;
/*310*/	r6.w = -r0.x + 1.000000;
/*311*/	r8.xzw = (r6.wwww * r8.xxzw).xzw;
/*312*/	r8.xzw = (r7.xxxx * r8.xxzw).xzw;
/*313*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*314*/	  r6.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*315*/	  r6.w = max(r6.w, 0.000000);
/*316*/	  r6.w = log2(r6.w);
/*317*/	  r6.w = r6.w * 10.000000;
/*318*/	  r6.w = exp2(r6.w);
/*319*/	  r6.w = r3.w * r6.w;
/*320*/	  r6.w = r6.w * r5.w + r0.x;
/*321*/	  r7.y = r2.w * 8.000000;
/*322*/	  r9.xyzw = (textureLod(s_environment, r6.xyzx.stp, r7.y)).xyzw;
/*323*/	  r9.xyz = (r6.wwww * r9.xyzx).xyz;
/*324*/	  r8.xzw = (r9.xxyz * r2.xxyz + r8.xxzw).xzw;
/*325*/	}
/*326*/	r6.w = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*327*/	r7.y = max(r6.w, 0.000000);
/*328*/	r6.w = uintBitsToFloat((0.000000 < r6.w) ? 0xffffffffu : 0x00000000u);
/*329*/	if(floatBitsToUint(r6.w) != 0u) {
/*330*/	  r6.x = dot(vec3(-cb2.data[0].yzwy), vec3(r6.xyzx));
/*331*/	  r6.x = max(r6.x, -1.000000);
/*332*/	  r6.x = min(r6.x, 1.000000);
/*333*/	  r6.y = -abs(r6.x) + 1.000000;
/*334*/	  r6.y = sqrt(r6.y);
/*335*/	  r6.z = abs(r6.x) * -0.018729 + 0.074261;
/*336*/	  r6.z = r6.z * abs(r6.x) + -0.212114;
/*337*/	  r6.z = r6.z * abs(r6.x) + 1.570729;
/*338*/	  r6.w = r6.y * r6.z;
/*339*/	  r6.w = r6.w * -2.000000 + 3.141593;
/*340*/	  r6.x = uintBitsToFloat((r6.x < -r6.x) ? 0xffffffffu : 0x00000000u);
/*341*/	  r6.x = uintBitsToFloat(floatBitsToUint(r6.x) & floatBitsToUint(r6.w));
/*342*/	  r6.x = r6.z * r6.y + r6.x;
/*343*/	  r3.x = r3.x * r3.x;
/*344*/	    r3.y = (floatBitsToUint(r3.y) > 0x00000000u) ? 0.995900 : -0.000100;
/*345*/	  r3.x = r3.x * r3.y + r7.x;
/*346*/	  r3.x = r3.x * 0.500000 + 0.500000;
/*347*/	  r3.x = r3.x * 2.000000 + -1.000000;
/*348*/	  r3.y = -r3.x * r3.x + 1.000000;
/*349*/	  r3.y = max(r3.y, 0.001000);
/*350*/	  r3.y = log2(r3.y);
/*351*/	  r6.y = r3.y * 4.950617;
/*352*/	  r3.y = r3.y * 0.346574 + 4.546885;
/*353*/	  r6.z = uintBitsToFloat((0.000000 < r3.x) ? 0xffffffffu : 0x00000000u);
/*354*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*355*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*356*/	  r3.x = floatBitsToInt(r3.x);
/*357*/	  r6.y = r3.y * r3.y + -r6.y;
/*358*/	  r6.y = sqrt(r6.y);
/*359*/	  r3.y = -r3.y + r6.y;
/*360*/	  r3.y = max(r3.y, 0.000000);
/*361*/	  r3.y = sqrt(r3.y);
/*362*/	  r3.x = r3.y * r3.x;
/*363*/	  r3.x = r3.x * 1.414214;
/*364*/	  r3.x = 0.008727 / r3.x;
/*365*/	  r3.x = max(r3.x, 0.000100);
/*366*/	  r6.xy = (r6.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*367*/	  r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*368*/	  r3.xy = (r3.xxxx * r6.xyxx).xy;
/*369*/	  r6.xy = (r3.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*370*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*371*/	  r9.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*372*/	  r6.zw = (r9.xxxz / r9.yyyw).zw;
/*373*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*374*/	  r6.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.xxxy)) * 0xffffffffu)).zw;
/*375*/	  r3.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*376*/	  r3.x = intBitsToFloat(1 + ~floatBitsToInt(r6.z) + floatBitsToInt(r3.x));
/*377*/	  r3.x = floatBitsToInt(r3.x);
/*378*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*379*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*380*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*381*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*382*/	  r3.x = r3.x * r6.x + 1.000000;
/*383*/	  r3.x = r3.x * 0.500000;
/*384*/	  r3.y = 1 + ~floatBitsToInt(r6.w);
/*385*/	  r3.y = r3.y * r6.y + 1.000000;
/*386*/	  r3.x = r3.y * 0.500000 + -r3.x;
/*387*/	  r3.y = min(r7.y, 1.000000);
/*388*/	  r2.w = r2.w * 1.570796;
/*389*/	  r2.w = sin(r2.w);
/*390*/	  r3.y = r3.y + -1.000000;
/*391*/	  r2.w = r2.w * r3.y + 1.000000;
/*392*/	  r3.y = dot(vec3(-cb2.data[0].yzwy), vec3(r5.xyzx));
/*393*/	  r3.y = max(r3.y, 0.000000);
/*394*/	  r3.y = log2(r3.y);
/*395*/	  r3.y = r3.y * 10.000000;
/*396*/	  r3.y = exp2(r3.y);
/*397*/	  r3.y = r3.w * r3.y;
/*398*/	  r3.y = r3.y * r5.w + r0.x;
/*399*/	  r2.w = r2.w * abs(r3.x);
/*400*/	  r5.xyz = (r3.yyyy * r2.wwww).xyz;
/*401*/	} else {
/*402*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*403*/	}
/*404*/	r6.xyz = saturate(r7.zzzz * r5.xyzx).xyz;
/*405*/	r6.xyz = (r2.xyzx * r6.xyzx).xyz;
/*406*/	r5.xyz = (max(r0.xxxx, r5.xyzx)).xyz;
/*407*/	r5.xyz = (-r5.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*408*/	r0.yzw = (r0.yyzw * r7.yyyy).yzw;
/*409*/	r0.yzw = (r0.yyzw * cb2.data[1].xxyz).yzw;
/*410*/	r0.yzw = (r5.xxyz * r0.yyzw).yzw;
/*411*/	r0.yzw = (r7.xxxx * r0.yyzw).yzw;
/*412*/	r0.yzw = (r6.xxyz * cb2.data[1].xxyz + r0.yyzw).yzw;
/*413*/	r0.yzw = (r3.zzzz * r0.yyzw + r8.xxzw).yzw;
/*414*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*415*/	r2.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*416*/	r2.w = inversesqrt(r2.w);
/*417*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*418*/	r2.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*419*/	r2.w = r2.w + r2.w;
/*420*/	r1.xyz = (r1.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*421*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r8.y)).xyzw;
/*422*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*423*/	r1.x = max(r1.x, 0.000000);
/*424*/	r1.x = log2(r1.x);
/*425*/	r1.x = r1.x * 10.000000;
/*426*/	r1.x = exp2(r1.x);
/*427*/	r1.x = r3.w * r1.x;
/*428*/	r0.x = r1.x * r5.w + r0.x;
/*429*/	r1.xyz = (r6.xyzx * r0.xxxx).xyz;
/*430*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.yzwy).xyz;
/*431*/	r0.x = dot(r4.xyzw, cb0.data[9].xyzw);
/*432*/	r0.y = dot(r4.xyzw, cb0.data[10].xyzw);
/*433*/	r0.xy = (r0.xyxx / r1.wwww).xy;
/*434*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*435*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*436*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*437*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*438*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*439*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*440*/	if(r0.x != 0) discard;
/*441*/	color1.x = 1.000000;
/*442*/	return;
}
