// Flat Varyings: 5 6 7 10

//
// Shader Model 4
// Vertex Shader
//
// id: 468 - fxc/glsl_SM_4_0_VAF_BYTE_4_SWIZZLE_rigidcommon.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_P5;
in vec4 vsIn_P6;
in vec4 vsIn_P7;
in vec4 vsIn_N0;
in vec4 vsIn_N1;
in vec4 vsIn_N2;
in vec4 vsIn_C0;
in vec4 vsIn_P1;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;

out vec4 vsOut_T0;
out vec4 vsOut_C2;
flat out vec4 vsOut_N0;
flat out uint vsOut_P1;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
flat out vec4 vsOut_T5;
flat out vec4 vsOut_T6;
flat out vec4 vsOut_T7;
out vec4 vsOut_C1;

uniform usampler2D t_pixel_selection_object_id_texture;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;
layout(std140) uniform wind_VS
{
  vec4 data[3];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xyz = (vsIn_P0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, vsIn_P1.xyzw);
/*3*/	r1.y = dot(r0.xyzw, vsIn_P2.xyzw);
/*4*/	r1.z = dot(r0.xyzw, vsIn_P3.xyzw);
/*5*/	r1.w = 1.000000;
/*6*/	r0.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*7*/	r0.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*8*/	r0.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*9*/	gl_Position.xyw = (r0.xyxw).xyw;
/*10*/	vsOut_C1.xyz = (r0.xywx).xyz;
/*11*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*12*/	vsOut_T0.xyzw = r1.xyzw;
/*13*/	vsOut_T1.xyzw = vsIn_T0.xyzw;
/*14*/	r0.xyz = (vsIn_N0.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*15*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*16*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*17*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*18*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*19*/	r0.x = inversesqrt(r0.x);
/*20*/	vsOut_T2.xyz = (r0.xxxx * r1.xyzx).xyz;
/*21*/	vsOut_T2.w = cb2.data[0].x/**/;
/*22*/	r0.xyz = (vsIn_N1.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*23*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*24*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*25*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*26*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*27*/	r0.x = inversesqrt(r0.x);
/*28*/	vsOut_T3.xyz = (r0.xxxx * r1.xyzx).xyz;
/*29*/	vsOut_T3.w = cb2.data[0].y/**/;
/*30*/	r0.xyz = (vsIn_N2.zyxz * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*31*/	r1.x = dot(vec3(r0.xyzx), vec3(vsIn_P1.xyzx));
/*32*/	r1.y = dot(vec3(r0.xyzx), vec3(vsIn_P2.xyzx));
/*33*/	r1.z = dot(vec3(r0.xyzx), vec3(vsIn_P3.xyzx));
/*34*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*35*/	r0.x = inversesqrt(r0.x);
/*36*/	vsOut_T4.xyz = (r0.xxxx * r1.xyzx).xyz;
/*37*/	vsOut_T5.xyzw = vsIn_P4.xyzw;
/*38*/	vsOut_T6.xyzw = vsIn_P5.xyzw;
/*39*/	vsOut_T7.xyzw = vsIn_P6.xyzw;
/*40*/	vsOut_C1.w = vsIn_P4.y;
/*41*/	vsOut_C2.xyzw = vsIn_C0.zyxw;
/*42*/	vsOut_N0.xyzw = vsIn_P7.xyzw;
/*43*/	r0.x = intBitsToFloat(gl_InstanceID + floatBitsToInt(cb1.data[4].w));
/*44*/	r0.yzw = (vec4(0, 0, 0, 0)).yzw;
/*45*/	r0.xyzw = uintBitsToFloat(texelFetch(t_pixel_selection_object_id_texture, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*46*/	vsOut_P1 = floatBitsToUint(r0.x);
/*47*/	return;
}
