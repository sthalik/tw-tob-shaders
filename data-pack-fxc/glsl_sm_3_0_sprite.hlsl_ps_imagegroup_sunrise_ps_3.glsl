//
//
// Shader Model 4
// Fragment Shader
//
// id: 164 - fxc/glsl_SM_3_0_sprite.hlsl_PS_imagegroup_sunrise_ps_3.glsl
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
/*13*/	r1.x = r0.x + -1.000000;
/*14*/	r1.y = -abs(vsOut_T3.z) + abs(vsOut_T3.w);
/*15*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*16*/	r1.z = -abs(vsOut_T3.z) + cb1.data[0].y;
/*17*/	r1.y = saturate(r1.y * r1.z);
/*18*/	r1.z = r1.y * -2.000000 + 3.000000;
/*19*/	r1.y = r1.y * r1.y;
/*20*/	r1.w = r1.y * r1.z;
/*21*/	r1.y = -r1.z * r1.y + 1.000000;
/*22*/	r1.z = uintBitsToFloat((vsOut_T3.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*23*/	r1.y = (floatBitsToUint(r1.z) > 0x00000000u) ? r1.y : r1.w;
/*24*/	r1.y = r1.y * 1.570796;
/*25*/	r1.y = sin(r1.y);
/*26*/	r1.zw = (r1.yyyy * vec4(0.000000, 0.000000, 0.250000, 0.392699)).zw;
/*27*/	r2.x = sin(r1.w); r3.x = cos(r1.w);
/*28*/	r2.x = r2.x * 0.500000 + r1.x;
/*29*/	r2.y = r3.x * 0.500000 + -r0.y;
/*30*/	r0.zw = (r0.xxxy * vec4(0.000000, 0.000000, 1.000000, -1.000000) + vec4(0.000000, 0.000000, -1.000000, 0.000000)).zw;
/*31*/	r0.xy = (r0.xwxx + vec4(-1.000000, 0.000000, 0.000000, 0.000000)).xy;
/*32*/	r0.zw = (-r0.zzzw + r2.xxxy).zw;
/*33*/	r0.xy = (r1.zzzz * r0.zwzz + r0.xyxx).xy;
/*34*/	r0.z = max(abs(r0.x), abs(r0.y));
/*35*/	r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*36*/	r0.w = min(abs(r0.x), abs(r0.y));
/*37*/	r0.z = r0.z * r0.w;
/*38*/	r0.w = r0.z * r0.z;
/*39*/	r1.x = r0.w * 0.020835 + -0.085133;
/*40*/	r1.x = r0.w * r1.x + 0.180141;
/*41*/	r1.x = r0.w * r1.x + -0.330299;
/*42*/	r0.w = r0.w * r1.x + 0.999866;
/*43*/	r1.x = r0.w * r0.z;
/*44*/	r1.x = r1.x * -2.000000 + 1.570796;
/*45*/	r1.z = uintBitsToFloat((abs(r0.x) < abs(r0.y)) ? 0xffffffffu : 0x00000000u);
/*46*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.x));
/*47*/	r0.z = r0.z * r0.w + r1.x;
/*48*/	r0.w = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*49*/	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0xc0490fdbu));
/*50*/	r0.z = r0.w + r0.z;
/*51*/	r0.w = min(r0.x, r0.y);
/*52*/	r0.w = uintBitsToFloat((r0.w < -r0.w) ? 0xffffffffu : 0x00000000u);
/*53*/	r1.x = max(r0.x, r0.y);
/*54*/	r0.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*55*/	r0.x = sqrt(r0.x);
/*56*/	r0.y = uintBitsToFloat((r1.x >= -r1.x) ? 0xffffffffu : 0x00000000u);
/*57*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.w));
/*58*/	r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? -r0.z : r0.z;
/*59*/	r0.y = r1.y * 0.392699 + r0.y;
/*60*/	r0.y = r0.y + 3.141593;
/*61*/	r0.xz = (r0.xxyx * vec4(1.408451, 0.000000, 6.283185, 0.000000)).xz;
/*62*/	r0.z = uintBitsToFloat((r0.z >= -r0.z) ? 0xffffffffu : 0x00000000u);
/*63*/	r0.zw = (mix(vec4(0, 0, -6.283185, -0.159155), vec4(0, 0, 6.283185, 0.159155), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*64*/	r0.y = r0.w * r0.y;
/*65*/	r0.y = fract(r0.y);
/*66*/	r0.y = r0.y * r0.z;
/*67*/	r0.z = r0.y * 0.392699;
/*68*/	r0.z = uintBitsToFloat((r0.z >= -r0.z) ? 0xffffffffu : 0x00000000u);
/*69*/	r0.zw = (mix(vec4(0, 0, -0.392699, -2.546479), vec4(0, 0, 0.392699, 2.546479), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*70*/	r0.y = r0.w * r0.y;
/*71*/	r0.y = fract(r0.y);
/*72*/	r0.y = r0.y * r0.z;
/*73*/	r0.y = r0.y * 16.000000;
/*74*/	r0.y = sin(r0.y);
/*75*/	r0.z = r1.y * 0.062500 + 0.250000;
/*76*/	r0.z = uintBitsToFloat((r0.x < r0.z) ? 0xffffffffu : 0x00000000u);
/*77*/	r0.x = (floatBitsToUint(r0.z) > 0x00000000u) ? 0 : r0.x;
/*78*/	r0.y = r0.y * r0.x;
/*79*/	r0.x = r0.y * 0.500000 + r0.x;
/*80*/	r0.y = r0.x * 0.075000;
/*81*/	r0.y = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*82*/	r0.yz = (mix(vec4(0, -0.075000, -13.333333, 0), vec4(0, 0.075000, 13.333333, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).yz;
/*83*/	r0.z = r0.z * r0.x;
/*84*/	r0.z = fract(r0.z);
/*85*/	r0.x = -r0.y * r0.z + r0.x;
/*86*/	r0.y = -r0.x + 1.000000;
/*87*/	r0.x = r1.y * r0.y + r0.x;
/*88*/	r2.xyzw = (textureLod(s_diffuse_map, vsOut_T0.xyxx.st, vsOut_T0.y)).xyzw;
/*89*/	r0.y = saturate(r2.x);
/*90*/	r0.y = log2(r0.y);
/*91*/	r0.y = r0.y * cb0.data[0].z;
/*92*/	r3.w = exp2(r0.y);
/*93*/	r3.xyz = (vec4(1.000000, 1.000000, 1.000000, 0)).xyz;
/*94*/	r0.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.500000, 0.500000, 0.000000), cb1.data[0].zzwz)) * 0xffffffffu)).yzw;
/*95*/	r2.xz = (mix(r2.xxzx, r2.zzxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xz;
/*96*/	r2.xyzw = mix(r2.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*97*/	r2.xyzw = r2.xyzw * vsOut_C0.xyzw;
/*98*/	r0.yz = (uintBitsToFloat(uvec4(equal(vsOut_T0.xxyx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).yz;
/*99*/	r0.y = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r0.y));
/*100*/	r0.y = (floatBitsToUint(r0.w) > 0x00000000u) ? 0 : r0.y;
/*101*/	r2.xyzw = mix(r2.xyzw, vsOut_C0.xyzw, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*102*/	r0.x = r0.x * r2.w;
/*103*/	color0.w = r1.y * r0.x;
/*104*/	r0.xyz = saturate(r2.xyzx * vec4(3.000000, 3.000000, 3.000000, 0.000000)).xyz;
/*105*/	r0.xyz = (-r2.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000) + r0.xyzx).xyz;
/*106*/	r0.w = uintBitsToFloat((cb1.data[0].y >= -cb1.data[0].y) ? 0xffffffffu : 0x00000000u);
/*107*/	r0.w = (floatBitsToUint(r0.w) > 0x00000000u) ? 1.000000 : -1.000000;
/*108*/	r1.x = r0.w * cb1.data[0].y;
/*109*/	r1.x = fract(r1.x);
/*110*/	r0.w = r0.w * r1.x;
/*111*/	r0.w = r0.w * 3.141593;
/*112*/	r0.w = sin(r0.w);
/*113*/	r1.xyz = (r2.xyzx * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*114*/	r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*115*/	r0.w = uintBitsToFloat((0.500000 < vsOut_T5.z) ? 0xffffffffu : 0x00000000u);
/*116*/	r0.xyz = saturate(mix(r2.xyzx, r0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*117*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*118*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*119*/	color0.xyz = (exp2(r0.xyzx)).xyz;
/*120*/	return;
}
