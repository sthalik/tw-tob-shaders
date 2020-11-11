//
//
// Shader Model 4
// Fragment Shader
//
// id: 634 - fxc/glsl_SM_3_0_rigidriver.hlsl_PS_ps30_main_battle_river.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D s_normal;
uniform samplerCube s_environment;
uniform sampler2D s_terrain_refraction;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_sky;

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
layout(std140) uniform wind_PS
{
  vec4 data[1];
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
  vec4 r8;

/*0*/	r0.xy = (vsOut_T5.xyxx * vec4(5.900000, 177.000000, 0.000000, 0.000000)).xy;
/*1*/	r1.xyz = (cb0.data[26].xxxx * vec4(-0.008000, 0.024000, 0.120000, 0.000000)).xyz;
/*2*/	r0.zw = (cb3.data[0].yyyx * vec4(0.000000, 0.000000, -1.000000, 1.000000)).zw;
/*3*/	r2.xyzw = r1.xxyy * r0.zwzw + r0.xyxy;
/*4*/	r2.xyzw = r2.xyzw + vec4(0.400000, 0.400000, 0.400000, 0.400000);
/*5*/	r0.xy = (r1.zzzz * cb3.data[0].xyxx + r0.xyxx).xy;
/*6*/	r1.x = 0;
/*7*/	r1.y = cb0.data[26].x * 0.050000;
/*8*/	r2.xyzw = -r1.xyxy + r2.xyzw;
/*9*/	r0.xy = (r0.xyxx + -r1.xyxx).xy;
/*10*/	r0.zw = (gl_FragCoord.xxxy + cb0.data[28].xxxx).zw;
/*11*/	r0.zw = (r0.zzzw * cb0.data[27].zzzw).zw;
/*12*/	r1.xy = (r2.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*13*/	r0.xy = (r0.xyxx + r0.xyxx).xy;
/*14*/	r1.xyzw = (texture(s_normal, r1.xyxx.st)).xyzw;
/*15*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*16*/	r1.xz = (r1.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*17*/	r1.w = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*18*/	r1.w = -r1.w + 1.000000;
/*19*/	r1.w = max(r1.w, 0.000000);
/*20*/	r1.y = sqrt(r1.w);
/*21*/	r2.xyzw = (texture(s_normal, r2.zwzz.st)).xyzw;
/*22*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*23*/	r2.xz = (r2.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*24*/	r1.w = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*25*/	r1.w = -r1.w + 1.000000;
/*26*/	r1.w = max(r1.w, 0.000000);
/*27*/	r2.y = sqrt(r1.w);
/*28*/	r3.xyzw = (texture(s_normal, r0.xyxx.st)).xyzw;
/*29*/	r0.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*30*/	r3.xz = (r0.xxyx * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*31*/	r0.x = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*32*/	r0.x = -r0.x + 1.000000;
/*33*/	r0.x = max(r0.x, 0.000000);
/*34*/	r3.y = sqrt(r0.x);
/*35*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*36*/	r1.xyz = (r3.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r1.xyzx).xyz;
/*37*/	r1.xyz = (r1.xyzx + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*38*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*39*/	r0.x = inversesqrt(r0.x);
/*40*/	r1.xyz = (r0.xxxx * r1.xyzx).xyz;
/*41*/	r2.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*42*/	r0.x = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*43*/	r0.x = inversesqrt(r0.x);
/*44*/	r3.xyz = (r0.xxxx * r2.xyzx).xyz;
/*45*/	r0.y = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*46*/	r0.y = r0.y + r0.y;
/*47*/	r4.xyz = (r1.xyzx * -r0.yyyy + -r3.xyzx).xyz;
/*48*/	r0.y = saturate(r4.y + 1.000000);
/*49*/	r4.w = abs(r4.y);
/*50*/	r1.w = dot(vec3(r4.xwzx), vec3(-r3.xyzx));
/*51*/	r1.w = max(r1.w, 0.000100);
/*52*/	r2.w = r1.w * r1.w;
/*53*/	r2.w = r2.w * r2.w;
/*54*/	r1.w = r1.w * r2.w;
/*55*/	r1.w = r1.w * 0.250000 + 0.150000;
/*56*/	r0.y = r0.y * r1.w;
/*57*/	if(floatBitsToUint(cb1.data[11].y) == 0u) {
/*58*/	  r5.xyzw = (textureLod(s_environment, r4.xwzx.stp, 0.000000)).xyzw;
/*59*/	  r5.xyz = (r0.yyyy * r5.xyzx).xyz;
/*60*/	} else {
/*61*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*62*/	}
/*63*/	r1.w = max(-cb1.data[0].z, 0.000000);
/*64*/	r6.xyz = (cb1.data[0].yzwy * vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*65*/	r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(-r6.xyzx));
/*66*/	r2.w = max(r2.w, 0.000100);
/*67*/	r3.w = r2.w * r2.w;
/*68*/	r3.w = r3.w * r3.w;
/*69*/	r2.w = r2.w * r3.w;
/*70*/	r2.w = r2.w * 0.250000 + 0.150000;
/*71*/	r2.w = -r2.w + 1.000000;
/*72*/	r1.w = r1.w * r2.w;
/*73*/	r6.xyz = (r1.wwww * cb1.data[8].xyzx).xyz;
/*74*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*75*/	r6.xyz = (r6.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*76*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*77*/	r2.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*78*/	r6.xyz = (r2.wwww * r6.xyzx).xyz;
/*79*/	r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.zwzz.st, 0.000000)).yzxw;
/*80*/	r7.xy = (r0.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*81*/	r7.w = 1.000000;
/*82*/	r3.w = dot(r7.xyzw, cb0.data[19].xyzw);
/*83*/	r4.y = dot(r7.xyzw, cb0.data[20].xyzw);
/*84*/	r3.w = r3.w / r4.y;
/*85*/	r3.w = r3.w + -vsOut_T0.w;
/*86*/	r3.w = max(r3.w, 0.000000);
/*87*/	r4.y = dot(r7.xyzw, cb0.data[22].xyzw);
/*88*/	r5.w = dot(r7.xyzw, cb0.data[24].xyzw);
/*89*/	r4.y = r4.y / r5.w;
/*90*/	r4.y = -r4.y + vsOut_T0.y;
/*91*/	r4.y = max(r4.y, 0.000000);
/*92*/	r5.w = r4.y * 4.000000;
/*93*/	r5.w = min(r5.w, 1.000000);
/*94*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.zwzz.st, r0.w)).xyzw;
/*95*/	r7.xy = (r1.xzxx * r7.wwww).xy;
/*96*/	r7.xy = (r5.wwww * r7.xyxx).xy;
/*97*/	r0.zw = (r7.xxxy * vec4(0.000000, 0.000000, 0.008333, 0.008333) + r0.zzzw).zw;
/*98*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.zwzz.st, r0.w)).xyzw;
/*99*/	r8.xyzw = log2(cb1.data[10].xyzw);
/*100*/	r8.xyz = (r4.yyyy * r8.xyzx).xyz;
/*101*/	r8.xyz = (exp2(r8.xyzx)).xyz;
/*102*/	r0.z = r3.w * r8.w;
/*103*/	r0.z = exp2(r0.z);
/*104*/	r0.z = min(r0.z, 1.000000);
/*105*/	r7.xyz = (r7.xyzx * r8.xyzx + -r6.xyzx).xyz;
/*106*/	r6.xyz = (r0.zzzz * r7.xyzx + r6.xyzx).xyz;
/*107*/	r0.y = -r0.y * r5.w + 1.000000;
/*108*/	r0.yzw = (r6.xxyz * r0.yyyy).yzw;
/*109*/	r0.yzw = (r5.xxyz * r5.wwww + r0.yyzw).yzw;
/*110*/	r3.w = dot(vec3(-cb1.data[0].ywzy), vec3(r4.xzwx));
/*111*/	r3.w = max(r3.w, -1.000000);
/*112*/	r3.w = min(r3.w, 1.000000);
/*113*/	r4.y = -abs(r3.w) + 1.000000;
/*114*/	r4.y = sqrt(r4.y);
/*115*/	r5.x = abs(r3.w) * -0.018729 + 0.074261;
/*116*/	r5.x = r5.x * abs(r3.w) + -0.212114;
/*117*/	r5.x = r5.x * abs(r3.w) + 1.570729;
/*118*/	r5.y = r4.y * r5.x;
/*119*/	r5.y = r5.y * -2.000000 + 3.141593;
/*120*/	r3.w = uintBitsToFloat((r3.w < -r3.w) ? 0xffffffffu : 0x00000000u);
/*121*/	r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r5.y));
/*122*/	r3.w = r5.x * r4.y + r3.w;
/*123*/	r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*124*/	r1.y = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*125*/	if(floatBitsToUint(r1.y) != 0u) {
/*126*/	    r1.z = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.487991 : -0.000049;
/*127*/	  r1.z = r1.z + r2.w;
/*128*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*129*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*130*/	  r1.z = -r1.z * r1.z + 1.000000;
/*131*/	  r1.z = max(r1.z, 0.001000);
/*132*/	  r1.z = log2(r1.z);
/*133*/	  r4.y = r1.z * 4.950617;
/*134*/	  r1.z = r1.z * 0.346574 + 4.546885;
/*135*/	  r4.y = r1.z * r1.z + -r4.y;
/*136*/	  r4.y = sqrt(r4.y);
/*137*/	  r1.z = -r1.z + r4.y;
/*138*/	  r1.z = max(r1.z, 0.000000);
/*139*/	  r1.z = sqrt(r1.z);
/*140*/	  r1.z = r1.z * 1.414214;
/*141*/	  r1.z = 0.008727 / r1.z;
/*142*/	  r1.z = max(r1.z, 0.000100);
/*143*/	  r5.xy = (r3.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*144*/	  r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*145*/	  r5.xy = (r1.zzzz * r5.xyxx).xy;
/*146*/	  r6.xy = (r5.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*147*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*148*/	  r7.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*149*/	  r6.zw = (r7.xxxz / r7.yyyw).zw;
/*150*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*151*/	  r5.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r5.xxyx)) * 0xffffffffu)).yz;
/*152*/	  r1.z = uintBitsToFloat((r5.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*153*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*154*/	  r1.z = floatBitsToInt(r1.z);
/*155*/	  r5.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*156*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*157*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*158*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*159*/	  r1.z = r1.z * r5.x + 1.000000;
/*160*/	  r1.z = r1.z * 0.500000;
/*161*/	  r4.y = 1 + ~floatBitsToInt(r5.z);
/*162*/	  r4.y = r4.y * r5.y + 1.000000;
/*163*/	  r1.z = r4.y * 0.500000 + -r1.z;
/*164*/	  r4.y = saturate(r1.x);
/*165*/	  r4.y = r4.y + -1.000000;
/*166*/	  r4.y = r4.y * 0.453991 + 1.000000;
/*167*/	  r5.x = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*168*/	  r5.x = max(r5.x, 0.000000);
/*169*/	  r5.x = log2(r5.x);
/*170*/	  r5.x = r5.x * 10.000000;
/*171*/	  r5.x = exp2(r5.x);
/*172*/	  r5.x = r5.x * 0.804248 + 0.150000;
/*173*/	  r1.z = abs(r1.z) * r4.y;
/*174*/	  r5.xyz = (r5.xxxx * r1.zzzz).xyz;
/*175*/	} else {
/*176*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*177*/	}
/*178*/	r5.xyz = (r5.xyzx * cb1.data[1].xyzx).xyz;
/*179*/	if(floatBitsToUint(r1.y) != 0u) {
/*180*/	    r1.y = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.159344 : -0.000016;
/*181*/	  r1.y = r1.y + r2.w;
/*182*/	  r1.y = r1.y * 0.500000 + 0.500000;
/*183*/	  r1.y = r1.y * 2.000000 + -1.000000;
/*184*/	  r1.y = -r1.y * r1.y + 1.000000;
/*185*/	  r1.y = max(r1.y, 0.001000);
/*186*/	  r1.y = log2(r1.y);
/*187*/	  r1.z = r1.y * 4.950617;
/*188*/	  r1.y = r1.y * 0.346574 + 4.546885;
/*189*/	  r1.z = r1.y * r1.y + -r1.z;
/*190*/	  r1.z = sqrt(r1.z);
/*191*/	  r1.y = -r1.y + r1.z;
/*192*/	  r1.y = max(r1.y, 0.000000);
/*193*/	  r1.y = sqrt(r1.y);
/*194*/	  r1.y = r1.y * 1.414214;
/*195*/	  r1.y = 0.008727 / r1.y;
/*196*/	  r1.y = max(r1.y, 0.000100);
/*197*/	  r1.zw = (r3.wwww + vec4(0.000000, 0.000000, -0.008727, 0.008727)).zw;
/*198*/	  r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*199*/	  r1.yz = (r1.yyyy * r1.zzwz).yz;
/*200*/	  r6.xy = (r1.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*201*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*202*/	  r7.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*203*/	  r6.zw = (r7.xxxz / r7.yyyw).zw;
/*204*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*205*/	  r1.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.yyyz)) * 0xffffffffu)).zw;
/*206*/	  r1.y = uintBitsToFloat((r1.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*207*/	  r1.y = intBitsToFloat(1 + ~floatBitsToInt(r1.z) + floatBitsToInt(r1.y));
/*208*/	  r1.y = floatBitsToInt(r1.y);
/*209*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*210*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*211*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*212*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*213*/	  r1.y = r1.y * r6.x + 1.000000;
/*214*/	  r1.y = r1.y * 0.500000;
/*215*/	  r1.z = 1 + ~floatBitsToInt(r1.w);
/*216*/	  r1.z = r1.z * r6.y + 1.000000;
/*217*/	  r1.y = r1.z * 0.500000 + -r1.y;
/*218*/	  r1.x = saturate(r1.x);
/*219*/	  r1.x = r1.x + -1.000000;
/*220*/	  r1.x = r1.x * 0.809017 + 1.000000;
/*221*/	  r1.z = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*222*/	  r1.z = max(r1.z, 0.000000);
/*223*/	  r1.z = log2(r1.z);
/*224*/	  r1.z = r1.z * 10.000000;
/*225*/	  r1.z = exp2(r1.z);
/*226*/	  r1.z = r1.z * 0.660013 + 0.150000;
/*227*/	  r1.x = r1.x * abs(r1.y);
/*228*/	  r1.xyz = (r1.zzzz * r1.xxxx).xyz;
/*229*/	} else {
/*230*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*231*/	}
/*232*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*233*/	r1.xyz = (r1.xyzx * vec4(0.150000, 0.150000, 0.150000, 0.000000)).xyz;
/*234*/	r1.xyz = (r5.xyzx * vec4(0.850000, 0.850000, 0.850000, 0.000000) + r1.xyzx).xyz;
/*235*/	r0.yzw = (r5.wwww * r1.xxyz + r0.yyzw).yzw;
/*236*/	r1.xyz = (r2.xyzx * r0.xxxx + r4.xwzx).xyz;
/*237*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*238*/	r0.x = inversesqrt(r0.x);
/*239*/	r1.xyz = (r0.xxxx * r1.xyzx).xyz;
/*240*/	r0.x = max(abs(r1.z), abs(r1.y));
/*241*/	r0.x = max(r0.x, abs(r1.x));
/*242*/	r1.xyz = (r1.xyzx / r0.xxxx).xyz;
/*243*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*244*/	color0.w = 0.120000;
/*245*/	r1.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*246*/	r0.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*247*/	r0.x = sqrt(r0.x);
/*248*/	r2.x = saturate(cb2.data[0].w)/**/;
/*249*/	r2.x = -r2.x + 1.000000;
/*250*/	r2.x = r2.x * 8.000000 + -4.000000;
/*251*/	r2.y = saturate(cb2.data[1].x)/**/;
/*252*/	r2.y = -r2.y + 1.000000;
/*253*/	r2.y = r2.y * 1000.000000;
/*254*/	r0.x = r0.x / r2.y;
/*255*/	r0.x = r0.x + r2.x;
/*256*/	r0.x = r0.x * 1.442695;
/*257*/	r0.x = exp2(r0.x);
/*258*/	r0.x = cb2.data[1].y / r0.x;
/*259*/	r0.x = saturate(-r0.x + cb2.data[1].y);
/*260*/	r2.x = -vsOut_T0.y + cb2.data[1].w;
/*261*/	r2.y = -cb2.data[1].z + cb2.data[1].w;
/*262*/	r2.x = r2.x + -cb2.data[1].z;
/*263*/	r2.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.y)).y;
/*264*/	r2.x = saturate(r2.y * r2.x);
/*265*/	r2.y = r2.x * -2.000000 + 3.000000;
/*266*/	r2.x = r2.x * r2.x;
/*267*/	r2.x = r2.x * r2.y;
/*268*/	r2.y = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*269*/	r2.y = sqrt(r2.y);
/*270*/	r2.z = max(cb2.data[2].z, 0.001000);
/*271*/	r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).z;
/*272*/	r2.y = r2.z * r2.y;
/*273*/	r2.y = min(r2.y, 1.000000);
/*274*/	r2.z = r2.y * -2.000000 + 3.000000;
/*275*/	r2.y = r2.y * r2.y;
/*276*/	r2.y = r2.y * r2.z;
/*277*/	r0.x = cb2.data[2].x * r2.x + r0.x;
/*278*/	r3.xyz = (cb1.data[1].xyzx * cb2.data[0].xyzx).xyz;
/*279*/	r3.xyz = (r3.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*280*/	r3.xyz = (r3.xyzx * abs(cb1.data[0].zzzz)).xyz;
/*281*/	r4.xyz = (r2.wwww * r3.xyzx).xyz;
/*282*/	r1.w = max(r1.y, 0.000000);
/*283*/	r1.xyzw = (texture(s_sky, r1.xwzx.stp)).xyzw;
/*284*/	r1.w = saturate(dot(vec2(r0.xxxx), vec2(cb2.data[2].yyyy)));
/*285*/	r1.xyz = (-r3.xyzx * r2.wwww + r1.xyzx).xyz;
/*286*/	r1.xyz = (r1.wwww * r1.xyzx + r4.xyzx).xyz;
/*287*/	r0.x = saturate(r0.x * r2.y);
/*288*/	r1.xyz = (-r0.yzwy + r1.xyzx).xyz;
/*289*/	color3.xyz = (r0.xxxx * r1.xyzx + r0.yzwy).xyz;
/*290*/	color1.xyzw = vec4(0, 0, 0, 0.150000);
/*291*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*292*/	color3.w = 1.000000;
/*293*/	return;
}
