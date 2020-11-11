//
//
// Shader Model 4
// Fragment Shader
//
// id: 744 - fxc/glsl_SM_3_0_rigidstandardblood.hlsl_PS_ps30_gbuffer.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_snow_normals;

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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = (uintBitsToFloat(uvec4(notEqual(vec4(0.000000, 0.000000, 0.000000, 0.000000), vec4(cb2.data[0].z))) * 0xffffffffu)).w;
/*2*/	r0.xyz = (mix(r0.xyzx, vsOut_C2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*3*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*4*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_N0.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*5*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*6*/	r1.w = saturate(vsOut_N0.w);
/*7*/	r3.xyz = (r3.xyzx + -cb3.data[0].xyzx).xyz;
/*8*/	r3.xyz = (r1.wwww * r3.xyzx + cb3.data[0].xyzx).xyz;
/*9*/	r2.xyw = (mix(vec4(1.000000, 1.000000, 0, 1.000000), vsOut_N0.xyxz, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyw;
/*10*/	r2.xyw = (r2.xyxw + -cb3.data[1].xyxz).xyw;
/*11*/	r2.xyw = (r1.wwww * r2.xyxw + cb3.data[1].xyxz).xyw;
/*12*/	r4.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_N0.xyzx, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).xyz;
/*13*/	r4.xyz = (r4.xyzx + -cb3.data[2].xyzx).xyz;
/*14*/	r4.xyz = (r1.wwww * r4.xyzx + cb3.data[2].xyzx).xyz;
/*15*/	r3.xyz = (r3.xyzx * r0.xyzx + -r0.xyzx).xyz;
/*16*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*17*/	r2.xyz = (r2.xywx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyw = (r4.xyxz * r0.xyxz + -r0.xyxz).xyw;
/*20*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*21*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*22*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*23*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	r1.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*25*/	r1.w = -r1.w + 1.000000;
/*26*/	r1.w = max(r1.w, 0.000000);
/*27*/	r1.z = sqrt(r1.w);
/*28*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*29*/	r2.xyz = (vsOut_T0.xyzx).xyz;
/*30*/	r2.w = 1.000000;
/*31*/	r1.w = dot(r2.xyzw, cb0.data[11].xyzw);
/*32*/	r2.x = dot(r2.xyzw, cb0.data[12].xyzw);
/*33*/	r2.yz = (vsOut_T1.xxyx * cb2.data[2].xxyx).yz;
/*34*/	r2.yz = (r2.yyzy * vec4(0.000000, 0.750000, 0.750000, 0.000000) + vsOut_T6.yyzy).yz;
/*35*/	r3.xyzw = (texture(s_decal_blood_map, r2.yzyy.st)).xyzw;
/*36*/	r2.y = -vsOut_T7.w * 0.900000 + 1.000000;
/*37*/	r2.y = saturate(-r2.y + r3.w);
/*38*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*39*/	if(floatBitsToUint(r2.y) != 0u) {
/*40*/	  r2.y = -r3.w + 1.000000;
/*41*/	  r2.y = saturate(vsOut_T7.w * 0.900000 + -r2.y);
/*42*/	  r2.y = -r2.y + 1.000000;
/*43*/	  r2.y = -r2.y * r2.y + 1.000000;
/*44*/	  r2.y = r2.y * -0.600000 + 1.000000;
/*45*/	  r2.yzw = (r2.yyyy * vec4(0.000000, 0.240000, 0.000000, 0.000000)).yzw;
/*46*/	  r3.x = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*47*/	  r3.x = uintBitsToFloat((r3.x < 0.225000) ? 0xffffffffu : 0x00000000u);
/*48*/	  r3.x = uintBitsToFloat(floatBitsToUint(r3.x) & uint(0x3f800000u));
/*49*/	  r3.yzw = (r0.xxyz * vec4(0.000000, 0.300000, 0.000000, 0.000000) + -r2.yyww).yzw;
/*50*/	  r0.xyz = (r3.xxxx * r3.yzwy + r2.yzwy).xyz;
/*51*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*52*/	  r4.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*53*/	} else {
/*54*/	  r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*56*/	}
/*57*/	r2.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*58*/	r2.y = inversesqrt(r2.y);
/*59*/	r2.yzw = (r2.yyyy * vsOut_T3.xxyz).yzw;
/*60*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*61*/	r3.w = inversesqrt(r3.w);
/*62*/	r5.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*63*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*64*/	r3.w = inversesqrt(r3.w);
/*65*/	r6.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*66*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*67*/	r7.xyz = (r1.xxxx * r2.yzwy + r7.xyzx).xyz;
/*68*/	r1.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*69*/	r3.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*70*/	r3.w = inversesqrt(r3.w);
/*71*/	r1.xyz = (r1.xyzx * r3.wwww).xyz;
/*72*/	r1.xyz = (mix(r1.xyzx, vsOut_T2.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*73*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*74*/	if(floatBitsToUint(r0.w) != 0u) {
/*75*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*76*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*77*/	  r0.w = r7.y * cb0.data[26].x;
/*78*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*79*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*80*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*81*/	  r3.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*82*/	  r4.xw = (r4.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*83*/	}
/*84*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*85*/	if(floatBitsToUint(r0.w) != 0u) {
/*86*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*87*/	  if(floatBitsToUint(r0.w) != 0u) {
/*88*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*89*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*90*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*91*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*92*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*93*/	    r0.w = -r0.w + 1.000000;
/*94*/	    r0.w = max(r0.w, 0.000000);
/*95*/	    r8.z = sqrt(r0.w);
/*96*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*97*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*98*/	    r0.w = inversesqrt(r0.w);
/*99*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*100*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*101*/	    r10.y = -1.000000;
/*102*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*103*/	    r0.w = inversesqrt(r0.w);
/*104*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*105*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*106*/	    r3.w = cb1.data[1].x * cb1.data[1].x;
/*107*/	    r3.w = r3.w * 1.250000;
/*108*/	    r3.w = min(r3.w, 1.000000);
/*109*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*110*/	    r5.w = r5.w * 4.000000;
/*111*/	    r3.w = r3.w * 0.200000 + r5.w;
/*112*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*113*/	    r0.w = r0.w + -r3.w;
/*114*/	    r0.w = saturate(r0.w * 200.000000);
/*115*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*116*/	    r0.w = r0.w * r0.w;
/*117*/	    r0.w = r0.w * r3.w;
/*118*/	    r4.w = r0.w * -r4.w + r4.w;
/*119*/	    r3.w = -r4.x + 0.200000;
/*120*/	    r4.x = r0.w * r3.w + r4.x;
/*121*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*122*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*123*/	    r9.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*124*/	    r3.xyz = (r0.wwww * r9.xyzx + r3.xyzx).xyz;
/*125*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*126*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*127*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*128*/	    r3.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*129*/	    r3.w = -r3.w + 1.000000;
/*130*/	    r3.w = max(r3.w, 0.000000);
/*131*/	    r7.z = sqrt(r3.w);
/*132*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*133*/	    r3.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*134*/	    r3.w = sqrt(r3.w);
/*135*/	    r7.xyz = (r8.xyzx * r3.wwww + r7.xyzx).xyz;
/*136*/	    r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*137*/	    r3.w = inversesqrt(r3.w);
/*138*/	    r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*139*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*140*/	    r2.yzw = (r7.xxxx * r2.yyzw + r5.xxyz).yzw;
/*141*/	    r2.yzw = (r7.zzzz * r6.xxyz + r2.yyzw).yzw;
/*142*/	    r3.w = -r1.y + 1.000000;
/*143*/	    r0.w = min(r0.w, r3.w);
/*144*/	    r2.yzw = (-r1.xxyz + r2.yyzw).yzw;
/*145*/	    r2.yzw = (r0.wwww * r2.yyzw + r1.xxyz).yzw;
/*146*/	    r0.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*147*/	    r0.w = inversesqrt(r0.w);
/*148*/	    r1.xyz = (r0.wwww * r2.yzwy).xyz;
/*149*/	  }
/*150*/	}
/*151*/	r0.w = vsOut_T7.y * -r4.x + r4.x;
/*152*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*153*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*154*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*155*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*156*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*157*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*158*/	r2.y = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*159*/	r2.yzw = (-r3.xxyz + r2.yyyy).yzw;
/*160*/	r3.xyz = (vsOut_T7.zzzz * r2.yzwy + r3.xyzx).xyz;
/*161*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*162*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*163*/	r2.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*164*/	r2.y = inversesqrt(r2.y);
/*165*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*166*/	color3.x = r1.w / r2.x;
/*167*/	r1.w = max(abs(r1.z), abs(r1.y));
/*168*/	r1.w = max(r1.w, abs(r1.x));
/*169*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*170*/	r4.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*171*/	color0.xyzw = saturate(r4.xyzw);
/*172*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*173*/	r3.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*174*/	color2.xyzw = saturate(r3.xyzw);
/*175*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*176*/	color4 = vsOut_P1;
/*177*/	return;
}
