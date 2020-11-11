//
//
// Shader Model 4
// Fragment Shader
//
// id: 247 - fxc/glsl_SM_3_0_debuggeometry.hlsl_PS_ps30_schematic.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;

layout(location = 0) out vec4 color0;

layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.x = dot(vec3(vsOut_T0.xyzx), vec3(vsOut_T0.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T0.xyzx).xyz;
/*3*/	r1.xyz = (r0.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*4*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb0.data[0].yzwy));
/*5*/	r0.x = max(r0.x, 0.000000);
/*6*/	r0.xyz = (r0.xxxx * vsOut_C0.xyzx).xyz;
/*7*/	r0.xyz = (r0.xyzx * cb0.data[1].xyzx).xyz;
/*8*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*9*/	r0.w = inversesqrt(r0.w);
/*10*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*11*/	r2.xyz = (uintBitsToFloat(uvec4(lessThan(r1.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*12*/	r1.xyz = (r1.xyzx * r1.xyzx).xyz;
/*13*/	r3.xyz = (mix(cb0.data[2].xyzx, cb0.data[3].xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz/**/;
/*14*/	r2.xyw = (mix(cb0.data[4].xyxz, cb0.data[5].xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw/**/;
/*15*/	r4.xyz = (mix(cb0.data[6].xyzx, cb0.data[7].xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz/**/;
/*16*/	r2.xyz = (r1.yyyy * r2.xywx).xyz;
/*17*/	r1.xyw = (r1.xxxx * r3.xyxz + r2.xyxz).xyw;
/*18*/	r1.xyz = (r1.zzzz * r4.xyzx + r1.xywx).xyz;
/*19*/	r0.w = uintBitsToFloat((0.000000 < cb0.data[11].x) ? 0xffffffffu : 0x00000000u);
/*20*/	r2.xy = (mix(vec4(1.000000, 1.000000, 0, 0), vec4(0.004000, 360.000000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*21*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*22*/	r1.xyz = (r1.xyzx * vsOut_C0.xyzx).xyz;
/*23*/	r0.xyz = (r0.xyzx * r2.xxxx).xyz;
/*24*/	color0.xyz = (r1.xyzx * r2.xxxx + r0.xyzx).xyz;
/*25*/	color0.w = 0.200000;
/*26*/	return;
}
