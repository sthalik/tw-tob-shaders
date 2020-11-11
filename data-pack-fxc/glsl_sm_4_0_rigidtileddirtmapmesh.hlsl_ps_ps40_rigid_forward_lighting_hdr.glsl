//
//
// Shader Model 4
// Fragment Shader
//
// id: 829 - fxc/glsl_SM_4_0_rigidtileddirtmapmesh.hlsl_PS_ps40_rigid_forward_lighting_HDR.glsl
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
/*19*/	r5.xyz = (r5.xyzx + -cb4.data[0].xyzx).xyz;
/*20*/	r5.xyz = (r0.xxxx * r5.xyzx + cb4.data[0].xyzx).xyz;
/*21*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.yyyy), uvec4(0)))).xyz;
/*22*/	r6.xyz = (r6.xyzx + -cb4.data[1].xyzx).xyz;
/*23*/	r6.xyz = (r0.xxxx * r6.xyzx + cb4.data[1].xyzx).xyz;
/*24*/	r7.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*25*/	r7.xyz = (r7.xyzx + -cb4.data[2].xyzx).xyz;
/*26*/	r0.xyw = (r0.xxxx * r7.xyxz + cb4.data[2].xyxz).xyw;
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
/*41*/	r3.zw = (vsOut_T1.xxxy * cb3.data[2].xxxy).zw;
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
/*66*/	r0.z = uintBitsToFloat((floatBitsToInt(cb2.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
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
/*79*/	  r0.z = uintBitsToFloat((0.000000 < cb2.data[1].x) ? 0xffffffffu : 0x00000000u);
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
/*93*/	    r12.xz = (cb2.data[0].xxyx).xz/**/;
/*94*/	    r12.y = -1.000000;
/*95*/	    r0.z = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*96*/	    r0.z = inversesqrt(r0.z);
/*97*/	    r12.xyz = (r0.zzzz * r12.xyzx).xyz;
/*98*/	    r0.z = saturate(dot(vec3(-r12.xyzx), vec3(r11.xyzx)));
/*99*/	    r1.w = cb2.data[1].x * cb2.data[1].x;
/*100*/	    r1.w = r1.w * 1.250000;
/*101*/	    r1.w = min(r1.w, 1.000000);
/*102*/	    r2.w = saturate(cb2.data[1].x * cb2.data[1].x + -0.800000);
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
/*126*/	    r1.w = dot(vec2(cb2.data[0].xyxx), vec2(cb2.data[0].xyxx));
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
/*158*/	r3.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*159*/	r1.w = dot(vec3(r3.yzwy), vec3(r3.yzwy));
/*160*/	r1.w = inversesqrt(r1.w);
/*161*/	r3.yzw = (r1.wwww * r3.yyzw).yzw;
/*162*/	r1.w = -r3.x + 1.000000;
/*163*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*164*/	r4.x = dot(vec3(r3.yzwy), vec3(r1.xyzx));
/*165*/	r4.x = r4.x + r4.x;
/*166*/	r4.xyz = (r1.xyzx * -r4.xxxx + r3.yzwy).xyz;
/*167*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 273.000000, 0), vec4(0.004000, 360.000000, 1.000000, 0), greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*168*/	r6.xy = (r1.wwww * vec4(1.539380, 8.000000, 0.000000, 0.000000)).xy;
/*169*/	r4.w = cos((r6.x));
/*170*/	r4.w = inversesqrt(r4.w);
/*171*/	r4.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r4.w)).w;
/*172*/	r5.w = saturate(r0.x * 60.000000);
/*173*/	r5.w = -r0.x + r5.w;
/*174*/	r6.xzw = (r1.xxyz * vec4(1.000000, 0.000000, 4.000000, 1.000000)).xzw;
/*175*/	r7.x = dot(vec3(r6.xzwx), vec3(r6.xzwx));
/*176*/	r7.x = inversesqrt(r7.x);
/*177*/	r6.xzw = (r6.xxzw * r7.xxxx).xzw;
/*178*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xzwx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*179*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*180*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*181*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*182*/	r6.xzw = (r6.xxzw * r6.xxzw).xzw;
/*183*/	r7.xyz = (r7.xywx * r6.zzzz).xyz;
/*184*/	r7.xyz = (r6.xxxx * r8.xyzx + r7.xyzx).xyz;
/*185*/	r6.xzw = (r6.wwww * r9.xxyz + r7.xxyz).xzw;
/*186*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*187*/	r6.xzw = (r0.yyzw * r6.xxzw).xzw;
/*188*/	r5.y = -r0.x + 1.000000;
/*189*/	r6.xzw = (r5.yyyy * r6.xxzw).xzw;
/*190*/	r6.xzw = (r5.xxxx * r6.xxzw).xzw;
/*191*/	if(floatBitsToUint(cb1.data[0].x) != 0u) {
/*192*/	  r5.y = dot(vec3(r4.xyzx), vec3(r3.yzwy));
/*193*/	  r5.y = max(r5.y, 0.000000);
/*194*/	  r5.y = log2(r5.y);
/*195*/	  r5.y = r5.y * 10.000000;
/*196*/	  r5.y = exp2(r5.y);
/*197*/	  r5.y = r4.w * r5.y;
/*198*/	  r5.y = r5.y * r5.w + r0.x;
/*199*/	  r7.x = r1.w * 8.000000;
/*200*/	  r7.xyzw = (textureLod(s_environment, r4.xyzx.stp, r7.x)).xyzw;
/*201*/	  r7.xyz = (r5.yyyy * r7.xyzx).xyz;
/*202*/	  r6.xzw = (r7.xxyz * r2.xxyz + r6.xxzw).xzw;
/*203*/	}
/*204*/	r5.y = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*205*/	r7.x = max(r5.y, 0.000000);
/*206*/	r5.y = uintBitsToFloat((0.000000 < r5.y) ? 0xffffffffu : 0x00000000u);
/*207*/	if(floatBitsToUint(r5.y) != 0u) {
/*208*/	  r4.x = dot(vec3(-cb1.data[0].yzwy), vec3(r4.xyzx));
/*209*/	  r4.x = max(r4.x, -1.000000);
/*210*/	  r4.x = min(r4.x, 1.000000);
/*211*/	  r4.y = -abs(r4.x) + 1.000000;
/*212*/	  r4.y = sqrt(r4.y);
/*213*/	  r4.z = abs(r4.x) * -0.018729 + 0.074261;
/*214*/	  r4.z = r4.z * abs(r4.x) + -0.212114;
/*215*/	  r4.z = r4.z * abs(r4.x) + 1.570729;
/*216*/	  r5.y = r4.y * r4.z;
/*217*/	  r5.y = r5.y * -2.000000 + 3.141593;
/*218*/	  r4.x = uintBitsToFloat((r4.x < -r4.x) ? 0xffffffffu : 0x00000000u);
/*219*/	  r4.x = uintBitsToFloat(floatBitsToUint(r4.x) & floatBitsToUint(r5.y));
/*220*/	  r4.x = r4.z * r4.y + r4.x;
/*221*/	  r3.x = r3.x * r3.x;
/*222*/	    r2.w = (floatBitsToUint(r2.w) > 0x00000000u) ? 0.995900 : -0.000100;
/*223*/	  r2.w = r3.x * r2.w + r5.x;
/*224*/	  r2.w = r2.w * 0.500000 + 0.500000;
/*225*/	  r2.w = r2.w * 2.000000 + -1.000000;
/*226*/	  r3.x = -r2.w * r2.w + 1.000000;
/*227*/	  r3.x = max(r3.x, 0.001000);
/*228*/	  r3.x = log2(r3.x);
/*229*/	  r4.y = r3.x * 4.950617;
/*230*/	  r3.x = r3.x * 0.346574 + 4.546885;
/*231*/	  r4.z = uintBitsToFloat((0.000000 < r2.w) ? 0xffffffffu : 0x00000000u);
/*232*/	  r2.w = uintBitsToFloat((r2.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*233*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.z) + floatBitsToInt(r2.w));
/*234*/	  r2.w = floatBitsToInt(r2.w);
/*235*/	  r4.y = r3.x * r3.x + -r4.y;
/*236*/	  r4.y = sqrt(r4.y);
/*237*/	  r3.x = -r3.x + r4.y;
/*238*/	  r3.x = max(r3.x, 0.000000);
/*239*/	  r3.x = sqrt(r3.x);
/*240*/	  r2.w = r2.w * r3.x;
/*241*/	  r2.w = r2.w * 1.414214;
/*242*/	  r2.w = 0.008727 / r2.w;
/*243*/	  r2.w = max(r2.w, 0.000100);
/*244*/	  r4.xy = (r4.xxxx + vec4(-0.008727, 0.008727, 0.000000, 0.000000)).xy;
/*245*/	  r2.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.w)).w;
/*246*/	  r4.xy = (r2.wwww * r4.xyxx).xy;
/*247*/	  r7.yz = (r4.xxyx * vec4(0.000000, 0.707107, 0.707107, 0.000000)).yz;
/*248*/	  r7.yz = (r7.yyzy * r7.yyzy).yz;
/*249*/	  r8.xyzw = r7.yyzz * vec4(0.140012, 0.140012, 0.140012, 0.140012) + vec4(1.273239, 1.000000, 1.273239, 1.000000);
/*250*/	  r8.xy = (r8.xzxx / r8.ywyy).xy;
/*251*/	  r7.yz = (-r7.yyzy * r8.xxyx).yz;
/*252*/	  r4.yz = (uintBitsToFloat(uvec4(lessThan(vec4(0.000000, 0.000000, 0.000000, 0.000000), r4.xxyx)) * 0xffffffffu)).yz;
/*253*/	  r2.w = uintBitsToFloat((r4.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*254*/	  r2.w = intBitsToFloat(1 + ~floatBitsToInt(r4.y) + floatBitsToInt(r2.w));
/*255*/	  r2.w = floatBitsToInt(r2.w);
/*256*/	  r4.xy = (r7.yzyy * vec4(1.442695, 1.442695, 0.000000, 0.000000)).xy;
/*257*/	  r4.xy = (exp2(r4.xyxx)).xy;
/*258*/	  r4.xy = (-r4.xyxx + vec4(1.000000, 1.000000, 0.000000, 0.000000)).xy;
/*259*/	  r4.xy = (sqrt(r4.xyxx)).xy;
/*260*/	  r2.w = r2.w * r4.x + 1.000000;
/*261*/	  r2.w = r2.w * 0.500000;
/*262*/	  r3.x = 1 + ~floatBitsToInt(r4.z);
/*263*/	  r3.x = r3.x * r4.y + 1.000000;
/*264*/	  r2.w = r3.x * 0.500000 + -r2.w;
/*265*/	  r3.x = min(r7.x, 1.000000);
/*266*/	  r1.w = r1.w * 1.570796;
/*267*/	  r1.w = sin(r1.w);
/*268*/	  r3.x = r3.x + -1.000000;
/*269*/	  r1.w = r1.w * r3.x + 1.000000;
/*270*/	  r3.x = dot(vec3(-cb1.data[0].yzwy), vec3(r3.yzwy));
/*271*/	  r3.x = max(r3.x, 0.000000);
/*272*/	  r3.x = log2(r3.x);
/*273*/	  r3.x = r3.x * 10.000000;
/*274*/	  r3.x = exp2(r3.x);
/*275*/	  r3.x = r4.w * r3.x;
/*276*/	  r3.x = r3.x * r5.w + r0.x;
/*277*/	  r1.w = r1.w * abs(r2.w);
/*278*/	  r3.xyz = (r3.xxxx * r1.wwww).xyz;
/*279*/	} else {
/*280*/	  r3.xyz = (vec4(0, 0, 0, 0)).xyz;
/*281*/	}
/*282*/	r4.xyz = saturate(r5.zzzz * r3.xyzx).xyz;
/*283*/	r4.xyz = (r2.xyzx * r4.xyzx).xyz;
/*284*/	r3.xyz = (max(r0.xxxx, r3.xyzx)).xyz;
/*285*/	r3.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*286*/	r0.yzw = (r0.yyzw * r7.xxxx).yzw;
/*287*/	r0.yzw = (r0.yyzw * cb1.data[1].xxyz).yzw;
/*288*/	r0.yzw = (r3.xxyz * r0.yyzw).yzw;
/*289*/	r0.yzw = (r5.xxxx * r0.yyzw).yzw;
/*290*/	r0.yzw = (r4.xxyz * cb1.data[1].xxyz + r0.yyzw).yzw;
/*291*/	r0.yzw = (r0.yyzw + r6.xxzw).yzw;
/*292*/	r3.xyz = (-vsOut_T0.xyzx + cb0.data[0].xyzx).xyz;
/*293*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*294*/	r1.w = inversesqrt(r1.w);
/*295*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*296*/	r1.w = dot(vec3(-r3.xyzx), vec3(r1.xyzx));
/*297*/	r1.w = r1.w + r1.w;
/*298*/	r1.xyz = (r1.xyzx * -r1.wwww + -r3.xyzx).xyz;
/*299*/	r6.xyzw = (textureLod(s_environment, r1.xyzx.stp, r6.y)).xyzw;
/*300*/	r1.x = dot(vec3(r1.xyzx), vec3(-r3.xyzx));
/*301*/	r1.x = max(r1.x, 0.000000);
/*302*/	r1.x = log2(r1.x);
/*303*/	r1.x = r1.x * 10.000000;
/*304*/	r1.x = exp2(r1.x);
/*305*/	r1.x = r4.w * r1.x;
/*306*/	r0.x = r1.x * r5.w + r0.x;
/*307*/	r1.xyz = (r6.xyzx * r0.xxxx).xyz;
/*308*/	color0.xyz = (r1.xyzx * r2.xyzx + r0.yzwy).xyz;
/*309*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*310*/	r0.w = 1.000000;
/*311*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*312*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*313*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*314*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*315*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*316*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*317*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*318*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*319*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*320*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*321*/	if(r0.x != 0) discard;
/*322*/	color1.x = 1.000000;
/*323*/	return;
}
