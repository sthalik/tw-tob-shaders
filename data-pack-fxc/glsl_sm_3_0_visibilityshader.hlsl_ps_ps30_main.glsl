//
//
// Shader Model 4
// Fragment Shader
//
// id: 3908 - fxc/glsl_SM_3_0_VisibilityShader.hlsl_PS_ps30_main.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C0;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;

/*0*/	r0.xy = (gl_FragCoord.xyxx / cb0.data[29].xyxx).xy;
/*1*/	r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*2*/	r0.z = 1.000000;
/*3*/	r1.x = dot(vec3(r0.xyzx), vec3(cb0.data[21].xywx));
/*4*/	r1.y = dot(vec3(r0.xyzx), vec3(cb0.data[22].xywx));
/*5*/	r1.z = dot(vec3(r0.xyzx), vec3(cb0.data[23].xywx));
/*6*/	r0.x = dot(vec3(r0.xyzx), vec3(cb0.data[24].xywx));
/*7*/	r0.xyz = (r1.xyzx / r0.xxxx).xyz;
/*8*/	r0.xyz = (r0.xyzx + -cb0.data[0].xyzx).xyz;
/*9*/	r0.w = dot(vec3(vsOut_T0.xyzx), vec3(r0.xyzx));
/*10*/	r1.x = uintBitsToFloat((0.000000 < abs(r0.w)) ? 0xffffffffu : 0x00000000u);
/*11*/	r1.y = dot(vec3(vsOut_T0.xyzx), vec3(cb0.data[0].xyzx));
/*12*/	r1.y = r1.y + vsOut_T0.w;
/*13*/	r1.yzw = (r1.yyyy * vsOut_T0.xxyz).yzw;
/*14*/	r1.y = dot(vec3(vsOut_T0.xyzx), vec3(r1.yzwy));
/*15*/	r0.w = r1.y / r0.w;
/*16*/	r1.z = uintBitsToFloat((-r0.w >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*17*/	r0.xyz = (-r0.wwww * r0.xyzx).xyz;
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.z) & floatBitsToUint(r1.x));
/*19*/	r1.x = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*20*/	r2.xyzw = gl_FragCoord.xyxy + vec4(1.000000, 0.000000, 0.000000, 1.000000);
/*21*/	r2.xyzw = r2.xyzw / cb0.data[29].xyxy;
/*22*/	r2.xyzw = r2.zwxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(-1.000000, -1.000000, -1.000000, -1.000000);
/*23*/	r3.xy = (r2.zwzz).xy;
/*24*/	r3.z = 1.000000;
/*25*/	r4.x = dot(vec3(r3.xyzx), vec3(cb0.data[21].xywx));
/*26*/	r4.y = dot(vec3(r3.xyzx), vec3(cb0.data[22].xywx));
/*27*/	r4.z = dot(vec3(r3.xyzx), vec3(cb0.data[23].xywx));
/*28*/	r1.z = dot(vec3(r3.xyzx), vec3(cb0.data[24].xywx));
/*29*/	r3.xyz = (r4.xyzx / r1.zzzz).xyz;
/*30*/	r3.xyz = (r3.xyzx + -cb0.data[0].xyzx).xyz;
/*31*/	r1.z = dot(vec3(vsOut_T0.xyzx), vec3(r3.xyzx));
/*32*/	r1.w = uintBitsToFloat((0.000000 < abs(r1.z)) ? 0xffffffffu : 0x00000000u);
/*33*/	r1.z = r1.y / r1.z;
/*34*/	r2.w = uintBitsToFloat((-r1.z >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*35*/	r3.xyz = (-r1.zzzz * r3.xyzx).xyz;
/*36*/	r1.z = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r2.w));
/*37*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*38*/	r1.x = r1.w * r1.x;
/*39*/	r2.z = 1.000000;
/*40*/	r4.x = dot(vec3(r2.xyzx), vec3(cb0.data[21].xywx));
/*41*/	r4.y = dot(vec3(r2.xyzx), vec3(cb0.data[22].xywx));
/*42*/	r4.z = dot(vec3(r2.xyzx), vec3(cb0.data[23].xywx));
/*43*/	r1.w = dot(vec3(r2.xyzx), vec3(cb0.data[24].xywx));
/*44*/	r2.xyz = (r4.xyzx / r1.wwww).xyz;
/*45*/	r2.xyz = (r2.xyzx + -cb0.data[0].xyzx).xyz;
/*46*/	r1.w = dot(vec3(vsOut_T0.xyzx), vec3(r2.xyzx));
/*47*/	r2.w = uintBitsToFloat((0.000000 < abs(r1.w)) ? 0xffffffffu : 0x00000000u);
/*48*/	r1.w = r1.y / r1.w;
/*49*/	r3.w = uintBitsToFloat((-r1.w >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*50*/	r2.xyz = (-r1.wwww * r2.xyzx).xyz;
/*51*/	r1.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r3.w));
/*52*/	r2.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*53*/	r1.x = r1.x * r2.w;
/*54*/	r4.xy = (gl_FragCoord.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*55*/	r4.xy = (r4.xyxx / cb0.data[29].xyxx).xy;
/*56*/	r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*57*/	r4.z = 1.000000;
/*58*/	r5.x = dot(vec3(r4.xyzx), vec3(cb0.data[21].xywx));
/*59*/	r5.y = dot(vec3(r4.xyzx), vec3(cb0.data[22].xywx));
/*60*/	r5.z = dot(vec3(r4.xyzx), vec3(cb0.data[23].xywx));
/*61*/	r2.w = dot(vec3(r4.xyzx), vec3(cb0.data[24].xywx));
/*62*/	r4.xyz = (r5.xyzx / r2.wwww).xyz;
/*63*/	r4.xyz = (r4.xyzx + -cb0.data[0].xyzx).xyz;
/*64*/	r2.w = dot(vec3(vsOut_T0.xyzx), vec3(r4.xyzx));
/*65*/	r1.y = r1.y / r2.w;
/*66*/	r2.w = uintBitsToFloat((0.000000 < abs(r2.w)) ? 0xffffffffu : 0x00000000u);
/*67*/	r3.w = uintBitsToFloat((-r1.y >= 0.000000) ? 0xffffffffu : 0x00000000u);
/*68*/	r4.xyz = (-r1.yyyy * r4.xyzx).xyz;
/*69*/	r1.y = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r3.w));
/*70*/	r2.w = uintBitsToFloat(floatBitsToUint(r1.y) & uint(0x3f800000u));
/*71*/	r1.x = r1.x * r2.w + -0.500000;
/*72*/	r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*73*/	if(r1.x != 0) discard;
/*74*/	color0.xyzw = vsOut_C0.xyzw;
/*75*/	r1.x = dot(vec3(cb0.data[3].xyzx), vec3(cb0.data[3].xyzx));
/*76*/	r1.x = inversesqrt(r1.x);
/*77*/	r5.xyz = (r1.xxxx * cb0.data[3].xyzx).xyz;
/*78*/	r0.x = dot(vec3(r0.xyzx), vec3(r5.xyzx));
/*79*/	r0.x = max(r0.x, 0.000000);
/*80*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.w));
/*81*/	r0.y = dot(vec3(r3.xyzx), vec3(r5.xyzx));
/*82*/	r0.y = max(r0.y, r0.x);
/*83*/	r0.x = (floatBitsToUint(r1.z) > 0x00000000u) ? r0.y : r0.x;
/*84*/	r0.y = dot(vec3(r2.xyzx), vec3(r5.xyzx));
/*85*/	r0.z = dot(vec3(r4.xyzx), vec3(r5.xyzx));
/*86*/	r0.y = max(r0.y, r0.x);
/*87*/	r0.x = (floatBitsToUint(r1.w) > 0x00000000u) ? r0.y : r0.x;
/*88*/	r0.y = max(r0.z, r0.x);
/*89*/	r0.x = (floatBitsToUint(r1.y) > 0x00000000u) ? r0.y : r0.x;
/*90*/	r0.x = r0.x / cb0.data[25].y;
/*91*/	color1.x = r0.x;
/*92*/	gl_FragDepth = (r0.x);
/*93*/	color1.yzw = (vec4(0, 0, 0, 0)).yzw;
/*94*/	return;
}
