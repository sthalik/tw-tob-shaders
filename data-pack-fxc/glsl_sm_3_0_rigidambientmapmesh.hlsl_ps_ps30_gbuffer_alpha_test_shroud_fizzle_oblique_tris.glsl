//
//
// Shader Model 4
// Fragment Shader
//
// id: 487 - fxc/glsl_SM_3_0_rigidambientmapmesh.hlsl_PS_ps30_gbuffer_alpha_test_shroud_fizzle_oblique_tris.glsl
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
  vec4 r11;
  vec4 r12;
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
/*23*/	r1.xyz = (dFdy(vsOut_T0.zxyz)).xyz;
/*24*/	r3.xyz = (dFdx(vsOut_T0.yzxy)).xyz;
/*25*/	r4.xyz = (r1.xyzx * r3.xyzx).xyz;
/*26*/	r1.xyz = (r1.zxyz * r3.yzxy + -r4.xyzx).xyz;
/*27*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*28*/	r1.w = inversesqrt(r1.w);
/*29*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*30*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*31*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*32*/	r1.w = inversesqrt(r1.w);
/*33*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*34*/	r1.x = dot(vec3(r1.xyzx), vec3(r3.xyzx));
/*35*/	r1.x = saturate(r1.x + r1.x);
/*36*/	r1.yz = (vsOut_T1.xxyx * vec4(0.000000, 20.000000, 20.000000, 0.000000)).yz;
/*37*/	r3.xyzw = (texture(s_dissolve_map, r1.yzyy.st)).xyzw;
/*38*/	r1.x = r1.x + -r3.x;
/*39*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*40*/	if(r1.x != 0) discard;
/*41*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*42*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*44*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*45*/	r2.w = saturate(vsOut_N0.w);
/*46*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*47*/	r5.xyz = (r2.wwww * r5.xyzx + cb4.data[0].xyzx).xyz;
/*48*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*49*/	r4.xyw = (r4.xyxw + -cb4.data[1].xyxz).xyw;
/*50*/	r4.xyw = (r2.wwww * r4.xyxw + cb4.data[1].xyxz).xyw;
/*51*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*52*/	r6.xyz = (r6.xyzx + -cb4.data[2].xyzx).xyz;
/*53*/	r6.xyz = (r2.wwww * r6.xyzx + cb4.data[2].xyzx).xyz;
/*54*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*55*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*56*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*57*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*58*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*59*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*60*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*62*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*63*/	r2.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*64*/	r2.w = -r2.w + 1.000000;
/*65*/	r2.w = max(r2.w, 0.000000);
/*66*/	r3.z = sqrt(r2.w);
/*67*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*68*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*69*/	r4.w = 1.000000;
/*70*/	r2.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*71*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*72*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*73*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*74*/	r4.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*75*/	r4.w = inversesqrt(r4.w);
/*76*/	r6.xyz = (r4.wwww * vsOut_T3.xyzx).xyz;
/*77*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*78*/	r4.w = inversesqrt(r4.w);
/*79*/	r7.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*80*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*81*/	r4.w = inversesqrt(r4.w);
/*82*/	r8.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*83*/	r9.xyz = (r3.yyyy * r7.xyzx).xyz;
/*84*/	r9.xyz = (r3.xxxx * r6.xyzx + r9.xyzx).xyz;
/*85*/	r3.xyz = (r3.zzzz * r8.xyzx + r9.xyzx).xyz;
/*86*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*87*/	r4.w = inversesqrt(r4.w);
/*88*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*89*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*90*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*91*/	if(floatBitsToUint(r0.w) != 0u) {
/*92*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*93*/	  r9.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*94*/	  r0.w = r9.y * cb0.data[26].x;
/*95*/	  r9.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*96*/	  r9.xy = (vsOut_T1.xyxx * r9.xxxx + r9.yzyy).xy;
/*97*/	  r9.xyzw = (texture(s_fire_map, r9.xyxx.st)).xyzw;
/*98*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*99*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*100*/	}
/*101*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*102*/	if(floatBitsToUint(r0.w) != 0u) {
/*103*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*104*/	  if(floatBitsToUint(r0.w) != 0u) {
/*105*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*106*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*107*/	    r9.xy = (r10.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*108*/	    r10.xy = (r9.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*109*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*110*/	    r0.w = -r0.w + 1.000000;
/*111*/	    r0.w = max(r0.w, 0.000000);
/*112*/	    r10.z = sqrt(r0.w);
/*113*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*114*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*115*/	    r0.w = inversesqrt(r0.w);
/*116*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*117*/	    r12.xz = (cb2.data[0].xxyx).xz/**/;
/*118*/	    r12.y = -1.000000;
/*119*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*120*/	    r0.w = inversesqrt(r0.w);
/*121*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*122*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*123*/	    r4.w = cb2.data[1].x * cb2.data[1].x;
/*124*/	    r4.w = r4.w * 1.250000;
/*125*/	    r4.w = min(r4.w, 1.000000);
/*126*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*127*/	    r5.w = r5.w * 4.000000;
/*128*/	    r4.w = r4.w * 0.200000 + r5.w;
/*129*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*130*/	    r0.w = r0.w + -r4.w;
/*131*/	    r0.w = saturate(r0.w * 200.000000);
/*132*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*133*/	    r0.w = r0.w * r0.w;
/*134*/	    r0.w = r0.w * r4.w;
/*135*/	    r1.w = r0.w * -r1.w + r1.w;
/*136*/	    r4.w = -r1.x + 0.200000;
/*137*/	    r1.x = r0.w * r4.w + r1.x;
/*138*/	    r0.xyz = (-r0.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*139*/	    r5.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*140*/	    r0.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*141*/	    r2.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*142*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*143*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*144*/	    r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*145*/	    r4.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*146*/	    r4.x = -r4.x + 1.000000;
/*147*/	    r4.x = max(r4.x, 0.000000);
/*148*/	    r0.z = sqrt(r4.x);
/*149*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*150*/	    r4.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*151*/	    r4.w = sqrt(r4.w);
/*152*/	    r0.xyz = (r4.xyzx * r4.wwww + r0.xyzx).xyz;
/*153*/	    r4.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*154*/	    r4.x = inversesqrt(r4.x);
/*155*/	    r0.xyz = (r0.xyzx * r4.xxxx).xyz;
/*156*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*157*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*158*/	    r0.xyz = (r0.zzzz * r8.xyzx + r4.xyzx).xyz;
/*159*/	    r4.x = -r3.y + 1.000000;
/*160*/	    r0.w = min(r0.w, r4.x);
/*161*/	    r0.xyz = (-r3.xyzx + r0.xyzx).xyz;
/*162*/	    r0.xyz = (r0.wwww * r0.xyzx + r3.xyzx).xyz;
/*163*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*164*/	    r0.w = inversesqrt(r0.w);
/*165*/	    r3.xyz = (r0.wwww * r0.xyzx).xyz;
/*166*/	  }
/*167*/	}
/*168*/	r0.x = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*169*/	if(floatBitsToUint(r0.x) != 0u) {
/*170*/	  r0.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*171*/	  r4.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*172*/	  r0.xyzw = r0.xyzw / r4.xyzw;
/*173*/	  r4.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*174*/	  r0.xyzw = r0.xyzw * r4.xyzw + cb1.data[4].xyxy;
/*175*/	  r4.xyzw = (textureLod(s_shroud, r0.zwzz.st, r0.w)).xyzw;
/*176*/	  r0.xyzw = r0.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*177*/	  r0.xyzw = saturate(r0.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*178*/	  r6.xyzw = r0.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*179*/	  r0.xyzw = r0.xyzw * r0.xyzw;
/*180*/	  r0.xyzw = r0.xyzw * r6.xyzw;
/*181*/	  r0.x = r4.x * r0.x;
/*182*/	  r0.x = r0.x * r0.y;
/*183*/	  r0.x = r0.z * -r0.x + r0.x;
/*184*/	  r0.x = r0.w * -r0.x + r0.x;
/*185*/	} else {
/*186*/	  r0.x = 1.000000;
/*187*/	}
/*188*/	r0.xy = (r0.xxxx + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*189*/	r0.x = saturate(r0.x * 2.500000);
/*190*/	r0.z = r0.x * -2.000000 + 3.000000;
/*191*/	r0.x = r0.x * r0.x;
/*192*/	r0.x = r0.x * r0.z;
/*193*/	r0.y = saturate(r0.y + r0.y);
/*194*/	r0.z = r0.y * -2.000000 + 3.000000;
/*195*/	r0.y = r0.y * r0.y;
/*196*/	r0.y = r0.y * r0.z;
/*197*/	r0.x = r0.x * 0.200000;
/*198*/	r0.xzw = saturate(r0.xxxx * r5.xxyz).xzw;
/*199*/	r4.xyz = (-r0.xzwx + r5.xyzx).xyz;
/*200*/	r0.xyz = (r0.yyyy * r4.xyzx + r0.xzwx).xyz;
/*201*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*202*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*203*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*204*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*205*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*206*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*207*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*208*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*209*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*210*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*211*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*212*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*213*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*214*/	r2.x = inversesqrt(r2.x);
/*215*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*216*/	color3.x = r2.w / r3.w;
/*217*/	r2.w = max(abs(r2.z), abs(r2.y));
/*218*/	r2.w = max(r2.w, abs(r2.x));
/*219*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*220*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*221*/	color0.xyzw = saturate(r1.xyzw);
/*222*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*223*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*224*/	color2.xyzw = saturate(r4.xyzw);
/*225*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*226*/	color4 = vsOut_P1;
/*227*/	return;
}
