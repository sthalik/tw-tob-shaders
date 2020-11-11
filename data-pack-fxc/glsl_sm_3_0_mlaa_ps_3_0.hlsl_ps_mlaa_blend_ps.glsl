//
//
// Shader Model 4
// Fragment Shader
//
// id: 3856 - fxc/glsl_SM_3_0_MLAA_PS_3_0.hlsl_PS_MLAA_Blend_PS.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

layout(location = 0) out vec4 color0;

uniform sampler2D s_txInitialImage_9;
uniform sampler2D s_txHorzCount_9;
uniform sampler2D s_txVertCount_9;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.zw = (r0.xxxy * cb0.data[27].zzzw).zw;
/*2*/	r1.xyzw = (textureLod(s_txInitialImage_9, r0.zwzz.st, 0.000000)).xyzw;
/*3*/	r2.xyzw = (textureLod(s_txHorzCount_9, r0.zwzz.st, 0.000000)).xyzw;
/*4*/	r2.xyzw = r2.xxxx * vec4(0.003906, 0.003906, 0.062500, 0.062500);
/*5*/	r3.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r2.xyzw, -r2.yyww)) * 0xffffffffu);
/*6*/	r2.xyzw = fract(abs(r2.yyww));
/*7*/	r2.xyzw = mix(-r2.yyww, r2.xyzw, greaterThan(floatBitsToUint(r3.xyzw), uvec4(0)));
/*8*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.wyww, vec4(0.500000, 0.500000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*9*/	r3.x = uintBitsToFloat(floatBitsToUint(r3.y) | floatBitsToUint(r3.x));
/*10*/	if(floatBitsToUint(r3.x) != 0u) {
/*11*/	  r2.xyzw = r2.xyzw * vec4(16.000000, 16.000000, 16.000000, 16.000000);
/*12*/	  r2.xyzw = floor(r2.xyzw);
/*13*/	  r3.xyzw = r2.yyww * vec4(0.062500, 0.062500, 0.062500, 0.062500);
/*14*/	  r4.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r3.xyzw, -r3.yyww)) * 0xffffffffu);
/*15*/	  r3.xyzw = fract(abs(r3.yyww));
/*16*/	  r3.xyzw = mix(-r3.yyww, r3.xyzw, greaterThan(floatBitsToUint(r4.xyzw), uvec4(0)));
/*17*/	  r3.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r3.xyzw, vec4(0.500000, 0.500000, 0.500000, 0.500000))) * 0xffffffffu);
/*18*/	  r3.xyzw = mix(vec4(-0.000000, -0.000000, -0.000000, -0.000000), vec4(-8.000000, -8.000000, -8.000000, -8.000000), greaterThan(floatBitsToUint(r3.xyzw), uvec4(0)));
/*19*/	  r2.xyzw = r2.xyzw + r3.xyzw;
/*20*/	  r3.xy = (r0.xyxx + vec4(0.000000, -1.000000, 0.000000, 0.000000)).xy;
/*21*/	  r3.xy = (r3.xyxx * cb0.data[27].zwzz).xy;
/*22*/	  r3.xyzw = (textureLod(s_txInitialImage_9, r3.xyxx.st, 0.000000)).xyzw;
/*23*/	  r4.x = r2.w + r2.y;
/*24*/	  r4.y = uintBitsToFloat((r4.x == 0.000000) ? 0xffffffffu : 0x00000000u);
/*25*/	  r5.xyzw = -r1.xyzw + r3.xyzw;
/*26*/	  r5.xyzw = r5.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*27*/	  r4.x = r4.x + 1.000000;
/*28*/	  r4.z = r4.x * 0.500000;
/*29*/	  r6.xy = (-r2.yyyy * vec4(1.000000, 0.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*30*/	  r6.xy = (r6.xyxx * cb0.data[27].zwzz).xy;
/*31*/	  r6.xyzw = (textureLod(s_txInitialImage_9, r6.xyxx.st, 0.000000)).xyzw;
/*32*/	  r7.xyzw = r2.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*33*/	  r2.xz = (-r7.xxyx * vec4(1.000000, 0.000000, 0.000000, 0.000000) + r0.xxyx).xz;
/*34*/	  r2.xz = (r2.xxzx * cb0.data[27].zzwz).xz;
/*35*/	  r8.xyzw = (textureLod(s_txInitialImage_9, r2.xzxx.st, 0.000000)).xyzw;
/*36*/	  r6.xyz = (r6.xyzx + -r8.xyzx).xyz;
/*37*/	  r6.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.062500, 0.062500, 0.000000), abs(r6.xyzx))) * 0xffffffffu)).xyz;
/*38*/	  r2.x = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*39*/	  r2.x = uintBitsToFloat(floatBitsToUint(r6.z) | floatBitsToUint(r2.x));
/*40*/	  r2.z = uintBitsToFloat(floatBitsToUint(r2.x) & uint(1));
/*41*/	  r6.xy = (r2.wwww * vec4(1.000000, 0.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*42*/	  r6.xy = (r6.xyxx * cb0.data[27].zwzz).xy;
/*43*/	  r6.xyzw = (textureLod(s_txInitialImage_9, r6.xyxx.st, 0.000000)).xyzw;
/*44*/	  r7.xy = (r7.zwzz * vec4(1.000000, 0.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*45*/	  r7.xy = (r7.xyxx * cb0.data[27].zwzz).xy;
/*46*/	  r7.xyzw = (textureLod(s_txInitialImage_9, r7.xyxx.st, 0.000000)).xyzw;
/*47*/	  r6.xyz = (r6.xyzx + -r7.xyzx).xyz;
/*48*/	  r6.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.062500, 0.062500, 0.000000), abs(r6.xyzx))) * 0xffffffffu)).xyz;
/*49*/	  r2.w = uintBitsToFloat(floatBitsToUint(r6.y) | floatBitsToUint(r6.x));
/*50*/	  r2.w = uintBitsToFloat(floatBitsToUint(r6.z) | floatBitsToUint(r2.w));
/*51*/	    r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*52*/	    r2.x = (floatBitsToUint(r2.w) > 0x00000000u) ? r2.x : r2.z;
/*53*/	  r2.xzw = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r2.xxxx), ivec4(ivec4(2, 0, 1, 3)))) * 0xffffffffu) /**/).xzw;
/*54*/	  r4.w = uintBitsToFloat((r2.y >= r4.z) ? 0xffffffffu : 0x00000000u);
/*55*/	  r4.z = uintBitsToFloat((r4.z >= r2.y) ? 0xffffffffu : 0x00000000u);
/*56*/	  r2.xz = (uintBitsToFloat(floatBitsToUint(r2.xxzx) & floatBitsToUint(r4.wwzw))).xz;
/*57*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.z) | floatBitsToUint(r2.x));
/*58*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.w) | floatBitsToUint(r2.x));
/*59*/	  r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.x)).z;
/*60*/	  r2.y = -r2.y + r4.x;
/*61*/	  r2.w = r2.z * r2.y + -0.500000;
/*62*/	  r2.y = r2.y + -1.000000;
/*63*/	  r2.y = r2.z * r2.y + -0.500000;
/*64*/	  r2.y = abs(r2.y) + abs(r2.w);
/*65*/	  r2.y = r2.y * 0.500000;
/*66*/	  r6.xyzw = r1.xyzw * r1.xyzw;
/*67*/	  r3.xyzw = r3.xyzw * r3.xyzw + -r6.xyzw;
/*68*/	  r3.xyzw = r2.yyyy * r3.xyzw + r6.xyzw;
/*69*/	  r3.xyzw = sqrt(r3.xyzw);
/*70*/	  r2.xyzw = mix(r1.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*71*/	  r1.xyzw = mix(r2.xyzw, r5.xyzw, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)));
/*72*/	}
/*73*/	r2.xyzw = r0.xyxy + vec4(-0.000000, 1.000000, -1.000000, -0.000000);
/*74*/	r3.xyzw = r2.xyzw * cb0.data[27].zwzw;
/*75*/	r4.xyzw = (textureLod(s_txHorzCount_9, r3.xyxx.st, 0.000000)).xyzw;
/*76*/	r4.xyzw = r4.xxxx * vec4(0.003906, 0.003906, 0.062500, 0.062500);
/*77*/	r5.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r4.xyzw, -r4.yyww)) * 0xffffffffu);
/*78*/	r4.xyzw = fract(abs(r4.yyww));
/*79*/	r4.xyzw = mix(-r4.yyww, r4.xyzw, greaterThan(floatBitsToUint(r5.xyzw), uvec4(0)));
/*80*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.wyww, vec4(0.500000, 0.500000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*81*/	r5.x = uintBitsToFloat(floatBitsToUint(r5.y) | floatBitsToUint(r5.x));
/*82*/	if(floatBitsToUint(r5.x) != 0u) {
/*83*/	  r4.xyzw = r4.xyzw * vec4(16.000000, 16.000000, 16.000000, 16.000000);
/*84*/	  r4.xyzw = floor(r4.xyzw);
/*85*/	  r5.xyzw = r4.yyww * vec4(0.062500, 0.062500, 0.062500, 0.062500);
/*86*/	  r6.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r5.xyzw, -r5.yyww)) * 0xffffffffu);
/*87*/	  r5.xyzw = fract(abs(r5.yyww));
/*88*/	  r5.xyzw = mix(-r5.yyww, r5.xyzw, greaterThan(floatBitsToUint(r6.xyzw), uvec4(0)));
/*89*/	  r5.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r5.xyzw, vec4(0.500000, 0.500000, 0.500000, 0.500000))) * 0xffffffffu);
/*90*/	  r5.xyzw = mix(vec4(-0.000000, -0.000000, -0.000000, -0.000000), vec4(-8.000000, -8.000000, -8.000000, -8.000000), greaterThan(floatBitsToUint(r5.xyzw), uvec4(0)));
/*91*/	  r4.xyzw = r4.xyzw + r5.xyzw;
/*92*/	  r5.xyzw = (textureLod(s_txInitialImage_9, r3.xyxx.st, 0.000000)).xyzw;
/*93*/	  r3.x = r4.w + r4.y;
/*94*/	  r3.y = uintBitsToFloat((r3.x == 0.000000) ? 0xffffffffu : 0x00000000u);
/*95*/	  r6.xyzw = -r1.xyzw + r5.xyzw;
/*96*/	  r6.xyzw = r6.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*97*/	  r3.x = r3.x + 1.000000;
/*98*/	  r7.x = r3.x * 0.500000;
/*99*/	  r7.yz = (-r4.yyyy * vec4(0.000000, 1.000000, 0.000000, 0.000000) + r2.xxyx).yz;
/*100*/	  r7.yz = (r7.yyzy * cb0.data[27].zzwz).yz;
/*101*/	  r8.xyzw = (textureLod(s_txInitialImage_9, r7.yzyy.st, 0.000000)).xyzw;
/*102*/	  r9.xyzw = r4.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*103*/	  r4.xz = (-r9.xxyx * vec4(1.000000, 0.000000, 0.000000, 0.000000) + r2.xxyx).xz;
/*104*/	  r4.xz = (r4.xxzx * cb0.data[27].zzwz).xz;
/*105*/	  r10.xyzw = (textureLod(s_txInitialImage_9, r4.xzxx.st, 0.000000)).xyzw;
/*106*/	  r7.yzw = (r8.xxyz + -r10.xxyz).yzw;
/*107*/	  r7.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r7.yyzw))) * 0xffffffffu)).yzw;
/*108*/	  r4.x = uintBitsToFloat(floatBitsToUint(r7.z) | floatBitsToUint(r7.y));
/*109*/	  r4.x = uintBitsToFloat(floatBitsToUint(r7.w) | floatBitsToUint(r4.x));
/*110*/	  r4.z = uintBitsToFloat(floatBitsToUint(r4.x) & uint(1));
/*111*/	  r7.yz = (r4.wwww * vec4(0.000000, 1.000000, 0.000000, 0.000000) + r2.xxyx).yz;
/*112*/	  r7.yz = (r7.yyzy * cb0.data[27].zzwz).yz;
/*113*/	  r8.xyzw = (textureLod(s_txInitialImage_9, r7.yzyy.st, 0.000000)).xyzw;
/*114*/	  r2.xy = (r9.zwzz * vec4(1.000000, 0.000000, 0.000000, 0.000000) + r2.xyxx).xy;
/*115*/	  r2.xy = (r2.xyxx * cb0.data[27].zwzz).xy;
/*116*/	  r9.xyzw = (textureLod(s_txInitialImage_9, r2.xyxx.st, 0.000000)).xyzw;
/*117*/	  r7.yzw = (r8.xxyz + -r9.xxyz).yzw;
/*118*/	  r7.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r7.yyzw))) * 0xffffffffu)).yzw;
/*119*/	  r2.x = uintBitsToFloat(floatBitsToUint(r7.z) | floatBitsToUint(r7.y));
/*120*/	  r2.x = uintBitsToFloat(floatBitsToUint(r7.w) | floatBitsToUint(r2.x));
/*121*/	    r2.y = (floatBitsToUint(r4.x) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*122*/	    r2.x = (floatBitsToUint(r2.x) > 0x00000000u) ? r2.y : r4.z;
/*123*/	  r4.xzw = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r2.xxxx), ivec4(ivec4(2, 0, 1, 0)))) * 0xffffffffu) /**/).xzw;
/*124*/	  r2.x = uintBitsToFloat((r7.x >= r4.y) ? 0xffffffffu : 0x00000000u);
/*125*/	  r2.y = uintBitsToFloat((r4.y >= r7.x) ? 0xffffffffu : 0x00000000u);
/*126*/	  r2.xy = (uintBitsToFloat(floatBitsToUint(r2.xyxx) & floatBitsToUint(r4.xzxx))).xy;
/*127*/	  r2.x = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r2.x));
/*128*/	  r2.x = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r2.x));
/*129*/	  r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).y;
/*130*/	  r3.x = -r4.y + r3.x;
/*131*/	  r4.x = r2.y * r3.x + -0.500000;
/*132*/	  r3.x = r3.x + -1.000000;
/*133*/	  r2.y = r2.y * r3.x + -0.500000;
/*134*/	  r2.y = abs(r2.y) + abs(r4.x);
/*135*/	  r2.y = r2.y * 0.500000;
/*136*/	  r4.xyzw = r1.xyzw * r1.xyzw;
/*137*/	  r5.xyzw = r5.xyzw * r5.xyzw + -r4.xyzw;
/*138*/	  r4.xyzw = r2.yyyy * r5.xyzw + r4.xyzw;
/*139*/	  r4.xyzw = sqrt(r4.xyzw);
/*140*/	  r4.xyzw = mix(r1.xyzw, r4.xyzw, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)));
/*141*/	  r1.xyzw = mix(r4.xyzw, r6.xyzw, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*142*/	}
/*143*/	r4.xyzw = (textureLod(s_txVertCount_9, r0.zwzz.st, 0.000000)).xyzw;
/*144*/	r4.xyzw = r4.xxxx * vec4(0.003906, 0.003906, 0.062500, 0.062500);
/*145*/	r5.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r4.xyzw, -r4.yyww)) * 0xffffffffu);
/*146*/	r4.xyzw = fract(abs(r4.yyww));
/*147*/	r4.xyzw = mix(-r4.yyww, r4.xyzw, greaterThan(floatBitsToUint(r5.xyzw), uvec4(0)));
/*148*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.wwwy, vec4(0.000000, 0.000000, 0.500000, 0.500000))) * 0xffffffffu)).zw;
/*149*/	r0.z = uintBitsToFloat(floatBitsToUint(r0.w) | floatBitsToUint(r0.z));
/*150*/	if(floatBitsToUint(r0.z) != 0u) {
/*151*/	  r4.xyzw = r4.xyzw * vec4(16.000000, 16.000000, 16.000000, 16.000000);
/*152*/	  r4.xyzw = floor(r4.xyzw);
/*153*/	  r5.xyzw = r4.yyww * vec4(0.062500, 0.062500, 0.062500, 0.062500);
/*154*/	  r6.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r5.xyzw, -r5.yyww)) * 0xffffffffu);
/*155*/	  r5.xyzw = fract(abs(r5.yyww));
/*156*/	  r5.xyzw = mix(-r5.yyww, r5.xyzw, greaterThan(floatBitsToUint(r6.xyzw), uvec4(0)));
/*157*/	  r5.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r5.xyzw, vec4(0.500000, 0.500000, 0.500000, 0.500000))) * 0xffffffffu);
/*158*/	  r5.xyzw = mix(vec4(-0.000000, -0.000000, -0.000000, -0.000000), vec4(-8.000000, -8.000000, -8.000000, -8.000000), greaterThan(floatBitsToUint(r5.xyzw), uvec4(0)));
/*159*/	  r4.xyzw = r4.xyzw + r5.xyzw;
/*160*/	  r0.zw = (r0.xxxy + vec4(0.000000, 0.000000, 1.000000, 0.000000)).zw;
/*161*/	  r0.zw = (r0.zzzw * cb0.data[27].zzzw).zw;
/*162*/	  r5.xyzw = (textureLod(s_txInitialImage_9, r0.zwzz.st, 0.000000)).xyzw;
/*163*/	  r0.z = r4.w + r4.y;
/*164*/	  r0.w = uintBitsToFloat((r0.z == 0.000000) ? 0xffffffffu : 0x00000000u);
/*165*/	  r6.xyzw = -r1.xyzw + r5.xyzw;
/*166*/	  r6.xyzw = r6.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*167*/	  r0.z = r0.z + 1.000000;
/*168*/	  r2.x = r0.z * 0.500000;
/*169*/	  r3.xy = (-r4.yyyy * vec4(0.000000, -1.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*170*/	  r3.xy = (r3.xyxx * cb0.data[27].zwzz).xy;
/*171*/	  r7.xyzw = (textureLod(s_txInitialImage_9, r3.xyxx.st, 0.000000)).xyzw;
/*172*/	  r8.xyzw = r4.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*173*/	  r3.xy = (-r8.xyxx * vec4(0.000000, -1.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*174*/	  r3.xy = (r3.xyxx * cb0.data[27].zwzz).xy;
/*175*/	  r9.xyzw = (textureLod(s_txInitialImage_9, r3.xyxx.st, 0.000000)).xyzw;
/*176*/	  r7.xyz = (r7.xyzx + -r9.xyzx).xyz;
/*177*/	  r7.xyz = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.062500, 0.062500, 0.000000), abs(r7.xyzx))) * 0xffffffffu)).xyz;
/*178*/	  r2.y = uintBitsToFloat(floatBitsToUint(r7.y) | floatBitsToUint(r7.x));
/*179*/	  r2.y = uintBitsToFloat(floatBitsToUint(r7.z) | floatBitsToUint(r2.y));
/*180*/	  r3.x = uintBitsToFloat(floatBitsToUint(r2.y) & uint(1));
/*181*/	  r4.xz = (r4.wwww * vec4(0.000000, 0.000000, -1.000000, 0.000000) + r0.xxyx).xz;
/*182*/	  r4.xz = (r4.xxzx * cb0.data[27].zzwz).xz;
/*183*/	  r7.xyzw = (textureLod(s_txInitialImage_9, r4.xzxx.st, 0.000000)).xyzw;
/*184*/	  r0.xy = (r8.zwzz * vec4(0.000000, -1.000000, 0.000000, 0.000000) + r0.xyxx).xy;
/*185*/	  r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*186*/	  r8.xyzw = (textureLod(s_txInitialImage_9, r0.xyxx.st, 0.000000)).xyzw;
/*187*/	  r4.xzw = (r7.xxyz + -r8.xxyz).xzw;
/*188*/	  r4.xzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.062500, 0.000000, 0.062500, 0.062500), abs(r4.xxzw))) * 0xffffffffu)).xzw;
/*189*/	  r0.x = uintBitsToFloat(floatBitsToUint(r4.z) | floatBitsToUint(r4.x));
/*190*/	  r0.x = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r0.x));
/*191*/	    r0.y = (floatBitsToUint(r2.y) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*192*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? r0.y : r3.x;
/*193*/	  r4.xzw = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r0.xxxx), ivec4(ivec4(2, 0, 1, 3)))) * 0xffffffffu) /**/).xzw;
/*194*/	  r0.x = uintBitsToFloat((r4.y >= r2.x) ? 0xffffffffu : 0x00000000u);
/*195*/	  r0.y = uintBitsToFloat((r2.x >= r4.y) ? 0xffffffffu : 0x00000000u);
/*196*/	  r0.xy = (uintBitsToFloat(floatBitsToUint(r0.xyxx) & floatBitsToUint(r4.xzxx))).xy;
/*197*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.y) | floatBitsToUint(r0.x));
/*198*/	  r0.x = uintBitsToFloat(floatBitsToUint(r4.w) | floatBitsToUint(r0.x));
/*199*/	  r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).y;
/*200*/	  r0.z = -r4.y + r0.z;
/*201*/	  r2.x = r0.y * r0.z + -0.500000;
/*202*/	  r0.z = r0.z + -1.000000;
/*203*/	  r0.y = r0.y * r0.z + -0.500000;
/*204*/	  r0.y = abs(r0.y) + abs(r2.x);
/*205*/	  r0.y = r0.y * 0.500000;
/*206*/	  r4.xyzw = r1.xyzw * r1.xyzw;
/*207*/	  r5.xyzw = r5.xyzw * r5.xyzw + -r4.xyzw;
/*208*/	  r4.xyzw = r0.yyyy * r5.xyzw + r4.xyzw;
/*209*/	  r4.xyzw = sqrt(r4.xyzw);
/*210*/	  r4.xyzw = mix(r1.xyzw, r4.xyzw, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)));
/*211*/	  r1.xyzw = mix(r4.xyzw, r6.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*212*/	}
/*213*/	r0.xyzw = (textureLod(s_txVertCount_9, r3.zwzz.st, 0.000000)).xyzw;
/*214*/	r0.xyzw = r0.xxxx * vec4(0.003906, 0.003906, 0.062500, 0.062500);
/*215*/	r4.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r0.xyzw, -r0.yyww)) * 0xffffffffu);
/*216*/	r0.xyzw = fract(abs(r0.yyww));
/*217*/	r0.xyzw = mix(-r0.yyww, r0.xyzw, greaterThan(floatBitsToUint(r4.xyzw), uvec4(0)));
/*218*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r0.wyww, vec4(0.500000, 0.500000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*219*/	r2.x = uintBitsToFloat(floatBitsToUint(r2.y) | floatBitsToUint(r2.x));
/*220*/	if(floatBitsToUint(r2.x) != 0u) {
/*221*/	  r0.xyzw = r0.xyzw * vec4(16.000000, 16.000000, 16.000000, 16.000000);
/*222*/	  r0.xyzw = floor(r0.xyzw);
/*223*/	  r4.xyzw = r0.yyww * vec4(0.062500, 0.062500, 0.062500, 0.062500);
/*224*/	  r5.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r4.xyzw, -r4.yyww)) * 0xffffffffu);
/*225*/	  r4.xyzw = fract(abs(r4.yyww));
/*226*/	  r4.xyzw = mix(-r4.yyww, r4.xyzw, greaterThan(floatBitsToUint(r5.xyzw), uvec4(0)));
/*227*/	  r4.xyzw = uintBitsToFloat(uvec4(greaterThanEqual(r4.xyzw, vec4(0.500000, 0.500000, 0.500000, 0.500000))) * 0xffffffffu);
/*228*/	  r4.xyzw = mix(vec4(-0.000000, -0.000000, -0.000000, -0.000000), vec4(-8.000000, -8.000000, -8.000000, -8.000000), greaterThan(floatBitsToUint(r4.xyzw), uvec4(0)));
/*229*/	  r0.xyzw = r0.xyzw + r4.xyzw;
/*230*/	  r3.xyzw = (textureLod(s_txInitialImage_9, r3.zwzz.st, 0.000000)).xyzw;
/*231*/	  r2.x = r0.w + r0.y;
/*232*/	  r2.y = uintBitsToFloat((r2.x == 0.000000) ? 0xffffffffu : 0x00000000u);
/*233*/	  r4.xyzw = -r1.xyzw + r3.xyzw;
/*234*/	  r4.xyzw = r4.xyzw * vec4(0.125000, 0.125000, 0.125000, 0.125000) + r1.xyzw;
/*235*/	  r2.x = r2.x + 1.000000;
/*236*/	  r5.x = r2.x * 0.500000;
/*237*/	  r5.yz = (-r0.yyyy * vec4(0.000000, 0.000000, -1.000000, 0.000000) + r2.zzwz).yz;
/*238*/	  r5.yz = (r5.yyzy * cb0.data[27].zzwz).yz;
/*239*/	  r6.xyzw = (textureLod(s_txInitialImage_9, r5.yzyy.st, 0.000000)).xyzw;
/*240*/	  r7.xyzw = r0.xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*241*/	  r0.xz = (-r7.xxyx * vec4(0.000000, 0.000000, -1.000000, 0.000000) + r2.zzwz).xz;
/*242*/	  r0.xz = (r0.xxzx * cb0.data[27].zzwz).xz;
/*243*/	  r8.xyzw = (textureLod(s_txInitialImage_9, r0.xzxx.st, 0.000000)).xyzw;
/*244*/	  r5.yzw = (r6.xxyz + -r8.xxyz).yzw;
/*245*/	  r5.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r5.yyzw))) * 0xffffffffu)).yzw;
/*246*/	  r0.x = uintBitsToFloat(floatBitsToUint(r5.z) | floatBitsToUint(r5.y));
/*247*/	  r0.x = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r0.x));
/*248*/	  r0.z = uintBitsToFloat(floatBitsToUint(r0.x) & uint(1));
/*249*/	  r5.yz = (r0.wwww * vec4(0.000000, 0.000000, -1.000000, 0.000000) + r2.zzwz).yz;
/*250*/	  r5.yz = (r5.yyzy * cb0.data[27].zzwz).yz;
/*251*/	  r6.xyzw = (textureLod(s_txInitialImage_9, r5.yzyy.st, 0.000000)).xyzw;
/*252*/	  r2.zw = (r7.zzzw * vec4(0.000000, 0.000000, 0.000000, -1.000000) + r2.zzzw).zw;
/*253*/	  r2.zw = (r2.zzzw * cb0.data[27].zzzw).zw;
/*254*/	  r7.xyzw = (textureLod(s_txInitialImage_9, r2.zwzz.st, 0.000000)).xyzw;
/*255*/	  r5.yzw = (r6.xxyz + -r7.xxyz).yzw;
/*256*/	  r5.yzw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.062500, 0.062500, 0.062500), abs(r5.yyzw))) * 0xffffffffu)).yzw;
/*257*/	  r0.w = uintBitsToFloat(floatBitsToUint(r5.z) | floatBitsToUint(r5.y));
/*258*/	  r0.w = uintBitsToFloat(floatBitsToUint(r5.w) | floatBitsToUint(r0.w));
/*259*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? intBitsToFloat(3) : intBitsToFloat(2);
/*260*/	    r0.x = (floatBitsToUint(r0.w) > 0x00000000u) ? r0.x : r0.z;
/*261*/	  r0.xzw = (uintBitsToFloat(uvec4(equal(floatBitsToInt(r0.xxxx), ivec4(ivec4(2, 0, 1, 0)))) * 0xffffffffu) /**/).xzw;
/*262*/	  r2.z = uintBitsToFloat((r5.x >= r0.y) ? 0xffffffffu : 0x00000000u);
/*263*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r2.z));
/*264*/	  r2.z = uintBitsToFloat((r0.y >= r5.x) ? 0xffffffffu : 0x00000000u);
/*265*/	  r0.z = uintBitsToFloat(floatBitsToUint(r0.z) & floatBitsToUint(r2.z));
/*266*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.z) | floatBitsToUint(r0.x));
/*267*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.w) | floatBitsToUint(r0.x));
/*268*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).z;
/*269*/	  r0.y = -r0.y + r2.x;
/*270*/	  r0.w = r0.z * r0.y + -0.500000;
/*271*/	  r0.y = r0.y + -1.000000;
/*272*/	  r0.y = r0.z * r0.y + -0.500000;
/*273*/	  r0.y = abs(r0.y) + abs(r0.w);
/*274*/	  r0.y = r0.y * 0.500000;
/*275*/	  r5.xyzw = r1.xyzw * r1.xyzw;
/*276*/	  r3.xyzw = r3.xyzw * r3.xyzw + -r5.xyzw;
/*277*/	  r3.xyzw = r0.yyyy * r3.xyzw + r5.xyzw;
/*278*/	  r3.xyzw = sqrt(r3.xyzw);
/*279*/	  r0.xyzw = mix(r1.xyzw, r3.xyzw, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)));
/*280*/	  color0.xyzw = mix(r0.xyzw, r4.xyzw, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)));
/*281*/	} else {
/*282*/	  color0.xyzw = r1.xyzw;
/*283*/	}
/*284*/	return;
}
