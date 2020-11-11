//
//
// Shader Model 4
// Fragment Shader
//
// id: 1982 - fxc/glsl_SM_3_0_weightedwithdecal.hlsl_PS_ps30_gbuffer_skin_noclip_no_faction_colour_slm.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
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
/*2*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*3*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*4*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*5*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.w = -r0.w + 1.000000;
/*7*/	r0.w = max(r0.w, 0.000000);
/*8*/	r2.z = sqrt(r0.w);
/*9*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*10*/	r3.zw = (-cb1.data[3].xxxy + cb1.data[3].zzzw).zw;
/*11*/	r4.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*12*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*13*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*14*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*18*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*19*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*20*/	if(floatBitsToUint(r0.w) != 0u) {
/*21*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*22*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*24*/	  r0.w = -r0.w + 1.000000;
/*25*/	  r0.w = max(r0.w, 0.000000);
/*26*/	  r5.z = sqrt(r0.w);
/*27*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*29*/	  r0.w = r3.x * r7.w;
/*30*/	  r3.x = r0.w * -0.500000 + r3.x;
/*31*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*32*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*33*/	  r0.w = -r4.w * r6.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*35*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*36*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*37*/	}
/*38*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*39*/	r0.w = inversesqrt(r0.w);
/*40*/	r4.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*41*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*42*/	r0.w = inversesqrt(r0.w);
/*43*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*44*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*47*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*48*/	r2.xyw = (r2.xxxx * r4.xyxz + r5.xyxz).xyw;
/*49*/	r2.xyz = (r2.zzzz * r6.xyzx + r2.xywx).xyz;
/*50*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*53*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*54*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*55*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*56*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*57*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*58*/	r3.xzw = (-r0.xxyz + r1.wwww).xzw;
/*59*/	r0.xyz = (vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*60*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*62*/	color2.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*63*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*64*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*65*/	r1.w = 1.000000;
/*66*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*67*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*68*/	color3.x = r0.w / r1.x;
/*69*/	r0.w = max(abs(r2.z), abs(r2.y));
/*70*/	r0.w = max(r0.w, abs(r2.x));
/*71*/	r1.xyz = (r2.xyzx / r0.wwww).xyz;
/*72*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*73*/	color0.w = saturate(r3.y);
/*74*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*75*/	color2.w = 0;
/*76*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*77*/	color4 = floatBitsToUint(vsOut_T9.z);
/*78*/	return;
}
