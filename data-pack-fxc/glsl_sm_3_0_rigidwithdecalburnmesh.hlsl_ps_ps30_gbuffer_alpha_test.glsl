//
//
// Shader Model 4
// Fragment Shader
//
// id: 1129 - fxc/glsl_SM_3_0_rigidwithdecalburnmesh.hlsl_PS_ps30_gbuffer_alpha_test.glsl
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
flat in uint vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;
in vec4 vsOut_C1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_snow_normals;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_fire_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

void main()
{
  color0 = vec4(0);
  color1 = vec4(0);
  color2 = vec4(0);
  color3 = vec4(0);
  color4 = uint(0);
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
/*1*/	r0.y = r0.x * 0.001000;
/*2*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).wxyz;
/*3*/	r0.zw = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), cb2.data[0].yyyz)) * 0xffffffffu)).zw;
/*4*/	if(floatBitsToUint(r0.z) != 0u) {
/*5*/	  r2.xy = (vsOut_C1.xyxx / vsOut_C1.zzzz).xy;
/*6*/	  r2.xy = (r2.xyxx * vec4(0.500000, -0.500000, 0.000000, 0.000000) + vec4(0.500000, 0.500000, 0.000000, 0.000000)).xy;
/*7*/	  r2.xy = (r2.xyxx * cb0.data[27].xyxx).xy;
/*8*/	  r2.xy = (r2.xyxx * vec4(0.015625, 0.015625, 0.000000, 0.000000)).xy;
/*9*/	  r2.xyzw = (texture(s_dissolve_map, r2.xyxx.st)).xyzw;
/*10*/	  r0.x = -r0.x * 0.001000 + 1.000000;
/*11*/	  r1.x = -r2.x * r0.x + r0.y;
/*12*/	} else {
/*13*/	  r0.x = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].x))) * 0xffffffffu)).x;
/*14*/	    r0.x = (floatBitsToUint(r0.x) > 0x00000000u) ? 1.000000 : r0.y;
/*15*/	  r1.x = r0.x * r1.x;
/*16*/	}
/*17*/	r2.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*18*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*19*/	r0.x = r1.w + -0.500000;
/*20*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*21*/	if(r0.x != 0) discard;
/*22*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*23*/	r1.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*24*/	r3.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r4.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*26*/	r5.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz;
/*27*/	r2.w = saturate(vsOut_N0.w);
/*28*/	r5.xyz = (r5.xyzx + -cb3.data[0].xyzx).xyz;
/*29*/	r5.xyz = (r2.wwww * r5.xyzx + cb3.data[0].xyzx).xyz;
/*30*/	r4.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw;
/*31*/	r4.xyw = (r4.xyxw + -cb3.data[1].xyxz).xyw;
/*32*/	r4.xyw = (r2.wwww * r4.xyxw + cb3.data[1].xyxz).xyw;
/*33*/	r6.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz;
/*34*/	r6.xyz = (r6.xyzx + -cb3.data[2].xyzx).xyz;
/*35*/	r6.xyz = (r2.wwww * r6.xyzx + cb3.data[2].xyzx).xyz;
/*36*/	r5.xyz = (r5.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r3.xxxx * r5.xyzx + r0.xyzx).xyz;
/*38*/	r4.xyz = (r4.xywx * r0.xyzx + -r0.xyzx).xyz;
/*39*/	r0.xyz = (r3.yyyy * r4.xyzx + r0.xyzx).xyz;
/*40*/	r3.xyw = (r6.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*41*/	r0.xyz = (r3.zzzz * r3.xywx + r0.xyzx).xyz;
/*42*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*44*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*45*/	r2.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*46*/	r2.w = -r2.w + 1.000000;
/*47*/	r2.w = max(r2.w, 0.000000);
/*48*/	r3.z = sqrt(r2.w);
/*49*/	r3.xyz = (mix(r3.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*50*/	r4.xyz = (vsOut_T0.xyzx).xyz;
/*51*/	r4.w = 1.000000;
/*52*/	r2.w = dot(r4.xyzw, cb0.data[11].xyzw);
/*53*/	r3.w = dot(r4.xyzw, cb0.data[12].xyzw);
/*54*/	r4.xy = (-cb2.data[3].xyxx + cb2.data[3].zwzz).xy;
/*55*/	r4.zw = (vsOut_T1.xxxy + -cb2.data[3].xxxy).zw;
/*56*/	r4.xy = (r4.zwzz / r4.xyxx).xy;
/*57*/	r4.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*58*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r4.xyxx)) * 0xffffffffu)).xy;
/*59*/	r4.z = uintBitsToFloat(floatBitsToUint(r4.z) & floatBitsToUint(r5.x));
/*60*/	r4.z = uintBitsToFloat(floatBitsToUint(r4.w) & floatBitsToUint(r4.z));
/*61*/	r4.z = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r4.z));
/*62*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyxx.st)).xyzw;
/*63*/	r6.xyzw = (texture(s_decal_normal, r4.xyxx.st)).xyzw;
/*64*/	if(floatBitsToUint(r4.z) != 0u) {
/*65*/	  r4.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*66*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*67*/	  r4.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*68*/	  r4.w = -r4.w + 1.000000;
/*69*/	  r4.w = max(r4.w, 0.000000);
/*70*/	  r4.z = sqrt(r4.w);
/*71*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*72*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*73*/	  r4.w = r1.x * r7.w;
/*74*/	  r1.x = r4.w * -0.500000 + r1.x;
/*75*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*76*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*77*/	  r4.w = -r5.w * r6.w + 1.000000;
/*78*/	  r0.xyz = (r4.wwww * r0.xyzx + r7.xyzx).xyz;
/*79*/	  r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*80*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*81*/	}
/*82*/	r4.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*83*/	r5.x = 0;
/*84*/	r5.y = cb0.data[26].x * 0.050000;
/*85*/	r4.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 1.200000, 1.500000) + r5.xxxy).zw;
/*86*/	r5.xyzw = (texture(s_fire_map, r4.zwzz.st)).xyzw;
/*87*/	r4.xyzw = (texture(s_fire_map, r4.xyxx.st)).xyzw;
/*88*/	r4.x = saturate(r5.x * 5.000000);
/*89*/	r5.xyz = (r4.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*90*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*91*/	r4.x = saturate(-r4.x * 15.000000 + 1.000000);
/*92*/	r4.y = log2(r4.z);
/*93*/	r4.y = r4.y * 1.800000;
/*94*/	r4.y = exp2(r4.y);
/*95*/	r4.y = r4.y * 10.000000;
/*96*/	r4.y = min(r4.y, 1.000000);
/*97*/	r4.x = r4.y + r4.x;
/*98*/	r4.y = -r4.w + 1.000000;
/*99*/	r4.y = log2(r4.y);
/*100*/	r4.y = r4.y * vsOut_T7.x;
/*101*/	r4.y = exp2(r4.y);
/*102*/	r4.y = min(r4.y, 1.000000);
/*103*/	r4.y = r4.y * vsOut_T7.x;
/*104*/	r4.xw = (r4.xxxz * vec4(0.500000, 0.000000, 0.000000, 0.250000)).xw;
/*105*/	r5.xyz = (r5.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r4.wwww).xyz;
/*106*/	r5.xyz = (r4.xxxx * r5.xyzx + r4.wwww).xyz;
/*107*/	r5.xyz = (-r0.xyzx + r5.xyzx).xyz;
/*108*/	r0.xyz = (r4.yyyy * r5.xyzx + r0.xyzx).xyz;
/*109*/	r4.x = vsOut_T7.x + -0.025000;
/*110*/	r4.x = max(r4.x, 0.000000);
/*111*/	r4.yzw = (r4.zzzz * vec4(0.000000, 0.250000, 0.250000, 0.250000) + -r0.xxyz).yzw;
/*112*/	r0.xyz = (r4.xxxx * r4.yzwy + r0.xyzx).xyz;
/*113*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*114*/	r4.x = inversesqrt(r4.x);
/*115*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*116*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*117*/	r4.w = inversesqrt(r4.w);
/*118*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*119*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*120*/	r4.w = inversesqrt(r4.w);
/*121*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*122*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*123*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*124*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*125*/	r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*126*/	r4.w = inversesqrt(r4.w);
/*127*/	r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*128*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*129*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*130*/	if(floatBitsToUint(r0.w) != 0u) {
/*131*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*132*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*133*/	  r0.w = r7.y * cb0.data[26].x;
/*134*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*135*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*136*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*137*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*138*/	  r1.xy = (r1.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*139*/	}
/*140*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*141*/	if(floatBitsToUint(r0.w) != 0u) {
/*142*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*143*/	  if(floatBitsToUint(r0.w) != 0u) {
/*144*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*145*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*146*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*147*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*148*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*149*/	    r0.w = -r0.w + 1.000000;
/*150*/	    r0.w = max(r0.w, 0.000000);
/*151*/	    r8.z = sqrt(r0.w);
/*152*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*153*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*154*/	    r0.w = inversesqrt(r0.w);
/*155*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*156*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*157*/	    r10.y = -1.000000;
/*158*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*159*/	    r0.w = inversesqrt(r0.w);
/*160*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*161*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*162*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*163*/	    r4.w = r4.w * 1.250000;
/*164*/	    r4.w = min(r4.w, 1.000000);
/*165*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*166*/	    r5.w = r5.w * 4.000000;
/*167*/	    r4.w = r4.w * 0.200000 + r5.w;
/*168*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*169*/	    r0.w = r0.w + -r4.w;
/*170*/	    r0.w = saturate(r0.w * 200.000000);
/*171*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*172*/	    r0.w = r0.w * r0.w;
/*173*/	    r0.w = r0.w * r4.w;
/*174*/	    r1.y = r0.w * -r1.y + r1.y;
/*175*/	    r4.w = -r1.x + 0.200000;
/*176*/	    r1.x = r0.w * r4.w + r1.x;
/*177*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*178*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*179*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*180*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*181*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*182*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*183*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*184*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*185*/	    r4.w = -r4.w + 1.000000;
/*186*/	    r4.w = max(r4.w, 0.000000);
/*187*/	    r7.z = sqrt(r4.w);
/*188*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*189*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*190*/	    r4.w = sqrt(r4.w);
/*191*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*192*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*193*/	    r4.w = inversesqrt(r4.w);
/*194*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*195*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*196*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*197*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*198*/	    r4.w = -r3.y + 1.000000;
/*199*/	    r0.w = min(r0.w, r4.w);
/*200*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*201*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*202*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*203*/	    r0.w = inversesqrt(r0.w);
/*204*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*205*/	  }
/*206*/	}
/*207*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*208*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*209*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*210*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*211*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*212*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*213*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*214*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*215*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*216*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*217*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*218*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*219*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*220*/	r2.x = inversesqrt(r2.x);
/*221*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*222*/	color3.x = r2.w / r3.w;
/*223*/	r2.w = max(abs(r2.z), abs(r2.y));
/*224*/	r2.w = max(r2.w, abs(r2.x));
/*225*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*226*/	r1.xzw = (r2.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*227*/	color0.xyzw = saturate(r1.xzwy);
/*228*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*229*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*230*/	color2.xyzw = saturate(r4.xyzw);
/*231*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*232*/	color4 = vsOut_P1;
/*233*/	return;
}
