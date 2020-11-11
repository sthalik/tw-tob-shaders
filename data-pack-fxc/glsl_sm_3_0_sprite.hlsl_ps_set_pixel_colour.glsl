//
//
// Shader Model 4
// Fragment Shader
//
// id: 26 - fxc/glsl_SM_3_0_sprite.hlsl_PS_set_pixel_colour.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;

void main()
{
color0 = vec4(0);
  vec4 r0;

/*0*/	r0.xy = (-vsOut_T2.xwxx + vsOut_T3.xyxx).xy;
/*1*/	r0.zw = (vsOut_T2.zzzy + -vsOut_T3.xxxy).zw;
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*5*/	if(r0.x != 0) discard;
/*6*/	r0.x = vsOut_T1.w + -0.003922;
/*7*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r0.x != 0) discard;
/*9*/	r0.xyz = saturate(vsOut_T1.xyzx).xyz;
/*10*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*11*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*12*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*13*/	color0.w = vsOut_T1.w;
/*14*/	return;
}
