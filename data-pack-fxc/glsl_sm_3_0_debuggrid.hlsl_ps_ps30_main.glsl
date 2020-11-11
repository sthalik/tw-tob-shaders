//
//
// Shader Model 4
// Fragment Shader
//
// id: 250 - fxc/glsl_SM_3_0_debuggrid.hlsl_PS_ps30_main.glsl
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
in vec4 vsOut_T1;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_diffuse_map2;

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

/*0*/	r0.x = dot(vec3(vsOut_T0.xyzx), vec3(vsOut_T0.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.xyz = (r0.xxxx * vsOut_T0.xyzx).xyz;
/*3*/	r1.xyz = (r0.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*4*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb0.data[0].yzwy));
/*5*/	r0.x = max(r0.x, 0.000000);
/*6*/	r0.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*7*/	r0.y = inversesqrt(r0.y);
/*8*/	r0.yzw = (r0.yyyy * r1.xxyz).yzw;
/*9*/	r1.xyz = (uintBitsToFloat(uvec4(lessThan(r0.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*10*/	r0.yzw = (r0.yyzw * r0.yyzw).yzw;
/*11*/	r2.xyz = (mix(cb0.data[2].xyzx, cb0.data[3].xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz/**/;
/*12*/	r1.xyw = (mix(cb0.data[4].xyxz, cb0.data[5].xyxz, greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyw/**/;
/*13*/	r3.xyz = (mix(cb0.data[6].xyzx, cb0.data[7].xyzx, greaterThan(floatBitsToUint(r1.zzzz), uvec4(0)))).xyz/**/;
/*14*/	r1.xyz = (r0.zzzz * r1.xywx).xyz;
/*15*/	r1.xyz = (r0.yyyy * r2.xyzx + r1.xyzx).xyz;
/*16*/	r0.yzw = (r0.wwww * r3.xxyz + r1.xxyz).yzw;
/*17*/	r1.x = uintBitsToFloat((0.000000 < cb0.data[11].x) ? 0xffffffffu : 0x00000000u);
/*18*/	r1.xy = (mix(vec4(1.000000, 1.000000, 0, 0), vec4(0.004000, 360.000000, 0, 0), greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xy;
/*19*/	r0.yzw = (r0.yyzw * r1.yyyy).yzw;
/*20*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*21*/	r2.xyzw = r2.xyzw * vsOut_C0.xyzw;
/*22*/	r3.xyzw = (texture(s_diffuse_map2, vsOut_T1.zwzz.st)).xyzw;
/*23*/	r2.xyzw = r2.xyzw * r3.xyzw;
/*24*/	r0.yzw = (r0.yyzw * r2.xxyz).yzw;
/*25*/	r1.yzw = (r0.xxxx * r2.xxyz).yzw;
/*26*/	color0.w = r2.w;
/*27*/	r1.yzw = (r1.yyzw * cb0.data[1].xxyz).yzw;
/*28*/	r1.yzw = (r1.xxxx * r1.yyzw).yzw;
/*29*/	color0.xyz = (r0.yzwy * r1.xxxx + r1.yzwy).xyz;
/*30*/	return;
}
