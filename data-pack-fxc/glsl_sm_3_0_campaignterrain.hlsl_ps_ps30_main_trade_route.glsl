//
//
// Shader Model 4
// Fragment Shader
//
// id: 218 - fxc/glsl_SM_3_0_campaignterrain.hlsl_PS_ps30_main_trade_route.glsl
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

uniform sampler2D s_shroud;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb1;
layout(std140) uniform trade_route_PS
{
  vec4 data[3];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.x = cb2.data[1].x * 0.500000;
/*1*/	r0.x = min(r0.x, 3.500000);
/*2*/	r0.y = vsOut_T1.x * cb2.data[1].x;
/*3*/	r0.z = uintBitsToFloat((r0.y < r0.x) ? 0xffffffffu : 0x00000000u);
/*4*/	r0.w = -cb2.data[1].x * vsOut_T1.x + r0.x;
/*5*/	r0.w = cb2.data[1].y * r0.w + r0.y;
/*6*/	r0.w = r0.y / r0.w;
/*7*/	r1.x = -r0.x + cb2.data[1].x;
/*8*/	r1.x = uintBitsToFloat((r1.x < r0.y) ? 0xffffffffu : 0x00000000u);
/*9*/	r1.y = -cb2.data[1].x * vsOut_T1.x + cb2.data[1].x;
/*10*/	r0.x = r0.x + -r1.y;
/*11*/	r0.x = cb2.data[1].z * r0.x + r1.y;
/*12*/	r0.x = r1.y / r0.x;
/*13*/	r0.x = (floatBitsToUint(r1.x) > 0x00000000u) ? r0.x : 1.000000;
/*14*/	r0.x = (floatBitsToUint(r0.z) > 0x00000000u) ? r0.w : r0.x;
/*15*/	r0.z = -vsOut_T1.y + 0.500000;
/*16*/	r0.z = abs(r0.z) + abs(r0.z);
/*17*/	r1.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*18*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*19*/	r0.w = sqrt(r0.w);
/*20*/	r0.yw = (r0.yyyw * vec4(0.000000, 5.000000, 0.000000, 0.005000)).yw;
/*21*/	r0.w = min(r0.w, 1.000000);
/*22*/	r0.w = -r0.w + 1.000000;
/*23*/	r0.z = r0.z * r0.w;
/*24*/	r0.z = -r0.z * 5.000000 + 1.000000;
/*25*/	r0.z = max(r0.z, 0.000000);
/*26*/	color0.xyz = saturate(cb2.data[0].xyzx).xyz/**/;
/*27*/	r0.x = saturate(r0.z * r0.x);
/*28*/	r0.y = sin(r0.y);
/*29*/	r0.y = r0.y * 0.500000 + 0.500000;
/*30*/	r0.x = r0.y * r0.x;
/*31*/	r0.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*32*/	if(floatBitsToUint(r0.y) != 0u) {
/*33*/	  r1.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*34*/	  r2.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*35*/	  r1.xyzw = r1.xyzw / r2.xyzw;
/*36*/	  r2.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*37*/	  r1.xyzw = r1.xyzw * r2.xyzw + cb1.data[4].xyxy;
/*38*/	  r2.xyzw = (textureLod(s_shroud, r1.zwzz.st, r1.w)).xyzw;
/*39*/	  r1.xyzw = r1.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*40*/	  r1.xyzw = saturate(r1.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*41*/	  r3.xyzw = r1.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*42*/	  r1.xyzw = r1.xyzw * r1.xyzw;
/*43*/	  r1.xyzw = r1.xyzw * r3.xyzw;
/*44*/	  r0.y = r2.x * r1.x;
/*45*/	  r0.y = r0.y * r1.y;
/*46*/	  r0.y = r1.z * -r0.y + r0.y;
/*47*/	  r0.y = r1.w * -r0.y + r0.y;
/*48*/	} else {
/*49*/	  r0.y = 1.000000;
/*50*/	}
/*51*/	r0.y = r0.y + -0.250000;
/*52*/	r0.y = saturate(r0.y * 4.000000);
/*53*/	r0.x = r0.y * r0.x;
/*54*/	color0.w = r0.x * cb2.data[0].w;
/*55*/	return;
}
