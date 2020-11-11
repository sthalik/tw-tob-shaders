//
//
// Shader Model 4
// Fragment Shader
//
// id: 1518 - fxc/glsl_SM_3_0_depth_of_field.hlsl_PS_pixel_dof_coc.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D input_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform depth_of_field_coc_PS
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r1.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, 0.000000)).yzxw;
/*3*/	r1.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.xyzw = (textureLod(input_sampler, r0.xyxx.st, r0.y)).xyzw;
/*5*/	color0.xyz = (r0.xyzx).xyz;
/*6*/	r1.w = 1.000000;
/*7*/	r0.x = dot(r1.xyzw, cb0.data[19].xyzw);
/*8*/	r0.y = dot(r1.xyzw, cb0.data[20].xyzw);
/*9*/	r0.x = r0.x / r0.y;
/*10*/	r0.y = uintBitsToFloat((0.000000 >= r0.x) ? 0xffffffffu : 0x00000000u);
/*11*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? 1.000000 : r0.x;
/*12*/	r0.y = min(cb1.data[0].x, 500.000000);
/*13*/	r0.x = -r0.y + r0.x;
/*14*/	r0.x = r0.x * r0.x;
/*15*/	r0.y = dot(vec2(cb1.data[0].yyyy), vec2(cb1.data[0].yyyy));
/*16*/	r0.x = r0.x / r0.y;
/*17*/	r0.x = r0.x * -1.442695;
/*18*/	r0.x = exp2(r0.x);
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.y = cb1.data[0].z * 0.600000;
/*21*/	color0.w = saturate(r0.x * r0.y);
/*22*/	return;
}
