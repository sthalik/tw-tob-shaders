//
//
// Shader Model 4
// Fragment Shader
//
// id: 286 - fxc/glsl_SM_3_0_EditorDynamicGeometry.hlsl_PS_ps30_main_gbuffer.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_C0;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse;

layout(std140) uniform editor_dynamic_geometry_PS
{
  vec4 data[2];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyzw = (texture(s_diffuse, vsOut_T3.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w * vsOut_C0.w + -0.501961;
/*2*/	r0.xyz = (r0.xyzx * vsOut_C0.xyzx).xyz;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*6*/	r0.w = inversesqrt(r0.w);
/*7*/	r1.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*8*/	r0.w = max(abs(r1.z), abs(r1.y));
/*9*/	r0.w = max(r0.w, abs(r1.x));
/*10*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*11*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*12*/	color0.w = 0.100000;
/*13*/	r1.xyz = (cb0.data[0].xyzx + -cb0.data[1].xyzx).xyz;
/*14*/	r1.xyz = (r0.xxxx * r1.xyzx + cb0.data[1].xyzx).xyz;
/*15*/	r2.xyz = (-cb0.data[0].xyzx + cb0.data[1].xyzx).xyz;
/*16*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r0.w = uintBitsToFloat((r0.w != 0.000000) ? 0xffffffffu : 0x00000000u);
/*18*/	r0.xyz = (mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*19*/	r0.xyz = (sqrt(r0.xyzx)).xyz;
/*20*/	color1.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*21*/	color1.w = 0;
/*22*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*23*/	color3.xyzw = vec4(1.000000, 0, 0, 0);
/*24*/	color4 = uint(0);
/*25*/	return;
}
