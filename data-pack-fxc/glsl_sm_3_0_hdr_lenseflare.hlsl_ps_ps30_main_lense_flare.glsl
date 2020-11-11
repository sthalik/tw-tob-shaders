//
//
// Shader Model 4
// Fragment Shader
//
// id: 314 - fxc/glsl_SM_3_0_hdr_lenseflare.hlsl_PS_ps30_main_lense_flare.glsl
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

uniform sampler2D input_sampler;

layout(std140) uniform lense_flare_PS
{
  vec4 data[1];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;

/*0*/	r0.xy = (vsOut_T0.xyxx + cb0.data[0].xyxx).xy;
/*1*/	r0.zw = (r0.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*2*/	r1.xyzw = (textureLod(input_sampler, r0.xyxx.st, r0.y)).xyzw;
/*3*/	r2.xyzw = r0.zwzw * vec4(3.600000, 3.600000, 3.000000, 3.000000);
/*4*/	r0.x = dot(vec2(r2.zwzz), vec2(r2.zwzz));
/*5*/	r0.y = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*6*/	r0.xy = (sqrt(r0.xyxx)).xy;
/*7*/	r0.xy = (r0.xyxx + r0.xyxx).xy;
/*8*/	r0.xy = (min(r0.xyxx, vec4(1.000000, 1.000000, 0.000000, 0.000000))).xy;
/*9*/	r0.xy = (-r0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*10*/	r2.xyzw = r0.zwzw * vec4(3.600000, 3.600000, 3.000000, 3.000000) + vec4(0.500000, 0.500000, 0.500000, 0.500000);
/*11*/	r3.xyzw = (textureLod(input_sampler, r2.zwzz.st, r2.w)).xyzw;
/*12*/	r2.xyzw = (textureLod(input_sampler, r2.xyxx.st, r2.y)).xyzw;
/*13*/	r2.xyz = (r0.yyyy * r2.xyzx).xyz;
/*14*/	r3.xyz = (r0.xxxx * r3.xyzx).xyz;
/*15*/	r0.x = dot(vec3(r3.xyzx), vec3(vec4(1.000000, 1.000000, 1.000000, 0.000000)));
/*16*/	r0.x = r0.x * 0.800000;
/*17*/	r0.x = log2(r0.x);
/*18*/	r0.x = saturate(r0.x * 0.693147);
/*19*/	r3.xyz = (r0.xxxx * r3.xyzx).xyz;
/*20*/	r3.xyz = (r3.xyzx * vec4(0.000000, 0.200000, 1.600000, 0.000000)).xyz;
/*21*/	r0.x = dot(vec3(r2.xyzx), vec3(vec4(1.000000, 1.000000, 1.000000, 0.000000)));
/*22*/	r0.x = r0.x * 0.800000;
/*23*/	r0.x = log2(r0.x);
/*24*/	r0.x = saturate(r0.x * 0.693147);
/*25*/	r2.xyz = (r0.xxxx * r2.xyzx).xyz;
/*26*/	r2.xyz = (r2.xyzx * vec4(1.000000, 0.100000, 5.000000, 0.000000) + r3.xyzx).xyz;
/*27*/	r3.xyzw = r0.zwzw * vec4(1.320000, 1.320000, 1.200000, 1.200000);
/*28*/	r0.x = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*29*/	r0.y = dot(vec2(r3.zwzz), vec2(r3.zwzz));
/*30*/	r0.xy = (sqrt(r0.xyxx)).xy;
/*31*/	r0.xy = (r0.xyxx + r0.xyxx).xy;
/*32*/	r0.xy = (min(r0.xyxx, vec4(1.000000, 1.000000, 0.000000, 0.000000))).xy;
/*33*/	r0.xy = (-r0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*34*/	r3.xyzw = r0.zwzw * vec4(1.320000, 1.320000, 1.200000, 1.200000) + vec4(0.500000, 0.500000, 0.500000, 0.500000);
/*35*/	r4.xyzw = (textureLod(input_sampler, r3.xyxx.st, r3.y)).xyzw;
/*36*/	r3.xyzw = (textureLod(input_sampler, r3.zwzz.st, r3.w)).xyzw;
/*37*/	r3.xyz = (r0.yyyy * r3.xyzx).xyz;
/*38*/	r4.xyz = (r0.xxxx * r4.xyzx).xyz;
/*39*/	r0.x = dot(vec3(r4.xyzx), vec3(vec4(1.000000, 1.000000, 1.000000, 0.000000)));
/*40*/	r0.x = r0.x * 0.800000;
/*41*/	r0.x = log2(r0.x);
/*42*/	r0.x = saturate(r0.x * 0.693147);
/*43*/	r4.xyz = (r0.xxxx * r4.xyzx).xyz;
/*44*/	r2.xyz = (r4.xyzx * vec4(0.000000, 0.000000, 4.000000, 0.000000) + r2.xyzx).xyz;
/*45*/	r0.x = dot(vec3(r3.xyzx), vec3(vec4(1.000000, 1.000000, 1.000000, 0.000000)));
/*46*/	r0.x = r0.x * 0.800000;
/*47*/	r0.x = log2(r0.x);
/*48*/	r0.x = saturate(r0.x * 0.693147);
/*49*/	r3.xyz = (r0.xxxx * r3.xyzx).xyz;
/*50*/	r2.xyz = (r3.xyzx * vec4(0.060000, 0.000000, 3.000000, 0.000000) + r2.xyzx).xyz;
/*51*/	r3.xyzw = r0.zwzw * vec4(-0.444000, -0.444000, -0.402000, -0.402000);
/*52*/	r0.x = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*53*/	r0.y = dot(vec2(r3.zwzz), vec2(r3.zwzz));
/*54*/	r0.xy = (sqrt(r0.xyxx)).xy;
/*55*/	r0.xy = (r0.xyxx + r0.xyxx).xy;
/*56*/	r0.xy = (min(r0.xyxx, vec4(1.000000, 1.000000, 0.000000, 0.000000))).xy;
/*57*/	r0.xy = (-r0.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*58*/	r3.xyzw = r0.zwzw * vec4(-0.444000, -0.444000, -0.402000, -0.402000) + vec4(0.500000, 0.500000, 0.500000, 0.500000);
/*59*/	r4.xyzw = (textureLod(input_sampler, r3.xyxx.st, r3.y)).xyzw;
/*60*/	r3.xyzw = (textureLod(input_sampler, r3.zwzz.st, r3.w)).xyzw;
/*61*/	r3.xyz = (r0.yyyy * r3.xyzx).xyz;
/*62*/	r4.xyz = (r0.xxxx * r4.xyzx).xyz;
/*63*/	r0.x = dot(vec3(r4.xyzx), vec3(vec4(1.000000, 1.000000, 1.000000, 0.000000)));
/*64*/	r0.x = r0.x * 0.800000;
/*65*/	r0.x = log2(r0.x);
/*66*/	r0.x = saturate(r0.x * 0.693147);
/*67*/	r4.xyz = (r0.xxxx * r4.xyzx).xyz;
/*68*/	r2.xyz = (r4.xyzx * vec4(1.000000, 0.100000, 0.100000, 0.000000) + r2.xyzx).xyz;
/*69*/	r0.x = dot(vec3(r3.xyzx), vec3(vec4(1.000000, 1.000000, 1.000000, 0.000000)));
/*70*/	r0.x = r0.x * 0.800000;
/*71*/	r0.x = log2(r0.x);
/*72*/	r0.x = saturate(r0.x * 0.693147);
/*73*/	r3.xyz = (r0.xxxx * r3.xyzx).xyz;
/*74*/	r2.xyz = (r3.xyzx * vec4(0.100000, 1.000000, 0.100000, 0.000000) + r2.xyzx).xyz;
/*75*/	r0.xy = (r0.zwzz * vec4(-0.360000, -0.360000, 0.000000, 0.000000)).xy;
/*76*/	r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, -0.360000, -0.360000) + vec4(0.000000, 0.000000, 0.500000, 0.500000)).zw;
/*77*/	r3.xyzw = (textureLod(input_sampler, r0.zwzz.st, r0.w)).xyzw;
/*78*/	r0.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*79*/	r0.x = sqrt(r0.x);
/*80*/	r0.x = r0.x + r0.x;
/*81*/	r0.x = min(r0.x, 1.000000);
/*82*/	r0.x = -r0.x + 1.000000;
/*83*/	r0.xyz = (r3.xyzx * r0.xxxx).xyz;
/*84*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(1.000000, 1.000000, 1.000000, 0.000000)));
/*85*/	r0.w = r0.w * 0.800000;
/*86*/	r0.w = log2(r0.w);
/*87*/	r0.w = saturate(r0.w * 0.693147);
/*88*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*89*/	r0.xyz = (r0.xyzx * vec4(0.000000, 0.000000, 2.000000, 0.000000) + r2.xyzx).xyz;
/*90*/	r0.xyz = (r0.xyzx * vec4(0.030000, 0.030000, 0.030000, 0.000000)).xyz;
/*91*/	color0.xyz = (r1.xyzx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*92*/	color0.w = 1.000000;
/*93*/	return;
}
