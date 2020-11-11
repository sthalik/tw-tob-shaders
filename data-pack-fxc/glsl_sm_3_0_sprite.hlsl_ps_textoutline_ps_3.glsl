//
//
// Shader Model 4
// Fragment Shader
//
// id: 160 - fxc/glsl_SM_3_0_sprite.hlsl_PS_TextOutline_ps_3.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_C0;
in vec4 vsOut_T0;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform sprite_PS
{
  vec4 data[3];
} cb1;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = saturate(r0.x);
/*2*/	r1.x = log2(r1.x);
/*3*/	r1.x = r1.x * cb0.data[0].z;
/*4*/	r1.w = exp2(r1.x);
/*5*/	r1.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*6*/	r2.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.000000, 0.000000), cb1.data[0].zwzz)) * 0xffffffffu)).xy;
/*7*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xz;
/*8*/	r0.xyzw = mix(r0.xyzw, r1.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*9*/	r1.x = -r0.w + 1.000000;
/*10*/	r3.xyzw = vsOut_T0.xyxy + vec4(-0.001000, 0.000000, 0.001000, 0.000000);
/*11*/	r4.xyzw = (textureLod(s_diffuse_map, r3.xyxx.st, vsOut_T0.y)).xyzw;
/*12*/	r3.xyzw = (textureLod(s_diffuse_map, r3.zwzz.st, vsOut_T0.y)).xyzw;
/*13*/	r4.x = saturate(r4.x);
/*14*/	r1.y = log2(r4.x);
/*15*/	r1.y = r1.y * cb0.data[0].z;
/*16*/	r1.y = exp2(r1.y);
/*17*/	r1.y = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.y : r4.w;
/*18*/	r1.x = r1.y * r1.x + r0.w;
/*19*/	r1.y = -r1.x + 1.000000;
/*20*/	r3.x = saturate(r3.x);
/*21*/	r1.z = log2(r3.x);
/*22*/	r1.z = r1.z * cb0.data[0].z;
/*23*/	r1.z = exp2(r1.z);
/*24*/	r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : r3.w;
/*25*/	r1.x = r1.z * r1.y + r1.x;
/*26*/	r1.y = -r1.x + 1.000000;
/*27*/	r3.xyzw = vsOut_T0.xyxy + vec4(0.000000, -0.001000, 0.000000, 0.001000);
/*28*/	r4.xyzw = vsOut_T0.xxyy + vec4(-0.001000, 0.001000, -0.001000, 0.001000);
/*29*/	r5.xyzw = (textureLod(s_diffuse_map, r3.xyxx.st, r4.z)).xyzw;
/*30*/	r3.xyzw = (textureLod(s_diffuse_map, r3.zwzz.st, r4.w)).xyzw;
/*31*/	r5.x = saturate(r5.x);
/*32*/	r1.z = log2(r5.x);
/*33*/	r1.z = r1.z * cb0.data[0].z;
/*34*/	r1.z = exp2(r1.z);
/*35*/	r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : r5.w;
/*36*/	r1.x = r1.z * r1.y + r1.x;
/*37*/	r1.y = -r1.x + 1.000000;
/*38*/	r3.x = saturate(r3.x);
/*39*/	r1.z = log2(r3.x);
/*40*/	r1.z = r1.z * cb0.data[0].z;
/*41*/	r1.z = exp2(r1.z);
/*42*/	r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : r3.w;
/*43*/	r1.x = r1.z * r1.y + r1.x;
/*44*/	r1.y = -r1.x + 1.000000;
/*45*/	r3.xyzw = (textureLod(s_diffuse_map, r4.xzxx.st, r4.z)).xyzw;
/*46*/	r3.x = saturate(r3.x);
/*47*/	r1.z = log2(r3.x);
/*48*/	r1.z = r1.z * cb0.data[0].z;
/*49*/	r1.z = exp2(r1.z);
/*50*/	r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : r3.w;
/*51*/	r1.x = r1.z * r1.y + r1.x;
/*52*/	r1.y = -r1.x + 1.000000;
/*53*/	r3.xyzw = (textureLod(s_diffuse_map, r4.xwxx.st, r4.w)).xyzw;
/*54*/	r3.x = saturate(r3.x);
/*55*/	r1.z = log2(r3.x);
/*56*/	r1.z = r1.z * cb0.data[0].z;
/*57*/	r1.z = exp2(r1.z);
/*58*/	r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : r3.w;
/*59*/	r1.x = r1.z * r1.y + r1.x;
/*60*/	r1.y = -r1.x + 1.000000;
/*61*/	r3.xyzw = (textureLod(s_diffuse_map, r4.yzyy.st, r4.z)).xyzw;
/*62*/	r4.xyzw = (textureLod(s_diffuse_map, r4.ywyy.st, r4.w)).xyzw;
/*63*/	r3.x = saturate(r3.x);
/*64*/	r1.z = log2(r3.x);
/*65*/	r1.z = r1.z * cb0.data[0].z;
/*66*/	r1.z = exp2(r1.z);
/*67*/	r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : r3.w;
/*68*/	r1.x = r1.z * r1.y + r1.x;
/*69*/	r1.y = -r1.x + 1.000000;
/*70*/	r4.x = saturate(r4.x);
/*71*/	r1.z = log2(r4.x);
/*72*/	r1.z = r1.z * cb0.data[0].z;
/*73*/	r1.z = exp2(r1.z);
/*74*/	r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : r4.w;
/*75*/	r1.x = r1.z * r1.y + r1.x;
/*76*/	r2.w = vsOut_C0.w * vsOut_T3.w;
/*77*/	r2.xyz = (vsOut_T3.xyzx).xyz;
/*78*/	r1.xyzw = r1.xxxx * r2.xyzw;
/*79*/	r2.xyzw = r0.xyzw * vsOut_C0.xyzw + -r1.xyzw;
/*80*/	r0.x = r0.w * vsOut_C0.w;
/*81*/	r0.xyzw = r0.xxxx * r2.xyzw + r1.xyzw;
/*82*/	r1.x = r0.w + -0.003922;
/*83*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*84*/	if(r1.x != 0) discard;
/*85*/	r1.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*86*/	r1.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*87*/	r1.xyzw = uintBitsToFloat(uvec4(lessThan(r1.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*88*/	r1.xy = (uintBitsToFloat(floatBitsToUint(r1.zwzz) | floatBitsToUint(r1.xyxx))).xy;
/*89*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) | floatBitsToUint(r1.x));
/*90*/	if(r1.x != 0) discard;
/*91*/	r1.xyz = saturate(r0.xyzx * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*92*/	r1.xyz = (-r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r1.xyzx).xyz;
/*93*/	r2.xyz = (r0.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*94*/	r1.w = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*95*/	r1.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*96*/	r2.w = r1.w * cb1.data[0].y;
/*97*/	r2.w = fract(r2.w);
/*98*/	r1.w = r1.w * r2.w;
/*99*/	r1.w = r1.w * 3.141593;
/*100*/	r1.w = sin(r1.w);
/*101*/	r1.xyz = (r1.wwww * r1.xyzx + r2.xyzx).xyz;
/*102*/	r1.w = uintBitsToFloat((0.500000 < vsOut_T5.z) ? 0xffffffffu : 0x00000000u);
/*103*/	r0.xyz = saturate(mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*104*/	color0.w = r0.w;
/*105*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*106*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*107*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*108*/	return;
}
