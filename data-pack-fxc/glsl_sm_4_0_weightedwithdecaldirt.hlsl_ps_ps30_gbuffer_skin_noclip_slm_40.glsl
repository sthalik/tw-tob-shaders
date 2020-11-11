//
//
// Shader Model 4
// Fragment Shader
//
// id: 2043 - fxc/glsl_SM_4_0_weightedwithdecaldirt.hlsl_PS_ps30_gbuffer_skin_noclip_slm_40.glsl
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
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*2*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*3*/	r3.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*4*/	r0.xyz = (r2.xxxx * r3.xyzx + r0.xyzx).xyz;
/*5*/	r3.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r2.yyyy * r3.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyw = (cb2.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*8*/	r0.xyz = (r2.zzzz * r2.xywx + r0.xyzx).xyz;
/*9*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*10*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*11*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*12*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*13*/	r0.w = -r0.w + 1.000000;
/*14*/	r0.w = max(r0.w, 0.000000);
/*15*/	r2.z = sqrt(r0.w);
/*16*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*17*/	r3.zw = (-cb1.data[3].xxxy + cb1.data[3].zzzw).zw;
/*18*/	r4.xy = (vsOut_T1.xyxx + -cb1.data[3].xyxx).xy;
/*19*/	r4.xy = (r4.xyxx / r3.zwzz).xy;
/*20*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*21*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r5.x));
/*23*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*24*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*25*/	r4.z = vsOut_T6.z;
/*26*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*27*/	r4.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*28*/	if(floatBitsToUint(r0.w) != 0u) {
/*29*/	  r3.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*30*/	  r4.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*31*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*32*/	  r0.w = -r0.w + 1.000000;
/*33*/	  r0.w = max(r0.w, 0.000000);
/*34*/	  r4.z = sqrt(r0.w);
/*35*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*36*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*37*/	  r0.w = r3.x * r7.w;
/*38*/	  r3.x = r0.w * -0.500000 + r3.x;
/*39*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*40*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*41*/	  r0.w = -r5.w * r6.w + 1.000000;
/*42*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*43*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*44*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*45*/	}
/*46*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	r3.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*48*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*49*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*50*/	r0.w = r4.w * r5.w;
/*51*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*52*/	r0.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*53*/	r2.xy = (r3.zwzz * r4.wwww + r2.xyxx).xy;
/*54*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*55*/	r1.w = inversesqrt(r1.w);
/*56*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*57*/	r4.xyz = (r0.wwww * r1.xyzx).xyz;
/*58*/	r1.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*59*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r4.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*62*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*63*/	r0.w = inversesqrt(r0.w);
/*64*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*65*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*66*/	r0.w = inversesqrt(r0.w);
/*67*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*68*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*69*/	r2.xyw = (r2.xxxx * r4.xyxz + r5.xyxz).xyw;
/*70*/	r2.xyz = (r2.zzzz * r6.xyzx + r2.xywx).xyz;
/*71*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*72*/	r0.w = inversesqrt(r0.w);
/*73*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*74*/	r0.w = -vsOut_T4.z + 1.000000;
/*75*/	r4.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*76*/	r0.xyz = (r0.xyzx * r0.wwww + r4.xyzx).xyz;
/*77*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*78*/	r3.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*79*/	r3.xzw = (-r0.xxyz + r3.xxzw).xzw;
/*80*/	r0.xyz = saturate(vsOut_T7.xxxx * r3.xzwx + r0.xyzx).xyz;
/*81*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*82*/	r3.xzw = (-r0.xxyz + r1.wwww).xzw;
/*83*/	r0.xyz = (vsOut_T7.yyyy * r3.xzwx + r0.xyzx).xyz;
/*84*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*85*/	r3.xzw = (-r1.xxyz + r1.wwww).xzw;
/*86*/	color2.xyz = saturate(vsOut_T7.yyyy * r3.xzwx + r1.xyzx).xyz;
/*87*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*88*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*89*/	r1.w = 1.000000;
/*90*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*91*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*92*/	color3.x = r0.w / r1.x;
/*93*/	r0.w = max(abs(r2.z), abs(r2.y));
/*94*/	r0.w = max(r0.w, abs(r2.x));
/*95*/	r1.xyz = (r2.xyzx / r0.wwww).xyz;
/*96*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*97*/	color0.w = saturate(r3.y);
/*98*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*99*/	color2.w = 0;
/*100*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*101*/	color4 = floatBitsToUint(vsOut_T9.z);
/*102*/	return;
}
