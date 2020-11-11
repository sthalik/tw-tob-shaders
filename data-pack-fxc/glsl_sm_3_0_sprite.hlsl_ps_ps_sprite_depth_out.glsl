//
//
// Shader Model 4
// Fragment Shader
//
// id: 132 - fxc/glsl_SM_3_0_sprite.hlsl_PS_ps_sprite_depth_out.glsl
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
in vec4 vsOut_T1;
in vec4 vsOut_T2;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;

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

/*0*/	r0.xy = (-vsOut_T1.xwxx + vsOut_T2.xyxx).xy;
/*1*/	r0.zw = (vsOut_T1.zzzy + -vsOut_T2.xxxy).zw;
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*5*/	if(r0.x != 0) discard;
/*6*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*7*/	r0.x = saturate(r0.x);
/*8*/	r0.x = log2(r0.x);
/*9*/	r0.x = r0.x * cb0.data[0].z;
/*10*/	r0.x = exp2(r0.x);
/*11*/	r0.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.500000, 0.000000, 0.000000), cb1.data[0].zzzz)) * 0xffffffffu)).yz;
/*12*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : r0.w;
/*13*/	r0.x = r0.x * vsOut_C0.w;
/*14*/	r0.yw = (uintBitsToFloat(uvec4(equal(vsOut_T0.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).yw;
/*15*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.y));
/*16*/	r0.y = (floatBitsToUint(r0.z) > 0x00000000u) ? 0 : r0.y;
/*17*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? vsOut_C0.w : r0.x;
/*18*/	r0.y = r0.x + -0.003922;
/*19*/	color0.w = r0.x;
/*20*/	r0.x = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(r0.x != 0) discard;
/*22*/	color0.x = vsOut_T0.z;
/*23*/	color0.yz = (vec4(0, 0, 0, 0)).yz;
/*24*/	return;
}
