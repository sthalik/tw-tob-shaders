//
//
// Shader Model 4
// Fragment Shader
//
// id: 481 - fxc/glsl_SM_3_0_rigidambientmapmesh.hlsl_PS_ps30_gbuffer.glsl
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
/*35*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*36*/	r5.xyz = (r0.xyzx * r4.xyzx).xyz;
/*37*/	r4.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*38*/	r4.w = inversesqrt(r4.w);
/*39*/	r6.xyz = (r4.wwww * vsOut_T3.xyzx).xyz;
/*40*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*41*/	r4.w = inversesqrt(r4.w);
/*42*/	r7.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*43*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*44*/	r4.w = inversesqrt(r4.w);
/*45*/	r8.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*46*/	r9.xyz = (r3.yyyy * r7.xyzx).xyz;
/*47*/	r9.xyz = (r3.xxxx * r6.xyzx + r9.xyzx).xyz;
/*48*/	r3.xyz = (r3.zzzz * r8.xyzx + r9.xyzx).xyz;
/*49*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*50*/	r4.w = inversesqrt(r4.w);
/*51*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*52*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*53*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*54*/	if(floatBitsToUint(r0.w) != 0u) {
/*55*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*56*/	  r9.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*57*/	  r0.w = r9.y * cb0.data[26].x;
/*58*/	  r9.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*59*/	  r9.xy = (vsOut_T1.xyxx * r9.xxxx + r9.yzyy).xy;
/*60*/	  r9.xyzw = (texture(s_fire_map, r9.xyxx.st)).xyzw;
/*61*/	  r1.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*62*/	  r2.xw = (r2.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*63*/	}
/*64*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r0.w) != 0u) {
/*66*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*67*/	  if(floatBitsToUint(r0.w) != 0u) {
/*68*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*69*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*70*/	    r9.xy = (r10.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*71*/	    r10.xy = (r9.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*72*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*73*/	    r0.w = -r0.w + 1.000000;
/*74*/	    r0.w = max(r0.w, 0.000000);
/*75*/	    r10.z = sqrt(r0.w);
/*76*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*77*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*78*/	    r0.w = inversesqrt(r0.w);
/*79*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*80*/	    r12.xz = (cb1.data[0].xxyx).xz/**/;
/*81*/	    r12.y = -1.000000;
/*82*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*83*/	    r0.w = inversesqrt(r0.w);
/*84*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*85*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*86*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*87*/	    r4.w = r4.w * 1.250000;
/*88*/	    r4.w = min(r4.w, 1.000000);
/*89*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*90*/	    r5.w = r5.w * 4.000000;
/*91*/	    r4.w = r4.w * 0.200000 + r5.w;
/*92*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*93*/	    r0.w = r0.w + -r4.w;
/*94*/	    r0.w = saturate(r0.w * 200.000000);
/*95*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*96*/	    r0.w = r0.w * r0.w;
/*97*/	    r0.w = r0.w * r4.w;
/*98*/	    r2.w = r0.w * -r2.w + r2.w;
/*99*/	    r4.w = -r2.x + 0.200000;
/*100*/	    r2.x = r0.w * r4.w + r2.x;
/*101*/	    r0.xyz = (-r0.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*102*/	    r5.xyz = (r0.wwww * r0.xyzx + r5.xyzx).xyz;
/*103*/	    r0.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*104*/	    r1.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*105*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*106*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*107*/	    r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*108*/	    r4.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*109*/	    r4.x = -r4.x + 1.000000;
/*110*/	    r4.x = max(r4.x, 0.000000);
/*111*/	    r0.z = sqrt(r4.x);
/*112*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*113*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*114*/	    r4.w = sqrt(r4.w);
/*115*/	    r0.xyz = (r4.xyzx * r4.wwww + r0.xyzx).xyz;
/*116*/	    r4.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*117*/	    r4.x = inversesqrt(r4.x);
/*118*/	    r0.xyz = (r0.xyzx * r4.xxxx).xyz;
/*119*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*120*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*121*/	    r0.xyz = (r0.zzzz * r8.xyzx + r4.xyzx).xyz;
/*122*/	    r4.x = -r3.y + 1.000000;
/*123*/	    r0.w = min(r0.w, r4.x);
/*124*/	    r0.xyz = (-r3.xyzx + r0.xyzx).xyz;
/*125*/	    r0.xyz = (r0.wwww * r0.xyzx + r3.xyzx).xyz;
/*126*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*127*/	    r0.w = inversesqrt(r0.w);
/*128*/	    r3.xyz = (r0.wwww * r0.xyzx).xyz;
/*129*/	  }
/*130*/	}
/*131*/	r0.x = vsOut_T7.y * -r2.x + r2.x;
/*132*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*133*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*134*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*135*/	r4.x = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*136*/	r4.xyz = (-r0.yzwy + r4.xxxx).xyz;
/*137*/	r0.yzw = (vsOut_T7.zzzz * r4.xxyz + r0.yyzw).yzw;
/*138*/	r4.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*139*/	r4.xyz = (-r1.xyzx + r4.xxxx).xyz;
/*140*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r1.xyzx).xyz;
/*141*/	color1.w = saturate(vsOut_T7.z * -r0.x + r0.x);
/*142*/	r0.x = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*143*/	r1.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*144*/	r1.x = inversesqrt(r1.x);
/*145*/	r1.xyz = (r1.xxxx * r3.xyzx).xyz;
/*146*/	color3.x = r1.w / r3.w;
/*147*/	r1.w = max(abs(r1.z), abs(r1.y));
/*148*/	r1.w = max(r1.w, abs(r1.x));
/*149*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*150*/	r2.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*151*/	color0.xyzw = saturate(r2.xyzw);
/*152*/	color1.xyz = saturate(sqrt(r0.yzwy)).xyz;
/*153*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x3c008081u));
/*154*/	color2.xyzw = saturate(r4.xyzw);
/*155*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*156*/	color4 = vsOut_P1;
/*157*/	return;
}
