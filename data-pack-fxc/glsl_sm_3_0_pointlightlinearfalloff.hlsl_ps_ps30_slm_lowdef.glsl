//
//
// Shader Model 4
// Fragment Shader
//
// id: 404 - fxc/glsl_SM_3_0_PointLightLinearFalloff.hlsl_PS_ps30_slm_lowdef.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_P1;
in vec4 vsOut_P2;

layout(location = 0) out vec4 color0;

uniform sampler2D gbuffer_channel_1_sampler;
uniform sampler2D gbuffer_channel_2_sampler;
uniform sampler2D gbuffer_channel_3_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform sampler2D s_ssao;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform point_light_PS
{
  vec4 data[1];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*2*/	r1.xyzw = (textureLod(gbuffer_channel_1_sampler, r0.zwzz.st, r0.w)).xyzw;
/*3*/	r2.xyzw = (textureLod(gbuffer_channel_2_sampler, r0.zwzz.st, r0.w)).xyzw;
/*4*/	r3.xyzw = (textureLod(gbuffer_channel_3_sampler, r0.zwzz.st, r0.w)).xyzw;
/*5*/	r4.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, r0.w)).yzxw;
/*6*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*7*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*8*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*9*/	r3.w = inversesqrt(r3.w);
/*10*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*11*/	r5.xyzw = (texture(s_ssao, r0.zwzz.st)).xyzw;
/*12*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz + -cb2.data[0].xyxx).xy;
/*13*/	r0.xy = (r0.xyxx / cb2.data[0].zwzz).xy;
/*14*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*15*/	r4.w = 1.000000;
/*16*/	r0.x = dot(r4.xyzw, cb0.data[21].xyzw);
/*17*/	r0.y = dot(r4.xyzw, cb0.data[22].xyzw);
/*18*/	r0.z = dot(r4.xyzw, cb0.data[23].xyzw);
/*19*/	r0.w = dot(r4.xyzw, cb0.data[24].xyzw);
/*20*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*21*/	r4.xyz = (r0.xyzx + -vsOut_P2.xyzx).xyz;
/*22*/	r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*23*/	r3.w = inversesqrt(r0.w);
/*24*/	r4.xyz = (r3.wwww * r4.xyzx).xyz;
/*25*/	r0.w = sqrt(r0.w);
/*26*/	r0.w = saturate(r0.w / vsOut_P2.w);
/*27*/	r0.w = -r0.w + 1.000000;
/*28*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*29*/	r5.yz = (mix(vec4(0, 1.000000, 273.000000, 0), vec4(0, 0.004000, 1.000000, 0), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)))).yz;
/*30*/	r4.w = dot(vec3(r1.xyzx), vec3(-r4.xyzx));
/*31*/	r5.w = max(r4.w, 0.000000);
/*32*/	r4.w = uintBitsToFloat((0.000000 < r4.w) ? 0xffffffffu : 0x00000000u);
/*33*/	if(floatBitsToUint(r4.w) != 0u) {
/*34*/	  r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*35*/	  r4.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*36*/	  r4.w = inversesqrt(r4.w);
/*37*/	  r0.xyz = (r0.xyzx * r4.wwww).xyz;
/*38*/	  r4.w = -r1.w + 1.000000;
/*39*/	  r6.x = dot(vec3(r0.xyzx), vec3(r1.xyzx));
/*40*/	  r6.x = r6.x + r6.x;
/*41*/	  r1.xyz = (r1.xyzx * -r6.xxxx + r0.xyzx).xyz;
/*42*/	  r1.x = dot(vec3(-r4.xyzx), vec3(r1.xyzx));
/*43*/	  r1.x = max(r1.x, -1.000000);
/*44*/	  r1.x = min(r1.x, 1.000000);
/*45*/	  r1.y = -abs(r1.x) + 1.000000;
/*46*/	  r1.y = sqrt(r1.y);
/*47*/	  r1.z = abs(r1.x) * -0.018729 + 0.074261;
/*48*/	  r1.z = r1.z * abs(r1.x) + -0.212114;
/*49*/	  r1.z = r1.z * abs(r1.x) + 1.570729;
/*50*/	  r6.x = r1.y * r1.z;
/*51*/	  r6.x = r6.x * -2.000000 + 3.141593;
/*52*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*53*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r6.x));
/*54*/	  r1.x = r1.z * r1.y + r1.x;
/*55*/	  r1.y = r1.w * r1.w;
/*56*/	    r1.z = (floatBitsToUint(r3.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*57*/	  r1.y = r1.y * r1.z + r5.y;
/*58*/	  r1.y = r1.y * 0.500000 + 0.500000;
/*59*/	  r1.y = r1.y * 2.000000 + -1.000000;
/*60*/	  r1.z = -r1.y * r1.y + 1.000000;
/*61*/	  r1.z = max(r1.z, 0.001000);
/*62*/	  r1.z = log2(r1.z);
/*63*/	  r1.w = r1.z * 4.950617;
/*64*/	  r1.z = r1.z * 0.346574 + 4.546885;
/*65*/	  r3.w = uintBitsToFloat((0.000000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*66*/	  r1.y = uintBitsToFloat((r1.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*67*/	  r1.y = intBitsToFloat(1 + ~floatBitsToInt(r3.w) + floatBitsToInt(r1.y));
/*68*/	  r1.y = floatBitsToInt(r1.y);
/*69*/	  r1.w = r1.z * r1.z + -r1.w;
/*70*/	  r1.w = sqrt(r1.w);
/*71*/	  r1.z = -r1.z + r1.w;
/*72*/	  r1.z = max(r1.z, 0.000000);
/*73*/	  r1.z = sqrt(r1.z);
/*74*/	  r1.y = r1.z * r1.y;
/*75*/	  r1.y = r1.y * 1.414214;
/*76*/	  r1.y = 0.008727 / r1.y;
/*77*/	  r1.y = max(r1.y, 0.000100);
/*78*/	  r1.xz = (r1.xxxx + vec4(-0.008727, 0.000000, 0.008727, 0.000000)).xz;
/*79*/	  r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*80*/	  r1.xy = (r1.yyyy * r1.xzxx).xy;
/*81*/	  r1.zw = (r1.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*82*/	  r1.zw = (r1.zzzw * r1.zzzw).zw;
/*83*/	  r6.xyzw = r1.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*84*/	  r6.xy = (r6.xzxx / r6.ywyy).xy;
/*85*/	  r1.zw = (-r1.zzzw * r6.xxxy).zw;
/*86*/	  r6.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xyxx)) * 0xffffffffu)).xy;
/*87*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*88*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r6.x) + floatBitsToInt(r1.x));
/*89*/	  r1.x = floatBitsToInt(r1.x);
/*90*/	  r1.yz = (r1.zzwz * vec4(0.000000, 1.442695, 1.442695, 0.000000)).yz;
/*91*/	  r1.yz = (exp2(r1.yyzy)).yz;
/*92*/	  r1.yz = (-r1.yyzy + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*93*/	  r1.yz = (sqrt(r1.yyzy)).yz;
/*94*/	  r1.x = r1.x * r1.y + 1.000000;
/*95*/	  r1.x = r1.x * 0.500000;
/*96*/	  r1.y = 1 + ~floatBitsToInt(r6.y);
/*97*/	  r1.y = r1.y * r1.z + 1.000000;
/*98*/	  r1.x = r1.y * 0.500000 + -r1.x;
/*99*/	  r1.y = min(r5.w, 1.000000);
/*100*/	  r1.zw = (r4.wwww * vec4(0.000000, 0.000000, 1.570796, 1.539380)).zw;
/*101*/	  r1.z = sin(r1.z);
/*102*/	  r1.y = r1.y + -1.000000;
/*103*/	  r1.y = r1.z * r1.y + 1.000000;
/*104*/	  r0.x = dot(vec3(-r4.xyzx), vec3(r0.xyzx));
/*105*/	  r0.x = max(r0.x, 0.000000);
/*106*/	  r0.x = log2(r0.x);
/*107*/	  r0.x = r0.x * 10.000000;
/*108*/	  r0.x = exp2(r0.x);
/*109*/	    r0.y = cos((r1.w));
/*110*/	  r0.y = inversesqrt(r0.y);
/*111*/	  r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*112*/	  r0.z = saturate(r2.w * 60.000000);
/*113*/	  r0.x = r0.y * r0.x;
/*114*/	  r0.y = -r2.w + r0.z;
/*115*/	  r0.x = r0.x * r0.y + r2.w;
/*116*/	  r0.y = r1.y * abs(r1.x);
/*117*/	  r0.xyz = (r0.xxxx * r0.yyyy).xyz;
/*118*/	} else {
/*119*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*120*/	}
/*121*/	r1.xyz = saturate(r5.zzzz * r0.xyzx).xyz;
/*122*/	r1.xyz = (r3.xyzx * r1.xyzx).xyz;
/*123*/	r0.xyz = (max(r2.wwww, r0.xyzx)).xyz;
/*124*/	r0.xyz = (-r0.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*125*/	r2.xyz = (r2.xyzx * r5.wwww).xyz;
/*126*/	r2.xyz = (r2.xyzx * vsOut_P1.xyzx).xyz;
/*127*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*128*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*129*/	r0.xyz = (r1.xyzx * vsOut_P1.xyzx + r0.xyzx).xyz;
/*130*/	r0.xyz = (r0.xyzx * r0.wwww).xyz;
/*131*/	r0.w = 1.000000;
/*132*/	color0.xyzw = saturate(r0.xyzw * r5.xxxx);
/*133*/	return;
}
