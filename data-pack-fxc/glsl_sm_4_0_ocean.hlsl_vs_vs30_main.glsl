// Flat Varyings:

//
// Shader Model 4
// Vertex Shader
//
// id: 6792 - fxc/glsl_SM_4_0_ocean.hlsl_VS_vs30_main.glsl
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
in vec4 vsIn_T0;

out vec4 vsOut_C0;
out vec4 vsOut_T1;
out vec4 vsOut_T2;
out vec4 vsOut_T3;
out vec4 vsOut_T4;
out vec4 vsOut_T5;
out vec4 vsOut_T6;

uniform sampler2D sea_bed_info_texture_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform ocean_VS
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (vsIn_P0.xzxx + vec4(1024.000000, 1024.000000, 0.000000, 0.000000)).xy;
/*1*/	r0.zw = (uintBitsToFloat(uvec4(lessThan(r0.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*2*/	r1.xy = (uintBitsToFloat(uvec4(lessThan(vec4(2048.000000, 2048.000000, 0.000000, 0.000000), r0.xyxx)) * 0xffffffffu)).xy;
/*3*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.z) | floatBitsToUint(r1.x));
/*4*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.w) | floatBitsToUint(r0.z));
/*5*/	r0.z = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r0.z));
/*6*/	if(floatBitsToUint(r0.z) == 0u) {
/*7*/	  r0.xy = (r0.xyxx * vec4(0.000488, 0.000488, 0.000000, 0.000000)).xy;
/*8*/	  r0.xyzw = (textureLod(sea_bed_info_texture_sampler, r0.xyxx.st, 0.000000)).xyzw;
/*9*/	  r0.x = r0.x * cb1.data[1].y + cb1.data[1].x;
/*10*/	  r0.zw = (vsIn_P0.xxxz * vec4(0.000000, 0.000000, 0.040000, 0.040000)).zw;
/*11*/	  r1.xy = (vsIn_P0.xzxx * vec4(0.020000, 0.020000, 0.000000, 0.000000) + cb0.data[26].xxxx).xy;
/*12*/	  r0.zw = (cb0.data[26].xxxx * vec4(0.000000, 0.000000, 2.000000, 2.000000) + r0.zzzw).zw;
/*13*/	  r1.xy = sin(vec2(r1.xyxx));
/*14*/	  r0.zw = sin(vec2(r0.zzzw));
/*15*/	  r0.z = r0.z + r1.x;
/*16*/	  r0.z = r1.y + r0.z;
/*17*/	  r0.z = r0.w + r0.z;
/*18*/	  r0.z = r0.z + 4.000000;
/*19*/	  r0.y = r0.z * -0.125000;
/*20*/	  r0.z = 1.000000;
/*21*/	} else {
/*22*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*23*/	}
/*24*/	r0.z = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(r0.z))) * 0xffffffffu)).z;
/*25*/	r0.w = -r0.x + r0.y;
/*26*/	r0.w = saturate(r0.w * 0.050000);
/*27*/	r0.x = saturate(r0.x + r0.x);
/*28*/	r1.x = -r0.y + vsIn_P0.y;
/*29*/	r0.y = r0.w * r1.x + r0.y;
/*30*/	r0.w = -r0.y + -4.000000;
/*31*/	r0.x = r0.x * r0.w + r0.y;
/*32*/	r0.y = (floatBitsToUint(r0.z) > 0x00000000u) ? r0.x : vsIn_P0.y;
/*33*/	r0.xzw = (vsIn_P0.xxzw).xzw;
/*34*/	gl_Position.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*35*/	gl_Position.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*36*/	gl_Position.z = dot(r0.xyzw, cb0.data[11].xyzw);
/*37*/	r0.w = dot(r0.xyzw, cb0.data[12].xyzw);
/*38*/	r1.xzw = (vsIn_P1.xxzw).xzw;
/*39*/	r1.y = cb1.data[1].z/**/;
/*40*/	r2.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*41*/	r2.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*42*/	vsOut_T2.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*43*/	vsOut_T2.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*44*/	vsOut_T2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*45*/	r1.xzw = (vsIn_P0.xxzw).xzw;
/*46*/	r1.y = cb1.data[1].z/**/;
/*47*/	r2.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*48*/	r2.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*49*/	vsOut_T3.z = dot(r1.xyzw, cb0.data[11].xyzw);
/*50*/	vsOut_T3.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*51*/	vsOut_T3.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*52*/	vsOut_T5.xyzw = vsIn_P1.xzxz * cb1.data[0].yyzz;
/*53*/	r1.x = -cb1.data[0].x * r0.w + 1.000000;
/*54*/	vsOut_T4.x = max(r1.x, 0.000000);
/*55*/	r1.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*56*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*57*/	r1.w = sqrt(r1.w);
/*58*/	vsOut_T6.xyz = (r1.xyzx / r1.wwww).xyz;
/*59*/	gl_Position.w = r0.w;
/*60*/	vsOut_T1.xyzw = r0.xyzw;
/*61*/	vsOut_T6.w = r1.w;
/*62*/	vsOut_C0.xy = (vsIn_P1.xzxx).xy;
/*63*/	vsOut_C0.z = vsIn_T0.x;
/*64*/	vsOut_T4.yz = (vsIn_P1.xxzx).yz;
/*65*/	return;
}
