//
//
// Shader Model 4
// Fragment Shader
//
// id: 1351 - fxc/glsl_SM_3_0_rigidtreebillboard.hlsl_PS_ps30_gbuffer.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_dissolve_map;
uniform sampler2D s_diffuse_map_tree;
uniform sampler2D s_diffuse_burn_map;
uniform sampler2D s_combined_normal_and_displacement;
uniform sampler2D s_snow_normals;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform tree_billboard_constants
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyz = (vsOut_T1.xyzx * vec4(10.000000, 10.000000, 0.250000, 0.000000)).xyz;
/*1*/	r1.xyzw = (texture(s_dissolve_map, r0.xyxx.st)).xyzw;
/*2*/	r0.w = 0;
/*3*/	r2.xw = (vsOut_T1.xxxy).xw;
/*4*/	r2.yz = (vec4(0, 0, 0.250000, 0)).yz;
/*5*/	r0.xy = (r0.zwzz + r2.xyxx).xy;
/*6*/	r0.zw = (r0.zzzw + vsOut_T1.xxxy).zw;
/*7*/	r0.xy = (r0.xyxx + r2.zwzz).xy;
/*8*/	r1.y = uintBitsToFloat((r1.x < vsOut_T1.w) ? 0xffffffffu : 0x00000000u);
/*9*/	r1.y = uintBitsToFloat(floatBitsToUint(r1.y) & uint(0x3f800000u));
/*10*/	r2.xyzw = (texture(s_diffuse_map_tree, r0.zwzz.st)).xyzw;
/*11*/	r3.xyzw = (texture(s_diffuse_map_tree, r0.xyxx.st)).xyzw;
/*12*/	r4.xyzw = (texture(s_diffuse_burn_map, r0.zwzz.st)).xyzw;
/*13*/	r5.xyzw = (texture(s_diffuse_burn_map, r0.xyxx.st)).xyzw;
/*14*/	r4.xyzw = -r2.xyzw + r4.xyzw;
/*15*/	r2.xyzw = vsOut_T3.zzzz * r4.xyzw + r2.xyzw;
/*16*/	r4.xyzw = -r3.xyzw + r5.xyzw;
/*17*/	r3.xyzw = vsOut_T3.zzzz * r4.xyzw + r3.xyzw;
/*18*/	r3.xyzw = -r2.xyzw + r3.xyzw;
/*19*/	r2.xyzw = r1.yyyy * r3.xyzw + r2.xyzw;
/*20*/	r3.xyzw = (texture(s_combined_normal_and_displacement, r0.zwzz.st)).xyzw;
/*21*/	r0.xyzw = (texture(s_combined_normal_and_displacement, r0.xyxx.st)).xyzw;
/*22*/	r0.xyz = (-r3.xyzx + r0.xyzx).xyz;
/*23*/	r0.xyz = (r1.yyyy * r0.xyzx + r3.xyzx).xyz;
/*24*/	r0.xyz = (r0.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*25*/	r3.xz = (-vsOut_T0.xxyx).xz;
/*26*/	r3.y = 0;
/*27*/	r1.yzw = (r0.yyyy * vec4(0.000000, 0.000000, -1.000000, 0.000000)).yzw;
/*28*/	r0.xyw = (r3.xyxz * r0.xxxx + r1.yzyw).xyw;
/*29*/	r3.xz = (vsOut_T0.zzwz).xz;
/*30*/	r3.y = 0;
/*31*/	r0.xyz = (r3.xyzx * r0.zzzz + r0.xywx).xyz;
/*32*/	r1.yzw = (r2.xxyz / r2.wwww).yzw;
/*33*/	r0.w = r1.x + -vsOut_T3.y;
/*34*/	r1.x = r2.w + -0.500000;
/*35*/	r0.w = min(r0.w, r1.x);
/*36*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*37*/	if(r0.w != 0) discard;
/*38*/	r0.w = uintBitsToFloat((vsOut_T3.x < 0.500000) ? 0xffffffffu : 0x00000000u);
/*39*/	r1.x = vsOut_T3.x + vsOut_T3.x;
/*40*/	r2.xyz = (-cb2.data[0].xyzx + cb2.data[1].xyzx).xyz;
/*41*/	r2.xyz = (r1.xxxx * r2.xyzx + cb2.data[0].xyzx).xyz;
/*42*/	r1.x = vsOut_T3.x + -0.500000;
/*43*/	r1.x = r1.x + r1.x;
/*44*/	r3.xyz = (-cb2.data[1].xyzx + cb2.data[2].xyzx).xyz;
/*45*/	r3.xyz = (r1.xxxx * r3.xyzx + cb2.data[1].xyzx).xyz;
/*46*/	r2.xyz = (mix(r3.xyzx, r2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*47*/	r3.xyz = (r1.yzwy * r2.xyzx).xyz;
/*48*/	r4.xyz = (vsOut_T2.xyzx).xyz;
/*49*/	r4.w = 1.000000;
/*50*/	r0.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*51*/	r1.x = dot(r4.xyzw, cb0.data[12].xyzw);
/*52*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*53*/	if(floatBitsToUint(r2.w) != 0u) {
/*54*/	  r4.xyz = (r0.xyzx + vec4(0.000000, 0.100000, 0.000000, 0.000000)).xyz;
/*55*/	  r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*56*/	  r2.w = inversesqrt(r2.w);
/*57*/	  r5.xy = (vsOut_T2.xzxx * vec4(0.000500, 0.000500, 0.000000, 0.000000)).xy;
/*58*/	  r5.xyzw = (texture(s_snow_normals, r5.xyxx.st)).xyzw;
/*59*/	  r5.xy = (r5.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*60*/	  r5.xz = (r5.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*61*/	  r3.w = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*62*/	  r3.w = -r3.w + 1.000000;
/*63*/	  r3.w = max(r3.w, 0.000000);
/*64*/	  r5.y = sqrt(r3.w);
/*65*/	  r5.xyz = (r5.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000)).xyz;
/*66*/	  r4.xyz = (r4.xyzx * r2.wwww + r5.xyzx).xyz;
/*67*/	  r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*68*/	  r2.w = inversesqrt(r2.w);
/*69*/	  r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*70*/	  r5.xz = (cb1.data[0].xxyx).xz/**/;
/*71*/	  r5.y = -1.000000;
/*72*/	  r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*73*/	  r2.w = inversesqrt(r2.w);
/*74*/	  r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*75*/	  r2.w = saturate(dot(vec3(-r5.xyzx), vec3(r4.xyzx)));
/*76*/	  r3.w = cb1.data[1].x * cb1.data[1].x;
/*77*/	  r3.w = r3.w * 1.250000;
/*78*/	  r3.w = min(r3.w, 1.000000);
/*79*/	  r4.x = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*80*/	  r4.x = r4.x * 4.000000;
/*81*/	  r3.w = r3.w * 0.200000 + r4.x;
/*82*/	  r3.w = r3.w * -0.700000 + 1.000000;
/*83*/	  r2.w = r2.w + -r3.w;
/*84*/	  r2.w = saturate(r2.w * 200.000000);
/*85*/	  r3.w = r2.w * -2.000000 + 3.000000;
/*86*/	  r2.w = r2.w * r2.w;
/*87*/	  r2.w = r2.w * r3.w;
/*88*/	  r4.w = r2.w * 0.200000;
/*89*/	  r1.yzw = (-r1.yyzw * r2.xxyz + vec4(0.000000, 0.400000, 0.400000, 0.400000)).yzw;
/*90*/	  r3.xyz = (r2.wwww * r1.yzwy + r3.xyzx).xyz;
/*91*/	} else {
/*92*/	  r4.w = 0;
/*93*/	}
/*94*/	r1.y = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*95*/	r1.y = inversesqrt(r1.y);
/*96*/	r0.xyz = (r0.xyzx * r1.yyyy).xyz;
/*97*/	color3.x = r0.w / r1.x;
/*98*/	r0.w = max(abs(r0.z), abs(r0.y));
/*99*/	r0.w = max(r0.w, abs(r0.x));
/*100*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*101*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*102*/	color0.w = 0;
/*103*/	r4.xyz = (sqrt(r3.xyzx)).xyz;
/*104*/	color1.xyzw = min(r4.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*105*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*106*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*107*/	color4 = uint(0);
/*108*/	return;
}
