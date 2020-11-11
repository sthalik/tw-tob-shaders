//
//
// Shader Model 4
// Fragment Shader
//
// id: 3852 - fxc/glsl_SM_3_0_MLAA_PS_3_0.hlsl_PS_MLAA_ComputeLineLength_PS.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_txMask_9;
uniform sampler2D s_txHorzCount_9;
uniform sampler2D s_txVertCount_9;

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
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = gl_FragCoord.xyxy + cb1.data[28].xxxx;
/*1*/	r1.xy = (r0.zwzz * cb1.data[27].zwzz).xy;
/*2*/	r2.xyzw = (textureLod(s_txMask_9, r1.xyxx.st, 0.000000)).xyzw;
/*3*/	r3.xyzw = (textureLod(s_txHorzCount_9, r1.xyxx.st, 0.000000)).xyzw;
/*4*/	r1.xyzw = (textureLod(s_txVertCount_9, r1.xyxx.st, 0.000000)).xyzw;
/*5*/	r1.yz = (r3.xxxx * vec4(0.000000, 0.003906, 0.062500, 0.000000)).yz;
/*6*/	r2.yz = (uintBitsToFloat(uvec4(greaterThanEqual(r1.yyzy, -r1.yyzy)) * 0xffffffffu)).yz;
/*7*/	r1.yz = (fract(abs(r1.yyzy))).yz;
/*8*/	r1.yz = (mix(-r1.yyzy, r1.yyzy, greaterThan(floatBitsToUint(r2.yyzy), uvec4(0)))).yz;
/*9*/	r1.xw = (r1.xxxx * vec4(0.003906, 0.000000, 0.000000, 0.062500)).xw;
/*10*/	r2.yz = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxwx, -r1.xxwx)) * 0xffffffffu)).yz;
/*11*/	r1.xw = (fract(abs(r1.xxxw))).xw;
/*12*/	r1.xw = (mix(-r1.xxxw, r1.xxxw, greaterThan(floatBitsToUint(r2.yyyz), uvec4(0)))).xw;
/*13*/	r3.xyzw = r1.yzxw * vec4(16.000000, 16.000000, 16.000000, 16.000000);
/*14*/	r2.xy = (r2.xxxx * vec4(0.500000, 0.250000, 0.000000, 0.000000)).xy;
/*15*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r2.xxxy, -r2.xxxy)) * 0xffffffffu)).zw;
/*16*/	r2.xy = (fract(abs(r2.xyxx))).xy;
/*17*/	r2.xy = (mix(-r2.xyxx, r2.xyxx, greaterThan(floatBitsToUint(r2.zwzz), uvec4(0)))).xy;
/*18*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.xyxx, vec4(0.500000, 0.500000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*19*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.yyyz, -r1.yyyz)) * 0xffffffffu)).zw;
/*20*/	r1.yz = (fract(abs(r1.yyzy))).yz;
/*21*/	r1.yz = (mix(-r1.yyzy, r1.yyzy, greaterThan(floatBitsToUint(r2.zzwz), uvec4(0)))).yz;
/*22*/	r1.yz = (uintBitsToFloat(uvec4(lessThan(r1.yyzy, vec4(0.000000, 0.500000, 0.500000, 0.000000))) * 0xffffffffu)).yz;
/*23*/	r1.yz = (uintBitsToFloat(floatBitsToUint(r1.yyzy) & floatBitsToUint(r2.xxxx))).yz;
/*24*/	r2.xz = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxwx, -r1.xxwx)) * 0xffffffffu)).xz;
/*25*/	r1.xw = (fract(abs(r1.xxxw))).xw;
/*26*/	r1.xw = (mix(-r1.xxxw, r1.xxxw, greaterThan(floatBitsToUint(r2.xxxz), uvec4(0)))).xw;
/*27*/	r1.xw = (uintBitsToFloat(uvec4(lessThan(r1.xxxw, vec4(0.500000, 0.000000, 0.000000, 0.500000))) * 0xffffffffu)).xw;
/*28*/	r1.xw = (uintBitsToFloat(floatBitsToUint(r1.xxxw) & floatBitsToUint(r2.yyyy))).xw;
/*29*/	r2.xy = (uintBitsToFloat(floatBitsToUint(r1.xwxx) | floatBitsToUint(r1.yzyy))).xy;
/*30*/	r2.x = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r2.x));
/*31*/	r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & uint(1));
/*32*/	if(floatBitsToUint(r2.x) != 0u) {
/*33*/	  r2.x = intBitsToFloat(int(cb0.data[0].y));
/*34*/	  r2.x = intBitsToFloat(max(floatBitsToInt(r2.x), int(1))) /**/;
/*35*/	  r2.x = intBitsToFloat(floatBitsToInt(r2.x) << int(1));
/*36*/	  r2.y = trunc(cb0.data[0].y);
/*37*/	  r2.y = exp2(r2.y);
/*38*/	  r2.y = uintBitsToFloat(uint(r2.y));
/*39*/	  r4.xyzw = intBitsToFloat((floatBitsToInt(r2.xxxx)) * (ivec4(ivec4(0, 1, 0, -1))) + ivec4(ivec4(0, -2, 0, 2)));
/*40*/	  r5.xyzw = intBitsToFloat(floatBitsToInt(r2.yyyy) * ivec4(ivec4(0, 1, 0, -1))) /**/;
/*41*/	  r4.xyzw = floatBitsToInt(r4.xyzw);
/*42*/	  r6.xyzw = r0.zwzw + r4.wzyx;
/*43*/	  r6.xyzw = r6.xyzw * cb1.data[27].zwzw;
/*44*/	  r7.xyzw = (textureLod(s_txHorzCount_9, r6.xyxx.st, 0.000000)).xyzw;
/*45*/	  r2.x = r7.x * 0.003906;
/*46*/	  r2.z = uintBitsToFloat((r2.x >= -r2.x) ? 0xffffffffu : 0x00000000u);
/*47*/	  r2.x = fract(abs(r2.x));
/*48*/	    r2.x = (floatBitsToUint(r2.z) > 0x00000000u) ? r2.x : -r2.x;
/*49*/	  r6.xyzw = (textureLod(s_txHorzCount_9, r6.zwzz.st, 0.000000)).xyzw;
/*50*/	  r2.z = r6.x * 0.062500;
/*51*/	  r2.w = uintBitsToFloat((r2.z >= -r2.z) ? 0xffffffffu : 0x00000000u);
/*52*/	  r2.z = fract(abs(r2.z));
/*53*/	    r2.z = (floatBitsToUint(r2.w) > 0x00000000u) ? r2.z : -r2.z;
/*54*/	  r4.xyzw = r0.zwzw + r4.xyzw;
/*55*/	  r4.xyzw = r4.xyzw * cb1.data[27].zwzw;
/*56*/	  r6.xyzw = (textureLod(s_txVertCount_9, r4.xyxx.st, 0.000000)).xyzw;
/*57*/	  r2.w = r6.x * 0.003906;
/*58*/	  r4.x = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*59*/	  r2.w = fract(abs(r2.w));
/*60*/	    r2.w = (floatBitsToUint(r4.x) > 0x00000000u) ? r2.w : -r2.w;
/*61*/	  r4.xyzw = (textureLod(s_txVertCount_9, r4.zwzz.st, 0.000000)).xyzw;
/*62*/	  r4.x = r4.x * 0.062500;
/*63*/	  r4.y = uintBitsToFloat((r4.x >= -r4.x) ? 0xffffffffu : 0x00000000u);
/*64*/	  r4.x = fract(abs(r4.x));
/*65*/	    r4.x = (floatBitsToUint(r4.y) > 0x00000000u) ? r4.x : -r4.x;
/*66*/	  r5.xyzw = floatBitsToInt(r5.xyzw);
/*67*/	  r6.xyzw = r0.zwzw + r5.wzyx;
/*68*/	  r7.xyzw = r6.xyzw * cb1.data[27].zwzw;
/*69*/	  r8.xyzw = (textureLod(s_txMask_9, r7.xyxx.st, 0.000000)).xyzw;
/*70*/	  r9.xyzw = (textureLod(s_txMask_9, r7.zwzz.st, 0.000000)).xyzw;
/*71*/	  r0.xyzw = r0.xyzw + r5.xyzw;
/*72*/	  r5.xyzw = r0.xyzw * cb1.data[27].zwzw;
/*73*/	  r10.xyzw = (textureLod(s_txMask_9, r5.xyxx.st, 0.000000)).xyzw;
/*74*/	  r11.xyzw = (textureLod(s_txMask_9, r5.zwzz.st, 0.000000)).xyzw;
/*75*/	  r0.xz = (intBitsToFloat(ivec4(r6.xxzx))).xz;
/*76*/	  r0.x = intBitsToFloat(1 - ~floatBitsToInt(r0.x));
/*77*/	  r4.yz = (max(r6.xxzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))).yz;
/*78*/	  r4.yz = (min(r4.yyzy, cb1.data[27].xxxx)).yz;
/*79*/	  r4.yz = (intBitsToFloat(ivec4(r4.yyzy))).yz;
/*80*/	  r4.y = intBitsToFloat(1 - ~floatBitsToInt(r4.y));
/*81*/	  r0.xz = (uintBitsToFloat(uvec4(notEqual(floatBitsToInt(r0.xxzx), floatBitsToInt(r4.yyzy))) * 0xffffffffu) /**/).xz;
/*82*/	  r4.yz = (intBitsToFloat(ivec4(r0.yywy))).yz;
/*83*/	  r0.yw = (max(r0.yyyw, vec4(0.000000, 0.000000, 0.000000, 0.000000))).yw;
/*84*/	  r0.yw = (min(r0.yyyw, cb1.data[27].yyyy)).yw;
/*85*/	  r0.yw = (intBitsToFloat(ivec4(r0.yyyw))).yw;
/*86*/	  r0.y = uintBitsToFloat((floatBitsToInt(r0.y) != floatBitsToInt(r4.y)) ? 0xffffffffu : 0x00000000u) /**/;
/*87*/	  r4.y = intBitsToFloat(1 - ~floatBitsToInt(r4.z));
/*88*/	  r0.w = intBitsToFloat(1 - ~floatBitsToInt(r0.w));
/*89*/	  r0.w = uintBitsToFloat((floatBitsToInt(r0.w) != floatBitsToInt(r4.y)) ? 0xffffffffu : 0x00000000u) /**/;
/*90*/	  r4.y = uintBitsToFloat((r2.x >= -r2.x) ? 0xffffffffu : 0x00000000u);
/*91*/	  r2.x = fract(abs(r2.x));
/*92*/	    r2.x = (floatBitsToUint(r4.y) > 0x00000000u) ? r2.x : -r2.x;
/*93*/	  r2.x = uintBitsToFloat((r2.x >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*94*/	  r4.y = r8.x * 0.500000;
/*95*/	  r4.z = uintBitsToFloat((r4.y >= -r4.y) ? 0xffffffffu : 0x00000000u);
/*96*/	  r4.y = fract(abs(r4.y));
/*97*/	    r4.y = (floatBitsToUint(r4.z) > 0x00000000u) ? r4.y : -r4.y;
/*98*/	  r4.y = uintBitsToFloat((r4.y < 0.500000) ? 0xffffffffu : 0x00000000u);
/*99*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.x) | floatBitsToUint(r4.y));
/*100*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) | floatBitsToUint(r2.x));
/*101*/	  r2.x = uintBitsToFloat((r2.z >= -r2.z) ? 0xffffffffu : 0x00000000u);
/*102*/	  r2.z = fract(abs(r2.z));
/*103*/	    r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r2.z : -r2.z;
/*104*/	  r2.x = uintBitsToFloat((r2.x >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*105*/	  r2.z = r9.x * 0.500000;
/*106*/	  r4.y = uintBitsToFloat((r2.z >= -r2.z) ? 0xffffffffu : 0x00000000u);
/*107*/	  r2.z = fract(abs(r2.z));
/*108*/	    r2.z = (floatBitsToUint(r4.y) > 0x00000000u) ? r2.z : -r2.z;
/*109*/	  r2.z = uintBitsToFloat((r2.z < 0.500000) ? 0xffffffffu : 0x00000000u);
/*110*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.x));
/*111*/	  r0.z = uintBitsToFloat(floatBitsToUint(r0.z) | floatBitsToUint(r2.x));
/*112*/	  r2.x = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*113*/	  r2.z = fract(abs(r2.w));
/*114*/	    r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r2.z : -r2.z;
/*115*/	  r2.x = uintBitsToFloat((r2.x >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*116*/	  r2.z = r10.x * 0.250000;
/*117*/	  r2.w = uintBitsToFloat((r2.z >= -r2.z) ? 0xffffffffu : 0x00000000u);
/*118*/	  r2.z = fract(abs(r2.z));
/*119*/	    r2.z = (floatBitsToUint(r2.w) > 0x00000000u) ? r2.z : -r2.z;
/*120*/	  r2.z = uintBitsToFloat((r2.z < 0.500000) ? 0xffffffffu : 0x00000000u);
/*121*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.x));
/*122*/	  r0.y = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r2.x));
/*123*/	  r2.x = uintBitsToFloat((r4.x >= -r4.x) ? 0xffffffffu : 0x00000000u);
/*124*/	  r2.z = fract(abs(r4.x));
/*125*/	    r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r2.z : -r2.z;
/*126*/	  r2.x = uintBitsToFloat((r2.x >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*127*/	  r2.z = r11.x * 0.250000;
/*128*/	  r2.w = uintBitsToFloat((r2.z >= -r2.z) ? 0xffffffffu : 0x00000000u);
/*129*/	  r2.z = fract(abs(r2.z));
/*130*/	    r2.z = (floatBitsToUint(r2.w) > 0x00000000u) ? r2.z : -r2.z;
/*131*/	  r2.z = uintBitsToFloat((r2.z < 0.500000) ? 0xffffffffu : 0x00000000u);
/*132*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.x));
/*133*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) | floatBitsToUint(r2.x));
/*134*/	  r4.xyzw = r3.xyzw + vec4(8.000000, 8.000000, 8.000000, 8.000000);
/*135*/	  r2.xz = (mix(r3.xxyx, r4.xxyx, greaterThan(floatBitsToUint(r1.yyzy), uvec4(0)))).xz;
/*136*/	  r2.y = floatBitsToUint(r2.y);
/*137*/	  r6.xyzw = (textureLod(s_txHorzCount_9, r7.xyxx.st, 0.000000)).xyzw;
/*138*/	  r2.w = r6.x * 0.003906;
/*139*/	  r4.x = uintBitsToFloat((r2.w >= -r2.w) ? 0xffffffffu : 0x00000000u);
/*140*/	  r2.w = fract(abs(r2.w));
/*141*/	    r2.w = (floatBitsToUint(r4.x) > 0x00000000u) ? r2.w : -r2.w;
/*142*/	  r2.w = r2.w * 16.000000;
/*143*/	  r2.w = floor(r2.w);
/*144*/	  r4.x = r2.w * 0.062500;
/*145*/	  r4.y = uintBitsToFloat((r4.x >= -r4.x) ? 0xffffffffu : 0x00000000u);
/*146*/	  r4.x = fract(abs(r4.x));
/*147*/	    r4.x = (floatBitsToUint(r4.y) > 0x00000000u) ? r4.x : -r4.x;
/*148*/	  r4.x = uintBitsToFloat((r4.x >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*149*/	    r4.x = (floatBitsToUint(r4.x) > 0x00000000u) ? -8.000000 : -0.000000;
/*150*/	  r2.w = r2.w + r4.x;
/*151*/	  r2.w = r2.w + r2.y;
/*152*/	    r1.y = (floatBitsToUint(r1.y) > 0x00000000u) ? r2.w : r3.x;
/*153*/	    r3.x = (floatBitsToUint(r0.x) > 0x00000000u) ? r2.x : r1.y;
/*154*/	  r6.xyzw = (textureLod(s_txHorzCount_9, r7.zwzz.st, 0.000000)).xyzw;
/*155*/	  r0.x = r6.x * 0.062500;
/*156*/	  r1.y = uintBitsToFloat((r0.x >= -r0.x) ? 0xffffffffu : 0x00000000u);
/*157*/	  r0.x = fract(abs(r0.x));
/*158*/	    r0.x = (floatBitsToUint(r1.y) > 0x00000000u) ? r0.x : -r0.x;
/*159*/	  r0.x = r0.x * 16.000000;
/*160*/	  r0.x = floor(r0.x);
/*161*/	  r1.y = r0.x * 0.062500;
/*162*/	  r2.x = uintBitsToFloat((r1.y >= -r1.y) ? 0xffffffffu : 0x00000000u);
/*163*/	  r1.y = fract(abs(r1.y));
/*164*/	    r1.y = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.y : -r1.y;
/*165*/	  r1.y = uintBitsToFloat((r1.y >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*166*/	    r1.y = (floatBitsToUint(r1.y) > 0x00000000u) ? -8.000000 : -0.000000;
/*167*/	  r0.x = r0.x + r1.y;
/*168*/	  r0.x = r0.x + r2.y;
/*169*/	    r0.x = (floatBitsToUint(r1.z) > 0x00000000u) ? r0.x : r3.y;
/*170*/	    r3.y = (floatBitsToUint(r0.z) > 0x00000000u) ? r2.z : r0.x;
/*171*/	  r0.xz = (mix(r3.zzwz, r4.zzwz, greaterThan(floatBitsToUint(r1.xxwx), uvec4(0)))).xz;
/*172*/	  r4.xyzw = (textureLod(s_txVertCount_9, r5.xyxx.st, 0.000000)).xyzw;
/*173*/	  r1.y = r4.x * 0.003906;
/*174*/	  r1.z = uintBitsToFloat((r1.y >= -r1.y) ? 0xffffffffu : 0x00000000u);
/*175*/	  r1.y = fract(abs(r1.y));
/*176*/	    r1.y = (floatBitsToUint(r1.z) > 0x00000000u) ? r1.y : -r1.y;
/*177*/	  r1.y = r1.y * 16.000000;
/*178*/	  r1.y = floor(r1.y);
/*179*/	  r1.z = r1.y * 0.062500;
/*180*/	  r2.x = uintBitsToFloat((r1.z >= -r1.z) ? 0xffffffffu : 0x00000000u);
/*181*/	  r1.z = fract(abs(r1.z));
/*182*/	    r1.z = (floatBitsToUint(r2.x) > 0x00000000u) ? r1.z : -r1.z;
/*183*/	  r1.z = uintBitsToFloat((r1.z >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*184*/	    r1.z = (floatBitsToUint(r1.z) > 0x00000000u) ? -8.000000 : -0.000000;
/*185*/	  r1.y = r1.z + r1.y;
/*186*/	  r1.y = r1.y + r2.y;
/*187*/	    r1.x = (floatBitsToUint(r1.x) > 0x00000000u) ? r1.y : r3.z;
/*188*/	    r3.z = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : r1.x;
/*189*/	  r4.xyzw = (textureLod(s_txVertCount_9, r5.zwzz.st, 0.000000)).xyzw;
/*190*/	  r0.x = r4.x * 0.003906;
/*191*/	  r0.y = uintBitsToFloat((r0.x >= -r0.x) ? 0xffffffffu : 0x00000000u);
/*192*/	  r0.x = fract(abs(r0.x));
/*193*/	    r0.x = (floatBitsToUint(r0.y) > 0x00000000u) ? r0.x : -r0.x;
/*194*/	  r0.x = r0.x * 16.000000;
/*195*/	  r0.x = floor(r0.x);
/*196*/	  r0.y = r0.x * 0.062500;
/*197*/	  r1.x = uintBitsToFloat((r0.y >= -r0.y) ? 0xffffffffu : 0x00000000u);
/*198*/	  r0.y = fract(abs(r0.y));
/*199*/	    r0.y = (floatBitsToUint(r1.x) > 0x00000000u) ? r0.y : -r0.y;
/*200*/	  r0.y = uintBitsToFloat((r0.y >= 0.500000) ? 0xffffffffu : 0x00000000u);
/*201*/	    r0.y = (floatBitsToUint(r0.y) > 0x00000000u) ? -8.000000 : -0.000000;
/*202*/	  r0.x = r0.y + r0.x;
/*203*/	  r0.x = r0.x + r2.y;
/*204*/	    r0.x = (floatBitsToUint(r1.w) > 0x00000000u) ? r0.x : r3.w;
/*205*/	    r3.w = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.z : r0.x;
/*206*/	}
/*207*/	r0.xyzw = r3.xyzw * vec4(0.062500, 0.062500, 0.062500, 0.062500);
/*208*/	r1.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r0.xyzw, -r0.xyzw)) * 0xffffffffu);
/*209*/	r0.xyzw = fract(abs(r0.xyzw));
/*210*/	r0.xyzw = mix(-r0.xyzw, r0.xyzw, greaterThan(floatBitsToUint(r1.xyzw), uvec4(0)));
/*211*/	r0.xyzw = r0.xyzw * vec4(16.000000, 16.000000, 16.000000, 16.000000);
/*212*/	r0.xyzw = floor(r0.xyzw);
/*213*/	r0.xy = (r0.xzxx * vec4(16.000000, 16.000000, 0.000000, 0.000000) + r0.ywyy).xy;
/*214*/	color0.xyzw = r0.xxxx;
/*215*/	color1.xyzw = r0.yyyy;
/*216*/	return;
}
