//
//
// Shader Model 4
// Fragment Shader
//
// id: 6805 - fxc/glsl_SM_3_0_ocean2.hlsl_PS_ps30_main_deep.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

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
uniform sampler2D s_refraction_sampler;

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
/*35*/	r4.xy = (cb0.data[26].xxxx / cb2.data[7].xyxx).xy;
/*36*/	r4.z = 0;
/*37*/	r3.zw = (-r4.xxxz + vsOut_T6.xxxy).zw;
/*38*/	r5.xyzw = (texture(s_deep_foam_sampler, r3.zwzz.st)).xyzw;
/*39*/	r3.zw = (r4.yyyz + vsOut_T6.zzzw).zw;
/*40*/	r4.xyzw = (texture(s_deep_foam_sampler, r3.zwzz.st)).xyzw;
/*41*/	r0.w = r4.x + r5.z;
/*42*/	r1.w = r5.x * r4.z;
/*43*/	r0.w = r0.w * r1.w;
/*44*/	r0.w = r0.w * 3.000000;
/*45*/	r3.xy = (r3.yxyy * r3.yxyy).xy;
/*46*/	r0.w = r0.w * r3.x;
/*47*/	r0.w = r0.w * cb2.data[6].w;
/*48*/	r1.w = -cb3.data[0].w + cb3.data[0].z;
/*49*/	r1.w = vsOut_T8.z * r1.w + cb3.data[0].w;
/*50*/	r1.w = vsOut_T8.z * -cb3.data[1].x + r1.w;
/*51*/	r2.w = dot(vec3(r2.xyzx), vec3(-r1.xyzx));
/*52*/	r2.w = max(r2.w, 0.000100);
/*53*/	r3.x = r2.w * r2.w;
/*54*/	r3.x = r3.x * r3.x;
/*55*/	r2.w = r2.w * r3.x;
/*56*/	r3.x = -cb3.data[0].x + 1.000000;
/*57*/	r2.w = r2.w * r3.x + cb3.data[0].x;
/*58*/	r3.z = r1.w * r2.w;
/*59*/	r4.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*60*/	r4.xy = (r4.xyxx * cb0.data[27].zwzz).xy;
/*61*/	r5.xy = (r0.xzxx * vec4(0.080000, 0.080000, 0.000000, 0.000000) + r4.xyxx).xy;
/*62*/	r5.z = -r5.y + 1.000000;
/*63*/	r5.xyzw = (texture(s_reflection_sampler, r5.xzxx.st)).xyzw;
/*64*/	r4.zw = saturate(vsOut_T8.zzzw).zw;
/*65*/	r3.w = max(-cb1.data[0].z, 0.000000);
/*66*/	r6.xyz = (cb1.data[0].yzwy * vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*67*/	r5.w = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*68*/	r5.w = max(r5.w, 0.000100);
/*69*/	r6.x = r5.w * r5.w;
/*70*/	r6.x = r6.x * r6.x;
/*71*/	r5.w = r5.w * r6.x;
/*72*/	r3.x = r5.w * r3.x + cb3.data[0].x;
/*73*/	r3.x = -r3.x + 1.000000;
/*74*/	r3.x = r3.w * r3.x;
/*75*/	r6.xy = (r4.zwzz * vec4(-2.000000, -2.000000, 0.000000, 0.000000) + vec4(3.000000, 3.000000, 0.000000, 0.000000)).xy;
/*76*/	r4.zw = (r4.zzzw * r4.zzzw).zw;
/*77*/	r4.zw = (r4.zzzw * r6.xxxy).zw;
/*78*/	r6.xyz = (cb1.data[8].xyzx + -cb1.data[9].xyzx).xyz;
/*79*/	r6.xyz = (r4.zzzz * r6.xyzx + cb1.data[9].xyzx).xyz;
/*80*/	r6.xyz = (r6.xyzx * cb3.data[0].yyyy).xyz;
/*81*/	r6.xyz = (r3.xxxx * r6.xyzx).xyz;
/*82*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*83*/	r3.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*84*/	r3.w = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.004000 : 1.000000;
/*85*/	r4.xy = (r0.xzxx * vec4(0.020000, 0.020000, 0.000000, 0.000000) + r4.xyxx).xy;
/*86*/	r7.xyzw = (texture(s_refraction_sampler, r4.xyxx.st)).xyzw;
/*87*/	r4.xyz = (r6.xyzx * r3.wwww + -r7.xyzx).xyz;
/*88*/	r4.xyz = (r4.wwww * r4.xyzx + r7.xyzx).xyz;
/*89*/	r1.w = -r1.w * r2.w + 1.000000;
/*90*/	r4.xyz = (r4.xyzx * r1.wwww).xyz;
/*91*/	r4.xyz = (r3.zzzz * r5.xyzx + r4.xyzx).xyz;
/*92*/	r5.xyz = (cb2.data[8].xyzx + -cb2.data[9].xyzx).xyz;
/*93*/	r5.xyz = (r3.yyyy * r5.xyzx + cb2.data[9].xyzx).xyz;
/*94*/	r5.xyz = (r3.yyyy * r5.xyzx).xyz;
/*95*/	r1.w = vsOut_T8.z * vsOut_T8.z;
/*96*/	r1.w = r1.w * r1.w;
/*97*/	r5.xyz = (r5.xyzx * cb2.data[9].wwww + r0.wwww).xyz;
/*98*/	r4.xyz = (r5.xyzx * r1.wwww + r4.xyzx).xyz;
/*99*/	r0.w = dot(vec3(-cb1.data[0].yzwy), vec3(r2.xyzx));
/*100*/	r0.w = max(r0.w, -1.000000);
/*101*/	r0.w = min(r0.w, 1.000000);
/*102*/	r1.w = -abs(r0.w) + 1.000000;
/*103*/	r1.w = sqrt(r1.w);
/*104*/	r2.x = abs(r0.w) * -0.018729 + 0.074261;
/*105*/	r2.x = r2.x * abs(r0.w) + -0.212114;
/*106*/	r2.x = r2.x * abs(r0.w) + 1.570729;
/*107*/	r2.y = r1.w * r2.x;
/*108*/	r2.y = r2.y * -2.000000 + 3.141593;
/*109*/	r0.w = uintBitsToFloat((r0.w < -r0.w) ? 0xffffffffu : 0x00000000u);
/*110*/	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r2.y));
/*111*/	r0.w = r2.x * r1.w + r0.w;
/*112*/	r0.x = dot(vec3(-cb1.data[0].yzwy), vec3(r0.xyzx));
/*113*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*114*/	if(floatBitsToUint(r0.y) != 0u) {
/*115*/	  r0.z = -cb3.data[1].y + 1.000000;
/*116*/	  r1.w = cb3.data[1].y * cb3.data[1].y;
/*117*/	    r2.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*118*/	  r1.w = r1.w * r2.x + r3.w;
/*119*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*120*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*121*/	  r2.x = -r1.w * r1.w + 1.000000;
/*122*/	  r2.x = max(r2.x, 0.001000);
/*123*/	  r2.x = log2(r2.x);
/*124*/	  r2.y = r2.x * 4.950617;
/*125*/	  r2.x = r2.x * 0.346574 + 4.546885;
/*126*/	  r2.z = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*127*/	  r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*128*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r2.z) + floatBitsToInt(r1.w));
/*129*/	  r1.w = floatBitsToInt(r1.w);
/*130*/	  r2.y = r2.x * r2.x + -r2.y;
/*131*/	  r2.y = sqrt(r2.y);
/*132*/	  r2.x = -r2.x + r2.y;
/*133*/	  r2.x = max(r2.x, 0.000000);
/*134*/	  r2.x = sqrt(r2.x);
/*135*/	  r1.w = r1.w * r2.x;
/*136*/	  r1.w = r1.w * 1.414214;
/*137*/	  r1.w = 0.008727 / r1.w;
/*138*/	  r1.w = max(r1.w, 0.000100);
/*139*/	  r2.xy = (r0.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*140*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*141*/	  r2.xy = (r1.wwww * r2.xyxx).xy;
/*142*/	  r2.zw = (r2.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*143*/	  r2.zw = (r2.zzzw * r2.zzzw).zw;
/*144*/	  r5.xyzw = r2.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*145*/	  r3.yz = (r5.xxzx / r5.yywy).yz;
/*146*/	  r2.zw = (-r2.zzzw * r3.yyyz).zw;
/*147*/	  r3.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxyx)) * 0xffffffffu)).yz;
/*148*/	  r1.w = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*149*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r3.y) + floatBitsToInt(r1.w));
/*150*/	  r1.w = floatBitsToInt(r1.w);
/*151*/	  r2.xy = (r2.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*152*/	  r2.xy = (exp2(r2.xyxx)).xy;
/*153*/	  r2.xy = (-r2.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*154*/	  r2.xy = (sqrt(r2.xyxx)).xy;
/*155*/	  r1.w = r1.w * r2.x + 1.000000;
/*156*/	  r1.w = r1.w * 0.500000;
/*157*/	  r2.x = 1 + ~floatBitsToInt(r3.z);
/*158*/	  r2.x = r2.x * r2.y + 1.000000;
/*159*/	  r1.w = r2.x * 0.500000 + -r1.w;
/*160*/	  r2.x = saturate(r0.x);
/*161*/	  r2.yz = (r0.zzzz * vec4(0.000000, 1.570796, 1.539380, 0.000000)).yz;
/*162*/	  r0.z = sin(r2.y);
/*163*/	  r2.x = r2.x + -1.000000;
/*164*/	  r0.z = r0.z * r2.x + 1.000000;
/*165*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*166*/	  r2.x = max(r2.x, 0.000000);
/*167*/	  r2.x = log2(r2.x);
/*168*/	  r2.x = r2.x * 10.000000;
/*169*/	  r2.x = exp2(r2.x);
/*170*/	    r2.y = cos((r2.z));
/*171*/	  r2.y = inversesqrt(r2.y);
/*172*/	  r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*173*/	  r2.z = saturate(cb3.data[0].x * 60.000000);
/*174*/	  r2.x = r2.y * r2.x;
/*175*/	  r2.y = r2.z + -cb3.data[0].x;
/*176*/	  r2.x = r2.x * r2.y + cb3.data[0].x;
/*177*/	  r0.z = r0.z * abs(r1.w);
/*178*/	  r2.xyz = (r2.xxxx * r0.zzzz).xyz;
/*179*/	} else {
/*180*/	  r2.xyz = (vec4(0, 0, 0, 0)).xyz;
/*181*/	}
/*182*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*183*/	if(floatBitsToUint(r0.y) != 0u) {
/*184*/	  r0.y = -cb3.data[1].z + 1.000000;
/*185*/	  r0.z = cb3.data[1].z * cb3.data[1].z;
/*186*/	    r1.w = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*187*/	  r0.z = r0.z * r1.w + r3.w;
/*188*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*189*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*190*/	  r1.w = -r0.z * r0.z + 1.000000;
/*191*/	  r1.w = max(r1.w, 0.001000);
/*192*/	  r1.w = log2(r1.w);
/*193*/	  r2.w = r1.w * 4.950617;
/*194*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*195*/	  r3.x = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*196*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*197*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r3.x) + floatBitsToInt(r0.z));
/*198*/	  r0.z = floatBitsToInt(r0.z);
/*199*/	  r2.w = r1.w * r1.w + -r2.w;
/*200*/	  r2.w = sqrt(r2.w);
/*201*/	  r1.w = -r1.w + r2.w;
/*202*/	  r1.w = max(r1.w, 0.000000);
/*203*/	  r1.w = sqrt(r1.w);
/*204*/	  r0.z = r0.z * r1.w;
/*205*/	  r0.z = r0.z * 1.414214;
/*206*/	  r0.z = 0.008727 / r0.z;
/*207*/	  r0.z = max(r0.z, 0.000100);
/*208*/	  r3.xy = (r0.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*209*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*210*/	  r0.zw = (r0.zzzz * r3.xxxy).zw;
/*211*/	  r3.xy = (r0.zwzz * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*212*/	  r3.xy = (r3.xyxx * r3.xyxx).xy;
/*213*/	  r5.xyzw = r3.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*214*/	  r3.zw = (r5.xxxz / r5.yyyw).zw;
/*215*/	  r3.xy = (r3.zwzz * -r3.xyxx).xy;
/*216*/	  r3.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.zzzw)) * 0xffffffffu)).zw;
/*217*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*218*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r3.z) + floatBitsToInt(r0.z));
/*219*/	  r0.z = floatBitsToInt(r0.z);
/*220*/	  r3.xy = (r3.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*221*/	  r3.xy = (exp2(r3.xyxx)).xy;
/*222*/	  r3.xy = (-r3.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*223*/	  r3.xy = (sqrt(r3.xyxx)).xy;
/*224*/	  r0.z = r0.z * r3.x + 1.000000;
/*225*/	  r0.z = r0.z * 0.500000;
/*226*/	  r0.w = 1 + ~floatBitsToInt(r3.w);
/*227*/	  r0.w = r0.w * r3.y + 1.000000;
/*228*/	  r0.z = r0.w * 0.500000 + -r0.z;
/*229*/	  r0.x = saturate(r0.x);
/*230*/	  r0.yw = (r0.yyyy * vec4(0.000000, 1.570796, 0.000000, 1.539380)).yw;
/*231*/	  r0.y = sin(r0.y);
/*232*/	  r0.x = r0.x + -1.000000;
/*233*/	  r0.x = r0.y * r0.x + 1.000000;
/*234*/	  r0.y = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*235*/	  r0.y = max(r0.y, 0.000000);
/*236*/	  r0.y = log2(r0.y);
/*237*/	  r0.y = r0.y * 10.000000;
/*238*/	  r0.y = exp2(r0.y);
/*239*/	    r0.w = cos((r0.w));
/*240*/	  r0.w = inversesqrt(r0.w);
/*241*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*242*/	  r1.x = saturate(cb3.data[0].x * 60.000000);
/*243*/	  r0.y = r0.w * r0.y;
/*244*/	  r0.w = r1.x + -cb3.data[0].x;
/*245*/	  r0.y = r0.y * r0.w + cb3.data[0].x;
/*246*/	  r0.x = r0.x * abs(r0.z);
/*247*/	  r0.xyz = (r0.yyyy * r0.xxxx).xyz;
/*248*/	} else {
/*249*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*250*/	}
/*251*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*252*/	r0.w = -cb3.data[1].w + 1.000000;
/*253*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*254*/	r0.xyz = (r2.xyzx * cb3.data[1].wwww + r0.xyzx).xyz;
/*255*/	color0.xyz = (r0.xyzx + r4.xyzx).xyz;
/*256*/	color0.w = 1.000000;
/*257*/	return;
}
