// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 216 - fxc/glsl_SM_3_0_campaignterrain.hlsl_VS_vs30_main_coast.glsl
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
out vec4 vsOut_T3;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xz = (vsIn_P0.xxzx).xz;
/*1*/	r0.yw = (vec4(0, 0.100000, 0, 1.000000)).yw;
/*2*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*3*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*4*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*5*/	gl_Position.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*6*/	vsOut_T0.xyzw = r0.xyzw;
/*7*/	vsOut_T1.xzw = (vsIn_T1.xxxy * vec4(0.500000, 0.000000, 1.000000, 1.000000)).xzw;
/*8*/	vsOut_T1.y = vsIn_T0.y * 1.700000 + -0.350000;
/*9*/	vsOut_T2.zw = (vec4(0, 0, 0, 0)).zw;
/*10*/	r0.x = sin(vsIn_P0.x);
/*11*/	r0.x = cb0.data[26].x * 0.750000 + r0.x;
/*12*/	r0.y = vsIn_P0.z * 0.600000;
/*13*/	r0.y = sin(r0.y);
/*14*/	r0.x = r0.y + r0.x;
/*15*/	r1.x = sin(r0.x);
/*16*/	r0.y = r0.x + 3.141593;
/*17*/	r0.x = r1.x * 0.500000 + r0.x;
/*18*/	r0.x = r0.x + 0.500000;
/*19*/	r0.x = sin(r0.x);
/*20*/	r0.x = r0.x * 0.500000 + 0.200000;
/*21*/	vsOut_T3.x = saturate(r0.x * 1.500000);
/*22*/	r1.y = sin(r0.y);
/*23*/	r0.x = r1.y * 0.500000 + r0.y;
/*24*/	vsOut_T2.xy = (r1.xyxx).xy;
/*25*/	r0.x = r0.x + 0.500000;
/*26*/	r0.x = sin(r0.x);
/*27*/	r0.x = r0.x * 0.500000 + 0.200000;
/*28*/	vsOut_T3.y = saturate(r0.x * 1.500000);
/*29*/	r0.xy = (cb0.data[26].xxxx * vec4(1.125000, 0.900000, 0.000000, 0.000000)).xy;
/*30*/	r0.xy = sin(vec2(r0.xyxx));
/*31*/	r0.xy = (r0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*32*/	vsOut_T3.zw = (r0.xxxy * vec4(0.000000, 0.000000, 0.500000, 0.500000)).zw;
/*33*/	return;
}
