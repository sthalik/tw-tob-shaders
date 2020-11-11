//
//
// Shader Model 4
// Fragment Shader
//
// id: 89 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_texture_blend.glsl
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
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*1*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*2*/	r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*3*/	r0.xyzw = r1.xyzw * vsOut_C0.xyzw;
/*4*/	r0.xyz = saturate(r0.xyzx).xyz;
/*5*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*6*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*7*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*8*/	r1.xy = (vsOut_T0.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*9*/	r1.xy = (abs(r1.xyxx) * vec4(2.500000, 2.500000, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (fract(r1.xyxx)).xy;
/*11*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, vec4(0.500000, 0.500000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*12*/	r2.xyz = (mix(vec4(0.800000, 0.850000, 0.900000, 0), vec4(0.500000, 0.500000, 0.590000, 0), greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyz;
/*13*/	r1.yzw = (mix(vec4(0, 0.500000, 0.500000, 0.590000), vec4(0, 0.800000, 0.850000, 0.900000), greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).yzw;
/*14*/	r1.xyz = (mix(r1.yzwy, r2.xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*15*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*16*/	color0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*17*/	color0.w = 1.000000;
/*18*/	return;
}
