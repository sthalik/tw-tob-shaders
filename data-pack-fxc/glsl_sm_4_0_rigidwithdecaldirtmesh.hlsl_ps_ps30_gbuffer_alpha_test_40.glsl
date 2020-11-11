//
//
// Shader Model 4
// Fragment Shader
//
// id: 903 - fxc/glsl_SM_4_0_rigidwithdecaldirtmesh.hlsl_PS_ps30_gbuffer_alpha_test_40.glsl
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
uniform sampler2DArray s_decal_diffuse;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*57*/	r5.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r4.xyxx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*58*/	r5.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r4.xxxy)) * 0xffffffffu)).zw;
/*59*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.z) & floatBitsToUint(r5.x));
/*60*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.y) & floatBitsToUint(r4.w));
/*61*/	r4.w = uintBitsToFloat(floatBitsToUint(r5.w) & floatBitsToUint(r4.w));
/*62*/	r4.z = vsOut_T6.x;
/*63*/	r5.xyzw = (texture(s_decal_diffuse, r4.xyzx.stp)).xyzw;
/*64*/	r6.xyzw = (texture(s_decal_normal, r4.xyzx.stp)).xyzw;
/*65*/	if(floatBitsToUint(r4.w) != 0u) {
/*66*/	  r4.xy = (r6.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*67*/	  r4.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*68*/	  r4.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*69*/	  r4.w = -r4.w + 1.000000;
/*70*/	  r4.w = max(r4.w, 0.000000);
/*71*/	  r4.z = sqrt(r4.w);
/*72*/	  r6.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*73*/	  r7.xyzw = r5.xyzw * r6.wwww;
/*74*/	  r4.w = r1.x * r7.w;
/*75*/	  r1.x = r4.w * -0.500000 + r1.x;
/*76*/	  r5.xyz = (r5.xyzx * r6.wwww + -r2.xyzx).xyz;
/*77*/	  r2.xyz = (r7.wwww * r5.xyzx + r2.xyzx).xyz;
/*78*/	  r4.w = -r5.w * r6.w + 1.000000;
/*79*/	  r0.xyz = (r4.wwww * r0.xyzx + r7.xyzx).xyz;
/*80*/	  r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*81*/	  r3.xyz = (r7.wwww * r4.xyzx + r3.xyzx).xyz;
/*82*/	}
/*83*/	r4.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*84*/	r4.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*85*/	r5.xyzw = (texture(s_decal_dirt_map, r4.xyxx.st)).xyzw;
/*86*/	r4.xy = (r5.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*87*/	r4.z = r4.w * r5.w;
/*88*/	r5.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*89*/	r0.xyz = (r4.zzzz * r5.xyzx + r0.xyzx).xyz;
/*90*/	r3.xy = (r4.xyxx * r4.wwww + r3.xyxx).xy;
/*91*/	r4.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*92*/	r4.x = inversesqrt(r4.x);
/*93*/	r3.xyz = (r3.xyzx * r4.xxxx).xyz;
/*94*/	r4.xyz = (r2.xyzx * r4.zzzz).xyz;
/*95*/	r2.xyz = (r4.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r2.xyzx).xyz;
/*96*/	r4.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*97*/	r4.x = inversesqrt(r4.x);
/*98*/	r4.xyz = (r4.xxxx * vsOut_T3.xyzx).xyz;
/*99*/	r4.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*100*/	r4.w = inversesqrt(r4.w);
/*101*/	r5.xyz = (r4.wwww * vsOut_T4.xyzx).xyz;
/*102*/	r4.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*103*/	r4.w = inversesqrt(r4.w);
/*104*/	r6.xyz = (r4.wwww * vsOut_T2.xyzx).xyz;
/*105*/	r7.xyz = (r3.yyyy * r5.xyzx).xyz;
/*106*/	r7.xyz = (r3.xxxx * r4.xyzx + r7.xyzx).xyz;
/*107*/	r7.xyz = (r3.zzzz * r6.xyzx + r7.xyzx).xyz;
/*108*/	r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*109*/	r4.w = inversesqrt(r4.w);
/*110*/	r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*111*/	r3.xyz = (mix(r7.xyzx, r3.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*112*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*113*/	if(floatBitsToUint(r0.w) != 0u) {
/*114*/	  r0.w = uintBitsToFloat((0.990000 < r3.y) ? 0xffffffffu : 0x00000000u);
/*115*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*116*/	  r0.w = r7.y * cb0.data[26].x;
/*117*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*118*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*119*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*120*/	  r2.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r2.xyzx).xyz;
/*121*/	  r1.xy = (r1.xyxx + vec4(0.200000, 0.300000, 0.000000, 0.000000)).xy;
/*122*/	}
/*123*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*124*/	if(floatBitsToUint(r0.w) != 0u) {
/*125*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*126*/	  if(floatBitsToUint(r0.w) != 0u) {
/*127*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*128*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*129*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*130*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*131*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*132*/	    r0.w = -r0.w + 1.000000;
/*133*/	    r0.w = max(r0.w, 0.000000);
/*134*/	    r8.z = sqrt(r0.w);
/*135*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r3.xyzx).xyz;
/*136*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*137*/	    r0.w = inversesqrt(r0.w);
/*138*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*139*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*140*/	    r10.y = -1.000000;
/*141*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*142*/	    r0.w = inversesqrt(r0.w);
/*143*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*144*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*145*/	    r4.w = cb1.data[1].x * cb1.data[1].x;
/*146*/	    r4.w = r4.w * 1.250000;
/*147*/	    r4.w = min(r4.w, 1.000000);
/*148*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*149*/	    r5.w = r5.w * 4.000000;
/*150*/	    r4.w = r4.w * 0.200000 + r5.w;
/*151*/	    r4.w = r4.w * -0.700000 + 1.000000;
/*152*/	    r0.w = r0.w + -r4.w;
/*153*/	    r0.w = saturate(r0.w * 200.000000);
/*154*/	    r4.w = r0.w * -2.000000 + 3.000000;
/*155*/	    r0.w = r0.w * r0.w;
/*156*/	    r0.w = r0.w * r4.w;
/*157*/	    r1.y = r0.w * -r1.y + r1.y;
/*158*/	    r4.w = -r1.x + 0.200000;
/*159*/	    r1.x = r0.w * r4.w + r1.x;
/*160*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*161*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*162*/	    r9.xyz = (-r2.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*163*/	    r2.xyz = (r0.wwww * r9.xyzx + r2.xyzx).xyz;
/*164*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*165*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*166*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*167*/	    r4.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*168*/	    r4.w = -r4.w + 1.000000;
/*169*/	    r4.w = max(r4.w, 0.000000);
/*170*/	    r7.z = sqrt(r4.w);
/*171*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*172*/	    r4.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*173*/	    r4.w = sqrt(r4.w);
/*174*/	    r7.xyz = (r8.xyzx * r4.wwww + r7.xyzx).xyz;
/*175*/	    r4.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*176*/	    r4.w = inversesqrt(r4.w);
/*177*/	    r7.xyz = (r4.wwww * r7.xyzx).xyz;
/*178*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*179*/	    r4.xyz = (r7.xxxx * r4.xyzx + r5.xyzx).xyz;
/*180*/	    r4.xyz = (r7.zzzz * r6.xyzx + r4.xyzx).xyz;
/*181*/	    r4.w = -r3.y + 1.000000;
/*182*/	    r0.w = min(r0.w, r4.w);
/*183*/	    r4.xyz = (-r3.xyzx + r4.xyzx).xyz;
/*184*/	    r4.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*185*/	    r0.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*186*/	    r0.w = inversesqrt(r0.w);
/*187*/	    r3.xyz = (r0.wwww * r4.xyzx).xyz;
/*188*/	  }
/*189*/	}
/*190*/	r0.w = vsOut_T7.y * -r1.x + r1.x;
/*191*/	r4.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*192*/	r4.xyz = (-r0.xyzx + r4.xyzx).xyz;
/*193*/	r0.xyz = saturate(vsOut_T7.yyyy * r4.xyzx + r0.xyzx).xyz;
/*194*/	r4.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*195*/	r4.xyz = (-r0.xyzx + r4.xxxx).xyz;
/*196*/	r0.xyz = (vsOut_T7.zzzz * r4.xyzx + r0.xyzx).xyz;
/*197*/	r4.x = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*198*/	r4.xyz = (-r2.xyzx + r4.xxxx).xyz;
/*199*/	r4.xyz = (vsOut_T7.zzzz * r4.xyzx + r2.xyzx).xyz;
/*200*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*201*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*202*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*203*/	r2.x = inversesqrt(r2.x);
/*204*/	r2.xyz = (r2.xxxx * r3.xyzx).xyz;
/*205*/	color3.x = r2.w / r3.w;
/*206*/	r2.w = max(abs(r2.z), abs(r2.y));
/*207*/	r2.w = max(r2.w, abs(r2.x));
/*208*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*209*/	r1.xzw = (r2.xxyz * vec4(0.500000, 0.000000, 0.500000, 0.500000) + vec4(0.500000, 0.000000, 0.500000, 0.500000)).xzw;
/*210*/	color0.xyzw = saturate(r1.xzwy);
/*211*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*212*/	r4.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*213*/	color2.xyzw = saturate(r4.xyzw);
/*214*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*215*/	color4 = vsOut_P1;
/*216*/	return;
}
