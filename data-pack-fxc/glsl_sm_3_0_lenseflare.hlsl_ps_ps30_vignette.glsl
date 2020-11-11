//
//
// Shader Model 4
// Fragment Shader
//
// id: 353 - fxc/glsl_SM_3_0_LenseFlare.hlsl_PS_ps30_vignette.glsl
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

layout(std140) uniform lense_flare_PS
{
  vec4 data[2];
} cb0;

void main()
{
  vec4 r0;

/*0*/	r0.xy = (vsOut_T0.xyxx + cb0.data[0].yzyy).xy;
/*1*/	r0.xy = (r0.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*2*/	r0.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*3*/	r0.x = sqrt(r0.x);
/*4*/	r0.x = saturate(r0.x * 2.000000 + -0.900000);
/*5*/	r0.x = log2(r0.x);
/*6*/	r0.x = r0.x * 1.700000;
/*7*/	r0.x = exp2(r0.x);
/*8*/	r0.y = r0.x + -0.003922;
/*9*/	color0.w = r0.x;
/*10*/	r0.x = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.x != 0) discard;
/*12*/	color0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*13*/	return;
}
