//
//
// Shader Model 4
// Fragment Shader
//
// id: 650 - fxc/glsl_SM_3_0_rigidstandard.hlsl_PS_ps30_gbuffer.glsl
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
/*35*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*36*/	r4.x = inversesqrt(r4.x);
/*37*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*38*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*39*/	r4.w = inversesqrt(r4.w);
/*40*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*41*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*42*/	r4.w = inversesqrt(r4.w);
/*43*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*44*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*45*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*46*/	r3.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*47*/	r4.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*48*/	r4.w = inversesqrt(r4.w);
/*49*/	r3.xyz = (r3.xyzx * r4.wwww).xyz;
/*50*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*51*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*52*/	if(floatBitsToUint(r0.w) != 0u) {
/*53*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*54*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*55*/	  r0.w = r7.y * cb0.data[26].x;
/*56*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*57*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*58*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*59*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*60*/	  r2.xw = (r2.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*61*/	}
/*62*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*63*/	if(floatBitsToUint(r0.w) != 0u) {
/*64*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*65*/	  if(floatBitsToUint(r0.w) != 0u) {
/*66*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*67*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*68*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*69*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*70*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*71*/	    r0.w = -r0.w + 1.000000;
/*72*/	    r0.w = max(r0.w, 0.000000);
/*73*/	    r8.z = sqrt(r0.w);
/*74*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*75*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*76*/	    r0.w = inversesqrt(r0.w);
/*77*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*78*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*79*/	    r10.y = -1.000000;
/*80*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*81*/	    r0.w = inversesqrt(r0.w);
/*82*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*83*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*84*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*85*/	    r4.w = r4.w * 1.250000;
/*86*/	    r4.w = min(r4.w, 1.000000);
/*87*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*88*/	    r5.w = r5.w * 4.000000;
/*89*/	    r4.w = r4.w * 0.200000 + r5.w;
/*90*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*91*/	    r0.w = r0.w + -r4.w;
/*92*/	    r0.w = saturate(r0.w * 200.000000);
/*93*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*94*/	    r0.w = r0.w * r0.w;
/*95*/	    r0.w = r0.w * r4.w;
/*96*/	    r2.w = r0.w * -r2.w + r2.w;
/*97*/	    r4.w = -r2.x + 0.200000;
/*98*/	    r2.x = r0.w * r4.w + r2.x;
/*99*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*100*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*101*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*102*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*103*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*104*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*105*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*106*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*107*/	    r4.w = -r4.w + 1.000000;
/*108*/	    r4.w = max(r4.w, 0.000000);
/*109*/	    r7.z = sqrt(r4.w);
/*110*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*111*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*112*/	    r4.w = sqrt(r4.w);
/*113*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*114*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*115*/	    r4.w = inversesqrt(r4.w);
/*116*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*117*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*118*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*119*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*120*/	    r4.w = -r3.y + 1.000000;
/*121*/	    r0.w = min(r0.w, r4.w);
/*122*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*123*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*124*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*125*/	    r0.w = inversesqrt(r0.w);
/*126*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*127*/	  }
/*128*/	}
/*129*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*130*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*131*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*132*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*133*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*134*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*135*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*136*/	r4.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*137*/	r4.xyz = (-r1.xyzx + r4.xxxx).xyz;
/*138*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r1.xyzx).xyz;
/*139*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*140*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*141*/	r1.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*142*/	r1.x = inversesqrt(r1.x);
/*143*/	r1.xyz = (r1.xxxx * r3.xyzx).xyz;
/*144*/	color3.x = r1.w / r3.w;
/*145*/	r1.w = max(abs(r1.z), abs(r1.y));
/*146*/	r1.w = max(r1.w, abs(r1.x));
/*147*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*148*/	r2.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*149*/	color0.xyzw = saturate(r2.xyzw);
/*150*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*151*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*152*/	color2.xyzw = saturate(r4.xyzw);
/*153*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*154*/	color4 = vsOut_P1;
/*155*/	return;
}
