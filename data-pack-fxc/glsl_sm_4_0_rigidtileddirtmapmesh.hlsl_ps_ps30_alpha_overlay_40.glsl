//
//
// Shader Model 4
// Fragment Shader
//
// id: 801 - fxc/glsl_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps30_alpha_overlay_40.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_detail_map;
uniform sampler2D s_alpha_mask;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;
uniform samplerCube s_environment;

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
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb4.data[0].yyzy)) * 0xffffffffu)).yz;
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
/*19*/	r5.xyz = (r5.xyzx + -cb5.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb5.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb5.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb5.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb5.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb5.data[2].xyxz).xyw;
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
/*41*/	r3.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy).zw;
/*42*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*43*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*44*/	r1.w = r4.w + -1.000000;
/*45*/	r1.w = r5.x * r1.w + 1.000000;
/*46*/	r1.w = saturate(r1.w * r5.x);
/*47*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*48*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*49*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*50*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*51*/	r1.w = inversesqrt(r1.w);
/*52*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*53*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*54*/	r1.w = inversesqrt(r1.w);
/*55*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*56*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*57*/	r1.w = inversesqrt(r1.w);
/*58*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*59*/	r9.xyz = (r1.yyyy * r7.xyzx).xyz;
/*60*/	r1.xyw = (r1.xxxx * r6.xyxz + r9.xyxz).xyw;
/*61*/	r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*62*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*63*/	r1.w = inversesqrt(r1.w);
/*64*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*65*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*66*/	r0.z = uintBitsToFloat((floatBitsToInt(cb3.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*67*/	if(floatBitsToUint(r0.z) != 0u) {
/*68*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*69*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*70*/	  r0.z = r3.w * cb0.data[26].x;
/*71*/	  r9.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*72*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*73*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*74*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*75*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*76*/	}
/*77*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*78*/	if(floatBitsToUint(r0.z) != 0u) {
/*79*/	  r0.z = uintBitsToFloat((0.000000 < cb3.data[1].x) ? 0xffffffffu : 0x00000000u);
/*80*/	  if(floatBitsToUint(r0.z) != 0u) {
/*81*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*82*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*83*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*84*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*85*/	    r0.z = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*86*/	    r0.z = -r0.z + 1.000000;
/*87*/	    r0.z = max(r0.z, 0.000000);
/*88*/	    r10.z = sqrt(r0.z);
/*89*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*90*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*91*/	    r0.z = inversesqrt(r0.z);
/*92*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*93*/	    r12.xz = (cb3.data[0].xxyx).xz/**/;
/*94*/	    r12.y = -1.000000;
/*95*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*96*/	    r0.z = inversesqrt(r0.z);
/*97*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*98*/	    r0.z = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*99*/	    r1.w = cb3.data[1].x * cb3.data[1].x;
/*100*/	    r1.w = r1.w * 1.250000;
/*101*/	    r1.w = min(r1.w, 1.000000);
/*102*/	    r2.w = saturate(cb3.data[1].x * cb3.data[1].x + -0.800000);
/*103*/	    r2.w = r2.w * 4.000000;
/*104*/	    r1.w = r1.w * 0.200000 + r2.w;
/*105*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*106*/	    r0.z = r0.z + -r1.w;
/*107*/	    r0.z = saturate(r0.z * 200.000000);
/*108*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*109*/	    r0.z = r0.z * r0.z;
/*110*/	    r0.z = r0.z * r1.w;
/*111*/	    r3.x = r0.z * -r3.x + r3.x;
/*112*/	    r1.w = -r3.y + 0.200000;
/*113*/	    r3.y = r0.z * r1.w + r3.y;
/*114*/	    r0.xyw = (-r0.xyxw * r4.xyxz + vec4(0.400000, 0.400000, 0.000000, 0.400000)).xyw;
/*115*/	    r5.xyz = (r0.zzzz * r0.xywx + r5.xyzx).xyz;
/*116*/	    r0.xyw = (-r2.xyxz + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*117*/	    r2.xyz = (r0.zzzz * r0.xywx + r2.xyzx).xyz;
/*118*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*119*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*120*/	    r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*121*/	    r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*122*/	    r0.x = -r0.x + 1.000000;
/*123*/	    r0.x = max(r0.x, 0.000000);
/*124*/	    r4.z = sqrt(r0.x);
/*125*/	    r0.xyw = (r10.xyxz + r10.xyxz).xyw;
/*126*/	    r1.w = dot(vec2(cb3.data[0].xyxx), vec2(cb3.data[0].xyxx));
/*127*/	    r1.w = sqrt(r1.w);
/*128*/	    r0.xyw = (r0.xyxw * r1.wwww + r4.xyxz).xyw;
/*129*/	    r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*130*/	    r1.w = inversesqrt(r1.w);
/*131*/	    r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*132*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*133*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*134*/	    r0.xyw = (r0.wwww * r8.xyxz + r4.xyxz).xyw;
/*135*/	    r1.w = -r1.y + 1.000000;
/*136*/	    r0.z = min(r0.z, r1.w);
/*137*/	    r0.xyw = (-r1.xyxz + r0.xyxw).xyw;
/*138*/	    r0.xyz = (r0.zzzz * r0.xywx + r1.xyzx).xyz;
/*139*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*140*/	    r0.w = inversesqrt(r0.w);
/*141*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*142*/	  }
/*143*/	}
/*144*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*145*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*146*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*147*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*148*/	r1.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*149*/	r3.yzw = (-r0.yyzw + r1.wwww).yzw;
/*150*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*151*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*152*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*153*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*154*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*155*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*156*/	r1.w = inversesqrt(r1.w);
/*157*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*158*/	r4.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*159*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*160*/	r2.w = inversesqrt(r1.w);
/*161*/	r3.yzw = (r2.wwww * r4.xxyz).yzw;
/*162*/	r2.w = -r3.x + 1.000000;
/*163*/	r5.x = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*164*/	r5.y = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*165*/	r5.y = r5.y + r5.y;
/*166*/	r5.yzw = (r1.xxyz * -r5.yyyy + r3.yyzw).yzw;
/*167*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r5.xxxx), uvec4(0)))).xyz;
/*168*/	r6.w = r2.w * 1.539380;
/*169*/	r6.w = cos((r6.w));
/*170*/	r6.w = inversesqrt(r6.w);
/*171*/	r6.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r6.w)).w;
/*172*/	r7.x = saturate(r0.x * 60.000000);
/*173*/	r7.x = -r0.x + r7.x;
/*174*/	r7.yzw = (r1.xxyz * vec4(0.000000, 1.000000, 4.000000, 1.000000)).yzw;
/*175*/	r8.x = dot(vec3(r7.yzwy), vec3(r7.yzwy));
/*176*/	r8.x = inversesqrt(r8.x);
/*177*/	r7.yzw = (r7.yyzw * r8.xxxx).yzw;
/*178*/	r8.xyz = (uintBitsToFloat(uvec4(lessThan(r7.yzwy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*179*/	r9.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r8.xxxx), uvec4(0)))).xyz/**/;
/*180*/	r8.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r8.yyyy), uvec4(0)))).xyw/**/;
/*181*/	r10.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r8.zzzz), uvec4(0)))).xyz/**/;
/*182*/	r7.yzw = (r7.yyzw * r7.yyzw).yzw;
/*183*/	r8.xyz = (r8.xywx * r7.zzzz).xyz;
/*184*/	r8.xyz = (r7.yyyy * r9.xyzx + r8.xyzx).xyz;
/*185*/	r7.yzw = (r7.wwww * r10.xxyz + r8.xxyz).yzw;
/*186*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*187*/	r7.yzw = (r0.yyzw * r7.yyzw).yzw;
/*188*/	r6.y = -r0.x + 1.000000;
/*189*/	r7.yzw = (r6.yyyy * r7.yyzw).yzw;
/*190*/	r7.yzw = (r6.xxxx * r7.yyzw).yzw;
/*191*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*192*/	  r6.y = dot(vec3(r5.yzwy), vec3(r3.yzwy));
/*193*/	  r6.y = max(r6.y, 0.000000);
/*194*/	  r6.y = log2(r6.y);
/*195*/	  r6.y = r6.y * 10.000000;
/*196*/	  r6.y = exp2(r6.y);
/*197*/	  r6.y = r6.w * r6.y;
/*198*/	  r6.y = r6.y * r7.x + r0.x;
/*199*/	  r8.x = r2.w * 8.000000;
/*200*/	  r8.xyzw = (textureLod(s_environment, r5.yzwy.stp, r8.x)).xyzw;
/*201*/	  r8.xyz = (r6.yyyy * r8.xyzx).xyz;
/*202*/	  r7.yzw = (r8.xxyz * r2.xxyz + r7.yyzw).yzw;
/*203*/	}
/*204*/	r1.x = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*205*/	r1.y = max(r1.x, 0.000000);
/*206*/	r1.x = uintBitsToFloat((0.000000 < r1.x) ? 0xffffffffu : 0x00000000u);
/*207*/	if(floatBitsToUint(r1.x) != 0u) {
/*208*/	  r1.x = dot(vec3(-cb1.data[0].yzwy), vec3(r5.yzwy));
/*209*/	  r1.x = max(r1.x, -1.000000);
/*210*/	  r1.x = min(r1.x, 1.000000);
/*211*/	  r1.z = -abs(r1.x) + 1.000000;
/*212*/	  r1.z = sqrt(r1.z);
/*213*/	  r5.y = abs(r1.x) * -0.018729 + 0.074261;
/*214*/	  r5.y = r5.y * abs(r1.x) + -0.212114;
/*215*/	  r5.y = r5.y * abs(r1.x) + 1.570729;
/*216*/	  r5.z = r1.z * r5.y;
/*217*/	  r5.z = r5.z * -2.000000 + 3.141593;
/*218*/	  r1.x = uintBitsToFloat((r1.x < -r1.x) ? 0xffffffffu : 0x00000000u);
/*219*/	  r1.x = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r5.z));
/*220*/	  r1.x = r5.y * r1.z + r1.x;
/*221*/	  r1.z = r3.x * r3.x;
/*222*/	    r3.x = (floatBitsToUint(r5.x) > 0x00000000u) ? 0.995900 : -0.000100;
/*223*/	  r1.z = r1.z * r3.x + r6.x;
/*224*/	  r1.z = r1.z * 0.500000 + 0.500000;
/*225*/	  r1.z = r1.z * 2.000000 + -1.000000;
/*226*/	  r3.x = -r1.z * r1.z + 1.000000;
/*227*/	  r3.x = max(r3.x, 0.001000);
/*228*/	  r3.x = log2(r3.x);
/*229*/	  r5.x = r3.x * 4.950617;
/*230*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*231*/	  r5.y = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*232*/	  r1.z = uintBitsToFloat((r1.z < 0.000000) ? 0xffffffffu : 0x00000000u);
/*233*/	  r1.z = intBitsToFloat(1 + ~floatBitsToInt(r5.y) + floatBitsToInt(r1.z));
/*234*/	  r1.z = floatBitsToInt(r1.z);
/*235*/	  r5.x = r3.x * r3.x + -r5.x;
/*236*/	  r5.x = sqrt(r5.x);
/*237*/	  r3.x = -r3.x + r5.x;
/*238*/	  r3.x = max(r3.x, 0.000000);
/*239*/	  r3.x = sqrt(r3.x);
/*240*/	  r1.z = r1.z * r3.x;
/*241*/	  r1.z = r1.z * 1.414214;
/*242*/	  r1.z = 0.008727 / r1.z;
/*243*/	  r1.z = max(r1.z, 0.000100);
/*244*/	  r5.xy = (r1.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*245*/	  r1.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).x;
/*246*/	  r1.xz = (r1.xxxx * r5.xxyx).xz;
/*247*/	  r5.xy = (r1.xzxx * vec4(0.707107, 0.707107, 0.000000, 0.000000)).xy;
/*248*/	  r5.xy = (r5.xyxx * r5.xyxx).xy;
/*249*/	  r8.xyzw = r5.xxyy * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*250*/	  r5.zw = (r8.xxxz / r8.yyyw).zw;
/*251*/	  r5.xy = (r5.zwzz * -r5.xyxx).xy;
/*252*/	  r5.zw = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r1.xxxz)) * 0xffffffffu)).zw;
/*253*/	  r1.x = uintBitsToFloat((r1.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*254*/	  r1.x = intBitsToFloat(1 + ~floatBitsToInt(r5.z) + floatBitsToInt(r1.x));
/*255*/	  r1.x = floatBitsToInt(r1.x);
/*256*/	  r5.xy = (r5.xyxx * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*257*/	  r5.xy = (exp2(r5.xyxx)).xy;
/*258*/	  r5.xy = (-r5.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*259*/	  r5.xy = (sqrt(r5.xyxx)).xy;
/*260*/	  r1.x = r1.x * r5.x + 1.000000;
/*261*/	  r1.x = r1.x * 0.500000;
/*262*/	  r1.z = 1 + ~floatBitsToInt(r5.w);
/*263*/	  r1.z = r1.z * r5.y + 1.000000;
/*264*/	  r1.x = r1.z * 0.500000 + -r1.x;
/*265*/	  r1.z = min(r1.y, 1.000000);
/*266*/	  r2.w = r2.w * 1.570796;
/*267*/	  r2.w = sin(r2.w);
/*268*/	  r1.z = r1.z + -1.000000;
/*269*/	  r1.z = r2.w * r1.z + 1.000000;
/*270*/	  r2.w = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*271*/	  r2.w = max(r2.w, 0.000000);
/*272*/	  r2.w = log2(r2.w);
/*273*/	  r2.w = r2.w * 10.000000;
/*274*/	  r2.w = exp2(r2.w);
/*275*/	  r2.w = r6.w * r2.w;
/*276*/	  r2.w = r2.w * r7.x + r0.x;
/*277*/	  r1.x = r1.z * abs(r1.x);
/*278*/	  r3.xyz = (r2.wwww * r1.xxxx).xyz;
/*279*/	} else {
/*280*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*281*/	}
/*282*/	r5.xyz = saturate(r6.zzzz * r3.xyzx).xyz;
/*283*/	r2.xyz = (r2.xyzx * r5.xyzx).xyz;
/*284*/	r3.xyz = (max(r0.xxxx, r3.xyzx)).xyz;
/*285*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*286*/	r0.xyz = (r0.yzwy * r1.yyyy).xyz;
/*287*/	r0.xyz = (r0.xyzx * cb1.data[1].xyzx).xyz;
/*288*/	r0.xyz = (r3.xyzx * r0.xyzx).xyz;
/*289*/	r0.xyz = (r6.xxxx * r0.xyzx).xyz;
/*290*/	r0.xyz = (r2.xyzx * cb1.data[1].xyzx + r0.xyzx).xyz;
/*291*/	r0.xyz = (r0.xyzx + r7.yzwy).xyz;
/*292*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*293*/	r2.w = 1.000000;
/*294*/	r1.x = dot(r2.xyzw, cb0.data[9].xyzw);
/*295*/	r1.y = dot(r2.xyzw, cb0.data[10].xyzw);
/*296*/	r0.w = dot(r2.xyzw, cb0.data[12].xyzw);
/*297*/	r1.xy = (r1.xyxx / r0.wwww).xy;
/*298*/	r2.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xyxx, cb0.data[34].xyxx)) * 0xffffffffu)).xy;
/*299*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*300*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r2.x));
/*301*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.y) & floatBitsToUint(r0.w));
/*302*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*303*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*304*/	if(r0.w != 0) discard;
/*305*/	r0.w = sqrt(r1.w);
/*306*/	r1.x = saturate(cb2.data[0].w)/**/;
/*307*/	r1.x = -r1.x + 1.000000;
/*308*/	r1.x = r1.x * 8.000000 + -4.000000;
/*309*/	r1.y = saturate(cb2.data[1].x)/**/;
/*310*/	r1.y = -r1.y + 1.000000;
/*311*/	r1.y = r1.y * 1000.000000;
/*312*/	r0.w = r0.w / r1.y;
/*313*/	r0.w = r0.w + r1.x;
/*314*/	r0.w = r0.w * 1.442695;
/*315*/	r0.w = exp2(r0.w);
/*316*/	r0.w = cb2.data[1].y / r0.w;
/*317*/	r0.w = saturate(-r0.w + cb2.data[1].y);
/*318*/	r1.x = -vsOut_T0.y + cb2.data[1].w;
/*319*/	r1.y = -cb2.data[1].z + cb2.data[1].w;
/*320*/	r1.x = r1.x + -cb2.data[1].z;
/*321*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*322*/	r1.x = saturate(r1.y * r1.x);
/*323*/	r1.y = r1.x * -2.000000 + 3.000000;
/*324*/	r1.x = r1.x * r1.x;
/*325*/	r1.x = r1.x * r1.y;
/*326*/	r1.y = dot(vec2(r4.xzxx), vec2(r4.xzxx));
/*327*/	r1.y = sqrt(r1.y);
/*328*/	r1.z = max(cb2.data[2].z, 0.001000);
/*329*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*330*/	r1.y = r1.z * r1.y;
/*331*/	r1.y = min(r1.y, 1.000000);
/*332*/	r1.z = r1.y * -2.000000 + 3.000000;
/*333*/	r1.y = r1.y * r1.y;
/*334*/	r1.y = r1.y * r1.z;
/*335*/	r0.w = cb2.data[2].x * r1.x + r0.w;
/*336*/	r1.xzw = (cb1.data[1].xxyz * cb2.data[0].xxyz).xzw;
/*337*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*338*/	r1.xzw = (r1.xxzw * abs(cb1.data[0].zzzz)).xzw;
/*339*/	r2.xyz = (r6.xxxx * r1.xzwx).xyz;
/*340*/	r4.w = max(r4.y, 0.000000);
/*341*/	r3.xyzw = (texture(s_sky, r4.xwzx.stp)).xyzw;
/*342*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb2.data[2].yyyy)));
/*343*/	r1.xzw = (-r1.xxzw * r6.xxxx + r3.xxyz).xzw;
/*344*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*345*/	r0.w = saturate(r0.w * r1.y);
/*346*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*347*/	color0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*348*/	return;
}
