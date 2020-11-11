//
//
// Shader Model 4
// Fragment Shader
//
// id: 6791 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_4_0_ocean.hlsl_PS_ps30_main_low_water_quality.glsl
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
in vec4 vsOut_T5;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D detail_normal_sampler;
uniform sampler2D sea_surface_sampler;
uniform sampler2D swell_surface_sampler;
uniform samplerCube s_environment;
uniform sampler2D refraction_texture_sampler;
uniform sampler2D colour_overlay_texture_sampler;
uniform sampler2D ui_colour_overlay_texture_sampler;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform OceanSharedConstants
{
  vec4 data[5];
} cb2;

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

/*0*/	r0.xyz = (-vsOut_T1.xyzx + cb0.data[0].xyzx).xyz;
/*1*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*2*/	r0.w = inversesqrt(r0.w);
/*3*/	r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*4*/	r2.xy = (gl_FragCoord.xyxx + cb0.data[28].xxxx).xy;
/*5*/	r2.xy = (r2.xyxx * cb0.data[27].zwzz).xy;
/*6*/	r2.zw = (vsOut_T2.xxxy / vsOut_T2.wwww).zw;
/*7*/	r3.yz = (r2.zzwz + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*8*/	r2.zw = (vsOut_T3.xxxy / vsOut_T3.wwww).zw;
/*9*/	r4.yz = (r2.zzwz + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*10*/	r5.xyzw = cb0.data[26].xxxx * cb2.data[2].zzww;
/*11*/	r5.xyzw = r5.xyzw * vec4(-0.001392, -0.009903, -0.006947, -0.007193);
/*12*/	r5.xyzw = vsOut_T5.xyxy * cb2.data[2].xxyy + r5.xyzw;
/*13*/	r6.xyzw = (texture(detail_normal_sampler, r5.xyxx.st)).xyzw;
/*14*/	r2.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*15*/	r6.xz = (r2.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*16*/	r1.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*17*/	r1.w = -r1.w + 1.000000;
/*18*/	r1.w = max(r1.w, 0.000000);
/*19*/	r6.y = sqrt(r1.w);
/*20*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*21*/	r5.xyzw = (texture(detail_normal_sampler, r5.zwzz.st)).xyzw;
/*22*/	r2.zw = (r5.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*23*/	r5.xz = (r2.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*24*/	r1.w = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*25*/	r1.w = -r1.w + 1.000000;
/*26*/	r1.w = max(r1.w, 0.000000);
/*27*/	r5.y = sqrt(r1.w);
/*28*/	r5.xyz = (r5.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*29*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*30*/	r5.xyz = (r5.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*31*/	r1.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*32*/	r5.xyz = (r6.yyyy * r5.xyzx).xyz;
/*33*/	r5.xyz = (r6.xyzx * r1.wwww + -r5.xyzx).xyz;
/*34*/	r1.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*35*/	r1.w = inversesqrt(r1.w);
/*36*/	r5.xyz = (r1.wwww * r5.xyzx).xyz;
/*37*/	r6.xyzw = (texture(sea_surface_sampler, vsOut_T5.xyxx.st)).xyzw;
/*38*/	r2.zw = (r6.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*39*/	r6.xyzw = (texture(swell_surface_sampler, vsOut_T5.zwzz.st)).xyzw;
/*40*/	r6.xy = (r6.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*41*/	r6.xy = (r6.xyxx * vec4(6.283185, 6.283185, 0.000000, 0.000000)).xy;
/*42*/	r2.zw = (r2.zzzw * vec4(0.000000, 0.000000, 6.283185, 6.283185) + r6.xxxy).zw;
/*43*/	r6.xy = sin(vec2(r2.zwzz)); r7.xy = cos(vec2(r2.zwzz));
/*44*/	r7.y = r7.y * r7.x;
/*45*/	r7.xz = (r6.xxyx).xz;
/*46*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*47*/	r1.w = inversesqrt(r1.w);
/*48*/	r6.xyz = (r1.wwww * r7.xyzx).xyz;
/*49*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*50*/	r5.xyz = (r5.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*51*/	r6.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*52*/	r5.xyz = (r5.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*53*/	r1.w = dot(vec3(r6.xyzx), vec3(r5.xyzx));
/*54*/	r5.xyz = (r6.yyyy * r5.xyzx).xyz;
/*55*/	r5.xyz = (r6.xyzx * r1.wwww + -r5.xyzx).xyz;
/*56*/	r1.w = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*57*/	r1.w = inversesqrt(r1.w);
/*58*/	r5.xyz = (r1.wwww * r5.xyzx).xyz;
/*59*/	r6.xyz = (r5.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*60*/	r1.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*61*/	r1.w = inversesqrt(r1.w);
/*62*/	r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*63*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*64*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*65*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*66*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*67*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*68*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*69*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*70*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*71*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r2.zw = (mix(vec4(0, 0, 1.000000, 1.000000), vec4(0, 0, 360.000000, 0.004000), greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).zw;
/*73*/	r6.xyz = (r2.zzzz * r6.xyzx).xyz;
/*74*/	r2.z = dot(vec3(r5.xyzx), vec3(-cb1.data[0].yzwy));
/*75*/	r5.w = max(r2.z, 0.000000);
/*76*/	r6.w = dot(vec3(-r1.xyzx), vec3(r5.xyzx));
/*77*/	r6.w = r6.w + r6.w;
/*78*/	r7.xyz = (r5.xyzx * -r6.wwww + -r1.xyzx).xyz;
/*79*/	r7.w = abs(r7.y);
/*80*/	r5.x = dot(vec3(r7.xwzx), vec3(-r1.xyzx));
/*81*/	r5.x = max(r5.x, 0.000000);
/*82*/	r5.x = log2(r5.x);
/*83*/	r5.x = r5.x * 10.000000;
/*84*/	r5.x = exp2(r5.x);
/*85*/	r5.x = r5.x * 0.453839 + 0.020000;
/*86*/	if(floatBitsToUint(cb1.data[11].y) == 0u) {
/*87*/	  r5.y = dot(vec3(r7.xzwx), vec3(r7.xzwx));
/*88*/	  r5.y = inversesqrt(r5.y);
/*89*/	  r8.xyz = (r5.yyyy * r7.xwzx).xyz;
/*90*/	  r8.xyzw = (textureLod(s_environment, r8.xyzx.stp, 0.000000)).xyzw;
/*91*/	  r8.xyz = (r5.xxxx * r8.xyzx).xyz;
/*92*/	} else {
/*93*/	  r8.xyz = (vec4(0, 0, 0, 0)).xyz;
/*94*/	}
/*95*/	r5.y = max(-cb1.data[0].z, 0.000000);
/*96*/	r9.xyz = (r5.yyyy * cb1.data[8].xyzx).xyz;
/*97*/	r9.xyz = (r9.xyzx * cb1.data[1].xyzx).xyz;
/*98*/	r10.xyz = (r6.xyzx * cb1.data[8].xyzx).xyz;
/*99*/	r10.xyz = (r2.wwww * r10.xyzx).xyz;
/*100*/	r9.xyz = (r9.xyzx * r2.wwww + r10.xyzx).xyz;
/*101*/	r10.xyz = (-cb1.data[10].xyzx * cb1.data[10].wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*102*/	r10.xyz = (-r10.xyzx * cb2.data[3].xxxx).xyz;
/*103*/	r10.xyz = (r10.xyzx * vec4(2.164042, 2.164042, 2.164042, 0.000000)).xyz;
/*104*/	r10.xyz = (exp2(r10.xyzx)).xyz;
/*105*/	r11.xyzw = (texture(refraction_texture_sampler, r2.xyxx.st)).xyzw;
/*106*/	r11.xyz = (r11.xyzx * r10.xyzx + -r9.xyzx).xyz;
/*107*/	r9.xyz = (r10.xyzx * r11.xyzx + r9.xyzx).xyz;
/*108*/	r2.x = -r5.x + 1.000000;
/*109*/	r5.xyz = (r2.xxxx * r9.xyzx + r8.xyzx).xyz;
/*110*/	r2.x = dot(vec3(-cb1.data[0].ywzy), vec3(r7.xzwx));
/*111*/	r2.x = max(r2.x, -1.000000);
/*112*/	r2.x = min(r2.x, 1.000000);
/*113*/	r2.y = -abs(r2.x) + 1.000000;
/*114*/	r2.y = sqrt(r2.y);
/*115*/	r6.w = abs(r2.x) * -0.018729 + 0.074261;
/*116*/	r6.w = r6.w * abs(r2.x) + -0.212114;
/*117*/	r6.w = r6.w * abs(r2.x) + 1.570729;
/*118*/	r7.y = r2.y * r6.w;
/*119*/	r7.y = r7.y * -2.000000 + 3.141593;
/*120*/	r2.x = uintBitsToFloat((r2.x < -r2.x) ? 0xffffffffu : 0x00000000u);
/*121*/	r2.x = uintBitsToFloat(floatBitsToUint(r2.x) & floatBitsToUint(r7.y));
/*122*/	r2.x = r6.w * r2.y + r2.x;
/*123*/	r2.y = uintBitsToFloat((0.000000 < r2.z) ? 0xffffffffu : 0x00000000u);
/*124*/	if(floatBitsToUint(r2.y) != 0u) {
/*125*/	    r2.z = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.014341 : -0.000001;
/*126*/	  r2.z = r2.z + r2.w;
/*127*/	  r2.z = r2.z * 0.500000 + 0.500000;
/*128*/	  r2.z = r2.z * 2.000000 + -1.000000;
/*129*/	  r2.z = -r2.z * r2.z + 1.000000;
/*130*/	  r2.z = max(r2.z, 0.001000);
/*131*/	  r2.z = log2(r2.z);
/*132*/	  r6.w = r2.z * 4.950617;
/*133*/	  r2.z = r2.z * 0.346574 + 4.546885;
/*134*/	  r6.w = r2.z * r2.z + -r6.w;
/*135*/	  r6.w = sqrt(r6.w);
/*136*/	  r2.z = -r2.z + r6.w;
/*137*/	  r2.z = max(r2.z, 0.000000);
/*138*/	  r2.z = sqrt(r2.z);
/*139*/	  r2.z = r2.z * 1.414214;
/*140*/	  r2.z = 0.008727 / r2.z;
/*141*/	  r2.z = max(r2.z, 0.000100);
/*142*/	  r8.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*143*/	  r2.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.z)).z;
/*144*/	  r8.xy = (r2.zzzz * r8.xyxx).xy;
/*145*/	  r8.zw = (r8.xxxy * vec4(0.000000, 0.000000, 0.707107, 0.707107)).zw;
/*146*/	  r8.zw = (r8.zzzw * r8.zzzw).zw;
/*147*/	  r9.xyzw = r8.zzww * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*148*/	  r9.xy = (r9.xzxx / r9.ywyy).xy;
/*149*/	  r8.zw = (-r8.zzzw * r9.xxxy).zw;
/*150*/	  r9.xy = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r8.xyxx)) * 0xffffffffu)).xy;
/*151*/	  r2.z = uintBitsToFloat((r8.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*152*/	  r2.z = intBitsToFloat(1 + ~floatBitsToInt(r9.x) + floatBitsToInt(r2.z));
/*153*/	  r2.z = floatBitsToInt(r2.z);
/*154*/	  r8.xy = (r8.zwzz * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*155*/	  r8.xy = (exp2(r8.xyxx)).xy;
/*156*/	  r8.xy = (-r8.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*157*/	  r8.xy = (sqrt(r8.xyxx)).xy;
/*158*/	  r2.z = r2.z * r8.x + 1.000000;
/*159*/	  r2.z = r2.z * 0.500000;
/*160*/	  r6.w = 1 + ~floatBitsToInt(r9.y);
/*161*/	  r6.w = r6.w * r8.y + 1.000000;
/*162*/	  r2.z = r6.w * 0.500000 + -r2.z;
/*163*/	  r6.w = min(r5.w, 1.000000);
/*164*/	  r6.w = r6.w + -1.000000;
/*165*/	  r6.w = r6.w * 0.982287 + 1.000000;
/*166*/	  r7.y = dot(vec3(-cb1.data[0].yzwy), vec3(-r1.xyzx));
/*167*/	  r7.y = max(r7.y, 0.000000);
/*168*/	  r7.y = log2(r7.y);
/*169*/	  r7.y = r7.y * 10.000000;
/*170*/	  r7.y = exp2(r7.y);
/*171*/	  r7.y = r7.y * 0.453839 + 0.020000;
/*172*/	  r2.z = abs(r2.z) * r6.w;
/*173*/	  r8.xyz = (r7.yyyy * r2.zzzz).xyz;
/*174*/	} else {
/*175*/	  r8.xyz = (vec4(0, 0, 0, 0)).xyz;
/*176*/	}
/*177*/	r8.xyz = (r8.xyzx * cb1.data[1].xyzx).xyz;
/*178*/	if(floatBitsToUint(r2.y) != 0u) {
/*179*/	    r1.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.248975 : -0.000025;
/*180*/	  r1.w = r1.w + r2.w;
/*181*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*182*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*183*/	  r1.w = -r1.w * r1.w + 1.000000;
/*184*/	  r1.w = max(r1.w, 0.001000);
/*185*/	  r1.w = log2(r1.w);
/*186*/	  r2.y = r1.w * 4.950617;
/*187*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*188*/	  r2.y = r1.w * r1.w + -r2.y;
/*189*/	  r2.y = sqrt(r2.y);
/*190*/	  r1.w = -r1.w + r2.y;
/*191*/	  r1.w = max(r1.w, 0.000000);
/*192*/	  r1.w = sqrt(r1.w);
/*193*/	  r1.w = r1.w * 1.414214;
/*194*/	  r1.w = 0.008727 / r1.w;
/*195*/	  r1.w = max(r1.w, 0.000100);
/*196*/	  r2.xy = (r2.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*197*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*198*/	  r2.xy = (r1.wwww * r2.xyxx).xy;
/*199*/	  r9.xy = (r2.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*200*/	  r9.xy = (r9.xyxx * r9.xyxx).xy;
/*201*/	  r10.xyzw = r9.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*202*/	  r9.zw = (r10.xxxz / r10.yyyw).zw;
/*203*/	  r9.xy = (r9.zwzz * -r9.xyxx).xy;
/*204*/	  r2.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r2.xxyx)) * 0xffffffffu)).yz;
/*205*/	  r1.w = uintBitsToFloat((r2.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*206*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r2.y) + floatBitsToInt(r1.w));
/*207*/	  r1.w = floatBitsToInt(r1.w);
/*208*/	  r2.xy = (r9.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*209*/	  r2.xy = (exp2(r2.xyxx)).xy;
/*210*/	  r2.xy = (-r2.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*211*/	  r2.xy = (sqrt(r2.xyxx)).xy;
/*212*/	  r1.w = r1.w * r2.x + 1.000000;
/*213*/	  r1.w = r1.w * 0.500000;
/*214*/	  r2.x = 1 + ~floatBitsToInt(r2.z);
/*215*/	  r2.x = r2.x * r2.y + 1.000000;
/*216*/	  r1.w = r2.x * 0.500000 + -r1.w;
/*217*/	  r2.x = min(r5.w, 1.000000);
/*218*/	  r2.x = r2.x + -1.000000;
/*219*/	  r2.x = r2.x * 0.707107 + 1.000000;
/*220*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(-r1.xyzx));
/*221*/	  r1.x = max(r1.x, 0.000000);
/*222*/	  r1.x = log2(r1.x);
/*223*/	  r1.x = r1.x * 10.000000;
/*224*/	  r1.x = exp2(r1.x);
/*225*/	  r1.x = r1.x * 0.830475 + 0.020000;
/*226*/	  r1.y = abs(r1.w) * r2.x;
/*227*/	  r1.xyz = (r1.xxxx * r1.yyyy).xyz;
/*228*/	} else {
/*229*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*230*/	}
/*231*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*232*/	r1.xyz = (r1.xyzx * vec4(0.700000, 0.700000, 0.700000, 0.000000)).xyz;
/*233*/	r1.xyz = (r8.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r1.xyzx).xyz;
/*234*/	r1.xyz = (r1.xyzx + r5.xyzx).xyz;
/*235*/	r3.xw = (-r3.zzzz + vec4(0.100000, 0.000000, 0.000000, 1.000000)).xw;
/*236*/	r1.w = saturate(r3.x * 9.999998);
/*237*/	r2.x = r1.w * -2.000000 + 3.000000;
/*238*/	r1.w = r1.w * r1.w;
/*239*/	r3.xyzw = (texture(colour_overlay_texture_sampler, r3.ywyy.st)).xyzw;
/*240*/	r1.w = -r2.x * r1.w + 1.000000;
/*241*/	r3.w = r1.w * r3.w;
/*242*/	r8.xyzw = r3.xyzw + vec4(-0.400000, -0.500000, -0.600000, -0.000000);
/*243*/	r3.xyzw = r3.wwww * r8.xyzw + vec4(0.400000, 0.500000, 0.600000, 0.000000);
/*244*/	r2.xyz = (r5.wwww * r3.xyzx).xyz;
/*245*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*246*/	r3.xyz = (r6.xyzx * r3.xyzx).xyz;
/*247*/	r3.xyz = (r2.wwww * r3.xyzx).xyz;
/*248*/	r2.xyz = (r2.xyzx * r2.wwww + r3.xyzx).xyz;
/*249*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*250*/	r1.xyz = (r3.wwww * r2.xyzx + r1.xyzx).xyz;
/*251*/	r4.xw = (-r4.zzzz + vec4(0.100000, 0.000000, 0.000000, 1.000000)).xw;
/*252*/	r1.w = saturate(r4.x * 9.999998);
/*253*/	r2.x = r1.w * -2.000000 + 3.000000;
/*254*/	r1.w = r1.w * r1.w;
/*255*/	r3.xyzw = (texture(ui_colour_overlay_texture_sampler, r4.ywyy.st)).xyzw;
/*256*/	r1.w = -r2.x * r1.w + 1.000000;
/*257*/	r1.w = r1.w * r3.w;
/*258*/	r2.x = dot(vec3(cb1.data[1].xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*259*/	r2.x = r2.w * r2.x;
/*260*/	r2.x = r2.x * 0.250000;
/*261*/	r2.xyz = (r3.xyzx * r2.xxxx + -r1.xyzx).xyz;
/*262*/	color3.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*263*/	r0.xyz = (r0.xyzx * r0.wwww + r7.xwzx).xyz;
/*264*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*265*/	r0.w = inversesqrt(r0.w);
/*266*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*267*/	r0.w = max(abs(r0.z), abs(r0.y));
/*268*/	r0.w = max(r0.w, abs(r0.x));
/*269*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*270*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*271*/	color0.w = 0.120000;
/*272*/	color1.xyzw = vec4(0, 0, 0, 0.020000);
/*273*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*274*/	color3.w = 1.000000;
/*275*/	return;
}
