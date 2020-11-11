//
//
// Shader Model 4
// Fragment Shader
//
// id: 3943 - fxc/glsl_SM_3_0_TextureDebug.hlsl_PS_ps_depth.glsl
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

uniform sampler2D g_debug_texture;
uniform usampler2D g_debug_texture_stencil;

void main()
{
  const vec4 c[4] = vec4[4](
    vec4(0.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(1.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(0.00000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000),
    vec4(1.00000000000000, 1.00000000000000, 0.00000000000000, 0.00000000000000)
  );
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyzw = vec4(intBitsToFloat(textureSize(g_debug_texture, 0)), 0.f, 1.f);
/*1*/	r0.xy = (floatBitsToUint(r0.xyxx)).xy;
/*2*/	r0.zw = (vsOut_T0.xxxy * vec4(0.000000, 0.000000, 1.000000, -1.000000) + vec4(0.000000, 0.000000, 0.000000, 1.000000)).zw;
/*3*/	r0.xy = (r0.xyxx * r0.zwzz).xy;
/*4*/	r0.xy = (uintBitsToFloat(uvec4(r0.xyxx))).xy;
/*5*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*6*/	r1.xyzw = uintBitsToFloat(texelFetch(g_debug_texture_stencil, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*7*/	r0.xyzw = texelFetch(g_debug_texture, floatBitsToInt(r0.xyww).st, floatBitsToInt(r0.xyww).a).xyzw;
/*8*/	color0.x = r0.x;
/*9*/	r0.x = uintBitsToFloat(min(floatBitsToUint(r1.y), uint(4))) /**/;
/*10*/	color0.yz = (c[uint(floatBitsToInt(r0.x))].xxyx).yz;
/*11*/	color0.w = 1.000000;
/*12*/	return;
}
