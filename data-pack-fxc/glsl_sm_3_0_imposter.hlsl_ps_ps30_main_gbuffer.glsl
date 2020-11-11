//
//
// Shader Model 4
// Fragment Shader
//
// id: 331 - fxc/glsl_SM_3_0_imposter.hlsl_PS_ps30_main_gbuffer.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T6;
in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.376471;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r0.w = dot(vec3(-cb0.data[3].xyzx), vec3(-cb0.data[3].xyzx));
/*5*/	r0.w = inversesqrt(r0.w);
/*6*/	r1.xyz = (r0.wwww * -cb0.data[3].xyzx).xyz;
/*7*/	r0.w = max(abs(r1.z), abs(r1.y));
/*8*/	r0.w = max(r0.w, abs(r1.x));
/*9*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*10*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*11*/	color0.w = 0;
/*12*/	r1.xyz = saturate(vsOut_T6.xyzx).xyz;
/*13*/	r1.xyz = (log2(r1.xyzx)).xyz;
/*14*/	r1.xyz = (r1.xyzx * cb1.data[0].yyyy).xyz;
/*15*/	r1.xyz = (exp2(r1.xyzx)).xyz;
/*16*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*17*/	r0.xyz = (vsOut_T6.wwww * r1.xyzx + r0.xyzx).xyz;
/*18*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*19*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*20*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*21*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*22*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*23*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*24*/	r0.xyz = (sqrt(r0.xyzx)).xyz;
/*25*/	color1.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*26*/	color1.w = 0;
/*27*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*28*/	r0.xyz = (vsOut_T2.xyzx).xyz;
/*29*/	r0.w = 1.000000;
/*30*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*31*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*32*/	color3.x = r1.x / r0.x;
/*33*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*34*/	color4 = uint(0);
/*35*/	return;
}
