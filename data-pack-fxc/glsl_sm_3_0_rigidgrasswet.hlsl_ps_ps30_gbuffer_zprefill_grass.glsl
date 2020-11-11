//
//
// Shader Model 4
// Fragment Shader
//
// id: 1375 - fxc/glsl_SM_3_0_rigidgrasswet.hlsl_PS_ps30_gbuffer_zprefill_grass.glsl
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

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D burn_sampler;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_depth_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform grass_PS
{
  vec4 data[4];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.xyz = (dFdy(vsOut_T0.zxyz)).xyz;
/*1*/	r1.xyz = (dFdx(vsOut_T0.yzxy)).xyz;
/*2*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*3*/	r0.xyz = (r0.zxyz * r1.yzxy + -r2.xyzx).xyz;
/*4*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*5*/	r0.w = inversesqrt(r0.w);
/*6*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*7*/	r1.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*8*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*9*/	r0.w = inversesqrt(r0.w);
/*10*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*11*/	r0.x = dot(vec3(r0.xyzx), vec3(r1.xyzx));
/*12*/	r0.x = saturate(r0.x + r0.x);
/*13*/	r1.xyzw = vsOut_T1.xyxy * vec4(100.000000, 100.000000, 20.000000, 20.000000);
/*14*/	r2.xyzw = (texture(s_dissolve_map, r1.zwzz.st)).xyzw;
/*15*/	r1.xyzw = (texture(s_dissolve_map, r1.xyxx.st)).xyzw;
/*16*/	r0.x = r0.x + -r2.x;
/*17*/	r0.y = -r1.x + 1.100000;
/*18*/	r0.z = saturate(vsOut_T1.w);
/*19*/	r0.y = r0.z * r0.y + r1.x;
/*20*/	r1.xyzw = (texture(burn_sampler, vsOut_T1.xyxx.st)).xyzw;
/*21*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*22*/	r0.w = r1.w + -r2.w;
/*23*/	r0.w = saturate(r0.z * r0.w + r2.w);
/*24*/	r0.z = r0.z * r0.z + 0.010000;
/*25*/	r0.y = r0.y * r0.w + -r0.z;
/*26*/	r0.z = r0.w + -0.500000;
/*27*/	r0.y = min(r0.z, r0.y);
/*28*/	r0.x = min(r0.x, r0.y);
/*29*/	r0.x = r0.x + cb1.data[2].z;
/*30*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*31*/	if(r0.x != 0) discard;
/*32*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*33*/	r0.w = 1.000000;
/*34*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*35*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*36*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*37*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*38*/	r1.xy = (r0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*39*/	r1.xy = (r1.xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*40*/	r1.xyzw = (textureLod(s_depth_map, r1.xyxx.st, 0.000000)).xyzw;
/*41*/	r0.z = r1.x;
/*42*/	r0.w = 1.000000;
/*43*/	r1.x = dot(r0.xyzw, cb0.data[21].xyzw);
/*44*/	r1.y = dot(r0.xyzw, cb0.data[22].xyzw);
/*45*/	r1.z = dot(r0.xyzw, cb0.data[23].xyzw);
/*46*/	r0.x = dot(r0.xyzw, cb0.data[24].xyzw);
/*47*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*48*/	r0.xyz = (-r0.xyzx + vsOut_T0.xyzx).xyz;
/*49*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*50*/	r0.x = sqrt(r0.x);
/*51*/	r0.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*52*/	r0.y = dot(vec3(r0.yzwy), vec3(r0.yzwy));
/*53*/	r0.y = sqrt(r0.y);
/*54*/	r0.xy = (uintBitsToFloat(uvec4(lessThan(vec4(100.000000, 50.000000, 0.000000, 0.000000), r0.xyxx)) * 0xffffffffu)).xy;
/*55*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*56*/	if(r0.x != 0) discard;
/*57*/	color0.xyzw = vec4(0, 0, 0, 0);
/*58*/	return;
}
