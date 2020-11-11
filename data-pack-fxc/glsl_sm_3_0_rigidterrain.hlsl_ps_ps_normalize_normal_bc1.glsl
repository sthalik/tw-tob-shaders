//
//
// Shader Model 4
// Fragment Shader
//
// id: 1511 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps_normalize_normal_bc1.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D t_normalise_material;
uniform sampler2D t_normalise_normal;

void main()
{
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = trunc((gl_FragCoord.xyxx).xy);
/*1*/	r0.xy = (uintBitsToFloat(uvec4(r0.xyxx))).xy;
/*2*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*3*/	r1.xyzw = texelFetch(t_normalise_material, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw;
/*4*/	r0.xyzw = texelFetch(t_normalise_normal, floatBitsToInt(r0.xyww).st, floatBitsToInt(r0.xyww).a).xyzw;
/*5*/	color0.y = r1.z / r0.w;
/*6*/	r0.y = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*7*/	r0.y = inversesqrt(r0.y);
/*8*/	r0.xy = (r0.yyyy * r0.xzxx).xy;
/*9*/	color0.xz = (r0.xxyx * vec4(0.500000, 0.000000, 0.500000, 0.000000) + vec4(0.500000, 0.000000, 0.500000, 0.000000)).xz;
/*10*/	color0.w = 1.000000;
/*11*/	return;
}
