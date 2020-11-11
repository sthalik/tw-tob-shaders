// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 1327 - fxc/glsl_SM_3_0_VAF_BYTE_4_SWIZZLE_rigidtextureblendwind.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_N0;
in vec4 vsIn_N1;
in vec4 vsIn_N2;
in vec4 vsIn_C0;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_T1;

out vec4 vsOut_T0;
out vec4 vsOut_C3;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_C0;
out vec4 vsOut_C1;
out vec4 vsOut_C2;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform texture_scale
{
  vec4 data[9];
} cb1;
layout(std140) uniform texture_blend_PS
{
  vec4 data[25];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyz = (vsIn_N0.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*1*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*2*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*3*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*4*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*5*/	r0.x = inversesqrt(r0.x);
/*6*/	r0.xyz = (r0.xxxx * r1.xyzx).xyz;
/*7*/	r1.y = 0;
/*8*/	r0.w = cb0.data[26].x + cb1.data[8].x;
/*9*/	r1.w = r0.w * 4.000000;
/*10*/	r2.xyz = (vsIn_P0.xyzx).xyz;
/*11*/	r2.w = 1.000000;
/*12*/	r3.y = dot(r2.xyzw, vsIn_P2.xyzw);
/*13*/	r4.xy = (r3.yyyy * vec4(5.000000, 15.000000, 0.000000, 0.000000) + r1.wwww).xy;
/*14*/	r4.xy = sin(vec2(r4.xyxx));
/*15*/	r4.xy = (r4.xyxx * vec4(0.080000, 0.020000, 0.000000, 0.000000)).xy;
/*16*/	r1.w = sin(r0.w);
/*17*/	r1.w = r1.w * r4.x;
/*18*/	r1.xz = (r1.wwww * vec4(0.600000, 0.000000, 0.600000, 0.000000)).xz;
/*19*/	r4.xz = (r0.wwww + vec4(-2.700000, 0.000000, 4.200000, 0.000000)).xz;
/*20*/	r0.w = r0.w * 2.000000 + r3.y;
/*21*/	r0.w = sin(r0.w);
/*22*/	r0.w = r0.w * 0.400000;
/*23*/	r4.xz = (r4.xxzx * vec4(0.600000, 0.000000, 1.600000, 0.000000)).xz;
/*24*/	r5.xy = sin(vec2(r4.xzxx));
/*25*/	r5.z = r0.w * r5.x;
/*26*/	r1.xyz = (r5.xxzx * vec4(0.000000, 0.000000, 0.600000, 0.000000) + r1.xyzx).xyz;
/*27*/	r0.w = r4.y * r5.y;
/*28*/	r4.xz = (r0.wwww * vec4(0.600000, 0.000000, 0.600000, 0.000000)).xz;
/*29*/	r4.y = 0;
/*30*/	r1.xyz = (r1.xyzx + r4.xyzx).xyz;
/*31*/	r1.xyz = (r1.xyzx * vsIn_C0.wwww).xyz;
/*32*/	r0.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*33*/	r0.w = inversesqrt(r0.w);
/*34*/	r4.xy = (r0.wwww * r1.xzxx).xy;
/*35*/	r0.w = saturate(dot(vec2(r0.xzxx), vec2(-r4.xyxx)));
/*36*/	vsOut_T1.xyz = (r0.xyzx).xyz;
/*37*/	r0.x = -vsIn_C0.y + 0.800000;
/*38*/	r0.xyz = (r1.xyzx * r0.xxxx + -r1.xyzx).xyz;
/*39*/	r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*40*/	r3.x = dot(r2.xyzw, vsIn_P1.xyzw);
/*41*/	r3.z = dot(r2.xyzw, vsIn_P3.xyzw);
/*42*/	r0.xyz = (r0.xyzx * vsIn_T1.xxxx + r3.xyzx).xyz;
/*43*/	r0.w = 1.000000;
/*44*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*45*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*46*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*47*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*48*/	vsOut_T0.xyzw = r0.xyzw;
/*49*/	vsOut_T3.w = dot(r0.xyzw, cb0.data[3].xyzw);
/*50*/	vsOut_T1.w = vsIn_T0.y;
/*51*/	r0.xyz = (vsIn_N1.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*52*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*53*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*54*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*55*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*56*/	r0.x = inversesqrt(r0.x);
/*57*/	vsOut_T2.xyz = (r0.xxxx * r1.xyzx).xyz;
/*58*/	vsOut_T2.w = vsIn_T1.y;
/*59*/	r0.xyz = (vsIn_N2.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*60*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*61*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*62*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*63*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*64*/	r0.x = inversesqrt(r0.x);
/*65*/	vsOut_T3.xyz = (r0.xxxx * r1.xyzx).xyz;
/*66*/	vsOut_T4.xy = (vsIn_T0.xyxx).xy;
/*67*/	vsOut_T5.xy = (vsIn_C0.wzww).xy;
/*68*/	vsOut_T5.zw = (vsIn_T1.zzzw).zw;
/*69*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[17].xyxx).xy;
/*70*/	vsOut_C0.xy = (r0.xyxx / cb2.data[17].zwzz).xy;
/*71*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[18].xyxx).xy;
/*72*/	vsOut_C0.zw = (r0.xxxy / cb2.data[18].zzzw).zw;
/*73*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[19].xyxx).xy;
/*74*/	vsOut_C1.xy = (r0.xyxx / cb2.data[19].zwzz).xy;
/*75*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[20].xyxx).xy;
/*76*/	vsOut_C1.zw = (r0.xxxy / cb2.data[20].zzzw).zw;
/*77*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[21].xyxx).xy;
/*78*/	vsOut_C2.xy = (r0.xyxx / cb2.data[21].zwzz).xy;
/*79*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[22].xyxx).xy;
/*80*/	vsOut_C2.zw = (r0.xxxy / cb2.data[22].zzzw).zw;
/*81*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[23].xyxx).xy;
/*82*/	vsOut_C3.xy = (r0.xyxx / cb2.data[23].zwzz).xy;
/*83*/	r0.xy = (vsIn_T0.xyxx + -cb2.data[24].xyxx).xy;
/*84*/	vsOut_C3.zw = (r0.xxxy / cb2.data[24].zzzw).zw;
/*85*/	return;
}
