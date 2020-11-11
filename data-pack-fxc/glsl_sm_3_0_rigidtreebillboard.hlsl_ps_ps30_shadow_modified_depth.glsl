//
//
// Shader Model 4
// Fragment Shader
//
// id: 1344 - fxc/glsl_SM_3_0_rigidtreebillboard.hlsl_PS_ps30_shadow_modified_depth.glsl
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

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_dissolve_map;
uniform sampler2D s_diffuse_map_tree;
uniform sampler2D s_diffuse_burn_map;
uniform sampler2D s_combined_normal_and_displacement;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform tree_billboard_constants
{
  vec4 data[4];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xw = (vsOut_T0.xxxy).xw;
/*1*/	r0.yz = (vec4(0, 0, 0.250000, 0)).yz;
/*2*/	r1.w = 0;
/*3*/	r1.xyz = (vsOut_T0.xyzx * vec4(10.000000, 10.000000, 0.250000, 0.000000)).xyz;
/*4*/	r0.xy = (r0.xyxx + r1.zwzz).xy;
/*5*/	r1.zw = (r1.zzzw + vsOut_T0.xxxy).zw;
/*6*/	r2.xyzw = (texture(s_dissolve_map, r1.xyxx.st)).xyzw;
/*7*/	r0.xy = (r0.xyxx + r0.zwzz).xy;
/*8*/	r3.xyzw = (texture(s_diffuse_burn_map, r0.xyxx.st)).xyzw;
/*9*/	r4.xyzw = (texture(s_diffuse_map_tree, r0.xyxx.st)).xyzw;
/*10*/	r0.xyzw = (texture(s_combined_normal_and_displacement, r0.xyxx.st)).xyzw;
/*11*/	r0.x = r3.w + -r4.w;
/*12*/	r0.x = vsOut_T2.w * r0.x + r4.w;
/*13*/	r3.xyzw = (texture(s_diffuse_burn_map, r1.zwzz.st)).xyzw;
/*14*/	r4.xyzw = (texture(s_diffuse_map_tree, r1.zwzz.st)).xyzw;
/*15*/	r1.xyzw = (texture(s_combined_normal_and_displacement, r1.zwzz.st)).xyzw;
/*16*/	r0.y = r3.w + -r4.w;
/*17*/	r0.y = vsOut_T2.w * r0.y + r4.w;
/*18*/	r0.x = -r0.y + r0.x;
/*19*/	r0.z = uintBitsToFloat((r2.x < vsOut_T0.w) ? 0xffffffffu : 0x00000000u);
/*20*/	r1.x = r2.x + -vsOut_T2.x;
/*21*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & uint(0x3f800000u));
/*22*/	r0.x = r0.z * r0.x + r0.y;
/*23*/	r0.x = r0.x + -0.500000;
/*24*/	r0.x = min(r0.x, r1.x);
/*25*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*26*/	if(r0.x != 0) discard;
/*27*/	r0.x = r0.w + -r1.w;
/*28*/	r0.x = r0.z * r0.x + r1.w;
/*29*/	r0.x = r0.x * 2.000000 + -1.000000;
/*30*/	r1.xz = (vsOut_T2.yyzy).xz;
/*31*/	r1.y = vsOut_T1.w;
/*32*/	r0.xyz = (r0.xxxx * r1.xyzx).xyz;
/*33*/	r1.xz = (vsOut_T1.wwww).xz;
/*34*/	r1.y = cb1.data[3].x/**/;
/*35*/	r0.xyz = (r0.xyzx * r1.xyzx).xyz;
/*36*/	r1.xz = (cb1.data[3].xxxx).xz/**/;
/*37*/	r1.y = 0;
/*38*/	r0.xyz = (r0.xyzx * r1.xyzx + vsOut_T1.xyzx).xyz;
/*39*/	r0.w = 1.000000;
/*40*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*41*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*42*/	r0.x = r1.x / r0.x;
/*43*/	r0.x = r0.x * 0.500000 + 0.500000;
/*44*/	color0.x = r0.x;
/*45*/	gl_FragDepth = (r0.x);
/*46*/	color0.yzw = (vec4(0, 0, 0, 1.000000)).yzw;
/*47*/	return;
}
