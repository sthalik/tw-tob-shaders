//
//
// Shader Model 4
// Fragment Shader
//
// id: 3915 - fxc/glsl_SM_3_0_VisibilityShader.hlsl_PS_ps30_fog_of_war_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D s_fog_of_war_heights;
uniform sampler2D s_fog_of_war_source;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform fog_of_war_PS
{
  vec4 data[8];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx / cb1.data[0].xxxx).xy;
/*2*/	r1.xyzw = (textureLod(s_fog_of_war_heights, r0.xyxx.st, 0.000000)).xyzw;
/*3*/	r0.z = r1.x * cb1.data[0].z + cb1.data[0].y;
/*4*/	r1.y = r0.z + 2.000000;
/*5*/	r1.xz = (r0.xxyx * vec4(2048.000000, 0.000000, -2048.000000, 0.000000) + vec4(-1024.000000, 0.000000, 1024.000000, 0.000000)).xz;
/*6*/	r0.xyw = (r1.xyxz + -cb1.data[1].xyxz).xyw;
/*7*/	r0.x = dot(vec3(r0.xywx), vec3(r0.xywx));
/*8*/	r0.x = sqrt(r0.x);
/*9*/	r1.w = 1.000000;
/*10*/	r2.x = dot(r1.xyzw, cb1.data[2].xyzw);
/*11*/	r2.y = dot(r1.xyzw, cb1.data[3].xyzw);
/*12*/	r0.y = dot(r1.xyzw, cb1.data[4].xyzw);
/*13*/	r0.w = dot(r1.xyzw, cb1.data[5].xyzw);
/*14*/	r0.z = uintBitsToFloat((0.001000 >= r0.z) ? 0xffffffffu : 0x00000000u);
/*15*/	r1.x = uintBitsToFloat((floatBitsToInt(r0.z) == int(0)) ? 0xffffffffu : 0x00000000u) /**/;
/*16*/	r0.x = uintBitsToFloat((cb1.data[6].y >= r0.x) ? 0xffffffffu : 0x00000000u);
/*17*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r1.x));
/*18*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.xyxx, -r0.wwww)) * 0xffffffffu)).xy;
/*19*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r1.x));
/*20*/	r1.xz = (uintBitsToFloat(uvec4(greaterThanEqual(r0.wwww, r2.xxyx)) * 0xffffffffu)).xz;
/*21*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r1.x));
/*22*/	r0.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.x));
/*23*/	r0.x = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r0.x));
/*24*/	r1.x = uintBitsToFloat((r0.y >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*25*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r1.x));
/*26*/	r0.y = uintBitsToFloat((r0.w >= r0.y) ? 0xffffffffu : 0x00000000u);
/*27*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*28*/	if(floatBitsToUint(r0.x) != 0u) {
/*29*/	  r0.x = r0.w / cb1.data[6].x;
/*30*/	  r0.yw = (r2.xxxy / r0.wwww).yw;
/*31*/	  r0.yw = (r0.yyyw + vec4(0.000000, 1.000000, 0.000000, 1.000000)).yw;
/*32*/	  r1.x = cb0.data[28].x / cb1.data[0].x;
/*33*/	  r0.yw = (r0.yyyw * vec4(0.000000, 0.500000, 0.000000, 0.500000) + r1.xxxx).yw;
/*34*/	  r1.xyzw = (textureLod(s_fog_of_war_source, r0.ywyy.st, 0.000000)).xyzw;
/*35*/	  r0.z = uintBitsToFloat((r0.x < r1.x) ? 0xffffffffu : 0x00000000u);
/*36*/	}
/*37*/	r0.x = uintBitsToFloat((floatBitsToInt(r0.z) == int(-1)) ? 0xffffffffu : 0x00000000u) /**/;
/*38*/	if(floatBitsToUint(r0.x) != 0u) {
/*39*/	  color0.xyzw = vec4(1.000000, 0, 0, 1.000000);
/*40*/	  return;
/*41*/	}
/*42*/	color0.xyzw = vec4(0, 0, 0, 1.000000);
/*43*/	return;
}
