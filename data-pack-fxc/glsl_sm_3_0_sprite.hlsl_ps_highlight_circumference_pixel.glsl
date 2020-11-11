//
//
// Shader Model 4
// Fragment Shader
//
// id: 118 - fxc/glsl_SM_3_0_sprite.hlsl_PS_highlight_circumference_pixel.glsl
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
  vec4 r3;

/*0*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*1*/	r1.x = uintBitsToFloat((0.500000 < cb0.data[0].w) ? 0xffffffffu : 0x00000000u);
/*2*/	r0.xz = (mix(r0.xxzx, r0.zzxz, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xz;
/*3*/	r1.xyzw = r0.xyzw * vsOut_C0.xyzw;
/*4*/	r0.w = r0.w * vsOut_C0.w + -0.003922;
/*5*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*6*/	if(r0.w != 0) discard;
/*7*/	r2.xy = (vsOut_T0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r2.zw = (uintBitsToFloat(uvec4(notEqual(r2.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*9*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r2.z));
/*10*/	if(floatBitsToUint(r0.w) != 0u) {
/*11*/	  r0.w = uintBitsToFloat((cb0.data[0].y >= -cb0.data[0].y) ? 0xffffffffu : 0x00000000u);
/*12*/	    r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*13*/	  r2.z = r0.w * cb0.data[0].y;
/*14*/	  r2.z = fract(r2.z);
/*15*/	  r0.w = r0.w * r2.z;
/*16*/	  r2.z = min(abs(r2.x), abs(r2.y));
/*17*/	  r2.w = max(abs(r2.x), abs(r2.y));
/*18*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*19*/	  r2.z = r2.w * r2.z;
/*20*/	  r2.w = r2.z * r2.z;
/*21*/	  r3.x = r2.w * 0.020835 + -0.085133;
/*22*/	  r3.x = r2.w * r3.x + 0.180141;
/*23*/	  r3.x = r2.w * r3.x + -0.330299;
/*24*/	  r2.w = r2.w * r3.x + 0.999866;
/*25*/	  r3.x = r2.w * r2.z;
/*26*/	  r3.y = uintBitsToFloat((abs(r2.x) < abs(r2.y)) ? 0xffffffffu : 0x00000000u);
/*27*/	  r3.x = r3.x * -2.000000 + 1.570796;
/*28*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r3.x));
/*29*/	  r2.z = r2.z * r2.w + r3.x;
/*30*/	  r2.w = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*31*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & uint(0xc0490fdbu));
/*32*/	  r2.z = r2.w + r2.z;
/*33*/	  r2.w = min(r2.x, r2.y);
/*34*/	  r3.x = max(r2.x, r2.y);
/*35*/	  r2.w = uintBitsToFloat((r2.w < -r2.w) ? 0xffffffffu : 0x00000000u);
/*36*/	  r3.x = uintBitsToFloat((r3.x >= -r3.x) ? 0xffffffffu : 0x00000000u);
/*37*/	  r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r3.x));
/*38*/	    r2.z = (floatBitsToUint(r2.w) > 0x00000000u) ? -r2.z : r2.z;
/*39*/	  r2.z = r2.z + 3.141593;
/*40*/	  r2.z = vsOut_T3.x * 3.141593 + r2.z;
/*41*/	  r0.w = r0.w * 3.141593 + r2.z;
/*42*/	  r2.z = r0.w * 3.141593;
/*43*/	  r2.z = uintBitsToFloat((r2.z >= -r2.z) ? 0xffffffffu : 0x00000000u);
/*44*/	  r2.zw = (mix(vec4(0, 0, -3.141593, -0.318310), vec4(0, 0, 3.141593, 0.318310), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).zw;
/*45*/	  r0.w = r0.w * r2.w;
/*46*/	  r0.w = fract(r0.w);
/*47*/	  r0.w = r0.w * r2.z;
/*48*/	  r0.w = sin(r0.w);
/*49*/	  r2.z = -r0.w * 0.400000 + 1.400000;
/*50*/	  r2.xy = (r2.xyxx * r2.xyxx).xy;
/*51*/	  r2.x = r2.y + r2.x;
/*52*/	  r2.x = sqrt(r2.x);
/*53*/	  r2.x = -r2.x + r2.z;
/*54*/	  r2.y = uintBitsToFloat((0.400000 >= r2.x) ? 0xffffffffu : 0x00000000u);
/*55*/	  r2.x = -r2.x * 2.500000 + 1.000000;
/*56*/	  r0.w = r0.w * r2.x;
/*57*/	  r0.xyz = (-r0.xyzx * vsOut_C0.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*58*/	  r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*59*/	  r1.xyz = (mix(r1.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyz;
/*60*/	}
/*61*/	color0.xyzw = r1.xyzw;
/*62*/	return;
}
