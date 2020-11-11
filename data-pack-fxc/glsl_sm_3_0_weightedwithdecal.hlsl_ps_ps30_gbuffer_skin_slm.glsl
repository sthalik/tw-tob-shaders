//
//
// Shader Model 4
// Fragment Shader
//
// id: 1974 - fxc/glsl_SM_3_0_weightedwithdecal.hlsl_PS_ps30_gbuffer_skin_slm.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;

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
  vec4 r7;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*2*/	r0.w = r0.w + -0.501961;
/*3*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*4*/	if(r0.w != 0) discard;
/*5*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*6*/	r3.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*7*/	r0.xyz = (r2.xxxx * r3.xyzx + r0.xyzx).xyz;
/*8*/	r3.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*9*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*10*/	r2.xyw = (cb2.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*11*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*12*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*13*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*14*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*15*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*16*/	r0.w = -r0.w + 1.000000;
/*17*/	r0.w = max(r0.w, 0.000000);
/*18*/	r2.z = sqrt(r0.w);
/*19*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*20*/	r3.zw = (-cb1.data[3].xxxy + cb1.data[3].zzzw).zw;
/*21*/	r4.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*22*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*23*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*24*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*27*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*28*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*29*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*30*/	if(floatBitsToUint(r0.w) != 0u) {
/*31*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*32*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*34*/	  r0.w = -r0.w + 1.000000;
/*35*/	  r0.w = max(r0.w, 0.000000);
/*36*/	  r5.z = sqrt(r0.w);
/*37*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*38*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*39*/	  r0.w = r3.x * r7.w;
/*40*/	  r3.x = r0.w * -0.500000 + r3.x;
/*41*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*42*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*43*/	  r0.w = -r4.w * r6.w + 1.000000;
/*44*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*45*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*46*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*47*/	}
/*48*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*49*/	r0.w = inversesqrt(r0.w);
/*50*/	r4.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*51*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*54*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*57*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*58*/	r2.xyw = (r2.xxxx * r4.xyxz + r5.xyxz).xyw;
/*59*/	r2.xyz = (r2.zzzz * r6.xyzx + r2.xywx).xyz;
/*60*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*63*/	r0.w = -vsOut_T4.z + 1.000000;
/*64*/	r4.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*65*/	r0.xyz = (r0.xyzx * r0.wwww + r4.xyzx).xyz;
/*66*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*67*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*68*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*69*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*70*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*71*/	r3.xzw = (-r0.xxyz + r1.wwww).xzw;
/*72*/	r0.xyz = (vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*73*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*75*/	color2.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*76*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*77*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*78*/	r1.w = 1.000000;
/*79*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*80*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*81*/	color3.x = r0.w / r1.x;
/*82*/	r0.w = max(abs(r2.z), abs(r2.y));
/*83*/	r0.w = max(r0.w, abs(r2.x));
/*84*/	r1.xyz = (r2.xyzx / r0.wwww).xyz;
/*85*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*86*/	color0.w = saturate(r3.y);
/*87*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*88*/	color2.w = 0;
/*89*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*90*/	color4 = floatBitsToUint(vsOut_T9.z);
/*91*/	return;
}
