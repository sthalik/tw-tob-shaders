//
//
// Shader Model 4
// Fragment Shader
//
// id: 831 - fxc/glsl_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
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
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb2;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb3;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb4;

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
/*3*/	r0.yz = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb3.data[0].yyzy)) * 0xffffffffu)).yz;
/*4*/	if(floatBitsToUint(r0.y) != 0u) {
/*5*/	  r1.x = 1.000000;
/*6*/	}
/*7*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)));
/*9*/	color0.w = r0.x * r1.w;
/*10*/	r3.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*12*/	r0.xyw = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 0.000000, 3.000000))) * 0xffffffffu)).xyw;
/*13*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.xxxx), uvec4(0)))).xyz;
/*14*/	r0.x = saturate(vsOut_N0.w);
/*15*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*16*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*17*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*18*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*19*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*20*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*21*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*22*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
/*23*/	r5.xyz = (r5.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*24*/	r1.xyz = (r4.xxxx * r5.xyzx + r1.xyzx).xyz;
/*25*/	r5.xyz = (r6.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*26*/	r1.xyz = (r4.yyyy * r5.xyzx + r1.xyzx).xyz;
/*27*/	r0.xyw = (r0.xyxw * r1.xyxz + -r1.xyxz).xyw;
/*28*/	r0.xyw = (r4.zzzz * r0.xyxw + r1.xyxz).xyw;
/*29*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*31*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*33*/	r1.w = -r1.w + 1.000000;
/*34*/	r1.w = max(r1.w, 0.000000);
/*35*/	r1.z = sqrt(r1.w);
/*36*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*37*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
/*38*/	r4.xyzw = (texture(s_detail_map, r3.zwzz.st)).xyzw;
/*39*/	r5.xyzw = (texture(s_alpha_mask, vsOut_T1.zwzz.st)).xyzw;
/*40*/	r1.w = r4.w + -1.000000;
/*41*/	r1.w = r5.x * r1.w + 1.000000;
/*42*/	r1.w = saturate(r1.w * r5.x);
/*43*/	r5.xyz = (-r4.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*44*/	r4.xyz = (r1.wwww * r5.xyzx + r4.xyzx).xyz;
/*45*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*46*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*47*/	r1.w = inversesqrt(r1.w);
/*48*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*49*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*50*/	r1.w = inversesqrt(r1.w);
/*51*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*52*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*53*/	r1.w = inversesqrt(r1.w);
/*54*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*55*/	r9.xyz = (r1.yyyy * r7.xyzx).xyz;
/*56*/	r1.xyw = (r1.xxxx * r6.xyxz + r9.xyxz).xyw;
/*57*/	r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*58*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*59*/	r1.w = inversesqrt(r1.w);
/*60*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*61*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*62*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*63*/	if(floatBitsToUint(r0.z) != 0u) {
/*64*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*65*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*66*/	  r0.z = r3.w * cb0.data[26].x;
/*67*/	  r9.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*68*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*69*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*70*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*71*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*72*/	}
/*73*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*74*/	if(floatBitsToUint(r0.z) != 0u) {
/*75*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*76*/	  if(floatBitsToUint(r0.z) != 0u) {
/*77*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*78*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*79*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*80*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*81*/	    r0.z = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*82*/	    r0.z = -r0.z + 1.000000;
/*83*/	    r0.z = max(r0.z, 0.000000);
/*84*/	    r10.z = sqrt(r0.z);
/*85*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*86*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*87*/	    r0.z = inversesqrt(r0.z);
/*88*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*89*/	    r12.xz = (cb2.data[0].xxyx).xz/**/;
/*90*/	    r12.y = -1.000000;
/*91*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*92*/	    r0.z = inversesqrt(r0.z);
/*93*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*94*/	    r0.z = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*95*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*96*/	    r1.w = r1.w * 1.250000;
/*97*/	    r1.w = min(r1.w, 1.000000);
/*98*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*99*/	    r2.w = r2.w * 4.000000;
/*100*/	    r1.w = r1.w * 0.200000 + r2.w;
/*101*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*102*/	    r0.z = r0.z + -r1.w;
/*103*/	    r0.z = saturate(r0.z * 200.000000);
/*104*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*105*/	    r0.z = r0.z * r0.z;
/*106*/	    r0.z = r0.z * r1.w;
/*107*/	    r3.x = r0.z * -r3.x + r3.x;
/*108*/	    r1.w = -r3.y + 0.200000;
/*109*/	    r3.y = r0.z * r1.w + r3.y;
/*110*/	    r0.xyw = (-r0.xyxw * r4.xyxz + vec4(0.400000, 0.400000, 0.000000, 0.400000)).xyw;
/*111*/	    r5.xyz = (r0.zzzz * r0.xywx + r5.xyzx).xyz;
/*112*/	    r0.xyw = (-r2.xyxz + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*113*/	    r2.xyz = (r0.zzzz * r0.xywx + r2.xyzx).xyz;
/*114*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*115*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*116*/	    r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*117*/	    r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*118*/	    r0.x = -r0.x + 1.000000;
/*119*/	    r0.x = max(r0.x, 0.000000);
/*120*/	    r4.z = sqrt(r0.x);
/*121*/	    r0.xyw = (r10.xyxz + r10.xyxz).xyw;
/*122*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*123*/	    r1.w = sqrt(r1.w);
/*124*/	    r0.xyw = (r0.xyxw * r1.wwww + r4.xyxz).xyw;
/*125*/	    r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*126*/	    r1.w = inversesqrt(r1.w);
/*127*/	    r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*128*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*129*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*130*/	    r0.xyw = (r0.wwww * r8.xyxz + r4.xyxz).xyw;
/*131*/	    r1.w = -r1.y + 1.000000;
/*132*/	    r0.z = min(r0.z, r1.w);
/*133*/	    r0.xyw = (-r1.xyxz + r0.xyxw).xyw;
/*134*/	    r0.xyz = (r0.zzzz * r0.xywx + r1.xyzx).xyz;
/*135*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*136*/	    r0.w = inversesqrt(r0.w);
/*137*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*138*/	  }
/*139*/	}
/*140*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*141*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*142*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*143*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*144*/	r1.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*145*/	r3.yzw = (-r0.yyzw + r1.wwww).yzw;
/*146*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*147*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*148*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*149*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*150*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*151*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*152*/	r1.w = inversesqrt(r1.w);
/*153*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*154*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*155*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*156*/	r1.w = inversesqrt(r1.w);
/*157*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*158*/	r1.w = -r3.x + 1.000000;
/*159*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*160*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*161*/	r4.x = r4.x + r4.x;
/*162*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*163*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*164*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*165*/	r4.w = cos((r6.x));
/*166*/	r4.w = inversesqrt(r4.w);
/*167*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*168*/	r5.w = saturate(r0.x * 60.000000);
/*169*/	r5.w = -r0.x + r5.w;
/*170*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*171*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*172*/	r7.x = inversesqrt(r7.x);
/*173*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*174*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*175*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*176*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*177*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*178*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*179*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*180*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*181*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*182*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*183*/	r6.xzw = (r0.yyzw * r6.xxzw).xzw;
/*184*/	r5.y = -r0.x + 1.000000;
/*185*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*186*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*187*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*188*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*189*/	  r5.y = max(r5.y, 0.000000);
/*190*/	  r5.y = log2(r5.y);
/*191*/	  r5.y = r5.y * 10.000000;
/*192*/	  r5.y = exp2(r5.y);
/*193*/	  r5.y = r4.w * r5.y;
/*194*/	  r5.y = r5.y * r5.w + r0.x;
/*195*/	  r7.x = r1.w * 8.000000;
/*196*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*197*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*198*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*199*/	}
/*200*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*201*/	r7.x = max(r5.y, 0.000000);
/*202*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*203*/	if(floatBitsToUint(r5.y) != 0u) {
/*204*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*205*/	  r4.x = max(r4.x, -1.000000);
/*206*/	  r4.x = min(r4.x, 1.000000);
/*207*/	  r4.y = -abs(r4.x) + 1.000000;
/*208*/	  r4.y = sqrt(r4.y);
/*209*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*210*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*211*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*212*/	  r5.y = r4.y * r4.z;
/*213*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*214*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*215*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*216*/	  r4.x = r4.z * r4.y + r4.x;
/*217*/	  r3.x = r3.x * r3.x;
/*218*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*219*/	  r2.w = r3.x * r2.w + r5.x;
/*220*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*221*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*222*/	  r3.x = -r2.w * r2.w + 1.000000;
/*223*/	  r3.x = max(r3.x, 0.001000);
/*224*/	  r3.x = log2(r3.x);
/*225*/	  r4.y = r3.x * 4.950617;
/*226*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*227*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*228*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*229*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*230*/	  r2.w = floatBitsToInt(r2.w);
/*231*/	  r4.y = r3.x * r3.x + -r4.y;
/*232*/	  r4.y = sqrt(r4.y);
/*233*/	  r3.x = -r3.x + r4.y;
/*234*/	  r3.x = max(r3.x, 0.000000);
/*235*/	  r3.x = sqrt(r3.x);
/*236*/	  r2.w = r2.w * r3.x;
/*237*/	  r2.w = r2.w * 1.414214;
/*238*/	  r2.w = 0.008727 / r2.w;
/*239*/	  r2.w = max(r2.w, 0.000100);
/*240*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*241*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*242*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*243*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*244*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*245*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*246*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*247*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*248*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*249*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*250*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*251*/	  r2.w = floatBitsToInt(r2.w);
/*252*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*253*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*254*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*255*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*256*/	  r2.w = r2.w * r4.x + 1.000000;
/*257*/	  r2.w = r2.w * 0.500000;
/*258*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*259*/	  r3.x = r3.x * r4.y + 1.000000;
/*260*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*261*/	  r3.x = min(r7.x, 1.000000);
/*262*/	  r1.w = r1.w * 1.570796;
/*263*/	  r1.w = sin(r1.w);
/*264*/	  r3.x = r3.x + -1.000000;
/*265*/	  r1.w = r1.w * r3.x + 1.000000;
/*266*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*267*/	  r3.x = max(r3.x, 0.000000);
/*268*/	  r3.x = log2(r3.x);
/*269*/	  r3.x = r3.x * 10.000000;
/*270*/	  r3.x = exp2(r3.x);
/*271*/	  r3.x = r4.w * r3.x;
/*272*/	  r3.x = r3.x * r5.w + r0.x;
/*273*/	  r1.w = r1.w * abs(r2.w);
/*274*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*275*/	} else {
/*276*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*277*/	}
/*278*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*279*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*280*/	r3.xyz = (max(r0.xxxx, r3.xyzx)).xyz;
/*281*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*282*/	r0.yzw = (r0.yyzw * r7.xxxx).yzw;
/*283*/	r0.yzw = (r0.yyzw * cb1.data[1].xxyz).yzw;
/*284*/	r0.yzw = (r3.xxyz * r0.yyzw).yzw;
/*285*/	r0.yzw = (r5.xxxx * r0.yyzw).yzw;
/*286*/	r0.yzw = (r4.xxyz * cb1.data[1].xxyz + r0.yyzw).yzw;
/*287*/	r0.yzw = (r0.yyzw + r6.xxzw).yzw;
/*288*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*289*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*290*/	r1.w = inversesqrt(r1.w);
/*291*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*292*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*293*/	r1.w = r1.w + r1.w;
/*294*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*295*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*296*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*297*/	r1.x = max(r1.x, 0.000000);
/*298*/	r1.x = log2(r1.x);
/*299*/	r1.x = r1.x * 10.000000;
/*300*/	r1.x = exp2(r1.x);
/*301*/	r1.x = r4.w * r1.x;
/*302*/	r0.x = r1.x * r5.w + r0.x;
/*303*/	r1.xyz = (r6.xyzx * r0.xxxx).xyz;
/*304*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.yzwy).xyz;
/*305*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*306*/	r0.w = 1.000000;
/*307*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*308*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*309*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*310*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*311*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*312*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*313*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*314*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*315*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*316*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*317*/	if(r0.x != 0) discard;
/*318*/	color1.x = 1.000000;
/*319*/	return;
}
