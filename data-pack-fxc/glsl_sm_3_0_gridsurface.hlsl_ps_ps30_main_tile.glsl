//
//
// Shader Model 4
// Fragment Shader
//
// id: 298 - fxc/glsl_SM_3_0_gridsurface.hlsl_PS_ps30_main_tile.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse;
uniform sampler2D s_normal;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.x = saturate(cb2.data[0].w)/**/;
/*1*/	r0.x = -r0.x + 1.000000;
/*2*/	r0.x = r0.x * 8.000000 + -4.000000;
/*3*/	r0.y = saturate(cb2.data[1].x)/**/;
/*4*/	r0.y = -r0.y + 1.000000;
/*5*/	r0.y = r0.y * 1000.000000;
/*6*/	r1.xyz = (vsOut_T5.xyzx + -cb0.data[0].xyzx).xyz;
/*7*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*8*/	r0.z = sqrt(r0.z);
/*9*/	r0.y = r0.z / r0.y;
/*10*/	r0.z = saturate(r0.z / cb2.data[2].z);
/*11*/	r0.x = r0.y + r0.x;
/*12*/	r0.x = r0.x * 1.442695;
/*13*/	r0.x = exp2(r0.x);
/*14*/	r0.x = cb2.data[1].y / r0.x;
/*15*/	r0.x = saturate(-r0.x + cb2.data[1].y);
/*16*/	r0.x = r0.z * r0.x;
/*17*/	r1.xyzw = (texture(s_normal, vsOut_T0.xyxx.st)).xyzw;
/*18*/	r0.yzw = (r1.xxwz * vec4(0.000000, 2.000000, 2.000000, 2.000000) + vec4(0.000000, -1.000000, -1.000000, -1.000000)).yzw;
/*19*/	r1.xyz = (uintBitsToFloat(uvec4(lessThan(r0.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*20*/	r2.xyz = (mix(cb1.data[4].xyzx, cb1.data[5].xyzx, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyz/**/;
/*21*/	r3.xyz = (r0.yzwy * r0.yzwy).xyz;
/*22*/	r0.y = saturate(dot(vec3(r0.yzwy), vec3(-cb1.data[0].yzwy)));
/*23*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*24*/	r1.xyw = (mix(cb1.data[2].xyxz, cb1.data[3].xyxz, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyw/**/;
/*25*/	r4.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r1.zzzz), uvec4(0)))).xyz/**/;
/*26*/	r1.xyz = (r3.xxxx * r1.xywx + r2.xyzx).xyz;
/*27*/	r1.xyz = (r3.zzzz * r4.xyzx + r1.xyzx).xyz;
/*28*/	r0.yzw = (cb1.data[1].xxyz * r0.yyyy + r1.xxyz).yzw;
/*29*/	r1.xyzw = (texture(s_diffuse, vsOut_T0.xyxx.st)).xyzw;
/*30*/	r0.yzw = (r0.yyzw * r1.xxyz).yzw;
/*31*/	color0.w = r1.w;
/*32*/	r1.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*33*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*34*/	r1.xyz = (r1.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*35*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*36*/	r1.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*37*/	r1.xyz = (r1.xyzx * r1.wwww + -r0.yzwy).xyz;
/*38*/	color0.xyz = (r0.xxxx * r1.xyzx + r0.yzwy).xyz;
/*39*/	return;
}
