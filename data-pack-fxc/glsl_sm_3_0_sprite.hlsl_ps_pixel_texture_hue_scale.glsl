//
//
// Shader Model 4
// Fragment Shader
//
// id: 103 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_texture_hue_scale.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;

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

/*0*/	r0.x = uintBitsToFloat((0.500000 < cb0.data[0].w) ? 0xffffffffu : 0x00000000u);
/*1*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*2*/	r1.xz = (mix(r1.xxzx, r1.zzxz, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*3*/	r0.x = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*4*/	r0.x = r0.x * 200.000000;
/*5*/	r0.y = uintBitsToFloat((r0.x >= -r0.x) ? 0xffffffffu : 0x00000000u);
/*6*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? 1.000000 : -1.000000;
/*7*/	r0.x = r0.y * r0.x;
/*8*/	r0.x = fract(r0.x);
/*9*/	r0.x = r0.x * r0.y;
/*10*/	r0.y = r0.x * 6.000000;
/*11*/	r0.y = floor(r0.y);
/*12*/	r0.z = intBitsToFloat(int(r0.y));
/*13*/	r0.x = r0.x * 6.000000 + -r0.y;
/*14*/	r1.x = -r0.x + 1.000000;
/*15*/	r0.x = uintBitsToFloat((floatBitsToInt(r0.z) < int(5)) ? 0xffffffffu : 0x00000000u) /**/;
/*16*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(floatBitsToInt(r0.zzzz), ivec4(ivec4(1, 2, 3, 4)))) * 0xffffffffu) /**/;
/*17*/	r3.x = -r1.x + 1.000000;
/*18*/	r3.z = 1.000000;
/*19*/	r1.yzw = (vec4(0, 1.000000, 0, 1.000000)).yzw;
/*20*/	r0.xz = (mix(r1.yyxy, r3.xxzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xz;
/*21*/	r0.yw = (vec4(0, 0, 0, 1.000000)).yw;
/*22*/	r0.xyzw = mix(r0.xyzw, r1.zxww, greaterThan(floatBitsToUint(r2.wwww), uvec4(0)));
/*23*/	r3.xyzw = r1.wxzw * vec4(1.000000, -1.000000, 1.000000, 1.000000) + vec4(0.000000, 1.000000, 0.000000, 0.000000);
/*24*/	r0.xyzw = mix(r0.xyzw, r3.zwyw, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*25*/	r0.xyzw = mix(r0.xyzw, r1.xwzw, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)));
/*26*/	color0.xyzw = mix(r0.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*27*/	return;
}
