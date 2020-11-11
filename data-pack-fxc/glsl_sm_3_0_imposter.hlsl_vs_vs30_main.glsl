// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 329 - fxc/glsl_SM_3_0_imposter.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;
out vec4 vsOut_T7;

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
/*1*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*2*/	r0.w = inversesqrt(r0.w);
/*3*/	r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*4*/	r0.xyz = (r0.xyzx * r0.wwww + vec4(0.000000, 0.700000, 0.000000, 0.000000)).xyz;
/*5*/	r2.xyz = (r1.zxyz * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xyz;
/*6*/	r2.xyz = (r1.yzxy * vec4(0.000000, 0.000000, 1.000000, 0.000000) + -r2.xyzx).xyz;
/*7*/	r3.xyz = (r2.xyzx * vsIn_P2.zzzz + vsIn_P0.xyzx).xyz;
/*8*/	r3.y = r3.y + vsIn_T0.w;
/*9*/	r3.w = r3.y + -vsIn_T0.z;
/*10*/	r2.xyz = (r2.xyzx * vsIn_T0.yyyy + r3.xwzx).xyz;
/*11*/	r0.w = uintBitsToFloat((vsIn_P1.w >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*12*/	r2.xyz = (mix(r2.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*13*/	r2.w = 1.000000;
/*14*/	gl_Position.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*15*/	gl_Position.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*16*/	gl_Position.z = dot(r2.xyzw, cb0.data[11].xyzw);
/*17*/	gl_Position.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*18*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*19*/	r1.w = inversesqrt(r1.w);
/*20*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*21*/	vsOut_T0.xyz = (mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*22*/	vsOut_T4.xyz = (r1.xyzx).xyz;
/*23*/	r0.x = 1.000000;
/*24*/	r0.y = -vsIn_T3.y;
/*25*/	r0.z = -vsIn_P0.w * vsIn_T3.x + vsIn_P1.x;
/*26*/	r1.x = vsIn_P1.w * vsIn_T3.x;
/*27*/	r1.x = -r1.x * 8.000000 + r0.z;
/*28*/	r0.z = -vsIn_T3.x * 0.990000 + r1.x;
/*29*/	r1.z = floor(-r0.z);
/*30*/	r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*31*/	r1.z = r1.z + 1.000000;
/*32*/	r1.y = vsIn_P1.y;
/*33*/	r0.xy = (r0.xyxx * r1.zzzz + r1.xyxx).xy;
/*34*/	r0.xy = (mix(r1.xyxx, r0.xyxx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xy;
/*35*/	r1.xy = (vsIn_P2.xyxx * vsIn_T3.xyxx).xy;
/*36*/	r0.xy = (-r1.xyxx * vec4(0.980000, 0.990000, 0.000000, 0.000000) + r0.xyxx).xy;
/*37*/	r0.y = r0.y + vsIn_T0.z;
/*38*/	r0.y = r0.y + vsIn_T3.y;
/*39*/	r0.z = -r0.y + 1.000000;
/*40*/	r3.x = r1.x * 0.980000 + vsIn_P1.x;
/*41*/	r3.y = -r1.y * 0.990000 + vsIn_P1.y;
/*42*/	vsOut_T1.xy = (mix(r3.xyxx, r0.xzxx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*43*/	vsOut_T2.xyzw = r2.xyzw;
/*44*/	vsOut_T5.x = dot(r2.xyzw, cb0.data[1].xyzw);
/*45*/	vsOut_T5.y = dot(r2.xyzw, cb0.data[2].xyzw);
/*46*/	vsOut_T5.z = dot(r2.xyzw, cb0.data[3].xyzw);
/*47*/	vsOut_T5.w = dot(r2.xyzw, cb0.data[4].xyzw);
/*48*/	vsOut_T6.xyzw = vsIn_T1.xyzw;
/*49*/	vsOut_T7.xy = (vsIn_T2.xyxx).xy;
/*50*/	vsOut_T7.z = vsIn_P2.w;
/*51*/	return;
}
