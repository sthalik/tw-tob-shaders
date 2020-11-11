//
//
// Shader Model 4
// Fragment Shader
//
// id: 212 - fxc/glsl_SM_3_0_campaignborder.hlsl_PS_ps30_border.glsl
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

uniform sampler2D s_border_diffuse;
uniform sampler2D s_shroud;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb3;
layout(std140) uniform campaign_border_PS
{
  vec4 data[7];
} cb4;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.x = max(-cb2.data[0].z, 0.000000);
/*1*/	r1.xyzw = (texture(s_border_diffuse, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.yzw = saturate(cb4.data[4].xxyz).yzw/**/;
/*3*/	r0.yzw = saturate(r1.xxyz * r0.yyzw).yzw;
/*4*/	r0.yzw = (log2(r0.yyzw)).yzw;
/*5*/	r0.yzw = (r0.yyzw * cb0.data[0].zzzz).yzw;
/*6*/	r0.yzw = (exp2(r0.yyzw)).yzw;
/*7*/	r1.x = uintBitsToFloat((0.500000 < cb3.data[0].x) ? 0xffffffffu : 0x00000000u);
/*8*/	if(floatBitsToUint(r1.x) != 0u) {
/*9*/	  r2.xyzw = vsOut_T0.xzxz + -cb3.data[1].xyxy;
/*10*/	  r3.xyzw = -cb3.data[1].xyxy + cb3.data[1].zwzw;
/*11*/	  r2.xyzw = r2.xyzw / r3.xyzw;
/*12*/	  r3.xyzw = -cb3.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*13*/	  r2.xyzw = r2.xyzw * r3.xyzw + cb3.data[4].xyxy;
/*14*/	  r3.xyzw = (textureLod(s_shroud, r2.zwzz.st, r2.w)).xyzw;
/*15*/	  r2.xyzw = r2.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*16*/	  r2.xyzw = saturate(r2.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*17*/	  r4.xyzw = r2.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*18*/	  r2.xyzw = r2.xyzw * r2.xyzw;
/*19*/	  r2.xyzw = r2.xyzw * r4.xyzw;
/*20*/	  r1.y = r3.x * r2.x;
/*21*/	  r1.y = r1.y * r2.y;
/*22*/	  r1.y = r2.z * -r1.y + r1.y;
/*23*/	  r1.y = r2.w * -r1.y + r1.y;
/*24*/	  r1.y = saturate(r1.y + -0.500000);
/*25*/	  r1.y = r1.y + r1.y;
/*26*/	} else {
/*27*/	  r1.y = 1.000000;
/*28*/	}
/*29*/	r1.z = -r1.y + 1.000000;
/*30*/	r1.y = r1.z * 0.250000 + r1.y;
/*31*/	r1.y = r1.y * r1.w;
/*32*/	r1.z = uintBitsToFloat((0.000000 < cb4.data[5].x) ? 0xffffffffu : 0x00000000u);
/*33*/	r1.w = vsOut_T1.x * cb4.data[5].x;
/*34*/	r1.w = saturate(r1.w / cb4.data[5].y);
/*35*/	r2.x = -vsOut_T1.x + 1.000000;
/*36*/	r2.x = r2.x * cb4.data[5].x;
/*37*/	r2.x = saturate(r2.x / cb4.data[5].z);
/*38*/	r1.w = r1.w * r2.x;
/*39*/	r1.w = r1.w * r1.y;
/*40*/	r1.y = (floatBitsToUint(r1.z) > 0x00000000u) ? r1.w : r1.y;
/*41*/	r1.zw = (vsOut_T0.xxxz + -cb1.data[0].xxxz).zw;
/*42*/	r1.z = dot(vec2(r1.zwzz), vec2(r1.zwzz));
/*43*/	r1.z = sqrt(r1.z);
/*44*/	r1.z = r1.z * 0.010526;
/*45*/	r1.z = min(r1.z, 1.000000);
/*46*/	r1.z = -r1.z + 1.000000;
/*47*/	r0.xyz = (r0.xxxx * r0.yzwy).xyz;
/*48*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*49*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*50*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*51*/	color0.xyz = (r0.wwww * r0.xyzx).xyz;
/*52*/	if(floatBitsToUint(r1.x) != 0u) {
/*53*/	  r0.xyzw = vsOut_T0.xzxz + -cb3.data[1].xyxy;
/*54*/	  r2.xyzw = -cb3.data[1].xyxy + cb3.data[1].zwzw;
/*55*/	  r0.xyzw = r0.xyzw / r2.xyzw;
/*56*/	  r2.xyzw = -cb3.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*57*/	  r0.xyzw = r0.xyzw * r2.xyzw + cb3.data[4].xyxy;
/*58*/	  r2.xyzw = (textureLod(s_shroud, r0.zwzz.st, r0.w)).xyzw;
/*59*/	  r0.xyzw = r0.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*60*/	  r0.xyzw = saturate(r0.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*61*/	  r3.xyzw = r0.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*62*/	  r0.xyzw = r0.xyzw * r0.xyzw;
/*63*/	  r0.xyzw = r0.xyzw * r3.xyzw;
/*64*/	  r0.x = r2.x * r0.x;
/*65*/	  r0.x = r0.x * r0.y;
/*66*/	  r0.x = r0.z * -r0.x + r0.x;
/*67*/	  r0.x = r0.w * -r0.x + r0.x;
/*68*/	} else {
/*69*/	  r0.x = 1.000000;
/*70*/	}
/*71*/	r0.x = r0.x + -0.250000;
/*72*/	r0.x = saturate(r0.x * 4.000000);
/*73*/	r0.x = r0.x * r1.y;
/*74*/	r0.x = r0.x * cb4.data[4].w;
/*75*/	color0.w = r1.z * r0.x;
/*76*/	return;
}
