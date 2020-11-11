//
//
// Shader Model 4
// Fragment Shader
//
// id: 483 - fxc/glsl_SM_3_0_rigidambientmapmesh.hlsl_PS_ps30_gbuffer_alpha_test.glsl
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
/*54*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*55*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*56*/	r4.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*57*/	r4.w = inversesqrt(r4.w);
/*58*/	r6.xyz = (r4.wwww * vsOut_T3.xyzx).xyz;
/*59*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*60*/	r4.w = inversesqrt(r4.w);
/*61*/	r7.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*62*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*63*/	r4.w = inversesqrt(r4.w);
/*64*/	r8.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*65*/	r9.xyz = (r3.yyyy * r7.xyzx).xyz;
/*66*/	r9.xyz = (r3.xxxx * r6.xyzx + r9.xyzx).xyz;
/*67*/	r3.xyz = (r3.zzzz * r8.xyzx + r9.xyzx).xyz;
/*68*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*69*/	r4.w = inversesqrt(r4.w);
/*70*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*71*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*72*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*73*/	if(floatBitsToUint(r0.w) != 0u) {
/*74*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*75*/	  r9.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*76*/	  r0.w = r9.y * cb0.data[26].x;
/*77*/	  r9.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*78*/	  r9.xy = (vsOut_T1.xyxx * r9.xxxx + r9.yzyy).xy;
/*79*/	  r9.xyzw = (texture(s_fire_map, r9.xyxx.st)).xyzw;
/*80*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*81*/	  r1.xw = (r1.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*82*/	}
/*83*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*84*/	if(floatBitsToUint(r0.w) != 0u) {
/*85*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*86*/	  if(floatBitsToUint(r0.w) != 0u) {
/*87*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*88*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*89*/	    r9.xy = (r10.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*90*/	    r10.xy = (r9.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*91*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*92*/	    r0.w = -r0.w + 1.000000;
/*93*/	    r0.w = max(r0.w, 0.000000);
/*94*/	    r10.z = sqrt(r0.w);
/*95*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*96*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*97*/	    r0.w = inversesqrt(r0.w);
/*98*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*99*/	    r12.xz = (cb1.data[0].xxyx).xz/**/;
/*100*/	    r12.y = -1.000000;
/*101*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*102*/	    r0.w = inversesqrt(r0.w);
/*103*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*104*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*105*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*106*/	    r4.w = r4.w * 1.250000;
/*107*/	    r4.w = min(r4.w, 1.000000);
/*108*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*109*/	    r5.w = r5.w * 4.000000;
/*110*/	    r4.w = r4.w * 0.200000 + r5.w;
/*111*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*112*/	    r0.w = r0.w + -r4.w;
/*113*/	    r0.w = saturate(r0.w * 200.000000);
/*114*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*115*/	    r0.w = r0.w * r0.w;
/*116*/	    r0.w = r0.w * r4.w;
/*117*/	    r1.w = r0.w * -r1.w + r1.w;
/*118*/	    r4.w = -r1.x + 0.200000;
/*119*/	    r1.x = r0.w * r4.w + r1.x;
/*120*/	    r0.xyz = (-r0.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*121*/	    r5.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*122*/	    r0.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*123*/	    r2.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*124*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*125*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*126*/	    r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*127*/	    r4.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*128*/	    r4.x = -r4.x + 1.000000;
/*129*/	    r4.x = max(r4.x, 0.000000);
/*130*/	    r0.z = sqrt(r4.x);
/*131*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*132*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*133*/	    r4.w = sqrt(r4.w);
/*134*/	    r0.xyz = (r4.xyzx * r4.wwww + r0.xyzx).xyz;
/*135*/	    r4.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*136*/	    r4.x = inversesqrt(r4.x);
/*137*/	    r0.xyz = (r0.xyzx * r4.xxxx).xyz;
/*138*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*139*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*140*/	    r0.xyz = (r0.zzzz * r8.xyzx + r4.xyzx).xyz;
/*141*/	    r4.x = -r3.y + 1.000000;
/*142*/	    r0.w = min(r0.w, r4.x);
/*143*/	    r0.xyz = (-r3.xyzx + r0.xyzx).xyz;
/*144*/	    r0.xyz = (r0.wwww * r0.xyzx + r3.xyzx).xyz;
/*145*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*146*/	    r0.w = inversesqrt(r0.w);
/*147*/	    r3.xyz = (r0.wwww * r0.xyzx).xyz;
/*148*/	  }
/*149*/	}
/*150*/	r0.x = vsOut_T7.y * -r1.x + r1.x;
/*151*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*152*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*153*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*154*/	r4.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*155*/	r4.xyz = (-r0.yzwy + r4.xxxx).xyz;
/*156*/	r0.yzw = (vsOut_T7.zzzz * r4.xxyz + r0.yyzw).yzw;
/*157*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*158*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*159*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*160*/	color1.w = saturate(vsOut_T7.z * -r0.x + r0.x);
/*161*/	r0.x = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*162*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*163*/	r2.x = inversesqrt(r2.x);
/*164*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*165*/	color3.x = r2.w / r3.w;
/*166*/	r2.w = max(abs(r2.z), abs(r2.y));
/*167*/	r2.w = max(r2.w, abs(r2.x));
/*168*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*169*/	r1.xyz = (r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*170*/	color0.xyzw = saturate(r1.xyzw);
/*171*/	color1.xyz = saturate(sqrt(r0.yzwy)).xyz;
/*172*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x3c008081u));
/*173*/	color2.xyzw = saturate(r4.xyzw);
/*174*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*175*/	color4 = vsOut_P1;
/*176*/	return;
}
