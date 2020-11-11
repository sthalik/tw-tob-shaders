//
//
// Shader Model 4
// Fragment Shader
//
// id: 153 - fxc/glsl_SM_3_0_sprite.hlsl_PS_CampaignVerticalColourSpread_ps_2.glsl
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

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = vsOut_T0.w + -0.500000;
/*1*/	r0.x = -r0.x * 2.000000 + 1.000000;
/*2*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*3*/	r0.w = vsOut_T0.w + vsOut_T0.w;
/*4*/	r1.xyz = (vsOut_T3.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*5*/	r1.xyz = (r0.wwww * r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*6*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T0.w) ? 0xffffffffu : 0x00000000u);
/*7*/	color0.xyz = (mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*8*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*9*/	color0.w = r0.w;
/*10*/	return;
}
