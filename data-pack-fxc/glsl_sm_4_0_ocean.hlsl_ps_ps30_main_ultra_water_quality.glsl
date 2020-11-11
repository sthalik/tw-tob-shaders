//
//
// Shader Model 4
// Fragment Shader
//
// id: 363 - fxc/glsl_SM_4_0_ocean.hlsl_PS_ps30_main_ultra_water_quality.glsl
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
in vec4 vsOut_T6;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;

uniform sampler2D detail_normal_sampler;
uniform sampler2D sea_surface_sampler;
uniform sampler2D swell_surface_sampler;
uniform sampler2D gbuffer_channel_4_sampler;
uniform samplerCube s_environment;
uniform sampler2D refraction_texture_sampler;
uniform sampler2D colour_overlay_texture_sampler;
uniform sampler2D ui_colour_overlay_texture_sampler;
uniform sampler2DArray g_foam_anim_sampler;
uniform sampler2D g_static_foam_sampler;

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
  vec4 r12;
  vec4 r13;
  vec4 r14;
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
/*5*/	r2.zw = (r2.xxxy * cb0.data[27].zzzw).zw;
/*6*/	r3.xy = (r2.xyxx * cb0.data[29].zwzz).xy;
/*7*/	r3.zw = (vsOut_T2.xxxy / vsOut_T2.wwww).zw;
/*8*/	r4.yz = (r3.zzwz + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*9*/	r3.zw = (vsOut_T3.xxxy / vsOut_T3.wwww).zw;
/*10*/	r5.yz = (r3.zzwz + vec4(0.000000, 0.500000, 0.500000, 0.000000)).yz;
/*11*/	r6.xyzw = cb0.data[26].xxxx * cb2.data[2].zzww;
/*12*/	r6.xyzw = r6.xyzw * vec4(-0.001392, -0.009903, -0.006947, -0.007193);
/*13*/	r6.xyzw = vsOut_T5.xyxy * cb2.data[2].xxyy + r6.xyzw;
/*14*/	r7.xyzw = (texture(detail_normal_sampler, r6.xyxx.st)).xyzw;
/*15*/	r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*16*/	r7.xz = (r3.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*17*/	r1.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*18*/	r1.w = -r1.w + 1.000000;
/*19*/	r1.w = max(r1.w, 0.000000);
/*20*/	r7.y = sqrt(r1.w);
/*21*/	r7.xyz = (r7.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*22*/	r6.xyzw = (texture(detail_normal_sampler, r6.zwzz.st)).xyzw;
/*23*/	r3.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*24*/	r6.xz = (r3.zzwz * vec4(2.000000, 0.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xz;
/*25*/	r1.w = dot(vec2(r6.xzxx), vec2(r6.xzxx));
/*26*/	r1.w = -r1.w + 1.000000;
/*27*/	r1.w = max(r1.w, 0.000000);
/*28*/	r6.y = sqrt(r1.w);
/*29*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*30*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*31*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*32*/	r1.w = dot(vec3(r7.xyzx), vec3(r6.xyzx));
/*33*/	r6.xyz = (r7.yyyy * r6.xyzx).xyz;
/*34*/	r6.xyz = (r7.xyzx * r1.wwww + -r6.xyzx).xyz;
/*35*/	r1.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*38*/	r7.xyzw = (texture(sea_surface_sampler, vsOut_T5.xyxx.st)).xyzw;
/*39*/	r3.zw = (r7.xxxy + vec4(0.000000, 0.000000, -0.500000, -0.500000)).zw;
/*40*/	r7.xyzw = (texture(swell_surface_sampler, vsOut_T5.zwzz.st)).xyzw;
/*41*/	r7.xy = (r7.xyxx + vec4(-0.500000, -0.500000, 0.000000, 0.000000)).xy;
/*42*/	r7.xy = (r7.xyxx * vec4(6.283185, 6.283185, 0.000000, 0.000000)).xy;
/*43*/	r3.zw = (r3.zzzw * vec4(0.000000, 0.000000, 6.283185, 6.283185) + r7.xxxy).zw;
/*44*/	r7.xy = sin(vec2(r3.zwzz)); r8.xy = cos(vec2(r3.zwzz));
/*45*/	r8.y = r8.y * r8.x;
/*46*/	r8.xz = (r7.xxyx).xz;
/*47*/	r1.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*48*/	r1.w = inversesqrt(r1.w);
/*49*/	r7.xyz = (r1.wwww * r8.xyzx).xyz;
/*50*/	r7.xyz = (r7.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*51*/	r6.xyz = (r6.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*52*/	r7.xyz = (r7.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + vec4(-1.000000, 0.000000, -1.000000, 0.000000)).xyz;
/*53*/	r6.xyz = (r6.xyzx * vec4(-2.000000, 2.000000, -2.000000, 0.000000) + vec4(1.000000, -1.000000, 1.000000, 0.000000)).xyz;
/*54*/	r1.w = dot(vec3(r7.xyzx), vec3(r6.xyzx));
/*55*/	r6.xyz = (r7.yyyy * r6.xyzx).xyz;
/*56*/	r6.xyz = (r7.xyzx * r1.wwww + -r6.xyzx).xyz;
/*57*/	r1.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*58*/	r1.w = inversesqrt(r1.w);
/*59*/	r6.xyz = (r1.wwww * r6.xyzx).xyz;
/*60*/	r7.xyz = (r6.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*61*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*62*/	r1.w = inversesqrt(r1.w);
/*63*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*64*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*65*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*66*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*67*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*68*/	r7.xyz = (r7.xyzx * r7.xyzx).xyz;
/*69*/	r8.xyz = (r8.xywx * r7.yyyy).xyz;
/*70*/	r7.xyw = (r7.xxxx * r9.xyxz + r8.xyxz).xyw;
/*71*/	r7.xyz = (r7.zzzz * r10.xyzx + r7.xywx).xyz;
/*72*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*73*/	r3.zw = (mix(vec4(0, 0, 1.000000, 1.000000), vec4(0, 0, 360.000000, 0.004000), greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).zw;
/*74*/	r7.xyz = (r3.zzzz * r7.xyzx).xyz;
/*75*/	r3.z = dot(vec3(r6.xyzx), vec3(-cb1.data[0].yzwy));
/*76*/	r6.w = max(r3.z, 0.000000);
/*77*/	r7.w = dot(vec3(-r1.xyzx), vec3(r6.xyzx));
/*78*/	r7.w = r7.w + r7.w;
/*79*/	r8.xyz = (r6.xyzx * -r7.wwww + -r1.xyzx).xyz;
/*80*/	r8.w = abs(r8.y);
/*81*/	r6.y = dot(vec3(r8.xwzx), vec3(-r1.xyzx));
/*82*/	r6.y = max(r6.y, 0.000000);
/*83*/	r6.y = log2(r6.y);
/*84*/	r6.xyz = (r6.xyzx * vec4(0.020000, 10.000000, 0.020000, 0.000000)).xyz;
/*85*/	r6.y = exp2(r6.y);
/*86*/	r6.y = r6.y * 0.453839 + 0.020000;
/*87*/	r9.xyzw = (textureLod(gbuffer_channel_4_sampler, r2.zwzz.st, 0.000000)).yzxw;
/*88*/	r9.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*89*/	r9.w = 1.000000;
/*90*/	r10.x = dot(r9.xyzw, cb0.data[21].xyzw);
/*91*/	r10.y = dot(r9.xyzw, cb0.data[22].xyzw);
/*92*/	r10.z = dot(r9.xyzw, cb0.data[23].xyzw);
/*93*/	r3.x = dot(r9.xyzw, cb0.data[24].xyzw);
/*94*/	r9.xyz = (r10.xyzx / r3.xxxx).xyz;
/*95*/	r3.x = -r9.y + vsOut_T1.y;
/*96*/	r3.x = max(r3.x, 0.000000);
/*97*/	r9.xyz = (r9.xyzx + -vsOut_T1.xyzx).xyz;
/*98*/	r3.y = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*99*/	r3.y = sqrt(r3.y);
/*100*/	if(floatBitsToUint(cb1.data[11].y) == 0u) {
/*101*/	  r7.w = dot(vec3(r8.xzwx), vec3(r8.xzwx));
/*102*/	  r7.w = inversesqrt(r7.w);
/*103*/	  r9.xyz = (r7.wwww * r8.xwzx).xyz;
/*104*/	  r9.xyzw = (textureLod(s_environment, r9.xyzx.stp, 0.000000)).xyzw;
/*105*/	  r9.xyz = (r6.yyyy * r9.xyzx).xyz;
/*106*/	  r7.w = min(r3.y, 1.000000);
/*107*/	  r9.xyz = (r7.wwww * r9.xyzx).xyz;
/*108*/	} else {
/*109*/	  r9.xyz = (vec4(0, 0, 0, 0)).xyz;
/*110*/	}
/*111*/	r7.w = max(-cb1.data[0].z, 0.000000);
/*112*/	r10.xyz = (r7.wwww * cb1.data[8].xyzx).xyz;
/*113*/	r10.xyz = (r10.xyzx * cb1.data[1].xyzx).xyz;
/*114*/	r11.xyz = (r7.xyzx * cb1.data[8].xyzx).xyz;
/*115*/	r11.xyz = (r3.wwww * r11.xyzx).xyz;
/*116*/	r10.xyz = (r10.xyzx * r3.wwww + r11.xyzx).xyz;
/*117*/	r11.xyz = (-cb1.data[10].xyzx * cb1.data[10].wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*118*/	r11.xyz = (r3.yyyy * -r11.xyzx).xyz;
/*119*/	r11.xyz = (r11.xyzx * cb2.data[3].xxxx).xyz;
/*120*/	r11.xyz = (r11.xyzx * vec4(1.442695, 1.442695, 1.442695, 0.000000)).xyz;
/*121*/	r11.xyz = (exp2(r11.xyzx)).xyz;
/*122*/	r3.y = min(r3.x, 3.000000);
/*123*/	r6.xz = (r3.yyyy * r6.xxzx).xz;
/*124*/	r12.xy = (r2.xyxx * cb0.data[27].zwzz + r6.xzxx).xy;
/*125*/	r2.xy = (r2.xyxx * cb0.data[29].zwzz + r6.xzxx).xy;
/*126*/	r13.xyzw = (textureLod(gbuffer_channel_4_sampler, r12.xyxx.st, 0.000000)).yzxw;
/*127*/	r13.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*128*/	r13.w = 1.000000;
/*129*/	r14.x = dot(r13.xyzw, cb0.data[21].xyzw);
/*130*/	r14.y = dot(r13.xyzw, cb0.data[22].xyzw);
/*131*/	r14.z = dot(r13.xyzw, cb0.data[23].xyzw);
/*132*/	r2.x = dot(r13.xyzw, cb0.data[24].xyzw);
/*133*/	r13.xyz = (r14.xyzx / r2.xxxx).xyz;
/*134*/	r13.xyz = (r13.xyzx + -cb0.data[0].xyzx).xyz;
/*135*/	r2.x = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*136*/	r13.xyz = (vsOut_T1.xyzx + -cb0.data[0].xyzx).xyz;
/*137*/	r2.y = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*138*/	r2.xy = (sqrt(r2.xyxx)).xy;
/*139*/	r2.x = uintBitsToFloat((r2.y < r2.x) ? 0xffffffffu : 0x00000000u);
/*140*/	r12.xyzw = (texture(refraction_texture_sampler, r12.xyxx.st)).xyzw;
/*141*/	r13.xyzw = (texture(refraction_texture_sampler, r2.zwzz.st)).xyzw;
/*142*/	if(floatBitsToUint(r2.x) != 0u) {
/*143*/	  r13.xyz = (r12.xyzx).xyz;
/*144*/	}
/*145*/	r2.xyz = (r13.xyzx * r11.xyzx + -r10.xyzx).xyz;
/*146*/	r2.xyz = (r11.xyzx * r2.xyzx + r10.xyzx).xyz;
/*147*/	r2.w = -r6.y + 1.000000;
/*148*/	r2.xyz = (r2.wwww * r2.xyzx + r9.xyzx).xyz;
/*149*/	r2.w = dot(vec3(-cb1.data[0].ywzy), vec3(r8.xzwx));
/*150*/	r2.w = max(r2.w, -1.000000);
/*151*/	r2.w = min(r2.w, 1.000000);
/*152*/	r3.y = -abs(r2.w) + 1.000000;
/*153*/	r3.y = sqrt(r3.y);
/*154*/	r6.x = abs(r2.w) * -0.018729 + 0.074261;
/*155*/	r6.x = r6.x * abs(r2.w) + -0.212114;
/*156*/	r6.x = r6.x * abs(r2.w) + 1.570729;
/*157*/	r6.y = r3.y * r6.x;
/*158*/	r6.y = r6.y * -2.000000 + 3.141593;
/*159*/	r2.w = uintBitsToFloat((r2.w < -r2.w) ? 0xffffffffu : 0x00000000u);
/*160*/	r2.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r6.y));
/*161*/	r2.w = r6.x * r3.y + r2.w;
/*162*/	r3.y = uintBitsToFloat((0.000000 < r3.z) ? 0xffffffffu : 0x00000000u);
/*163*/	if(floatBitsToUint(r3.y) != 0u) {
/*164*/	    r3.z = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.014341 : -0.000001;
/*165*/	  r3.z = r3.z + r3.w;
/*166*/	  r3.z = r3.z * 0.500000 + 0.500000;
/*167*/	  r3.z = r3.z * 2.000000 + -1.000000;
/*168*/	  r3.z = -r3.z * r3.z + 1.000000;
/*169*/	  r3.z = max(r3.z, 0.001000);
/*170*/	  r3.z = log2(r3.z);
/*171*/	  r6.x = r3.z * 4.950617;
/*172*/	  r3.z = r3.z * 0.346574 + 4.546885;
/*173*/	  r6.x = r3.z * r3.z + -r6.x;
/*174*/	  r6.x = sqrt(r6.x);
/*175*/	  r3.z = -r3.z + r6.x;
/*176*/	  r3.z = max(r3.z, 0.000000);
/*177*/	  r3.z = sqrt(r3.z);
/*178*/	  r3.z = r3.z * 1.414214;
/*179*/	  r3.z = 0.008727 / r3.z;
/*180*/	  r3.z = max(r3.z, 0.000100);
/*181*/	  r6.xy = (r2.wwww + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*182*/	  r3.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.z)).z;
/*183*/	  r6.xy = (r3.zzzz * r6.xyxx).xy;
/*184*/	  r9.xy = (r6.xyxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*185*/	  r9.xy = (r9.xyxx * r9.xyxx).xy;
/*186*/	  r10.xyzw = r9.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*187*/	  r9.zw = (r10.xxxz / r10.yyyw).zw;
/*188*/	  r9.xy = (r9.zwzz * -r9.xyxx).xy;
/*189*/	  r6.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r6.xxyx)) * 0xffffffffu)).yz;
/*190*/	  r3.z = uintBitsToFloat((r6.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*191*/	  r3.z = intBitsToFloat(1 + ~floatBitsToInt(r6.y) + floatBitsToInt(r3.z));
/*192*/	  r3.z = floatBitsToInt(r3.z);
/*193*/	  r6.xy = (r9.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*194*/	  r6.xy = (exp2(r6.xyxx)).xy;
/*195*/	  r6.xy = (-r6.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*196*/	  r6.xy = (sqrt(r6.xyxx)).xy;
/*197*/	  r3.z = r3.z * r6.x + 1.000000;
/*198*/	  r3.z = r3.z * 0.500000;
/*199*/	  r6.x = 1 + ~floatBitsToInt(r6.z);
/*200*/	  r6.x = r6.x * r6.y + 1.000000;
/*201*/	  r3.z = r6.x * 0.500000 + -r3.z;
/*202*/	  r6.x = min(r6.w, 1.000000);
/*203*/	  r6.x = r6.x + -1.000000;
/*204*/	  r6.x = r6.x * 0.982287 + 1.000000;
/*205*/	  r6.y = dot(vec3(-cb1.data[0].yzwy), vec3(-r1.xyzx));
/*206*/	  r6.y = max(r6.y, 0.000000);
/*207*/	  r6.y = log2(r6.y);
/*208*/	  r6.y = r6.y * 10.000000;
/*209*/	  r6.y = exp2(r6.y);
/*210*/	  r6.y = r6.y * 0.453839 + 0.020000;
/*211*/	  r3.z = abs(r3.z) * r6.x;
/*212*/	  r6.xyz = (r6.yyyy * r3.zzzz).xyz;
/*213*/	} else {
/*214*/	  r6.xyz = (vec4(0, 0, 0, 0)).xyz;
/*215*/	}
/*216*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*217*/	if(floatBitsToUint(r3.y) != 0u) {
/*218*/	    r1.w = (floatBitsToUint(r1.w) > 0x00000000u) ? 0.248975 : -0.000025;
/*219*/	  r1.w = r1.w + r3.w;
/*220*/	  r1.w = r1.w * 0.500000 + 0.500000;
/*221*/	  r1.w = r1.w * 2.000000 + -1.000000;
/*222*/	  r1.w = -r1.w * r1.w + 1.000000;
/*223*/	  r1.w = max(r1.w, 0.001000);
/*224*/	  r1.w = log2(r1.w);
/*225*/	  r3.y = r1.w * 4.950617;
/*226*/	  r1.w = r1.w * 0.346574 + 4.546885;
/*227*/	  r3.y = r1.w * r1.w + -r3.y;
/*228*/	  r3.y = sqrt(r3.y);
/*229*/	  r1.w = -r1.w + r3.y;
/*230*/	  r1.w = max(r1.w, 0.000000);
/*231*/	  r1.w = sqrt(r1.w);
/*232*/	  r1.w = r1.w * 1.414214;
/*233*/	  r1.w = 0.008727 / r1.w;
/*234*/	  r1.w = max(r1.w, 0.000100);
/*235*/	  r3.yz = (r2.wwww + vec4(0.000000, -0.008727, 0.008727, 0.000000)).yz;
/*236*/	  r1.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.w)).w;
/*237*/	  r3.yz = (r1.wwww * r3.yyzy).yz;
/*238*/	  r9.xy = (r3.yzyy * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*239*/	  r9.xy = (r9.xyxx * r9.xyxx).xy;
/*240*/	  r10.xyzw = r9.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*241*/	  r9.zw = (r10.xxxz / r10.yyyw).zw;
/*242*/	  r9.xy = (r9.zwzz * -r9.xyxx).xy;
/*243*/	  r9.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r3.yyyz)) * 0xffffffffu)).zw;
/*244*/	  r1.w = uintBitsToFloat((r3.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*245*/	  r1.w = intBitsToFloat(1 + ~floatBitsToInt(r9.z) + floatBitsToInt(r1.w));
/*246*/	  r1.w = floatBitsToInt(r1.w);
/*247*/	  r3.yz = (r9.xxyx * vec4(0.000000, 1.442695, 1.442695, 0.000000)).yz;
/*248*/	  r3.yz = (exp2(r3.yyzy)).yz;
/*249*/	  r3.yz = (-r3.yyzy + vec4(0.000000, 1.000000, 1.000000, 0.000000)).yz;
/*250*/	  r3.yz = (sqrt(r3.yyzy)).yz;
/*251*/	  r1.w = r1.w * r3.y + 1.000000;
/*252*/	  r1.w = r1.w * 0.500000;
/*253*/	  r2.w = 1 + ~floatBitsToInt(r9.w);
/*254*/	  r2.w = r2.w * r3.z + 1.000000;
/*255*/	  r1.w = r2.w * 0.500000 + -r1.w;
/*256*/	  r2.w = min(r6.w, 1.000000);
/*257*/	  r2.w = r2.w + -1.000000;
/*258*/	  r2.w = r2.w * 0.707107 + 1.000000;
/*259*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(-r1.xyzx));
/*260*/	  r1.x = max(r1.x, 0.000000);
/*261*/	  r1.x = log2(r1.x);
/*262*/	  r1.x = r1.x * 10.000000;
/*263*/	  r1.x = exp2(r1.x);
/*264*/	  r1.x = r1.x * 0.830475 + 0.020000;
/*265*/	  r1.y = abs(r1.w) * r2.w;
/*266*/	  r1.xyz = (r1.xxxx * r1.yyyy).xyz;
/*267*/	} else {
/*268*/	  r1.xyz = (vec4(0, 0, 0, 0)).xyz;
/*269*/	}
/*270*/	r1.xyz = (r1.xyzx * cb1.data[1].xyzx).xyz;
/*271*/	r1.xyz = (r1.xyzx * vec4(0.700000, 0.700000, 0.700000, 0.000000)).xyz;
/*272*/	r1.xyz = (r6.xyzx * vec4(0.300000, 0.300000, 0.300000, 0.000000) + r1.xyzx).xyz;
/*273*/	r1.xyz = (r1.xyzx + r2.xyzx).xyz;
/*274*/	r4.xw = (-r4.zzzz + vec4(0.100000, 0.000000, 0.000000, 1.000000)).xw;
/*275*/	r1.w = saturate(r4.x * 9.999998);
/*276*/	r2.x = r1.w * -2.000000 + 3.000000;
/*277*/	r1.w = r1.w * r1.w;
/*278*/	r4.xyzw = (texture(colour_overlay_texture_sampler, r4.ywyy.st)).xyzw;
/*279*/	r1.w = -r2.x * r1.w + 1.000000;
/*280*/	r4.w = r1.w * r4.w;
/*281*/	r1.w = min(vsOut_T6.w, 1000.000000);
/*282*/	r1.w = -r1.w * 0.001000 + 1.000000;
/*283*/	r2.xy = (vsOut_T5.xyxx).xy;
/*284*/	r2.z = cb2.data[4].x/**/;
/*285*/	r2.xyzw = (texture(g_foam_anim_sampler, r2.xyzx.stp)).xyzw;
/*286*/	r6.xy = (vsOut_T5.xyxx).xy;
/*287*/	r6.z = cb2.data[4].y/**/;
/*288*/	r9.xyzw = (texture(g_foam_anim_sampler, r6.xyzx.stp)).xyzw;
/*289*/	r2.x = -r2.y + r9.y;
/*290*/	r2.x = cb2.data[4].z * r2.x + r2.y;
/*291*/	r1.w = r1.w * r2.x;
/*292*/	r2.x = r1.w * r1.w;
/*293*/	r2.x = r2.x * r2.x;
/*294*/	r2.yz = (vsOut_T5.xxyx * vec4(0.000000, 15.000000, 15.000000, 0.000000)).yz;
/*295*/	r9.xyzw = (texture(g_static_foam_sampler, r2.yzyy.st)).xyzw;
/*296*/	r2.x = r2.x * r9.y;
/*297*/	r2.y = r1.w * r9.z;
/*298*/	r1.w = -r9.z * r1.w + 1.000000;
/*299*/	r1.w = r1.w * r2.x + r2.y;
/*300*/	r2.x = cb0.data[26].x * 0.050000;
/*301*/	r2.yz = (vsOut_T5.xxyx * vec4(0.000000, 7.500000, 7.500000, 0.000000) + -r2.xxxx).yz;
/*302*/	r9.xyzw = (texture(g_static_foam_sampler, r2.yzyy.st)).xyzw;
/*303*/	r2.xy = (vsOut_T5.xyxx * vec4(7.500000, 7.500000, 0.000000, 0.000000) + r2.xxxx).xy;
/*304*/	r2.xyzw = (texture(g_static_foam_sampler, r2.xyxx.st)).xyzw;
/*305*/	r2.x = r2.y * r9.z;
/*306*/	r2.x = sqrt(r2.x);
/*307*/	r2.y = saturate(r3.x + -0.600000);
/*308*/	r2.y = -r2.y + 1.000000;
/*309*/	r2.x = min(r2.x, 1.000000);
/*310*/	r2.x = r2.y * r2.x;
/*311*/	r2.y = -r1.w + 1.000000;
/*312*/	r1.w = r2.y * r2.x + r1.w;
/*313*/	r2.x = r3.x * 1.666667;
/*314*/	r2.x = min(r2.x, 1.000000);
/*315*/	r2.w = r1.w * r2.x;
/*316*/	r2.xyz = (vec4(0.400000, 0.500000, 0.600000, 0)).xyz;
/*317*/	r9.xyzw = -r2.xyzw + r4.xyzw;
/*318*/	r2.xyzw = r4.wwww * r9.xyzw + r2.xyzw;
/*319*/	r3.xyz = (r6.wwww * r2.xyzx).xyz;
/*320*/	r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*321*/	r2.xyz = (r7.xyzx * r2.xyzx).xyz;
/*322*/	r2.xyz = (r3.wwww * r2.xyzx).xyz;
/*323*/	r2.xyz = (r3.xyzx * r3.wwww + r2.xyzx).xyz;
/*324*/	r2.xyz = (-r1.xyzx + r2.xyzx).xyz;
/*325*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*326*/	r5.xw = (-r5.zzzz + vec4(0.100000, 0.000000, 0.000000, 1.000000)).xw;
/*327*/	r1.w = saturate(r5.x * 9.999998);
/*328*/	r2.x = r1.w * -2.000000 + 3.000000;
/*329*/	r1.w = r1.w * r1.w;
/*330*/	r4.xyzw = (texture(ui_colour_overlay_texture_sampler, r5.ywyy.st)).xyzw;
/*331*/	r1.w = -r2.x * r1.w + 1.000000;
/*332*/	r1.w = r1.w * r4.w;
/*333*/	r2.x = dot(vec3(cb1.data[1].xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*334*/	r2.x = r3.w * r2.x;
/*335*/	r2.x = r2.x * 0.250000;
/*336*/	r2.xyz = (r4.xyzx * r2.xxxx + -r1.xyzx).xyz;
/*337*/	color3.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*338*/	r0.xyz = (r0.xyzx * r0.wwww + r8.xwzx).xyz;
/*339*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*340*/	r0.w = inversesqrt(r0.w);
/*341*/	r0.xyz = (r0.wwww * r0.xyzx).xyz;
/*342*/	r0.w = max(abs(r0.z), abs(r0.y));
/*343*/	r0.w = max(r0.w, abs(r0.x));
/*344*/	r0.xyz = (r0.xyzx / r0.wwww).xyz;
/*345*/	color0.xyz = saturate(r0.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*346*/	color0.w = 0.120000;
/*347*/	color1.xyzw = vec4(0, 0, 0, 0.020000);
/*348*/	color2.xyzw = vec4(1.000000, 1.000000, 1.000000, 0.015686);
/*349*/	color3.w = 1.000000;
/*350*/	return;
}
