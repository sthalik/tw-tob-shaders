//
//
// Shader Model 4
// Fragment Shader
//
// id: 1905 - fxc/glsl_SM_4_0_weightedwithdirt.hlsl_PS_ps30_gbuffer_skin_slm_40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_T9;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*5*/	r0.w = inversesqrt(r0.w);
/*6*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*7*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*8*/	r0.w = inversesqrt(r0.w);
/*9*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*10*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*11*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*12*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*13*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*14*/	r0.w = -r0.w + 1.000000;
/*15*/	r0.w = max(r0.w, 0.000000);
/*16*/	r4.z = sqrt(r0.w);
/*17*/	r3.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*18*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*19*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*20*/	r6.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*21*/	r4.xy = (r3.zwzz * r6.wwww + r3.xyxx).xy;
/*22*/	r0.w = r5.w * r6.w;
/*23*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*24*/	r1.w = inversesqrt(r1.w);
/*25*/	r3.xyz = (r1.wwww * r4.xyzx).xyz;
/*26*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*27*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*28*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*29*/	r1.w = inversesqrt(r1.w);
/*30*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*31*/	r1.xyz = (r3.zzzz * r2.xyzx + r1.xyzx).xyz;
/*32*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*33*/	r1.w = inversesqrt(r1.w);
/*34*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*35*/	r1.w = max(abs(r1.z), abs(r1.y));
/*36*/	r1.w = max(r1.w, abs(r1.x));
/*37*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*38*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*39*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*40*/	color0.w = saturate(r1.x);
/*41*/	r1.x = vsOut_T7.x * -r1.y + r1.y;
/*42*/	color1.w = saturate(vsOut_T7.y * -r1.x + r1.x);
/*43*/	r1.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*44*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*45*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*46*/	r1.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*47*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*48*/	r1.xyz = (cb2.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*49*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*50*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*51*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*52*/	r1.x = -vsOut_T4.z + 1.000000;
/*53*/	r1.yzw = (vsOut_T4.zzzz * cb2.data[3].xxyz).yzw;
/*54*/	r0.xyz = (r0.xyzx * r1.xxxx + r1.yzwy).xyz;
/*55*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*56*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*57*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*58*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*59*/	r1.xyz = (-r0.xyzx + r1.xxxx).xyz;
/*60*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*61*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*62*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*63*/	r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*64*/	r0.xyz = (r0.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*65*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*67*/	color2.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*68*/	color2.w = 0;
/*69*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*70*/	r0.w = 1.000000;
/*71*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*72*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*73*/	color3.x = r1.x / r0.x;
/*74*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*75*/	color4 = floatBitsToUint(vsOut_T9.z);
/*76*/	return;
}
