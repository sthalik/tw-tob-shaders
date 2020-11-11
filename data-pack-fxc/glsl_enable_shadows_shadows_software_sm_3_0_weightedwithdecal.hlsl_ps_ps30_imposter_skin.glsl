//
//
// Shader Model 4
// Fragment Shader
//
// id: 6053 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_weightedwithdecal.hlsl_PS_ps30_imposter_skin.glsl
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
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_mask;

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
/*11*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*12*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r1.xyxx)) * 0xffffffffu)).xy;
/*13*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r2.x));
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*16*/	r1.xyzw = (texture(s_decal_diffuse, r1.xyxx.st)).xyzw;
/*17*/	if(floatBitsToUint(r0.w) != 0u) {
/*18*/	  r2.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*19*/	  r1.xyz = (r1.xyzx * r2.wwww).xyz;
/*20*/	  r0.w = -r1.w * r2.w + 1.000000;
/*21*/	  r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*22*/	}
/*23*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*24*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*25*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*26*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*27*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*28*/	r0.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*29*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*30*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*31*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*32*/	color0.w = 1.000000;
/*33*/	return;
}
