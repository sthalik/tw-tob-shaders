//
//
// Shader Model 4
// Fragment Shader
//
// id: 616 - fxc/glsl_SM_3_0_rigidleaf_v3.hlsl_PS_ps30_gbuffer_no_clip.glsl
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
/*43*/	r0.w = r0.w + -0.500000;
/*44*/	r0.w = min(r0.w, r1.x);
/*45*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*46*/	if(r0.w != 0) discard;
/*47*/	r0.w = uintBitsToFloat((vsOut_T1.z < 0.500000) ? 0xffffffffu : 0x00000000u);
/*48*/	r1.x = vsOut_T1.z + vsOut_T1.z;
/*49*/	r2.xyz = (-cb2.data[0].xyzx + cb2.data[1].xyzx).xyz;
/*50*/	r1.xzw = (r1.xxxx * r2.xxyz + cb2.data[0].xxyz).xzw;
/*51*/	r1.y = r1.y + r1.y;
/*52*/	r2.xyz = (-cb2.data[1].xyzx + cb2.data[2].xyzx).xyz;
/*53*/	r2.xyz = (r1.yyyy * r2.xyzx + cb2.data[1].xyzx).xyz;
/*54*/	r1.xyz = (mix(r2.xyzx, r1.xzwx, greaterThan(floatBitsToUint(r0.wwww), uvec4(0)))).xyz;
/*55*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*56*/	r3.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*57*/	r4.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*58*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*59*/	r0.w = inversesqrt(r0.w);
/*60*/	r5.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*61*/	r0.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*62*/	r0.w = inversesqrt(r0.w);
/*63*/	r6.xyz = (r0.wwww * vsOut_T4.xyzx).xyz;
/*64*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*65*/	r0.w = inversesqrt(r0.w);
/*66*/	r7.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*67*/	r8.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*68*/	r4.zw = (r8.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*69*/	r4.zw = (r4.zzzw * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*70*/	r0.w = dot(vec2(r4.zwzz), vec2(r4.zwzz));
/*71*/	r0.w = -r0.w + 1.000000;
/*72*/	r0.w = max(r0.w, 0.000000);
/*73*/	r0.w = sqrt(r0.w);
/*74*/	r8.xyz = (r6.xyzx * r4.wwww).xyz;
/*75*/	r8.xyz = (r4.zzzz * r5.xyzx + r8.xyzx).xyz;
/*76*/	r8.xyz = (r0.wwww * r7.xyzx + r8.xyzx).xyz;
/*77*/	r0.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*78*/	r0.w = inversesqrt(r0.w);
/*79*/	r9.xyz = (r0.wwww * r8.xyzx).xyz;
/*80*/	r8.xyz = (-r8.xyzx * r0.wwww + vec4(0.000000, 1.000000, 0.000000, 0.000000)).xyz;
/*81*/	r8.xyz = (r8.xyzx * vec4(0.650000, 0.650000, 0.650000, 0.000000) + r9.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r9.xyz = (r0.wwww * r8.xyzx).xyz;
/*85*/	r1.w = vsOut_T3.w + -1.000000;
/*86*/	r1.w = r1.w * 0.700000 + 1.000000;
/*87*/	r1.w = -r1.w + 1.000000;
/*88*/	r1.w = log2(r1.w);
/*89*/	r1.w = r1.w * 1.500000;
/*90*/	r1.w = exp2(r1.w);
/*91*/	r1.w = -r1.w + 1.000000;
/*92*/	r2.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*93*/	r3.w = -r0.y * r1.y + 0.800000;
/*94*/	r3.w = r3.w * 0.300000 + r2.y;
/*95*/	r4.z = log2(r1.w);
/*96*/	r4.z = r4.z * 1.900000;
/*97*/	r4.z = exp2(r4.z);
/*98*/	r10.xy = (r4.zzzz * vec4(0.068000, 0.320000, 0.000000, 0.000000)).xy;
/*99*/	r10.z = r3.w * 0.600000;
/*100*/	r3.xyz = (mix(r3.xyzx, r10.xxxx, greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xyz;
/*101*/	r4.xw = (mix(r4.xxxy, r10.yyyz, greaterThan(floatBitsToUint(r2.wwww), uvec4(0)))).xw;
/*102*/	r2.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*103*/	if(floatBitsToUint(r2.w) != 0u) {
/*104*/	  r10.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*105*/	  r11.xyzw = (texture(s_snow_normals, r10.xyxx.st)).xyzw;
/*106*/	  r10.xy = (r11.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*107*/	  r11.xy = (r10.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*108*/	  r2.w = dot(vec2(r11.xyxx), vec2(r11.xyxx));
/*109*/	  r2.w = -r2.w + 1.000000;
/*110*/	  r2.w = max(r2.w, 0.000000);
/*111*/	  r11.z = sqrt(r2.w);
/*112*/	  r12.xyz = (r11.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r9.xyzx).xyz;
/*113*/	  r2.w = dot(vec3(r12.xyzx), vec3(r12.xyzx));
/*114*/	  r2.w = inversesqrt(r2.w);
/*115*/	  r12.xyz = (r2.wwww * r12.xyzx).xyz;
/*116*/	  r13.xz = (cb1.data[0].xxyx).xz/**/;
/*117*/	  r13.y = -1.000000;
/*118*/	  r2.w = dot(vec3(r13.xyzx), vec3(r13.xyzx));
/*119*/	  r2.w = inversesqrt(r2.w);
/*120*/	  r13.xyz = (r2.wwww * r13.xyzx).xyz;
/*121*/	  r2.w = saturate(dot(vec3(-r13.xyzx), vec3(r12.xyzx)));
/*122*/	  r3.w = cb1.data[1].x * cb1.data[1].x;
/*123*/	  r3.w = r3.w * 1.250000;
/*124*/	  r3.w = min(r3.w, 1.000000);
/*125*/	  r5.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*126*/	  r5.w = r5.w * 4.000000;
/*127*/	  r3.w = r3.w * 0.200000 + r5.w;
/*128*/	  r3.w = r3.w * -0.700000 + 1.000000;
/*129*/	  r2.w = r2.w + -r3.w;
/*130*/	  r2.w = saturate(r2.w * 200.000000);
/*131*/	  r3.w = r2.w * -2.000000 + 3.000000;
/*132*/	  r2.w = r2.w * r2.w;
/*133*/	  r2.w = r2.w * r3.w;
/*134*/	  r12.w = r2.w * -r4.x + r4.x;
/*135*/	  r3.w = -r4.w + 0.200000;
/*136*/	  r4.w = r2.w * r3.w + r4.w;
/*137*/	  r0.xyz = (-r0.xyzx * r1.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*138*/	  r2.xyz = (r2.wwww * r0.xyzx + r2.xyzx).xyz;
/*139*/	  r0.xyz = (-r3.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*140*/	  r3.xyz = (r2.wwww * r0.xyzx + r3.xyzx).xyz;
/*141*/	  r10.xyzw = (texture(s_snow_normals, r10.zwzz.st)).xyzw;
/*142*/	  r0.xy = (r10.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*143*/	  r0.xy = (r0.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*144*/	  r1.x = dot(vec2(r0.xyxx), vec2(r0.xyxx));
/*145*/	  r1.x = -r1.x + 1.000000;
/*146*/	  r1.x = max(r1.x, 0.000000);
/*147*/	  r0.z = sqrt(r1.x);
/*148*/	  r1.xyz = (r11.xyzx + r11.xyzx).xyz;
/*149*/	  r3.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*150*/	  r3.w = sqrt(r3.w);
/*151*/	  r0.xyz = (r1.xyzx * r3.wwww + r0.xyzx).xyz;
/*152*/	  r1.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*153*/	  r1.x = inversesqrt(r1.x);
/*154*/	  r0.xyz = (r0.xyzx * r1.xxxx).xyz;
/*155*/	  r1.xyz = (r6.xyzx * r0.yyyy).xyz;
/*156*/	  r1.xyz = (r0.xxxx * r5.xyzx + r1.xyzx).xyz;
/*157*/	  r0.xyz = (r0.zzzz * r7.xyzx + r1.xyzx).xyz;
/*158*/	  r1.x = r2.w * 0.700000;
/*159*/	  r1.y = -r8.y * r0.w + 1.000000;
/*160*/	  r1.x = min(r1.y, r1.x);
/*161*/	  r0.xyz = (-r8.xyzx * r0.wwww + r0.xyzx).xyz;
/*162*/	  r0.xyz = (r1.xxxx * r0.xyzx + r9.xyzx).xyz;
/*163*/	  r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*164*/	  r0.w = inversesqrt(r0.w);
/*165*/	  r9.xyz = (r0.wwww * r0.xyzx).xyz;
/*166*/	} else {
/*167*/	  r12.w = r4.x;
/*168*/	}
/*169*/	r0.xyz = (r1.wwww * r2.xyzx).xyz;
/*170*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*171*/	r1.w = 1.000000;
/*172*/	r0.w = dot(r1.xyzw, cb0.data[11].xyzw);
/*173*/	r1.x = dot(r1.xyzw, cb0.data[12].xyzw);
/*174*/	r1.y = dot(vec3(r9.xyzx), vec3(r9.xyzx));
/*175*/	r1.y = inversesqrt(r1.y);
/*176*/	r1.yzw = (r1.yyyy * r9.xxyz).yzw;
/*177*/	color3.x = r0.w / r1.x;
/*178*/	r0.w = max(abs(r1.w), abs(r1.z));
/*179*/	r0.w = max(r0.w, abs(r1.y));
/*180*/	r1.xyz = (r1.yzwy / r0.wwww).xyz;
/*181*/	r12.xyz = (r1.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*182*/	color0.xyzw = saturate(r12.xyzw);
/*183*/	r4.xyz = (sqrt(r0.xyzx)).xyz;
/*184*/	color1.xyzw = saturate(r4.xyzw);
/*185*/	color2.xyz = saturate(r3.xyzx).xyz;
/*186*/	color2.w = 0;
/*187*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*188*/	color4 = vsOut_P1;
/*189*/	return;
}
