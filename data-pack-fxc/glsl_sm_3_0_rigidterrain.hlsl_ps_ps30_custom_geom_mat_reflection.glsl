//
//
// Shader Model 4
// Fragment Shader
//
// id: 1478 - fxc/glsl_SM_3_0_rigidterrain.hlsl_PS_ps30_custom_geom_mat_reflection.glsl
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
in vec4 vsOut_T4;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_albedo_map;
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
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  color4 = uint(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xyzw = (texture(s_albedo_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*2*/	r1.w = 1.000000;
/*3*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*4*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*5*/	r1.y = uintBitsToFloat((0.500000 < cb1.data[0].x) ? 0xffffffffu : 0x00000000u);
/*6*/	if(floatBitsToUint(r1.y) != 0u) {
/*7*/	  r2.xyzw = vsOut_T0.xzxz + -cb1.data[1].xyxy;
/*8*/	  r3.xyzw = -cb1.data[1].xyxy + cb1.data[1].zwzw;
/*9*/	  r2.xyzw = r2.xyzw / r3.xyzw;
/*10*/	  r3.xyzw = -cb1.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*11*/	  r2.xyzw = r2.xyzw * r3.xyzw + cb1.data[4].xyxy;
/*12*/	  r3.xyzw = (textureLod(s_shroud, r2.zwzz.st, r2.w)).xyzw;
/*13*/	  r2.xyzw = r2.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*14*/	  r2.xyzw = saturate(r2.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*15*/	  r4.xyzw = r2.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*16*/	  r2.xyzw = r2.xyzw * r2.xyzw;
/*17*/	  r2.xyzw = r2.xyzw * r4.xyzw;
/*18*/	  r1.y = r3.x * r2.x;
/*19*/	  r1.y = r1.y * r2.y;
/*20*/	  r1.y = r2.z * -r1.y + r1.y;
/*21*/	  r1.y = r2.w * -r1.y + r1.y;
/*22*/	} else {
/*23*/	  r1.y = 1.000000;
/*24*/	}
/*25*/	r1.yz = (r1.yyyy + vec4(0.000000, -0.500000, -0.100000, 0.000000)).yz;
/*26*/	r1.y = saturate(r1.y + r1.y);
/*27*/	r1.w = r1.y * -2.000000 + 3.000000;
/*28*/	r1.y = r1.y * r1.y;
/*29*/	r1.y = r1.y * r1.w;
/*30*/	r1.z = saturate(r1.z * 2.500000);
/*31*/	r1.w = r1.z * -2.000000 + 3.000000;
/*32*/	r1.z = r1.z * r1.z;
/*33*/	r1.z = r1.z * r1.w;
/*34*/	r1.z = r1.z * 0.200000;
/*35*/	r2.xyz = saturate(r0.xyzx * r1.zzzz).xyz;
/*36*/	r0.xyz = (r0.xyzx + -r2.xyzx).xyz;
/*37*/	r0.xyz = (r1.yyyy * r0.xyzx + r2.xyzx).xyz;
/*38*/	r1.y = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*39*/	r1.y = inversesqrt(r1.y);
/*40*/	r1.yzw = (r1.yyyy * vsOut_T4.xxyz).yzw;
/*41*/	color3.x = r0.w / r1.x;
/*42*/	r0.w = max(abs(r1.w), abs(r1.z));
/*43*/	r0.w = max(r0.w, abs(r1.y));
/*44*/	r1.xyz = (r1.yzwy / r0.wwww).xyz;
/*45*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*46*/	color0.w = 0;
/*47*/	r0.xyz = (sqrt(r0.xyzx)).xyz;
/*48*/	color1.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*49*/	color1.w = 0;
/*50*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.003922);
/*51*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*52*/	color4 = uint(0);
/*53*/	return;
}
