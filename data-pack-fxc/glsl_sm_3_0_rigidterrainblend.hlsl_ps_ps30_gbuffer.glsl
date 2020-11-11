//
//
// Shader Model 4
// Fragment Shader
//
// id: 795 - fxc/glsl_SM_3_0_rigidterrainblend.hlsl_PS_ps30_gbuffer.glsl
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
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
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
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  color4 = uint(0);
  vec4 r0;
  vec4 r1;
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
/*4*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*5*/	r3.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*6*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*7*/	r1.w = saturate(vsOut_N0.w);
/*8*/	r4.xyz = (r4.xyzx + -cb3.data[0].xyzx).xyz;
/*9*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[0].xyzx).xyz;
/*10*/	r3.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw;
/*11*/	r3.xyw = (r3.xyxw + -cb3.data[1].xyxz).xyw;
/*12*/	r3.xyw = (r1.wwww * r3.xyxw + cb3.data[1].xyxz).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*14*/	r5.xyz = (r5.xyzx + -cb3.data[2].xyzx).xyz;
/*15*/	r5.xyz = (r1.wwww * r5.xyzx + cb3.data[2].xyzx).xyz;
/*16*/	r4.xyz = (r4.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*17*/	r0.xyz = (r2.xxxx * r4.xyzx + r0.xyzx).xyz;
/*18*/	r3.xyz = (r3.xywx * r0.xyzx + -r0.xyzx).xyz;
/*19*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*20*/	r2.xyw = (r5.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*21*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*22*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*23*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*24*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*26*/	r1.w = -r1.w + 1.000000;
/*27*/	r1.w = max(r1.w, 0.000000);
/*28*/	r2.z = sqrt(r1.w);
/*29*/	r2.xyz = (mix(r2.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*30*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*31*/	r3.w = 1.000000;
/*32*/	r1.w = dot(r3.xyzw, cb0.data[11].xyzw);
/*33*/	r2.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*34*/	r3.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*35*/	r3.x = inversesqrt(r3.x);
/*36*/	r3.xyz = (r3.xxxx * vsOut_T3.xyzx).xyz;
/*37*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*38*/	r3.w = inversesqrt(r3.w);
/*39*/	r4.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*40*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*41*/	r3.w = inversesqrt(r3.w);
/*42*/	r5.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*43*/	r6.xyz = (r2.yyyy * r4.xyzx).xyz;
/*44*/	r6.xyz = (r2.xxxx * r3.xyzx + r6.xyzx).xyz;
/*45*/	r2.xyz = (r2.zzzz * r5.xyzx + r6.xyzx).xyz;
/*46*/	r3.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*47*/	r3.w = inversesqrt(r3.w);
/*48*/	r2.xyz = (r2.xyzx * r3.wwww).xyz;
/*49*/	r2.xyz = (mix(r2.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*50*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*51*/	if(floatBitsToUint(r0.w) != 0u) {
/*52*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*53*/	  if(floatBitsToUint(r0.w) != 0u) {
/*54*/	    r6.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*55*/	    r7.xyzw = (texture(s_snow_normals, r6.xyxx.st)).xyzw;
/*56*/	    r6.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*57*/	    r7.xy = (r6.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	    r0.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*59*/	    r0.w = -r0.w + 1.000000;
/*60*/	    r0.w = max(r0.w, 0.000000);
/*61*/	    r7.z = sqrt(r0.w);
/*62*/	    r8.xyz = (r7.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r2.xyzx).xyz;
/*63*/	    r0.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*64*/	    r0.w = inversesqrt(r0.w);
/*65*/	    r8.xyz = (r0.wwww * r8.xyzx).xyz;
/*66*/	    r9.xz = (cb1.data[0].xxyx).xz/**/;
/*67*/	    r9.y = -1.000000;
/*68*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*69*/	    r0.w = inversesqrt(r0.w);
/*70*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*71*/	    r0.w = saturate(dot(vec3(-r9.xyzx), vec3(r8.xyzx)));
/*72*/	    r3.w = cb1.data[1].x * cb1.data[1].x;
/*73*/	    r3.w = r3.w * 1.250000;
/*74*/	    r3.w = min(r3.w, 1.000000);
/*75*/	    r4.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*76*/	    r4.w = r4.w * 4.000000;
/*77*/	    r3.w = r3.w * 0.200000 + r4.w;
/*78*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*79*/	    r0.w = r0.w + -r3.w;
/*80*/	    r0.w = saturate(r0.w * 200.000000);
/*81*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*82*/	    r0.w = r0.w * r0.w;
/*83*/	    r0.w = r0.w * r3.w;
/*84*/	    r8.w = r0.w * -vsOut_C2.w + vsOut_C2.w;
/*85*/	    r3.w = -vsOut_C2.w + 0.200000;
/*86*/	    r3.w = r0.w * r3.w + vsOut_C2.w;
/*87*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*88*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*89*/	    r9.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*90*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*91*/	    r6.xyzw = (texture(s_snow_normals, r6.zwzz.st)).xyzw;
/*92*/	    r6.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*93*/	    r6.xy = (r6.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*94*/	    r4.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*95*/	    r4.w = -r4.w + 1.000000;
/*96*/	    r4.w = max(r4.w, 0.000000);
/*97*/	    r6.z = sqrt(r4.w);
/*98*/	    r7.xyz = (r7.xyzx + r7.xyzx).xyz;
/*99*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*100*/	    r4.w = sqrt(r4.w);
/*101*/	    r6.xyz = (r7.xyzx * r4.wwww + r6.xyzx).xyz;
/*102*/	    r4.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*103*/	    r4.w = inversesqrt(r4.w);
/*104*/	    r6.xyz = (r4.wwww * r6.xyzx).xyz;
/*105*/	    r4.xyz = (r4.xyzx * r6.yyyy).xyz;
/*106*/	    r3.xyz = (r6.xxxx * r3.xyzx + r4.xyzx).xyz;
/*107*/	    r3.xyz = (r6.zzzz * r5.xyzx + r3.xyzx).xyz;
/*108*/	    r4.x = -r2.y + 1.000000;
/*109*/	    r0.w = min(r0.w, r4.x);
/*110*/	    r3.xyz = (-r2.xyzx + r3.xyzx).xyz;
/*111*/	    r3.xyz = (r0.wwww * r3.xyzx + r2.xyzx).xyz;
/*112*/	    r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r2.xyz = (r0.wwww * r3.xyzx).xyz;
/*115*/	  } else {
/*116*/	    r8.w = vsOut_C2.w;
/*117*/	    r3.w = vsOut_C2.w;
/*118*/	  }
/*119*/	} else {
/*120*/	  r8.w = vsOut_C2.w;
/*121*/	  r3.w = vsOut_C2.w;
/*122*/	}
/*123*/	r0.w = vsOut_T7.y * -r3.w + r3.w;
/*124*/	r3.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*125*/	r3.xyz = (-r0.xyzx + r3.xyzx).xyz;
/*126*/	r0.xyz = saturate(vsOut_T7.yyyy * r3.xyzx + r0.xyzx).xyz;
/*127*/	r3.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*128*/	r3.xyz = (-r0.xyzx + r3.xxxx).xyz;
/*129*/	r0.xyz = (vsOut_T7.zzzz * r3.xyzx + r0.xyzx).xyz;
/*130*/	r3.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*131*/	r3.xyz = (-r1.xyzx + r3.xxxx).xyz;
/*132*/	r3.xyz = (vsOut_T7.zzzz * r3.xyzx + r1.xyzx).xyz;
/*133*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*134*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*135*/	r1.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*136*/	r1.x = inversesqrt(r1.x);
/*137*/	r1.xyz = (r1.xxxx * r2.xyzx).xyz;
/*138*/	color3.x = r1.w / r2.w;
/*139*/	r1.w = max(abs(r1.z), abs(r1.y));
/*140*/	r1.w = max(r1.w, abs(r1.x));
/*141*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*142*/	r8.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*143*/	color0.xyzw = saturate(r8.xyzw);
/*144*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*145*/	r3.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*146*/	color2.xyzw = saturate(r3.xyzw);
/*147*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*148*/	color4 = vsOut_P1;
/*149*/	return;
}
