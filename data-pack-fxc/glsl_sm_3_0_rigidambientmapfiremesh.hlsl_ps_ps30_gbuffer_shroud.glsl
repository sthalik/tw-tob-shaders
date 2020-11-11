//
//
// Shader Model 4
// Fragment Shader
//
// id: 536 - fxc/glsl_SM_3_0_rigidambientmapfiremesh.hlsl_PS_ps30_gbuffer_shroud.glsl
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
flat in uint vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_ambient_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform sampler2D s_shroud;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb1;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.y = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb3.data[0].x))) * 0xffffffffu)).x;
/*14*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*15*/	  r1.x = r0.x * r1.x;
/*16*/	}
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r0.x = r1.w + -0.500000;
/*20*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(r0.x != 0) discard;
/*22*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*23*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*24*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*26*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*27*/	r2.w = saturate(vsOut_N0.w);
/*28*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*29*/	r5.xyz = (r2.wwww * r5.xyzx + cb4.data[0].xyzx).xyz;
/*30*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*31*/	r4.xyw = (r4.xyxw + -cb4.data[1].xyxz).xyw;
/*32*/	r4.xyw = (r2.wwww * r4.xyxw + cb4.data[1].xyxz).xyw;
/*33*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*34*/	r6.xyz = (r6.xyzx + -cb4.data[2].xyzx).xyz;
/*35*/	r6.xyz = (r2.wwww * r6.xyzx + cb4.data[2].xyzx).xyz;
/*36*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*38*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*40*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*41*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*42*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*44*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	r2.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*46*/	r2.w = -r2.w + 1.000000;
/*47*/	r2.w = max(r2.w, 0.000000);
/*48*/	r3.z = sqrt(r2.w);
/*49*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*50*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*51*/	r4.w = 1.000000;
/*52*/	r2.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*53*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*54*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*55*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*56*/	r6.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*57*/	r7.x = 0;
/*58*/	r7.y = cb0.data[26].x * 0.050000;
/*59*/	r6.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r7.xxxy).zw;
/*60*/	r7.xyzw = (texture(s_fire_map, r6.zwzz.st)).xyzw;
/*61*/	r6.xyzw = (texture(s_fire_map, r6.xyxx.st)).xyzw;
/*62*/	r4.w = saturate(r7.x * 5.000000);
/*63*/	r7.xyz = (r4.wwww * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*64*/	r4.w = dot(vec3(r5.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*65*/	r4.w = saturate(-r4.w * 15.000000 + 1.000000);
/*66*/	r5.w = log2(r6.z);
/*67*/	r5.w = r5.w * 1.800000;
/*68*/	r5.w = exp2(r5.w);
/*69*/	r5.w = r5.w * 10.000000;
/*70*/	r5.w = min(r5.w, 1.000000);
/*71*/	r4.w = r4.w + r5.w;
/*72*/	r4.w = r4.w * 0.500000;
/*73*/	r5.w = -r6.w + 1.000000;
/*74*/	r5.w = log2(r5.w);
/*75*/	r5.w = r5.w * vsOut_T7.x;
/*76*/	r5.w = exp2(r5.w);
/*77*/	r5.w = min(r5.w, 1.000000);
/*78*/	r5.w = r5.w * vsOut_T7.x;
/*79*/	r6.x = r6.z * 0.250000;
/*80*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r6.xxxx).xyz;
/*81*/	r6.xyw = (r4.wwww * r7.xyxz + r6.xxxx).xyw;
/*82*/	r0.xyz = (-r0.xyzx * r4.xyzx + r6.xywx).xyz;
/*83*/	r0.xyz = (r5.wwww * r0.xyzx + r5.xyzx).xyz;
/*84*/	r4.x = vsOut_T7.x + -0.025000;
/*85*/	r4.x = max(r4.x, 0.000000);
/*86*/	r4.yzw = (r6.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*87*/	r0.xyz = (r4.xxxx * r4.yzwy + r0.xyzx).xyz;
/*88*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*89*/	r4.x = inversesqrt(r4.x);
/*90*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*91*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*92*/	r4.w = inversesqrt(r4.w);
/*93*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*94*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*95*/	r4.w = inversesqrt(r4.w);
/*96*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*97*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*98*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*99*/	r3.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*100*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*101*/	r4.w = inversesqrt(r4.w);
/*102*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*103*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*104*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*105*/	if(floatBitsToUint(r0.w) != 0u) {
/*106*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*107*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*108*/	  r0.w = r7.y * cb0.data[26].x;
/*109*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*110*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*111*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*112*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*113*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*114*/	}
/*115*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*116*/	if(floatBitsToUint(r0.w) != 0u) {
/*117*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*118*/	  if(floatBitsToUint(r0.w) != 0u) {
/*119*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*120*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*121*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*122*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*123*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*124*/	    r0.w = -r0.w + 1.000000;
/*125*/	    r0.w = max(r0.w, 0.000000);
/*126*/	    r8.z = sqrt(r0.w);
/*127*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*128*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*129*/	    r0.w = inversesqrt(r0.w);
/*130*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*131*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*132*/	    r10.y = -1.000000;
/*133*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*134*/	    r0.w = inversesqrt(r0.w);
/*135*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*136*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*137*/	    r4.w = cb2.data[1].x * cb2.data[1].x;
/*138*/	    r4.w = r4.w * 1.250000;
/*139*/	    r4.w = min(r4.w, 1.000000);
/*140*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*141*/	    r5.w = r5.w * 4.000000;
/*142*/	    r4.w = r4.w * 0.200000 + r5.w;
/*143*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*144*/	    r0.w = r0.w + -r4.w;
/*145*/	    r0.w = saturate(r0.w * 200.000000);
/*146*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*147*/	    r0.w = r0.w * r0.w;
/*148*/	    r0.w = r0.w * r4.w;
/*149*/	    r1.w = r0.w * -r1.w + r1.w;
/*150*/	    r4.w = -r1.x + 0.200000;
/*151*/	    r1.x = r0.w * r4.w + r1.x;
/*152*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*153*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*154*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*155*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*156*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*157*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*158*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*159*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*160*/	    r4.w = -r4.w + 1.000000;
/*161*/	    r4.w = max(r4.w, 0.000000);
/*162*/	    r7.z = sqrt(r4.w);
/*163*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*164*/	    r4.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*165*/	    r4.w = sqrt(r4.w);
/*166*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*167*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*168*/	    r4.w = inversesqrt(r4.w);
/*169*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*170*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*171*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*172*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*173*/	    r4.w = -r3.y + 1.000000;
/*174*/	    r0.w = min(r0.w, r4.w);
/*175*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*176*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*177*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*178*/	    r0.w = inversesqrt(r0.w);
/*179*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*180*/	  }
/*181*/	}
/*182*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*183*/	if(floatBitsToUint(r0.w) != 0u) {
/*184*/	  r4.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*185*/	  r5.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*186*/	  r4.xyzw = r4.xyzw / r5.xyzw;
/*187*/	  r5.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*188*/	  r4.xyzw = r4.xyzw * r5.xyzw + cb1.data[4].xyxy;
/*189*/	  r5.xyzw = (textureLod(s_shroud, r4.zwzz.st, r4.w)).xyzw;
/*190*/	  r4.xyzw = r4.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*191*/	  r4.xyzw = saturate(r4.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*192*/	  r6.xyzw = r4.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*193*/	  r4.xyzw = r4.xyzw * r4.xyzw;
/*194*/	  r4.xyzw = r4.xyzw * r6.xyzw;
/*195*/	  r0.w = r5.x * r4.x;
/*196*/	  r0.w = r0.w * r4.y;
/*197*/	  r0.w = r4.z * -r0.w + r0.w;
/*198*/	  r0.w = r4.w * -r0.w + r0.w;
/*199*/	} else {
/*200*/	  r0.w = 1.000000;
/*201*/	}
/*202*/	r4.xy = (r0.wwww + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*203*/	r0.w = saturate(r4.x * 2.500000);
/*204*/	r4.x = r0.w * -2.000000 + 3.000000;
/*205*/	r0.w = r0.w * r0.w;
/*206*/	r0.w = r0.w * r4.x;
/*207*/	r4.x = saturate(r4.y + r4.y);
/*208*/	r4.y = r4.x * -2.000000 + 3.000000;
/*209*/	r4.x = r4.x * r4.x;
/*210*/	r4.x = r4.x * r4.y;
/*211*/	r0.w = r0.w * 0.200000;
/*212*/	r4.yzw = saturate(r0.wwww * r0.xxyz).yzw;
/*213*/	r0.xyz = (r0.xyzx + -r4.yzwy).xyz;
/*214*/	r0.xyz = (r4.xxxx * r0.xyzx + r4.yzwy).xyz;
/*215*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*216*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*217*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*218*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*219*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*220*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*221*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*222*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*223*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*224*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*225*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*226*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*227*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*228*/	r2.x = inversesqrt(r2.x);
/*229*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*230*/	color3.x = r2.w / r3.w;
/*231*/	r2.w = max(abs(r2.z), abs(r2.y));
/*232*/	r2.w = max(r2.w, abs(r2.x));
/*233*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*234*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*235*/	color0.xyzw = saturate(r1.xyzw);
/*236*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*237*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*238*/	color2.xyzw = saturate(r4.xyzw);
/*239*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*240*/	color4 = vsOut_P1;
/*241*/	return;
}
