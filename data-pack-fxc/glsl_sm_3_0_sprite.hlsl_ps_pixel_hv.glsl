//
//
// Shader Model 4
// Fragment Shader
//
// id: 65 - fxc/glsl_SM_3_0_sprite.hlsl_PS_pixel_hv.glsl
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

/*0*/	r0.x = vsOut_C0.w + -0.003922;
/*1*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*2*/	if(r0.x != 0) discard;
/*3*/	r0.x = vsOut_T0.x * 6.000000;
/*4*/	r0.y = uintBitsToFloat((vsOut_T0.x >= 1.000000) ? 0xffffffffu : 0x00000000u);
/*5*/	r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? 0 : r0.x;
/*6*/	r0.y = floor(r0.x);
/*7*/	r0.x = -r0.y + r0.x;
/*8*/	r0.y = intBitsToFloat(int(r0.y));
/*9*/	r0.z = -r0.x + 1.000000;
/*10*/	r0.x = -vsOut_C0.y * r0.x + 1.000000;
/*11*/	r1.y = r0.x * vsOut_T0.y;
/*12*/	r0.x = -vsOut_C0.y * r0.z + 1.000000;
/*13*/	r0.x = r0.x * vsOut_T0.y;
/*14*/	r1.w = r0.x;
/*15*/	r0.w = uintBitsToFloat((floatBitsToInt(r0.y) < int(5)) ? 0xffffffffu : 0x00000000u) /**/;
/*16*/	r2.xyzw = uintBitsToFloat(uvec4(lessThan(floatBitsToInt(r0.yyyy), ivec4(ivec4(1, 2, 3, 4)))) * 0xffffffffu) /**/;
/*17*/	r0.z = vsOut_T0.y;
/*18*/	r1.z = vsOut_T0.y;
/*19*/	r0.xz = (mix(r1.zzyz, r0.xxzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xz;
/*20*/	r0.w = -vsOut_C0.y + 1.000000;
/*21*/	r1.x = r0.w * vsOut_T0.y;
/*22*/	r0.y = r1.x;
/*23*/	r0.xyz = (mix(r0.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*24*/	r0.xyz = (mix(r0.xyzx, r1.xzwx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*25*/	r0.xyz = (mix(r0.xyzx, r1.yzxy, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyz;
/*26*/	r0.xyz = (mix(r0.xyzx, r1.zwxz, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*27*/	r0.w = uintBitsToFloat((vsOut_C0.y == 0.000000) ? 0xffffffffu : 0x00000000u);
/*28*/	r0.xyz = (mix(r0.xyzx, vsOut_T0.yyyy, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*29*/	r1.xy = (vsOut_T0.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*30*/	r1.xy = (abs(r1.xyxx) * vec4(2.500000, 2.500000, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (fract(r1.xyxx)).xy;
/*32*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, vec4(0.500000, 0.500000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*33*/	r2.xyz = (mix(vec4(0.800000, 0.850000, 0.900000, 0), vec4(0.500000, 0.500000, 0.590000, 0), greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).xyz;
/*34*/	r1.yzw = (mix(vec4(0, 0.500000, 0.500000, 0.590000), vec4(0, 0.800000, 0.850000, 0.900000), greaterThan(floatBitsToUint(r1.yyyy), uvec4(0)))).yzw;
/*35*/	r1.xyz = (mix(r1.yzwy, r2.xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*36*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*37*/	color0.xyz = (vsOut_C0.wwww * r0.xyzx + r1.xyzx).xyz;
/*38*/	color0.w = 1.000000;
/*39*/	return;
}
