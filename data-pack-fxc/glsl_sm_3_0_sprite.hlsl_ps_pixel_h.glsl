//
//
// Shader Model 4
// Fragment Shader
//
// id: 75 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_h.glsl
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

layout(location = 0) out vec4 color0;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

/*0*/	r0.x = vsOut_C0.w + -0.003922;
/*1*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*2*/	if(r0.x != 0) discard;
/*3*/	r0.y = 0;
/*4*/	r1.z = 1.000000;
/*5*/	r0.w = vsOut_T0.y * 6.000000;
/*6*/	r1.y = uintBitsToFloat((vsOut_T0.y >= 1.000000) ? 0xffffffffu : 0x00000000u);
/*7*/	r0.w = (floatBitsToUint(r1.y) > 0x00000000u) ? 0 : r0.w;
/*8*/	r1.y = floor(r0.w);
/*9*/	r0.w = r0.w + -r1.y;
/*10*/	r1.y = intBitsToFloat(int(r1.y));
/*11*/	r2.x = -r0.w + 1.000000;
/*12*/	r0.w = uintBitsToFloat((floatBitsToInt(r1.y) < int(5)) ? 0xffffffffu : 0x00000000u) /**/;
/*13*/	r3.xyzw = uintBitsToFloat(uvec4(lessThan(floatBitsToInt(r1.yyyy), ivec4(ivec4(1, 2, 3, 4)))) * 0xffffffffu) /**/;
/*14*/	r1.x = -r2.x + 1.000000;
/*15*/	r2.yzw = (vec4(0, 1.000000, 0, 1.000000)).yzw;
/*16*/	r0.xz = (mix(r2.yyxy, r1.xxzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xz;
/*17*/	r0.xyz = (mix(r0.xyzx, r2.zxwz, greaterThan(floatBitsToUint(r3.wwww), uvec4(0)))).xyz;
/*18*/	r1.xyz = (r2.wxzw * vec4(1.000000, -1.000000, 1.000000, 0.000000) + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*19*/	r0.xyz = (mix(r0.xyzx, r1.zxyz, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz;
/*20*/	r0.xyz = (mix(r0.xyzx, r2.xwzx, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyz;
/*21*/	color0.xyz = (mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz;
/*22*/	color0.w = vsOut_C0.w;
/*23*/	return;
}
