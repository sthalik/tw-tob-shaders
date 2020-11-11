//
//
// Shader Model 4
// Fragment Shader
//
// id: 1341 - fxc/glsl_SM_3_0_rigidtreebillboard.hlsl_PS_ps30_shadow.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T2;

layout(location = 0) out vec4 color0;

uniform sampler2D s_dissolve_map;
uniform sampler2D s_diffuse_map_tree;
uniform sampler2D s_diffuse_burn_map;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xw = (vsOut_T0.xxxy).xw;
/*1*/	r0.yz = (vec4(0, 0, 0.250000, 0)).yz;
/*2*/	r1.w = 0;
/*3*/	r1.xyz = (vsOut_T0.xyzx * vec4(10.000000, 10.000000, 0.250000, 0.000000)).xyz;
/*4*/	r0.xy = (r0.xyxx + r1.zwzz).xy;
/*5*/	r1.zw = (r1.zzzw + vsOut_T0.xxxy).zw;
/*6*/	r2.xyzw = (texture(s_dissolve_map, r1.xyxx.st)).xyzw;
/*7*/	r0.xy = (r0.xyxx + r0.zwzz).xy;
/*8*/	r3.xyzw = (texture(s_diffuse_burn_map, r0.xyxx.st)).xyzw;
/*9*/	r0.xyzw = (texture(s_diffuse_map_tree, r0.xyxx.st)).xyzw;
/*10*/	r0.x = -r0.w + r3.w;
/*11*/	r0.x = vsOut_T2.w * r0.x + r0.w;
/*12*/	r3.xyzw = (texture(s_diffuse_burn_map, r1.zwzz.st)).xyzw;
/*13*/	r1.xyzw = (texture(s_diffuse_map_tree, r1.zwzz.st)).xyzw;
/*14*/	r0.y = -r1.w + r3.w;
/*15*/	r0.y = vsOut_T2.w * r0.y + r1.w;
/*16*/	r0.x = -r0.y + r0.x;
/*17*/	r0.z = uintBitsToFloat((r2.x < vsOut_T0.w) ? 0xffffffffu : 0x00000000u);
/*18*/	r0.w = r2.x + -vsOut_T2.x;
/*19*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & uint(0x3f800000u));
/*20*/	r0.x = r0.z * r0.x + r0.y;
/*21*/	r0.x = r0.x + -0.500000;
/*22*/	r0.x = min(r0.x, r0.w);
/*23*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*24*/	if(r0.x != 0) discard;
/*25*/	color0.xyzw = vec4(0, 0, 0, 0);
/*26*/	return;
}
