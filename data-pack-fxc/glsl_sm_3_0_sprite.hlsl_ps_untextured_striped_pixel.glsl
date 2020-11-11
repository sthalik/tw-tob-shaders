//
//
// Shader Model 4
// Fragment Shader
//
// id: 110 - fxc/glsl_SM_3_0_sprite.hlsl_PS_untextured_striped_pixel.glsl
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
in vec4 vsOut_T2;
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;

layout(std140) uniform sprite_PS
{
  vec4 data[3];
} cb0;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = r0.w * vsOut_C0.w + -0.003922;
/*2*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r1.x != 0) discard;
/*4*/	r1.xy = (-vsOut_T2.xwxx + vsOut_T3.xyxx).xy;
/*5*/	r1.zw = (vsOut_T2.zzzy + -vsOut_T3.xxxy).zw;
/*6*/	r1.xyzw = uintBitsToFloat(uvec4(lessThan(r1.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*7*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r1.zwzz) | floatBitsToUint(r1.xyxx))).xy;
/*8*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r1.x));
/*9*/	if(r1.x != 0) discard;
/*10*/	r1.y = uintBitsToFloat((0.500000 < cb0.data[0].w) ? 0xffffffffu : 0x00000000u);
/*11*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xz;
/*12*/	r1.xyz = (uintBitsToFloat(uvec4(equal(r0.yxzy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*13*/	r0.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*14*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.y));
/*15*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.x));
/*16*/	color0.xyz = (mix(r0.xyzx, vec4(0.500000, 0.500000, 0.500000, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*17*/	color0.w = r0.w;
/*18*/	return;
}
