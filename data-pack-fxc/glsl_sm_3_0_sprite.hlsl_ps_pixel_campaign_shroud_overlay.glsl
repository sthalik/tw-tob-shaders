//
//
// Shader Model 4
// Fragment Shader
//
// id: 183 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_campaign_shroud_overlay.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;
in vec4 vsOut_T4;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_campaign_shroud_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform sprite_PS
{
  vec4 data[3];
} cb1;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*1*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*5*/	if(r0.x != 0) discard;
/*6*/	r0.xy = (-cb1.data[1].zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.yz = (vsOut_T0.zzwz * r0.xxyx + cb1.data[1].zzwz).yz;
/*8*/	r0.xw = (-r0.zzzz + vec4(1.000000, 0.000000, 0.000000, 1.000000)).xw;
/*9*/	r0.xyzw = (textureLod(s_campaign_shroud_map, r0.ywyy.st, r0.x)).xyzw;
/*10*/	r0.yw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.500000, 0.000000, 0.500000), cb1.data[0].zzzw)) * 0xffffffffu)).yw;
/*11*/	r0.x = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.x : r0.z;
/*12*/	r0.x = r0.x + -0.500000;
/*13*/	r0.xz = (r0.xxxx * vec4(1.500000, 0.000000, 1.500000, 0.000000) + vec4(0.500000, 0.000000, 0.200000, 0.000000)).xz;
/*14*/	r1.x = r0.z * 5.263158;
/*15*/	r1.yz = (uintBitsToFloat(uvec4(lessThan(r0.xxzx, vec4(0.000000, 0.300000, 0.038000, 0.000000))) * 0xffffffffu)).yz;
/*16*/	r0.x = uintBitsToFloat((0.490000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*17*/	r0.z = (floatBitsToUint(r1.z) > 0x00000000u) ? 0.200000 : r1.x;
/*18*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.z;
/*19*/	r0.x = (floatBitsToUint(r1.y) > 0x00000000u) ? 0.200000 : r0.x;
/*20*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*21*/	r0.z = saturate(r1.x);
/*22*/	r0.z = log2(r0.z);
/*23*/	r0.z = r0.z * cb0.data[0].z;
/*24*/	r2.w = exp2(r0.z);
/*25*/	r2.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*26*/	r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xz;
/*27*/	r1.xyzw = mix(r1.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*28*/	r1.xyzw = r1.xyzw * vsOut_C0.xyzw;
/*29*/	r0.y = r1.w * r0.x + -0.003922;
/*30*/	r0.x = r0.x * r1.w;
/*31*/	r1.xyz = saturate(r1.xyzx).xyz;
/*32*/	r1.xyz = (log2(r1.xyzx)).xyz;
/*33*/	r1.xyz = (r1.xyzx * cb0.data[0].zzzz).xyz;
/*34*/	color0.xyz = (exp2(r1.xyzx)).xyz;
/*35*/	color0.w = r0.x;
/*36*/	r0.x = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*37*/	if(r0.x != 0) discard;
/*38*/	return;
}
