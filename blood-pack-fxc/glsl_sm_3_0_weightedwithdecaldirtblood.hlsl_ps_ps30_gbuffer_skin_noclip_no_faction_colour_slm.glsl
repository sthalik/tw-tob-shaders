//
//
// Shader Model 4
// Fragment Shader
//
// id: 2487 - fxc/glsl_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_gbuffer_skin_noclip_no_faction_colour_slm.glsl
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
in vec4 vsOut_T8;

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
uniform sampler2D s_decal_blood_map;

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
/*10*/	r4.xy = (-cb1.data[3].xyxx + cb1.data[3].zwzz).xy;
/*11*/	r4.zw = (vsOut_T1.xxxy + -cb1.data[3].xxxy).zw;
/*12*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*13*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*14*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r5.x));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r0.w));
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r0.w));
/*18*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyxx.st)).xyzw;
/*19*/	r4.xyzw = (texture(s_decal_normal, r4.xyxx.st)).xyzw;
/*20*/	if(floatBitsToUint(r0.w) != 0u) {
/*21*/	  r4.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*22*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*23*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*24*/	  r0.w = -r0.w + 1.000000;
/*25*/	  r0.w = max(r0.w, 0.000000);
/*26*/	  r4.z = sqrt(r0.w);
/*27*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*29*/	  r0.w = r3.x * r7.w;
/*30*/	  r3.x = r0.w * -0.500000 + r3.x;
/*31*/	  r5.xyz = (r5.xyzx * r6.wwww + -r1.xyzx).xyz;
/*32*/	  r1.xyz = (r7.wwww * r5.xyzx + r1.xyzx).xyz;
/*33*/	  r0.w = -r5.w * r6.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*35*/	  r4.xyz = (-r2.xyzx + r4.xyzx).xyz;
/*36*/	  r2.xyz = (r7.wwww * r4.xyzx + r2.xyzx).xyz;
/*37*/	}
/*38*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*39*/	r4.xy = (vsOut_T1.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*40*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*41*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	r0.w = r4.w * r5.w;
/*43*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*44*/	r0.xyz = (r0.wwww * r5.xyzx + r0.xyzx).xyz;
/*45*/	r2.xy = (r4.xyxx * r4.wwww + r2.xyxx).xy;
/*46*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*47*/	r1.w = inversesqrt(r1.w);
/*48*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*49*/	r1.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*50*/	if(r1.w != 0) discard;
/*51*/	r4.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*52*/	r4.xy = (r4.xyxx * cb1.data[2].xyxx + vsOut_T6.xyxx).xy;
/*53*/	r4.xyzw = (texture(s_decal_blood_map, r4.xyxx.st)).xyzw;
/*54*/	r1.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*55*/	r1.w = saturate(-r1.w + r4.w);
/*56*/	r1.w = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*57*/	if(floatBitsToUint(r1.w) != 0u) {
/*58*/	  r1.w = -r4.w + 1.000000;
/*59*/	  r1.w = saturate(vsOut_T4.z * 0.900000 + -r1.w);
/*60*/	  r1.w = -r1.w + 1.000000;
/*61*/	  r1.w = -r1.w * r1.w + 1.000000;
/*62*/	  r1.w = r1.w * -0.600000 + 1.000000;
/*63*/	  r4.xyz = (r1.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*64*/	  r1.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*65*/	  r1.w = uintBitsToFloat((r1.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*66*/	  r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*67*/	  r5.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r4.xzzx).xyz;
/*68*/	  r0.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*69*/	  r4.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*70*/	  r3.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*71*/	} else {
/*72*/	  r5.xyz = (r0.wwww * r1.xyzx).xyz;
/*73*/	  r4.xyz = (r5.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r1.xyzx).xyz;
/*74*/	}
/*75*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*76*/	r0.w = inversesqrt(r0.w);
/*77*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*78*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r5.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*81*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*82*/	r0.w = inversesqrt(r0.w);
/*83*/	r6.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*84*/	r5.xyz = (r2.yyyy * r5.xyzx).xyz;
/*85*/	r1.xyz = (r2.xxxx * r1.xyzx + r5.xyzx).xyz;
/*86*/	r1.xyz = (r2.zzzz * r6.xyzx + r1.xyzx).xyz;
/*87*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*88*/	r0.w = inversesqrt(r0.w);
/*89*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*90*/	r0.w = vsOut_T7.x * -r3.x + r3.x;
/*91*/	r2.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*92*/	r2.xyz = (-r0.xyzx + r2.xyzx).xyz;
/*93*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xyzx + r0.xyzx).xyz;
/*94*/	r1.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*95*/	r2.xyz = (-r0.xyzx + r1.wwww).xyz;
/*96*/	r0.xyz = (vsOut_T7.yyyy * r2.xyzx + r0.xyzx).xyz;
/*97*/	r1.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*98*/	r2.xyz = (-r4.xyzx + r1.wwww).xyz;
/*99*/	color2.xyz = saturate(vsOut_T7.yyyy * r2.xyzx + r4.xyzx).xyz;
/*100*/	color1.w = saturate(vsOut_T7.y * -r0.w + r0.w);
/*101*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*102*/	r2.w = 1.000000;
/*103*/	r0.w = dot(r2.xyzw, cb0.data[11].xyzw);
/*104*/	r1.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*105*/	color3.x = r0.w / r1.w;
/*106*/	r0.w = max(abs(r1.z), abs(r1.y));
/*107*/	r0.w = max(r0.w, abs(r1.x));
/*108*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*109*/	r3.xzw = (r1.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*110*/	color0.xyzw = saturate(r3.xzwy);
/*111*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*112*/	color2.w = 0;
/*113*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*114*/	color4 = floatBitsToUint(vsOut_T9.z);
/*115*/	return;
}
