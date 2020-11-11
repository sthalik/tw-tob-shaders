//
//
// Shader Model 4
// Fragment Shader
//
// id: 1326 - fxc/glsl_SM_3_0_rigidtextureblendwind.hlsl_PS_ps30_alpha_overlay.glsl
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

uniform sampler2D normal0_sampler;
uniform sampler2D normal1_sampler;
uniform sampler2D sampler7;
uniform samplerCube s_sky;
uniform sampler2D s_normal_map;
uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;
uniform sampler2D sampler4;
uniform sampler2D sampler5;
uniform sampler2D sampler6;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb2;
layout(std140) uniform texture_scale
{
  vec4 data[9];
} cb3;
layout(std140) uniform texture_blend_PS
{
  vec4 data[25];
} cb4;

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

/*0*/	r0.x = cb0.data[26].x + cb3.data[8].x;
/*1*/	r1.xyzw = r0.xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*2*/	r0.xyz = (r0.xxxx * vec4(2.500000, 0.300000, 0.870000, 0.000000)).xyz;
/*3*/	r0.xyz = sin(vec3(r0.xyzx));
/*4*/	r2.xyz = sin(vec3(r1.xyzx));
/*5*/	r0.w = r2.y * r2.x;
/*6*/	r0.w = r2.z * r0.w;
/*7*/	r0.w = r0.w * 0.500000 + 1.000000;
/*8*/	r0.w = r0.w * 0.800000 + r1.w;
/*9*/	r1.xz = (r0.wwww * vec4(0.200000, 0.000000, 0.200000, 0.000000) + vsOut_T4.xxyx).xz;
/*10*/	r2.xyzw = (texture(normal0_sampler, r1.xzxx.st)).xyzw;
/*11*/	r1.xz = (r2.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*12*/	r2.xy = (r1.xzxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*13*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*14*/	r0.w = -r0.w + 1.000000;
/*15*/	r0.w = max(r0.w, 0.000000);
/*16*/	r2.z = sqrt(r0.w);
/*17*/	r0.x = r0.y * r0.x;
/*18*/	r0.x = r0.z * r0.x;
/*19*/	r0.x = r0.x * 0.500000 + 1.000000;
/*20*/	r0.y = r0.x * 0.400000;
/*21*/	r0.x = r0.x * 0.500000 + r1.y;
/*22*/	r0.xz = (r0.xxxx * vec4(0.500000, 0.000000, 0.200000, 0.000000) + vsOut_T4.xxyx).xz;
/*23*/	r1.xyzw = (texture(normal1_sampler, r0.xzxx.st)).xyzw;
/*24*/	r0.xz = (r1.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*25*/	r0.xz = (r0.xxzx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*26*/	r1.xy = (r0.yyyy * r0.xzxx).xy;
/*27*/	r0.x = dot(vec2(r0.xzxx), vec2(r0.xzxx));
/*28*/	r0.x = -r0.x + 1.000000;
/*29*/	r0.x = max(r0.x, 0.000000);
/*30*/	r1.z = sqrt(r0.x);
/*31*/	r0.xyz = (r1.xyzx + r2.xyzx).xyz;
/*32*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*33*/	r0.w = inversesqrt(r0.w);
/*34*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*35*/	r1.xyzw = r0.xyxy * vec4(0.500000, 0.500000, 0.500000, 0.500000) + vec4(0.500000, 0.500000, 0.500000, 0.500000);
/*36*/	r0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, -0.500000, 0.000000)).xyz;
/*37*/	r0.xyz = (vsOut_T5.xxxx * r0.xyzx + vec4(0.000000, 0.000000, 1.000000, 0.000000)).xyz;
/*38*/	r1.xyzw = r1.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(-1.000000, -1.000000, -1.000000, -1.000000);
/*39*/	r1.xyzw = r1.xyzw * vec4(0.020000, 0.020000, 0.020000, 0.020000);
/*40*/	r1.xyzw = r1.xyzw * vsOut_T5.xxxx;
/*41*/	r2.xyzw = r1.zwzw * vsOut_T5.yyyy + vsOut_C0.xyzw;
/*42*/	r3.xyzw = uintBitsToFloat(uvec4(lessThan(r2.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*43*/	r4.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), r2.xyzw)) * 0xffffffffu);
/*44*/	r3.xz = (uintBitsToFloat(floatBitsToUint(r3.xxzx) | floatBitsToUint(r4.xxzx))).xz;
/*45*/	r3.xy = (uintBitsToFloat(floatBitsToUint(r3.ywyy) | floatBitsToUint(r3.xzxx))).xy;
/*46*/	r3.xy = (uintBitsToFloat(floatBitsToUint(r4.ywyy) | floatBitsToUint(r3.xyxx))).xy;
/*47*/	r2.xy = (cb3.data[0].zwzz * r2.xyxx + cb3.data[0].xyxx).xy;
/*48*/	r2.zw = (cb3.data[1].zzzw * r2.zzzw + cb3.data[1].xxxy).zw;
/*49*/	r4.xyzw = (texture(sampler1, r2.zwzz.st)).xyzw;
/*50*/	r4.xyzw = mix(r4.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*51*/	r2.xyzw = (texture(sampler0, r2.xyxx.st)).xyzw;
/*52*/	r2.xyzw = mix(r2.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)));
/*53*/	r0.w = -cb4.data[11].w + 1.000000;
/*54*/	r0.w = max(r2.w, r0.w);
/*55*/	r3.xyzw = -cb4.data[12].xyzw + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*56*/	r3.x = max(r4.w, r3.x);
/*57*/	r0.w = r0.w * r3.x;
/*58*/	r5.xyzw = r1.zwzw * vsOut_T5.yyyy + vsOut_C1.xyzw;
/*59*/	r6.xyzw = uintBitsToFloat(uvec4(lessThan(r5.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*60*/	r7.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), r5.xyzw)) * 0xffffffffu);
/*61*/	r6.xz = (uintBitsToFloat(floatBitsToUint(r6.xxzx) | floatBitsToUint(r7.xxzx))).xz;
/*62*/	r6.xy = (uintBitsToFloat(floatBitsToUint(r6.ywyy) | floatBitsToUint(r6.xzxx))).xy;
/*63*/	r6.xy = (uintBitsToFloat(floatBitsToUint(r7.ywyy) | floatBitsToUint(r6.xyxx))).xy;
/*64*/	r5.xy = (cb3.data[2].zwzz * r5.xyxx + cb3.data[2].xyxx).xy;
/*65*/	r5.zw = (cb3.data[3].zzzw * r5.zzzw + cb3.data[3].xxxy).zw;
/*66*/	r7.xyzw = (texture(sampler3, r5.zwzz.st)).xyzw;
/*67*/	r7.xyzw = mix(r7.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)));
/*68*/	r5.xyzw = (texture(sampler2, r5.xyxx.st)).xyzw;
/*69*/	r5.xyzw = mix(r5.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)));
/*70*/	r3.x = max(r3.y, r5.w);
/*71*/	r0.w = r0.w * r3.x;
/*72*/	r3.x = max(r3.z, r7.w);
/*73*/	r0.w = r0.w * r3.x;
/*74*/	r6.xyzw = r1.zwzw * vsOut_T5.yyyy + vsOut_C2.xyzw;
/*75*/	r8.xyzw = uintBitsToFloat(uvec4(lessThan(r6.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*76*/	r9.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), r6.xyzw)) * 0xffffffffu);
/*77*/	r3.xy = (uintBitsToFloat(floatBitsToUint(r8.xzxx) | floatBitsToUint(r9.xzxx))).xy;
/*78*/	r3.xy = (uintBitsToFloat(floatBitsToUint(r8.ywyy) | floatBitsToUint(r3.xyxx))).xy;
/*79*/	r3.xy = (uintBitsToFloat(floatBitsToUint(r9.ywyy) | floatBitsToUint(r3.xyxx))).xy;
/*80*/	r6.xy = (cb3.data[4].zwzz * r6.xyxx + cb3.data[4].xyxx).xy;
/*81*/	r6.zw = (cb3.data[5].zzzw * r6.zzzw + cb3.data[5].xxxy).zw;
/*82*/	r8.xyzw = (texture(sampler5, r6.zwzz.st)).xyzw;
/*83*/	r8.xyzw = mix(r8.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)));
/*84*/	r6.xyzw = (texture(sampler4, r6.xyxx.st)).xyzw;
/*85*/	r6.xyzw = mix(r6.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)));
/*86*/	r3.x = max(r3.w, r6.w);
/*87*/	r0.w = r0.w * r3.x;
/*88*/	r3.xyz = (-cb4.data[13].xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*89*/	r3.x = max(r8.w, r3.x);
/*90*/	r0.w = r0.w * r3.x;
/*91*/	r9.xyzw = r1.xyzw * vsOut_T5.yyyy + vsOut_C3.xyzw;
/*92*/	r1.xy = (r1.zwzz * vsOut_T5.yyyy + vsOut_T4.xyxx).xy;
/*93*/	r1.xyzw = (texture(s_normal_map, r1.xyxx.st)).xyzw;
/*94*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*95*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*96*/	r10.xyzw = uintBitsToFloat(uvec4(lessThan(r9.xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*97*/	r11.xyzw = uintBitsToFloat(uvec4(lessThan(vec4(1.000000, 1.000000, 1.000000, 1.000000), r9.xyzw)) * 0xffffffffu);
/*98*/	r3.xw = (uintBitsToFloat(floatBitsToUint(r10.xxxz) | floatBitsToUint(r11.xxxz))).xw;
/*99*/	r3.xw = (uintBitsToFloat(floatBitsToUint(r10.yyyw) | floatBitsToUint(r3.xxxw))).xw;
/*100*/	r3.xw = (uintBitsToFloat(floatBitsToUint(r11.yyyw) | floatBitsToUint(r3.xxxw))).xw;
/*101*/	r9.xy = (cb3.data[6].zwzz * r9.xyxx + cb3.data[6].xyxx).xy;
/*102*/	r9.zw = (cb3.data[7].zzzw * r9.zzzw + cb3.data[7].xxxy).zw;
/*103*/	r10.xyzw = (texture(sampler7, r9.zwzz.st)).xyzw;
/*104*/	r10.xyzw = mix(r10.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*105*/	r9.xyzw = (texture(sampler6, r9.xyxx.st)).xyzw;
/*106*/	r9.xyzw = mix(r9.xyzw, vec4(1.000000, 1.000000, 1.000000, 0), greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)));
/*107*/	r1.w = max(r3.y, r9.w);
/*108*/	r3.x = max(r3.z, r10.w);
/*109*/	r0.w = r0.w * r1.w;
/*110*/	r0.w = r0.w * r3.x + -0.500000;
/*111*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*112*/	if(r0.w != 0) discard;
/*113*/	r2.xyz = (r2.xyzx * cb4.data[4].xyzx).xyz;
/*114*/	color0.w = r2.w * vsOut_T2.w;
/*115*/	r3.xyz = (r4.xyzx * cb4.data[5].xyzx).xyz;
/*116*/	r0.w = max(r4.w, cb4.data[12].x);
/*117*/	r1.w = -cb4.data[0].w + 1.000000;
/*118*/	r4.xyzw = uintBitsToFloat(uvec4(equal(cb4.data[14].xyzw, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu);
/*119*/	r4.xyzw = mix(vsOut_T4.yyyy, vsOut_T4.xxxx, greaterThan(floatBitsToUint(r4.xyzw), uvec4(0)));
/*120*/	r1.w = uintBitsToFloat((r4.x >= r1.w) ? 0xffffffffu : 0x00000000u);
/*121*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*122*/	r1.w = r1.w * cb4.data[0].z;
/*123*/	r2.w = r0.w * r1.w;
/*124*/	r0.w = -r1.w * r0.w + 1.000000;
/*125*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*126*/	r2.xyz = (r2.xyzx * r0.wwww + r3.xyzx).xyz;
/*127*/	r3.xyz = (r5.xyzx * cb4.data[6].xyzx).xyz;
/*128*/	r0.w = max(r5.w, cb4.data[12].y);
/*129*/	r5.xy = (-cb4.data[1].ywyy + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*130*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.yzyy, r5.xyxx)) * 0xffffffffu)).xy;
/*131*/	r4.xy = (uintBitsToFloat(floatBitsToUint(r4.xyxx) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0, 0)))).xy;
/*132*/	r4.xy = (r4.xyxx * cb4.data[1].xzxx).xy;
/*133*/	r1.w = r0.w * r4.x;
/*134*/	r0.w = -r4.x * r0.w + 1.000000;
/*135*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*136*/	r2.xyz = (r2.xyzx * r0.wwww + r3.xyzx).xyz;
/*137*/	r3.xyz = (r7.xyzx * cb4.data[7].xyzx).xyz;
/*138*/	r0.w = max(r7.w, cb4.data[12].z);
/*139*/	r1.w = r0.w * r4.y;
/*140*/	r0.w = -r4.y * r0.w + 1.000000;
/*141*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*142*/	r2.xyz = (r2.xyzx * r0.wwww + r3.xyzx).xyz;
/*143*/	r3.xyz = (r6.xyzx * cb4.data[8].xyzx).xyz;
/*144*/	r0.w = max(r6.w, cb4.data[12].w);
/*145*/	r4.xy = (-cb4.data[2].ywyy + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*146*/	r1.w = uintBitsToFloat((r4.w >= r4.x) ? 0xffffffffu : 0x00000000u);
/*147*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*148*/	r1.w = r1.w * cb4.data[2].x;
/*149*/	r2.w = r0.w * r1.w;
/*150*/	r0.w = -r1.w * r0.w + 1.000000;
/*151*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*152*/	r2.xyz = (r2.xyzx * r0.wwww + r3.xyzx).xyz;
/*153*/	r3.xyz = (r8.xyzx * cb4.data[9].xyzx).xyz;
/*154*/	r0.w = max(r8.w, cb4.data[13].x);
/*155*/	r4.xzw = (uintBitsToFloat(uvec4(equal(cb4.data[15].xxyz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xzw;
/*156*/	r4.xzw = (mix(vsOut_T4.yyyy, vsOut_T4.xxxx, greaterThan(floatBitsToUint(r4.xxzw), uvec4(0)))).xzw;
/*157*/	r1.w = uintBitsToFloat((r4.x >= r4.y) ? 0xffffffffu : 0x00000000u);
/*158*/	r1.w = uintBitsToFloat(floatBitsToUint(r1.w) & uint(0x3f800000u));
/*159*/	r1.w = r1.w * cb4.data[2].z;
/*160*/	r2.w = r0.w * r1.w;
/*161*/	r0.w = -r1.w * r0.w + 1.000000;
/*162*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*163*/	r2.xyz = (r2.xyzx * r0.wwww + r3.xyzx).xyz;
/*164*/	r3.xyz = (r9.xyzx * cb4.data[10].xyzx).xyz;
/*165*/	r0.w = max(r9.w, cb4.data[13].y);
/*166*/	r4.xy = (-cb4.data[3].ywyy + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*167*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.zwzz, r4.xyxx)) * 0xffffffffu)).xy;
/*168*/	r4.xy = (uintBitsToFloat(floatBitsToUint(r4.xyxx) & uvec4(vec4(0x3f800000u, 0x3f800000u, 0, 0)))).xy;
/*169*/	r4.xy = (r4.xyxx * cb4.data[3].xzxx).xy;
/*170*/	r1.w = r0.w * r4.x;
/*171*/	r0.w = -r4.x * r0.w + 1.000000;
/*172*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*173*/	r2.xyz = (r2.xyzx * r0.wwww + r3.xyzx).xyz;
/*174*/	r3.xyz = (r10.xyzx * cb4.data[11].xyzx).xyz;
/*175*/	r0.w = max(r10.w, cb4.data[13].z);
/*176*/	r1.w = r0.w * r4.y;
/*177*/	r0.w = -r4.y * r0.w + 1.000000;
/*178*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*179*/	r2.xyz = (r2.xyzx * r0.wwww + r3.xyzx).xyz;
/*180*/	r3.xyz = (r2.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*181*/	r3.xyz = (-r2.xyzx + r3.xyzx).xyz;
/*182*/	r2.xyz = saturate(vsOut_T5.zzzz * r3.xyzx + r2.xyzx).xyz;
/*183*/	r0.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*184*/	r3.xyz = (-r2.xyzx + r0.wwww).xyz;
/*185*/	r2.xyz = (vsOut_T5.wwww * r3.xyzx + r2.xyzx).xyz;
/*186*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*187*/	r0.w = -r0.w + 1.000000;
/*188*/	r0.w = max(r0.w, 0.000000);
/*189*/	r1.z = sqrt(r0.w);
/*190*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*191*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*192*/	r0.w = inversesqrt(r0.w);
/*193*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*194*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*195*/	r0.w = inversesqrt(r0.w);
/*196*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*197*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*198*/	r0.y = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*199*/	r0.y = inversesqrt(r0.y);
/*200*/	r3.xyz = (r0.yyyy * vsOut_T2.xyzx).xyz;
/*201*/	r0.xyw = (r0.xxxx * r3.xyxz + r1.xyxz).xyw;
/*202*/	r1.x = dot(vec3(vsOut_T1.xyzx), vec3(vsOut_T1.xyzx));
/*203*/	r1.x = inversesqrt(r1.x);
/*204*/	r1.xyz = (r1.xxxx * vsOut_T1.xyzx).xyz;
/*205*/	r0.xyz = (r0.zzzz * r1.xyzx + r0.xywx).xyz;
/*206*/	r0.w = saturate(dot(vec3(r0.xyzx), vec3(-cb4.data[16].xyzx)));
/*207*/	r0.w = r0.w + 0.200000;
/*208*/	r1.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*209*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*210*/	r1.w = inversesqrt(r1.w);
/*211*/	r1.xyz = (r1.xyzx * r1.wwww + -cb4.data[16].xyzx).xyz;
/*212*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*213*/	r1.w = inversesqrt(r1.w);
/*214*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*215*/	r0.x = dot(vec3(r0.xyzx), vec3(r1.xyzx));
/*216*/	r0.y = abs(r0.x) * abs(r0.x);
/*217*/	r0.y = r0.y * r0.y;
/*218*/	r0.x = r0.y * abs(r0.x);
/*219*/	r0.y = r0.x * 0.050000;
/*220*/	r0.z = dot(vec3(r0.yyyy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*221*/	r0.x = -r0.x * 0.050000 + r0.z;
/*222*/	r0.x = vsOut_T5.w * r0.x + r0.y;
/*223*/	r0.xyz = (r2.xyzx * r0.wwww + r0.xxxx).xyz;
/*224*/	r0.w = -vsOut_T0.y + cb2.data[1].w;
/*225*/	r0.w = r0.w + -cb2.data[1].z;
/*226*/	r1.x = -cb2.data[1].z + cb2.data[1].w;
/*227*/	r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.x)).x;
/*228*/	r0.w = saturate(r0.w * r1.x);
/*229*/	r1.x = r0.w * -2.000000 + 3.000000;
/*230*/	r0.w = r0.w * r0.w;
/*231*/	r0.w = r0.w * r1.x;
/*232*/	r1.x = saturate(cb2.data[0].w)/**/;
/*233*/	r1.x = -r1.x + 1.000000;
/*234*/	r1.x = r1.x * 8.000000 + -4.000000;
/*235*/	r1.y = saturate(cb2.data[1].x)/**/;
/*236*/	r1.y = -r1.y + 1.000000;
/*237*/	r1.y = r1.y * 1000.000000;
/*238*/	r2.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*239*/	r1.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*240*/	r1.z = sqrt(r1.z);
/*241*/	r1.y = r1.z / r1.y;
/*242*/	r1.x = r1.y + r1.x;
/*243*/	r1.x = r1.x * 1.442695;
/*244*/	r1.x = exp2(r1.x);
/*245*/	r1.x = cb2.data[1].y / r1.x;
/*246*/	r1.x = saturate(-r1.x + cb2.data[1].y);
/*247*/	r0.w = cb2.data[2].x * r0.w + r1.x;
/*248*/	r1.x = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*249*/	r1.yzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).yzw;
/*250*/	r1.yzw = (r1.yyzw * vec4(0.000000, 1.500000, 1.500000, 1.500000)).yzw;
/*251*/	r1.yzw = (r1.yyzw * abs(cb1.data[0].zzzz)).yzw;
/*252*/	r3.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*253*/	r3.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.004000 : 1.000000;
/*254*/	r3.yzw = (r1.yyzw * r3.xxxx).yzw;
/*255*/	r2.w = max(r2.y, 0.000000);
/*256*/	r4.xyzw = (texture(s_sky, r2.xwzx.stp)).xyzw;
/*257*/	r2.x = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*258*/	r2.x = sqrt(r2.x);
/*259*/	r1.yzw = (-r1.yyzw * r3.xxxx + r4.xxyz).yzw;
/*260*/	r1.xyz = (r1.xxxx * r1.yzwy + r3.yzwy).xyz;
/*261*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*262*/	r1.w = max(cb2.data[2].z, 0.001000);
/*263*/	r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*264*/	r1.w = r1.w * r2.x;
/*265*/	r1.w = min(r1.w, 1.000000);
/*266*/	r2.x = r1.w * -2.000000 + 3.000000;
/*267*/	r1.w = r1.w * r1.w;
/*268*/	r1.w = r1.w * r2.x;
/*269*/	r0.w = saturate(r0.w * r1.w);
/*270*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*271*/	return;
}
