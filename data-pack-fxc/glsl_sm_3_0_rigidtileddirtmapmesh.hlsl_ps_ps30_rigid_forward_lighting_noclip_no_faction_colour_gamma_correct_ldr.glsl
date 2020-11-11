//
//
// Shader Model 4
// Fragment Shader
//
// id: 827 - fxc/glsl_SM_3_0_rigidtileddirtmapmesh.hlsl_PS_ps30_rigid_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
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
/*19*/	r3.zw = (vsOut_T1.xxxy * cb5.data[2].xxxy).zw;
/*20*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*21*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*22*/	r1.w = r4.w + -1.000000;
/*23*/	r1.w = r5.x * r1.w + 1.000000;
/*24*/	r1.w = saturate(r1.w * r5.x);
/*25*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*26*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*27*/	r5.xyz = (r1.xyzx * r4.xyzx).xyz;
/*28*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*29*/	r1.w = inversesqrt(r1.w);
/*30*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*31*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*32*/	r1.w = inversesqrt(r1.w);
/*33*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*34*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*35*/	r1.w = inversesqrt(r1.w);
/*36*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*37*/	r9.xyz = (r0.yyyy * r7.xyzx).xyz;
/*38*/	r9.xyz = (r0.xxxx * r6.xyzx + r9.xyzx).xyz;
/*39*/	r0.xyw = (r0.wwww * r8.xyxz + r9.xyxz).xyw;
/*40*/	r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*41*/	r1.w = inversesqrt(r1.w);
/*42*/	r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*43*/	r0.xyz = (mix(r0.xywx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*44*/	r0.w = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*45*/	if(floatBitsToUint(r0.w) != 0u) {
/*46*/	  r0.w = uintBitsToFloat((0.990000 < r0.y) ? 0xffffffffu : 0x00000000u);
/*47*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).zw;
/*48*/	  r0.w = r3.w * cb1.data[26].x;
/*49*/	  r9.xy = (r0.wwww * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*50*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*51*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*52*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*53*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*54*/	}
/*55*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*56*/	if(floatBitsToUint(r0.w) != 0u) {
/*57*/	  r0.w = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*58*/	  if(floatBitsToUint(r0.w) != 0u) {
/*59*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*60*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*61*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*62*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*63*/	    r0.w = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*64*/	    r0.w = -r0.w + 1.000000;
/*65*/	    r0.w = max(r0.w, 0.000000);
/*66*/	    r10.z = sqrt(r0.w);
/*67*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r0.xyzx).xyz;
/*68*/	    r0.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*69*/	    r0.w = inversesqrt(r0.w);
/*70*/	    r11.xyz = (r0.wwww * r11.xyzx).xyz;
/*71*/	    r12.xz = (cb4.data[0].xxyx).xz/**/;
/*72*/	    r12.y = -1.000000;
/*73*/	    r0.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*74*/	    r0.w = inversesqrt(r0.w);
/*75*/	    r12.xyz = (r0.wwww * r12.xyzx).xyz;
/*76*/	    r0.w = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*77*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*78*/	    r1.w = r1.w * 1.250000;
/*79*/	    r1.w = min(r1.w, 1.000000);
/*80*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*81*/	    r2.w = r2.w * 4.000000;
/*82*/	    r1.w = r1.w * 0.200000 + r2.w;
/*83*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*84*/	    r0.w = r0.w + -r1.w;
/*85*/	    r0.w = saturate(r0.w * 200.000000);
/*86*/	    r1.w = r0.w * -2.000000 + 3.000000;
/*87*/	    r0.w = r0.w * r0.w;
/*88*/	    r0.w = r0.w * r1.w;
/*89*/	    r3.x = r0.w * -r3.x + r3.x;
/*90*/	    r1.w = -r3.y + 0.200000;
/*91*/	    r3.y = r0.w * r1.w + r3.y;
/*92*/	    r1.xyz = (-r1.xyzx * r4.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*93*/	    r5.xyz = (r0.wwww * r1.xyzx + r5.xyzx).xyz;
/*94*/	    r1.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*95*/	    r2.xyz = (r0.wwww * r1.xyzx + r2.xyzx).xyz;
/*96*/	    r1.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*97*/	    r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*98*/	    r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*99*/	    r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*100*/	    r1.w = -r1.w + 1.000000;
/*101*/	    r1.w = max(r1.w, 0.000000);
/*102*/	    r1.z = sqrt(r1.w);
/*103*/	    r4.xyz = (r10.xyzx + r10.xyzx).xyz;
/*104*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*105*/	    r1.w = sqrt(r1.w);
/*106*/	    r1.xyz = (r4.xyzx * r1.wwww + r1.xyzx).xyz;
/*107*/	    r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*108*/	    r1.w = inversesqrt(r1.w);
/*109*/	    r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*110*/	    r4.xyz = (r7.xyzx * r1.yyyy).xyz;
/*111*/	    r1.xyw = (r1.xxxx * r6.xyxz + r4.xyxz).xyw;
/*112*/	    r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*113*/	    r1.w = -r0.y + 1.000000;
/*114*/	    r0.w = min(r0.w, r1.w);
/*115*/	    r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*116*/	    r1.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*117*/	    r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*118*/	    r0.w = inversesqrt(r0.w);
/*119*/	    r0.xyz = (r0.wwww * r1.xyzx).xyz;
/*120*/	  }
/*121*/	}
/*122*/	r0.w = vsOut_T7.y * -r3.y + r3.y;
/*123*/	r1.xyz = (r5.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*124*/	r1.xyz = (-r5.xyzx + r1.xyzx).xyz;
/*125*/	r1.xyz = saturate(vsOut_T7.yyyy * r1.xyzx + r5.xyzx).xyz;
/*126*/	r1.w = dot(vec3(r1.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*127*/	r3.yzw = (-r1.xxyz + r1.wwww).yzw;
/*128*/	r1.xyz = (vsOut_T7.zzzz * r3.yzwy + r1.xyzx).xyz;
/*129*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*130*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*131*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*132*/	r0.w = vsOut_T7.z * -r0.w + r0.w;
/*133*/	r1.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*134*/	r1.w = inversesqrt(r1.w);
/*135*/	r0.xyz = (r0.xyzx * r1.wwww).xyz;
/*136*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*137*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*138*/	r2.w = inversesqrt(r1.w);
/*139*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*140*/	r2.w = -r3.x + 1.000000;
/*141*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*142*/	r5.y = dot(vec3(r3.yzwy), vec3(r0.xyzx));
/*143*/	r5.y = r5.y + r5.y;
/*144*/	r5.yzw = (r0.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*145*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*146*/	r6.w = r2.w * 1.539380;
/*147*/	r6.w = cos((r6.w));
/*148*/	r6.w = inversesqrt(r6.w);
/*149*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*150*/	r7.x = saturate(r0.w * 60.000000);
/*151*/	r7.x = -r0.w + r7.x;
/*152*/	r7.yzw = (r0.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*153*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*154*/	r8.x = inversesqrt(r8.x);
/*155*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*156*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*157*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*158*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*159*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*160*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*161*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*162*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*163*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*164*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*165*/	r7.yzw = (r1.xxyz * r7.yyzw).yzw;
/*166*/	r6.y = -r0.w + 1.000000;
/*167*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*168*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*169*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*170*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*171*/	  r6.y = max(r6.y, 0.000000);
/*172*/	  r6.y = log2(r6.y);
/*173*/	  r6.y = r6.y * 10.000000;
/*174*/	  r6.y = exp2(r6.y);
/*175*/	  r6.y = r6.w * r6.y;
/*176*/	  r6.y = r6.y * r7.x + r0.w;
/*177*/	  r8.x = r2.w * 8.000000;
/*178*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*179*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*180*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*181*/	}
/*182*/	r0.x = dot(vec3(r0.xyzx), vec3(-cb2.data[0].yzwy));
/*183*/	r0.y = max(r0.x, 0.000000);
/*184*/	r0.x = uintBitsToFloat((0.000000 < r0.x) ? 0xffffffffu : 0x00000000u);
/*185*/	if(floatBitsToUint(r0.x) != 0u) {
/*186*/	  r0.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*187*/	  r0.x = max(r0.x, -1.000000);
/*188*/	  r0.x = min(r0.x, 1.000000);
/*189*/	  r0.z = -abs(r0.x) + 1.000000;
/*190*/	  r0.z = sqrt(r0.z);
/*191*/	  r5.y = abs(r0.x) * -0.018729 + 0.074261;
/*192*/	  r5.y = r5.y * abs(r0.x) + -0.212114;
/*193*/	  r5.y = r5.y * abs(r0.x) + 1.570729;
/*194*/	  r5.z = r0.z * r5.y;
/*195*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*196*/	  r0.x = uintBitsToFloat((r0.x < -r0.x) ? 0xffffffffu : 0x00000000u);
/*197*/	  r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r5.z));
/*198*/	  r0.x = r5.y * r0.z + r0.x;
/*199*/	  r0.z = r3.x * r3.x;
/*200*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*201*/	  r0.z = r0.z * r3.x + r6.x;
/*202*/	  r0.z = r0.z * 0.500000 + 0.500000;
/*203*/	  r0.z = r0.z * 2.000000 + -1.000000;
/*204*/	  r3.x = -r0.z * r0.z + 1.000000;
/*205*/	  r3.x = max(r3.x, 0.001000);
/*206*/	  r3.x = log2(r3.x);
/*207*/	  r5.x = r3.x * 4.950617;
/*208*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*209*/	  r5.y = uintBitsToFloat((0.000000 < r0.z) ? 0xffffffffu : 0x00000000u);
/*210*/	  r0.z = uintBitsToFloat((r0.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*211*/	  r0.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r0.z));
/*212*/	  r0.z = floatBitsToInt(r0.z);
/*213*/	  r5.x = r3.x * r3.x + -r5.x;
/*214*/	  r5.x = sqrt(r5.x);
/*215*/	  r3.x = -r3.x + r5.x;
/*216*/	  r3.x = max(r3.x, 0.000000);
/*217*/	  r3.x = sqrt(r3.x);
/*218*/	  r0.z = r0.z * r3.x;
/*219*/	  r0.z = r0.z * 1.414214;
/*220*/	  r0.z = 0.008727 / r0.z;
/*221*/	  r0.z = max(r0.z, 0.000100);
/*222*/	  r5.xy = (r0.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*223*/	  r0.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.z)).x;
/*224*/	  r0.xz = (r0.xxxx * r5.xxyx).xz;
/*225*/	  r5.xy = (r0.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*226*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*227*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*228*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*229*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*230*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r0.xxxz)) * 0xffffffffu)).zw;
/*231*/	  r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*232*/	  r0.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r0.x));
/*233*/	  r0.x = floatBitsToInt(r0.x);
/*234*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*235*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*236*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*237*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*238*/	  r0.x = r0.x * r5.x + 1.000000;
/*239*/	  r0.x = r0.x * 0.500000;
/*240*/	  r0.z = 1 + ~floatBitsToInt(r5.w);
/*241*/	  r0.z = r0.z * r5.y + 1.000000;
/*242*/	  r0.x = r0.z * 0.500000 + -r0.x;
/*243*/	  r0.z = min(r0.y, 1.000000);
/*244*/	  r2.w = r2.w * 1.570796;
/*245*/	  r2.w = sin(r2.w);
/*246*/	  r0.z = r0.z + -1.000000;
/*247*/	  r0.z = r2.w * r0.z + 1.000000;
/*248*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*249*/	  r2.w = max(r2.w, 0.000000);
/*250*/	  r2.w = log2(r2.w);
/*251*/	  r2.w = r2.w * 10.000000;
/*252*/	  r2.w = exp2(r2.w);
/*253*/	  r2.w = r6.w * r2.w;
/*254*/	  r2.w = r2.w * r7.x + r0.w;
/*255*/	  r0.x = r0.z * abs(r0.x);
/*256*/	  r3.xyz = (r2.wwww * r0.xxxx).xyz;
/*257*/	} else {
/*258*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*259*/	}
/*260*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*261*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*262*/	r0.xzw = (max(r0.wwww, r3.xxyz)).xzw;
/*263*/	r0.xzw = (-r0.xxzw + vec4(1.000000, 0.000000, 1.000000, 1.000000)).xzw;
/*264*/	r1.xyz = (r0.yyyy * r1.xyzx).xyz;
/*265*/	r1.xyz = (r1.xyzx * cb2.data[1].xyzx).xyz;
/*266*/	r0.xyz = (r0.xzwx * r1.xyzx).xyz;
/*267*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*268*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*269*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*270*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*271*/	r2.w = 1.000000;
/*272*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*273*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*274*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*275*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*276*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*277*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*278*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*279*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*280*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*281*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*282*/	if(r0.w != 0) discard;
/*283*/	r0.w = sqrt(r1.w);
/*284*/	r1.x = saturate(cb3.data[0].w)/**/;
/*285*/	r1.x = -r1.x + 1.000000;
/*286*/	r1.x = r1.x * 8.000000 + -4.000000;
/*287*/	r1.y = saturate(cb3.data[1].x)/**/;
/*288*/	r1.y = -r1.y + 1.000000;
/*289*/	r1.y = r1.y * 1000.000000;
/*290*/	r0.w = r0.w / r1.y;
/*291*/	r0.w = r0.w + r1.x;
/*292*/	r0.w = r0.w * 1.442695;
/*293*/	r0.w = exp2(r0.w);
/*294*/	r0.w = cb3.data[1].y / r0.w;
/*295*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*296*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*297*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*298*/	r1.x = r1.x + -cb3.data[1].z;
/*299*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*300*/	r1.x = saturate(r1.y * r1.x);
/*301*/	r1.y = r1.x * -2.000000 + 3.000000;
/*302*/	r1.x = r1.x * r1.x;
/*303*/	r1.x = r1.x * r1.y;
/*304*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*305*/	r1.y = sqrt(r1.y);
/*306*/	r1.z = max(cb3.data[2].z, 0.001000);
/*307*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*308*/	r1.y = r1.z * r1.y;
/*309*/	r1.y = min(r1.y, 1.000000);
/*310*/	r1.z = r1.y * -2.000000 + 3.000000;
/*311*/	r1.y = r1.y * r1.y;
/*312*/	r1.y = r1.y * r1.z;
/*313*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*314*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*315*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*316*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*317*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*318*/	r4.w = max(r4.y, 0.000000);
/*319*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*320*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*321*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*322*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*323*/	r0.w = saturate(r0.w * r1.y);
/*324*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*325*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*326*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*327*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*328*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*329*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*330*/	return;
}
