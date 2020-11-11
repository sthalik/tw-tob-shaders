//
//
// Shader Model 4
// Fragment Shader
//
// id: 11 - fxc/glsl_SM_3_0_sprite.hlsl_PS_untextured_pixel.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T2;
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;

void main()
{
color0 = vec4(0);
  vec4 r0;

/*0*/	r0.x = vsOut_C0.w + -0.003922;
/*1*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*2*/	if(r0.x != 0) discard;
/*3*/	r0.xy = (-vsOut_T2.xwxx + vsOut_T3.xyxx).xy;
/*4*/	r0.zw = (vsOut_T2.zzzy + -vsOut_T3.xxxy).zw;
/*5*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*6*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*7*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*8*/	if(r0.x != 0) discard;
/*9*/	color0.xyzw = vsOut_C0.xyzw;
/*10*/	return;
}
