//
//
// Shader Model 4
// Fragment Shader
//
// id: 511 - fxc/glsl_SM_4_0_rigidambientmapmesh.hlsl_PS_ps40_rigid_forward_lighting_no_clip_HDR.glsl
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
uniform sampler2D s_ambient_map;
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
/*37*/	r4.xyzw = (texture(s_ambient_map, vsOut_T1.zwzz.st)).xyzw;
/*38*/	r5.xyz = (r0.xywx * r4.xyzx).xyz;
/*39*/	r1.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r1.w = inversesqrt(r1.w);
/*41*/	r6.xyz = (r1.wwww * vsOut_T3.xyzx).xyz;
/*42*/	r1.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*43*/	r1.w = inversesqrt(r1.w);
/*44*/	r7.xyz = (r1.wwww * vsOut_T4.xyzx).xyz;
/*45*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r8.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*48*/	r9.xyz = (r1.yyyy * r7.xyzx).xyz;
/*49*/	r1.xyw = (r1.xxxx * r6.xyxz + r9.xyxz).xyw;
/*50*/	r1.xyz = (r1.zzzz * r8.xyzx + r1.xywx).xyz;
/*51*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r1.w = inversesqrt(r1.w);
/*53*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*54*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).xyz;
/*55*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*56*/	if(floatBitsToUint(r0.z) != 0u) {
/*57*/	  r0.z = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*58*/	  r3.zw = (mix(vec4(0, 0, 2.500000, -0.100000), vec4(0, 0, 50.000000, -0.700000), greaterThan(floatBitsToUint(r0.zzzz), uvec4(0)))).zw;
/*59*/	  r0.z = r3.w * cb0.data[26].x;
/*60*/	  r9.xy = (r0.zzzz * vec4(-0.700000, 0.660000, 0.000000, 0.000000)).xy;
/*61*/	  r3.zw = (vsOut_T1.xxxy * r3.zzzz + r9.xxxy).zw;
/*62*/	  r9.xyzw = (texture(s_fire_map, r3.zwzz.st)).xyzw;
/*63*/	  r2.xyz = (r9.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*64*/	  r3.xy = (r3.xyxx + vec4(0.300000, 0.200000, 0.000000, 0.000000)).xy;
/*65*/	}
/*66*/	r0.z = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*67*/	if(floatBitsToUint(r0.z) != 0u) {
/*68*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
/*69*/	  if(floatBitsToUint(r0.z) != 0u) {
/*70*/	    r9.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*71*/	    r10.xyzw = (texture(s_snow_normals, r9.xyxx.st)).xyzw;
/*72*/	    r3.zw = (r10.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*73*/	    r10.xy = (r3.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*74*/	    r0.z = dot(vec2(r10.xyxx), vec2(r10.xyxx));
/*75*/	    r0.z = -r0.z + 1.000000;
/*76*/	    r0.z = max(r0.z, 0.000000);
/*77*/	    r10.z = sqrt(r0.z);
/*78*/	    r11.xyz = (r10.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*79*/	    r0.z = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*80*/	    r0.z = inversesqrt(r0.z);
/*81*/	    r11.xyz = (r0.zzzz * r11.xyzx).xyz;
/*82*/	    r12.xz = (cb2.data[0].xxyx).xz/**/;
/*83*/	    r12.y = -1.000000;
/*84*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*85*/	    r0.z = inversesqrt(r0.z);
/*86*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*87*/	    r0.z = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*88*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*89*/	    r1.w = r1.w * 1.250000;
/*90*/	    r1.w = min(r1.w, 1.000000);
/*91*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
/*92*/	    r2.w = r2.w * 4.000000;
/*93*/	    r1.w = r1.w * 0.200000 + r2.w;
/*94*/	    r1.w = r1.w * -0.700000 + 1.000000;
/*95*/	    r0.z = r0.z + -r1.w;
/*96*/	    r0.z = saturate(r0.z * 200.000000);
/*97*/	    r1.w = r0.z * -2.000000 + 3.000000;
/*98*/	    r0.z = r0.z * r0.z;
/*99*/	    r0.z = r0.z * r1.w;
/*100*/	    r3.x = r0.z * -r3.x + r3.x;
/*101*/	    r1.w = -r3.y + 0.200000;
/*102*/	    r3.y = r0.z * r1.w + r3.y;
/*103*/	    r0.xyw = (-r0.xyxw * r4.xyxz + vec4(0.400000, 0.400000, 0.000000, 0.400000)).xyw;
/*104*/	    r5.xyz = (r0.zzzz * r0.xywx + r5.xyzx).xyz;
/*105*/	    r0.xyw = (-r2.xyxz + vec4(1.000000, 1.000000, 0.000000, 1.000000)).xyw;
/*106*/	    r2.xyz = (r0.zzzz * r0.xywx + r2.xyzx).xyz;
/*107*/	    r4.xyzw = (texture(s_snow_normals, r9.zwzz.st)).xyzw;
/*108*/	    r0.xy = (r4.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*109*/	    r4.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*110*/	    r0.x = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*111*/	    r0.x = -r0.x + 1.000000;
/*112*/	    r0.x = max(r0.x, 0.000000);
/*113*/	    r4.z = sqrt(r0.x);
/*114*/	    r0.xyw = (r10.xyxz + r10.xyxz).xyw;
/*115*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
/*116*/	    r1.w = sqrt(r1.w);
/*117*/	    r0.xyw = (r0.xyxw * r1.wwww + r4.xyxz).xyw;
/*118*/	    r1.w = dot(vec3(r0.xywx), vec3(r0.xywx));
/*119*/	    r1.w = inversesqrt(r1.w);
/*120*/	    r0.xyw = (r0.xyxw * r1.wwww).xyw;
/*121*/	    r4.xyz = (r7.xyzx * r0.yyyy).xyz;
/*122*/	    r4.xyz = (r0.xxxx * r6.xyzx + r4.xyzx).xyz;
/*123*/	    r0.xyw = (r0.wwww * r8.xyxz + r4.xyxz).xyw;
/*124*/	    r1.w = -r1.y + 1.000000;
/*125*/	    r0.z = min(r0.z, r1.w);
/*126*/	    r0.xyw = (-r1.xyxz + r0.xyxw).xyw;
/*127*/	    r0.xyz = (r0.zzzz * r0.xywx + r1.xyzx).xyz;
/*128*/	    r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*129*/	    r0.w = inversesqrt(r0.w);
/*130*/	    r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*131*/	  }
/*132*/	}
/*133*/	r0.x = vsOut_T7.y * -r3.y + r3.y;
/*134*/	r0.yzw = (r5.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*135*/	r0.yzw = (-r5.xxyz + r0.yyzw).yzw;
/*136*/	r0.yzw = saturate(vsOut_T7.yyyy * r0.yyzw + r5.xxyz).yzw;
/*137*/	r1.w = dot(vec3(r0.yzwy), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*138*/	r3.yzw = (-r0.yyzw + r1.wwww).yzw;
/*139*/	r0.yzw = (vsOut_T7.zzzz * r3.yyzw + r0.yyzw).yzw;
/*140*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*141*/	r3.yzw = (-r2.xxyz + r1.wwww).yzw;
/*142*/	r2.xyz = (vsOut_T7.zzzz * r3.yzwy + r2.xyzx).xyz;
/*143*/	r0.x = vsOut_T7.z * -r0.x + r0.x;
/*144*/	r1.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*145*/	r1.w = inversesqrt(r1.w);
/*146*/	r1.xyz = (r1.wwww * r1.xyzx).xyz;
/*147*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*148*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*149*/	r1.w = inversesqrt(r1.w);
/*150*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*151*/	r1.w = -r3.x + 1.000000;
/*152*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*153*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*154*/	r4.x = r4.x + r4.x;
/*155*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*156*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*157*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*158*/	r4.w = cos((r6.x));
/*159*/	r4.w = inversesqrt(r4.w);
/*160*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*161*/	r5.w = saturate(r0.x * 60.000000);
/*162*/	r5.w = -r0.x + r5.w;
/*163*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*164*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*165*/	r7.x = inversesqrt(r7.x);
/*166*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*167*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*168*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*169*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*170*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*171*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*172*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*173*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*174*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*175*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*176*/	r6.xzw = (r0.yyzw * r6.xxzw).xzw;
/*177*/	r5.y = -r0.x + 1.000000;
/*178*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*179*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*180*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*181*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*182*/	  r5.y = max(r5.y, 0.000000);
/*183*/	  r5.y = log2(r5.y);
/*184*/	  r5.y = r5.y * 10.000000;
/*185*/	  r5.y = exp2(r5.y);
/*186*/	  r5.y = r4.w * r5.y;
/*187*/	  r5.y = r5.y * r5.w + r0.x;
/*188*/	  r7.x = r1.w * 8.000000;
/*189*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*190*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*191*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*192*/	}
/*193*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*194*/	r7.x = max(r5.y, 0.000000);
/*195*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*196*/	if(floatBitsToUint(r5.y) != 0u) {
/*197*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*198*/	  r4.x = max(r4.x, -1.000000);
/*199*/	  r4.x = min(r4.x, 1.000000);
/*200*/	  r4.y = -abs(r4.x) + 1.000000;
/*201*/	  r4.y = sqrt(r4.y);
/*202*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*203*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*204*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*205*/	  r5.y = r4.y * r4.z;
/*206*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*207*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*208*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*209*/	  r4.x = r4.z * r4.y + r4.x;
/*210*/	  r3.x = r3.x * r3.x;
/*211*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*212*/	  r2.w = r3.x * r2.w + r5.x;
/*213*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*214*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*215*/	  r3.x = -r2.w * r2.w + 1.000000;
/*216*/	  r3.x = max(r3.x, 0.001000);
/*217*/	  r3.x = log2(r3.x);
/*218*/	  r4.y = r3.x * 4.950617;
/*219*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*220*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*221*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*222*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*223*/	  r2.w = floatBitsToInt(r2.w);
/*224*/	  r4.y = r3.x * r3.x + -r4.y;
/*225*/	  r4.y = sqrt(r4.y);
/*226*/	  r3.x = -r3.x + r4.y;
/*227*/	  r3.x = max(r3.x, 0.000000);
/*228*/	  r3.x = sqrt(r3.x);
/*229*/	  r2.w = r2.w * r3.x;
/*230*/	  r2.w = r2.w * 1.414214;
/*231*/	  r2.w = 0.008727 / r2.w;
/*232*/	  r2.w = max(r2.w, 0.000100);
/*233*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*234*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*235*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*236*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*237*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*238*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*239*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*240*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*241*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*242*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*243*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*244*/	  r2.w = floatBitsToInt(r2.w);
/*245*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*246*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*247*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*248*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*249*/	  r2.w = r2.w * r4.x + 1.000000;
/*250*/	  r2.w = r2.w * 0.500000;
/*251*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*252*/	  r3.x = r3.x * r4.y + 1.000000;
/*253*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*254*/	  r3.x = min(r7.x, 1.000000);
/*255*/	  r1.w = r1.w * 1.570796;
/*256*/	  r1.w = sin(r1.w);
/*257*/	  r3.x = r3.x + -1.000000;
/*258*/	  r1.w = r1.w * r3.x + 1.000000;
/*259*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*260*/	  r3.x = max(r3.x, 0.000000);
/*261*/	  r3.x = log2(r3.x);
/*262*/	  r3.x = r3.x * 10.000000;
/*263*/	  r3.x = exp2(r3.x);
/*264*/	  r3.x = r4.w * r3.x;
/*265*/	  r3.x = r3.x * r5.w + r0.x;
/*266*/	  r1.w = r1.w * abs(r2.w);
/*267*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*268*/	} else {
/*269*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*270*/	}
/*271*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*272*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*273*/	r3.xyz = (max(r0.xxxx, r3.xyzx)).xyz;
/*274*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*275*/	r0.yzw = (r0.yyzw * r7.xxxx).yzw;
/*276*/	r0.yzw = (r0.yyzw * cb1.data[1].xxyz).yzw;
/*277*/	r0.yzw = (r3.xxyz * r0.yyzw).yzw;
/*278*/	r0.yzw = (r5.xxxx * r0.yyzw).yzw;
/*279*/	r0.yzw = (r4.xxyz * cb1.data[1].xxyz + r0.yyzw).yzw;
/*280*/	r0.yzw = (r0.yyzw + r6.xxzw).yzw;
/*281*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*282*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*283*/	r1.w = inversesqrt(r1.w);
/*284*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*285*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*286*/	r1.w = r1.w + r1.w;
/*287*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*288*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*289*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*290*/	r1.x = max(r1.x, 0.000000);
/*291*/	r1.x = log2(r1.x);
/*292*/	r1.x = r1.x * 10.000000;
/*293*/	r1.x = exp2(r1.x);
/*294*/	r1.x = r4.w * r1.x;
/*295*/	r0.x = r1.x * r5.w + r0.x;
/*296*/	r1.xyz = (r6.xyzx * r0.xxxx).xyz;
/*297*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.yzwy).xyz;
/*298*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*299*/	r0.w = 1.000000;
/*300*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*301*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*302*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*303*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*304*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*305*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*306*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*307*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*308*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*309*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*310*/	if(r0.x != 0) discard;
/*311*/	color1.x = 1.000000;
/*312*/	return;
}
