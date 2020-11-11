//
//
// Shader Model 4
// Fragment Shader
//
// id: 1509 - fxc/glsl_SM_3_0_VirtualTexture.hlsl_PS_ps30_page_touch.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D depth_sampler;

layout(std140) uniform cbTerrainVirtualTexture
{
  vec4 data[3];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform cbPageTouch
{
  vec4 data[1];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb1.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb2.data[0].xyxx).xy;
/*2*/	r1.xyzw = (textureLod(depth_sampler, r0.xyxx.st, 0.000000)).yzxw;
/*3*/	r1.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.x = uintBitsToFloat((r1.z == 1.000000) ? 0xffffffffu : 0x00000000u);
/*5*/	if(r0.x != 0) discard;
/*6*/	r1.w = 1.000000;
/*7*/	r0.x = dot(r1.xyzw, cb1.data[21].xyzw);
/*8*/	r0.y = dot(r1.xyzw, cb1.data[23].xyzw);
/*9*/	r0.z = dot(r1.xyzw, cb1.data[24].xyzw);
/*10*/	r0.xy = (r0.xyxx / r0.zzzz).xy;
/*11*/	r0.xy = (r0.xyxx + -cb0.data[0].xyxx).xy;
/*12*/	r0.x = r0.x * cb0.data[1].w;
/*13*/	r0.z = -r0.y * cb0.data[1].w + 1.000000;
/*14*/	r0.yw = (r0.xxxz * cb0.data[1].yyyy).yw;
/*15*/	r1.xy = (dFdx(r0.ywyy)).xy;
/*16*/	r0.yw = (dFdy(r0.yyyw)).yw;
/*17*/	r0.y = dot(vec2(r0.ywyy), vec2(r0.ywyy));
/*18*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*19*/	r0.y = max(r0.y, r0.w);
/*20*/	r0.y = log2(r0.y);
/*21*/	r0.y = r0.y * 0.500000;
/*22*/	r0.y = max(r0.y, 0.000000);
/*23*/	r0.y = floor(r0.y);
/*24*/	r0.y = r0.y + cb2.data[0].z;
/*25*/	r0.y = max(r0.y, 0.000000);
/*26*/	r0.w = exp2(r0.y);
/*27*/	r0.y = r0.y + 1.000000;
/*28*/	color0.w = r0.y * 0.003922;
/*29*/	r0.y = r0.w * cb0.data[1].x;
/*30*/	r0.xy = (r0.xzxx / r0.yyyy).xy;
/*31*/	r0.xy = floor((r0.xyxx).xy);
/*32*/	r0.xy = (r0.xyxx * vec4(0.003906, 0.003906, 0.000000, 0.000000)).xy;
/*33*/	r0.zw = floor((r0.xxxy).zw);
/*34*/	r0.xy = (fract(r0.xyxx)).xy;
/*35*/	r0.xy = (r0.xyxx * vec4(256.000000, 256.000000, 0.000000, 0.000000)).xy;
/*36*/	r0.xy = floor((r0.xyxx).xy);
/*37*/	color0.xy = (r0.xyxx * vec4(0.003922, 0.003922, 0.000000, 0.000000)).xy;
/*38*/	r0.x = r0.w * 16.000000 + r0.z;
/*39*/	color0.z = r0.x * 0.003922;
/*40*/	return;
}
