//
//
// Shader Model 4
// Fragment Shader
//
// id: 1223 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_gbuffer_alpha_test.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
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
/*17*/	r1.xyzw = mix(r1.yzwx, vsOut_C2.xyzw, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*18*/	r0.x = r1.w + -0.500000;
/*19*/	r0.x = uintBitsToFloat((r0.x < 0.000000) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r0.x != 0) discard;
/*21*/	r0.xyz = (r1.xyzx / r1.wwww).xyz;
/*22*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*23*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*24*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*25*/	r1.w = saturate(vsOut_N0.w);
/*26*/	r3.xyz = (r3.xyzx + -cb3.data[0].xyzx).xyz;
/*27*/	r3.xyz = (r1.wwww * r3.xyzx + cb3.data[0].xyzx).xyz;
/*28*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*29*/	r2.xyw = (r2.xyxw + -cb3.data[1].xyxz).xyw;
/*30*/	r2.xyw = (r1.wwww * r2.xyxw + cb3.data[1].xyxz).xyw;
/*31*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*32*/	r4.xyz = (r4.xyzx + -cb3.data[2].xyzx).xyz;
/*33*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[2].xyzx).xyz;
/*34*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*35*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*36*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*38*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*39*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*40*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*41*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*42*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*43*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*44*/	r1.w = -r1.w + 1.000000;
/*45*/	r1.w = max(r1.w, 0.000000);
/*46*/	r1.z = sqrt(r1.w);
/*47*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*48*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*49*/	r2.w = 1.000000;
/*50*/	r1.w = dot(r2.xyzw, cb0.data[11].xyzw);
/*51*/	r2.x = dot(r2.xyzw, cb0.data[12].xyzw);
/*52*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*53*/	r2.yz = (vsOut_T1.xxyx * cb2.data[2].xxyx).yz;
/*54*/	r3.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*55*/	r4.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*56*/	r3.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*57*/	r2.w = r3.w * r4.w;
/*58*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*59*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*60*/	r1.xy = (r3.xyxx * r3.wwww + r1.xyxx).xy;
/*61*/	r3.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*62*/	r3.x = inversesqrt(r3.x);
/*63*/	r1.xyz = (r1.xyzx * r3.xxxx).xyz;
/*64*/	r2.yz = (r2.yyzy * vec4(0.000000, 0.750000, 0.750000, 0.000000) + vsOut_T6.yyzy).yz;
/*65*/	r3.xyzw = (texture(s_decal_blood_map, r2.yzyy.st)).xyzw;
/*66*/	r2.y = -vsOut_T7.w * 0.900000 + 1.000000;
/*67*/	r2.y = saturate(-r2.y + r3.w);
/*68*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*69*/	if(floatBitsToUint(r2.y) != 0u) {
/*70*/	  r2.y = -r3.w + 1.000000;
/*71*/	  r2.y = saturate(vsOut_T7.w * 0.900000 + -r2.y);
/*72*/	  r2.y = -r2.y + 1.000000;
/*73*/	  r2.y = -r2.y * r2.y + 1.000000;
/*74*/	  r2.y = r2.y * -0.600000 + 1.000000;
/*75*/	  r3.xyz = (r2.yyyy * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*76*/	  r2.y = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*77*/	  r2.y = uintBitsToFloat((r2.y < 0.225000) ? 0xffffffffu : 0x00000000u);
/*78*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(0x3f800000u));
/*79*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*80*/	  r0.xyz = (r2.yyyy * r4.xyzx + r3.xyzx).xyz;
/*81*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*82*/	  r4.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*83*/	} else {
/*84*/	  r5.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*85*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*86*/	  r2.yzw = (r2.wwww * r5.xxyz).yzw;
/*87*/	  r3.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r5.xyzx).xyz;
/*88*/	}
/*89*/	r2.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*90*/	r2.y = inversesqrt(r2.y);
/*91*/	r2.yzw = (r2.yyyy * vsOut_T3.xxyz).yzw;
/*92*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*93*/	r3.w = inversesqrt(r3.w);
/*94*/	r5.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*95*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*96*/	r3.w = inversesqrt(r3.w);
/*97*/	r6.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*98*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*99*/	r7.xyz = (r1.xxxx * r2.yzwy + r7.xyzx).xyz;
/*100*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*101*/	r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*102*/	r3.w = inversesqrt(r3.w);
/*103*/	r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*104*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*105*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*106*/	if(floatBitsToUint(r0.w) != 0u) {
/*107*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*108*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*109*/	  r0.w = r7.y * cb0.data[26].x;
/*110*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*111*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*112*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*113*/	  r3.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*114*/	  r4.xw = (r4.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*115*/	}
/*116*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*117*/	if(floatBitsToUint(r0.w) != 0u) {
/*118*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*119*/	  if(floatBitsToUint(r0.w) != 0u) {
/*120*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*121*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*122*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*123*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*124*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*125*/	    r0.w = -r0.w + 1.000000;
/*126*/	    r0.w = max(r0.w, 0.000000);
/*127*/	    r8.z = sqrt(r0.w);
/*128*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*129*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*130*/	    r0.w = inversesqrt(r0.w);
/*131*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*132*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*133*/	    r10.y = -1.000000;
/*134*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*135*/	    r0.w = inversesqrt(r0.w);
/*136*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*137*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*138*/	    r3.w = cb1.data[1].x * cb1.data[1].x;
/*139*/	    r3.w = r3.w * 1.250000;
/*140*/	    r3.w = min(r3.w, 1.000000);
/*141*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*142*/	    r5.w = r5.w * 4.000000;
/*143*/	    r3.w = r3.w * 0.200000 + r5.w;
/*144*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*145*/	    r0.w = r0.w + -r3.w;
/*146*/	    r0.w = saturate(r0.w * 200.000000);
/*147*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*148*/	    r0.w = r0.w * r0.w;
/*149*/	    r0.w = r0.w * r3.w;
/*150*/	    r4.w = r0.w * -r4.w + r4.w;
/*151*/	    r3.w = -r4.x + 0.200000;
/*152*/	    r4.x = r0.w * r3.w + r4.x;
/*153*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*154*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*155*/	    r9.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*156*/	    r3.xyz = (r0.wwww * r9.xyzx + r3.xyzx).xyz;
/*157*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*158*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*159*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*160*/	    r3.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*161*/	    r3.w = -r3.w + 1.000000;
/*162*/	    r3.w = max(r3.w, 0.000000);
/*163*/	    r7.z = sqrt(r3.w);
/*164*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*165*/	    r3.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*166*/	    r3.w = sqrt(r3.w);
/*167*/	    r7.xyz = (r8.xyzx * r3.wwww + r7.xyzx).xyz;
/*168*/	    r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*169*/	    r3.w = inversesqrt(r3.w);
/*170*/	    r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*171*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*172*/	    r2.yzw = (r7.xxxx * r2.yyzw + r5.xxyz).yzw;
/*173*/	    r2.yzw = (r7.zzzz * r6.xxyz + r2.yyzw).yzw;
/*174*/	    r3.w = -r1.y + 1.000000;
/*175*/	    r0.w = min(r0.w, r3.w);
/*176*/	    r2.yzw = (-r1.xxyz + r2.yyzw).yzw;
/*177*/	    r2.yzw = (r0.wwww * r2.yyzw + r1.xxyz).yzw;
/*178*/	    r0.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*179*/	    r0.w = inversesqrt(r0.w);
/*180*/	    r1.xyz = (r0.wwww * r2.yzwy).xyz;
/*181*/	  }
/*182*/	}
/*183*/	r0.w = vsOut_T7.y * -r4.x + r4.x;
/*184*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*185*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*186*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*187*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*188*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*189*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*190*/	r2.y = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*191*/	r2.yzw = (-r3.xxyz + r2.yyyy).yzw;
/*192*/	r3.xyz = (vsOut_T7.zzzz * r2.yzwy + r3.xyzx).xyz;
/*193*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*194*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*195*/	r2.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*196*/	r2.y = inversesqrt(r2.y);
/*197*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*198*/	color3.x = r1.w / r2.x;
/*199*/	r1.w = max(abs(r1.z), abs(r1.y));
/*200*/	r1.w = max(r1.w, abs(r1.x));
/*201*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*202*/	r4.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*203*/	color0.xyzw = saturate(r4.xyzw);
/*204*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*205*/	r3.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*206*/	color2.xyzw = saturate(r3.xyzw);
/*207*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*208*/	color4 = vsOut_P1;
/*209*/	return;
}
