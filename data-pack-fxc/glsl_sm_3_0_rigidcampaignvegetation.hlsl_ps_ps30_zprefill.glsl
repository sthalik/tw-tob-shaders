//
//
// Shader Model 4
// Fragment Shader
//
// id: 3938 - fxc/glsl_SM_3_0_RigidCampaignVegetation.hlsl_PS_ps30_zprefill.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = vsOut_T0.w;
/*1*/	r0.y = vsOut_T1.w;
/*2*/	r1.xyzw = (texture(s_diffuse_map, r0.xyxx.st)).xyzw;
/*3*/	r0.z = r1.w + -0.500000;
/*4*/	r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*5*/	if(r0.z != 0) discard;
/*6*/	r1.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*7*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*8*/	r0.z = uintBitsToFloat((r0.z < 100.000000) ? 0xffffffffu : 0x00000000u);
/*9*/	r0.xy = (r0.xyxx * vec4(20.000000, 20.000000, 0.000000, 0.000000)).xy;
/*10*/	r1.xyzw = (texture(s_dissolve_map, r0.xyxx.st)).xyzw;
/*11*/	if(floatBitsToUint(r0.z) != 0u) {
/*12*/	  r0.xyz = (dFdy(vsOut_T0.zxyz)).xyz;
/*13*/	  r1.yzw = (dFdx(vsOut_T0.yyzx)).yzw;
/*14*/	  r2.xyz = (r0.xyzx * r1.yzwy).xyz;
/*15*/	  r0.xyz = (r0.zxyz * r1.zwyz + -r2.xyzx).xyz;
/*16*/	  r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*17*/	  r0.w = inversesqrt(r0.w);
/*18*/	  r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*19*/	  r1.yzw = (-vsOut_T0.xxyz + cb0.data[0].xxyz).yzw;
/*20*/	  r0.w = dot(vec3(r1.yzwy), vec3(r1.yzwy));
/*21*/	  r0.w = inversesqrt(r0.w);
/*22*/	  r1.yzw = (r0.wwww * r1.yyzw).yzw;
/*23*/	  r0.x = dot(vec3(r0.xyzx), vec3(r1.yzwy));
/*24*/	  r0.x = saturate(r0.x + r0.x);
/*25*/	  r0.x = -r1.x + r0.x;
/*26*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*27*/	  if(r0.x != 0) discard;
/*28*/	}
/*29*/	color0.xyzw = vec4(0, 0, 0, 0);
/*30*/	return;
}
