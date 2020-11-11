//
//
// Shader Model 4
// Fragment Shader
//
// id: 168 - fxc/glsl_SM_3_0_sprite.hlsl_PS_imagegroup_circular_fan_ps_3.glsl
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

/*0*/	r0.xy = (-vsOut_T4.xwxx + vsOut_T5.xyxx).xy;
/*1*/	r0.zw = (vsOut_T4.zzzy + -vsOut_T5.xxxy).zw;
/*2*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(r0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.zwzz) | floatBitsToUint(r0.xyxx))).xy;
/*4*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*5*/	if(r0.x != 0) discard;
/*6*/	r0.xy = trunc((vsOut_T3.xyxx).xy);
/*7*/	r0.xy = (r0.xyxx * vec4(0.000200, 0.000200, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*8*/	r1.xy = (fract(vsOut_T3.xyxx)).xy;
/*9*/	r0.zw = (r1.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*10*/	r0.yw = (-r0.xxxz + r0.yyyw).yw;
/*11*/	r0.xz = (-r0.xxzx + vsOut_T5.xxyx).xz;
/*12*/	r0.xy = (r0.xzxx / r0.ywyy).xy;
/*13*/	r0.y = -r0.y + 0.500000;
/*14*/	r0.x = r0.x + -0.500000;
/*15*/	r0.z = max(abs(r0.x), abs(r0.y));
/*16*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*17*/	r0.w = min(abs(r0.x), abs(r0.y));
/*18*/	r0.z = r0.z * r0.w;
/*19*/	r0.w = r0.z * r0.z;
/*20*/	r1.x = r0.w * 0.020835 + -0.085133;
/*21*/	r1.x = r0.w * r1.x + 0.180141;
/*22*/	r1.x = r0.w * r1.x + -0.330299;
/*23*/	r0.w = r0.w * r1.x + 0.999866;
/*24*/	r1.x = r0.w * r0.z;
/*25*/	r1.x = r1.x * -2.000000 + 1.570796;
/*26*/	r1.y = uintBitsToFloat((abs(r0.x) < abs(r0.y)) ? 0xffffffffu : 0x00000000u);
/*27*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r1.x));
/*28*/	r0.z = r0.z * r0.w + r1.x;
/*29*/	r0.w = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*30*/	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0xc0490fdbu));
/*31*/	r0.z = r0.w + r0.z;
/*32*/	r0.w = min(r0.x, r0.y);
/*33*/	r0.w = uintBitsToFloat((r0.w < -r0.w) ? 0xffffffffu : 0x00000000u);
/*34*/	r1.x = max(r0.x, r0.y);
/*35*/	r0.y = r0.y * r0.y;
/*36*/	r0.x = r0.x * r0.x + r0.y;
/*37*/	r0.x = sqrt(r0.x);
/*38*/	r0.y = uintBitsToFloat((r1.x >= -r1.x) ? 0xffffffffu : 0x00000000u);
/*39*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.w));
/*40*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? -r0.z : r0.z;
/*41*/	r0.y = r0.y + 3.141593;
/*42*/	r0.z = -abs(vsOut_T3.z) + abs(vsOut_T3.w);
/*43*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*44*/	r0.w = -abs(vsOut_T3.z) + cb1.data[0].y;
/*45*/	r0.z = saturate(r0.z * r0.w);
/*46*/	r0.w = r0.z * -2.000000 + 3.000000;
/*47*/	r0.z = r0.z * r0.z;
/*48*/	r1.x = r0.z * r0.w;
/*49*/	r0.z = -r0.w * r0.z + 1.000000;
/*50*/	r0.w = uintBitsToFloat((vsOut_T3.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*51*/	r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.z : r1.x;
/*52*/	r0.y = r0.z * 0.392699 + r0.y;
/*53*/	r0.w = r0.y * 6.283185;
/*54*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*55*/	r1.xy = (mix(vec4(-6.283185, -0.159155, 0, 0), vec4(6.283185, 0.159155, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*56*/	r0.y = r0.y * r1.y;
/*57*/	r0.y = fract(r0.y);
/*58*/	r0.y = r0.y * r1.x;
/*59*/	r0.w = r0.y * 0.392699;
/*60*/	r0.w = uintBitsToFloat((r0.w >= -r0.w) ? 0xffffffffu : 0x00000000u);
/*61*/	r1.xy = (mix(vec4(-0.392699, -2.546479, 0, 0), vec4(0.392699, 2.546479, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*62*/	r0.y = r0.y * r1.y;
/*63*/	r0.y = fract(r0.y);
/*64*/	r0.y = r0.y * r1.x;
/*65*/	r0.y = r0.y * 16.000000;
/*66*/	r0.y = sin(r0.y);
/*67*/	r0.y = r0.y * r0.x;
/*68*/	r0.y = r0.y * 0.704225;
/*69*/	r0.x = r0.x * 1.408451 + r0.y;
/*70*/	r0.y = r0.x * 0.005000;
/*71*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*72*/	r0.yw = (mix(vec4(0, -0.005000, 0, -200.000000), vec4(0, 0.005000, 0, 200.000000), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).yw;
/*73*/	r0.w = r0.w * r0.x;
/*74*/	r0.w = fract(r0.w);
/*75*/	r0.x = -r0.y * r0.w + r0.x;
/*76*/	r0.y = -r0.x + 1.000000;
/*77*/	r0.x = r0.z * r0.y + r0.x;
/*78*/	r1.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).wxyz;
/*79*/	r0.y = saturate(r1.y);
/*80*/	r0.y = log2(r0.y);
/*81*/	r0.y = r0.y * cb0.data[0].z;
/*82*/	r2.x = exp2(r0.y);
/*83*/	r2.yzw = (vec4(0, 1.000000, 1.000000, 1.000000)).yzw;
/*84*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.500000, 0.500000, 0.000000, 0.000000), cb1.data[0].zwzz)) * 0xffffffffu)).xyz;
/*85*/	r1.yw = (mix(r1.yyyw, r1.wwwy, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).yw;
/*86*/	r1.xyzw = mix(r1.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)));
/*87*/	r1.xyzw = r1.xyzw * vsOut_C0.wxyz;
/*88*/	r0.yw = (uintBitsToFloat(uvec4(equal(vsOut_T0.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).yw;
/*89*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.y));
/*90*/	r0.y = (floatBitsToUint(r3.z) > 0x00000000u) ? 0 : r0.y;
/*91*/	r1.xyzw = mix(r1.xyzw, vsOut_C0.wxyz, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*92*/	r0.x = r0.x * r1.x;
/*93*/	r2.xyzw = r1.xyzw * vec4(0.250000, 0.250000, 0.250000, 0.250000);
/*94*/	r0.x = r0.x * 0.750000 + r2.x;
/*95*/	color0.w = r0.z * r0.x;
/*96*/	r0.xyz = saturate(r1.yzwy * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*97*/	r0.xyz = (-r1.yzwy * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r0.xyzx).xyz;
/*98*/	r0.w = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*99*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*100*/	r1.x = r0.w * cb1.data[0].y;
/*101*/	r1.x = fract(r1.x);
/*102*/	r0.w = r0.w * r1.x;
/*103*/	r0.w = r0.w * 3.141593;
/*104*/	r0.w = sin(r0.w);
/*105*/	r0.xyz = (r0.wwww * r0.xyzx + r2.yzwy).xyz;
/*106*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T5.z) ? 0xffffffffu : 0x00000000u);
/*107*/	r0.xyz = saturate(mix(r1.yzwy, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*108*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*109*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*110*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*111*/	return;
}
