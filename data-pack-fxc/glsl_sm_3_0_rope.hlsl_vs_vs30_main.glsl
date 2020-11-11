// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1383 - fxc/glsl_SM_3_0_rope.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_N0;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xyz = (-vsIn_P0.xyzx + cb0.data[0].xyzx).xyz;
/*1*/	r1.xyz = (r0.zxyz * vsIn_N0.yzxy).xyz;
/*2*/	r1.xyz = (r0.yzxy * vsIn_N0.zxyz + -r1.xyzx).xyz;
/*3*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*4*/	r0.w = inversesqrt(r0.w);
/*5*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*6*/	r2.xyz = (r1.xyzx * vsIn_T1.xxxx + vsIn_P0.xyzx).xyz;
/*7*/	r2.w = 1.000000;
/*8*/	gl_Position.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*9*/	gl_Position.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*10*/	gl_Position.z = dot(r2.xyzw, cb0.data[11].xyzw);
/*11*/	gl_Position.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*12*/	vsOut_T5.xyzw = r2.xyzw;
/*13*/	vsOut_T0.w = 0;
/*14*/	r0.w = dot(vec3(vsIn_N0.xyzx), vec3(vsIn_N0.xyzx));
/*15*/	r0.w = inversesqrt(r0.w);
/*16*/	r2.xyz = (r0.wwww * vsIn_N0.xyzx).xyz;
/*17*/	r3.xyz = (r1.yzxy * r2.zxyz).xyz;
/*18*/	r3.xyz = (r2.yzxy * r1.zxyz + -r3.xyzx).xyz;
/*19*/	vsOut_T1.xyz = (r1.xyzx).xyz;
/*20*/	vsOut_T0.xyz = (r3.xyzx).xyz;
/*21*/	vsOut_T2.xyz = (r2.xyzx).xyz;
/*22*/	vsOut_T3.xy = (vsIn_T0.xyxx).xy;
/*23*/	vsOut_T3.zw = (vsIn_T2.xxxy).zw;
/*24*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*25*/	r0.w = inversesqrt(r0.w);
/*26*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*27*/	vsOut_T4.z = dot(vec3(r0.xyzx), vec3(r2.xyzx));
/*28*/	r0.x = abs(r3.y) * -0.018729 + 0.074261;
/*29*/	r0.x = r0.x * abs(r3.y) + -0.212114;
/*30*/	r0.x = r0.x * abs(r3.y) + 1.570729;
/*31*/	r0.y = -abs(r3.y) + 1.000000;
/*32*/	r0.y = sqrt(r0.y);
/*33*/	r0.z = r0.y * r0.x;
/*34*/	r0.z = r0.z * -2.000000 + 3.141593;
/*35*/	r0.w = uintBitsToFloat((r3.y < -r3.y) ? 0xffffffffu : 0x00000000u);
/*36*/	r1.x = uintBitsToFloat((r3.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*37*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.z));
/*38*/	r0.x = r0.x * r0.y + r0.z;
/*39*/	r0.y = -r0.x + 6.283185;
/*40*/	r0.x = (floatBitsToUint(r1.x) > 0x00000000u) ? r0.y : r0.x;
/*41*/	vsOut_T4.x = r0.x * 0.159155;
/*42*/	vsOut_T4.y = vsIn_T1.y;
/*43*/	return;
}
