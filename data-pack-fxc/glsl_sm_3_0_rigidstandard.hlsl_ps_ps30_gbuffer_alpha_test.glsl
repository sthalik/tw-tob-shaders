//
//
// Shader Model 4
// Fragment Shader
//
// id: 652 - fxc/glsl_SM_3_0_rigidstandard.hlsl_PS_ps30_gbuffer_alpha_test.glsl
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

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb2.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].x))) * 0xffffffffu)).x;
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
/*28*/	r5.xyz = (r5.xyzx + -cb3.data[0].xyzx).xyz;
/*29*/	r5.xyz = (r2.wwww * r5.xyzx + cb3.data[0].xyzx).xyz;
/*30*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*31*/	r4.xyw = (r4.xyxw + -cb3.data[1].xyxz).xyw;
/*32*/	r4.xyw = (r2.wwww * r4.xyxw + cb3.data[1].xyxz).xyw;
/*33*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*34*/	r6.xyz = (r6.xyzx + -cb3.data[2].xyzx).xyz;
/*35*/	r6.xyz = (r2.wwww * r6.xyzx + cb3.data[2].xyzx).xyz;
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
/*54*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*55*/	r4.x = inversesqrt(r4.x);
/*56*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*57*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*58*/	r4.w = inversesqrt(r4.w);
/*59*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*60*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*61*/	r4.w = inversesqrt(r4.w);
/*62*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*63*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*64*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*65*/	r3.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*66*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*67*/	r4.w = inversesqrt(r4.w);
/*68*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*69*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*70*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*71*/	if(floatBitsToUint(r0.w) != 0u) {
/*72*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*73*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*74*/	  r0.w = r7.y * cb0.data[26].x;
/*75*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*76*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*77*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*78*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*79*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*80*/	}
/*81*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*82*/	if(floatBitsToUint(r0.w) != 0u) {
/*83*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*84*/	  if(floatBitsToUint(r0.w) != 0u) {
/*85*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*86*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*87*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*88*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*89*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*90*/	    r0.w = -r0.w + 1.000000;
/*91*/	    r0.w = max(r0.w, 0.000000);
/*92*/	    r8.z = sqrt(r0.w);
/*93*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*94*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*95*/	    r0.w = inversesqrt(r0.w);
/*96*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*97*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*98*/	    r10.y = -1.000000;
/*99*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*100*/	    r0.w = inversesqrt(r0.w);
/*101*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*102*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*103*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*104*/	    r4.w = r4.w * 1.250000;
/*105*/	    r4.w = min(r4.w, 1.000000);
/*106*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*107*/	    r5.w = r5.w * 4.000000;
/*108*/	    r4.w = r4.w * 0.200000 + r5.w;
/*109*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*110*/	    r0.w = r0.w + -r4.w;
/*111*/	    r0.w = saturate(r0.w * 200.000000);
/*112*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*113*/	    r0.w = r0.w * r0.w;
/*114*/	    r0.w = r0.w * r4.w;
/*115*/	    r1.w = r0.w * -r1.w + r1.w;
/*116*/	    r4.w = -r1.x + 0.200000;
/*117*/	    r1.x = r0.w * r4.w + r1.x;
/*118*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*119*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*120*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*121*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*122*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*123*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*124*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*125*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*126*/	    r4.w = -r4.w + 1.000000;
/*127*/	    r4.w = max(r4.w, 0.000000);
/*128*/	    r7.z = sqrt(r4.w);
/*129*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*130*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*131*/	    r4.w = sqrt(r4.w);
/*132*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*133*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*134*/	    r4.w = inversesqrt(r4.w);
/*135*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*136*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*137*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*138*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*139*/	    r4.w = -r3.y + 1.000000;
/*140*/	    r0.w = min(r0.w, r4.w);
/*141*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*142*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*143*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*144*/	    r0.w = inversesqrt(r0.w);
/*145*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*146*/	  }
/*147*/	}
/*148*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*149*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*150*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*151*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*152*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*153*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*154*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*155*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*156*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*157*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*158*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*159*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*160*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*161*/	r2.x = inversesqrt(r2.x);
/*162*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*163*/	color3.x = r2.w / r3.w;
/*164*/	r2.w = max(abs(r2.z), abs(r2.y));
/*165*/	r2.w = max(r2.w, abs(r2.x));
/*166*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*167*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*168*/	color0.xyzw = saturate(r1.xyzw);
/*169*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*170*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*171*/	color2.xyzw = saturate(r4.xyzw);
/*172*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*173*/	color4 = vsOut_P1;
/*174*/	return;
}
