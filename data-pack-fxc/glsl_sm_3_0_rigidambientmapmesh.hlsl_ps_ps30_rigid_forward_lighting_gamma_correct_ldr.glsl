//
//
// Shader Model 4
// Fragment Shader
//
// id: 501 - fxc/glsl_SM_3_0_rigidambientmapmesh.hlsl_PS_ps30_rigid_forward_lighting_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_N0;
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
uniform sampler2D s_colour_mask_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb6;

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
/*9*/	r0.y = r1.w + -0.500000;
/*10*/	r0.y = uintBitsToFloat((r0.y < 0.000000) ? 0xffffffffu : 0x00000000u);
/*11*/	if(r0.y != 0) discard;
/*12*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*13*/	color0.w = r0.x * r1.w;
/*14*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*15*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*16*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*17*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*18*/	r0.x = saturate(vsOut_N0.w);
/*19*/	r5.xyz = (r5.xyzx + -cb6.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb6.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb6.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb6.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb6.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb6.data[2].xyxz).xyw;
/*27*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*28*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*29*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*30*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*31*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*32*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*33*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*35*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*36*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*37*/	r1.w = -r1.w + 1.000000;
/*38*/	r1.w = max(r1.w, 0.000000);
/*39*/	r1.z = sqrt(r1.w);
/*40*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*41*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*42*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*43*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*44*/	r1.w = inversesqrt(r1.w);
/*45*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*46*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*47*/	r1.w = inversesqrt(r1.w);
/*48*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*49*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*50*/	r1.w = inversesqrt(r1.w);
/*51*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*52*/	r9.xyz = (r1.yyyy * r7.xyzx).xyz;
/*53*/	r1.xyw = (r1.xxxx * r6.xyxz + r9.xyxz).xyw;
/*54*/	r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*55*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*56*/	r1.w = inversesqrt(r1.w);
/*57*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*58*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*59*/	r0.z = uintBitsToFloat((floatBitsToInt(cb4.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*60*/	if(floatBitsToUint(r0.z) != 0u) {
/*61*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*62*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*63*/	  r0.z = r3.w * cb1.data[26].x;
/*64*/	  r9.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*65*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*66*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*67*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*68*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*69*/	}
/*70*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*71*/	if(floatBitsToUint(r0.z) != 0u) {
/*72*/	  r0.z = uintBitsToFloat((0.000000 < cb4.data[1].x) ? 0xffffffffu : 0x00000000u);
/*73*/	  if(floatBitsToUint(r0.z) != 0u) {
/*74*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*75*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*76*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*77*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*78*/	    r0.z = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*79*/	    r0.z = -r0.z + 1.000000;
/*80*/	    r0.z = max(r0.z, 0.000000);
/*81*/	    r10.z = sqrt(r0.z);
/*82*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*83*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*84*/	    r0.z = inversesqrt(r0.z);
/*85*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*86*/	    r12.xz = (cb4.data[0].xxyx).xz/**/;
/*87*/	    r12.y = -1.000000;
/*88*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*89*/	    r0.z = inversesqrt(r0.z);
/*90*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*91*/	    r0.z = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*92*/	    r1.w = cb4.data[1].x * cb4.data[1].x;
/*93*/	    r1.w = r1.w * 1.250000;
/*94*/	    r1.w = min(r1.w, 1.000000);
/*95*/	    r2.w = saturate(cb4.data[1].x * cb4.data[1].x + -0.800000);
/*96*/	    r2.w = r2.w * 4.000000;
/*97*/	    r1.w = r1.w * 0.200000 + r2.w;
/*98*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*99*/	    r0.z = r0.z + -r1.w;
/*100*/	    r0.z = saturate(r0.z * 200.000000);
/*101*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*102*/	    r0.z = r0.z * r0.z;
/*103*/	    r0.z = r0.z * r1.w;
/*104*/	    r3.x = r0.z * -r3.x + r3.x;
/*105*/	    r1.w = -r3.y + 0.200000;
/*106*/	    r3.y = r0.z * r1.w + r3.y;
/*107*/	    r0.xyw = (-r0.xyxw * r4.xyxz + vec4(0.400000, 0.400000, 0.000000, 0.400000)).xyw;
/*108*/	    r5.xyz = (r0.zzzz * r0.xywx + r5.xyzx).xyz;
/*109*/	    r0.xyw = (-r2.xyxz + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*110*/	    r2.xyz = (r0.zzzz * r0.xywx + r2.xyzx).xyz;
/*111*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*112*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*113*/	    r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*114*/	    r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*115*/	    r0.x = -r0.x + 1.000000;
/*116*/	    r0.x = max(r0.x, 0.000000);
/*117*/	    r4.z = sqrt(r0.x);
/*118*/	    r0.xyw = (r10.xyxz + r10.xyxz).xyw;
/*119*/	    r1.w = dot(vec2(cb4.data[0].xyxx), vec2(cb4.data[0].xyxx));
/*120*/	    r1.w = sqrt(r1.w);
/*121*/	    r0.xyw = (r0.xyxw * r1.wwww + r4.xyxz).xyw;
/*122*/	    r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*123*/	    r1.w = inversesqrt(r1.w);
/*124*/	    r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*125*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*126*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*127*/	    r0.xyw = (r0.wwww * r8.xyxz + r4.xyxz).xyw;
/*128*/	    r1.w = -r1.y + 1.000000;
/*129*/	    r0.z = min(r0.z, r1.w);
/*130*/	    r0.xyw = (-r1.xyxz + r0.xyxw).xyw;
/*131*/	    r0.xyz = (r0.zzzz * r0.xywx + r1.xyzx).xyz;
/*132*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*133*/	    r0.w = inversesqrt(r0.w);
/*134*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*135*/	  }
/*136*/	}
/*137*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*138*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*139*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*140*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*141*/	r1.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*142*/	r3.yzw = (-r0.yyzw + r1.wwww).yzw;
/*143*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*144*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*145*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*146*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*147*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*148*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*149*/	r1.w = inversesqrt(r1.w);
/*150*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*151*/	r4.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*152*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*153*/	r2.w = inversesqrt(r1.w);
/*154*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*155*/	r2.w = -r3.x + 1.000000;
/*156*/	r5.x = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*157*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*158*/	r5.y = r5.y + r5.y;
/*159*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*160*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*161*/	r6.w = r2.w * 1.539380;
/*162*/	r6.w = cos((r6.w));
/*163*/	r6.w = inversesqrt(r6.w);
/*164*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*165*/	r7.x = saturate(r0.x * 60.000000);
/*166*/	r7.x = -r0.x + r7.x;
/*167*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*168*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*169*/	r8.x = inversesqrt(r8.x);
/*170*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*171*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*172*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*173*/	r8.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*174*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*175*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*176*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*177*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*178*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*179*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*180*/	r7.yzw = (r0.yyzw * r7.yyzw).yzw;
/*181*/	r6.y = -r0.x + 1.000000;
/*182*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*183*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*184*/	if(floatBitsToUint(cb2.data[0].x) != 0u) {
/*185*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*186*/	  r6.y = max(r6.y, 0.000000);
/*187*/	  r6.y = log2(r6.y);
/*188*/	  r6.y = r6.y * 10.000000;
/*189*/	  r6.y = exp2(r6.y);
/*190*/	  r6.y = r6.w * r6.y;
/*191*/	  r6.y = r6.y * r7.x + r0.x;
/*192*/	  r8.x = r2.w * 8.000000;
/*193*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*194*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*195*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*196*/	}
/*197*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb2.data[0].yzwy));
/*198*/	r1.y = max(r1.x, 0.000000);
/*199*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*200*/	if(floatBitsToUint(r1.x) != 0u) {
/*201*/	  r1.x = dot(vec3(-cb2.data[0].yzwy), vec3(r5.yzwy));
/*202*/	  r1.x = max(r1.x, -1.000000);
/*203*/	  r1.x = min(r1.x, 1.000000);
/*204*/	  r1.z = -abs(r1.x) + 1.000000;
/*205*/	  r1.z = sqrt(r1.z);
/*206*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*207*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*208*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*209*/	  r5.z = r1.z * r5.y;
/*210*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*211*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*212*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*213*/	  r1.x = r5.y * r1.z + r1.x;
/*214*/	  r1.z = r3.x * r3.x;
/*215*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*216*/	  r1.z = r1.z * r3.x + r6.x;
/*217*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*218*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*219*/	  r3.x = -r1.z * r1.z + 1.000000;
/*220*/	  r3.x = max(r3.x, 0.001000);
/*221*/	  r3.x = log2(r3.x);
/*222*/	  r5.x = r3.x * 4.950617;
/*223*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*224*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*225*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*226*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*227*/	  r1.z = floatBitsToInt(r1.z);
/*228*/	  r5.x = r3.x * r3.x + -r5.x;
/*229*/	  r5.x = sqrt(r5.x);
/*230*/	  r3.x = -r3.x + r5.x;
/*231*/	  r3.x = max(r3.x, 0.000000);
/*232*/	  r3.x = sqrt(r3.x);
/*233*/	  r1.z = r1.z * r3.x;
/*234*/	  r1.z = r1.z * 1.414214;
/*235*/	  r1.z = 0.008727 / r1.z;
/*236*/	  r1.z = max(r1.z, 0.000100);
/*237*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*238*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*239*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*240*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*241*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*242*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*243*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*244*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*245*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*246*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*247*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*248*/	  r1.x = floatBitsToInt(r1.x);
/*249*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*250*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*251*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*252*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*253*/	  r1.x = r1.x * r5.x + 1.000000;
/*254*/	  r1.x = r1.x * 0.500000;
/*255*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*256*/	  r1.z = r1.z * r5.y + 1.000000;
/*257*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*258*/	  r1.z = min(r1.y, 1.000000);
/*259*/	  r2.w = r2.w * 1.570796;
/*260*/	  r2.w = sin(r2.w);
/*261*/	  r1.z = r1.z + -1.000000;
/*262*/	  r1.z = r2.w * r1.z + 1.000000;
/*263*/	  r2.w = dot(vec3(-cb2.data[0].yzwy), vec3(r3.yzwy));
/*264*/	  r2.w = max(r2.w, 0.000000);
/*265*/	  r2.w = log2(r2.w);
/*266*/	  r2.w = r2.w * 10.000000;
/*267*/	  r2.w = exp2(r2.w);
/*268*/	  r2.w = r6.w * r2.w;
/*269*/	  r2.w = r2.w * r7.x + r0.x;
/*270*/	  r1.x = r1.z * abs(r1.x);
/*271*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*272*/	} else {
/*273*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*274*/	}
/*275*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*276*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*277*/	r3.xyz = (max(r0.xxxx, r3.xyzx)).xyz;
/*278*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*279*/	r0.xyz = (r0.yzwy * r1.yyyy).xyz;
/*280*/	r0.xyz = (r0.xyzx * cb2.data[1].xyzx).xyz;
/*281*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*282*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*283*/	r0.xyz = (r2.xyzx * cb2.data[1].xyzx + r0.xyzx).xyz;
/*284*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*285*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*286*/	r2.w = 1.000000;
/*287*/	r1.x = dot(r2.xyzw, cb1.data[9].xyzw);
/*288*/	r1.y = dot(r2.xyzw, cb1.data[10].xyzw);
/*289*/	r0.w = dot(r2.xyzw, cb1.data[12].xyzw);
/*290*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*291*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb1.data[34].xyxx)) * 0xffffffffu)).xy;
/*292*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*293*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*294*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*295*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*296*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*297*/	if(r0.w != 0) discard;
/*298*/	r0.w = sqrt(r1.w);
/*299*/	r1.x = saturate(cb3.data[0].w)/**/;
/*300*/	r1.x = -r1.x + 1.000000;
/*301*/	r1.x = r1.x * 8.000000 + -4.000000;
/*302*/	r1.y = saturate(cb3.data[1].x)/**/;
/*303*/	r1.y = -r1.y + 1.000000;
/*304*/	r1.y = r1.y * 1000.000000;
/*305*/	r0.w = r0.w / r1.y;
/*306*/	r0.w = r0.w + r1.x;
/*307*/	r0.w = r0.w * 1.442695;
/*308*/	r0.w = exp2(r0.w);
/*309*/	r0.w = cb3.data[1].y / r0.w;
/*310*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*311*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*312*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*313*/	r1.x = r1.x + -cb3.data[1].z;
/*314*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*315*/	r1.x = saturate(r1.y * r1.x);
/*316*/	r1.y = r1.x * -2.000000 + 3.000000;
/*317*/	r1.x = r1.x * r1.x;
/*318*/	r1.x = r1.x * r1.y;
/*319*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*320*/	r1.y = sqrt(r1.y);
/*321*/	r1.z = max(cb3.data[2].z, 0.001000);
/*322*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*323*/	r1.y = r1.z * r1.y;
/*324*/	r1.y = min(r1.y, 1.000000);
/*325*/	r1.z = r1.y * -2.000000 + 3.000000;
/*326*/	r1.y = r1.y * r1.y;
/*327*/	r1.y = r1.y * r1.z;
/*328*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*329*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*330*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*331*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*332*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*333*/	r4.w = max(r4.y, 0.000000);
/*334*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*335*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*336*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*337*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*338*/	r0.w = saturate(r0.w * r1.y);
/*339*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*340*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*341*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*342*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*343*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*344*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*345*/	return;
}
