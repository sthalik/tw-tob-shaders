//
//
// Shader Model 4
// Fragment Shader
//
// id: 150 - fxc/glsl_SM_3_0_sprite.hlsl_PS_ColourWheel_ps_3.glsl
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

void main()
{
color0 = vec4(0);
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;

  vec4 x0[6];

/*0*/	x0[0].xyz = (vec4(1.000000, 0, 0, 0)).xyz;
/*1*/	x0[1].xyz = (vec4(1.000000, 1.000000, 0, 0)).xyz;
/*2*/	x0[2].xyz = (vec4(0, 1.000000, 0, 0)).xyz;
/*3*/	x0[3].xyz = (vec4(0, 1.000000, 1.000000, 0)).xyz;
/*4*/	x0[4].xyz = (vec4(0, 0, 1.000000, 0)).xyz;
/*5*/	x0[5].xyz = (vec4(1.000000, 0, 1.000000, 0)).xyz;
/*6*/	r0.xy = (vsOut_T0.wzww + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*7*/	r0.z = max(abs(r0.y), abs(r0.x));
/*8*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*9*/	r0.w = min(abs(r0.y), abs(r0.x));
/*10*/	r0.z = r0.z * r0.w;
/*11*/	r0.w = r0.z * r0.z;
/*12*/	r1.x = r0.w * 0.020835 + -0.085133;
/*13*/	r1.x = r0.w * r1.x + 0.180141;
/*14*/	r1.x = r0.w * r1.x + -0.330299;
/*15*/	r0.w = r0.w * r1.x + 0.999866;
/*16*/	r1.x = r0.w * r0.z;
/*17*/	r1.x = r1.x * -2.000000 + 1.570796;
/*18*/	r1.y = uintBitsToFloat((abs(r0.y) < abs(r0.x)) ? 0xffffffffu : 0x00000000u);
/*19*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*20*/	r0.z = r0.z * r0.w + r1.x;
/*21*/	r0.w = uintBitsToFloat((r0.y < -r0.y) ? 0xffffffffu : 0x00000000u);
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0xc0490fdbu));
/*23*/	r0.z = r0.w + r0.z;
/*24*/	r0.w = min(r0.y, r0.x);
/*25*/	r0.w = uintBitsToFloat((r0.w < -r0.w) ? 0xffffffffu : 0x00000000u);
/*26*/	r1.x = max(r0.y, r0.x);
/*27*/	r0.xy = (r0.yxyy * r0.yxyy).xy;
/*28*/	r0.x = r0.y + r0.x;
/*29*/	r0.x = sqrt(r0.x);
/*30*/	r0.x = r0.x + r0.x;
/*31*/	r0.x = min(r0.x, 1.000000);
/*32*/	r0.y = uintBitsToFloat((r1.x >= -r1.x) ? 0xffffffffu : 0x00000000u);
/*33*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.w));
/*34*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? -r0.z : r0.z;
/*35*/	r0.y = r0.y + 7.853981;
/*36*/	r0.z = r0.y * 6.283185;
/*37*/	r0.z = uintBitsToFloat((r0.z >= -r0.z) ? 0xffffffffu : 0x00000000u);
/*38*/	r0.zw = (mix(vec4(0, 0, -6.283185, -0.159155), vec4(0, 0, 6.283185, 0.159155), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*39*/	r0.y = r0.w * r0.y;
/*40*/	r0.y = fract(r0.y);
/*41*/	r0.y = r0.y * r0.z;
/*42*/	r0.y = -r0.y * 0.159155 + 1.000000;
/*43*/	r0.zw = (r0.yyyy * vec4(0.000000, 0.000000, 6.000000, 0.166667)).zw;
/*44*/	r0.z = floor(r0.z);
/*45*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*46*/	r1.xy = (mix(vec4(-0.166667, -6.000000, 0, 0), vec4(0.166667, 6.000000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*47*/	r0.w = r0.z + 1.000000;
/*48*/	r0.z = intBitsToFloat(int(r0.z));
/*49*/	r2.xyz = (x0[floatBitsToInt(r0.z)].xyzx).xyz;
/*50*/	r0.z = r0.w * 0.166667;
/*51*/	r0.z = fract(r0.z);
/*52*/	r0.z = r0.z * 6.000000;
/*53*/	r0.z = intBitsToFloat(int(r0.z));
/*54*/	r3.xyz = (x0[floatBitsToInt(r0.z)].xyzx).xyz;
/*55*/	r3.xyz = (-r2.xyzx + r3.xyzx).xyz;
/*56*/	r0.y = r0.y * r1.y;
/*57*/	r0.y = fract(r0.y);
/*58*/	r0.y = r0.y * r1.x;
/*59*/	r0.y = r0.y * 6.000000;
/*60*/	r0.yzw = (r0.yyyy * r3.xxyz + r2.xxyz).yzw;
/*61*/	r0.yzw = (r0.yyzw + vec4(0.000000, -0.500000, -0.500000, -0.500000)).yzw;
/*62*/	color0.xyz = (r0.xxxx * r0.yzwy + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*63*/	r0.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*64*/	color0.w = r0.w;
/*65*/	return;
}
