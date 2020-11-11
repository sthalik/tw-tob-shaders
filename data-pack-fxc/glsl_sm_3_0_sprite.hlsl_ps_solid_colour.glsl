//
//
// Shader Model 4
// Fragment Shader
//
// id: 83 - fxc/glsl_SM_3_0_sprite.hlsl_PS_solid_colour.glsl
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
in vec4 vsOut_T2;
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;

/*0*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vsOut_T3.xyxx, vsOut_T2.xwxx)) * 0xffffffffu)).xy;
/*1*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vsOut_T2.zzzy, vsOut_T3.xxxy)) * 0xffffffffu)).zw;
/*2*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.x));
/*3*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*5*/	if(floatBitsToUint(r0.x) != 0u) {
/*6*/	  r0.xy = (vsOut_T0.xyxx + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r0.xy = (abs(r0.xyxx) * vec4(2.500000, 2.500000, 0.000000, 0.000000)).xy;
/*8*/	  r0.xy = (fract(r0.xyxx)).xy;
/*9*/	  r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xyxx, vec4(0.500000, 0.500000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*10*/	  r1.xyz = (mix(vec4(0.800000, 0.850000, 0.900000, 0), vec4(0.500000, 0.500000, 0.590000, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*11*/	  r0.yzw = (mix(vec4(0, 0.500000, 0.500000, 0.590000), vec4(0, 0.800000, 0.850000, 0.900000), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).yzw;
/*12*/	  r0.xyz = (mix(r0.yzwy, r1.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*13*/	  r1.xyz = (-r0.xyzx + vsOut_C0.xyzx).xyz;
/*14*/	  r0.xyz = saturate(vsOut_C0.wwww * r1.xyzx + r0.xyzx).xyz;
/*15*/	  r0.xyz = (log2(r0.xyzx)).xyz;
/*16*/	  r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*17*/	  r0.xyz = (exp2(r0.xyzx)).xyz;
/*18*/	  r0.w = 1.000000;
/*19*/	} else {
/*20*/	  if(-1 != 0) discard;
/*21*/	}
/*22*/	r1.x = r0.w + -0.003922;
/*23*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*24*/	if(r1.x != 0) discard;
/*25*/	color0.xyzw = r0.xyzw;
/*26*/	return;
}
