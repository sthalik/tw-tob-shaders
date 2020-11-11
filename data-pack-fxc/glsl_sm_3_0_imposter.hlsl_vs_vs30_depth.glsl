// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 326 - fxc/glsl_SM_3_0_imposter.hlsl_VS_vs30_depth.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_T0;
in vec4 vsIn_T3;

out vec4 vsOut_T0;
out vec4 vsOut_T1;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyz = (cb0.data[3].zxyz * vec4(-1.000000, 0.000000, 0.000000, 0.000000)).xyz;
/*1*/	r0.xyz = (cb0.data[3].yzxy * vec4(0.000000, 0.000000, -1.000000, 0.000000) + -r0.xyzx).xyz;
/*2*/	r1.xyz = (r0.xyzx * vsIn_T0.xxxx + vsIn_P0.xyzx).xyz;
/*3*/	r1.w = r1.y + vsIn_T0.z;
/*4*/	r0.xyz = (r0.xyzx * vsIn_T0.yyyy + r1.xwzx).xyz;
/*5*/	r0.w = uintBitsToFloat((vsIn_P1.w >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*6*/	r1.xyz = (mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*7*/	r1.w = 1.000000;
/*8*/	gl_Position.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*9*/	gl_Position.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*10*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*11*/	gl_Position.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*12*/	vsOut_T0.xyzw = r1.xyzw;
/*13*/	r0.x = 1.000000;
/*14*/	r0.y = -vsIn_T3.y;
/*15*/	r0.z = -vsIn_P0.w * vsIn_T3.x + vsIn_P1.x;
/*16*/	r1.x = vsIn_P1.w * vsIn_T3.x;
/*17*/	r1.x = -r1.x * 8.000000 + r0.z;
/*18*/	r0.z = -vsIn_T3.x * 0.990000 + r1.x;
/*19*/	r1.z = floor(-r0.z);
/*20*/	r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	r1.z = r1.z + 1.000000;
/*22*/	r1.y = vsIn_P1.y;
/*23*/	r0.xy = (r0.xyxx * r1.zzzz + r1.xyxx).xy;
/*24*/	r0.xy = (mix(r1.xyxx, r0.xyxx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xy;
/*25*/	r1.xy = (vsIn_P2.xyxx * vsIn_T3.xyxx).xy;
/*26*/	r0.xy = (-r1.xyxx * vec4(0.960000, 0.960000, 0.000000, 0.000000) + r0.xyxx).xy;
/*27*/	r0.y = r0.y + vsIn_T3.y;
/*28*/	r0.z = -r0.y + 1.000000;
/*29*/	r1.x = vsIn_P2.x * vsIn_T3.x + vsIn_P1.x;
/*30*/	r1.y = -vsIn_P2.y * vsIn_T3.y + vsIn_P1.y;
/*31*/	vsOut_T1.xy = (mix(r1.xyxx, r0.xzxx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*32*/	return;
}
