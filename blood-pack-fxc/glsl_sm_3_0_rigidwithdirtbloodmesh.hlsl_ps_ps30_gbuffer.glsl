//
//
// Shader Model 4
// Fragment Shader
//
// id: 1221 - fxc/glsl_SM_3_0_rigidwithdirtbloodmesh.hlsl_PS_ps30_gbuffer.glsl
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
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*33*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*34*/	r2.yz = (vsOut_T1.xxyx * cb2.data[2].xxyx).yz;
/*35*/	r3.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.yzyy).xy;
/*36*/	r4.xyzw = (texture(s_decal_dirt_map, r3.xyxx.st)).xyzw;
/*37*/	r3.xy = (r4.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*38*/	r2.w = r3.w * r4.w;
/*39*/	r4.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*40*/	r0.xyz = (r2.wwww * r4.xyzx + r0.xyzx).xyz;
/*41*/	r1.xy = (r3.xyxx * r3.wwww + r1.xyxx).xy;
/*42*/	r3.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*43*/	r3.x = inversesqrt(r3.x);
/*44*/	r1.xyz = (r1.xyzx * r3.xxxx).xyz;
/*45*/	r2.yz = (r2.yyzy * vec4(0.000000, 0.750000, 0.750000, 0.000000) + vsOut_T6.yyzy).yz;
/*46*/	r3.xyzw = (texture(s_decal_blood_map, r2.yzyy.st)).xyzw;
/*47*/	r2.y = -vsOut_T7.w * 0.900000 + 1.000000;
/*48*/	r2.y = saturate(-r2.y + r3.w);
/*49*/	r2.y = uintBitsToFloat((0.000000 < r2.y) ? 0xffffffffu : 0x00000000u);
/*50*/	if(floatBitsToUint(r2.y) != 0u) {
/*51*/	  r2.y = -r3.w + 1.000000;
/*52*/	  r2.y = saturate(vsOut_T7.w * 0.900000 + -r2.y);
/*53*/	  r2.y = -r2.y + 1.000000;
/*54*/	  r2.y = -r2.y * r2.y + 1.000000;
/*55*/	  r2.y = r2.y * -0.600000 + 1.000000;
/*56*/	  r3.xyz = (r2.yyyy * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*57*/	  r2.y = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*58*/	  r2.y = uintBitsToFloat((r2.y < 0.225000) ? 0xffffffffu : 0x00000000u);
/*59*/	  r2.y = uintBitsToFloat(floatBitsToUint(r2.y) & uint(0x3f800000u));
/*60*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*61*/	  r0.xyz = (r2.yyyy * r4.xyzx + r3.xyzx).xyz;
/*62*/	  r3.xyz = (vec4(1.000000, 0.800000, 0.800000, 0)).xyz;
/*63*/	  r4.xw = (vec4(0.020000, 0, 0, 0.800000)).xw;
/*64*/	} else {
/*65*/	  r5.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*66*/	  r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yzwx;
/*67*/	  r2.yzw = (r2.wwww * r5.xxyz).yzw;
/*68*/	  r3.xyz = (r2.yzwy * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r5.xyzx).xyz;
/*69*/	}
/*70*/	r2.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*71*/	r2.y = inversesqrt(r2.y);
/*72*/	r2.yzw = (r2.yyyy * vsOut_T3.xxyz).yzw;
/*73*/	r3.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*74*/	r3.w = inversesqrt(r3.w);
/*75*/	r5.xyz = (r3.wwww * vsOut_T4.xyzx).xyz;
/*76*/	r3.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*77*/	r3.w = inversesqrt(r3.w);
/*78*/	r6.xyz = (r3.wwww * vsOut_T2.xyzx).xyz;
/*79*/	r7.xyz = (r1.yyyy * r5.xyzx).xyz;
/*80*/	r7.xyz = (r1.xxxx * r2.yzwy + r7.xyzx).xyz;
/*81*/	r7.xyz = (r1.zzzz * r6.xyzx + r7.xyzx).xyz;
/*82*/	r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*83*/	r3.w = inversesqrt(r3.w);
/*84*/	r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*85*/	r1.xyz = (mix(r7.xyzx, r1.xyzx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*86*/	r0.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*87*/	if(floatBitsToUint(r0.w) != 0u) {
/*88*/	  r0.w = uintBitsToFloat((0.990000 < r1.y) ? 0xffffffffu : 0x00000000u);
/*89*/	  r7.xy = (mix(vec4(2.500000, -0.100000, 0, 0), vec4(50.000000, -0.700000, 0, 0), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xy;
/*90*/	  r0.w = r7.y * cb0.data[26].x;
/*91*/	  r7.yz = (r0.wwww * vec4(0.000000, -0.700000, 0.660000, 0.000000)).yz;
/*92*/	  r7.xy = (vsOut_T1.xyxx * r7.xxxx + r7.yzyy).xy;
/*93*/	  r7.xyzw = (texture(s_fire_map, r7.xyxx.st)).xyzw;
/*94*/	  r3.xyz = (r7.xxxx * vec4(0.600000, 0.600000, 0.600000, 0.000000) + r3.xyzx).xyz;
/*95*/	  r4.xw = (r4.xxxw + vec4(0.200000, 0.000000, 0.000000, 0.300000)).xw;
/*96*/	}
/*97*/	r0.w = uintBitsToFloat((0.000000 < vsOut_T6.w) ? 0xffffffffu : 0x00000000u);
/*98*/	if(floatBitsToUint(r0.w) != 0u) {
/*99*/	  r0.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*100*/	  if(floatBitsToUint(r0.w) != 0u) {
/*101*/	    r7.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*102*/	    r8.xyzw = (texture(s_snow_normals, r7.xyxx.st)).xyzw;
/*103*/	    r7.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*104*/	    r8.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*105*/	    r0.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*106*/	    r0.w = -r0.w + 1.000000;
/*107*/	    r0.w = max(r0.w, 0.000000);
/*108*/	    r8.z = sqrt(r0.w);
/*109*/	    r9.xyz = (r8.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r1.xyzx).xyz;
/*110*/	    r0.w = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*111*/	    r0.w = inversesqrt(r0.w);
/*112*/	    r9.xyz = (r0.wwww * r9.xyzx).xyz;
/*113*/	    r10.xz = (cb1.data[0].xxyx).xz/**/;
/*114*/	    r10.y = -1.000000;
/*115*/	    r0.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*116*/	    r0.w = inversesqrt(r0.w);
/*117*/	    r10.xyz = (r0.wwww * r10.xyzx).xyz;
/*118*/	    r0.w = saturate(dot(vec3(-r10.xyzx), vec3(r9.xyzx)));
/*119*/	    r3.w = cb1.data[1].x * cb1.data[1].x;
/*120*/	    r3.w = r3.w * 1.250000;
/*121*/	    r3.w = min(r3.w, 1.000000);
/*122*/	    r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*123*/	    r5.w = r5.w * 4.000000;
/*124*/	    r3.w = r3.w * 0.200000 + r5.w;
/*125*/	    r3.w = r3.w * -0.700000 + 1.000000;
/*126*/	    r0.w = r0.w + -r3.w;
/*127*/	    r0.w = saturate(r0.w * 200.000000);
/*128*/	    r3.w = r0.w * -2.000000 + 3.000000;
/*129*/	    r0.w = r0.w * r0.w;
/*130*/	    r0.w = r0.w * r3.w;
/*131*/	    r4.w = r0.w * -r4.w + r4.w;
/*132*/	    r3.w = -r4.x + 0.200000;
/*133*/	    r4.x = r0.w * r3.w + r4.x;
/*134*/	    r9.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*135*/	    r0.xyz = (r0.wwww * r9.xyzx + r0.xyzx).xyz;
/*136*/	    r9.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*137*/	    r3.xyz = (r0.wwww * r9.xyzx + r3.xyzx).xyz;
/*138*/	    r7.xyzw = (texture(s_snow_normals, r7.zwzz.st)).xyzw;
/*139*/	    r7.xy = (r7.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*140*/	    r7.xy = (r7.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*141*/	    r3.w = dot(vec2(r7.xyxx), vec2(r7.xyxx));
/*142*/	    r3.w = -r3.w + 1.000000;
/*143*/	    r3.w = max(r3.w, 0.000000);
/*144*/	    r7.z = sqrt(r3.w);
/*145*/	    r8.xyz = (r8.xyzx + r8.xyzx).xyz;
/*146*/	    r3.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*147*/	    r3.w = sqrt(r3.w);
/*148*/	    r7.xyz = (r8.xyzx * r3.wwww + r7.xyzx).xyz;
/*149*/	    r3.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*150*/	    r3.w = inversesqrt(r3.w);
/*151*/	    r7.xyz = (r3.wwww * r7.xyzx).xyz;
/*152*/	    r5.xyz = (r5.xyzx * r7.yyyy).xyz;
/*153*/	    r2.yzw = (r7.xxxx * r2.yyzw + r5.xxyz).yzw;
/*154*/	    r2.yzw = (r7.zzzz * r6.xxyz + r2.yyzw).yzw;
/*155*/	    r3.w = -r1.y + 1.000000;
/*156*/	    r0.w = min(r0.w, r3.w);
/*157*/	    r2.yzw = (-r1.xxyz + r2.yyzw).yzw;
/*158*/	    r2.yzw = (r0.wwww * r2.yyzw + r1.xxyz).yzw;
/*159*/	    r0.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*160*/	    r0.w = inversesqrt(r0.w);
/*161*/	    r1.xyz = (r0.wwww * r2.yzwy).xyz;
/*162*/	  }
/*163*/	}
/*164*/	r0.w = vsOut_T7.y * -r4.x + r4.x;
/*165*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*166*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*167*/	r0.xyz = saturate(vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*168*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*169*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*170*/	r0.xyz = (vsOut_T7.zzzz * r2.yzwy + r0.xyzx).xyz;
/*171*/	r2.y = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*172*/	r2.yzw = (-r3.xxyz + r2.yyyy).yzw;
/*173*/	r3.xyz = (vsOut_T7.zzzz * r2.yzwy + r3.xyzx).xyz;
/*174*/	color1.w = saturate(vsOut_T7.z * -r0.w + r0.w);
/*175*/	r0.w = uintBitsToFloat((cb2.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*176*/	r2.y = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*177*/	r2.y = inversesqrt(r2.y);
/*178*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*179*/	color3.x = r1.w / r2.x;
/*180*/	r1.w = max(abs(r1.z), abs(r1.y));
/*181*/	r1.w = max(r1.w, abs(r1.x));
/*182*/	r1.xyz = (r1.xyzx / r1.wwww).xyz;
/*183*/	r4.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*184*/	color0.xyzw = saturate(r4.xyzw);
/*185*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*186*/	r3.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3c008081u));
/*187*/	color2.xyzw = saturate(r3.xyzw);
/*188*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*189*/	color4 = vsOut_P1;
/*190*/	return;
}
