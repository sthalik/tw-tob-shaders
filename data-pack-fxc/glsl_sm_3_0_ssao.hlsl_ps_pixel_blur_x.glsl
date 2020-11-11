//
//
// Shader Model 4
// Fragment Shader
//
// id: 1425 - fxc/glsl_SM_3_0_ssao.hlsl_PS_pixel_blur_x.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }


layout(location = 0) out vec4 color0;

uniform sampler2D resolve_target_sampler;
uniform sampler2D gbuffer_channel_4_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform ssao_blur_PS
{
  vec4 data[2];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.w = 1.000000;
/*1*/	r1.yw = (vec4(0, 0, 0, 0)).yw;
/*2*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(cb1.data[0].z)).x;
/*3*/	r3.xyz = (r2.xxxx * vec4(-2.000000, -4.000000, -3.000000, 0.000000)).xyz;
/*4*/	r1.xz = (r3.yyzy).xz;
/*5*/	r4.xy = (cb0.data[27].xyxx * vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*6*/	r4.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*7*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*8*/	r1.xyzw = r1.xyzw + r4.xyxy;
/*9*/	r5.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.zwzz.st, 0.000000)).xyzw;
/*10*/	r0.z = r5.x;
/*11*/	r0.xy = (r1.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*12*/	r4.z = dot(r0.xyzw, cb0.data[19].xyzw);
/*13*/	r0.x = dot(r0.xyzw, cb0.data[20].xyzw);
/*14*/	r0.x = r4.z / r0.x;
/*15*/	r5.w = 1.000000;
/*16*/	r6.xyzw = (textureLod(gbuffer_channel_4_sampler, r4.xyxx.st, 0.000000)).xyzw;
/*17*/	r5.z = r6.x;
/*18*/	r5.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*19*/	r0.y = dot(r5.xyzw, cb0.data[19].xyzw);
/*20*/	r0.z = dot(r5.xyzw, cb0.data[20].xyzw);
/*21*/	r0.y = r0.y / r0.z;
/*22*/	r0.x = -r0.y + r0.x;
/*23*/	r0.x = r0.x * r0.x;
/*24*/	r0.z = cb1.data[0].y * cb1.data[0].y;
/*25*/	r0.x = -r0.x * r0.z + -1.125000;
/*26*/	r0.x = r0.x * 1.442695;
/*27*/	r0.x = exp2(r0.x);
/*28*/	r5.xyzw = (textureLod(resolve_target_sampler, r1.zwzz.st, 0.000000)).xyzw;
/*29*/	r0.w = r0.x * r5.x;
/*30*/	r5.w = 1.000000;
/*31*/	r6.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*32*/	r5.z = r6.x;
/*33*/	r5.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*34*/	r1.xyzw = (textureLod(resolve_target_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*35*/	r1.y = dot(r5.xyzw, cb0.data[19].xyzw);
/*36*/	r1.z = dot(r5.xyzw, cb0.data[20].xyzw);
/*37*/	r1.y = r1.y / r1.z;
/*38*/	r1.y = -r0.y + r1.y;
/*39*/	r1.y = r1.y * r1.y;
/*40*/	r1.y = -r1.y * r0.z + -2.000000;
/*41*/	r1.y = r1.y * 1.442695;
/*42*/	r1.y = exp2(r1.y);
/*43*/	r0.w = r1.y * r1.x + r0.w;
/*44*/	r0.x = r0.x + r1.y;
/*45*/	r1.w = 1.000000;
/*46*/	r3.yw = (vec4(0, 0, 0, 0)).yw;
/*47*/	r3.xy = (r3.xyxx + r4.xyxx).xy;
/*48*/	r5.xyzw = (textureLod(gbuffer_channel_4_sampler, r3.xyxx.st, 0.000000)).xyzw;
/*49*/	r1.z = r5.x;
/*50*/	r1.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*51*/	r5.xyzw = (textureLod(resolve_target_sampler, r3.xyxx.st, 0.000000)).xyzw;
/*52*/	r3.x = dot(r1.xyzw, cb0.data[19].xyzw);
/*53*/	r1.x = dot(r1.xyzw, cb0.data[20].xyzw);
/*54*/	r1.x = r3.x / r1.x;
/*55*/	r1.x = -r0.y + r1.x;
/*56*/	r1.x = r1.x * r1.x;
/*57*/	r1.x = -r1.x * r0.z + -0.500000;
/*58*/	r1.x = r1.x * 1.442695;
/*59*/	r1.x = exp2(r1.x);
/*60*/	r0.w = r1.x * r5.x + r0.w;
/*61*/	r0.x = r0.x + r1.x;
/*62*/	r3.z = -r2.x;
/*63*/	r1.xy = (r3.zwzz + r4.xyxx).xy;
/*64*/	r3.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.xyxx.st, 0.000000)).yzxw;
/*65*/	r3.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*66*/	r1.xyzw = (textureLod(resolve_target_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*67*/	r3.w = 1.000000;
/*68*/	r1.y = dot(r3.xyzw, cb0.data[19].xyzw);
/*69*/	r1.z = dot(r3.xyzw, cb0.data[20].xyzw);
/*70*/	r1.y = r1.y / r1.z;
/*71*/	r1.y = -r0.y + r1.y;
/*72*/	r1.y = r1.y * r1.y;
/*73*/	r1.y = -r1.y * r0.z + -0.125000;
/*74*/	r1.y = r1.y * 1.442695;
/*75*/	r1.y = exp2(r1.y);
/*76*/	r0.w = r1.y * r1.x + r0.w;
/*77*/	r0.x = r0.x + r1.y;
/*78*/	r0.x = r0.x + 1.000000;
/*79*/	r1.xyzw = (textureLod(resolve_target_sampler, r4.xyxx.st, 0.000000)).xyzw;
/*80*/	r0.w = r0.w + r1.x;
/*81*/	r2.y = 0;
/*82*/	r1.xy = (r2.xyxx + r4.xyxx).xy;
/*83*/	r3.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.xyxx.st, 0.000000)).yzxw;
/*84*/	r3.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*85*/	r1.xyzw = (textureLod(resolve_target_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*86*/	r3.w = 1.000000;
/*87*/	r1.y = dot(r3.xyzw, cb0.data[19].xyzw);
/*88*/	r1.z = dot(r3.xyzw, cb0.data[20].xyzw);
/*89*/	r1.y = r1.y / r1.z;
/*90*/	r1.y = -r0.y + r1.y;
/*91*/	r1.y = r1.y * r1.y;
/*92*/	r1.y = -r1.y * r0.z + -0.125000;
/*93*/	r1.y = r1.y * 1.442695;
/*94*/	r1.y = exp2(r1.y);
/*95*/	r0.w = r1.y * r1.x + r0.w;
/*96*/	r0.x = r0.x + r1.y;
/*97*/	r2.zw = (r2.xxxx * vec4(0.000000, 0.000000, 2.000000, 3.000000)).zw;
/*98*/	r1.xy = (r2.xyxx * vec4(4.000000, 1.000000, 0.000000, 0.000000) + r4.xyxx).xy;
/*99*/	r2.xyzw = r2.zywy + r4.xyxy;
/*100*/	r3.xyzw = (textureLod(gbuffer_channel_4_sampler, r2.xyxx.st, 0.000000)).yzxw;
/*101*/	r3.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*102*/	r3.w = 1.000000;
/*103*/	r1.z = dot(r3.xyzw, cb0.data[19].xyzw);
/*104*/	r1.w = dot(r3.xyzw, cb0.data[20].xyzw);
/*105*/	r1.z = r1.z / r1.w;
/*106*/	r1.z = -r0.y + r1.z;
/*107*/	r1.z = r1.z * r1.z;
/*108*/	r1.z = -r1.z * r0.z + -0.500000;
/*109*/	r1.z = r1.z * 1.442695;
/*110*/	r1.z = exp2(r1.z);
/*111*/	r3.xyzw = (textureLod(resolve_target_sampler, r2.xyxx.st, 0.000000)).xyzw;
/*112*/	r0.w = r1.z * r3.x + r0.w;
/*113*/	r0.x = r0.x + r1.z;
/*114*/	r3.xyzw = (textureLod(gbuffer_channel_4_sampler, r2.zwzz.st, 0.000000)).yzxw;
/*115*/	r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*116*/	r2.xyzw = (textureLod(resolve_target_sampler, r2.zwzz.st, 0.000000)).xyzw;
/*117*/	r3.w = 1.000000;
/*118*/	r1.z = dot(r3.xyzw, cb0.data[19].xyzw);
/*119*/	r1.w = dot(r3.xyzw, cb0.data[20].xyzw);
/*120*/	r1.z = r1.z / r1.w;
/*121*/	r1.z = -r0.y + r1.z;
/*122*/	r1.z = r1.z * r1.z;
/*123*/	r1.z = -r1.z * r0.z + -1.125000;
/*124*/	r1.z = r1.z * 1.442695;
/*125*/	r1.z = exp2(r1.z);
/*126*/	r0.w = r1.z * r2.x + r0.w;
/*127*/	r0.x = r0.x + r1.z;
/*128*/	r2.xyzw = (textureLod(gbuffer_channel_4_sampler, r1.xyxx.st, 0.000000)).yzxw;
/*129*/	r2.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*130*/	r1.xyzw = (textureLod(resolve_target_sampler, r1.xyxx.st, 0.000000)).xyzw;
/*131*/	r2.w = 1.000000;
/*132*/	r1.y = dot(r2.xyzw, cb0.data[19].xyzw);
/*133*/	r1.z = dot(r2.xyzw, cb0.data[20].xyzw);
/*134*/	r1.y = r1.y / r1.z;
/*135*/	r0.y = -r0.y + r1.y;
/*136*/	r0.y = r0.y * r0.y;
/*137*/	r0.y = -r0.y * r0.z + -2.000000;
/*138*/	r0.y = r0.y * 1.442695;
/*139*/	r0.y = exp2(r0.y);
/*140*/	r0.z = r0.y * r1.x + r0.w;
/*141*/	r0.x = r0.y + r0.x;
/*142*/	color0.xyzw = r0.zzzz / r0.xxxx;
/*143*/	return;
}
