//
//
// Shader Model 4
// Fragment Shader
//
// id: 614 - fxc/glsl_SM_3_0_rigidleaf_v3.hlsl_PS_ps30_gbuffer.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
flat in uint vsOut_P1;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_diffuse_burn_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_dissolve_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_snow_normals;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform weather_shared
{
  vec4 data[3];
} cb1;
layout(std140) uniform vegetation_tint_colours
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
  vec4 r12;
  vec4 r13;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;
  vec4 r7;
  vec4 r8;
  vec4 r9;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*1*/	r1.xyzw = (texture(s_diffuse_burn_map, vsOut_T1.xyxx.st, -0.870000)).xyzw;
/*2*/	r1.xyzw = -r0.xyzw + r1.xyzw;
/*3*/	r0.xyz = (vsOut_T1.wwww * r1.xyzx + r0.xyzx).xyz;
/*4*/	r1.x = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*5*/	r2.xyz = (r0.xyzx / r0.wwww).xyz;
/*6*/	r0.xyz = (mix(r0.xyzx, r2.xyzx, greaterThan(floatBitsToUint(r1.xxxx), uvec4(0)))).xyz;
/*7*/	r2.xyzw = vsOut_T1.xyxy * vec4(0.600000, 0.600000, 10.000000, 10.000000);
/*8*/	r1.x = r2.x;
/*9*/	r1.y = cb0.data[26].x * 0.050000 + r2.y;
/*10*/	r3.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*11*/	r4.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*12*/	r1.x = saturate(r3.x * 5.000000);
/*13*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*14*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*15*/	r2.x = saturate(-r2.x * 15.000000 + 1.000000);
/*16*/	r2.y = log2(r4.z);
/*17*/	r2.y = r2.y * 1.800000;
/*18*/	r2.y = exp2(r2.y);
/*19*/	r2.y = r2.y * 10.000000;
/*20*/	r2.y = min(r2.y, 1.000000);
/*21*/	r2.x = r2.y + r2.x;
/*22*/	r2.x = r2.x * 0.500000;
/*23*/	r2.y = -r4.w + 1.000000;
/*24*/	r2.y = log2(r2.y);
/*25*/	r2.y = r2.y * vsOut_T1.w;
/*26*/	r2.y = exp2(r2.y);
/*27*/	r2.y = min(r2.y, 1.000000);
/*28*/	r2.y = r2.y * vsOut_T1.w;
/*29*/	r3.x = r4.z * 0.250000;
/*30*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.xxxx).xyz;
/*31*/	r1.xyz = (r2.xxxx * r1.xyzx + r3.xxxx).xyz;
/*32*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*33*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*34*/	r1.xy = (vsOut_T1.wzww + vec4(-0.025000, -0.500000, 0.000000, 0.000000)).xy;
/*35*/	r1.x = max(r1.x, 0.000000);
/*36*/	r3.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*37*/	r0.xyz = (r1.xxxx * r3.xyzx + r0.xyzx).xyz;
/*38*/	r1.x = saturate(vsOut_T1.w);
/*39*/	r0.w = saturate(r1.x * r1.w + r0.w);
/*40*/	r2.xyzw = (texture(s_dissolve_map, r2.zwzz.st)).xyzw;
/*41*/	r1.x = vsOut_T1.w * vsOut_T1.w + 0.050000;
/*42*/	r1.x = r2.x * r0.w + -r1.x;
/*43*/	r1.z = saturate(r2.x + vsOut_T2.w);
/*44*/	r0.w = -r1.z * vsOut_T2.w + r0.w;
/*45*/	r0.w = r0.w + -0.500000;
/*46*/	r0.w = min(r0.w, r1.x);
/*47*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*48*/	if(r0.w != 0) discard;
/*49*/	r0.w = uintBitsToFloat((vsOut_T1.z < 0.500000) ? 0xffffffffu : 0x00000000u);
/*50*/	r1.x = vsOut_T1.z + vsOut_T1.z;
/*51*/	r2.xyz = (-cb2.data[0].xyzx + cb2.data[1].xyzx).xyz;
/*52*/	r1.xzw = (r1.xxxx * r2.xxyz + cb2.data[0].xxyz).xzw;
/*53*/	r1.y = r1.y + r1.y;
/*54*/	r2.xyz = (-cb2.data[1].xyzx + cb2.data[2].xyzx).xyz;
/*55*/	r2.xyz = (r1.yyyy * r2.xyzx + cb2.data[1].xyzx).xyz;
/*56*/	r1.xyz = (mix(r2.xyzx, r1.xzwx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*57*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*58*/	r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*59*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*60*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r5.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*63*/	r0.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r6.xyz = (r0.wwww * vsOut_T4.xyzx).xyz;
/*66*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r7.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r8.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*70*/	r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*71*/	r4.zw = (r4.zzzw * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*72*/	r0.w = dot(vec2(r4.zwzz), vec2(r4.zwzz));
/*73*/	r0.w = -r0.w + 1.000000;
/*74*/	r0.w = max(r0.w, 0.000000);
/*75*/	r0.w = sqrt(r0.w);
/*76*/	r8.xyz = (r6.xyzx * r4.wwww).xyz;
/*77*/	r8.xyz = (r4.zzzz * r5.xyzx + r8.xyzx).xyz;
/*78*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*79*/	r0.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*80*/	r0.w = inversesqrt(r0.w);
/*81*/	r9.xyz = (r0.wwww * r8.xyzx).xyz;
/*82*/	r8.xyz = (-r8.xyzx * r0.wwww + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*83*/	r8.xyz = (r8.xyzx * vec4(0.650000, 0.650000, 0.650000, 0.000000) + r9.xyzx).xyz;
/*84*/	r0.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*85*/	r0.w = inversesqrt(r0.w);
/*86*/	r9.xyz = (r0.wwww * r8.xyzx).xyz;
/*87*/	r1.w = vsOut_T3.w + -1.000000;
/*88*/	r1.w = r1.w * 0.700000 + 1.000000;
/*89*/	r1.w = -r1.w + 1.000000;
/*90*/	r1.w = log2(r1.w);
/*91*/	r1.w = r1.w * 1.500000;
/*92*/	r1.w = exp2(r1.w);
/*93*/	r1.w = -r1.w + 1.000000;
/*94*/	r2.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*95*/	r3.w = -r0.y * r1.y + 0.800000;
/*96*/	r3.w = r3.w * 0.300000 + r2.y;
/*97*/	r4.z = log2(r1.w);
/*98*/	r4.z = r4.z * 1.900000;
/*99*/	r4.z = exp2(r4.z);
/*100*/	r10.xy = (r4.zzzz * vec4(0.068000, 0.320000, 0.000000, 0.000000)).xy;
/*101*/	r10.z = r3.w * 0.600000;
/*102*/	r3.xyz = (mix(r3.xyzx, r10.xxxx, greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*103*/	r4.xw = (mix(r4.xxxy, r10.yyyz, greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xw;
/*104*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*105*/	if(floatBitsToUint(r2.w) != 0u) {
/*106*/	  r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*107*/	  r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*108*/	  r10.xy = (r11.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*109*/	  r11.xy = (r10.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*110*/	  r2.w = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*111*/	  r2.w = -r2.w + 1.000000;
/*112*/	  r2.w = max(r2.w, 0.000000);
/*113*/	  r11.z = sqrt(r2.w);
/*114*/	  r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r9.xyzx).xyz;
/*115*/	  r2.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*116*/	  r2.w = inversesqrt(r2.w);
/*117*/	  r12.xyz = (r2.wwww * r12.xyzx).xyz;
/*118*/	  r13.xz = (cb1.data[0].xxyx).xz/**/;
/*119*/	  r13.y = -1.000000;
/*120*/	  r2.w = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*121*/	  r2.w = inversesqrt(r2.w);
/*122*/	  r13.xyz = (r2.wwww * r13.xyzx).xyz;
/*123*/	  r2.w = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*124*/	  r3.w = cb1.data[1].x * cb1.data[1].x;
/*125*/	  r3.w = r3.w * 1.250000;
/*126*/	  r3.w = min(r3.w, 1.000000);
/*127*/	  r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*128*/	  r5.w = r5.w * 4.000000;
/*129*/	  r3.w = r3.w * 0.200000 + r5.w;
/*130*/	  r3.w = r3.w * -0.700000 + 1.000000;
/*131*/	  r2.w = r2.w + -r3.w;
/*132*/	  r2.w = saturate(r2.w * 200.000000);
/*133*/	  r3.w = r2.w * -2.000000 + 3.000000;
/*134*/	  r2.w = r2.w * r2.w;
/*135*/	  r2.w = r2.w * r3.w;
/*136*/	  r12.w = r2.w * -r4.x + r4.x;
/*137*/	  r3.w = -r4.w + 0.200000;
/*138*/	  r4.w = r2.w * r3.w + r4.w;
/*139*/	  r0.xyz = (-r0.xyzx * r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*140*/	  r2.xyz = (r2.wwww * r0.xyzx + r2.xyzx).xyz;
/*141*/	  r0.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*142*/	  r3.xyz = (r2.wwww * r0.xyzx + r3.xyzx).xyz;
/*143*/	  r10.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*144*/	  r0.xy = (r10.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*145*/	  r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*146*/	  r1.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*147*/	  r1.x = -r1.x + 1.000000;
/*148*/	  r1.x = max(r1.x, 0.000000);
/*149*/	  r0.z = sqrt(r1.x);
/*150*/	  r1.xyz = (r11.xyzx + r11.xyzx).xyz;
/*151*/	  r3.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*152*/	  r3.w = sqrt(r3.w);
/*153*/	  r0.xyz = (r1.xyzx * r3.wwww + r0.xyzx).xyz;
/*154*/	  r1.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*155*/	  r1.x = inversesqrt(r1.x);
/*156*/	  r0.xyz = (r0.xyzx * r1.xxxx).xyz;
/*157*/	  r1.xyz = (r6.xyzx * r0.yyyy).xyz;
/*158*/	  r1.xyz = (r0.xxxx * r5.xyzx + r1.xyzx).xyz;
/*159*/	  r0.xyz = (r0.zzzz * r7.xyzx + r1.xyzx).xyz;
/*160*/	  r1.x = r2.w * 0.700000;
/*161*/	  r1.y = -r8.y * r0.w + 1.000000;
/*162*/	  r1.x = min(r1.y, r1.x);
/*163*/	  r0.xyz = (-r8.xyzx * r0.wwww + r0.xyzx).xyz;
/*164*/	  r0.xyz = (r1.xxxx * r0.xyzx + r9.xyzx).xyz;
/*165*/	  r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*166*/	  r0.w = inversesqrt(r0.w);
/*167*/	  r9.xyz = (r0.wwww * r0.xyzx).xyz;
/*168*/	} else {
/*169*/	  r12.w = r4.x;
/*170*/	}
/*171*/	r0.xyz = (r1.wwww * r2.xyzx).xyz;
/*172*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*173*/	r1.w = 1.000000;
/*174*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*175*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*176*/	r1.y = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*177*/	r1.y = inversesqrt(r1.y);
/*178*/	r1.yzw = (r1.yyyy * r9.xxyz).yzw;
/*179*/	color3.x = r0.w / r1.x;
/*180*/	r0.w = max(abs(r1.w), abs(r1.z));
/*181*/	r0.w = max(r0.w, abs(r1.y));
/*182*/	r1.xyz = (r1.yzwy / r0.wwww).xyz;
/*183*/	r12.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*184*/	color0.xyzw = saturate(r12.xyzw);
/*185*/	r4.xyz = (sqrt(r0.xyzx)).xyz;
/*186*/	color1.xyzw = saturate(r4.xyzw);
/*187*/	color2.xyz = saturate(r3.xyzx).xyz;
/*188*/	color2.w = 0;
/*189*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*190*/	color4 = vsOut_P1;
/*191*/	return;
}
