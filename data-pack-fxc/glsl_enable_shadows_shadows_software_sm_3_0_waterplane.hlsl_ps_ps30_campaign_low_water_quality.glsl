//
//
// Shader Model 4
// Fragment Shader
//
// id: 6651 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_waterplane.hlsl_PS_ps30_campaign_low_water_quality.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T3;
in vec4 vsOut_T4;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D s_lf_colour;
uniform sampler2D detail_normal_sampler;
uniform sampler2D sea_surface_sampler;
uniform sampler2D swell_surface_sampler;
uniform samplerCube s_environment;
uniform sampler2D refraction_texture_sampler;
uniform sampler2D s_shroud;
uniform sampler2D s_overlay;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform shroud_PS
{
  vec4 data[5];
} cb2;
layout(std140) uniform OceanSharedConstants
{
  vec4 data[5];
} cb3;
layout(std140) uniform campaign_CB
{
  vec4 data[3];
} cb4;
layout(std140) uniform campaign_ocean_cb
{
  vec4 data[2];
} cb5;

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

/*0*/	r0.xyzw = vsOut_T3.xzxz * cb5.data[0].xxyy;
/*1*/	r1.xy = (vsOut_T3.xzxx / cb4.data[1].xyxx).xy;
/*2*/	r1.z = -r1.y + 1.000000;
/*3*/	r1.xyzw = (texture(s_lf_colour, r1.xzxx.st)).xyzw;
/*4*/	r2.xyz = (-vsOut_T3.xyzx + cb0.data[0].xyzx).xyz;
/*5*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*6*/	r1.w = inversesqrt(r1.w);
/*7*/	r3.xyz = (r1.wwww * r2.xyzx).xyz;
/*8*/	r4.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*9*/	r4.xy = (r4.xyxx * cb0.data[27].zwzz).xy;
/*10*/	r5.xyzw = cb0.data[26].xxxx * cb3.data[2].zzww;
/*11*/	r5.xyzw = r5.xyzw * vec4(0.003420, -0.009397, -0.006947, -0.007193);
/*12*/	r5.xyzw = r0.xyxy * cb3.data[2].xxyy + r5.xyzw;
/*13*/	r6.xyzw = (texture(detail_normal_sampler, r5.xyxx.st)).xyzw;
/*14*/	r4.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*15*/	r6.xz = (r4.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*16*/	r2.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*17*/	r2.w = -r2.w + 1.000000;
/*18*/	r2.w = max(r2.w, 0.000000);
/*19*/	r6.y = sqrt(r2.w);
/*20*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*21*/	r5.xyzw = (texture(detail_normal_sampler, r5.zwzz.st)).xyzw;
/*22*/	r4.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*23*/	r5.xz = (r4.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*24*/	r2.w = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*25*/	r2.w = -r2.w + 1.000000;
/*26*/	r2.w = max(r2.w, 0.000000);
/*27*/	r5.y = sqrt(r2.w);
/*28*/	r5.xyz = (r5.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*29*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*30*/	r5.xyz = (r5.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*31*/	r2.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*32*/	r5.xyz = (r6.yyyy * r5.xyzx).xyz;
/*33*/	r5.xyz = (r6.xyzx * r2.wwww + -r5.xyzx).xyz;
/*34*/	r2.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*35*/	r2.w = inversesqrt(r2.w);
/*36*/	r5.xyz = (r2.wwww * r5.xyzx).xyz;
/*37*/	r6.xyzw = (texture(sea_surface_sampler, r0.xyxx.st)).xyzw;
/*38*/	r0.xy = (r6.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*39*/	r6.xyzw = (texture(swell_surface_sampler, r0.zwzz.st)).xyzw;
/*40*/	r0.zw = (r6.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*41*/	r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, 6.283185, 6.283185)).zw;
/*42*/	r0.xy = (r0.xyxx * vec4(6.283185, 6.283185, 0.000000, 0.000000) + r0.zwzz).xy;
/*43*/	r0.xy = sin(vec2(r0.xyxx)); r6.xy = cos(vec2(r0.xyxx));
/*44*/	r6.y = r6.y * r6.x;
/*45*/	r6.xz = (r0.xxyx).xz;
/*46*/	r0.x = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*47*/	r0.x = inversesqrt(r0.x);
/*48*/	r0.xyz = (r0.xxxx * r6.xyzx).xyz;
/*49*/	r0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*50*/	r5.xyz = (r5.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*51*/	r0.xyz = (r0.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*52*/	r5.xyz = (r5.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*53*/	r0.w = dot(vec3(r0.xyzx), vec3(r5.xyzx));
/*54*/	r5.xyz = (r0.yyyy * r5.xyzx).xyz;
/*55*/	r0.xyz = (r0.xyzx * r0.wwww + -r5.xyzx).xyz;
/*56*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*59*/	r5.xyz = (r0.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*60*/	r0.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r5.xyz = (r0.wwww * r5.xyzx).xyz;
/*63*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r5.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*64*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*65*/	r6.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*66*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*67*/	r5.xyz = (r5.xyzx * r5.xyzx).xyz;
/*68*/	r6.xyz = (r6.xywx * r5.yyyy).xyz;
/*69*/	r5.xyw = (r5.xxxx * r7.xyxz + r6.xyxz).xyw;
/*70*/	r5.xyz = (r5.zzzz * r8.xyzx + r5.xywx).xyz;
/*71*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r4.zw = (mix(vec4(0, 0, 1.000000, 1.000000), vec4(0, 0, 360.000000, 0.004000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*73*/	r5.xyz = (r4.zzzz * r5.xyzx).xyz;
/*74*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*75*/	r2.w = r2.w + r2.w;
/*76*/	r6.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*77*/	r6.w = abs(r6.y);
/*78*/	r2.w = dot(vec3(r6.xwzx), vec3(-r3.xyzx));
/*79*/	r2.w = max(r2.w, 0.000000);
/*80*/	r2.w = log2(r2.w);
/*81*/	r2.w = r2.w * 10.000000;
/*82*/	r2.w = exp2(r2.w);
/*83*/	r2.w = r2.w * 0.453839 + 0.020000;
/*84*/	if(floatBitsToUint(cb1.data[11].y) == 0u) {
/*85*/	  r3.w = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*86*/	  r3.w = inversesqrt(r3.w);
/*87*/	  r7.xyz = (r3.wwww * r6.xwzx).xyz;
/*88*/	  r7.xyzw = (textureLod(s_environment, r7.xyzx.stp, 0.000000)).xyzw;
/*89*/	  r7.xyz = (r2.wwww * r7.xyzx).xyz;
/*90*/	} else {
/*91*/	  r7.xyz = (vec4(0, 0, 0, 0)).xyz;
/*92*/	}
/*93*/	r3.w = max(-cb1.data[0].z, 0.000000);
/*94*/	r8.xyz = (r1.xyzx * r3.wwww).xyz;
/*95*/	r8.xyz = (r8.xyzx * cb1.data[1].xyzx).xyz;
/*96*/	r1.xyz = (r1.xyzx * r5.xyzx).xyz;
/*97*/	r1.xyz = (r4.wwww * r1.xyzx).xyz;
/*98*/	r1.xyz = (r8.xyzx * r4.wwww + r1.xyzx).xyz;
/*99*/	r5.xyz = (-cb1.data[10].xyzx * cb1.data[10].wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*100*/	r5.xyz = (-r5.xyzx * cb3.data[3].xxxx).xyz;
/*101*/	r5.xyz = (r5.xyzx * vec4(2.164042, 2.164042, 2.164042, 0.000000)).xyz;
/*102*/	r5.xyz = (exp2(r5.xyzx)).xyz;
/*103*/	r8.xyzw = (texture(refraction_texture_sampler, r4.xyxx.st)).xyzw;
/*104*/	r4.xyz = (r8.xyzx * r5.xyzx + -r1.xyzx).xyz;
/*105*/	r1.xyz = (r5.xyzx * r4.xyzx + r1.xyzx).xyz;
/*106*/	r2.w = -r2.w + 1.000000;
/*107*/	r1.xyz = (r2.wwww * r1.xyzx + r7.xyzx).xyz;
/*108*/	r2.w = dot(vec3(-cb1.data[0].ywzy), vec3(r6.xzwx));
/*109*/	r2.w = max(r2.w, -1.000000);
/*110*/	r2.w = min(r2.w, 1.000000);
/*111*/	r3.w = -abs(r2.w) + 1.000000;
/*112*/	r3.w = sqrt(r3.w);
/*113*/	r4.x = abs(r2.w) * -0.018729 + 0.074261;
/*114*/	r4.x = r4.x * abs(r2.w) + -0.212114;
/*115*/	r4.x = r4.x * abs(r2.w) + 1.570729;
/*116*/	r4.y = r3.w * r4.x;
/*117*/	r4.y = r4.y * -2.000000 + 3.141593;
/*118*/	r2.w = uintBitsToFloat((r2.w < -r2.w) ? 0xffffffffu : 0x00000000u);
/*119*/	r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r4.y));
/*120*/	r2.w = r4.x * r3.w + r2.w;
/*121*/	r0.x = dot(vec3(-cb1.data[0].yzwy), vec3(r0.xyzx));
/*122*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*123*/	if(floatBitsToUint(r0.y) != 0u) {
/*124*/	    r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.014341 : -0.000001;
/*125*/	  r0.z = r0.z + r4.w;
/*126*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*127*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*128*/	  r0.z = -r0.z * r0.z + 1.000000;
/*129*/	  r0.z = max(r0.z, 0.001000);
/*130*/	  r0.z = log2(r0.z);
/*131*/	  r3.w = r0.z * 4.950617;
/*132*/	  r0.z = r0.z * 0.346574 + 4.546885;
/*133*/	  r3.w = r0.z * r0.z + -r3.w;
/*134*/	  r3.w = sqrt(r3.w);
/*135*/	  r0.z = -r0.z + r3.w;
/*136*/	  r0.z = max(r0.z, 0.000000);
/*137*/	  r0.z = sqrt(r0.z);
/*138*/	  r0.z = r0.z * 1.414214;
/*139*/	  r0.z = 0.008727 / r0.z;
/*140*/	  r0.z = max(r0.z, 0.000100);
/*141*/	  r4.xy = (r2.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*142*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*143*/	  r4.xy = (r0.zzzz * r4.xyxx).xy;
/*144*/	  r5.xy = (r4.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*145*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*146*/	  r7.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*147*/	  r5.zw = (r7.xxxz / r7.yyyw).zw;
/*148*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*149*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*150*/	  r0.z = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*151*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r0.z));
/*152*/	  r0.z = floatBitsToInt(r0.z);
/*153*/	  r4.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*154*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*155*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*156*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*157*/	  r0.z = r0.z * r4.x + 1.000000;
/*158*/	  r0.z = r0.z * 0.500000;
/*159*/	  r3.w = 1 + ~floatBitsToInt(r4.z);
/*160*/	  r3.w = r3.w * r4.y + 1.000000;
/*161*/	  r0.z = r3.w * 0.500000 + -r0.z;
/*162*/	  r3.w = saturate(r0.x);
/*163*/	  r3.w = r3.w + -1.000000;
/*164*/	  r3.w = r3.w * 0.982287 + 1.000000;
/*165*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*166*/	  r4.x = max(r4.x, 0.000000);
/*167*/	  r4.x = log2(r4.x);
/*168*/	  r4.x = r4.x * 10.000000;
/*169*/	  r4.x = exp2(r4.x);
/*170*/	  r4.x = r4.x * 0.453839 + 0.020000;
/*171*/	  r0.z = abs(r0.z) * r3.w;
/*172*/	  r4.xyz = (r4.xxxx * r0.zzzz).xyz;
/*173*/	} else {
/*174*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*175*/	}
/*176*/	r4.xyz = (r4.xyzx * cb1.data[1].xyzx).xyz;
/*177*/	if(floatBitsToUint(r0.y) != 0u) {
/*178*/	    r0.y = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.248975 : -0.000025;
/*179*/	  r0.y = r0.y + r4.w;
/*180*/	  r0.y = r0.y * 0.500000 + 0.500000;
/*181*/	  r0.y = r0.y * 2.000000 + -1.000000;
/*182*/	  r0.y = -r0.y * r0.y + 1.000000;
/*183*/	  r0.y = max(r0.y, 0.001000);
/*184*/	  r0.y = log2(r0.y);
/*185*/	  r0.z = r0.y * 4.950617;
/*186*/	  r0.y = r0.y * 0.346574 + 4.546885;
/*187*/	  r0.z = r0.y * r0.y + -r0.z;
/*188*/	  r0.z = sqrt(r0.z);
/*189*/	  r0.y = -r0.y + r0.z;
/*190*/	  r0.y = max(r0.y, 0.000000);
/*191*/	  r0.y = sqrt(r0.y);
/*192*/	  r0.y = r0.y * 1.414214;
/*193*/	  r0.y = 0.008727 / r0.y;
/*194*/	  r0.y = max(r0.y, 0.000100);
/*195*/	  r0.zw = (r2.wwww + vec4(0.000000, 0.000000, -0.008727, 0.008727)).zw;
/*196*/	  r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*197*/	  r0.yz = (r0.yyyy * r0.zzwz).yz;
/*198*/	  r5.xy = (r0.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*199*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*200*/	  r7.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*201*/	  r5.zw = (r7.xxxz / r7.yyyw).zw;
/*202*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*203*/	  r0.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.yyyz)) * 0xffffffffu)).zw;
/*204*/	  r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*205*/	  r0.y = intBitsToFloat(1 + ~floatBitsToInt(r0.z) + floatBitsToInt(r0.y));
/*206*/	  r0.y = floatBitsToInt(r0.y);
/*207*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*208*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*209*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*210*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*211*/	  r0.y = r0.y * r5.x + 1.000000;
/*212*/	  r0.y = r0.y * 0.500000;
/*213*/	  r0.z = 1 + ~floatBitsToInt(r0.w);
/*214*/	  r0.z = r0.z * r5.y + 1.000000;
/*215*/	  r0.y = r0.z * 0.500000 + -r0.y;
/*216*/	  r0.x = saturate(r0.x);
/*217*/	  r0.x = r0.x + -1.000000;
/*218*/	  r0.x = r0.x * 0.707107 + 1.000000;
/*219*/	  r0.z = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*220*/	  r0.z = max(r0.z, 0.000000);
/*221*/	  r0.z = log2(r0.z);
/*222*/	  r0.z = r0.z * 10.000000;
/*223*/	  r0.z = exp2(r0.z);
/*224*/	  r0.z = r0.z * 0.830475 + 0.020000;
/*225*/	  r0.x = r0.x * abs(r0.y);
/*226*/	  r0.xyz = (r0.zzzz * r0.xxxx).xyz;
/*227*/	} else {
/*228*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*229*/	}
/*230*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*231*/	r0.xyz = (r0.xyzx * vec4(0.700000, 0.700000, 0.700000, 0.000000)).xyz;
/*232*/	r0.xyz = (r4.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r0.xyzx).xyz;
/*233*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*234*/	r1.xyz = (r2.xyzx * r1.wwww + r6.xwzx).xyz;
/*235*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*236*/	r0.w = inversesqrt(r0.w);
/*237*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*238*/	r0.w = max(abs(r1.z), abs(r1.y));
/*239*/	r0.w = max(r0.w, abs(r1.x));
/*240*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*241*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*242*/	color0.w = 0.120000;
/*243*/	r0.w = uintBitsToFloat((0.500000 < cb2.data[0].x) ? 0xffffffffu : 0x00000000u);
/*244*/	if(floatBitsToUint(r0.w) != 0u) {
/*245*/	  r1.xyzw = vsOut_T3.xzxz + -cb2.data[1].xyxy;
/*246*/	  r2.xyzw = -cb2.data[1].xyxy + cb2.data[1].zwzw;
/*247*/	  r1.xyzw = r1.xyzw / r2.xyzw;
/*248*/	  r2.xyzw = -cb2.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*249*/	  r1.xyzw = r1.xyzw * r2.xyzw + cb2.data[4].xyxy;
/*250*/	  r2.xyzw = (textureLod(s_shroud, r1.zwzz.st, r1.w)).xyzw;
/*251*/	  r1.xyzw = r1.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*252*/	  r1.xyzw = saturate(r1.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*253*/	  r3.xyzw = r1.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*254*/	  r1.xyzw = r1.xyzw * r1.xyzw;
/*255*/	  r1.xyzw = r1.xyzw * r3.xyzw;
/*256*/	  r0.w = r2.x * r1.x;
/*257*/	  r0.w = r0.w * r1.y;
/*258*/	  r0.w = r1.z * -r0.w + r0.w;
/*259*/	  r0.w = r1.w * -r0.w + r0.w;
/*260*/	} else {
/*261*/	  r0.w = 1.000000;
/*262*/	}
/*263*/	r1.xy = (r0.wwww + vec4(-0.500000, -0.100000, 0.000000, 0.000000)).xy;
/*264*/	r0.w = saturate(r1.x + r1.x);
/*265*/	r1.x = r0.w * -2.000000 + 3.000000;
/*266*/	r0.w = r0.w * r0.w;
/*267*/	r0.w = r0.w * r1.x;
/*268*/	r1.x = saturate(r1.y * 2.500000);
/*269*/	r1.y = r1.x * -2.000000 + 3.000000;
/*270*/	r1.x = r1.x * r1.x;
/*271*/	r1.x = r1.x * r1.y;
/*272*/	r1.x = r1.x * 0.200000;
/*273*/	r1.xyz = saturate(r0.xyzx * r1.xxxx).xyz;
/*274*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*275*/	r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*276*/	r1.xy = (vsOut_T4.xyxx / vsOut_T4.wwww).xy;
/*277*/	r1.yz = (r1.xxyx * vec4(0.000000, 0.500000, -0.500000, 0.000000) + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*278*/	r1.xw = (-r1.zzzz + vec4(1.000000, 0.000000, 0.000000, 1.000000)).xw;
/*279*/	r1.xyzw = (textureLod(s_overlay, r1.ywyy.st, r1.x)).xyzw;
/*280*/	color3.xyz = (r0.xyzx * r1.wwww + r1.xyzx).xyz;
/*281*/	color1.xyzw = vec4(0, 0, 0, 0.020000);
/*282*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*283*/	color3.w = 1.000000;
/*284*/	return;
}
