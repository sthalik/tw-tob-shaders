//
//
// Shader Model 4
// Fragment Shader
//
// id: 6814 - fxc/glsl_SM_4_0_ocean2.hlsl_PS_ps40_main_deep_shallow_coast.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
in vec4 vsOut_T6;
in vec4 vsOut_T7;
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_detailmap_sampler;
uniform sampler2D s_deep_foam_trail_sampler;
uniform sampler2D s_deep_foam_sampler;
uniform sampler2D s_reflection_sampler;
uniform sampler2D s_water_albedo_sampler;
uniform sampler2D s_refraction_sampler;
uniform sampler2D s_coast_foam_trail_sampler;
uniform sampler2D s_coast_foam_sampler;
uniform sampler2D s_land_heights_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform ocean_v2_water
{
  vec4 data[12];
} cb2;
layout(std140) uniform ocean_v2_lighting
{
  vec4 data[3];
} cb3;
layout(std140) uniform ocean_v2_coast
{
  vec4 data[6];
} cb4;

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

/*0*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*1*/	r0.x = inversesqrt(r0.x);
/*2*/	r0.yzw = (r0.xxxx * vsOut_T3.xxyz).yzw;
/*3*/	r1.xyzw = (texture(s_detailmap_sampler, vsOut_T2.xyxx.st)).xzyw;
/*4*/	r1.y = 2.000000;
/*5*/	r1.xyz = (r1.xyzx * cb2.data[10].xyzx).xyz;
/*6*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*7*/	r1.w = inversesqrt(r1.w);
/*8*/	r1.xyz = (r1.wwww * r1.xzyx).xyz;
/*9*/	r2.xw = (vsOut_T4.yyyx).xw;
/*10*/	r2.yz = (vec4(0, 4.000000, 4.000000, 0)).yz;
/*11*/	r2.x = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*12*/	r2.x = inversesqrt(r2.x);
/*13*/	r1.w = vsOut_T4.y;
/*14*/	r3.xyz = (r1.ywyy * r2.xxxx).xyz;
/*15*/	r1.w = dot(vec2(r2.zwzz), vec2(r2.zwzz));
/*16*/	r1.w = inversesqrt(r1.w);
/*17*/	r2.x = r1.x;
/*18*/	r2.y = vsOut_T4.x;
/*19*/	r4.xyz = (r1.wwww * r2.xyxx).xyz;
/*20*/	r2.zw = (vec4(0, 0, 4.000000, 0)).zw;
/*21*/	r0.yzw = (r0.yyzw * r1.zzzz).yzw;
/*22*/	r0.yzw = (r2.zzxw * r4.xxyz + r0.yyzw).yzw;
/*23*/	r1.xz = (vec4(0, 0, 4.000000, 0)).xz;
/*24*/	r0.yzw = (r1.xxyz * r3.xxyz + r0.yyzw).yzw;
/*25*/	r1.xyz = (vsOut_T3.xyzx * r0.xxxx + -r0.yzwy).xyz;
/*26*/	r0.xyz = (vsOut_T8.xxxx * r1.xyzx + r0.yzwy).xyz;
/*27*/	r0.w = dot(vec3(vsOut_T7.xyzx), vec3(vsOut_T7.xyzx));
/*28*/	r0.w = inversesqrt(r0.w);
/*29*/	r1.xyz = (r0.wwww * vsOut_T7.xyzx).xyz;
/*30*/	r0.w = dot(vec3(-r1.xyzx), vec3(r0.xyzx));
/*31*/	r0.w = r0.w + r0.w;
/*32*/	r2.xyz = (r0.xyzx * -r0.wwww + -r1.xyzx).xyz;
/*33*/	r3.xy = (r0.xzxx * vec4(0.030000, 0.030000, 0.000000, 0.000000) + vsOut_T5.xyxx).xy;
/*34*/	r3.xyzw = (texture(s_deep_foam_trail_sampler, r3.xyxx.st)).xyzw;
/*35*/	r4.xyzw = cb0.data[26].xxxx / cb2.data[7].yxwz;
/*36*/	r5.xz = (r4.yywy).xz;
/*37*/	r5.yw = (vec4(0, 0, 0, 0)).yw;
/*38*/	r5.xyzw = -r5.xyzw + vsOut_T6.xyxy;
/*39*/	r6.xyzw = (texture(s_deep_foam_sampler, r5.xyxx.st)).xyzw;
/*40*/	r4.yw = (vec4(0, 0, 0, 0)).yw;
/*41*/	r4.xyzw = r4.xyzw + vsOut_T6.zwzw;
/*42*/	r7.xyzw = (texture(s_deep_foam_sampler, r4.xyxx.st)).xyzw;
/*43*/	r0.w = r6.z + r7.x;
/*44*/	r1.w = r6.x * r7.z;
/*45*/	r0.w = r0.w * r1.w;
/*46*/	r0.w = r0.w * 3.000000;
/*47*/	r3.xy = (r3.yxyy * r3.yxyy).xy;
/*48*/	r0.w = r0.w * r3.x;
/*49*/	r0.w = r0.w * cb2.data[6].w;
/*50*/	r1.w = -cb3.data[0].w + cb3.data[0].z;
/*51*/	r1.w = vsOut_T8.z * r1.w + cb3.data[0].w;
/*52*/	r1.w = vsOut_T8.z * -cb3.data[1].x + r1.w;
/*53*/	r2.w = dot(vec3(r2.xyzx), vec3(-r1.xyzx));
/*54*/	r2.w = max(r2.w, 0.000100);
/*55*/	r3.x = r2.w * r2.w;
/*56*/	r3.x = r3.x * r3.x;
/*57*/	r2.w = r2.w * r3.x;
/*58*/	r3.x = -cb3.data[0].x + 1.000000;
/*59*/	r2.w = r2.w * r3.x + cb3.data[0].x;
/*60*/	r3.z = r1.w * r2.w;
/*61*/	r4.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*62*/	r4.xy = (r4.xyxx * cb0.data[27].zwzz).xy;
/*63*/	r6.xy = (r0.xzxx * vec4(0.080000, 0.080000, 0.000000, 0.000000) + r4.xyxx).xy;
/*64*/	r6.z = -r6.y + 1.000000;
/*65*/	r6.xyzw = (texture(s_reflection_sampler, r6.xzxx.st)).xyzw;
/*66*/	r3.w = saturate(vsOut_T8.w);
/*67*/	r5.x = max(-cb1.data[0].z, 0.000000);
/*68*/	r7.xyz = (cb1.data[0].yzwy * vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*69*/	r5.y = dot(vec3(-cb1.data[0].yzwy), vec3(r7.xyzx));
/*70*/	r5.y = max(r5.y, 0.000100);
/*71*/	r6.w = r5.y * r5.y;
/*72*/	r6.w = r6.w * r6.w;
/*73*/	r5.y = r5.y * r6.w;
/*74*/	r3.x = r5.y * r3.x + cb3.data[0].x;
/*75*/	r3.x = -r3.x + 1.000000;
/*76*/	r3.x = r5.x * r3.x;
/*77*/	r7.xyzw = (texture(s_water_albedo_sampler, vsOut_T5.zwzz.st)).xyzw;
/*78*/	r7.xyz = (r7.xyzx * cb3.data[0].yyyy).xyz;
/*79*/	r7.xyz = (r3.xxxx * r7.xyzx).xyz;
/*80*/	r7.xyz = (r7.xyzx * cb1.data[1].xyzx).xyz;
/*81*/	r3.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*82*/	r5.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.004000 : 1.000000;
/*83*/	r4.xy = (r0.xzxx * vec4(0.020000, 0.020000, 0.000000, 0.000000) + r4.xyxx).xy;
/*84*/	r8.xyzw = (texture(s_refraction_sampler, r4.xyxx.st)).xyzw;
/*85*/	r4.x = r3.w * -2.000000 + 3.000000;
/*86*/	r3.w = r3.w * r3.w;
/*87*/	r3.w = r3.w * r4.x;
/*88*/	r7.xyz = (r7.xyzx * r5.xxxx + -r8.xyzx).xyz;
/*89*/	r7.xyz = (r3.wwww * r7.xyzx + r8.xyzx).xyz;
/*90*/	r1.w = -r1.w * r2.w + 1.000000;
/*91*/	r7.xyz = (r7.xyzx * r1.wwww).xyz;
/*92*/	r6.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*93*/	r7.xyz = (cb2.data[8].xyzx + -cb2.data[9].xyzx).xyz;
/*94*/	r7.xyz = (r3.yyyy * r7.xyzx + cb2.data[9].xyzx).xyz;
/*95*/	r3.yzw = (r3.yyyy * r7.xxyz).yzw;
/*96*/	r1.w = vsOut_T8.z * vsOut_T8.z;
/*97*/	r1.w = r1.w * r1.w;
/*98*/	r3.yzw = (r3.yyzw * cb2.data[9].wwww + r0.wwww).yzw;
/*99*/	r3.yzw = (r3.yyzw * r1.wwww + r6.xxyz).yzw;
/*100*/	r6.xyzw = (texture(s_coast_foam_trail_sampler, vsOut_T2.zwzz.st)).xyzw;
/*101*/	r7.xyzw = (texture(s_coast_foam_sampler, r5.zwzz.st)).xyzw;
/*102*/	r4.xyzw = (texture(s_coast_foam_sampler, r4.zwzz.st)).xyzw;
/*103*/	r0.w = r4.x + r7.z;
/*104*/	r1.w = r7.x * r4.z;
/*105*/	r1.w = r0.w * r1.w;
/*106*/	r1.w = r6.y * r1.w;
/*107*/	r2.w = -vsOut_T4.z + 1.000000;
/*108*/	r1.w = r1.w * r2.w;
/*109*/	r1.w = r1.w * cb4.data[2].z;
/*110*/	r0.w = r0.w * r6.x;
/*111*/	r0.w = r2.w * r0.w;
/*112*/	r0.w = r0.w * cb4.data[2].w;
/*113*/	r0.w = r1.w * 3.000000 + r0.w;
/*114*/	r3.yzw = (r0.wwww + r3.yyzw).yzw;
/*115*/	r4.xyz = (cb4.data[3].xyzx + -cb4.data[4].xyzx).xyz;
/*116*/	r4.xyz = (vsOut_T8.yyyy * r4.xyzx + cb4.data[4].xyzx).xyz;
/*117*/	r4.xyz = (r4.xyzx * vsOut_T8.yyyy).xyz;
/*118*/	r3.yzw = (r4.xxyz * cb4.data[4].wwww + r3.yyzw).yzw;
/*119*/	r0.w = dot(vec3(-cb1.data[0].yzwy), vec3(r2.xyzx));
/*120*/	r0.w = max(r0.w, -1.000000);
/*121*/	r0.w = min(r0.w, 1.000000);
/*122*/	r1.w = -abs(r0.w) + 1.000000;
/*123*/	r1.w = sqrt(r1.w);
/*124*/	r2.x = abs(r0.w) * -0.018729 + 0.074261;
/*125*/	r2.x = r2.x * abs(r0.w) + -0.212114;
/*126*/	r2.x = r2.x * abs(r0.w) + 1.570729;
/*127*/	r2.y = r1.w * r2.x;
/*128*/	r2.y = r2.y * -2.000000 + 3.141593;
/*129*/	r0.w = uintBitsToFloat((r0.w < -r0.w) ? 0xffffffffu : 0x00000000u);
/*130*/	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r2.y));
/*131*/	r0.w = r2.x * r1.w + r0.w;
/*132*/	r0.x = dot(vec3(-cb1.data[0].yzwy), vec3(r0.xyzx));
/*133*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*134*/	if(floatBitsToUint(r0.y) != 0u) {
/*135*/	  r0.z = -cb3.data[1].y + 1.000000;
/*136*/	  r1.w = cb3.data[1].y * cb3.data[1].y;
/*137*/	    r2.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*138*/	  r1.w = r1.w * r2.x + r5.x;
/*139*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*140*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*141*/	  r2.x = -r1.w * r1.w + 1.000000;
/*142*/	  r2.x = max(r2.x, 0.001000);
/*143*/	  r2.x = log2(r2.x);
/*144*/	  r2.y = r2.x * 4.950617;
/*145*/	  r2.x = r2.x * 0.346574 + 4.546885;
/*146*/	  r2.z = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*147*/	  r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*148*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r2.z) + floatBitsToInt(r1.w));
/*149*/	  r1.w = floatBitsToInt(r1.w);
/*150*/	  r2.y = r2.x * r2.x + -r2.y;
/*151*/	  r2.y = sqrt(r2.y);
/*152*/	  r2.x = -r2.x + r2.y;
/*153*/	  r2.x = max(r2.x, 0.000000);
/*154*/	  r2.x = sqrt(r2.x);
/*155*/	  r1.w = r1.w * r2.x;
/*156*/	  r1.w = r1.w * 1.414214;
/*157*/	  r1.w = 0.008727 / r1.w;
/*158*/	  r1.w = max(r1.w, 0.000100);
/*159*/	  r2.xy = (r0.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*160*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*161*/	  r2.xy = (r1.wwww * r2.xyxx).xy;
/*162*/	  r2.zw = (r2.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*163*/	  r2.zw = (r2.zzzw * r2.zzzw).zw;
/*164*/	  r4.xyzw = r2.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*165*/	  r4.xy = (r4.xzxx / r4.ywyy).xy;
/*166*/	  r2.zw = (-r2.zzzw * r4.xxxy).zw;
/*167*/	  r4.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xyxx)) * 0xffffffffu)).xy;
/*168*/	  r1.w = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*169*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r4.x) + floatBitsToInt(r1.w));
/*170*/	  r1.w = floatBitsToInt(r1.w);
/*171*/	  r2.xy = (r2.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*172*/	  r2.xy = (exp2(r2.xyxx)).xy;
/*173*/	  r2.xy = (-r2.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*174*/	  r2.xy = (sqrt(r2.xyxx)).xy;
/*175*/	  r1.w = r1.w * r2.x + 1.000000;
/*176*/	  r1.w = r1.w * 0.500000;
/*177*/	  r2.x = 1 + ~floatBitsToInt(r4.y);
/*178*/	  r2.x = r2.x * r2.y + 1.000000;
/*179*/	  r1.w = r2.x * 0.500000 + -r1.w;
/*180*/	  r2.x = saturate(r0.x);
/*181*/	  r2.yz = (r0.zzzz * vec4(0.000000, 1.570796, 1.539380, 0.000000)).yz;
/*182*/	  r0.z = sin(r2.y);
/*183*/	  r2.x = r2.x + -1.000000;
/*184*/	  r0.z = r0.z * r2.x + 1.000000;
/*185*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*186*/	  r2.x = max(r2.x, 0.000000);
/*187*/	  r2.x = log2(r2.x);
/*188*/	  r2.x = r2.x * 10.000000;
/*189*/	  r2.x = exp2(r2.x);
/*190*/	    r2.y = cos((r2.z));
/*191*/	  r2.y = inversesqrt(r2.y);
/*192*/	  r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*193*/	  r2.z = saturate(cb3.data[0].x * 60.000000);
/*194*/	  r2.x = r2.y * r2.x;
/*195*/	  r2.y = r2.z + -cb3.data[0].x;
/*196*/	  r2.x = r2.x * r2.y + cb3.data[0].x;
/*197*/	  r0.z = r0.z * abs(r1.w);
/*198*/	  r2.xyz = (r2.xxxx * r0.zzzz).xyz;
/*199*/	} else {
/*200*/	  r2.xyz = (vec4(0, 0, 0, 0)).xyz;
/*201*/	}
/*202*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*203*/	if(floatBitsToUint(r0.y) != 0u) {
/*204*/	  r0.y = -cb3.data[1].z + 1.000000;
/*205*/	  r0.z = cb3.data[1].z * cb3.data[1].z;
/*206*/	    r1.w = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*207*/	  r0.z = r0.z * r1.w + r5.x;
/*208*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*209*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*210*/	  r1.w = -r0.z * r0.z + 1.000000;
/*211*/	  r1.w = max(r1.w, 0.001000);
/*212*/	  r1.w = log2(r1.w);
/*213*/	  r2.w = r1.w * 4.950617;
/*214*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*215*/	  r3.x = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*216*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*217*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r3.x) + floatBitsToInt(r0.z));
/*218*/	  r0.z = floatBitsToInt(r0.z);
/*219*/	  r2.w = r1.w * r1.w + -r2.w;
/*220*/	  r2.w = sqrt(r2.w);
/*221*/	  r1.w = -r1.w + r2.w;
/*222*/	  r1.w = max(r1.w, 0.000000);
/*223*/	  r1.w = sqrt(r1.w);
/*224*/	  r0.z = r0.z * r1.w;
/*225*/	  r0.z = r0.z * 1.414214;
/*226*/	  r0.z = 0.008727 / r0.z;
/*227*/	  r0.z = max(r0.z, 0.000100);
/*228*/	  r4.xy = (r0.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*229*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*230*/	  r0.zw = (r0.zzzz * r4.xxxy).zw;
/*231*/	  r4.xy = (r0.zwzz * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*232*/	  r4.xy = (r4.xyxx * r4.xyxx).xy;
/*233*/	  r5.xyzw = r4.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*234*/	  r4.zw = (r5.xxxz / r5.yyyw).zw;
/*235*/	  r4.xy = (r4.zwzz * -r4.xyxx).xy;
/*236*/	  r4.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.zzzw)) * 0xffffffffu)).zw;
/*237*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*238*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r0.z));
/*239*/	  r0.z = floatBitsToInt(r0.z);
/*240*/	  r4.xy = (r4.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*241*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*242*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*243*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*244*/	  r0.z = r0.z * r4.x + 1.000000;
/*245*/	  r0.z = r0.z * 0.500000;
/*246*/	  r0.w = 1 + ~floatBitsToInt(r4.w);
/*247*/	  r0.w = r0.w * r4.y + 1.000000;
/*248*/	  r0.z = r0.w * 0.500000 + -r0.z;
/*249*/	  r0.x = saturate(r0.x);
/*250*/	  r0.yw = (r0.yyyy * vec4(0.000000, 1.570796, 0.000000, 1.539380)).yw;
/*251*/	  r0.y = sin(r0.y);
/*252*/	  r0.x = r0.x + -1.000000;
/*253*/	  r0.x = r0.y * r0.x + 1.000000;
/*254*/	  r0.y = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*255*/	  r0.y = max(r0.y, 0.000000);
/*256*/	  r0.y = log2(r0.y);
/*257*/	  r0.y = r0.y * 10.000000;
/*258*/	  r0.y = exp2(r0.y);
/*259*/	    r0.w = cos((r0.w));
/*260*/	  r0.w = inversesqrt(r0.w);
/*261*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*262*/	  r1.x = saturate(cb3.data[0].x * 60.000000);
/*263*/	  r0.y = r0.w * r0.y;
/*264*/	  r0.w = r1.x + -cb3.data[0].x;
/*265*/	  r0.y = r0.y * r0.w + cb3.data[0].x;
/*266*/	  r0.x = r0.x * abs(r0.z);
/*267*/	  r0.xyz = (r0.yyyy * r0.xxxx).xyz;
/*268*/	} else {
/*269*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*270*/	}
/*271*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*272*/	r0.w = -cb3.data[1].w + 1.000000;
/*273*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*274*/	r0.xyz = (r2.xyzx * cb3.data[1].wwww + r0.xyzx).xyz;
/*275*/	r0.xyz = (r0.xyzx + r3.yzwy).xyz;
/*276*/	r1.xyzw = (textureLod(s_land_heights_sampler, vsOut_T5.zwzz.st, 0.000000)).xyzw;
/*277*/	r0.w = -r1.x * cb2.data[3].w + vsOut_T1.y;
/*278*/	r0.w = saturate(r0.w * cb2.data[11].x);
/*279*/	r0.xyz = (-r8.xyzx + r0.xyzx).xyz;
/*280*/	color0.xyz = (r0.wwww * r0.xyzx + r8.xyzx).xyz;
/*281*/	color0.w = 1.000000;
/*282*/	return;
}
