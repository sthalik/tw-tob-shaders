//
//
// Shader Model 4
// Fragment Shader
//
// id: 6808 - fxc/glsl_SM_4_0_ocean2.hlsl_PS_ps40_main_deep_shallow.glsl
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
/*64*/	r3.w = saturate(vsOut_T8.w);
/*65*/	r4.z = max(-cb1.data[0].z, 0.000000);
/*66*/	r6.xyz = (cb1.data[0].yzwy * vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*67*/	r4.w = dot(vec3(-cb1.data[0].yzwy), vec3(r6.xyzx));
/*68*/	r4.w = max(r4.w, 0.000100);
/*69*/	r5.w = r4.w * r4.w;
/*70*/	r5.w = r5.w * r5.w;
/*71*/	r4.w = r4.w * r5.w;
/*72*/	r3.x = r4.w * r3.x + cb3.data[0].x;
/*73*/	r3.x = -r3.x + 1.000000;
/*74*/	r3.x = r4.z * r3.x;
/*75*/	r6.xyzw = (texture(s_water_albedo_sampler, vsOut_T5.zwzz.st)).xyzw;
/*76*/	r6.xyz = (r6.xyzx * cb3.data[0].yyyy).xyz;
/*77*/	r6.xyz = (r3.xxxx * r6.xyzx).xyz;
/*78*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*79*/	r3.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*80*/	r4.z = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.004000 : 1.000000;
/*81*/	r4.xy = (r0.xzxx * vec4(0.020000, 0.020000, 0.000000, 0.000000) + r4.xyxx).xy;
/*82*/	r7.xyzw = (texture(s_refraction_sampler, r4.xyxx.st)).xyzw;
/*83*/	r4.x = r3.w * -2.000000 + 3.000000;
/*84*/	r3.w = r3.w * r3.w;
/*85*/	r3.w = r3.w * r4.x;
/*86*/	r4.xyw = (r6.xyxz * r4.zzzz + -r7.xyxz).xyw;
/*87*/	r4.xyw = (r3.wwww * r4.xyxw + r7.xyxz).xyw;
/*88*/	r1.w = -r1.w * r2.w + 1.000000;
/*89*/	r4.xyw = (r4.xyxw * r1.wwww).xyw;
/*90*/	r4.xyw = (r3.zzzz * r5.xyxz + r4.xyxw).xyw;
/*91*/	r5.xyz = (cb2.data[8].xyzx + -cb2.data[9].xyzx).xyz;
/*92*/	r5.xyz = (r3.yyyy * r5.xyzx + cb2.data[9].xyzx).xyz;
/*93*/	r3.yzw = (r3.yyyy * r5.xxyz).yzw;
/*94*/	r1.w = vsOut_T8.z * vsOut_T8.z;
/*95*/	r1.w = r1.w * r1.w;
/*96*/	r3.yzw = (r3.yyzw * cb2.data[9].wwww + r0.wwww).yzw;
/*97*/	r3.yzw = (r3.yyzw * r1.wwww + r4.xxyw).yzw;
/*98*/	r0.w = dot(vec3(-cb1.data[0].yzwy), vec3(r2.xyzx));
/*99*/	r0.w = max(r0.w, -1.000000);
/*100*/	r0.w = min(r0.w, 1.000000);
/*101*/	r1.w = -abs(r0.w) + 1.000000;
/*102*/	r1.w = sqrt(r1.w);
/*103*/	r2.x = abs(r0.w) * -0.018729 + 0.074261;
/*104*/	r2.x = r2.x * abs(r0.w) + -0.212114;
/*105*/	r2.x = r2.x * abs(r0.w) + 1.570729;
/*106*/	r2.y = r1.w * r2.x;
/*107*/	r2.y = r2.y * -2.000000 + 3.141593;
/*108*/	r0.w = uintBitsToFloat((r0.w < -r0.w) ? 0xffffffffu : 0x00000000u);
/*109*/	r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r2.y));
/*110*/	r0.w = r2.x * r1.w + r0.w;
/*111*/	r0.x = dot(vec3(-cb1.data[0].yzwy), vec3(r0.xyzx));
/*112*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*113*/	if(floatBitsToUint(r0.y) != 0u) {
/*114*/	  r0.z = -cb3.data[1].y + 1.000000;
/*115*/	  r1.w = cb3.data[1].y * cb3.data[1].y;
/*116*/	    r2.x = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*117*/	  r1.w = r1.w * r2.x + r4.z;
/*118*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*119*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*120*/	  r2.x = -r1.w * r1.w + 1.000000;
/*121*/	  r2.x = max(r2.x, 0.001000);
/*122*/	  r2.x = log2(r2.x);
/*123*/	  r2.y = r2.x * 4.950617;
/*124*/	  r2.x = r2.x * 0.346574 + 4.546885;
/*125*/	  r2.z = uintBitsToFloat((0.000000 < r1.w) ? 0xffffffffu : 0x00000000u);
/*126*/	  r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*127*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r2.z) + floatBitsToInt(r1.w));
/*128*/	  r1.w = floatBitsToInt(r1.w);
/*129*/	  r2.y = r2.x * r2.x + -r2.y;
/*130*/	  r2.y = sqrt(r2.y);
/*131*/	  r2.x = -r2.x + r2.y;
/*132*/	  r2.x = max(r2.x, 0.000000);
/*133*/	  r2.x = sqrt(r2.x);
/*134*/	  r1.w = r1.w * r2.x;
/*135*/	  r1.w = r1.w * 1.414214;
/*136*/	  r1.w = 0.008727 / r1.w;
/*137*/	  r1.w = max(r1.w, 0.000100);
/*138*/	  r2.xy = (r0.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*139*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*140*/	  r2.xy = (r1.wwww * r2.xyxx).xy;
/*141*/	  r2.zw = (r2.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*142*/	  r2.zw = (r2.zzzw * r2.zzzw).zw;
/*143*/	  r5.xyzw = r2.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*144*/	  r4.xy = (r5.xzxx / r5.ywyy).xy;
/*145*/	  r2.zw = (-r2.zzzw * r4.xxxy).zw;
/*146*/	  r4.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xyxx)) * 0xffffffffu)).xy;
/*147*/	  r1.w = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*148*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r4.x) + floatBitsToInt(r1.w));
/*149*/	  r1.w = floatBitsToInt(r1.w);
/*150*/	  r2.xy = (r2.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*151*/	  r2.xy = (exp2(r2.xyxx)).xy;
/*152*/	  r2.xy = (-r2.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*153*/	  r2.xy = (sqrt(r2.xyxx)).xy;
/*154*/	  r1.w = r1.w * r2.x + 1.000000;
/*155*/	  r1.w = r1.w * 0.500000;
/*156*/	  r2.x = 1 + ~floatBitsToInt(r4.y);
/*157*/	  r2.x = r2.x * r2.y + 1.000000;
/*158*/	  r1.w = r2.x * 0.500000 + -r1.w;
/*159*/	  r2.x = saturate(r0.x);
/*160*/	  r2.yz = (r0.zzzz * vec4(0.000000, 1.570796, 1.539380, 0.000000)).yz;
/*161*/	  r0.z = sin(r2.y);
/*162*/	  r2.x = r2.x + -1.000000;
/*163*/	  r0.z = r0.z * r2.x + 1.000000;
/*164*/	  r2.x = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*165*/	  r2.x = max(r2.x, 0.000000);
/*166*/	  r2.x = log2(r2.x);
/*167*/	  r2.x = r2.x * 10.000000;
/*168*/	  r2.x = exp2(r2.x);
/*169*/	    r2.y = cos((r2.z));
/*170*/	  r2.y = inversesqrt(r2.y);
/*171*/	  r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*172*/	  r2.z = saturate(cb3.data[0].x * 60.000000);
/*173*/	  r2.x = r2.y * r2.x;
/*174*/	  r2.y = r2.z + -cb3.data[0].x;
/*175*/	  r2.x = r2.x * r2.y + cb3.data[0].x;
/*176*/	  r0.z = r0.z * abs(r1.w);
/*177*/	  r2.xyz = (r2.xxxx * r0.zzzz).xyz;
/*178*/	} else {
/*179*/	  r2.xyz = (vec4(0, 0, 0, 0)).xyz;
/*180*/	}
/*181*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*182*/	if(floatBitsToUint(r0.y) != 0u) {
/*183*/	  r0.y = -cb3.data[1].z + 1.000000;
/*184*/	  r0.z = cb3.data[1].z * cb3.data[1].z;
/*185*/	    r1.w = (floatBitsToUint(r3.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*186*/	  r0.z = r0.z * r1.w + r4.z;
/*187*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*188*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*189*/	  r1.w = -r0.z * r0.z + 1.000000;
/*190*/	  r1.w = max(r1.w, 0.001000);
/*191*/	  r1.w = log2(r1.w);
/*192*/	  r2.w = r1.w * 4.950617;
/*193*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*194*/	  r3.x = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*195*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*196*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r3.x) + floatBitsToInt(r0.z));
/*197*/	  r0.z = floatBitsToInt(r0.z);
/*198*/	  r2.w = r1.w * r1.w + -r2.w;
/*199*/	  r2.w = sqrt(r2.w);
/*200*/	  r1.w = -r1.w + r2.w;
/*201*/	  r1.w = max(r1.w, 0.000000);
/*202*/	  r1.w = sqrt(r1.w);
/*203*/	  r0.z = r0.z * r1.w;
/*204*/	  r0.z = r0.z * 1.414214;
/*205*/	  r0.z = 0.008727 / r0.z;
/*206*/	  r0.z = max(r0.z, 0.000100);
/*207*/	  r4.xy = (r0.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*208*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*209*/	  r0.zw = (r0.zzzz * r4.xxxy).zw;
/*210*/	  r4.xy = (r0.zwzz * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*211*/	  r4.xy = (r4.xyxx * r4.xyxx).xy;
/*212*/	  r5.xyzw = r4.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*213*/	  r4.zw = (r5.xxxz / r5.yyyw).zw;
/*214*/	  r4.xy = (r4.zwzz * -r4.xyxx).xy;
/*215*/	  r4.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.zzzw)) * 0xffffffffu)).zw;
/*216*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*217*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r0.z));
/*218*/	  r0.z = floatBitsToInt(r0.z);
/*219*/	  r4.xy = (r4.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*220*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*221*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*222*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*223*/	  r0.z = r0.z * r4.x + 1.000000;
/*224*/	  r0.z = r0.z * 0.500000;
/*225*/	  r0.w = 1 + ~floatBitsToInt(r4.w);
/*226*/	  r0.w = r0.w * r4.y + 1.000000;
/*227*/	  r0.z = r0.w * 0.500000 + -r0.z;
/*228*/	  r0.x = saturate(r0.x);
/*229*/	  r0.yw = (r0.yyyy * vec4(0.000000, 1.570796, 0.000000, 1.539380)).yw;
/*230*/	  r0.y = sin(r0.y);
/*231*/	  r0.x = r0.x + -1.000000;
/*232*/	  r0.x = r0.y * r0.x + 1.000000;
/*233*/	  r0.y = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*234*/	  r0.y = max(r0.y, 0.000000);
/*235*/	  r0.y = log2(r0.y);
/*236*/	  r0.y = r0.y * 10.000000;
/*237*/	  r0.y = exp2(r0.y);
/*238*/	    r0.w = cos((r0.w));
/*239*/	  r0.w = inversesqrt(r0.w);
/*240*/	  r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*241*/	  r1.x = saturate(cb3.data[0].x * 60.000000);
/*242*/	  r0.y = r0.w * r0.y;
/*243*/	  r0.w = r1.x + -cb3.data[0].x;
/*244*/	  r0.y = r0.y * r0.w + cb3.data[0].x;
/*245*/	  r0.x = r0.x * abs(r0.z);
/*246*/	  r0.xyz = (r0.yyyy * r0.xxxx).xyz;
/*247*/	} else {
/*248*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*249*/	}
/*250*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*251*/	r0.w = -cb3.data[1].w + 1.000000;
/*252*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*253*/	r0.xyz = (r2.xyzx * cb3.data[1].wwww + r0.xyzx).xyz;
/*254*/	r0.xyz = (r0.xyzx + r3.yzwy).xyz;
/*255*/	r1.xyzw = (textureLod(s_land_heights_sampler, vsOut_T5.zwzz.st, 0.000000)).xyzw;
/*256*/	r0.w = -r1.x * cb2.data[3].w + vsOut_T1.y;
/*257*/	r0.w = saturate(r0.w * cb2.data[11].x);
/*258*/	r0.xyz = (-r7.xyzx + r0.xyzx).xyz;
/*259*/	color0.xyz = (r0.wwww * r0.xyzx + r7.xyzx).xyz;
/*260*/	color0.w = 1.000000;
/*261*/	return;
}
