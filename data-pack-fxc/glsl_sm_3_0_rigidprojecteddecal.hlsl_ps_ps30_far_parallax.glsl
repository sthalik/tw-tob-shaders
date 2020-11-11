//
//
// Shader Model 4
// Fragment Shader
//
// id: 98 - fxc/glsl_SM_3_0_RigidProjectedDecal.hlsl_PS_ps30_far_parallax.glsl
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
  color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (vsOut_T5.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*1*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T4.x) ? 0xffffffffu : 0x00000000u);
/*2*/	r1.xyzw = (texture(s_diffuse_map_clamp, r0.xyxx.st)).xyzw;
/*3*/	r0.xy = (r0.xyxx * vsOut_T3.xzxx).xy;
/*4*/	r0.xy = (r0.xyxx * cb0.data[1].zwzz).xy;
/*5*/	r0.xy = (r0.xyxx * vec4(0.158691, 0.158691, 0.000000, 0.000000)).xy;
/*6*/	r2.xyzw = (texture(s_diffuse_map_wrap, r0.xyxx.st)).xyzw;
/*7*/	if(floatBitsToUint(r0.z) != 0u) {
/*8*/	  color0.w = r1.w * vsOut_T4.y;
/*9*/	  r1.xyz = (r2.xyzx).xyz;
/*10*/	} else {
/*11*/	  color0.w = r1.w * vsOut_T4.y;
/*12*/	}
/*13*/	r0.xyz = (log2(r1.xyzx)).xyz;
/*14*/	r0.xyz = (r0.xyzx * vec4(0.454545, 0.454545, 0.454545, 0.000000)).xyz;
/*15*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*16*/	return;
}
