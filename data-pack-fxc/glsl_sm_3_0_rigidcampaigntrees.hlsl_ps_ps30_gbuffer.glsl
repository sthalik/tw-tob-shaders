//
//
// Shader Model 4
// Fragment Shader
//
// id: 3928 - fxc/glsl_SM_3_0_rigidcampaigntrees.hlsl_PS_ps30_gbuffer.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T6;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse;
uniform sampler2D s_normal;
uniform sampler2D s_dissolve;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform campaign_tree_ps
{
  vec4 data[1];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.xy = (vsOut_T1.xyxx * vec4(10.001000, 10.001000, 0.000000, 0.000000)).xy;
/*1*/	r0.xyzw = (texture(s_dissolve, r0.xyxx.st)).xyzw;
/*2*/	r0.x = log2(r0.x);
/*3*/	r0.x = r0.x * 2.200000;
/*4*/	r0.x = exp2(r0.x);
/*5*/	r1.xyzw = (texture(s_diffuse, vsOut_T1.xyxx.st)).xyzw;
/*6*/	r0.y = r0.x * r1.w;
/*7*/	r0.y = -vsOut_T6.w * cb1.data[0].x + r0.y;
/*8*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*9*/	if(r0.y != 0) discard;
/*10*/	r0.yzw = (dFdx(vsOut_T0.zzxy)).yzw;
/*11*/	r2.xyz = (dFdy(vsOut_T0.yzxy)).xyz;
/*12*/	r3.xyz = (r0.yzwy * r2.xyzx).xyz;
/*13*/	r0.yzw = (r0.wwyz * r2.yyzx + -r3.xxyz).yzw;
/*14*/	r2.x = dot(vec3(r0.yzwy), vec3(r0.yzwy));
/*15*/	r2.x = inversesqrt(r2.x);
/*16*/	r0.yzw = (r0.yyzw * r2.xxxx).yzw;
/*17*/	r0.y = dot(vec3(r0.yzwy), vec3(vsOut_T6.xyzx));
/*18*/	r0.y = -abs(r0.y) * 2.000000 + 1.000000;
/*19*/	r0.x = r1.w * r0.x + -r0.y;
/*20*/	r0.yzw = (sqrt(r1.xxyz)).yzw;
/*21*/	color1.xyz = (min(r0.yzwy, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*22*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*23*/	if(r0.x != 0) discard;
/*24*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*25*/	r0.x = inversesqrt(r0.x);
/*26*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*27*/	r0.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*28*/	r0.w = inversesqrt(r0.w);
/*29*/	r1.xyz = (r0.wwww * vsOut_T4.xyzx).xyz;
/*30*/	r2.xyzw = (texture(s_normal, vsOut_T1.xyxx.st)).xyzw;
/*31*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*32*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*34*/	r0.xyz = (r2.xxxx * r0.xyzx + r1.xyzx).xyz;
/*35*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*36*/	r0.w = -r0.w + 1.000000;
/*37*/	r0.w = max(r0.w, 0.000000);
/*38*/	r0.w = sqrt(r0.w);
/*39*/	r1.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*40*/	r1.x = inversesqrt(r1.x);
/*41*/	r1.xyz = (r1.xxxx * vsOut_T2.xyzx).xyz;
/*42*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*43*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*46*/	r0.w = max(abs(r0.z), abs(r0.y));
/*47*/	r0.w = max(r0.w, abs(r0.x));
/*48*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*49*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*50*/	color0.w = 0;
/*51*/	color1.w = 0;
/*52*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0);
/*53*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*54*/	r0.w = 1.000000;
/*55*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*56*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*57*/	color3.x = r1.x / r0.x;
/*58*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*59*/	color4 = uint(0);
/*60*/	return;
}
