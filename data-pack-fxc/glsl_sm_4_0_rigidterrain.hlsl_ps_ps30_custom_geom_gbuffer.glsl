//
//
// Shader Model 4
// Fragment Shader
//
// id: 1480 - fxc/glsl_SM_4_0_rigidterrain.hlsl_PS_ps30_custom_geom_gbuffer.glsl
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
in vec4 vsOut_T2;
in vec4 vsOut_T4;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_albedo_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  color4 = uint(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T4.xyzx).xyz;
/*3*/	r0.w = max(abs(r0.z), abs(r0.y));
/*4*/	r0.w = max(r0.w, abs(r0.x));
/*5*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*6*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*7*/	color0.w = saturate(vsOut_T2.x);
/*8*/	r0.xyzw = (texture(s_albedo_map, vsOut_T1.xyxx.st)).xyzw;
/*9*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*10*/	color1.w = saturate(vsOut_T2.x);
/*11*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*12*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*13*/	r0.w = 1.000000;
/*14*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*15*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*16*/	color3.x = r1.x / r0.x;
/*17*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*18*/	color4 = uint(0);
/*19*/	return;
}
