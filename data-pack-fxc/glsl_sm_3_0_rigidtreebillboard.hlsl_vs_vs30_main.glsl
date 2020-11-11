// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1347 - fxc/glsl_SM_3_0_rigidtreebillboard.hlsl_VS_vs30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsIn_P0;
in vec4 vsIn_T0;
in vec4 vsIn_T1;
in vec4 vsIn_T2;
in vec4 vsIn_T3;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;

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

/*0*/	r0.xyz = (vsIn_P0.yyyy * vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*1*/	r1.z = 0;
/*2*/	r2.xy = (-vsIn_T1.zxzz + cb0.data[0].zxzz).xy;
/*3*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*4*/	r3.x = inversesqrt(r0.w);
/*5*/	r3.yz = (r2.xxyx * r3.xxxx).yz;
/*6*/	r1.xy = (r3.yzyy * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xy;
/*7*/	r1.xyz = (-r3.xyzx * vec4(0.000000, 0.000000, 1.000000, 0.000000) + r1.xyzx).xyz;
/*8*/	r0.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*9*/	r0.w = inversesqrt(r0.w);
/*10*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*11*/	r0.xyz = (vsIn_P0.xxxx * r1.xyzx + r0.xyzx).xyz;
/*12*/	vsOut_T0.xy = (r1.xzxx).xy;
/*13*/	r0.xyz = (r0.xyzx * vsIn_T2.wwww + vsIn_T1.xyzx).xyz;
/*14*/	r0.w = 1.000000;
/*15*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*16*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*17*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*18*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*19*/	vsOut_T2.xyz = (r0.xyzx).xyz;
/*20*/	vsOut_T0.zw = (r3.zzzy).zw;
/*21*/	r0.x = dot(vec2(vsIn_T2.xzxx), vec2(vsIn_T2.xzxx));
/*22*/	r0.x = inversesqrt(r0.x);
/*23*/	r0.xy = (r0.xxxx * vsIn_T2.xzxx).xy;
/*24*/	r0.z = r3.z * r0.y;
/*25*/	r0.z = r0.x * r3.y + -r0.z;
/*26*/	r0.x = dot(vec2(r0.yxyy), vec2(r3.yzyy));
/*27*/	r0.y = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*28*/	r0.z = abs(r0.x) * -0.018729 + 0.074261;
/*29*/	r0.z = r0.z * abs(r0.x) + -0.212114;
/*30*/	r0.z = r0.z * abs(r0.x) + 1.570729;
/*31*/	r0.w = -abs(r0.x) + 1.000000;
/*32*/	r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*33*/	r0.w = sqrt(r0.w);
/*34*/	r1.x = r0.w * r0.z;
/*35*/	r1.x = r1.x * -2.000000 + 3.141593;
/*36*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r1.x));
/*37*/	r0.x = r0.z * r0.w + r0.x;
/*38*/	r0.z = -r0.x + 6.283185;
/*39*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : r0.z;
/*40*/	r0.x = r0.x * 0.159155;
/*41*/	r0.x = fract(r0.x);
/*42*/	r0.x = r0.x * 4.000000;
/*43*/	vsOut_T1.z = floor(r0.x);
/*44*/	vsOut_T1.w = fract(r0.x);
/*45*/	vsOut_T1.xy = (vsIn_T0.xyxx).xy;
/*46*/	vsOut_T2.w = vsIn_T2.w;
/*47*/	vsOut_T3.x = vsIn_T2.y;
/*48*/	vsOut_T3.y = -vsIn_T1.w + 1.000000;
/*49*/	vsOut_T3.z = vsIn_T3.x;
/*50*/	return;
}
