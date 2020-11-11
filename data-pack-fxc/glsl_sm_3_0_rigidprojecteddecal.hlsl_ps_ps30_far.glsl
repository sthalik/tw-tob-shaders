//
//
// Shader Model 4
// Fragment Shader
//
// id: 3891 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_PS_ps30_far.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map_clamp;
uniform sampler2D s_diffuse_map_wrap;

layout(std140) uniform projected_decal_PS
{
  vec4 data[5];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = uintBitsToFloat((0.000000 < vsOut_T4.x) ? 0xffffffffu : 0x00000000u);
/*1*/	r0.yz = (vsOut_T3.xxzx * vsOut_T5.xxyx).yz;
/*2*/	r0.yz = (r0.yyzy * cb0.data[1].zzwz).yz;
/*3*/	r0.yz = (r0.yyzy * vec4(0.000000, 0.158691, 0.158691, 0.000000)).yz;
/*4*/	r1.xyzw = (texture(s_diffuse_map_wrap, r0.yzyy.st)).xyzw;
/*5*/	if(floatBitsToUint(r0.x) != 0u) {
/*6*/	  r0.xyzw = (texture(s_diffuse_map_clamp, vsOut_T5.xyxx.st)).xyzw;
/*7*/	  color0.w = r0.w * vsOut_T4.y;
/*8*/	  color0.xyz = (r1.xyzx).xyz;
/*9*/	} else {
/*10*/	  r0.xyzw = (texture(s_diffuse_map_clamp, vsOut_T5.xyxx.st)).xyzw;
/*11*/	  color0.w = r0.w * vsOut_T4.y;
/*12*/	  color0.xyz = (r0.xyzx).xyz;
/*13*/	}
/*14*/	return;
}
