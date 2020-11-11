//
//
// Shader Model 4
// Fragment Shader
//
// id: 3858 - fxc/glsl_SM_4_0_MLAA_PS_4_0.hlsl_PS_MLAA_Blend_PS.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D g_txInitialImage_10;
uniform usampler2D g_txHorzCount_10;
uniform usampler2D g_txVertCount_10;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xw = (intBitsToFloat(ivec4(gl_FragCoord.yyyx))).xw;
/*1*/	r0.y = 0;
/*2*/	r1.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r0.wxyy).st, floatBitsToInt(r0.wxyy).a).xyzw;
/*3*/	r2.xyzw = uintBitsToFloat(texelFetch(g_txHorzCount_10, floatBitsToInt(r0.wxyy).st, floatBitsToInt(r0.wxyy).a).xyzw);
/*4*/	r2.y = uintBitsToFloat(floatBitsToUint(r2.x) & uint(136));
/*5*/	if(floatBitsToUint(r2.y) != 0u) {
/*6*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.x) >> uint(4));
/*7*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(7));
/*8*/	  r3.x = uintBitsToFloat(floatBitsToUint(r2.x) & uint(7));
/*9*/	  r4.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + ivec4(ivec4(0, -1, 0, 0)));
/*10*/	  r4.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r4.xyzw).st, floatBitsToInt(r4.xyzw).a).xyzw;
/*11*/	  r2.x = intBitsToFloat(floatBitsToInt(r2.y) + floatBitsToInt(r3.x));
/*12*/	  r5.xyzw = -r1.xyzw + r4.xyzw;
/*13*/	  r5.xyzw = r5.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*14*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.x) + int(1));
/*15*/	  r2.z = floatBitsToInt(r2.z);
/*16*/	  r2.w = r2.z * 0.500000;
/*17*/	  r6.x = floatBitsToInt(r2.y);
/*18*/	  r7.x = intBitsToFloat(1 - ~floatBitsToInt(r2.y));
/*19*/	  r7.yzw = (vec4(0, 0, 0, 0)).yzw;
/*20*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + floatBitsToInt(r7.xyzw));
/*21*/	  r7.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*22*/	  r8.x = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + int(-1));
/*23*/	  r8.yzw = (vec4(0, 0, 0, 0)).yzw;
/*24*/	  r8.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + floatBitsToInt(r8.xyzw));
/*25*/	  r8.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r8.xyzw).st, floatBitsToInt(r8.xyzw).a).xyzw;
/*26*/	  r6.yzw = (r7.xxyz + -r8.xxyz).yzw;
/*27*/	  r6.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r6.yyzw))) * 0xffffffffu)).yzw;
/*28*/	  r2.y = uintBitsToFloat(floatBitsToUint(r6.z) | floatBitsToUint(r6.y));
/*29*/	  r2.y = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r2.y));
/*30*/	  r6.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(1));
/*31*/	  r3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*32*/	  r3.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + floatBitsToInt(r3.xyzw));
/*33*/	  r7.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r3.xyzw).st, floatBitsToInt(r3.xyzw).a).xyzw;
/*34*/	  r0.z = r3.x;
/*35*/	  r3.xyzw = intBitsToFloat(floatBitsToInt(r0.zxyy) + ivec4(ivec4(1, 0, 0, 0)));
/*36*/	  r3.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r3.xyzw).st, floatBitsToInt(r3.xyzw).a).xyzw;
/*37*/	  r3.xyz = (-r3.xyzx + r7.xyzx).xyz;
/*38*/	  r3.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.062500, 0.062500, 0.000000), abs(r3.xyzx))) * 0xffffffffu)).xyz;
/*39*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*40*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r3.x));
/*41*/	    r2.y = (floatBitsToUint(r2.y) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*42*/	    r2.y = (floatBitsToUint(r3.x) > 0x00000000u) ? r2.y : r6.y;
/*43*/	  r3.xyz = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r2.yyyy), ivec4(ivec4(2, 1, 3, 0)))) * 0xffffffffu) /**/).xyz;
/*44*/	  r2.y = uintBitsToFloat((r6.x >= r2.w) ? 0xffffffffu : 0x00000000u);
/*45*/	  r2.w = uintBitsToFloat((r2.w >= r6.x) ? 0xffffffffu : 0x00000000u);
/*46*/	  r2.yw = (uintBitsToFloat(floatBitsToUint(r2.yyyw) & floatBitsToUint(r3.xxxy))).yw;
/*47*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.w) | floatBitsToUint(r2.y));
/*48*/	  r2.y = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r2.y));
/*49*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).w;
/*50*/	  r2.z = r2.z + -r6.x;
/*51*/	  r3.x = r2.w * r2.z + -0.500000;
/*52*/	  r2.z = r2.z + -1.000000;
/*53*/	  r2.z = r2.w * r2.z + -0.500000;
/*54*/	  r2.z = abs(r2.z) + abs(r3.x);
/*55*/	  r2.z = r2.z * 0.500000;
/*56*/	  r3.xyzw = r1.xyzw * r1.xyzw;
/*57*/	  r4.xyzw = r4.xyzw * r4.xyzw + -r3.xyzw;
/*58*/	  r3.xyzw = r2.zzzz * r4.xyzw + r3.xyzw;
/*59*/	  r3.xyzw = sqrt(r3.xyzw);
/*60*/	  r3.xyzw = min(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*61*/	  r3.xyzw = mix(r1.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)));
/*62*/	  r1.xyzw = mix(r5.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*63*/	}
/*64*/	r2.xyz = intBitsToFloat((floatBitsToInt(r0.wxyw) + ivec4(ivec4(0, 1, 0, 0))).xyz);
/*65*/	r3.xyzw = uintBitsToFloat(texelFetch(g_txHorzCount_10, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw);
/*66*/	r3.y = uintBitsToFloat(floatBitsToUint(r3.x) & uint(136));
/*67*/	if(floatBitsToUint(r3.y) != 0u) {
/*68*/	  r3.y = uintBitsToFloat(floatBitsToUint(r3.x) >> uint(4));
/*69*/	  r3.y = uintBitsToFloat(floatBitsToUint(r3.y) & uint(7));
/*70*/	  r4.x = uintBitsToFloat(floatBitsToUint(r3.x) & uint(7));
/*71*/	  r5.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r2.xyzz).st, floatBitsToInt(r2.xyzz).a).xyzw;
/*72*/	  r3.x = intBitsToFloat(floatBitsToInt(r3.y) + floatBitsToInt(r4.x));
/*73*/	  r6.xyzw = -r1.xyzw + r5.xyzw;
/*74*/	  r6.xyzw = r6.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*75*/	  r3.z = intBitsToFloat(floatBitsToInt(r3.x) + int(1));
/*76*/	  r3.z = floatBitsToInt(r3.z);
/*77*/	  r3.w = r3.z * 0.500000;
/*78*/	  r7.x = floatBitsToInt(r3.y);
/*79*/	  r8.x = intBitsToFloat(1 - ~floatBitsToInt(r3.y));
/*80*/	  r8.yzw = (vec4(0, 0, 0, 0)).yzw;
/*81*/	  r8.xyzw = intBitsToFloat(floatBitsToInt(r2.xyzz) + floatBitsToInt(r8.xyzw));
/*82*/	  r8.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r8.xyzw).st, floatBitsToInt(r8.xyzw).a).xyzw;
/*83*/	  r9.x = intBitsToFloat(1 + ~floatBitsToInt(r3.y) + int(-1));
/*84*/	  r9.yzw = (vec4(0, 0, 0, 0)).yzw;
/*85*/	  r9.xyzw = intBitsToFloat(floatBitsToInt(r2.xyzz) + floatBitsToInt(r9.xyzw));
/*86*/	  r9.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r9.xyzw).st, floatBitsToInt(r9.xyzw).a).xyzw;
/*87*/	  r7.yzw = (r8.xxyz + -r9.xxyz).yzw;
/*88*/	  r7.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r7.yyzw))) * 0xffffffffu)).yzw;
/*89*/	  r2.y = uintBitsToFloat(floatBitsToUint(r7.z) | floatBitsToUint(r7.y));
/*90*/	  r2.y = uintBitsToFloat(floatBitsToUint(r7.w) | floatBitsToUint(r2.y));
/*91*/	  r3.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(1));
/*92*/	  r2.w = r0.x;
/*93*/	  r4.yzw = (intBitsToFloat(ivec4(ivec4(0, 1, 0, 0)))).yzw;
/*94*/	  r4.xyzw = intBitsToFloat(floatBitsToInt(r2.xwzz) + floatBitsToInt(r4.xyzw));
/*95*/	  r8.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r4.xyzw).st, floatBitsToInt(r4.xyzw).a).xyzw;
/*96*/	  r4.yzw = (r2.wwzz).yzw;
/*97*/	  r4.xyzw = intBitsToFloat(floatBitsToInt(r4.xyzw) + ivec4(ivec4(1, 1, 0, 0)));
/*98*/	  r4.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r4.xyzw).st, floatBitsToInt(r4.xyzw).a).xyzw;
/*99*/	  r2.xzw = (-r4.xxyz + r8.xxyz).xzw;
/*100*/	  r2.xzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.000000, 0.062500, 0.062500), abs(r2.xxzw))) * 0xffffffffu)).xzw;
/*101*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.x));
/*102*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.w) | floatBitsToUint(r2.x));
/*103*/	    r2.y = (floatBitsToUint(r2.y) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*104*/	    r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r2.y : r3.y;
/*105*/	  r2.xyz = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r2.xxxx), ivec4(ivec4(2, 1, 0, 0)))) * 0xffffffffu) /**/).xyz;
/*106*/	  r2.w = uintBitsToFloat((r3.w >= r7.x) ? 0xffffffffu : 0x00000000u);
/*107*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r2.x));
/*108*/	  r2.w = uintBitsToFloat((r7.x >= r3.w) ? 0xffffffffu : 0x00000000u);
/*109*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r2.y));
/*110*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r2.x));
/*111*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.x));
/*112*/	  r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.z)).y;
/*113*/	  r2.z = r3.z + -r7.x;
/*114*/	  r2.w = r2.y * r2.z + -0.500000;
/*115*/	  r2.z = r2.z + -1.000000;
/*116*/	  r2.y = r2.y * r2.z + -0.500000;
/*117*/	  r2.y = abs(r2.y) + abs(r2.w);
/*118*/	  r2.y = r2.y * 0.500000;
/*119*/	  r4.xyzw = r1.xyzw * r1.xyzw;
/*120*/	  r5.xyzw = r5.xyzw * r5.xyzw + -r4.xyzw;
/*121*/	  r4.xyzw = r2.yyyy * r5.xyzw + r4.xyzw;
/*122*/	  r4.xyzw = sqrt(r4.xyzw);
/*123*/	  r4.xyzw = min(r4.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*124*/	  r2.xyzw = mix(r1.xyzw, r4.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*125*/	  r1.xyzw = mix(r6.xyzw, r2.xyzw, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)));
/*126*/	}
/*127*/	r2.xyzw = uintBitsToFloat(texelFetch(g_txVertCount_10, floatBitsToInt(r0.wxyy).st, floatBitsToInt(r0.wxyy).a).xyzw);
/*128*/	r2.y = uintBitsToFloat(floatBitsToUint(r2.x) & uint(136));
/*129*/	if(floatBitsToUint(r2.y) != 0u) {
/*130*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.x) >> uint(4));
/*131*/	  r3.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(7));
/*132*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & uint(7));
/*133*/	  r4.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + ivec4(ivec4(1, 0, 0, 0)));
/*134*/	  r4.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r4.xyzw).st, floatBitsToInt(r4.xyzw).a).xyzw;
/*135*/	  r2.y = intBitsToFloat(floatBitsToInt(r2.x) + floatBitsToInt(r3.y));
/*136*/	  r5.xyzw = -r1.xyzw + r4.xyzw;
/*137*/	  r5.xyzw = r5.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*138*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.y) + int(1));
/*139*/	  r2.z = floatBitsToInt(r2.z);
/*140*/	  r2.w = r2.z * 0.500000;
/*141*/	  r6.x = floatBitsToInt(r3.y);
/*142*/	  r3.xzw = (vec4(0, 0, 0, 0)).xzw;
/*143*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + floatBitsToInt(r3.xyzw));
/*144*/	  r7.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*145*/	  r8.xzw = (vec4(0, 0, 0, 0)).xzw;
/*146*/	  r8.y = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*147*/	  r3.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + floatBitsToInt(r8.xyzw));
/*148*/	  r3.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r3.xyzw).st, floatBitsToInt(r3.xyzw).a).xyzw;
/*149*/	  r3.xyz = (-r3.xyzx + r7.xyzx).xyz;
/*150*/	  r3.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.062500, 0.062500, 0.000000), abs(r3.xyzx))) * 0xffffffffu)).xyz;
/*151*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*152*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r3.x));
/*153*/	  r3.y = uintBitsToFloat(floatBitsToUint(r3.x) & uint(1));
/*154*/	  r7.y = intBitsToFloat(1 - ~floatBitsToInt(r2.x));
/*155*/	  r7.xzw = (vec4(0, 0, 0, 0)).xzw;
/*156*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r0.wxyy) + floatBitsToInt(r7.xyzw));
/*157*/	  r8.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*158*/	  r7.xzw = (r0.wwyy).xzw;
/*159*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r7.xyzw) + ivec4(ivec4(0, -1, 0, 0)));
/*160*/	  r7.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*161*/	  r6.yzw = (-r7.xxyz + r8.xxyz).yzw;
/*162*/	  r6.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r6.yyzw))) * 0xffffffffu)).yzw;
/*163*/	  r2.x = uintBitsToFloat(floatBitsToUint(r6.z) | floatBitsToUint(r6.y));
/*164*/	  r2.x = uintBitsToFloat(floatBitsToUint(r6.w) | floatBitsToUint(r2.x));
/*165*/	    r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*166*/	    r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r3.x : r3.y;
/*167*/	  r3.xyz = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r2.xxxx), ivec4(ivec4(2, 1, 3, 0)))) * 0xffffffffu) /**/).xyz;
/*168*/	  r2.x = uintBitsToFloat((r6.x >= r2.w) ? 0xffffffffu : 0x00000000u);
/*169*/	  r2.w = uintBitsToFloat((r2.w >= r6.x) ? 0xffffffffu : 0x00000000u);
/*170*/	  r2.xw = (uintBitsToFloat(floatBitsToUint(r2.xxxw) & floatBitsToUint(r3.xxxy))).xw;
/*171*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.w) | floatBitsToUint(r2.x));
/*172*/	  r2.x = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r2.x));
/*173*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).w;
/*174*/	  r2.z = r2.z + -r6.x;
/*175*/	  r3.x = r2.w * r2.z + -0.500000;
/*176*/	  r2.z = r2.z + -1.000000;
/*177*/	  r2.z = r2.w * r2.z + -0.500000;
/*178*/	  r2.z = abs(r2.z) + abs(r3.x);
/*179*/	  r2.z = r2.z * 0.500000;
/*180*/	  r3.xyzw = r1.xyzw * r1.xyzw;
/*181*/	  r4.xyzw = r4.xyzw * r4.xyzw + -r3.xyzw;
/*182*/	  r3.xyzw = r2.zzzz * r4.xyzw + r3.xyzw;
/*183*/	  r3.xyzw = sqrt(r3.xyzw);
/*184*/	  r3.xyzw = min(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*185*/	  r3.xyzw = mix(r1.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*186*/	  r1.xyzw = mix(r5.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)));
/*187*/	}
/*188*/	r0.xyz = intBitsToFloat((floatBitsToInt(r0.wxyw) + ivec4(ivec4(-1, 0, 0, 0))).xyz);
/*189*/	r2.xyzw = uintBitsToFloat(texelFetch(g_txVertCount_10, floatBitsToInt(r0.xyzz).st, floatBitsToInt(r0.xyzz).a).xyzw);
/*190*/	r2.y = uintBitsToFloat(floatBitsToUint(r2.x) & uint(136));
/*191*/	if(floatBitsToUint(r2.y) != 0u) {
/*192*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.x) >> uint(4));
/*193*/	  r3.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(7));
/*194*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & uint(7));
/*195*/	  r4.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r0.xyzz).st, floatBitsToInt(r0.xyzz).a).xyzw;
/*196*/	  r2.y = intBitsToFloat(floatBitsToInt(r2.x) + floatBitsToInt(r3.y));
/*197*/	  r5.xyzw = -r1.xyzw + r4.xyzw;
/*198*/	  r5.xyzw = r5.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*199*/	  r2.z = intBitsToFloat(floatBitsToInt(r2.y) + int(1));
/*200*/	  r2.z = floatBitsToInt(r2.z);
/*201*/	  r2.w = r2.z * 0.500000;
/*202*/	  r6.x = floatBitsToInt(r3.y);
/*203*/	  r3.xzw = (vec4(0, 0, 0, 0)).xzw;
/*204*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r0.xyzz) + floatBitsToInt(r3.xyzw));
/*205*/	  r7.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*206*/	  r8.xzw = (vec4(0, 0, 0, 0)).xzw;
/*207*/	  r8.y = intBitsToFloat(floatBitsToInt(r3.y) + int(1));
/*208*/	  r3.xyzw = intBitsToFloat(floatBitsToInt(r0.xyzz) + floatBitsToInt(r8.xyzw));
/*209*/	  r3.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r3.xyzw).st, floatBitsToInt(r3.xyzw).a).xyzw;
/*210*/	  r3.xyz = (-r3.xyzx + r7.xyzx).xyz;
/*211*/	  r3.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.062500, 0.062500, 0.000000), abs(r3.xyzx))) * 0xffffffffu)).xyz;
/*212*/	  r0.x = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*213*/	  r0.x = uintBitsToFloat(floatBitsToUint(r3.z) | floatBitsToUint(r0.x));
/*214*/	  r3.x = uintBitsToFloat(floatBitsToUint(r0.x) & uint(1));
/*215*/	  r7.y = intBitsToFloat(1 - ~floatBitsToInt(r2.x));
/*216*/	  r7.xzw = (intBitsToFloat(ivec4(ivec4(-1, 0, 0, 0)))).xzw;
/*217*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r0.wyzz) + floatBitsToInt(r7.xyzw));
/*218*/	  r8.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*219*/	  r7.xzw = (r0.wwzz).xzw;
/*220*/	  r7.xyzw = intBitsToFloat(floatBitsToInt(r7.xyzw) + ivec4(ivec4(-1, -1, 0, 0)));
/*221*/	  r7.xyzw = texelFetch(g_txInitialImage_10, floatBitsToInt(r7.xyzw).st, floatBitsToInt(r7.xyzw).a).xyzw;
/*222*/	  r0.yzw = (-r7.xxyz + r8.xxyz).yzw;
/*223*/	  r0.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r0.yyzw))) * 0xffffffffu)).yzw;
/*224*/	  r0.y = uintBitsToFloat(floatBitsToUint(r0.z) | floatBitsToUint(r0.y));
/*225*/	  r0.y = uintBitsToFloat(floatBitsToUint(r0.w) | floatBitsToUint(r0.y));
/*226*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*227*/	    r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : r3.x;
/*228*/	  r0.xyz = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r0.xxxx), ivec4(ivec4(2, 1, 0, 0)))) * 0xffffffffu) /**/).xyz;
/*229*/	  r0.w = uintBitsToFloat((r2.w >= r6.x) ? 0xffffffffu : 0x00000000u);
/*230*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*231*/	  r0.w = uintBitsToFloat((r6.x >= r2.w) ? 0xffffffffu : 0x00000000u);
/*232*/	  r0.y = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.y));
/*233*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*234*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.z) | floatBitsToUint(r0.x));
/*235*/	  r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).y;
/*236*/	  r0.z = r2.z + -r6.x;
/*237*/	  r0.w = r0.y * r0.z + -0.500000;
/*238*/	  r0.z = r0.z + -1.000000;
/*239*/	  r0.y = r0.y * r0.z + -0.500000;
/*240*/	  r0.y = abs(r0.y) + abs(r0.w);
/*241*/	  r0.y = r0.y * 0.500000;
/*242*/	  r3.xyzw = r1.xyzw * r1.xyzw;
/*243*/	  r4.xyzw = r4.xyzw * r4.xyzw + -r3.xyzw;
/*244*/	  r3.xyzw = r0.yyyy * r4.xyzw + r3.xyzw;
/*245*/	  r3.xyzw = sqrt(r3.xyzw);
/*246*/	  r3.xyzw = min(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 1.000000));
/*247*/	  r0.xyzw = mix(r1.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)));
/*248*/	  color0.xyzw = mix(r5.xyzw, r0.xyzw, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)));
/*249*/	} else {
/*250*/	  color0.xyzw = r1.xyzw;
/*251*/	}
/*252*/	return;
}
