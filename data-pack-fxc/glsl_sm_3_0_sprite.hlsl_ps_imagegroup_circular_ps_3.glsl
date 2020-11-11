//
//
// Shader Model 4
// Fragment Shader
//
// id: 166 - fxc/glsl_SM_3_0_sprite.hlsl_PS_imagegroup_circular_ps_3.glsl
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

/*0*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*1*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*5*/	if(r0.x != 0) discard;
/*6*/	r0.x = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*7*/	r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : -1.000000;
/*8*/	r0.y = r0.x * cb1.data[0].y;
/*9*/	r0.y = fract(r0.y);
/*10*/	r0.x = r0.y * r0.x;
/*11*/	r0.x = r0.x * 3.141593;
/*12*/	r0.x = sin(r0.x);
/*13*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*14*/	r0.y = saturate(r1.x);
/*15*/	r0.y = log2(r0.y);
/*16*/	r0.y = r0.y * cb0.data[0].z;
/*17*/	r2.w = exp2(r0.y);
/*18*/	r2.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*19*/	r0.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.500000, 0.500000, 0.000000), cb1.data[0].zzwz)) * 0xffffffffu)).yzw;
/*20*/	r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xz;
/*21*/	r1.xyzw = mix(r1.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*22*/	r1.xyzw = r1.xyzw * vsOut_C0.xyzw;
/*23*/	r0.yz = (uintBitsToFloat(uvec4(equal(vsOut_T0.xxyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).yz;
/*24*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.y));
/*25*/	r0.y = (floatBitsToUint(r0.w) > 0x00000000u) ? 0 : r0.y;
/*26*/	r1.xyzw = mix(r1.xyzw, vsOut_C0.xyzw, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*27*/	r0.yzw = saturate(r1.xxyz * vec4(0.000000, 3.000000, 3.000000, 3.000000)).yzw;
/*28*/	r0.yzw = (-r1.xxyz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + r0.yyzw).yzw;
/*29*/	r2.xyz = (r1.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*30*/	r0.xyz = (r0.xxxx * r0.yzwy + r2.xyzx).xyz;
/*31*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T5.z) ? 0xffffffffu : 0x00000000u);
/*32*/	r0.xyz = saturate(mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*33*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*34*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*35*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*36*/	r0.xy = trunc((vsOut_T3.xyxx).xy);
/*37*/	r0.xy = (r0.xyxx * vec4(0.000200, 0.000200, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*38*/	r1.xy = (fract(vsOut_T3.xyxx)).xy;
/*39*/	r0.zw = (r1.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*40*/	r0.yw = (-r0.xxxz + r0.yyyw).yw;
/*41*/	r0.xz = (-r0.xxzx + vsOut_T5.xxyx).xz;
/*42*/	r0.xy = (r0.xzxx / r0.ywyy).xy;
/*43*/	r0.y = -r0.y + 0.500000;
/*44*/	r0.x = r0.x + -0.500000;
/*45*/	r0.y = r0.y * r0.y;
/*46*/	r0.x = r0.x * r0.x + r0.y;
/*47*/	r0.x = sqrt(r0.x);
/*48*/	r0.x = r0.x * 1.428571;
/*49*/	r0.x = -r0.x * r0.x + 1.000000;
/*50*/	r0.y = -r0.x + 1.000000;
/*51*/	r0.z = -abs(vsOut_T3.z) + abs(vsOut_T3.w);
/*52*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*53*/	r0.w = -abs(vsOut_T3.z) + cb1.data[0].y;
/*54*/	r0.z = saturate(r0.z * r0.w);
/*55*/	r0.w = r0.z * -2.000000 + 3.000000;
/*56*/	r0.z = r0.z * r0.z;
/*57*/	r1.x = r0.z * r0.w;
/*58*/	r0.z = -r0.w * r0.z + 1.000000;
/*59*/	r0.w = uintBitsToFloat((vsOut_T3.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*60*/	r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.z : r1.x;
/*61*/	r0.x = r0.z * r0.y + r0.x;
/*62*/	r0.x = r0.x * r1.w;
/*63*/	color0.w = r0.z * r0.x;
/*64*/	return;
}
