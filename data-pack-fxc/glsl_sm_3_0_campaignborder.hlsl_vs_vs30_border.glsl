// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 213 - fxc/glsl_SM_3_0_campaignborder.hlsl_VS_vs30_border.glsl
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

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform campaign_border_PS
{
  vec4 data[7];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xz = (vsIn_T0.xxyx).xz;
/*1*/	r0.y = 0;
/*2*/	r1.xz = (vsIn_P0.xxyx).xz;
/*3*/	r1.y = 0;
/*4*/	r2.xz = (vsIn_P0.zzwz).xz;
/*5*/	r2.y = 0;
/*6*/	r3.y = vsIn_T1.x * vsIn_T1.x;
/*7*/	r4.x = r3.y * 3.000000;
/*8*/	r4.y = vsIn_T1.x * 2.000000;
/*9*/	r4.z = 1.000000;
/*10*/	r0.w = dot(vec3(r4.xyzx), vec3(cb1.data[1].xyzx));
/*11*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*12*/	r0.w = dot(vec3(r4.xyzx), vec3(cb1.data[0].xyzx));
/*13*/	r1.xyz = (r1.xyzx * r0.wwww + r2.xyzx).xyz;
/*14*/	r0.w = dot(vec3(r4.xyzx), vec3(cb1.data[2].xyzx));
/*15*/	r1.w = dot(vec3(r4.xyzx), vec3(cb1.data[3].xyzx));
/*16*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*17*/	r1.xz = (vsIn_T0.zzwz).xz;
/*18*/	r1.y = 0;
/*19*/	r0.xyz = (r1.xyzx * r1.wwww + r0.xyzx).xyz;
/*20*/	r0.xyz = (r0.xyzx + vec4(0.000001, 0.000001, 0.000001, 0.000000)).xyz;
/*21*/	r0.y = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*22*/	r1.x = inversesqrt(r0.y);
/*23*/	r1.yz = (r0.xxzx * r1.xxxx).yz;
/*24*/	r0.xy = (r1.zxzz * vec4(1.000000, 0.000000, 0.000000, 0.000000)).xy;
/*25*/	r0.xy = (r1.xyxx * vec4(0.000000, 1.000000, 0.000000, 0.000000) + -r0.xyxx).xy;
/*26*/	r3.x = r3.y * vsIn_T1.x;
/*27*/	r3.z = vsIn_T1.x;
/*28*/	r3.w = 1.000000;
/*29*/	r0.z = dot(r3.xyzw, cb1.data[1].xyzw);
/*30*/	r0.zw = (r0.zzzz * vsIn_P0.zzzw).zw;
/*31*/	r1.x = dot(r3.xyzw, cb1.data[0].xyzw);
/*32*/	r0.zw = (vsIn_P0.xxxy * r1.xxxx + r0.zzzw).zw;
/*33*/	r1.x = dot(r3.xyzw, cb1.data[2].xyzw);
/*34*/	r1.y = dot(r3.xyzw, cb1.data[3].xyzw);
/*35*/	r0.zw = (vsIn_T0.xxxy * r1.xxxx + r0.zzzw).zw;
/*36*/	r0.zw = (vsIn_T0.zzzw * r1.yyyy + r0.zzzw).zw;
/*37*/	r0.xy = (r0.xyxx * vsIn_T1.wwww + r0.zwzz).xy;
/*38*/	r0.z = 1.000000;
/*39*/	r1.x = dot(vec3(r0.xyzx), vec3(cb0.data[9].xzwx));
/*40*/	r1.y = dot(vec3(r0.xyzx), vec3(cb0.data[10].xzwx));
/*41*/	r1.z = dot(vec3(r0.xyzx), vec3(cb0.data[11].xzwx));
/*42*/	r1.w = dot(vec3(r0.xyzx), vec3(cb0.data[12].xzwx));
/*43*/	vsOut_T0.xz = (r0.xxyx).xz;
/*44*/	gl_Position.xyzw = r1.xyzw;
/*45*/	vsOut_T2.xyzw = r1.xyzw;
/*46*/	vsOut_T0.yw = (vec4(0, 0, 0, 1.000000)).yw;
/*47*/	r0.x = uintBitsToFloat((0.000000 < vsIn_T1.w) ? 0xffffffffu : 0x00000000u);
/*48*/	vsOut_T1.y = uintBitsToFloat(floatBitsToUint(r0.x) & uint(0x3f800000u));
/*49*/	vsOut_T1.x = vsIn_T1.z * vsIn_T1.x + vsIn_T1.y;
/*50*/	return;
}
