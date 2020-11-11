//
//
// Shader Model 4
// Fragment Shader
//
// id: 224 - fxc/glsl_SM_3_0_waterplane.hlsl_PS_ps30_campaign_medium_water_quality.glsl
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
uniform sampler2D gbuffer_channel_4_sampler;
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
  vec4 r10;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = vsOut_T3.xzxz * cb5.data[0].xxyy;
/*1*/	r1.xy = (vsOut_T3.xzxx / cb4.data[1].xyxx).xy;
/*2*/	r1.z = -r1.y + 1.000000;
/*3*/	r1.xyzw = (texture(s_lf_colour, r1.xzxx.st)).xyzw;
/*4*/	r2.xyz = (-vsOut_T3.xyzx + cb0.data[0].xyzx).xyz;
/*5*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*6*/	r1.w = inversesqrt(r1.w);
/*7*/	r3.xyz = (r1.wwww * r2.xyzx).xyz;
/*8*/	r4.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*9*/	r4.zw = (r4.xxxy * cb0.data[27].zzzw).zw;
/*10*/	r5.xy = (r4.xyxx * cb0.data[29].zwzz).xy;
/*11*/	r6.xyzw = cb0.data[26].xxxx * cb3.data[2].zzww;
/*12*/	r6.xyzw = r6.xyzw * vec4(0.003420, -0.009397, -0.006947, -0.007193);
/*13*/	r6.xyzw = r0.xyxy * cb3.data[2].xxyy + r6.xyzw;
/*14*/	r7.xyzw = (texture(detail_normal_sampler, r6.xyxx.st)).xyzw;
/*15*/	r5.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*16*/	r7.xz = (r5.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*17*/	r2.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*18*/	r2.w = -r2.w + 1.000000;
/*19*/	r2.w = max(r2.w, 0.000000);
/*20*/	r7.y = sqrt(r2.w);
/*21*/	r7.xyz = (r7.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*22*/	r6.xyzw = (texture(detail_normal_sampler, r6.zwzz.st)).xyzw;
/*23*/	r5.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*24*/	r6.xz = (r5.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*25*/	r2.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*26*/	r2.w = -r2.w + 1.000000;
/*27*/	r2.w = max(r2.w, 0.000000);
/*28*/	r6.y = sqrt(r2.w);
/*29*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*30*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*31*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*32*/	r2.w = dot(vec3(r7.xyzx), vec3(r6.xyzx));
/*33*/	r6.xyz = (r7.yyyy * r6.xyzx).xyz;
/*34*/	r6.xyz = (r7.xyzx * r2.wwww + -r6.xyzx).xyz;
/*35*/	r2.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*36*/	r2.w = inversesqrt(r2.w);
/*37*/	r6.xyz = (r2.wwww * r6.xyzx).xyz;
/*38*/	r7.xyzw = (texture(sea_surface_sampler, r0.xyxx.st)).xyzw;
/*39*/	r0.xy = (r7.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*40*/	r7.xyzw = (texture(swell_surface_sampler, r0.zwzz.st)).xyzw;
/*41*/	r0.zw = (r7.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*42*/	r0.zw = (r0.zzzw * vec4(0.000000, 0.000000, 6.283185, 6.283185)).zw;
/*43*/	r0.xy = (r0.xyxx * vec4(6.283185, 6.283185, 0.000000, 0.000000) + r0.zwzz).xy;
/*44*/	r0.xy = sin(vec2(r0.xyxx)); r7.xy = cos(vec2(r0.xyxx));
/*45*/	r7.y = r7.y * r7.x;
/*46*/	r7.xz = (r0.xxyx).xz;
/*47*/	r0.x = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*48*/	r0.x = inversesqrt(r0.x);
/*49*/	r0.xyz = (r0.xxxx * r7.xyzx).xyz;
/*50*/	r0.xyz = (r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*51*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*52*/	r0.xyz = (r0.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*53*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*54*/	r0.w = dot(vec3(r0.xyzx), vec3(r6.xyzx));
/*55*/	r6.xyz = (r0.yyyy * r6.xyzx).xyz;
/*56*/	r0.xyz = (r0.xyzx * r0.wwww + -r6.xyzx).xyz;
/*57*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*60*/	r6.xyz = (r0.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*61*/	r0.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r6.xyz = (r0.wwww * r6.xyzx).xyz;
/*64*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*65*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*66*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*67*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*68*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*69*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*70*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*71*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*72*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r5.zw = (mix(vec4(0, 0, 1.000000, 1.000000), vec4(0, 0, 360.000000, 0.004000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*74*/	r6.xyz = (r5.zzzz * r6.xyzx).xyz;
/*75*/	r2.w = dot(vec3(-r3.xyzx), vec3(r0.xyzx));
/*76*/	r2.w = r2.w + r2.w;
/*77*/	r7.xyz = (r0.xyzx * -r2.wwww + -r3.xyzx).xyz;
/*78*/	r7.w = abs(r7.y);
/*79*/	r2.w = dot(vec3(r7.xwzx), vec3(-r3.xyzx));
/*80*/	r2.w = max(r2.w, 0.000000);
/*81*/	r2.w = log2(r2.w);
/*82*/	r2.w = r2.w * 10.000000;
/*83*/	r2.w = exp2(r2.w);
/*84*/	r2.w = r2.w * 0.453839 + 0.020000;
/*85*/	r8.xyzw = (textureLod(gbuffer_channel_4_sampler, r4.zwzz.st, 0.000000)).yzxw;
/*86*/	r8.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*87*/	r8.w = 1.000000;
/*88*/	r5.x = dot(r8.xyzw, cb0.data[21].xyzw);
/*89*/	r5.y = dot(r8.xyzw, cb0.data[22].xyzw);
/*90*/	r5.z = dot(r8.xyzw, cb0.data[23].xyzw);
/*91*/	r3.w = dot(r8.xyzw, cb0.data[24].xyzw);
/*92*/	r5.xyz = (r5.xyzx / r3.wwww).xyz;
/*93*/	r3.w = -r5.y + vsOut_T3.y;
/*94*/	r3.w = max(r3.w, 0.000000);
/*95*/	r5.xyz = (r5.xyzx + -vsOut_T3.xyzx).xyz;
/*96*/	r5.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*97*/	r5.x = sqrt(r5.x);
/*98*/	if(floatBitsToUint(cb1.data[11].y) == 0u) {
/*99*/	  r5.y = dot(vec3(r7.xzwx), vec3(r7.xzwx));
/*100*/	  r5.y = inversesqrt(r5.y);
/*101*/	  r8.xyz = (r5.yyyy * r7.xwzx).xyz;
/*102*/	  r8.xyzw = (textureLod(s_environment, r8.xyzx.stp, 0.000000)).xyzw;
/*103*/	  r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*104*/	  r5.y = min(r5.x, 1.000000);
/*105*/	  r8.xyz = (r5.yyyy * r8.xyzx).xyz;
/*106*/	} else {
/*107*/	  r8.xyz = (vec4(0, 0, 0, 0)).xyz;
/*108*/	}
/*109*/	r5.y = max(-cb1.data[0].z, 0.000000);
/*110*/	r9.xyz = (r1.xyzx * r5.yyyy).xyz;
/*111*/	r9.xyz = (r9.xyzx * cb1.data[1].xyzx).xyz;
/*112*/	r1.xyz = (r1.xyzx * r6.xyzx).xyz;
/*113*/	r1.xyz = (r5.wwww * r1.xyzx).xyz;
/*114*/	r1.xyz = (r9.xyzx * r5.wwww + r1.xyzx).xyz;
/*115*/	r6.xyz = (-cb1.data[10].xyzx * cb1.data[10].wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*116*/	r5.xyz = (r5.xxxx * -r6.xyzx).xyz;
/*117*/	r5.xyz = (r5.xyzx * cb3.data[3].xxxx).xyz;
/*118*/	r5.xyz = (r5.xyzx * vec4(1.442695, 1.442695, 1.442695, 0.000000)).xyz;
/*119*/	r5.xyz = (exp2(r5.xyzx)).xyz;
/*120*/	r6.xy = (r0.xzxx * vec4(0.020000, 0.020000, 0.000000, 0.000000)).xy;
/*121*/	r3.w = min(r3.w, 3.000000);
/*122*/	r6.xy = (r3.wwww * r6.xyxx).xy;
/*123*/	r6.zw = (r4.xxxy * cb0.data[27].zzzw + r6.xxxy).zw;
/*124*/	r4.xy = (r4.xyxx * cb0.data[29].zwzz + r6.xyxx).xy;
/*125*/	r9.xyzw = (textureLod(gbuffer_channel_4_sampler, r6.zwzz.st, 0.000000)).yzxw;
/*126*/	r9.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*127*/	r9.w = 1.000000;
/*128*/	r10.x = dot(r9.xyzw, cb0.data[21].xyzw);
/*129*/	r10.y = dot(r9.xyzw, cb0.data[22].xyzw);
/*130*/	r10.z = dot(r9.xyzw, cb0.data[23].xyzw);
/*131*/	r3.w = dot(r9.xyzw, cb0.data[24].xyzw);
/*132*/	r9.xyz = (r10.xyzx / r3.wwww).xyz;
/*133*/	r9.xyz = (r9.xyzx + -cb0.data[0].xyzx).xyz;
/*134*/	r3.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*135*/	r3.w = sqrt(r3.w);
/*136*/	r9.xyz = (vsOut_T3.xyzx + -cb0.data[0].xyzx).xyz;
/*137*/	r4.x = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*138*/	r4.x = sqrt(r4.x);
/*139*/	r3.w = uintBitsToFloat((r4.x < r3.w) ? 0xffffffffu : 0x00000000u);
/*140*/	r6.xyzw = (texture(refraction_texture_sampler, r6.zwzz.st)).xyzw;
/*141*/	r4.xyzw = (texture(refraction_texture_sampler, r4.zwzz.st)).xyzw;
/*142*/	if(floatBitsToUint(r3.w) != 0u) {
/*143*/	  r4.xyz = (r6.xyzx).xyz;
/*144*/	}
/*145*/	r4.xyz = (r4.xyzx * r5.xyzx + -r1.xyzx).xyz;
/*146*/	r1.xyz = (r5.xyzx * r4.xyzx + r1.xyzx).xyz;
/*147*/	r2.w = -r2.w + 1.000000;
/*148*/	r1.xyz = (r2.wwww * r1.xyzx + r8.xyzx).xyz;
/*149*/	r2.w = dot(vec3(-cb1.data[0].ywzy), vec3(r7.xzwx));
/*150*/	r2.w = max(r2.w, -1.000000);
/*151*/	r2.w = min(r2.w, 1.000000);
/*152*/	r3.w = -abs(r2.w) + 1.000000;
/*153*/	r3.w = sqrt(r3.w);
/*154*/	r4.x = abs(r2.w) * -0.018729 + 0.074261;
/*155*/	r4.x = r4.x * abs(r2.w) + -0.212114;
/*156*/	r4.x = r4.x * abs(r2.w) + 1.570729;
/*157*/	r4.y = r3.w * r4.x;
/*158*/	r4.y = r4.y * -2.000000 + 3.141593;
/*159*/	r2.w = uintBitsToFloat((r2.w < -r2.w) ? 0xffffffffu : 0x00000000u);
/*160*/	r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r4.y));
/*161*/	r2.w = r4.x * r3.w + r2.w;
/*162*/	r0.x = dot(vec3(-cb1.data[0].yzwy), vec3(r0.xyzx));
/*163*/	r0.y = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*164*/	if(floatBitsToUint(r0.y) != 0u) {
/*165*/	    r0.z = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.014341 : -0.000001;
/*166*/	  r0.z = r0.z + r5.w;
/*167*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*168*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*169*/	  r0.z = -r0.z * r0.z + 1.000000;
/*170*/	  r0.z = max(r0.z, 0.001000);
/*171*/	  r0.z = log2(r0.z);
/*172*/	  r3.w = r0.z * 4.950617;
/*173*/	  r0.z = r0.z * 0.346574 + 4.546885;
/*174*/	  r3.w = r0.z * r0.z + -r3.w;
/*175*/	  r3.w = sqrt(r3.w);
/*176*/	  r0.z = -r0.z + r3.w;
/*177*/	  r0.z = max(r0.z, 0.000000);
/*178*/	  r0.z = sqrt(r0.z);
/*179*/	  r0.z = r0.z * 1.414214;
/*180*/	  r0.z = 0.008727 / r0.z;
/*181*/	  r0.z = max(r0.z, 0.000100);
/*182*/	  r4.xy = (r2.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*183*/	  r0.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).z;
/*184*/	  r4.xy = (r0.zzzz * r4.xyxx).xy;
/*185*/	  r4.zw = (r4.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*186*/	  r4.zw = (r4.zzzw * r4.zzzw).zw;
/*187*/	  r6.xyzw = r4.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*188*/	  r5.xy = (r6.xzxx / r6.ywyy).xy;
/*189*/	  r4.zw = (-r4.zzzw * r5.xxxy).zw;
/*190*/	  r5.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*191*/	  r0.z = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*192*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.x) + floatBitsToInt(r0.z));
/*193*/	  r0.z = floatBitsToInt(r0.z);
/*194*/	  r4.xy = (r4.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*195*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*196*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*197*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*198*/	  r0.z = r0.z * r4.x + 1.000000;
/*199*/	  r0.z = r0.z * 0.500000;
/*200*/	  r3.w = 1 + ~floatBitsToInt(r5.y);
/*201*/	  r3.w = r3.w * r4.y + 1.000000;
/*202*/	  r0.z = r3.w * 0.500000 + -r0.z;
/*203*/	  r3.w = saturate(r0.x);
/*204*/	  r3.w = r3.w + -1.000000;
/*205*/	  r3.w = r3.w * 0.982287 + 1.000000;
/*206*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*207*/	  r4.x = max(r4.x, 0.000000);
/*208*/	  r4.x = log2(r4.x);
/*209*/	  r4.x = r4.x * 10.000000;
/*210*/	  r4.x = exp2(r4.x);
/*211*/	  r4.x = r4.x * 0.453839 + 0.020000;
/*212*/	  r0.z = abs(r0.z) * r3.w;
/*213*/	  r4.xyz = (r4.xxxx * r0.zzzz).xyz;
/*214*/	} else {
/*215*/	  r4.xyz = (vec4(0, 0, 0, 0)).xyz;
/*216*/	}
/*217*/	r4.xyz = (r4.xyzx * cb1.data[1].xyzx).xyz;
/*218*/	if(floatBitsToUint(r0.y) != 0u) {
/*219*/	    r0.y = (floatBitsToUint(r0.w) > 0x00000000u) ? 0.248975 : -0.000025;
/*220*/	  r0.y = r0.y + r5.w;
/*221*/	  r0.y = r0.y * 0.500000 + 0.500000;
/*222*/	  r0.y = r0.y * 2.000000 + -1.000000;
/*223*/	  r0.y = -r0.y * r0.y + 1.000000;
/*224*/	  r0.y = max(r0.y, 0.001000);
/*225*/	  r0.y = log2(r0.y);
/*226*/	  r0.z = r0.y * 4.950617;
/*227*/	  r0.y = r0.y * 0.346574 + 4.546885;
/*228*/	  r0.z = r0.y * r0.y + -r0.z;
/*229*/	  r0.z = sqrt(r0.z);
/*230*/	  r0.y = -r0.y + r0.z;
/*231*/	  r0.y = max(r0.y, 0.000000);
/*232*/	  r0.y = sqrt(r0.y);
/*233*/	  r0.y = r0.y * 1.414214;
/*234*/	  r0.y = 0.008727 / r0.y;
/*235*/	  r0.y = max(r0.y, 0.000100);
/*236*/	  r0.zw = (r2.wwww + vec4(0.000000, 0.000000, -0.008727, 0.008727)).zw;
/*237*/	  r0.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.y)).y;
/*238*/	  r0.yz = (r0.yyyy * r0.zzwz).yz;
/*239*/	  r5.xy = (r0.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*240*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*241*/	  r6.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*242*/	  r5.zw = (r6.xxxz / r6.yyyw).zw;
/*243*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*244*/	  r0.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.yyyz)) * 0xffffffffu)).zw;
/*245*/	  r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*246*/	  r0.y = intBitsToFloat(1 + ~floatBitsToInt(r0.z) + floatBitsToInt(r0.y));
/*247*/	  r0.y = floatBitsToInt(r0.y);
/*248*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*249*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*250*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*251*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*252*/	  r0.y = r0.y * r5.x + 1.000000;
/*253*/	  r0.y = r0.y * 0.500000;
/*254*/	  r0.z = 1 + ~floatBitsToInt(r0.w);
/*255*/	  r0.z = r0.z * r5.y + 1.000000;
/*256*/	  r0.y = r0.z * 0.500000 + -r0.y;
/*257*/	  r0.x = saturate(r0.x);
/*258*/	  r0.x = r0.x + -1.000000;
/*259*/	  r0.x = r0.x * 0.707107 + 1.000000;
/*260*/	  r0.z = dot(vec3(-cb1.data[0].yzwy), vec3(-r3.xyzx));
/*261*/	  r0.z = max(r0.z, 0.000000);
/*262*/	  r0.z = log2(r0.z);
/*263*/	  r0.z = r0.z * 10.000000;
/*264*/	  r0.z = exp2(r0.z);
/*265*/	  r0.z = r0.z * 0.830475 + 0.020000;
/*266*/	  r0.x = r0.x * abs(r0.y);
/*267*/	  r0.xyz = (r0.zzzz * r0.xxxx).xyz;
/*268*/	} else {
/*269*/	  r0.xyz = (vec4(0, 0, 0, 0)).xyz;
/*270*/	}
/*271*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*272*/	r0.xyz = (r0.xyzx * vec4(0.700000, 0.700000, 0.700000, 0.000000)).xyz;
/*273*/	r0.xyz = (r4.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r0.xyzx).xyz;
/*274*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*275*/	r1.xyz = (r2.xyzx * r1.wwww + r7.xwzx).xyz;
/*276*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*277*/	r0.w = inversesqrt(r0.w);
/*278*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*279*/	r0.w = max(abs(r1.z), abs(r1.y));
/*280*/	r0.w = max(r0.w, abs(r1.x));
/*281*/	r1.xyz = (r1.xyzx / r0.wwww).xyz;
/*282*/	color0.xyz = saturate(r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*283*/	color0.w = 0.120000;
/*284*/	r0.w = uintBitsToFloat((0.500000 < cb2.data[0].x) ? 0xffffffffu : 0x00000000u);
/*285*/	if(floatBitsToUint(r0.w) != 0u) {
/*286*/	  r1.xyzw = vsOut_T3.xzxz + -cb2.data[1].xyxy;
/*287*/	  r2.xyzw = -cb2.data[1].xyxy + cb2.data[1].zwzw;
/*288*/	  r1.xyzw = r1.xyzw / r2.xyzw;
/*289*/	  r2.xyzw = -cb2.data[4].xyxy * vec4(2.000000, 2.000000, 2.000000, 2.000000) + vec4(1.000000, 1.000000, 1.000000, 1.000000);
/*290*/	  r1.xyzw = r1.xyzw * r2.xyzw + cb2.data[4].xyxy;
/*291*/	  r2.xyzw = (textureLod(s_shroud, r1.zwzz.st, r1.w)).xyzw;
/*292*/	  r1.xyzw = r1.xyzw + vec4(0.010000, 0.010000, -1.000000, -1.000000);
/*293*/	  r1.xyzw = saturate(r1.xyzw * vec4(100.000000, 100.000000, 100.000099, 100.000099));
/*294*/	  r3.xyzw = r1.xyzw * vec4(-2.000000, -2.000000, -2.000000, -2.000000) + vec4(3.000000, 3.000000, 3.000000, 3.000000);
/*295*/	  r1.xyzw = r1.xyzw * r1.xyzw;
/*296*/	  r1.xyzw = r1.xyzw * r3.xyzw;
/*297*/	  r0.w = r2.x * r1.x;
/*298*/	  r0.w = r0.w * r1.y;
/*299*/	  r0.w = r1.z * -r0.w + r0.w;
/*300*/	  r0.w = r1.w * -r0.w + r0.w;
/*301*/	} else {
/*302*/	  r0.w = 1.000000;
/*303*/	}
/*304*/	r1.xy = (r0.wwww + vec4(-0.500000, -0.100000, 0.000000, 0.000000)).xy;
/*305*/	r0.w = saturate(r1.x + r1.x);
/*306*/	r1.x = r0.w * -2.000000 + 3.000000;
/*307*/	r0.w = r0.w * r0.w;
/*308*/	r0.w = r0.w * r1.x;
/*309*/	r1.x = saturate(r1.y * 2.500000);
/*310*/	r1.y = r1.x * -2.000000 + 3.000000;
/*311*/	r1.x = r1.x * r1.x;
/*312*/	r1.x = r1.x * r1.y;
/*313*/	r1.x = r1.x * 0.200000;
/*314*/	r1.xyz = saturate(r0.xyzx * r1.xxxx).xyz;
/*315*/	r0.xyz = (r0.xyzx + -r1.xyzx).xyz;
/*316*/	r0.xyz = (r0.wwww * r0.xyzx + r1.xyzx).xyz;
/*317*/	r1.xy = (vsOut_T4.xyxx / vsOut_T4.wwww).xy;
/*318*/	r1.yz = (r1.xxyx * vec4(0.000000, 0.500000, -0.500000, 0.000000) + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*319*/	r1.xw = (-r1.zzzz + vec4(1.000000, 0.000000, 0.000000, 1.000000)).xw;
/*320*/	r1.xyzw = (textureLod(s_overlay, r1.ywyy.st, r1.x)).xyzw;
/*321*/	color3.xyz = (r0.xyzx * r1.wwww + r1.xyzx).xyz;
/*322*/	color1.xyzw = vec4(0, 0, 0, 0.020000);
/*323*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*324*/	color3.w = 1.000000;
/*325*/	return;
}
