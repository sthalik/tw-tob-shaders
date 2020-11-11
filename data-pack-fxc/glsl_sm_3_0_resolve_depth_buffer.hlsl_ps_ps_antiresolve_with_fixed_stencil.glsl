//
//
// Shader Model 4
// Fragment Shader
//
// id: 259 - fxc/glsl_SM_3_0_resolve_depth_buffer.hlsl_PS_ps_antiresolve_with_fixed_stencil.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D t_depthbuffer;
uniform usampler2D t_stencilbuffer;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (intBitsToFloat(ivec4(gl_FragCoord.xyxx))).xy;
/*1*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*2*/	r1.xyzw = uintBitsToFloat(texelFetch(t_stencilbuffer, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*3*/	r0.xyzw = texelFetch(t_depthbuffer, floatBitsToInt(r0.xyww).st, floatBitsToInt(r0.xyww).a).xyzw;
/*4*/	gl_FragDepth = (r0.x);
/*5*/	r0.x = floatBitsToUint(r1.y);
/*6*/	r0.x = r0.x + -1.000000;
/*7*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r0.x != 0) discard;
/*9*/	return;
}
