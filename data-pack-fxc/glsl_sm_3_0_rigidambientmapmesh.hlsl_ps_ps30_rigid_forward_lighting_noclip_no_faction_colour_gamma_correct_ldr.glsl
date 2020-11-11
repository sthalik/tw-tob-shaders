//
//
// Shader Model 4
// Fragment Shader
//
// id: 507 - fxc/glsl_SM_3_0_rigidambientmapmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_C2;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_ambient_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb4;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb5;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.x = floor(vsOut_T5.w);
/*1*/	r0.x = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb5.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*15*/	r0.x = -r0.x + 1.000000;
/*16*/	r0.x = max(r0.x, 0.000000);
/*17*/	r4.z = sqrt(r0.x);
/*18*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*19*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*21*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*22*/	r1.w = inversesqrt(r1.w);
/*23*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*24*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*25*/	r1.w = inversesqrt(r1.w);
/*26*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*27*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*28*/	r1.w = inversesqrt(r1.w);
/*29*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*30*/	r9.xyz = (r0.yyyy * r7.xyzx).xyz;
/*31*/	r9.xyz = (r0.xxxx * r6.xyzx + r9.xyzx).xyz;
/*32*/	r0.xyw = (r0.wwww * r8.xyxz + r9.xyxz).xyw;
/*33*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*34*/	r1.w = inversesqrt(r1.w);
/*35*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*36*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*38*/	if(floatBitsToUint(r0.w) != 0u) {
/*39*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*40*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*41*/	  r0.w = r3.w * cb1.data[26].x;
/*42*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*43*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*44*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*45*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*46*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*47*/	}
/*48*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*49*/	if(floatBitsToUint(r0.w) != 0u) {
/*50*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*51*/	  if(floatBitsToUint(r0.w) != 0u) {
/*52*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*53*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*54*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*55*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*56*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*57*/	    r0.w = -r0.w + 1.000000;
/*58*/	    r0.w = max(r0.w, 0.000000);
/*59*/	    r10.z = sqrt(r0.w);
/*60*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*61*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*62*/	    r0.w = inversesqrt(r0.w);
/*63*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*64*/	    r12.xz = (cb4.data[0].xxyx).xz/**/;
/*65*/	    r12.y = -1.000000;
/*66*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*67*/	    r0.w = inversesqrt(r0.w);
/*68*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*69*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*70*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*71*/	    r1.w = r1.w * 1.250000;
/*72*/	    r1.w = min(r1.w, 1.000000);
/*73*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*74*/	    r2.w = r2.w * 4.000000;
/*75*/	    r1.w = r1.w * 0.200000 + r2.w;
/*76*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*77*/	    r0.w = r0.w + -r1.w;
/*78*/	    r0.w = saturate(r0.w * 200.000000);
/*79*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*80*/	    r0.w = r0.w * r0.w;
/*81*/	    r0.w = r0.w * r1.w;
/*82*/	    r3.x = r0.w * -r3.x + r3.x;
/*83*/	    r1.w = -r3.y + 0.200000;
/*84*/	    r3.y = r0.w * r1.w + r3.y;
/*85*/	    r1.xyz = (-r1.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*86*/	    r5.xyz = (r0.wwww * r1.xyzx + r5.xyzx).xyz;
/*87*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*88*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*89*/	    r1.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*90*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*91*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*92*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*93*/	    r1.w = -r1.w + 1.000000;
/*94*/	    r1.w = max(r1.w, 0.000000);
/*95*/	    r1.z = sqrt(r1.w);
/*96*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*97*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*98*/	    r1.w = sqrt(r1.w);
/*99*/	    r1.xyz = (r4.xyzx * r1.wwww + r1.xyzx).xyz;
/*100*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*101*/	    r1.w = inversesqrt(r1.w);
/*102*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*103*/	    r4.xyz = (r7.xyzx * r1.yyyy).xyz;
/*104*/	    r1.xyw = (r1.xxxx * r6.xyxz + r4.xyxz).xyw;
/*105*/	    r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*106*/	    r1.w = -r0.y + 1.000000;
/*107*/	    r0.w = min(r0.w, r1.w);
/*108*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*109*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*110*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*111*/	    r0.w = inversesqrt(r0.w);
/*112*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*113*/	  }
/*114*/	}
/*115*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*116*/	r1.xyz = (r5.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*117*/	r1.xyz = (-r5.xyzx + r1.xyzx).xyz;
/*118*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r5.xyzx).xyz;
/*119*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*120*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*121*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*122*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*123*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*124*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*125*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*126*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*127*/	r1.w = inversesqrt(r1.w);
/*128*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*129*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*130*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*131*/	r2.w = inversesqrt(r1.w);
/*132*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*133*/	r2.w = -r3.x + 1.000000;
/*134*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*135*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*136*/	r5.y = r5.y + r5.y;
/*137*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*138*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*139*/	r6.w = r2.w * 1.539380;
/*140*/	r6.w = cos((r6.w));
/*141*/	r6.w = inversesqrt(r6.w);
/*142*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*143*/	r7.x = saturate(r0.w * 60.000000);
/*144*/	r7.x = -r0.w + r7.x;
/*145*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*146*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*147*/	r8.x = inversesqrt(r8.x);
/*148*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*149*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*150*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*151*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*152*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*153*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*154*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*155*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*156*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*157*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*158*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*159*/	r6.y = -r0.w + 1.000000;
/*160*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*161*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*162*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*163*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*164*/	  r6.y = max(r6.y, 0.000000);
/*165*/	  r6.y = log2(r6.y);
/*166*/	  r6.y = r6.y * 10.000000;
/*167*/	  r6.y = exp2(r6.y);
/*168*/	  r6.y = r6.w * r6.y;
/*169*/	  r6.y = r6.y * r7.x + r0.w;
/*170*/	  r8.x = r2.w * 8.000000;
/*171*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*172*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*173*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*174*/	}
/*175*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*176*/	r0.y = max(r0.x, 0.000000);
/*177*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*178*/	if(floatBitsToUint(r0.x) != 0u) {
/*179*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*180*/	  r0.x = max(r0.x, -1.000000);
/*181*/	  r0.x = min(r0.x, 1.000000);
/*182*/	  r0.z = -abs(r0.x) + 1.000000;
/*183*/	  r0.z = sqrt(r0.z);
/*184*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*185*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*186*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*187*/	  r5.z = r0.z * r5.y;
/*188*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*189*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*190*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*191*/	  r0.x = r5.y * r0.z + r0.x;
/*192*/	  r0.z = r3.x * r3.x;
/*193*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*194*/	  r0.z = r0.z * r3.x + r6.x;
/*195*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*196*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*197*/	  r3.x = -r0.z * r0.z + 1.000000;
/*198*/	  r3.x = max(r3.x, 0.001000);
/*199*/	  r3.x = log2(r3.x);
/*200*/	  r5.x = r3.x * 4.950617;
/*201*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*202*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*203*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*204*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*205*/	  r0.z = floatBitsToInt(r0.z);
/*206*/	  r5.x = r3.x * r3.x + -r5.x;
/*207*/	  r5.x = sqrt(r5.x);
/*208*/	  r3.x = -r3.x + r5.x;
/*209*/	  r3.x = max(r3.x, 0.000000);
/*210*/	  r3.x = sqrt(r3.x);
/*211*/	  r0.z = r0.z * r3.x;
/*212*/	  r0.z = r0.z * 1.414214;
/*213*/	  r0.z = 0.008727 / r0.z;
/*214*/	  r0.z = max(r0.z, 0.000100);
/*215*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*216*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*217*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*218*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*219*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*220*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*221*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*222*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*223*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*224*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*225*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*226*/	  r0.x = floatBitsToInt(r0.x);
/*227*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*228*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*229*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*230*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*231*/	  r0.x = r0.x * r5.x + 1.000000;
/*232*/	  r0.x = r0.x * 0.500000;
/*233*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*234*/	  r0.z = r0.z * r5.y + 1.000000;
/*235*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*236*/	  r0.z = min(r0.y, 1.000000);
/*237*/	  r2.w = r2.w * 1.570796;
/*238*/	  r2.w = sin(r2.w);
/*239*/	  r0.z = r0.z + -1.000000;
/*240*/	  r0.z = r2.w * r0.z + 1.000000;
/*241*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*242*/	  r2.w = max(r2.w, 0.000000);
/*243*/	  r2.w = log2(r2.w);
/*244*/	  r2.w = r2.w * 10.000000;
/*245*/	  r2.w = exp2(r2.w);
/*246*/	  r2.w = r6.w * r2.w;
/*247*/	  r2.w = r2.w * r7.x + r0.w;
/*248*/	  r0.x = r0.z * abs(r0.x);
/*249*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*250*/	} else {
/*251*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*252*/	}
/*253*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*254*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*255*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*256*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*257*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*258*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*259*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*260*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*261*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*262*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*263*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*264*/	r2.w = 1.000000;
/*265*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*266*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*267*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*268*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*269*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*270*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*271*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*272*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*273*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*274*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*275*/	if(r0.w != 0) discard;
/*276*/	r0.w = sqrt(r1.w);
/*277*/	r1.x = saturate(cb3.data[0].w)/**/;
/*278*/	r1.x = -r1.x + 1.000000;
/*279*/	r1.x = r1.x * 8.000000 + -4.000000;
/*280*/	r1.y = saturate(cb3.data[1].x)/**/;
/*281*/	r1.y = -r1.y + 1.000000;
/*282*/	r1.y = r1.y * 1000.000000;
/*283*/	r0.w = r0.w / r1.y;
/*284*/	r0.w = r0.w + r1.x;
/*285*/	r0.w = r0.w * 1.442695;
/*286*/	r0.w = exp2(r0.w);
/*287*/	r0.w = cb3.data[1].y / r0.w;
/*288*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*289*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*290*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*291*/	r1.x = r1.x + -cb3.data[1].z;
/*292*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*293*/	r1.x = saturate(r1.y * r1.x);
/*294*/	r1.y = r1.x * -2.000000 + 3.000000;
/*295*/	r1.x = r1.x * r1.x;
/*296*/	r1.x = r1.x * r1.y;
/*297*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*298*/	r1.y = sqrt(r1.y);
/*299*/	r1.z = max(cb3.data[2].z, 0.001000);
/*300*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*301*/	r1.y = r1.z * r1.y;
/*302*/	r1.y = min(r1.y, 1.000000);
/*303*/	r1.z = r1.y * -2.000000 + 3.000000;
/*304*/	r1.y = r1.y * r1.y;
/*305*/	r1.y = r1.y * r1.z;
/*306*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*307*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*308*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*309*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*310*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*311*/	r4.w = max(r4.y, 0.000000);
/*312*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*313*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*314*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*315*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*316*/	r0.w = saturate(r0.w * r1.y);
/*317*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*318*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*319*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*320*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*321*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*322*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*323*/	return;
}
