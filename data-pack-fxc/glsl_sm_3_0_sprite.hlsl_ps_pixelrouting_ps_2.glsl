//
//
// Shader Model 4
// Fragment Shader
//
// id: 127 - fxc/glsl_SM_3_0_sprite.hlsl_PS_PixelRouting_ps_2.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T3;

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

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = r0.w + -0.003922;
/*2*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r1.x != 0) discard;
/*4*/	r1.xy = (vsOut_T0.zwzz + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*5*/	r1.xy = (r1.xyxx * r1.xyxx).xy;
/*6*/	r1.x = r1.y + r1.x;
/*7*/	r1.x = sqrt(r1.x);
/*8*/	r1.x = r1.x + r1.x;
/*9*/	r1.x = r1.x * r1.x;
/*10*/	r1.y = r0.y * r1.x;
/*11*/	r2.y = -r1.y * 0.500000 + r0.y;
/*12*/	r0.y = uintBitsToFloat((cb1.data[0].x >= -cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*13*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 1.000000 : -1.000000;
/*14*/	r1.y = r0.y * cb1.data[0].x;
/*15*/	r1.y = fract(r1.y);
/*16*/	r0.y = r0.y * r1.y;
/*17*/	r0.y = r0.y * 3.141593;
/*18*/	r0.y = sin(r0.y);
/*19*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].w) ? 0xffffffffu : 0x00000000u);
/*20*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xz;
/*21*/	color0.w = r0.w;
/*22*/	r0.w = -r0.x + 1.000000;
/*23*/	r0.w = r1.x * r0.w;
/*24*/	r1.x = r1.x * r0.z;
/*25*/	r2.z = -r1.x * 0.500000 + r0.z;
/*26*/	r2.x = r0.w * r0.y + r0.x;
/*27*/	r0.x = vsOut_T3.y + 1.000000;
/*28*/	r0.xyz = saturate(r0.xxxx * r2.xyzx).xyz;
/*29*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*30*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*31*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*32*/	return;
}
