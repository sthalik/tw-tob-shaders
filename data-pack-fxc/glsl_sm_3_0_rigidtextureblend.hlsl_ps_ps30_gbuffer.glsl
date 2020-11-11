//
//
// Shader Model 4
// Fragment Shader
//
// id: 1321 - fxc/glsl_SM_3_0_rigidtextureblend.hlsl_PS_ps30_gbuffer.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C3;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
in vec4 vsOut_C0;
in vec4 vsOut_C1;
in vec4 vsOut_C2;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_normal_map;
uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;
uniform sampler2D sampler4;
uniform sampler2D sampler5;
uniform sampler2D sampler6;
uniform sampler2D sampler7;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform texture_scale
{
  vec4 data[9];
} cb1;
layout(std140) uniform texture_blend_PS
{
  vec4 data[25];
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
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C0.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*1*/	r1.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C0.xyzw)) * 0xffffffffu);
/*2*/	r0.xz = (uintBitsToFloat(floatBitsToUint(r0.xxzx) | floatBitsToUint(r1.xxzx))).xz;
/*3*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r0.ywyy) | floatBitsToUint(r0.xzxx))).xy;
/*4*/	r0.xy = (uintBitsToFloat(floatBitsToUint(r1.ywyy) | floatBitsToUint(r0.xyxx))).xy;
/*5*/	r0.zw = (cb1.data[0].zzzw * vsOut_C0.xxxy + cb1.data[0].xxxy).zw;
/*6*/	r1.xyzw = (texture(sampler0, r0.zwzz.st)).xyzw;
/*7*/	r1.xyzw = mix(r1.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)));
/*8*/	r0.x = -cb2.data[11].w + 1.000000;
/*9*/	r0.x = max(r1.w, r0.x);
/*10*/	r1.xyz = (r1.xyzx * cb2.data[4].xyzx).xyz;
/*11*/	r0.zw = (cb1.data[1].zzzw * vsOut_C0.zzzw + cb1.data[1].xxxy).zw;
/*12*/	r2.xyzw = (texture(sampler1, r0.zwzz.st)).xyzw;
/*13*/	r2.xyzw = mix(r2.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*14*/	r3.xyzw = -cb2.data[12].xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*15*/	r0.y = max(r2.w, r3.x);
/*16*/	r0.x = r0.y * r0.x;
/*17*/	r4.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C1.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*18*/	r5.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C1.xyzw)) * 0xffffffffu);
/*19*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r4.xxzx) | floatBitsToUint(r5.xxzx))).yz;
/*20*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r4.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*21*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r5.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*22*/	r4.xy = (cb1.data[2].zwzz * vsOut_C1.xyxx + cb1.data[2].xyxx).xy;
/*23*/	r4.xyzw = (texture(sampler2, r4.xyxx.st)).xyzw;
/*24*/	r4.xyzw = mix(r4.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*25*/	r0.y = max(r3.y, r4.w);
/*26*/	r0.x = r0.y * r0.x;
/*27*/	r0.yw = (cb1.data[3].zzzw * vsOut_C1.zzzw + cb1.data[3].xxxy).yw;
/*28*/	r5.xyzw = (texture(sampler3, r0.ywyy.st)).xyzw;
/*29*/	r5.xyzw = mix(r5.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*30*/	r0.y = max(r3.z, r5.w);
/*31*/	r0.x = r0.y * r0.x;
/*32*/	r6.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C2.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*33*/	r7.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C2.xyzw)) * 0xffffffffu);
/*34*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r6.xxzx) | floatBitsToUint(r7.xxzx))).yz;
/*35*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r6.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*36*/	r0.yz = (uintBitsToFloat(floatBitsToUint(r7.yywy) | floatBitsToUint(r0.yyzy))).yz;
/*37*/	r3.xy = (cb1.data[4].zwzz * vsOut_C2.xyxx + cb1.data[4].xyxx).xy;
/*38*/	r6.xyzw = (texture(sampler4, r3.xyxx.st)).xyzw;
/*39*/	r6.xyzw = mix(r6.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)));
/*40*/	r0.y = max(r3.w, r6.w);
/*41*/	r0.x = r0.y * r0.x;
/*42*/	r0.yw = (cb1.data[5].zzzw * vsOut_C2.zzzw + cb1.data[5].xxxy).yw;
/*43*/	r3.xyzw = (texture(sampler5, r0.ywyy.st)).xyzw;
/*44*/	r3.xyzw = mix(r3.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*45*/	r0.yzw = (-cb2.data[13].xxyz + vec4(0.000000, 1.000000, 1.000000, 1.000000)).yzw;
/*46*/	r0.y = max(r3.w, r0.y);
/*47*/	r0.x = r0.y * r0.x;
/*48*/	r7.xyzw = uintBitsToFloat(uvec4(lessThan(vsOut_C3.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*49*/	r8.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), vsOut_C3.xyzw)) * 0xffffffffu);
/*50*/	r7.xz = (uintBitsToFloat(floatBitsToUint(r7.xxzx) | floatBitsToUint(r8.xxzx))).xz;
/*51*/	r7.xy = (uintBitsToFloat(floatBitsToUint(r7.ywyy) | floatBitsToUint(r7.xzxx))).xy;
/*52*/	r7.xy = (uintBitsToFloat(floatBitsToUint(r8.ywyy) | floatBitsToUint(r7.xyxx))).xy;
/*53*/	r7.zw = (cb1.data[6].zzzw * vsOut_C3.xxxy + cb1.data[6].xxxy).zw;
/*54*/	r8.xyzw = (texture(sampler6, r7.zwzz.st)).xyzw;
/*55*/	r8.xyzw = mix(r8.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)));
/*56*/	r0.y = max(r0.z, r8.w);
/*57*/	r0.x = r0.y * r0.x;
/*58*/	r0.yz = (cb1.data[7].zzwz * vsOut_C3.zzwz + cb1.data[7].xxyx).yz;
/*59*/	r9.xyzw = (texture(sampler7, r0.yzyy.st)).xyzw;
/*60*/	r7.xyzw = mix(r9.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)));
/*61*/	r0.y = max(r0.w, r7.w);
/*62*/	r0.x = r0.x * r0.y + -0.500000;
/*63*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*64*/	if(r0.x != 0) discard;
/*65*/	color0.xyzw = vec4(0, 0, 0, 0);
/*66*/	r0.xyz = (r2.xyzx * cb2.data[5].xyzx).xyz;
/*67*/	r0.w = max(r2.w, cb2.data[12].x);
/*68*/	r1.w = -cb2.data[0].w + 1.000000;
/*69*/	r2.xyzw = uintBitsToFloat(uvec4(equal(cb2.data[14].xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*70*/	r2.xyzw = mix(vsOut_T4.yyyy, vsOut_T4.xxxx, greaterThan(floatBitsToUint(r2.xyzw), uvec4(0)));
/*71*/	r1.w = uintBitsToFloat((r2.x >= r1.w) ? 0xffffffffu : 0x00000000u);
/*72*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*73*/	r1.w = r1.w * cb2.data[0].z;
/*74*/	r2.x = r0.w * r1.w;
/*75*/	r0.w = -r1.w * r0.w + 1.000000;
/*76*/	r0.xyz = (r0.xyzx * r2.xxxx).xyz;
/*77*/	r0.xyz = (r1.xyzx * r0.wwww + r0.xyzx).xyz;
/*78*/	r1.xyz = (r4.xyzx * cb2.data[6].xyzx).xyz;
/*79*/	r0.w = max(r4.w, cb2.data[12].y);
/*80*/	r4.xy = (-cb2.data[1].ywyy + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*81*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.yzyy, r4.xyxx)) * 0xffffffffu)).xy;
/*82*/	r2.xy = (uintBitsToFloat(floatBitsToUint(r2.xyxx) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0, 0)))).xy;
/*83*/	r2.xy = (r2.xyxx * cb2.data[1].xzxx).xy;
/*84*/	r1.w = r0.w * r2.x;
/*85*/	r0.w = -r2.x * r0.w + 1.000000;
/*86*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*87*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*88*/	r1.xyz = (r5.xyzx * cb2.data[7].xyzx).xyz;
/*89*/	r0.w = max(r5.w, cb2.data[12].z);
/*90*/	r1.w = r0.w * r2.y;
/*91*/	r0.w = -r2.y * r0.w + 1.000000;
/*92*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*93*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*94*/	r1.xyz = (r6.xyzx * cb2.data[8].xyzx).xyz;
/*95*/	r0.w = max(r6.w, cb2.data[12].w);
/*96*/	r2.xy = (-cb2.data[2].ywyy + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*97*/	r1.w = uintBitsToFloat((r2.w >= r2.x) ? 0xffffffffu : 0x00000000u);
/*98*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*99*/	r1.w = r1.w * cb2.data[2].x;
/*100*/	r2.x = r0.w * r1.w;
/*101*/	r0.w = -r1.w * r0.w + 1.000000;
/*102*/	r1.xyz = (r1.xyzx * r2.xxxx).xyz;
/*103*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*104*/	r1.xyz = (r3.xyzx * cb2.data[9].xyzx).xyz;
/*105*/	r0.w = max(r3.w, cb2.data[13].x);
/*106*/	r2.xzw = (uintBitsToFloat(uvec4(equal(cb2.data[15].xxyz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xzw;
/*107*/	r2.xzw = (mix(vsOut_T4.yyyy, vsOut_T4.xxxx, greaterThan(floatBitsToUint(r2.xxzw), uvec4(0)))).xzw;
/*108*/	r1.w = uintBitsToFloat((r2.x >= r2.y) ? 0xffffffffu : 0x00000000u);
/*109*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*110*/	r1.w = r1.w * cb2.data[2].z;
/*111*/	r2.x = r0.w * r1.w;
/*112*/	r0.w = -r1.w * r0.w + 1.000000;
/*113*/	r1.xyz = (r1.xyzx * r2.xxxx).xyz;
/*114*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*115*/	r1.xyz = (r8.xyzx * cb2.data[10].xyzx).xyz;
/*116*/	r0.w = max(r8.w, cb2.data[13].y);
/*117*/	r2.xy = (-cb2.data[3].ywyy + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*118*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, r2.xyxx)) * 0xffffffffu)).xy;
/*119*/	r2.xy = (uintBitsToFloat(floatBitsToUint(r2.xyxx) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0, 0)))).xy;
/*120*/	r2.xy = (r2.xyxx * cb2.data[3].xzxx).xy;
/*121*/	r1.w = r0.w * r2.x;
/*122*/	r0.w = -r2.x * r0.w + 1.000000;
/*123*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*124*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*125*/	r1.xyz = (r7.xyzx * cb2.data[11].xyzx).xyz;
/*126*/	r0.w = max(r7.w, cb2.data[13].z);
/*127*/	r1.w = r0.w * r2.y;
/*128*/	r0.w = -r2.y * r0.w + 1.000000;
/*129*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*130*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*131*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*132*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*133*/	r0.xyz = saturate(vsOut_T5.zzzz * r1.xyzx + r0.xyzx).xyz;
/*134*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*135*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*136*/	r0.xyz = (vsOut_T5.wwww * r1.xyzx + r0.xyzx).xyz;
/*137*/	r1.xyzw = (texture(s_normal_map, vsOut_T4.xyxx.st)).xyzw;
/*138*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*139*/	r1.zw = (r1.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*140*/	r2.xy = (r1.xyxx + r1.xyxx).xy;
/*141*/	r0.w = dot(vec2(r1.zwzz), vec2(r1.zwzz));
/*142*/	r0.w = -r0.w + 1.000000;
/*143*/	r0.w = max(r0.w, 0.000000);
/*144*/	r2.z = sqrt(r0.w);
/*145*/	r1.xyz = (r2.xyzx + vec4(-1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*146*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*147*/	r0.w = inversesqrt(r0.w);
/*148*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*149*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*150*/	r0.w = inversesqrt(r0.w);
/*151*/	r2.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*152*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*153*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*154*/	r0.w = inversesqrt(r0.w);
/*155*/	r3.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*156*/	r1.xyw = (r1.xxxx * r3.xyxz + r2.xyxz).xyw;
/*157*/	r0.w = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*158*/	r0.w = inversesqrt(r0.w);
/*159*/	r2.xyz = (r0.wwww * vsOut_T1.xyzx).xyz;
/*160*/	r1.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*161*/	r2.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*162*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*163*/	r0.w = inversesqrt(r0.w);
/*164*/	r2.xyz = (r2.xyzx * r0.wwww + -cb2.data[16].xyzx).xyz;
/*165*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*166*/	r0.w = inversesqrt(r0.w);
/*167*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*168*/	r0.w = dot(vec3(r1.xyzx), vec3(r2.xyzx));
/*169*/	r1.x = saturate(dot(vec3(r1.xyzx), vec3(-cb2.data[16].xyzx)));
/*170*/	r1.x = r1.x + 0.200000;
/*171*/	r1.y = abs(r0.w) * abs(r0.w);
/*172*/	r1.y = r1.y * r1.y;
/*173*/	r0.w = abs(r0.w) * r1.y;
/*174*/	r1.y = r0.w * 0.050000;
/*175*/	r1.z = dot(vec3(r1.yyyy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*176*/	r0.w = -r0.w * 0.050000 + r1.z;
/*177*/	r0.w = vsOut_T5.w * r0.w + r1.y;
/*178*/	color1.xyz = saturate(r0.xyzx * r1.xxxx + r0.wwww).xyz;
/*179*/	color1.w = 0;
/*180*/	color2.xyzw = vec4(0, 0, 0, 0);
/*181*/	color3.xyzw = vec4(0, 0, 0, 0);
/*182*/	return;
}
