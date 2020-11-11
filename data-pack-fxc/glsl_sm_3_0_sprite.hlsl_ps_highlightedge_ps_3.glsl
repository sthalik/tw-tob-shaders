//
//
// Shader Model 4
// Fragment Shader
//
// id: 156 - fxc/glsl_SM_3_0_sprite.hlsl_PS_HighlightEdge_ps_3.glsl
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

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;

layout(std140) uniform sprite_PS
{
  vec4 data[3];
} cb0;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;

/*0*/	r0.x = vsOut_T0.w * vsOut_T3.y + vsOut_T3.x;
/*1*/	r0.yz = (vsOut_T3.xxyx + vec4(0.000000, -1.000000, -1.000000, 0.000000)).yz;
/*2*/	r0.w = r0.z + vsOut_T3.x;
/*3*/	r0.w = r0.y + r0.w;
/*4*/	r1.x = -vsOut_T0.z * vsOut_T3.x + r0.w;
/*5*/	r0.w = r0.z + r0.w;
/*6*/	r0.w = -vsOut_T0.w * vsOut_T3.y + r0.w;
/*7*/	r1.yz = (vsOut_T0.zzwz * vsOut_T3.xxyx).yz;
/*8*/	r0.yz = (uintBitsToFloat(uvec4(lessThan(r0.yyzy, r1.yyzy)) * 0xffffffffu)).yz;
/*9*/	r0.z = (floatBitsToUint(r0.z) > 0x00000000u) ? r1.x : -1.000000;
/*10*/	r1.xz = (uintBitsToFloat(uvec4(lessThan(r1.yyzy, vec4(1.000000, 0.000000, 1.000000, 0.000000))) * 0xffffffffu)).xz;
/*11*/	r0.z = (floatBitsToUint(r1.z) > 0x00000000u) ? r1.y : r0.z;
/*12*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : r0.z;
/*13*/	r0.x = (floatBitsToUint(r1.x) > 0x00000000u) ? r0.w : r0.x;
/*14*/	r0.y = vsOut_T3.y + vsOut_T3.x;
/*15*/	r0.y = r0.y * 2.000000 + -4.000000;
/*16*/	r0.z = r0.y * 4.000000;
/*17*/	r0.z = uintBitsToFloat((r0.z >= -r0.z) ? 0xffffffffu : 0x00000000u);
/*18*/	r0.zw = (mix(vec4(0, 0, -4.000000, -0.250000), vec4(0, 0, 4.000000, 0.250000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*19*/	r0.w = r0.w * r0.y;
/*20*/	r0.w = fract(r0.w);
/*21*/	r0.z = r0.w * r0.z;
/*22*/	r0.y = r0.z / r0.y;
/*23*/	r0.y = r0.y + 4.000000;
/*24*/	r0.z = r0.y * 4.000000;
/*25*/	r0.w = uintBitsToFloat((cb0.data[0].y >= -cb0.data[0].y) ? 0xffffffffu : 0x00000000u);
/*26*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*27*/	r1.x = r0.w * cb0.data[0].y;
/*28*/	r1.x = fract(r1.x);
/*29*/	r0.w = r0.w * r1.x;
/*30*/	r0.z = r0.z * r0.w + r0.x;
/*31*/	r0.x = uintBitsToFloat((r0.x >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*32*/	r0.y = r0.z / r0.y;
/*33*/	r0.z = r0.y + r0.y;
/*34*/	r0.z = uintBitsToFloat((r0.z >= -r0.z) ? 0xffffffffu : 0x00000000u);
/*35*/	r0.zw = (mix(vec4(0, 0, -2.000000, -0.500000), vec4(0, 0, 2.000000, 0.500000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*36*/	r0.y = r0.w * r0.y;
/*37*/	r0.y = fract(r0.y);
/*38*/	r0.y = r0.y * r0.z;
/*39*/	r1.xyz = trunc((r0.yyyy).xyz);
/*40*/	r0.y = uintBitsToFloat((0.500000 < cb0.data[0].w) ? 0xffffffffu : 0x00000000u);
/*41*/	r2.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*42*/	r2.xz = (mix(r2.xxzx, r2.zzxz, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xz;
/*43*/	r1.w = vsOut_C0.w;
/*44*/	r2.w = 0;
/*45*/	color0.xyzw = mix(r2.xyzw, r1.xyzw, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)));
/*46*/	return;
}
