//
//
// Shader Model 4
// Fragment Shader
//
// id: 4669 - fxc/glsl_ENABLE_SHADOWS_SHADOWS_SOFTWARE_SM_3_0_rigidstandard.hlsl_PS_ps30_rigid_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*17*/	r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*18*/	r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*19*/	r0.x = -r0.x + 1.000000;
/*20*/	r0.x = max(r0.x, 0.000000);
/*21*/	r4.z = sqrt(r0.x);
/*22*/	r0.xyw = (mix(r4.xyxz, vsOut_T2.xyxz, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyw;
/*23*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*24*/	r1.w = inversesqrt(r1.w);
/*25*/	r4.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*26*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*27*/	r1.w = inversesqrt(r1.w);
/*28*/	r5.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*29*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*30*/	r1.w = inversesqrt(r1.w);
/*31*/	r6.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*32*/	r7.xyz = (r0.yyyy * r5.xyzx).xyz;
/*33*/	r7.xyz = (r0.xxxx * r4.xyzx + r7.xyzx).xyz;
/*34*/	r0.xyw = (r0.wwww * r6.xyxz + r7.xyxz).xyw;
/*35*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*36*/	r1.w = inversesqrt(r1.w);
/*37*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*38*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*39*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*40*/	if(floatBitsToUint(r0.w) != 0u) {
/*41*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*42*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*43*/	  r0.w = r3.w * cb1.data[26].x;
/*44*/	  r7.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*45*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r7.xxxy).zw;
/*46*/	  r7.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*47*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*48*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*49*/	}
/*50*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*51*/	if(floatBitsToUint(r0.w) != 0u) {
/*52*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*53*/	  if(floatBitsToUint(r0.w) != 0u) {
/*54*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*55*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*56*/	    r3.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*57*/	    r8.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*58*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*59*/	    r0.w = -r0.w + 1.000000;
/*60*/	    r0.w = max(r0.w, 0.000000);
/*61*/	    r8.z = sqrt(r0.w);
/*62*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*63*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*64*/	    r0.w = inversesqrt(r0.w);
/*65*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*66*/	    r10.xz = (cb4.data[0].xxyx).xz/**/;
/*67*/	    r10.y = -1.000000;
/*68*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*69*/	    r0.w = inversesqrt(r0.w);
/*70*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*71*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*72*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*73*/	    r1.w = r1.w * 1.250000;
/*74*/	    r1.w = min(r1.w, 1.000000);
/*75*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*76*/	    r2.w = r2.w * 4.000000;
/*77*/	    r1.w = r1.w * 0.200000 + r2.w;
/*78*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*79*/	    r0.w = r0.w + -r1.w;
/*80*/	    r0.w = saturate(r0.w * 200.000000);
/*81*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*82*/	    r0.w = r0.w * r0.w;
/*83*/	    r0.w = r0.w * r1.w;
/*84*/	    r3.x = r0.w * -r3.x + r3.x;
/*85*/	    r1.w = -r3.y + 0.200000;
/*86*/	    r3.y = r0.w * r1.w + r3.y;
/*87*/	    r9.xyz = (-r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*88*/	    r1.xyz = (r0.wwww * r9.xyzx + r1.xyzx).xyz;
/*89*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*90*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*91*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*92*/	    r3.zw = (r7.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*93*/	    r7.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*94*/	    r1.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*95*/	    r1.w = -r1.w + 1.000000;
/*96*/	    r1.w = max(r1.w, 0.000000);
/*97*/	    r7.z = sqrt(r1.w);
/*98*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*99*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*100*/	    r1.w = sqrt(r1.w);
/*101*/	    r7.xyz = (r8.xyzx * r1.wwww + r7.xyzx).xyz;
/*102*/	    r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*103*/	    r1.w = inversesqrt(r1.w);
/*104*/	    r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*105*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*106*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*107*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*108*/	    r1.w = -r0.y + 1.000000;
/*109*/	    r0.w = min(r0.w, r1.w);
/*110*/	    r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*111*/	    r4.xyz = (r0.wwww * r4.xyzx + r0.xyzx).xyz;
/*112*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*113*/	    r0.w = inversesqrt(r0.w);
/*114*/	    r0.xyz = (r0.wwww * r4.xyzx).xyz;
/*115*/	  }
/*116*/	}
/*117*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*118*/	r3.yzw = (r1.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*119*/	r3.yzw = (-r1.xxyz + r3.yyzw).yzw;
/*120*/	r1.xyz = saturate(vsOut_T7.yyyy * r3.yzwy + r1.xyzx).xyz;
/*121*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*122*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*123*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*124*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*125*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*126*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*127*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*128*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*129*/	r1.w = inversesqrt(r1.w);
/*130*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*131*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*132*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*133*/	r2.w = inversesqrt(r1.w);
/*134*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*135*/	r2.w = -r3.x + 1.000000;
/*136*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*137*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*138*/	r5.y = r5.y + r5.y;
/*139*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*140*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*141*/	r6.w = r2.w * 1.539380;
/*142*/	r6.w = cos((r6.w));
/*143*/	r6.w = inversesqrt(r6.w);
/*144*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*145*/	r7.x = saturate(r0.w * 60.000000);
/*146*/	r7.x = -r0.w + r7.x;
/*147*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*148*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*149*/	r8.x = inversesqrt(r8.x);
/*150*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*151*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*152*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*153*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*154*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*155*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*156*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*157*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*158*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*159*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*160*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*161*/	r6.y = -r0.w + 1.000000;
/*162*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*163*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*164*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*165*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*166*/	  r6.y = max(r6.y, 0.000000);
/*167*/	  r6.y = log2(r6.y);
/*168*/	  r6.y = r6.y * 10.000000;
/*169*/	  r6.y = exp2(r6.y);
/*170*/	  r6.y = r6.w * r6.y;
/*171*/	  r6.y = r6.y * r7.x + r0.w;
/*172*/	  r8.x = r2.w * 8.000000;
/*173*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*174*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*175*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*176*/	}
/*177*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*178*/	r0.y = max(r0.x, 0.000000);
/*179*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*180*/	if(floatBitsToUint(r0.x) != 0u) {
/*181*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*182*/	  r0.x = max(r0.x, -1.000000);
/*183*/	  r0.x = min(r0.x, 1.000000);
/*184*/	  r0.z = -abs(r0.x) + 1.000000;
/*185*/	  r0.z = sqrt(r0.z);
/*186*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*187*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*188*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*189*/	  r5.z = r0.z * r5.y;
/*190*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*191*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*192*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*193*/	  r0.x = r5.y * r0.z + r0.x;
/*194*/	  r0.z = r3.x * r3.x;
/*195*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*196*/	  r0.z = r0.z * r3.x + r6.x;
/*197*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*198*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*199*/	  r3.x = -r0.z * r0.z + 1.000000;
/*200*/	  r3.x = max(r3.x, 0.001000);
/*201*/	  r3.x = log2(r3.x);
/*202*/	  r5.x = r3.x * 4.950617;
/*203*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*204*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*205*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*206*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*207*/	  r0.z = floatBitsToInt(r0.z);
/*208*/	  r5.x = r3.x * r3.x + -r5.x;
/*209*/	  r5.x = sqrt(r5.x);
/*210*/	  r3.x = -r3.x + r5.x;
/*211*/	  r3.x = max(r3.x, 0.000000);
/*212*/	  r3.x = sqrt(r3.x);
/*213*/	  r0.z = r0.z * r3.x;
/*214*/	  r0.z = r0.z * 1.414214;
/*215*/	  r0.z = 0.008727 / r0.z;
/*216*/	  r0.z = max(r0.z, 0.000100);
/*217*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*218*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*219*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*220*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*221*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*222*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*223*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*224*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*225*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*226*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*227*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*228*/	  r0.x = floatBitsToInt(r0.x);
/*229*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*230*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*231*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*232*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*233*/	  r0.x = r0.x * r5.x + 1.000000;
/*234*/	  r0.x = r0.x * 0.500000;
/*235*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*236*/	  r0.z = r0.z * r5.y + 1.000000;
/*237*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*238*/	  r0.z = min(r0.y, 1.000000);
/*239*/	  r2.w = r2.w * 1.570796;
/*240*/	  r2.w = sin(r2.w);
/*241*/	  r0.z = r0.z + -1.000000;
/*242*/	  r0.z = r2.w * r0.z + 1.000000;
/*243*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*244*/	  r2.w = max(r2.w, 0.000000);
/*245*/	  r2.w = log2(r2.w);
/*246*/	  r2.w = r2.w * 10.000000;
/*247*/	  r2.w = exp2(r2.w);
/*248*/	  r2.w = r6.w * r2.w;
/*249*/	  r2.w = r2.w * r7.x + r0.w;
/*250*/	  r0.x = r0.z * abs(r0.x);
/*251*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*252*/	} else {
/*253*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*254*/	}
/*255*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*256*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*257*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*258*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*259*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*260*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*261*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*262*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*263*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*264*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*265*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*266*/	r2.w = 1.000000;
/*267*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*268*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*269*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*270*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*271*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*272*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*273*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*274*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*275*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*276*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*277*/	if(r0.w != 0) discard;
/*278*/	r0.w = sqrt(r1.w);
/*279*/	r1.x = saturate(cb3.data[0].w)/**/;
/*280*/	r1.x = -r1.x + 1.000000;
/*281*/	r1.x = r1.x * 8.000000 + -4.000000;
/*282*/	r1.y = saturate(cb3.data[1].x)/**/;
/*283*/	r1.y = -r1.y + 1.000000;
/*284*/	r1.y = r1.y * 1000.000000;
/*285*/	r0.w = r0.w / r1.y;
/*286*/	r0.w = r0.w + r1.x;
/*287*/	r0.w = r0.w * 1.442695;
/*288*/	r0.w = exp2(r0.w);
/*289*/	r0.w = cb3.data[1].y / r0.w;
/*290*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*291*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*292*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*293*/	r1.x = r1.x + -cb3.data[1].z;
/*294*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*295*/	r1.x = saturate(r1.y * r1.x);
/*296*/	r1.y = r1.x * -2.000000 + 3.000000;
/*297*/	r1.x = r1.x * r1.x;
/*298*/	r1.x = r1.x * r1.y;
/*299*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*300*/	r1.y = sqrt(r1.y);
/*301*/	r1.z = max(cb3.data[2].z, 0.001000);
/*302*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*303*/	r1.y = r1.z * r1.y;
/*304*/	r1.y = min(r1.y, 1.000000);
/*305*/	r1.z = r1.y * -2.000000 + 3.000000;
/*306*/	r1.y = r1.y * r1.y;
/*307*/	r1.y = r1.y * r1.z;
/*308*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*309*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*310*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*311*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*312*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*313*/	r4.w = max(r4.y, 0.000000);
/*314*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*315*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*316*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*317*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*318*/	r0.w = saturate(r0.w * r1.y);
/*319*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*320*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*321*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*322*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*323*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*324*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*325*/	return;
}
