// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1342 - fxc/glsl_SM_3_0_rigidtreebillboard.hlsl_VS_vs30_shadow.glsl
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

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.z = 0;
/*1*/	r1.xy = (-vsIn_T1.zxzz + cb0.data[0].zxzz).xy;
/*2*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*3*/	r2.x = inversesqrt(r0.w);
/*4*/	r2.yz = (r1.xxyx * r2.xxxx).yz;
/*5*/	r0.xy = (r2.yzyy * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xy;
/*6*/	r0.xyz = (-r2.xyzx * vec4(0.000000, 0.000000, 1.000000, 0.000000) + r0.xyzx).xyz;
/*7*/	r0.w = dot(vec2(r0.xzxx), vec2(r0.xzxx));
/*8*/	r0.w = inversesqrt(r0.w);
/*9*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*10*/	r1.xyz = (vsIn_P0.yyyy * vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*11*/	r0.xyz = (vsIn_P0.xxxx * r0.xyzx + r1.xyzx).xyz;
/*12*/	r0.xyz = (r0.xyzx * vsIn_T2.wwww + vsIn_T1.xyzx).xyz;
/*13*/	r0.w = 1.000000;
/*14*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*15*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*16*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*17*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*18*/	vsOut_T1.xyz = (r0.xyzx).xyz;
/*19*/	r0.x = dot(vec2(vsIn_T2.xzxx), vec2(vsIn_T2.xzxx));
/*20*/	r0.x = inversesqrt(r0.x);
/*21*/	r0.xy = (r0.xxxx * vsIn_T2.xzxx).xy;
/*22*/	r0.z = r2.z * r0.y;
/*23*/	r0.z = r0.x * r2.y + -r0.z;
/*24*/	r0.x = dot(vec2(r0.yxyy), vec2(r2.yzyy));
/*25*/	vsOut_T2.yz = (r2.zzyz).yz;
/*26*/	r0.y = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*27*/	r0.z = abs(r0.x) * -0.018729 + 0.074261;
/*28*/	r0.z = r0.z * abs(r0.x) + -0.212114;
/*29*/	r0.z = r0.z * abs(r0.x) + 1.570729;
/*30*/	r0.w = -abs(r0.x) + 1.000000;
/*31*/	r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*32*/	r0.w = sqrt(r0.w);
/*33*/	r1.x = r0.w * r0.z;
/*34*/	r1.x = r1.x * -2.000000 + 3.141593;
/*35*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r1.x));
/*36*/	r0.x = r0.z * r0.w + r0.x;
/*37*/	r0.z = -r0.x + 6.283185;
/*38*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : r0.z;
/*39*/	r0.x = r0.x * 0.159155;
/*40*/	r0.x = fract(r0.x);
/*41*/	r0.x = r0.x * 4.000000;
/*42*/	vsOut_T0.z = floor(r0.x);
/*43*/	vsOut_T0.w = fract(r0.x);
/*44*/	vsOut_T0.xy = (vsIn_T0.xyxx).xy;
/*45*/	vsOut_T1.w = vsIn_T2.w;
/*46*/	vsOut_T2.x = -vsIn_T1.w + 1.000000;
/*47*/	vsOut_T2.w = vsIn_T3.x;
/*48*/	return;
}
