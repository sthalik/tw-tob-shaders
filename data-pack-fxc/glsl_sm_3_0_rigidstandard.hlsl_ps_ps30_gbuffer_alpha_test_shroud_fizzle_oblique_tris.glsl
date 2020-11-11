//
//
// Shader Model 4
// Fragment Shader
//
// id: 656 - fxc/glsl_SM_3_0_rigidstandard.hlsl_PS_ps30_gbuffer_alpha_test_shroud_fizzle_oblique_tris.glsl
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
/*72*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*73*/	r4.x = inversesqrt(r4.x);
/*74*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*75*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*76*/	r4.w = inversesqrt(r4.w);
/*77*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*78*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*79*/	r4.w = inversesqrt(r4.w);
/*80*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*81*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*82*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*83*/	r3.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*84*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*85*/	r4.w = inversesqrt(r4.w);
/*86*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*87*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*88*/	r0.w = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*89*/	if(floatBitsToUint(r0.w) != 0u) {
/*90*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*91*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*92*/	  r0.w = r7.y * cb0.data[26].x;
/*93*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*94*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*95*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*96*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*97*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*98*/	}
/*99*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*100*/	if(floatBitsToUint(r0.w) != 0u) {
/*101*/	  r0.w = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*102*/	  if(floatBitsToUint(r0.w) != 0u) {
/*103*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*104*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*105*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*106*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*107*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*108*/	    r0.w = -r0.w + 1.000000;
/*109*/	    r0.w = max(r0.w, 0.000000);
/*110*/	    r8.z = sqrt(r0.w);
/*111*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*112*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*115*/	    r10.xz = (cb2.data[0].xxyx).xz/**/;
/*116*/	    r10.y = -1.000000;
/*117*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*118*/	    r0.w = inversesqrt(r0.w);
/*119*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*120*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*121*/	    r4.w = cb2.data[1].x * cb2.data[1].x;
/*122*/	    r4.w = r4.w * 1.250000;
/*123*/	    r4.w = min(r4.w, 1.000000);
/*124*/	    r5.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*125*/	    r5.w = r5.w * 4.000000;
/*126*/	    r4.w = r4.w * 0.200000 + r5.w;
/*127*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*128*/	    r0.w = r0.w + -r4.w;
/*129*/	    r0.w = saturate(r0.w * 200.000000);
/*130*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*131*/	    r0.w = r0.w * r0.w;
/*132*/	    r0.w = r0.w * r4.w;
/*133*/	    r1.w = r0.w * -r1.w + r1.w;
/*134*/	    r4.w = -r1.x + 0.200000;
/*135*/	    r1.x = r0.w * r4.w + r1.x;
/*136*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*137*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*138*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*139*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*140*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*141*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*142*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*143*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*144*/	    r4.w = -r4.w + 1.000000;
/*145*/	    r4.w = max(r4.w, 0.000000);
/*146*/	    r7.z = sqrt(r4.w);
/*147*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*148*/	    r4.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*149*/	    r4.w = sqrt(r4.w);
/*150*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*151*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*152*/	    r4.w = inversesqrt(r4.w);
/*153*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*154*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*155*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*156*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*157*/	    r4.w = -r3.y + 1.000000;
/*158*/	    r0.w = min(r0.w, r4.w);
/*159*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*160*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*161*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*162*/	    r0.w = inversesqrt(r0.w);
/*163*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*164*/	  }
/*165*/	}
/*166*/	r0.w = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*167*/	if(floatBitsToUint(r0.w) != 0u) {
/*168*/	  r4.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*169*/	  r5.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*170*/	  r4.xyzw = r4.xyzw / r5.xyzw;
/*171*/	  r5.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*172*/	  r4.xyzw = r4.xyzw * r5.xyzw + cb1.data[4].xyxy;
/*173*/	  r5.xyzw = (textureLod(s_shroud, r4.zwzz.st, r4.w)).xyzw;
/*174*/	  r4.xyzw = r4.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*175*/	  r4.xyzw = saturate(r4.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*176*/	  r6.xyzw = r4.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*177*/	  r4.xyzw = r4.xyzw * r4.xyzw;
/*178*/	  r4.xyzw = r4.xyzw * r6.xyzw;
/*179*/	  r0.w = r5.x * r4.x;
/*180*/	  r0.w = r0.w * r4.y;
/*181*/	  r0.w = r4.z * -r0.w + r0.w;
/*182*/	  r0.w = r4.w * -r0.w + r0.w;
/*183*/	} else {
/*184*/	  r0.w = 1.000000;
/*185*/	}
/*186*/	r4.xy = (r0.wwww + vec4(-0.100000, -0.500000, 0.000000, 0.000000)).xy;
/*187*/	r0.w = saturate(r4.x * 2.500000);
/*188*/	r4.x = r0.w * -2.000000 + 3.000000;
/*189*/	r0.w = r0.w * r0.w;
/*190*/	r0.w = r0.w * r4.x;
/*191*/	r4.x = saturate(r4.y + r4.y);
/*192*/	r4.y = r4.x * -2.000000 + 3.000000;
/*193*/	r4.x = r4.x * r4.x;
/*194*/	r4.x = r4.x * r4.y;
/*195*/	r0.w = r0.w * 0.200000;
/*196*/	r4.yzw = saturate(r0.wwww * r0.xxyz).yzw;
/*197*/	r0.xyz = (r0.xyzx + -r4.yzwy).xyz;
/*198*/	r0.xyz = (r4.xxxx * r0.xyzx + r4.yzwy).xyz;
/*199*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*200*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*201*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*202*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*203*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*204*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*205*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*206*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*207*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*208*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*209*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*210*/	r0.w = uintBitsToFloat((cb3.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*211*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*212*/	r2.x = inversesqrt(r2.x);
/*213*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*214*/	color3.x = r2.w / r3.w;
/*215*/	r2.w = max(abs(r2.z), abs(r2.y));
/*216*/	r2.w = max(r2.w, abs(r2.x));
/*217*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*218*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*219*/	color0.xyzw = saturate(r1.xyzw);
/*220*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*221*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*222*/	color2.xyzw = saturate(r4.xyzw);
/*223*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*224*/	color4 = vsOut_P1;
/*225*/	return;
}
