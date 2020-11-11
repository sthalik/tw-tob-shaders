//
//
// Shader Model 4
// Fragment Shader
//
// id: 6634 - fxc/glsl_SM_3_0_waterplane.hlsl_PS_ps30_battle_medium_water_quality.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T3;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D s_normal;
uniform samplerCube s_environment;
uniform sampler2D s_terrain_refraction;
uniform sampler2D gbuffer_channel_4_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;

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

/*0*/	r0.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*1*/	r0.xy = (r0.xyxx * cb0.data[27].zwzz).xy;
/*2*/	r0.zw = (vsOut_T0.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*3*/	r1.xy = (vsOut_T1.zwzz + vsOut_T1.zwzz).xy;
/*4*/	r2.xyzw = (texture(s_normal, r0.zwzz.st)).xyzw;
/*5*/	r0.zw = (r2.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*6*/	r2.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*7*/	r0.z = dot(vec2(r2.xzxx), vec2(r2.xzxx));
/*8*/	r0.z = -r0.z + 1.000000;
/*9*/	r0.z = max(r0.z, 0.000000);
/*10*/	r2.y = sqrt(r0.z);
/*11*/	r3.xyzw = (texture(s_normal, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*13*/	r3.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*14*/	r0.z = dot(vec2(r3.xzxx), vec2(r3.xzxx));
/*15*/	r0.z = -r0.z + 1.000000;
/*16*/	r0.z = max(r0.z, 0.000000);
/*17*/	r3.y = sqrt(r0.z);
/*18*/	r1.xyzw = (texture(s_normal, r1.xyxx.st)).xyzw;
/*19*/	r0.zw = (r1.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*20*/	r1.xz = (r0.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*21*/	r0.z = dot(vec2(r1.xzxx), vec2(r1.xzxx));
/*22*/	r0.z = -r0.z + 1.000000;
/*23*/	r0.z = max(r0.z, 0.000000);
/*24*/	r1.y = sqrt(r0.z);
/*25*/	r2.xyz = (r2.xyzx + r3.xyzx).xyz;
/*26*/	r1.xyz = (r1.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r2.xyzx).xyz;
/*27*/	r1.xyz = (r1.xyzx + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*28*/	r0.z = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*29*/	r0.z = inversesqrt(r0.z);
/*30*/	r1.xyz = (r0.zzzz * r1.xyzx).xyz;
/*31*/	r2.xyz = (-vsOut_T3.xyzx + cb0.data[0].xyzx).xyz;
/*32*/	r0.z = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*33*/	r0.z = inversesqrt(r0.z);
/*34*/	r3.xyz = (r0.zzzz * r2.xyzx).xyz;
/*35*/	r0.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*36*/	r0.w = r0.w + r0.w;
/*37*/	r4.xyz = (r1.xyzx * -r0.wwww + -r3.xyzx).xyz;
/*38*/	r0.w = saturate(r4.y + 1.000000);
/*39*/	r4.w = abs(r4.y);
/*40*/	r1.w = dot(vec3(r4.xwzx), vec3(-r3.xyzx));
/*41*/	r1.w = max(r1.w, 0.000100);
/*42*/	r2.w = r1.w * r1.w;
/*43*/	r2.w = r2.w * r2.w;
/*44*/	r1.w = r1.w * r2.w;
/*45*/	r1.w = r1.w * 0.250000 + 0.150000;
/*46*/	r0.w = r0.w * r1.w;
/*47*/	if(floatBitsToUint(cb1.data[11].y) == 0u) {
/*48*/	  r5.xyzw = (textureLod(s_environment, r4.xwzx.stp, 0.000000)).xyzw;
/*49*/	  r5.xyz = (r0.wwww * r5.xyzx).xyz;
/*50*/	} else {
/*51*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*52*/	}
/*53*/	r1.w = max(-cb1.data[0].z, 0.000000);
/*54*/	r6.xyz = (cb1.data[0].yzwy * vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*55*/	r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(-r6.xyzx));
/*56*/	r2.w = max(r2.w, 0.000100);
/*57*/	r3.w = r2.w * r2.w;
/*58*/	r3.w = r3.w * r3.w;
/*59*/	r2.w = r2.w * r3.w;
/*60*/	r2.w = r2.w * 0.250000 + 0.150000;
/*61*/	r2.w = -r2.w + 1.000000;
/*62*/	r1.w = r1.w * r2.w;
/*63*/	r6.xyz = (r1.wwww * cb1.data[8].xyzx).xyz;
/*64*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*65*/	r6.xyz = (r6.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*66*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*67*/	r2.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.004000 : 1.000000;
/*68*/	r6.xyz = (r2.wwww * r6.xyzx).xyz;
/*69*/	r7.xyzw = (textureLod(gbuffer_channel_4_sampler, r0.xyxx.st, 0.000000)).yzxw;
/*70*/	r7.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*71*/	r7.w = 1.000000;
/*72*/	r3.w = dot(r7.xyzw, cb0.data[19].xyzw);
/*73*/	r4.y = dot(r7.xyzw, cb0.data[20].xyzw);
/*74*/	r3.w = r3.w / r4.y;
/*75*/	r3.w = r3.w + -vsOut_T3.w;
/*76*/	r3.w = max(r3.w, 0.000000);
/*77*/	r4.y = dot(r7.xyzw, cb0.data[22].xyzw);
/*78*/	r5.w = dot(r7.xyzw, cb0.data[24].xyzw);
/*79*/	r4.y = r4.y / r5.w;
/*80*/	r4.y = -r4.y + vsOut_T3.y;
/*81*/	r4.y = max(r4.y, 0.000000);
/*82*/	r5.w = r4.y * 4.000000;
/*83*/	r5.w = min(r5.w, 1.000000);
/*84*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.xyxx.st, r0.y)).xyzw;
/*85*/	r7.xy = (r1.xzxx * r7.wwww).xy;
/*86*/	r7.xy = (r5.wwww * r7.xyxx).xy;
/*87*/	r0.xy = (r7.xyxx * vec4(0.008333, 0.008333, 0.000000, 0.000000) + r0.xyxx).xy;
/*88*/	r7.xyzw = (textureLod(s_terrain_refraction, r0.xyxx.st, r0.y)).xyzw;
/*89*/	r8.xyzw = log2(cb1.data[10].xyzw);
/*90*/	r8.xyz = (r4.yyyy * r8.xyzx).xyz;
/*91*/	r8.xyz = (exp2(r8.xyzx)).xyz;
/*92*/	r0.x = r3.w * r8.w;
/*93*/	r0.x = exp2(r0.x);
/*94*/	r0.x = min(r0.x, 1.000000);
/*95*/	r7.xyz = (r7.xyzx * r8.xyzx + -r6.xyzx).xyz;
/*96*/	r6.xyz = (r0.xxxx * r7.xyzx + r6.xyzx).xyz;
/*97*/	r0.x = -r0.w * r5.w + 1.000000;
/*98*/	r0.xyw = (r6.xyxz * r0.xxxx).xyw;
/*99*/	r0.xyw = (r5.xyxz * r5.wwww + r0.xyxw).xyw;
/*100*/	r3.w = dot(vec3(-cb1.data[0].ywzy), vec3(r4.xzwx));
/*101*/	r3.w = max(r3.w, -1.000000);
/*102*/	r3.w = min(r3.w, 1.000000);
/*103*/	r4.y = -abs(r3.w) + 1.000000;
/*104*/	r4.y = sqrt(r4.y);
/*105*/	r5.x = abs(r3.w) * -0.018729 + 0.074261;
/*106*/	r5.x = r5.x * abs(r3.w) + -0.212114;
/*107*/	r5.x = r5.x * abs(r3.w) + 1.570729;
/*108*/	r5.y = r4.y * r5.x;
/*109*/	r5.y = r5.y * -2.000000 + 3.141593;
/*110*/	r3.w = uintBitsToFloat((r3.w < -r3.w) ? 0xffffffffu : 0x00000000u);
/*111*/	r3.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r5.y));
/*112*/	r3.w = r5.x * r4.y + r3.w;
/*113*/	r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r1.xyzx));
/*114*/	r1.y = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*115*/	if(floatBitsToUint(r1.y) != 0u) {
/*116*/	    r1.z = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.487991 : -0.000049;
/*117*/	  r1.z = r1.z + r2.w;
/*118*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*119*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*120*/	  r1.z = -r1.z * r1.z + 1.000000;
/*121*/	  r1.z = max(r1.z, 0.001000);
/*122*/	  r1.z = log2(r1.z);
/*123*/	  r4.y = r1.z * 4.950617;
/*124*/	  r1.z = r1.z * 0.346574 + 4.546885;
/*125*/	  r4.y = r1.z * r1.z + -r4.y;
/*126*/	  r4.y = sqrt(r4.y);
/*127*/	  r1.z = -r1.z + r4.y;
/*128*/	  r1.z = max(r1.z, 0.000000);
/*129*/	  r1.z = sqrt(r1.z);
/*130*/	  r1.z = r1.z * 1.414214;
/*131*/	  r1.z = 0.008727 / r1.z;
/*132*/	  r1.z = max(r1.z, 0.000100);
/*133*/	  r5.xy = (r3.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*134*/	  r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*135*/	  r5.xy = (r1.zzzz * r5.xyxx).xy;
/*136*/	  r6.xy = (r5.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*137*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*138*/	  r7.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*139*/	  r6.zw = (r7.xxxz / r7.yyyw).zw;
/*140*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*141*/	  r5.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r5.xxyx)) * 0xffffffffu)).yz;
/*142*/	  r1.z = uintBitsToFloat((r5.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*143*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*144*/	  r1.z = floatBitsToInt(r1.z);
/*145*/	  r5.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*146*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*147*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*148*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*149*/	  r1.z = r1.z * r5.x + 1.000000;
/*150*/	  r1.z = r1.z * 0.500000;
/*151*/	  r4.y = 1 + ~floatBitsToInt(r5.z);
/*152*/	  r4.y = r4.y * r5.y + 1.000000;
/*153*/	  r1.z = r4.y * 0.500000 + -r1.z;
/*154*/	  r4.y = saturate(r1.x);
/*155*/	  r4.y = r4.y + -1.000000;
/*156*/	  r4.y = r4.y * 0.453991 + 1.000000;
/*157*/	  r5.x = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*158*/	  r5.x = max(r5.x, 0.000000);
/*159*/	  r5.x = log2(r5.x);
/*160*/	  r5.x = r5.x * 10.000000;
/*161*/	  r5.x = exp2(r5.x);
/*162*/	  r5.x = r5.x * 0.804248 + 0.150000;
/*163*/	  r1.z = abs(r1.z) * r4.y;
/*164*/	  r5.xyz = (r5.xxxx * r1.zzzz).xyz;
/*165*/	} else {
/*166*/	  r5.xyz = (vec4(0, 0, 0, 0)).xyz;
/*167*/	}
/*168*/	r5.xyz = (r5.xyzx * cb1.data[1].xyzx).xyz;
/*169*/	if(floatBitsToUint(r1.y) != 0u) {
/*170*/	    r1.y = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.159344 : -0.000016;
/*171*/	  r1.y = r1.y + r2.w;
/*172*/	  r1.y = r1.y * 0.500000 + 0.500000;
/*173*/	  r1.y = r1.y * 2.000000 + -1.000000;
/*174*/	  r1.y = -r1.y * r1.y + 1.000000;
/*175*/	  r1.y = max(r1.y, 0.001000);
/*176*/	  r1.y = log2(r1.y);
/*177*/	  r1.z = r1.y * 4.950617;
/*178*/	  r1.y = r1.y * 0.346574 + 4.546885;
/*179*/	  r1.z = r1.y * r1.y + -r1.z;
/*180*/	  r1.z = sqrt(r1.z);
/*181*/	  r1.y = -r1.y + r1.z;
/*182*/	  r1.y = max(r1.y, 0.000000);
/*183*/	  r1.y = sqrt(r1.y);
/*184*/	  r1.y = r1.y * 1.414214;
/*185*/	  r1.y = 0.008727 / r1.y;
/*186*/	  r1.y = max(r1.y, 0.000100);
/*187*/	  r1.zw = (r3.wwww + vec4(0.000000, 0.000000, -0.008727, 0.008727)).zw;
/*188*/	  r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*189*/	  r1.yz = (r1.yyyy * r1.zzwz).yz;
/*190*/	  r6.xy = (r1.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*191*/	  r6.xy = (r6.xyxx * r6.xyxx).xy;
/*192*/	  r7.xyzw = r6.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*193*/	  r6.zw = (r7.xxxz / r7.yyyw).zw;
/*194*/	  r6.xy = (r6.zwzz * -r6.xyxx).xy;
/*195*/	  r1.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.yyyz)) * 0xffffffffu)).zw;
/*196*/	  r1.y = uintBitsToFloat((r1.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*197*/	  r1.y = intBitsToFloat(1 + ~floatBitsToInt(r1.z) + floatBitsToInt(r1.y));
/*198*/	  r1.y = floatBitsToInt(r1.y);
/*199*/	  r6.xy = (r6.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*200*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*201*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*202*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*203*/	  r1.y = r1.y * r6.x + 1.000000;
/*204*/	  r1.y = r1.y * 0.500000;
/*205*/	  r1.z = 1 + ~floatBitsToInt(r1.w);
/*206*/	  r1.z = r1.z * r6.y + 1.000000;
/*207*/	  r1.y = r1.z * 0.500000 + -r1.y;
/*208*/	  r1.x = saturate(r1.x);
/*209*/	  r1.x = r1.x + -1.000000;
/*210*/	  r1.x = r1.x * 0.809017 + 1.000000;
/*211*/	  r1.z = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*212*/	  r1.z = max(r1.z, 0.000000);
/*213*/	  r1.z = log2(r1.z);
/*214*/	  r1.z = r1.z * 10.000000;
/*215*/	  r1.z = exp2(r1.z);
/*216*/	  r1.z = r1.z * 0.660013 + 0.150000;
/*217*/	  r1.x = r1.x * abs(r1.y);
/*218*/	  r1.xyz = (r1.zzzz * r1.xxxx).xyz;
/*219*/	} else {
/*220*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*221*/	}
/*222*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*223*/	r1.xyz = (r1.xyzx * vec4(0.150000, 0.150000, 0.150000, 0.000000)).xyz;
/*224*/	r1.xyz = (r5.xyzx * vec4(0.850000, 0.850000, 0.850000, 0.000000) + r1.xyzx).xyz;
/*225*/	color3.xyz = (r5.wwww * r1.xyzx + r0.xywx).xyz;
/*226*/	r0.xyz = (r2.xyzx * r0.zzzz + r4.xwzx).xyz;
/*227*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*228*/	r0.w = inversesqrt(r0.w);
/*229*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*230*/	r0.w = max(abs(r0.z), abs(r0.y));
/*231*/	r0.w = max(r0.w, abs(r0.x));
/*232*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*233*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*234*/	color0.w = 0.120000;
/*235*/	color1.xyzw = vec4(0, 0, 0, 0.150000);
/*236*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*237*/	color3.w = 1.000000;
/*238*/	return;
}
