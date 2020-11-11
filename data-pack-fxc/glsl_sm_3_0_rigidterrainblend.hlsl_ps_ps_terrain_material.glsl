//
//
// Shader Model 4
// Fragment Shader
//
// id: 792 - fxc/glsl_SM_3_0_rigidterrainblend.hlsl_PS_ps_terrain_material.glsl
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
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_snow_normals;

layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb2;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb1.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*5*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*6*/	r1.w = saturate(vsOut_N0.w);
/*7*/	r3.xyz = (r3.xyzx + -cb2.data[0].xyzx).xyz;
/*8*/	r3.xyz = (r1.wwww * r3.xyzx + cb2.data[0].xyzx).xyz;
/*9*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*10*/	r2.xyw = (r2.xyxw + -cb2.data[1].xyxz).xyw;
/*11*/	r2.xyw = (r1.wwww * r2.xyxw + cb2.data[1].xyxz).xyw;
/*12*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*13*/	r4.xyz = (r4.xyzx + -cb2.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r1.wwww * r4.xyzx + cb2.data[2].xyzx).xyz;
/*15*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*17*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*20*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*21*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*22*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*23*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*25*/	r1.w = -r1.w + 1.000000;
/*26*/	r1.w = max(r1.w, 0.000000);
/*27*/	r1.z = sqrt(r1.w);
/*28*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*29*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*30*/	r1.w = inversesqrt(r1.w);
/*31*/	r2.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*32*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*33*/	r1.w = inversesqrt(r1.w);
/*34*/	r3.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*35*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r4.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*38*/	r5.xyz = (r1.yyyy * r3.xyzx).xyz;
/*39*/	r1.xyw = (r1.xxxx * r2.xyxz + r5.xyxz).xyw;
/*40*/	r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*41*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*42*/	r1.w = inversesqrt(r1.w);
/*43*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*44*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*45*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*46*/	if(floatBitsToUint(r0.w) != 0u) {
/*47*/	  r0.w = uintBitsToFloat((0.000000 < cb0.data[1].x) ? 0xffffffffu : 0x00000000u);
/*48*/	  if(floatBitsToUint(r0.w) != 0u) {
/*49*/	    r5.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*50*/	    r6.xyzw = (texture(s_snow_normals, r5.xyxx.st)).xyzw;
/*51*/	    r5.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*52*/	    r6.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*53*/	    r0.w = dot(vec2(r6.xyxx), vec2(r6.xyxx));
/*54*/	    r0.w = -r0.w + 1.000000;
/*55*/	    r0.w = max(r0.w, 0.000000);
/*56*/	    r6.z = sqrt(r0.w);
/*57*/	    r7.xyz = (r6.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*58*/	    r0.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*59*/	    r0.w = inversesqrt(r0.w);
/*60*/	    r7.xyz = (r0.wwww * r7.xyzx).xyz;
/*61*/	    r8.xz = (cb0.data[0].xxyx).xz/**/;
/*62*/	    r8.y = -1.000000;
/*63*/	    r0.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*64*/	    r0.w = inversesqrt(r0.w);
/*65*/	    r8.xyz = (r0.wwww * r8.xyzx).xyz;
/*66*/	    r0.w = saturate(dot(vec3(-r8.xyzx), vec3(r7.xyzx)));
/*67*/	    r1.w = cb0.data[1].x * cb0.data[1].x;
/*68*/	    r1.w = r1.w * 1.250000;
/*69*/	    r1.w = min(r1.w, 1.000000);
/*70*/	    r2.w = saturate(cb0.data[1].x * cb0.data[1].x + -0.800000);
/*71*/	    r2.w = r2.w * 4.000000;
/*72*/	    r1.w = r1.w * 0.200000 + r2.w;
/*73*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*74*/	    r0.w = r0.w + -r1.w;
/*75*/	    r0.w = saturate(r0.w * 200.000000);
/*76*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*77*/	    r0.w = r0.w * r0.w;
/*78*/	    r0.w = r0.w * r1.w;
/*79*/	    r1.w = -vsOut_C2.w + 0.200000;
/*80*/	    r1.w = r0.w * r1.w + vsOut_C2.w;
/*81*/	    r7.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*82*/	    r0.xyz = (r0.wwww * r7.xyzx + r0.xyzx).xyz;
/*83*/	    r5.xyzw = (texture(s_snow_normals, r5.zwzz.st)).xyzw;
/*84*/	    r5.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*85*/	    r5.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*86*/	    r2.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*87*/	    r2.w = -r2.w + 1.000000;
/*88*/	    r2.w = max(r2.w, 0.000000);
/*89*/	    r5.z = sqrt(r2.w);
/*90*/	    r6.xyz = (r6.xyzx + r6.xyzx).xyz;
/*91*/	    r2.w = dot(vec2(cb0.data[0].xyxx), vec2(cb0.data[0].xyxx));
/*92*/	    r2.w = sqrt(r2.w);
/*93*/	    r5.xyz = (r6.xyzx * r2.wwww + r5.xyzx).xyz;
/*94*/	    r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*95*/	    r2.w = inversesqrt(r2.w);
/*96*/	    r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*97*/	    r3.xyz = (r3.xyzx * r5.yyyy).xyz;
/*98*/	    r2.xyz = (r5.xxxx * r2.xyzx + r3.xyzx).xyz;
/*99*/	    r2.xyz = (r5.zzzz * r4.xyzx + r2.xyzx).xyz;
/*100*/	    r2.w = -r1.y + 1.000000;
/*101*/	    r0.w = min(r0.w, r2.w);
/*102*/	    r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*103*/	    r2.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*104*/	    r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*105*/	    r0.w = inversesqrt(r0.w);
/*106*/	    r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*107*/	  } else {
/*108*/	    r1.w = vsOut_C2.w;
/*109*/	  }
/*110*/	} else {
/*111*/	  r1.w = vsOut_C2.w;
/*112*/	}
/*113*/	r0.w = vsOut_T7.y * -r1.w + r1.w;
/*114*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*115*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*116*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.xyzx + r0.xyzx).xyz;
/*117*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*118*/	r2.xyz = (-r0.xyzx + r1.wwww).xyz;
/*119*/	r0.xyz = (vsOut_T7.zzzz * r2.xyzx + r0.xyzx).xyz;
/*120*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*121*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*122*/	r1.w = inversesqrt(r1.w);
/*123*/	color1.xyz = (r1.wwww * r1.xyzx).xyz;
/*124*/	r0.w = r0.w * 10.000000;
/*125*/	color0.xyz = (r0.wwww * r0.xyzx).xyz;
/*126*/	color0.w = r0.w;
/*127*/	color1.w = r0.w;
/*128*/	color2.xyzw = vec4(0, 0, 0, 0);
/*129*/	return;
}
