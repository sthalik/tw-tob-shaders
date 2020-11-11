//
//
// Shader Model 4
// Fragment Shader
//
// id: 2033 - fxc/glsl_SM_3_0_weightedwithdecaldirt.hlsl_PS_ps30_gbuffer_skin_noclip_no_faction_colour.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_skin_mask_map;

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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r1.z = sqrt(r0.w);
/*8*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*9*/	r2.zw = (-cb1.data[3].xxxy + cb1.data[3].zzzw).zw;
/*10*/	r3.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*11*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*12*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*18*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*19*/	if(floatBitsToUint(r0.w) != 0u) {
/*20*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*21*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*23*/	  r0.w = -r0.w + 1.000000;
/*24*/	  r0.w = max(r0.w, 0.000000);
/*25*/	  r4.z = sqrt(r0.w);
/*26*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*27*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*28*/	  r0.w = r2.x * r6.w;
/*29*/	  r2.x = r0.w * -0.500000 + r2.x;
/*30*/	  r0.w = -r3.w * r5.w + 1.000000;
/*31*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*32*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*33*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*34*/	}
/*35*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r2.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*37*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*38*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*39*/	r0.w = r3.w * r4.w;
/*40*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*41*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*42*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*43*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*46*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*47*/	r0.w = inversesqrt(r0.w);
/*48*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*49*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*52*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*53*/	r0.w = inversesqrt(r0.w);
/*54*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*55*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*56*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*57*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*58*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*59*/	r0.w = inversesqrt(r0.w);
/*60*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*61*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*62*/	r0.w = vsOut_T7.x * -r2.x + r2.x;
/*63*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*64*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*65*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*66*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*67*/	r2.xzw = (-r0.xxyz + r1.wwww).xzw;
/*68*/	color1.xyz = saturate(vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*69*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*70*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*71*/	r0.w = 1.000000;
/*72*/	r1.w = dot(r0.xyzw, cb0.data[11].xyzw);
/*73*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*74*/	color3.x = r1.w / r0.x;
/*75*/	r0.x = max(abs(r1.z), abs(r1.y));
/*76*/	r0.x = max(r0.x, abs(r1.x));
/*77*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*78*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*79*/	color0.w = saturate(r2.y);
/*80*/	color2.xyzw = r3.xyzz;
/*81*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*82*/	color4 = floatBitsToUint(vsOut_T9.z);
/*83*/	return;
}
