//
//
// Shader Model 4
// Fragment Shader
//
// id: 215 - fxc/glsl_SM_3_0_campaignterrain.hlsl_PS_ps30_main_coast.glsl
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

layout(location = 0) out vec4 color0;

uniform sampler2D s_distortion;
uniform sampler2D s_coast_a;
uniform sampler2D s_shroud;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xz = (vec4(0.500000, 0, 0.500000, 0)).xz;
/*1*/	r0.yw = (vsOut_T2.xxxy).yw;
/*2*/	r0.xyzw = vec4(0.000000, 0.500000, 0.000000, 0.500000) * r0.xyzw + vsOut_T1.xyxy;
/*3*/	r1.xy = (cb0.data[26].xxxx * vec4(0.005000, 0.002500, 0.000000, 0.000000) + vsOut_T1.xyxx).xy;
/*4*/	r1.xyzw = (texture(s_distortion, r1.xyxx.st)).xyzw;
/*5*/	r1.x = r1.x + -0.500000;
/*6*/	r1.x = r1.x * 0.066667;
/*7*/	r1.y = 0;
/*8*/	r0.xyzw = r0.xyzw + r1.xyxy;
/*9*/	r1.xyzw = (texture(s_coast_a, r0.xyxx.st)).xyzw;
/*10*/	r0.xyzw = (texture(s_coast_a, r0.zwzz.st)).xyzw;
/*11*/	r0.w = -r1.x + r1.y;
/*12*/	r0.w = vsOut_T3.w * r0.w + r1.x;
/*13*/	r1.x = -r0.w + r1.z;
/*14*/	r0.w = vsOut_T3.z * r1.x + r0.w;
/*15*/	r0.y = -r0.x + r0.y;
/*16*/	r0.x = vsOut_T3.w * r0.y + r0.x;
/*17*/	r0.y = -r0.x + r0.z;
/*18*/	r0.x = vsOut_T3.z * r0.y + r0.x;
/*19*/	r0.x = r0.x * vsOut_T3.y;
/*20*/	r0.x = r0.w * vsOut_T3.x + r0.x;
/*21*/	r0.x = log2(r0.x);
/*22*/	r0.x = r0.x * 1.250000;
/*23*/	r0.x = exp2(r0.x);
/*24*/	r0.x = r0.x * 1.500000;
/*25*/	r0.x = min(r0.x, 1.000000);
/*26*/	r0.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r0.y) != 0u) {
/*28*/	  r1.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*29*/	  r2.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*30*/	  r1.xyzw = r1.xyzw / r2.xyzw;
/*31*/	  r2.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*32*/	  r1.xyzw = r1.xyzw * r2.xyzw + cb1.data[4].xyxy;
/*33*/	  r2.xyzw = (textureLod(s_shroud, r1.zwzz.st, r1.w)).xyzw;
/*34*/	  r1.xyzw = r1.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*35*/	  r1.xyzw = saturate(r1.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*36*/	  r3.xyzw = r1.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*37*/	  r1.xyzw = r1.xyzw * r1.xyzw;
/*38*/	  r1.xyzw = r1.xyzw * r3.xyzw;
/*39*/	  r0.y = r2.x * r1.x;
/*40*/	  r0.y = r0.y * r1.y;
/*41*/	  r0.y = r1.z * -r0.y + r0.y;
/*42*/	  r0.y = r1.w * -r0.y + r0.y;
/*43*/	  r0.y = saturate(r0.y + -0.500000);
/*44*/	  r0.y = r0.y + r0.y;
/*45*/	} else {
/*46*/	  r0.y = 1.000000;
/*47*/	}
/*48*/	r0.x = r0.y * r0.x;
/*49*/	r0.y = vsOut_T1.z / vsOut_T1.w;
/*50*/	r0.z = saturate(r0.y * 6.666667);
/*51*/	r0.y = -r0.y + 1.000000;
/*52*/	r0.y = saturate(r0.y * 6.666667);
/*53*/	r0.y = min(r0.y, r0.z);
/*54*/	color0.w = r0.y * r0.x;
/*55*/	color0.xyz = (vec4(0.650000, 0.650000, 0.650000, 0)).xyz;
/*56*/	return;
}
