//
//
// Shader Model 4
// Fragment Shader
//
// id: 93 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_texture_red_channel.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

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

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r0.y = uintBitsToFloat((0.500000 < cb0.data[0].w) ? 0xffffffffu : 0x00000000u);
/*2*/	color0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.z : r0.x;
/*3*/	color0.yzw = (vec4(0, 0, 0, 1.000000)).yzw;
/*4*/	return;
}
