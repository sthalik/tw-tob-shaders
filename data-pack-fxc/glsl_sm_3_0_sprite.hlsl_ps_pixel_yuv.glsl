//
//
// Shader Model 4
// Fragment Shader
//
// id: 112 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_yuv.glsl
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

uniform sampler2D s_diffuse_map_y;
uniform sampler2D s_diffuse_map_v;
uniform sampler2D s_diffuse_map_u;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyzw = (textureLod(s_diffuse_map_u, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r0.xyz = (r0.xxxx * vec4(0.000000, -0.391449, 2.017822, 0.000000)).xyz;
/*2*/	r1.xyzw = (textureLod(s_diffuse_map_v, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*3*/	r0.xyz = (r1.xxxx * vec4(1.595795, -0.813477, 0.000000, 0.000000) + r0.xyzx).xyz;
/*4*/	r1.xyzw = (textureLod(s_diffuse_map_y, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*5*/	r0.xyz = (r1.xxxx * vec4(1.164124, 1.164124, 1.164124, 0.000000) + r0.xyzx).xyz;
/*6*/	color0.xyz = (r0.xyzx + vec4(-0.870655, 0.529705, -1.081669, 0.000000)).xyz;
/*7*/	color0.w = vsOut_C0.w;
/*8*/	return;
}
