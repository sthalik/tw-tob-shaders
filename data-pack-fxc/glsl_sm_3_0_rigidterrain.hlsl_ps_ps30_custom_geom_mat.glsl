//
//
// Shader Model 4
// Fragment Shader
//
// id: 1474 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_custom_geom_mat.glsl
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

uniform sampler2D s_albedo_map;
uniform sampler2D s_shroud;

layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb0;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.x = vsOut_T2.x * 10.000000;
/*1*/	r1.xyzw = (texture(s_albedo_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.y = uintBitsToFloat((0.500000 < cb0.data[0].x) ? 0xffffffffu : 0x00000000u);
/*3*/	if(floatBitsToUint(r0.y) != 0u) {
/*4*/	  r2.xyzw = vsOut_T0.xzxz + -cb0.data[1].xyxy;
/*5*/	  r3.xyzw = -cb0.data[1].xyxy + cb0.data[1].zwzw;
/*6*/	  r2.xyzw = r2.xyzw / r3.xyzw;
/*7*/	  r3.xyzw = -cb0.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*8*/	  r2.xyzw = r2.xyzw * r3.xyzw + cb0.data[4].xyxy;
/*9*/	  r3.xyzw = (textureLod(s_shroud, r2.zwzz.st, r2.w)).xyzw;
/*10*/	  r2.xyzw = r2.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*11*/	  r2.xyzw = saturate(r2.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*12*/	  r4.xyzw = r2.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*13*/	  r2.xyzw = r2.xyzw * r2.xyzw;
/*14*/	  r2.xyzw = r2.xyzw * r4.xyzw;
/*15*/	  r0.y = r3.x * r2.x;
/*16*/	  r0.y = r0.y * r2.y;
/*17*/	  r0.y = r2.z * -r0.y + r0.y;
/*18*/	  r0.y = r2.w * -r0.y + r0.y;
/*19*/	} else {
/*20*/	  r0.y = 1.000000;
/*21*/	}
/*22*/	r0.yz = (r0.yyyy + vec4(0.000000, -0.500000, -0.100000, 0.000000)).yz;
/*23*/	r0.y = saturate(r0.y + r0.y);
/*24*/	r0.w = r0.y * -2.000000 + 3.000000;
/*25*/	r0.y = r0.y * r0.y;
/*26*/	r0.y = r0.y * r0.w;
/*27*/	r0.z = saturate(r0.z * 2.500000);
/*28*/	r0.w = r0.z * -2.000000 + 3.000000;
/*29*/	r0.z = r0.z * r0.z;
/*30*/	r0.z = r0.z * r0.w;
/*31*/	r0.z = r0.z * 0.200000;
/*32*/	r2.xyz = saturate(r0.zzzz * r1.xyzx).xyz;
/*33*/	r1.xyz = (r1.xyzx + -r2.xyzx).xyz;
/*34*/	r0.yzw = (r0.yyyy * r1.xxyz + r2.xxyz).yzw;
/*35*/	color0.xyz = (r0.xxxx * r0.yzwy).xyz;
/*36*/	color0.w = vsOut_T2.x * 10.000000;
/*37*/	color1.xyz = (vsOut_T4.xyzx).xyz;
/*38*/	color1.w = vsOut_T2.x * 10.000000;
/*39*/	color2.xyzw = vec4(0, 0, 0, 0);
/*40*/	return;
}
