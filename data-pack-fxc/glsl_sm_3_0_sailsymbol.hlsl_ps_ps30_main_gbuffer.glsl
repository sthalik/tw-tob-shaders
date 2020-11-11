//
//
// Shader Model 4
// Fragment Shader
//
// id: 1397 - fxc/glsl_SM_3_0_sailsymbol.hlsl_PS_ps30_main_gbuffer.glsl
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
in vec4 vsOut_T3;
in vec4 vsOut_C0;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_alpha_map;
uniform sampler2D s_symbol_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform sail_PS
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.x = vsOut_T3.x * cb1.data[0].x;
/*1*/	r1.x = vsOut_T0.w * cb1.data[0].x;
/*2*/	r0.y = vsOut_T3.y;
/*3*/	r1.y = 0;
/*4*/	r0.xy = (r0.xyxx + r1.xyxx).xy;
/*5*/	r0.xyzw = (texture(s_alpha_map, r0.xyxx.st)).xyzw;
/*6*/	r0.x = r0.x + -0.501961;
/*7*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*8*/	if(r0.x != 0) discard;
/*9*/	r0.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*10*/	r0.x = inversesqrt(r0.x);
/*11*/	r0.xyz = (r0.xxxx * vsOut_T2.xyzx).xyz;
/*12*/	r0.w = max(abs(r0.z), abs(r0.y));
/*13*/	r0.w = max(r0.w, abs(r0.x));
/*14*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*15*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*16*/	color0.w = 0;
/*17*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T3.xyxx.st)).xyzw;
/*18*/	r0.xyz = (r0.xyzx * vsOut_C0.xyzx).xyz;
/*19*/	r1.xyzw = (texture(s_symbol_map, vsOut_T3.zwzz.st)).xyzw;
/*20*/	r1.xyz = (r1.xyzx * vsOut_C1.xyzx).xyz;
/*21*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*22*/	r0.w = -r1.w + 1.000000;
/*23*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*24*/	r0.xyz = (sqrt(r0.xyzx)).xyz;
/*25*/	color1.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*26*/	color1.w = 0;
/*27*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*28*/	r0.xyz = (vsOut_T1.xyzx).xyz;
/*29*/	r0.w = 1.000000;
/*30*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*31*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*32*/	color3.x = r1.x / r0.x;
/*33*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*34*/	color4 = uint(0);
/*35*/	return;
}
