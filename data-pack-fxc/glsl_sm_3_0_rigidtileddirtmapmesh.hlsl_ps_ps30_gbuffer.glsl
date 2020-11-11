//
//
// Shader Model 4
// Fragment Shader
//
// id: 805 - fxc/glsl_SM_3_0_rigidtileddirtmapmesh.hlsl_PS_ps30_gbuffer.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*3*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*4*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*5*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*6*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*7*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*8*/	r1.w = saturate(vsOut_N0.w);
/*9*/	r5.xyz = (r5.xyzx + -cb3.data[0].xyzx).xyz;
/*10*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[0].xyzx).xyz;
/*11*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*12*/	r4.xyw = (r4.xyxw + -cb3.data[1].xyxz).xyw;
/*13*/	r4.xyw = (r1.wwww * r4.xyxw + cb3.data[1].xyxz).xyw;
/*14*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*15*/	r6.xyz = (r6.xyzx + -cb3.data[2].xyzx).xyz;
/*16*/	r6.xyz = (r1.wwww * r6.xyzx + cb3.data[2].xyzx).xyz;
/*17*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*19*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*21*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*22*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*23*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*24*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*25*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*27*/	r1.w = -r1.w + 1.000000;
/*28*/	r1.w = max(r1.w, 0.000000);
/*29*/	r3.z = sqrt(r1.w);
/*30*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*31*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*32*/	r4.w = 1.000000;
/*33*/	r1.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*34*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*35*/	r4.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx).xy;
/*36*/	r4.xyzw = (texture(s_detail_map, r4.xyxx.st)).xyzw;
/*37*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*38*/	r4.w = r4.w + -1.000000;
/*39*/	r4.w = r5.x * r4.w + 1.000000;
/*40*/	r4.w = saturate(r4.w * r5.x);
/*41*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*42*/	r4.xyz = (r4.wwww * r5.xyzx + r4.xyzx).xyz;
/*43*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*44*/	r4.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*45*/	r4.w = inversesqrt(r4.w);
/*46*/	r6.xyz = (r4.wwww * vsOut_T3.xyzx).xyz;
/*47*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*48*/	r4.w = inversesqrt(r4.w);
/*49*/	r7.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*50*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*51*/	r4.w = inversesqrt(r4.w);
/*52*/	r8.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*53*/	r9.xyz = (r3.yyyy * r7.xyzx).xyz;
/*54*/	r9.xyz = (r3.xxxx * r6.xyzx + r9.xyzx).xyz;
/*55*/	r3.xyz = (r3.zzzz * r8.xyzx + r9.xyzx).xyz;
/*56*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*57*/	r4.w = inversesqrt(r4.w);
/*58*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*59*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*60*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*61*/	if(floatBitsToUint(r0.w) != 0u) {
/*62*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*63*/	  r9.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*64*/	  r0.w = r9.y * cb0.data[26].x;
/*65*/	  r9.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*66*/	  r9.xy = (vsOut_T1.xyxx * r9.xxxx + r9.yzyy).xy;
/*67*/	  r9.xyzw = (texture(s_fire_map, r9.xyxx.st)).xyzw;
/*68*/	  r1.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*69*/	  r2.xw = (r2.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*70*/	}
/*71*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*72*/	if(floatBitsToUint(r0.w) != 0u) {
/*73*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*74*/	  if(floatBitsToUint(r0.w) != 0u) {
/*75*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*76*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*77*/	    r9.xy = (r10.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*78*/	    r10.xy = (r9.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*79*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*80*/	    r0.w = -r0.w + 1.000000;
/*81*/	    r0.w = max(r0.w, 0.000000);
/*82*/	    r10.z = sqrt(r0.w);
/*83*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*84*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*85*/	    r0.w = inversesqrt(r0.w);
/*86*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*87*/	    r12.xz = (cb1.data[0].xxyx).xz/**/;
/*88*/	    r12.y = -1.000000;
/*89*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*90*/	    r0.w = inversesqrt(r0.w);
/*91*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*92*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*93*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*94*/	    r4.w = r4.w * 1.250000;
/*95*/	    r4.w = min(r4.w, 1.000000);
/*96*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*97*/	    r5.w = r5.w * 4.000000;
/*98*/	    r4.w = r4.w * 0.200000 + r5.w;
/*99*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*100*/	    r0.w = r0.w + -r4.w;
/*101*/	    r0.w = saturate(r0.w * 200.000000);
/*102*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*103*/	    r0.w = r0.w * r0.w;
/*104*/	    r0.w = r0.w * r4.w;
/*105*/	    r2.w = r0.w * -r2.w + r2.w;
/*106*/	    r4.w = -r2.x + 0.200000;
/*107*/	    r2.x = r0.w * r4.w + r2.x;
/*108*/	    r0.xyz = (-r0.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*109*/	    r5.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*110*/	    r0.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*111*/	    r1.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*112*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*113*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*114*/	    r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*115*/	    r4.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*116*/	    r4.x = -r4.x + 1.000000;
/*117*/	    r4.x = max(r4.x, 0.000000);
/*118*/	    r0.z = sqrt(r4.x);
/*119*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*120*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*121*/	    r4.w = sqrt(r4.w);
/*122*/	    r0.xyz = (r4.xyzx * r4.wwww + r0.xyzx).xyz;
/*123*/	    r4.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*124*/	    r4.x = inversesqrt(r4.x);
/*125*/	    r0.xyz = (r0.xyzx * r4.xxxx).xyz;
/*126*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*127*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*128*/	    r0.xyz = (r0.zzzz * r8.xyzx + r4.xyzx).xyz;
/*129*/	    r4.x = -r3.y + 1.000000;
/*130*/	    r0.w = min(r0.w, r4.x);
/*131*/	    r0.xyz = (-r3.xyzx + r0.xyzx).xyz;
/*132*/	    r0.xyz = (r0.wwww * r0.xyzx + r3.xyzx).xyz;
/*133*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*134*/	    r0.w = inversesqrt(r0.w);
/*135*/	    r3.xyz = (r0.wwww * r0.xyzx).xyz;
/*136*/	  }
/*137*/	}
/*138*/	r0.x = vsOut_T7.y * -r2.x + r2.x;
/*139*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*140*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*141*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*142*/	r4.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*143*/	r4.xyz = (-r0.yzwy + r4.xxxx).xyz;
/*144*/	r0.yzw = (vsOut_T7.zzzz * r4.xxyz + r0.yyzw).yzw;
/*145*/	r4.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*146*/	r4.xyz = (-r1.xyzx + r4.xxxx).xyz;
/*147*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r1.xyzx).xyz;
/*148*/	color1.w = saturate(vsOut_T7.z * -r0.x + r0.x);
/*149*/	r0.x = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*150*/	r1.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*151*/	r1.x = inversesqrt(r1.x);
/*152*/	r1.xyz = (r1.xxxx * r3.xyzx).xyz;
/*153*/	color3.x = r1.w / r3.w;
/*154*/	r1.w = max(abs(r1.z), abs(r1.y));
/*155*/	r1.w = max(r1.w, abs(r1.x));
/*156*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*157*/	r2.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*158*/	color0.xyzw = saturate(r2.xyzw);
/*159*/	color1.xyz = saturate(sqrt(r0.yzwy)).xyz;
/*160*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x3c008081u));
/*161*/	color2.xyzw = saturate(r4.xyzw);
/*162*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*163*/	color4 = vsOut_P1;
/*164*/	return;
}
