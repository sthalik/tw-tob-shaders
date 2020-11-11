//
//
// Shader Model 4
// Fragment Shader
//
// id: 1409 - fxc/glsl_SM_3_0_shadow_map_depth_buffer_analysis.hlsl_PS_ps30_downsize_data.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D g_data_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform smdba_down_size_buffer
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xy = (intBitsToFloat(ivec4(cb1.data[0].xyxx))).xy;
/*1*/	r0.zw = floor((gl_FragCoord.xxxy).zw);
/*2*/	r0.zw = (intBitsToFloat(ivec4(r0.zzzw))).zw;
/*3*/	r1.xy = intBitsToFloat((floatBitsToInt(r0.xyxx) * floatBitsToInt(r0.zwzz)).xy) /**/;
/*4*/	r0.xy = intBitsToFloat(((floatBitsToInt(r0.zwzz)) * (floatBitsToInt(r0.xyxx)) + floatBitsToInt(r0.xyxx)).xy);
/*5*/	r0.z = -cb0.data[28].x + 0.500000;
/*6*/	r1.zw = (cb0.data[30].xxxy * cb1.data[0].xxxy).zw;
/*7*/	r2.xy = (vec4(340282346638528860000000000000000000000.000000, -340282346638528860000000000000000000000.000000, 0, 0)).xy;
/*8*/	r0.w = r1.y;
/*9*/	while(true) {
/*10*/	  r2.z = uintBitsToFloat((floatBitsToInt(r0.w) >= floatBitsToInt(r0.y)) ? 0xffffffffu : 0x00000000u);
/*11*/	  if(r2.z != 0) break;
/*12*/	  r3.y = floatBitsToInt(r0.w);
/*13*/	  r2.zw = (r2.xxxy).zw;
/*14*/	  r3.z = r1.x;
/*15*/	  while(true) {
/*16*/	    r3.w = uintBitsToFloat((floatBitsToInt(r3.z) >= floatBitsToInt(r0.x)) ? 0xffffffffu : 0x00000000u);
/*17*/	    if(r3.w != 0) break;
/*18*/	    r3.x = floatBitsToInt(r3.z);
/*19*/	    r3.xw = (r0.zzzz + r3.xxxy).xw;
/*20*/	    r3.xw = (r3.xxxw + cb0.data[28].xxxx).xw;
/*21*/	    r3.xw = (r3.xxxw / r1.zzzw).xw;
/*22*/	    r4.xyzw = (textureLod(g_data_sampler, r3.xwxx.st, 0.000000)).xyzw;
/*23*/	    r2.z = min(r2.z, r4.x);
/*24*/	    r2.w = max(r2.w, r4.y);
/*25*/	    r3.z = intBitsToFloat(floatBitsToInt(r3.z) + int(1));
/*26*/	  }
/*27*/	  r2.xy = (r2.zwzz).xy;
/*28*/	  r0.w = intBitsToFloat(floatBitsToInt(r0.w) + int(1));
/*29*/	}
/*30*/	color0.xy = (r2.xyxx).xy;
/*31*/	color0.zw = (vec4(0, 0, 0, 0)).zw;
/*32*/	return;
}
