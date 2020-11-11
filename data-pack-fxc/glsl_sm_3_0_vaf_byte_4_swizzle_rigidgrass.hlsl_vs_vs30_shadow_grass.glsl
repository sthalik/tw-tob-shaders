// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 597 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidgrass.hlsl_VS_vs30_shadow_grass.glsl
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
in vec4 vsIn_N1;
in vec4 vsIn_C0;
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
layout(std140) uniform wind_VS
{
  vec4 data[3];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = vsIn_T1.w;
/*1*/	r0.y = vsIn_T2.w;
/*2*/	r0.z = vsIn_T3.w;
/*3*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*4*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*5*/	r0.x = sqrt(r0.x);
/*6*/	r0.x = r0.x * 0.010000;
/*7*/	r0.x = min(r0.x, 1.000000);
/*8*/	r0.y = saturate(vsIn_C0.w);
/*9*/	r0.x = r0.y * -r0.x + 1.000000;
/*10*/	r0.y = vsIn_P0.y + 0.600000;
/*11*/	r0.y = r0.x * r0.y + -0.600000;
/*12*/	r0.xz = (vsIn_P0.xxzx).xz;
/*13*/	r0.w = 1.000000;
/*14*/	r1.x = dot(vsIn_T1.xyzw, r0.xyzw);
/*15*/	r1.w = r1.x + cb0.data[26].x;
/*16*/	r1.w = r1.w * 5.000000;
/*17*/	r1.w = cos((r1.w));
/*18*/	r1.z = dot(vsIn_T3.xyzw, r0.xyzw);
/*19*/	r1.y = dot(vsIn_T2.xyzw, r0.xyzw);
/*20*/	r0.x = r1.z * 0.250000 + cb0.data[26].x;
/*21*/	r0.y = r0.x * 0.300000;
/*22*/	r0.xy = sin(vec2(r0.xyxx));
/*23*/	r0.y = r0.y * cb1.data[1].y;
/*24*/	r0.y = r1.w * r0.y;
/*25*/	r0.z = saturate(vsIn_C0.w + -0.700000);
/*26*/	r0.z = r0.z * cb1.data[0].w;
/*27*/	r0.y = r0.y * r0.z;
/*28*/	r0.z = cb0.data[26].x * 3.000000;
/*29*/	r0.z = sin(r0.z);
/*30*/	r0.x = r0.z * r0.x;
/*31*/	r0.x = r0.x * cb1.data[1].x;
/*32*/	r0.x = r0.x * 0.500000 + 0.500000;
/*33*/	r0.x = r0.x * cb1.data[1].x;
/*34*/	r0.z = vsIn_C0.w * cb1.data[0].w;
/*35*/	r0.zw = (r0.zzzz * cb1.data[0].xxxy).zw;
/*36*/	r0.xz = (r0.xxxx * r0.zzwz).xz;
/*37*/	r2.xz = (r0.xxzx * vec4(0.500000, 0.000000, 0.500000, 0.000000)).xz;
/*38*/	r2.y = 0;
/*39*/	r0.xyz = (r0.yyyy * vec4(0.000000, 2.333333, 0.000000, 0.000000) + r2.xyzx).xyz;
/*40*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*41*/	r0.w = 1.000000;
/*42*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*43*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*44*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*45*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*46*/	vsOut_T0.xyzw = r0.xyzw;
/*47*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*48*/	vsOut_T1.xy = (vsIn_T0.xyxx).xy;
/*49*/	r1.xyz = (vsIn_N1.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*50*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*53*/	vsOut_T2.x = dot(vec3(vsIn_T1.xyzx), vec3(r1.xyzx));
/*54*/	vsOut_T2.y = dot(vec3(vsIn_T2.xyzx), vec3(r1.xyzx));
/*55*/	vsOut_T2.z = dot(vec3(vsIn_T3.xyzx), vec3(r1.xyzx));
/*56*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*57*/	r1.x = inversesqrt(r0.w);
/*58*/	vsOut_T3.w = sqrt(r0.w);
/*59*/	vsOut_T3.xyz = (r0.xyzx * r1.xxxx).xyz;
/*60*/	return;
}
