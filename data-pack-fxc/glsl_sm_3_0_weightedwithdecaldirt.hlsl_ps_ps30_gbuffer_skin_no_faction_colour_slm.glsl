//
//
// Shader Model 4
// Fragment Shader
//
// id: 2053 - fxc/glsl_SM_3_0_weightedwithdecaldirt.hlsl_PS_ps30_gbuffer_skin_no_faction_colour_slm.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*5*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*6*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*7*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*9*/	r0.w = -r0.w + 1.000000;
/*10*/	r0.w = max(r0.w, 0.000000);
/*11*/	r2.z = sqrt(r0.w);
/*12*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*13*/	r3.zw = (-cb1.data[3].xxxy + cb1.data[3].zzzw).zw;
/*14*/	r4.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*15*/	r3.zw = (r4.xxxy / r3.zzzw).zw;
/*16*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r3.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*17*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r3.zzzw)) * 0xffffffffu)).zw;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r4.x));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*20*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*21*/	r4.xyzw = (texture(s_decal_diffuse, r3.zwzz.st)).xyzw;
/*22*/	r5.xyzw = (texture(s_decal_normal, r3.zwzz.st)).xyzw;
/*23*/	if(floatBitsToUint(r0.w) != 0u) {
/*24*/	  r3.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*25*/	  r5.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*26*/	  r0.w = dot(vec2(r5.xyxx), vec2(r5.xyxx));
/*27*/	  r0.w = -r0.w + 1.000000;
/*28*/	  r0.w = max(r0.w, 0.000000);
/*29*/	  r5.z = sqrt(r0.w);
/*30*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*31*/	  r7.xyzw = r4.xyzw * r6.wwww;
/*32*/	  r0.w = r3.x * r7.w;
/*33*/	  r3.x = r0.w * -0.500000 + r3.x;
/*34*/	  r4.xyz = (r4.xyzx * r6.wwww + -r1.xyzx).xyz;
/*35*/	  r1.xyz = (r7.wwww * r4.xyzx + r1.xyzx).xyz;
/*36*/	  r0.w = -r4.w * r6.w + 1.000000;
/*37*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*38*/	  r4.xyz = (-r2.xyzx + r5.xyzx).xyz;
/*39*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*40*/	}
/*41*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*42*/	r3.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*43*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*44*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*45*/	r0.w = r4.w * r5.w;
/*46*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*47*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*48*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*49*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*50*/	r1.w = inversesqrt(r1.w);
/*51*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*52*/	r4.xyz = (r0.wwww * r1.xyzx).xyz;
/*53*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*54*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r4.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*57*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*60*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*63*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*64*/	r2.xyw = (r2.xxxx * r4.xyxz + r5.xyxz).xyw;
/*65*/	r2.xyz = (r2.zzzz * r6.xyzx + r2.xywx).xyz;
/*66*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*69*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*70*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*71*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*72*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*73*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*74*/	r3.xzw = (-r0.xxyz + r1.wwww).xzw;
/*75*/	r0.xyz = (vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*76*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*78*/	color2.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*79*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*80*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*81*/	r1.w = 1.000000;
/*82*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*83*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*84*/	color3.x = r0.w / r1.x;
/*85*/	r0.w = max(abs(r2.z), abs(r2.y));
/*86*/	r0.w = max(r0.w, abs(r2.x));
/*87*/	r1.xyz = (r2.xyzx / r0.wwww).xyz;
/*88*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*89*/	color0.w = saturate(r3.y);
/*90*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*91*/	color2.w = 0;
/*92*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*93*/	color4 = floatBitsToUint(vsOut_T9.z);
/*94*/	return;
}
