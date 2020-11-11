//
//
// Shader Model 4
// Fragment Shader
//
// id: 3854 - fxc/glsl_SM_4_0_MLAA_PS_4_0.hlsl_PS_MLAA_ComputeLineLength_PS.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out uint color0;
layout(location = 1) out uint color1;

uniform usampler2D g_txMask_10;
uniform usampler2D g_txHorzCount_10;
uniform usampler2D g_txVertCount_10;

layout(std140) uniform cbData
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r14;
  vec4 r15;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (intBitsToFloat(ivec4(gl_FragCoord.xyxx))).xy;
/*1*/	r0.zw = (vec4(0, 0, 0, 0)).zw;
/*2*/	r1.xyzw = uintBitsToFloat(texelFetch(g_txMask_10, floatBitsToInt(r0.xyww).st, floatBitsToInt(r0.xyww).a).xyzw);
/*3*/	r2.xyzw = uintBitsToFloat(texelFetch(g_txHorzCount_10, floatBitsToInt(r0.xyww).st, floatBitsToInt(r0.xyww).a).xyzw);
/*4*/	r3.xyzw = uintBitsToFloat(texelFetch(g_txVertCount_10, floatBitsToInt(r0.xyww).st, floatBitsToInt(r0.xyww).a).xyzw);
/*5*/	r4.x = uintBitsToFloat(floatBitsToUint(r2.x) >> uint(4));
/*6*/	r1.y = uintBitsToFloat(floatBitsToUint(r2.x) & uint(15));
/*7*/	r4.z = uintBitsToFloat(floatBitsToUint(r3.x) >> uint(4));
/*8*/	r1.zw = (uintBitsToFloat(floatBitsToUint(r4.xxxz) & uvec4(ivec4(0, 0, 15, 15)))).zw;
/*9*/	r2.y = uintBitsToFloat(floatBitsToUint(r3.x) & uint(15));
/*10*/	r5.xyzw = uintBitsToFloat(floatBitsToUint(r1.xxxx) & uvec4(ivec4(1, 1, 2, 2)));
/*11*/	r5.xyzw = uintBitsToFloat(uvec4(notEqual(floatBitsToInt(r5.xyzw), ivec4(vec4(0, 0, 0, 0)))) * 0xffffffffu) /**/;
/*12*/	r4.y = r2.x;
/*13*/	r4.w = r3.x;
/*14*/	r3.xyzw = uintBitsToFloat(floatBitsToUint(r4.xyzw) & uvec4(ivec4(8, 8, 8, 8)));
/*15*/	r3.xyzw = uintBitsToFloat(uvec4(equal(floatBitsToInt(r3.xyzw), ivec4(vec4(0, 0, 0, 0)))) * 0xffffffffu) /**/;
/*16*/	r3.xyzw = uintBitsToFloat(floatBitsToUint(r3.xyzw) & floatBitsToUint(r5.xyzw));
/*17*/	r2.xz = (uintBitsToFloat(floatBitsToUint(r3.zzwz) | floatBitsToUint(r3.xxyx))).xz;
/*18*/	r1.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.x));
/*19*/	r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & uint(1));
/*20*/	if(floatBitsToUint(r1.x) != 0u) {
/*21*/	  r2.xz = (cb1.data[27].xxyx + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*22*/	  r2.xz = floor((r2.xxzx).xz);
/*23*/	  r2.xz = (uintBitsToFloat(uvec4(r2.xxzx))).xz;
/*24*/	  r1.x = floor(cb0.data[0].y);
/*25*/	  r1.x = uintBitsToFloat(uint(r1.x));
/*26*/	  r2.w = uintBitsToFloat(max(floatBitsToUint(r1.x), uint(1))) /**/;
/*27*/	  r2.w = intBitsToFloat(floatBitsToInt(r2.w) << int(1));
/*28*/	  r4.x = intBitsToFloat(int(1) << floatBitsToInt(r1.x));
/*29*/	  r5.xyzw = intBitsToFloat((floatBitsToInt(r2.wwww)) * (ivec4(ivec4(0, 1, 0, -1))) + ivec4(ivec4(0, -2, 0, 2)));
/*30*/	  r6.xy = (intBitsToFloat(ivec4(ivec4(0, -1, 0, 0)) << floatBitsToInt(r1.x))).xy;
/*31*/	  r6.zw = (vec4(0, 0, 0, 0)).zw;
/*32*/	  r7.xy = (intBitsToFloat(ivec4(ivec4(0, 1, 0, 0)) << floatBitsToInt(r1.x))).xy;
/*33*/	  r7.zw = (vec4(0, 0, 0, 0)).zw;
/*34*/	  r8.xyzw = intBitsToFloat(floatBitsToInt(r0.xyxy) + floatBitsToInt(r5.wzyx));
/*35*/	  r8.xyzw = intBitsToFloat(max(floatBitsToInt(r8.xyzw), ivec4(vec4(0, 0, 0, 0)))) /**/;
/*36*/	  r8.xyzw = intBitsToFloat(min(floatBitsToInt(r2.xzxz), floatBitsToInt(r8.zwxy))) /**/;
/*37*/	  r9.xy = (r8.zwzz).xy;
/*38*/	  r9.zw = (vec4(0, 0, 0, 0)).zw;
/*39*/	  r9.xyzw = uintBitsToFloat(texelFetch(g_txHorzCount_10, floatBitsToInt(r9.xyzw).st, floatBitsToInt(r9.xyzw).a).xyzw);
/*40*/	  r9.x = uintBitsToFloat(floatBitsToUint(r9.x) >> uint(4));
/*41*/	  r8.zw = (vec4(0, 0, 0, 0)).zw;
/*42*/	  r8.xyzw = uintBitsToFloat(texelFetch(g_txHorzCount_10, floatBitsToInt(r8.xyzw).st, floatBitsToInt(r8.xyzw).a).xyzw);
/*43*/	  r5.xyzw = intBitsToFloat(floatBitsToInt(r0.xyxy) + floatBitsToInt(r5.xyzw));
/*44*/	  r5.xyzw = intBitsToFloat(max(floatBitsToInt(r5.xyzw), ivec4(vec4(0, 0, 0, 0)))) /**/;
/*45*/	  r5.xyzw = intBitsToFloat(min(floatBitsToInt(r2.xzxz), floatBitsToInt(r5.zwxy))) /**/;
/*46*/	  r10.xy = (r5.zwzz).xy;
/*47*/	  r10.zw = (vec4(0, 0, 0, 0)).zw;
/*48*/	  r10.xyzw = uintBitsToFloat(texelFetch(g_txVertCount_10, floatBitsToInt(r10.xyzw).st, floatBitsToInt(r10.xyzw).a).xyzw);
/*49*/	  r9.z = uintBitsToFloat(floatBitsToUint(r10.x) >> uint(4));
/*50*/	  r5.zw = (vec4(0, 0, 0, 0)).zw;
/*51*/	  r5.xyzw = uintBitsToFloat(texelFetch(g_txVertCount_10, floatBitsToInt(r5.xyzw).st, floatBitsToInt(r5.xyzw).a).xyzw);
/*52*/	  r10.xyzw = intBitsToFloat(floatBitsToInt(r0.xyxy) + floatBitsToInt(r6.yxxy));
/*53*/	  r11.xyzw = intBitsToFloat(max(floatBitsToInt(r10.xyzw), ivec4(vec4(0, 0, 0, 0)))) /**/;
/*54*/	  r11.xyzw = intBitsToFloat(min(floatBitsToInt(r2.xzxz), floatBitsToInt(r11.zwxy))) /**/;
/*55*/	  r12.xy = (r11.zwzz).xy;
/*56*/	  r12.zw = (vec4(0, 0, 0, 0)).zw;
/*57*/	  r12.xyzw = uintBitsToFloat(texelFetch(g_txMask_10, floatBitsToInt(r12.xyzw).st, floatBitsToInt(r12.xyzw).a).xyzw);
/*58*/	  r13.xyzw = intBitsToFloat(floatBitsToInt(r0.xyxy) + floatBitsToInt(r7.yxxy));
/*59*/	  r14.xyzw = intBitsToFloat(max(floatBitsToInt(r13.xyzw), ivec4(vec4(0, 0, 0, 0)))) /**/;
/*60*/	  r14.xyzw = intBitsToFloat(min(floatBitsToInt(r2.xzxz), floatBitsToInt(r14.zwxy))) /**/;
/*61*/	  r15.xy = (r14.zwzz).xy;
/*62*/	  r15.zw = (vec4(0, 0, 0, 0)).zw;
/*63*/	  r15.xyzw = uintBitsToFloat(texelFetch(g_txMask_10, floatBitsToInt(r15.xyzw).st, floatBitsToInt(r15.xyzw).a).xyzw);
/*64*/	  r14.zw = (vec4(0, 0, 0, 0)).zw;
/*65*/	  r14.xyzw = uintBitsToFloat(texelFetch(g_txMask_10, floatBitsToInt(r14.xyzw).st, floatBitsToInt(r14.xyzw).a).xyzw);
/*66*/	  r11.zw = (vec4(0, 0, 0, 0)).zw;
/*67*/	  r11.xyzw = uintBitsToFloat(texelFetch(g_txMask_10, floatBitsToInt(r11.xyzw).st, floatBitsToInt(r11.xyzw).a).xyzw);
/*68*/	  r4.yz = (intBitsToFloat(1 - ~floatBitsToInt(r10.xxwx))).yz;
/*69*/	  r5.yz = (uintBitsToFloat(min(floatBitsToUint(r2.xxzx), floatBitsToUint(r10.xxwx))).yz) /**/;
/*70*/	  r5.yz = (intBitsToFloat(1 - ~floatBitsToInt(r5.yyzy))).yz;
/*71*/	  r4.yz = (uintBitsToFloat(uvec4(notEqual(floatBitsToInt(r4.yyzy), floatBitsToInt(r5.yyzy))) * 0xffffffffu) /**/).yz;
/*72*/	  r2.xz = (uintBitsToFloat(min(floatBitsToUint(r2.xxzx), floatBitsToUint(r13.xxwx))).xz) /**/;
/*73*/	  r2.xz = (uintBitsToFloat(uvec4(notEqual(floatBitsToInt(r2.xxzx), floatBitsToInt(r13.xxwx))) * 0xffffffffu) /**/).xz;
/*74*/	  r10.yz = (uintBitsToFloat(floatBitsToUint(r2.xxzx) & uvec4(ivec4(0, 1, 1, 0)))).yz;
/*75*/	  r10.xw = (uintBitsToFloat(floatBitsToUint(r4.yyyz) & uvec4(ivec4(1, 0, 0, 1)))).xw;
/*76*/	  r9.y = r8.x;
/*77*/	  r9.w = r5.x;
/*78*/	  r5.xyzw = uintBitsToFloat(floatBitsToUint(r9.xyzw) & uvec4(ivec4(8, 8, 8, 8)));
/*79*/	  r5.xyzw = uintBitsToFloat(uvec4(notEqual(floatBitsToInt(r5.xyzw), ivec4(vec4(0, 0, 0, 0)))) * 0xffffffffu) /**/;
/*80*/	  r12.y = r15.x;
/*81*/	  r12.z = r14.x;
/*82*/	  r12.w = r11.x;
/*83*/	  r8.xyzw = uintBitsToFloat(floatBitsToUint(r12.xyzw) & uvec4(ivec4(1, 1, 2, 2)));
/*84*/	  r8.xyzw = uintBitsToFloat(uvec4(equal(floatBitsToInt(r8.xyzw), ivec4(vec4(0, 0, 0, 0)))) * 0xffffffffu) /**/;
/*85*/	  r5.xyzw = uintBitsToFloat(floatBitsToUint(r5.xyzw) | floatBitsToUint(r8.xyzw));
/*86*/	  r8.xyzw = uintBitsToFloat(uvec4(notEqual(floatBitsToInt(r10.xyzw), ivec4(vec4(0, 0, 0, 0)))) * 0xffffffffu) /**/;
/*87*/	  r5.xyzw = uintBitsToFloat(floatBitsToUint(r5.xyzw) | floatBitsToUint(r8.xyzw));
/*88*/	  r2.xz = (uintBitsToFloat(floatBitsToUint(r1.zzwz) | uvec4(ivec4(8, 0, 8, 0)))).xz;
/*89*/	  r2.xz = (mix(r1.zzwz, r2.xxzx, greaterThan(floatBitsToUint(r3.xxzx), uvec4(0)))).xz;
/*90*/	  r8.xyzw = intBitsToFloat(floatBitsToInt(r0.xyww) + floatBitsToInt(r6.yxww));
/*91*/	  r8.xyzw = uintBitsToFloat(texelFetch(g_txHorzCount_10, floatBitsToInt(r8.xyzw).st, floatBitsToInt(r8.xyzw).a).xyzw);
/*92*/	  r1.x = uintBitsToFloat(floatBitsToUint(r8.x) >> uint(4));
/*93*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & uint(7));
/*94*/	  r1.x = intBitsToFloat(floatBitsToInt(r1.x) + floatBitsToInt(r4.x));
/*95*/	    r1.x = (floatBitsToUint(r3.x) > 0x00000000u) ? r1.x : r1.z;
/*96*/	    r1.z = (floatBitsToUint(r5.x) > 0x00000000u) ? r2.x : r1.x;
/*97*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.y) | uint(8));
/*98*/	    r1.x = (floatBitsToUint(r3.y) > 0x00000000u) ? r1.x : r1.y;
/*99*/	  r8.xyzw = intBitsToFloat(floatBitsToInt(r0.xyww) + floatBitsToInt(r7.yxww));
/*100*/	  r8.xyzw = uintBitsToFloat(texelFetch(g_txHorzCount_10, floatBitsToInt(r8.xyzw).st, floatBitsToInt(r8.xyzw).a).xyzw);
/*101*/	  r2.x = uintBitsToFloat(floatBitsToUint(r8.x) & uint(7));
/*102*/	  r2.x = intBitsToFloat(floatBitsToInt(r2.x) + floatBitsToInt(r4.x));
/*103*/	    r2.x = (floatBitsToUint(r3.y) > 0x00000000u) ? r2.x : r1.y;
/*104*/	    r1.y = (floatBitsToUint(r5.y) > 0x00000000u) ? r1.x : r2.x;
/*105*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r0.xyww) + floatBitsToInt(r7.xyzw));
/*106*/	  r7.xyzw = uintBitsToFloat(texelFetch(g_txVertCount_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw);
/*107*/	  r1.x = uintBitsToFloat(floatBitsToUint(r7.x) >> uint(4));
/*108*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & uint(7));
/*109*/	  r1.x = intBitsToFloat(floatBitsToInt(r1.x) + floatBitsToInt(r4.x));
/*110*/	    r1.x = (floatBitsToUint(r3.z) > 0x00000000u) ? r1.x : r1.w;
/*111*/	    r1.w = (floatBitsToUint(r5.z) > 0x00000000u) ? r2.z : r1.x;
/*112*/	  r1.x = uintBitsToFloat(floatBitsToUint(r2.y) | uint(8));
/*113*/	    r1.x = (floatBitsToUint(r3.w) > 0x00000000u) ? r1.x : r2.y;
/*114*/	  r0.xyzw = intBitsToFloat(floatBitsToInt(r0.xyzw) + floatBitsToInt(r6.xyzw));
/*115*/	  r0.xyzw = uintBitsToFloat(texelFetch(g_txVertCount_10, floatBitsToInt(r0.xyzw).st, floatBitsToInt(r0.xyzw).a).xyzw);
/*116*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & uint(7));
/*117*/	  r0.x = intBitsToFloat(floatBitsToInt(r0.x) + floatBitsToInt(r4.x));
/*118*/	    r0.x = (floatBitsToUint(r3.w) > 0x00000000u) ? r0.x : r2.y;
/*119*/	    r2.y = (floatBitsToUint(r5.w) > 0x00000000u) ? r1.x : r0.x;
/*120*/	}
/*121*/	r0.x = intBitsToFloat(floatBitsToInt(r1.z) << int(4));
/*122*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & uint(240));
/*123*/	r0.y = uintBitsToFloat(floatBitsToUint(r1.y) & uint(15));
/*124*/	color0 = uint(floatBitsToInt(r0.y) + floatBitsToInt(r0.x));
/*125*/	r0.x = intBitsToFloat(floatBitsToInt(r1.w) << int(4));
/*126*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & uint(240));
/*127*/	r0.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(15));
/*128*/	color1 = uint(floatBitsToInt(r0.y) + floatBitsToInt(r0.x));
/*129*/	return;
}
