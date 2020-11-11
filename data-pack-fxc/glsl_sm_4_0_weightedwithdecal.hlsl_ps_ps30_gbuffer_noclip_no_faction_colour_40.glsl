//
//
// Shader Model 4
// Fragment Shader
//
// id: 1719 - fxc/glsl_SM_4_0_weightedwithdecal.hlsl_PS_ps30_gbuffer_noclip_no_faction_colour_40.glsl
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
flat in vec4 vsOut_T6;
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
uniform sampler2D s_decal_mask;
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;

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
/*12*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*14*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*18*/	r4.z = vsOut_T6.z;
/*19*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*20*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*21*/	if(floatBitsToUint(r0.w) != 0u) {
/*22*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*23*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*25*/	  r0.w = -r0.w + 1.000000;
/*26*/	  r0.w = max(r0.w, 0.000000);
/*27*/	  r4.z = sqrt(r0.w);
/*28*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*29*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*30*/	  r0.w = r3.x * r7.w;
/*31*/	  r3.x = r0.w * -0.500000 + r3.x;
/*32*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*33*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*34*/	  r0.w = -r5.w * r6.w + 1.000000;
/*35*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*36*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*37*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*38*/	}
/*39*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*40*/	r4.xyz = (-r0.xyzx + r0.wwww).xyz;
/*41*/	r0.xyz = (vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*42*/	r0.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*43*/	r4.xyz = (-r1.xyzx + r0.wwww).xyz;
/*44*/	r1.xyz = (vsOut_T7.yyyy * r4.xyzx + r1.xyzx).xyz;
/*45*/	r0.w = vsOut_T7.y * -r3.x + r3.x;
/*46*/	color1.w = saturate(vsOut_T7.x * -r0.w + r0.w);
/*47*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*48*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*49*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*50*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r3.xzw = (r0.wwww * vsOut_T3.xxyz).xzw;
/*53*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*54*/	r0.w = inversesqrt(r0.w);
/*55*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*56*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*59*/	r4.xyz = (r2.yyyy * r4.xyzx).xyz;
/*60*/	r2.xyw = (r2.xxxx * r3.xzxw + r4.xyxz).xyw;
/*61*/	r2.xyz = (r2.zzzz * r5.xyzx + r2.xywx).xyz;
/*62*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*63*/	r0.w = inversesqrt(r0.w);
/*64*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*65*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*66*/	r4.w = 1.000000;
/*67*/	r0.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*68*/	r2.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*69*/	r3.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*70*/	color3.x = r0.w / r2.w;
/*71*/	r0.w = max(abs(r2.z), abs(r2.y));
/*72*/	r0.w = max(r0.w, abs(r2.x));
/*73*/	r2.xyz = (r2.xyzx / r0.wwww).xyz;
/*74*/	color0.xyz = saturate(r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*75*/	color0.w = saturate(r3.y);
/*76*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*77*/	r1.w = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3c008081u));
/*78*/	color2.xyzw = saturate(r1.xyzw);
/*79*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*80*/	color4 = floatBitsToUint(vsOut_T9.z);
/*81*/	return;
}
