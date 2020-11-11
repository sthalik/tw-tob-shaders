//
//
// Shader Model 4
// Fragment Shader
//
// id: 1174 - fxc/glsl_SM_3_0_rigidwithdirtmesh.hlsl_PS_ps30_gbuffer.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*35*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r4.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*37*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*38*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r4.z = r4.w * r5.w;
/*40*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*41*/	r0.xyz = (r4.zzzz * r5.xyzx + r0.xyzx).xyz;
/*42*/	r3.xy = (r4.xyxx * r4.wwww + r3.xyxx).xy;
/*43*/	r4.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*44*/	r4.x = inversesqrt(r4.x);
/*45*/	r3.xyz = (r3.xyzx * r4.xxxx).xyz;
/*46*/	r4.xyz = (r1.xyzx * r4.zzzz).xyz;
/*47*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*48*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*49*/	r4.x = inversesqrt(r4.x);
/*50*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*51*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*52*/	r4.w = inversesqrt(r4.w);
/*53*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*54*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*55*/	r4.w = inversesqrt(r4.w);
/*56*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*57*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*58*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*59*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*60*/	r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*61*/	r4.w = inversesqrt(r4.w);
/*62*/	r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*63*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*64*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*65*/	if(floatBitsToUint(r0.w) != 0u) {
/*66*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*67*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*68*/	  r0.w = r7.y * cb0.data[26].x;
/*69*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*70*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*71*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*72*/	  r1.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*73*/	  r2.xw = (r2.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*74*/	}
/*75*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*76*/	if(floatBitsToUint(r0.w) != 0u) {
/*77*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*78*/	  if(floatBitsToUint(r0.w) != 0u) {
/*79*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*80*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*81*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*82*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*83*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*84*/	    r0.w = -r0.w + 1.000000;
/*85*/	    r0.w = max(r0.w, 0.000000);
/*86*/	    r8.z = sqrt(r0.w);
/*87*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*88*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*89*/	    r0.w = inversesqrt(r0.w);
/*90*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*91*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*92*/	    r10.y = -1.000000;
/*93*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*94*/	    r0.w = inversesqrt(r0.w);
/*95*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*96*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*97*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*98*/	    r4.w = r4.w * 1.250000;
/*99*/	    r4.w = min(r4.w, 1.000000);
/*100*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*101*/	    r5.w = r5.w * 4.000000;
/*102*/	    r4.w = r4.w * 0.200000 + r5.w;
/*103*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*104*/	    r0.w = r0.w + -r4.w;
/*105*/	    r0.w = saturate(r0.w * 200.000000);
/*106*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*107*/	    r0.w = r0.w * r0.w;
/*108*/	    r0.w = r0.w * r4.w;
/*109*/	    r2.w = r0.w * -r2.w + r2.w;
/*110*/	    r4.w = -r2.x + 0.200000;
/*111*/	    r2.x = r0.w * r4.w + r2.x;
/*112*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*113*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*114*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*115*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*116*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*117*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*118*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*119*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*120*/	    r4.w = -r4.w + 1.000000;
/*121*/	    r4.w = max(r4.w, 0.000000);
/*122*/	    r7.z = sqrt(r4.w);
/*123*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*124*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*125*/	    r4.w = sqrt(r4.w);
/*126*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*127*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*128*/	    r4.w = inversesqrt(r4.w);
/*129*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*130*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*131*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*132*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*133*/	    r4.w = -r3.y + 1.000000;
/*134*/	    r0.w = min(r0.w, r4.w);
/*135*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*136*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*137*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*138*/	    r0.w = inversesqrt(r0.w);
/*139*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*140*/	  }
/*141*/	}
/*142*/	r0.w = vsOut_T7.y * -r2.x + r2.x;
/*143*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*144*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*145*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*146*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*147*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*148*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*149*/	r4.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*150*/	r4.xyz = (-r1.xyzx + r4.xxxx).xyz;
/*151*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r1.xyzx).xyz;
/*152*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*153*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*154*/	r1.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*155*/	r1.x = inversesqrt(r1.x);
/*156*/	r1.xyz = (r1.xxxx * r3.xyzx).xyz;
/*157*/	color3.x = r1.w / r3.w;
/*158*/	r1.w = max(abs(r1.z), abs(r1.y));
/*159*/	r1.w = max(r1.w, abs(r1.x));
/*160*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*161*/	r2.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*162*/	color0.xyzw = saturate(r2.xyzw);
/*163*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*164*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*165*/	color2.xyzw = saturate(r4.xyzw);
/*166*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*167*/	color4 = vsOut_P1;
/*168*/	return;
}
