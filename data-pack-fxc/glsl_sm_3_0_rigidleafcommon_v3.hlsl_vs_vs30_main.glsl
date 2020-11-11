// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 610 - fxc/glsl_SM_3_0_rigidleafcommon_v3.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_T2;
in vec4 vsIn_T3;
in vec4 vsIn_T4;
in vec4 vsIn_T5;
in vec4 vsIn_T6;
in vec4 vsIn_P2;
in vec4 vsIn_P3;
in vec4 vsIn_P4;
in vec4 vsIn_P5;
in vec4 vsIn_P6;
in vec4 vsIn_P7;
in vec4 vsIn_T0;
in vec4 vsIn_T1;

out vec4 vsOut_T0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
flat out uint vsOut_P1;

uniform usampler2D t_pixel_selection_object_id_texture;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform wind_VS
{
  vec4 data[3];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = vsIn_T6.x * 4.000000 + cb0.data[26].x;
/*1*/	r0.yz = (cb0.data[26].xxxx * vec4(0.000000, 3.000000, 0.500000, 0.000000)).yz;
/*2*/	r0.xyz = sin(vec3(r0.xyzx));
/*3*/	r0.x = r0.y * r0.x;
/*4*/	r0.y = r0.z * 0.500000 + 0.750000;
/*5*/	r0.x = r0.x * cb1.data[1].x;
/*6*/	r0.x = r0.x * 0.500000 + 1.000000;
/*7*/	r0.x = r0.y * r0.x;
/*8*/	r0.x = r0.x * cb1.data[1].x;
/*9*/	r0.y = vsIn_P7.w * cb1.data[0].w;
/*10*/	r0.y = r0.y * vsIn_P7.w;
/*11*/	r0.yz = (r0.yyyy * cb1.data[0].xxyx).yz;
/*12*/	r0.xz = (r0.xxxx * r0.yyzy).xz;
/*13*/	r0.w = uintBitsToFloat((0.000000 < vsIn_P6.y) ? 0xffffffffu : 0x00000000u);
/*14*/	r1.x = uintBitsToFloat((vsIn_P6.y < 1.000000) ? 0xffffffffu : 0x00000000u);
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r1.x));
/*16*/	r1.x = -vsIn_P6.y + 1.000000;
/*17*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? saturate(r1.x) : saturate(vsIn_P6.y);
/*18*/	r1.x = dot(vsIn_T3.xyzw, vsIn_P1.xyzw);
/*19*/	r1.y = dot(vsIn_T4.xyzw, vsIn_P1.xyzw);
/*20*/	r1.z = dot(vsIn_T5.xyzw, vsIn_P1.xyzw);
/*21*/	r1.w = vsIn_P1.w;
/*22*/	r2.x = dot(vsIn_T0.xyzw, vsIn_P0.xyzw);
/*23*/	r2.y = dot(vsIn_T1.xyzw, vsIn_P0.xyzw);
/*24*/	r2.z = dot(vsIn_T2.xyzw, vsIn_P0.xyzw);
/*25*/	r2.w = vsIn_P0.w;
/*26*/	r1.xyzw = r1.xyzw + -r2.xyzw;
/*27*/	r1.xyzw = r0.wwww * r1.xyzw + r2.xyzw;
/*28*/	r0.y = 0;
/*29*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*30*/	r0.w = r1.x + cb0.data[26].x;
/*31*/	r0.w = r0.w * 6.000000;
/*32*/	r0.w = sin(r0.w);
/*33*/	r2.x = vsIn_T6.x * 2.000000 + cb0.data[26].x;
/*34*/	r2.x = r2.x * 0.300000;
/*35*/	r2.x = sin(r2.x);
/*36*/	r2.x = r2.x * cb1.data[1].y;
/*37*/	r0.w = r0.w * r2.x;
/*38*/	r2.x = saturate(vsIn_P7.w + -0.700000);
/*39*/	r2.x = r2.x * cb1.data[0].w;
/*40*/	r0.w = r0.w * r2.x;
/*41*/	r1.xyz = (r0.wwww * vec4(0.000000, 3.333333, 0.000000, 0.000000) + r0.xyzx).xyz;
/*42*/	gl_Position.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*43*/	gl_Position.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*44*/	gl_Position.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*45*/	r0.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*46*/	vsOut_T0.xyz = (r1.xyzx).xyz;
/*47*/	gl_Position.w = r0.x;
/*48*/	vsOut_T0.w = r0.x;
/*49*/	vsOut_T1.xy = (vsIn_P5.xyxx).xy;
/*50*/	vsOut_T1.zw = (vsIn_T6.xxxz).zw;
/*51*/	vsOut_T2.w = -vsIn_T6.y + 1.000000;
/*52*/	vsOut_T2.x = dot(vsIn_T0.xyzw, vsIn_P2.xyzw);
/*53*/	vsOut_T2.y = dot(vsIn_T1.xyzw, vsIn_P2.xyzw);
/*54*/	vsOut_T2.z = dot(vsIn_T2.xyzw, vsIn_P2.xyzw);
/*55*/	vsOut_T3.x = dot(vsIn_T0.xyzw, vsIn_P3.xyzw);
/*56*/	vsOut_T3.y = dot(vsIn_T1.xyzw, vsIn_P3.xyzw);
/*57*/	vsOut_T3.z = dot(vsIn_T2.xyzw, vsIn_P3.xyzw);
/*58*/	vsOut_T3.w = vsIn_P7.w;
/*59*/	vsOut_T4.x = dot(vsIn_T0.xyzw, vsIn_P4.xyzw);
/*60*/	vsOut_T4.y = dot(vsIn_T1.xyzw, vsIn_P4.xyzw);
/*61*/	vsOut_T4.z = dot(vsIn_T2.xyzw, vsIn_P4.xyzw);
/*62*/	r0.x = intBitsToFloat(gl_InstanceID + floatBitsToInt(cb2.data[4].w));
/*63*/	r0.yzw = (vec4(0, 0, 0, 0)).yzw;
/*64*/	r0.xyzw = uintBitsToFloat(texelFetch(t_pixel_selection_object_id_texture, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*65*/	vsOut_P1 = floatBitsToUint(r0.x);
/*66*/	return;
}
