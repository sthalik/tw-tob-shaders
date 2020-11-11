//
//
// Shader Model 4
// Fragment Shader
//
// id: 6118 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_weightedwithdecaldirt.hlsl_PS_ps30_imposter_skin_40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T4;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2DArray s_decal_diffuse;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
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
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb2.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xy = (-cb1.data[3].xyxx + cb1.data[3].zwzz).xy;
/*9*/	r1.zw = (vsOut_T1.xxxy + -cb1.data[3].xxxy).zw;
/*10*/	r1.xy = (r1.zwzz / r1.xyxx).xy;
/*11*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*12*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r1.xxxy)) * 0xffffffffu)).zw;
/*13*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r2.x));
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*16*/	r1.z = vsOut_T6.z;
/*17*/	r1.xyzw = (texture(s_decal_diffuse, r1.xyzx.stp)).xyzw;
/*18*/	if(floatBitsToUint(r0.w) != 0u) {
/*19*/	  r2.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*20*/	  r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*21*/	  r0.w = -r1.w * r2.w + 1.000000;
/*22*/	  r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*23*/	}
/*24*/	r1.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r1.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r2.xyzw = (texture(s_decal_dirt_map, r1.xyxx.st)).xyzw;
/*27*/	r0.w = r1.w * r2.w;
/*28*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*29*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*30*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*31*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*32*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*33*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*34*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*35*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*36*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*37*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*38*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*39*/	color0.w = 1.000000;
/*40*/	return;
}
