//
//
// Shader Model 4
// Fragment Shader
//
// id: 1406 - fxc/glsl_SM_3_0_shadow_map_depth_buffer_analysis.hlsl_PS_ps30_downsize_store_data.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;

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
  vec4 r5;
  vec4 r6;
  vec4 r7;

/*0*/	r0.xy = floor((gl_FragCoord.yxyy).xy);
/*1*/	r0.xy = (r0.xyxx * cb1.data[0].yxyy).xy;
/*2*/	r0.xy = (intBitsToFloat(ivec4(r0.xyxx))).xy;
/*3*/	r0.zw = intBitsToFloat((floatBitsToInt(r0.xxxy) + ivec4(ivec4(0, 0, 4, 4))).zw);
/*4*/	r1.x = -cb0.data[28].x + 0.500000;
/*5*/	r1.yz = (cb0.data[30].xxyx * cb1.data[0].xxyx).yz;
/*6*/	r2.xy = (cb0.data[29].zwzz / cb1.data[0].xyxx).xy;
/*7*/	r2.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*8*/	r2.xy = (r2.xyxx * r2.zwzz).xy;
/*9*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*10*/	r2.w = 1.000000;
/*11*/	r3.x = cb0.data[13].z/**/;
/*12*/	r3.y = cb0.data[14].z/**/;
/*13*/	r3.z = cb0.data[15].z/**/;
/*14*/	r4.xy = (vec4(340282346638528860000000000000000000000.000000, -340282346638528860000000000000000000000.000000, 0, 0)).xy;
/*15*/	r1.w = r0.x;
/*16*/	while(true) {
/*17*/	  r3.w = uintBitsToFloat((floatBitsToInt(r1.w) >= floatBitsToInt(r0.z)) ? 0xffffffffu : 0x00000000u);
/*18*/	  if(r3.w != 0) break;
/*19*/	  r5.y = floatBitsToInt(r1.w);
/*20*/	  r4.zw = (r4.xxxy).zw;
/*21*/	  r3.w = r0.y;
/*22*/	  while(true) {
/*23*/	    r5.z = uintBitsToFloat((floatBitsToInt(r3.w) >= floatBitsToInt(r0.w)) ? 0xffffffffu : 0x00000000u);
/*24*/	    if(r5.z != 0) break;
/*25*/	    r5.x = floatBitsToInt(r3.w);
/*26*/	    r5.xz = (r1.xxxx + r5.xxyx).xz;
/*27*/	    r5.xz = (r5.xxzx + cb0.data[28].xxxx).xz;
/*28*/	    r5.xz = (r5.xxzx / r1.yyzy).xz;
/*29*/	    r6.xyzw = (textureLod(gbuffer_channel_3_sampler, r5.xzxx.st, r5.z)).xyzw;
/*30*/	    r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r5.xzxx.st, r5.z)).xyzw;
/*31*/	    r5.x = r6.w * 255.000000 + 0.500000;
/*32*/	    r5.x = floor(r5.x);
/*33*/	    r5.x = uintBitsToFloat(uint(r5.x));
/*34*/	    r5.x = uintBitsToFloat(floatBitsToUint(r5.x) & uint(2));
/*35*/	    r5.z = uintBitsToFloat((r7.x != 1.000000) ? 0xffffffffu : 0x00000000u);
/*36*/	    r5.x = uintBitsToFloat((floatBitsToInt(r5.x) == int(0)) ? 0xffffffffu : 0x00000000u) /**/;
/*37*/	    r5.x = uintBitsToFloat(floatBitsToUint(r5.x) & floatBitsToUint(r5.z));
/*38*/	    r2.z = r7.x;
/*39*/	    r6.x = dot(r2.xyzw, cb0.data[21].xyzw);
/*40*/	    r6.y = dot(r2.xyzw, cb0.data[22].xyzw);
/*41*/	    r6.z = dot(r2.xyzw, cb0.data[23].xyzw);
/*42*/	    r2.z = dot(r2.xyzw, cb0.data[24].xyzw);
/*43*/	    r6.xyz = (r6.xyzx / r2.zzzz).xyz;
/*44*/	    r6.xyz = (r6.xyzx + -cb0.data[0].xyzx).xyz;
/*45*/	    r2.z = dot(vec3(r3.xyzx), vec3(r6.xyzx));
/*46*/	    r5.z = uintBitsToFloat((r2.z < cb1.data[0].z) ? 0xffffffffu : 0x00000000u);
/*47*/	    r6.x = min(r2.z, r4.z);
/*48*/	    r6.y = max(r2.z, r4.w);
/*49*/	    r5.zw = (mix(r4.zzzw, r6.xxxy, greaterThan(floatBitsToUint(r5.zzzz), uvec4(0)))).zw;
/*50*/	    r4.zw = (mix(r4.zzzw, r5.zzzw, greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).zw;
/*51*/	    r3.w = intBitsToFloat(floatBitsToInt(r3.w) + int(1));
/*52*/	  }
/*53*/	  r4.xy = (r4.zwzz).xy;
/*54*/	  r1.w = intBitsToFloat(floatBitsToInt(r1.w) + int(1));
/*55*/	}
/*56*/	color0.xy = (r4.xyxx).xy;
/*57*/	return;
}
