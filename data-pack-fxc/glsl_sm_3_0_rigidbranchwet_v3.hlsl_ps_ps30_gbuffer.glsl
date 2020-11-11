//
//
// Shader Model 4
// Fragment Shader
//
// id: 585 - fxc/glsl_SM_3_0_rigidbranchwet_v3.hlsl_PS_ps30_gbuffer.glsl
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

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r10;
  vec4 r11;
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
/*3*/	r0.xyzw = vsOut_T1.zzzz * r1.xyzw + r0.xyzw;
/*4*/	r1.xy = (vsOut_T1.xyxx * vec4(0.600000, 0.600000, 0.000000, 0.000000)).xy;
/*5*/	r2.x = r1.x;
/*6*/	r2.y = cb0.data[26].x * 0.050000 + r1.y;
/*7*/	r2.xyzw = (texture(s_fire_map, r2.xyxx.st)).xyzw;
/*8*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*9*/	r1.x = saturate(r2.x * 5.000000);
/*10*/	r2.xyzw = r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 1.000000);
/*11*/	r1.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*12*/	r1.x = saturate(-r1.x * 15.000000 + 1.000000);
/*13*/	r1.y = log2(r1.z);
/*14*/	r1.y = r1.y * 1.800000;
/*15*/	r1.y = exp2(r1.y);
/*16*/	r1.y = r1.y * 10.000000;
/*17*/	r1.y = min(r1.y, 1.000000);
/*18*/	r1.x = r1.y + r1.x;
/*19*/	r1.x = r1.x * 0.500000;
/*20*/	r1.y = -r1.w + 1.000000;
/*21*/	r1.y = log2(r1.y);
/*22*/	r1.y = r1.y * vsOut_T1.z;
/*23*/	r1.y = exp2(r1.y);
/*24*/	r1.y = min(r1.y, 1.000000);
/*25*/	r1.y = r1.y * vsOut_T1.z;
/*26*/	r3.xyz = (r1.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000)).xyz;
/*27*/	r3.w = 1.000000;
/*28*/	r2.xyzw = r2.xyzw * vec4(2.000000, 2.000000, 2.000000, 2.000000) + -r3.zzzw;
/*29*/	r2.xyzw = r1.xxxx * r2.xyzw + r3.zzzw;
/*30*/	r2.xyzw = -r0.xyzw + r2.xyzw;
/*31*/	r0.xyzw = r1.yyyy * r2.xyzw + r0.xyzw;
/*32*/	r1.x = vsOut_T1.z + -0.025000;
/*33*/	r1.x = max(r1.x, 0.000000);
/*34*/	r2.xyzw = -r0.xyzw + r3.xyzw;
/*35*/	r0.xyzw = r1.xxxx * r2.xyzw + r0.xyzw;
/*36*/	r0.w = r0.w + -0.500000;
/*37*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*38*/	if(r0.w != 0) discard;
/*39*/	r1.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*40*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*41*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*42*/	r0.w = inversesqrt(r0.w);
/*43*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*44*/	r0.w = dot(vec3(vsOut_T4.xyzx), vec3(vsOut_T4.xyzx));
/*45*/	r0.w = inversesqrt(r0.w);
/*46*/	r4.xyz = (r0.wwww * vsOut_T4.xyzx).xyz;
/*47*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*48*/	r0.w = inversesqrt(r0.w);
/*49*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*50*/	r6.xyzw = (texture(s_normal_map, vsOut_T1.xyxx.st)).xyzw;
/*51*/	r2.zw = (r6.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*52*/	r2.zw = (r2.zzzw * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*53*/	r0.w = dot(vec2(r2.zwzz), vec2(r2.zwzz));
/*54*/	r0.w = -r0.w + 1.000000;
/*55*/	r0.w = max(r0.w, 0.000000);
/*56*/	r0.w = sqrt(r0.w);
/*57*/	r6.xyz = (r4.xyzx * r2.wwww).xyz;
/*58*/	r6.xyz = (r2.zzzz * r3.xyzx + r6.xyzx).xyz;
/*59*/	r6.xyz = (r0.wwww * r5.xyzx + r6.xyzx).xyz;
/*60*/	r0.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r7.xyz = (r0.wwww * r6.xyzx).xyz;
/*63*/	r1.w = uintBitsToFloat((floatBitsToInt(cb1.data[1].y) == int(1)) ? 0xffffffffu : 0x00000000u) /**/;
/*64*/	r1.xyz = (mix(r1.xyzx, vec4(0.250000, 0.250000, 0.250000, 0), greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xyz;
/*65*/	r2.xw = (mix(r2.xxxy, vec4(0.250000, 0, 0, 0.125000), greaterThan(floatBitsToUint(r1.wwww), uvec4(0)))).xw;
/*66*/	r1.w = uintBitsToFloat((0.000000 < cb1.data[1].x) ? 0xffffffffu : 0x00000000u);
/*67*/	if(floatBitsToUint(r1.w) != 0u) {
/*68*/	  r8.xyzw = vsOut_T0.xzxz * vec4(0.000500, 0.000500, 0.070000, 0.070000);
/*69*/	  r9.xyzw = (texture(s_snow_normals, r8.xyxx.st)).xyzw;
/*70*/	  r8.xy = (r9.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*71*/	  r9.xy = (r8.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*72*/	  r1.w = dot(vec2(r9.xyxx), vec2(r9.xyxx));
/*73*/	  r1.w = -r1.w + 1.000000;
/*74*/	  r1.w = max(r1.w, 0.000000);
/*75*/	  r9.z = sqrt(r1.w);
/*76*/	  r10.xyz = (r9.xzyx * vec4(0.100000, 0.100000, 0.100000, 0.000000) + r7.xyzx).xyz;
/*77*/	  r1.w = dot(vec3(r10.xyzx), vec3(r10.xyzx));
/*78*/	  r1.w = inversesqrt(r1.w);
/*79*/	  r10.xyz = (r1.wwww * r10.xyzx).xyz;
/*80*/	  r11.xz = (cb1.data[0].xxyx).xz/**/;
/*81*/	  r11.y = -1.000000;
/*82*/	  r1.w = dot(vec3(r11.xyzx), vec3(r11.xyzx));
/*83*/	  r1.w = inversesqrt(r1.w);
/*84*/	  r11.xyz = (r1.wwww * r11.xyzx).xyz;
/*85*/	  r1.w = saturate(dot(vec3(-r11.xyzx), vec3(r10.xyzx)));
/*86*/	  r3.w = cb1.data[1].x * cb1.data[1].x;
/*87*/	  r3.w = r3.w * 1.250000;
/*88*/	  r3.w = min(r3.w, 1.000000);
/*89*/	  r4.w = saturate(cb1.data[1].x * cb1.data[1].x + -0.800000);
/*90*/	  r4.w = r4.w * 4.000000;
/*91*/	  r3.w = r3.w * 0.200000 + r4.w;
/*92*/	  r3.w = r3.w * -0.700000 + 1.000000;
/*93*/	  r1.w = r1.w + -r3.w;
/*94*/	  r1.w = saturate(r1.w * 200.000000);
/*95*/	  r3.w = r1.w * -2.000000 + 3.000000;
/*96*/	  r1.w = r1.w * r1.w;
/*97*/	  r1.w = r1.w * r3.w;
/*98*/	  r10.w = r1.w * -r2.x + r2.x;
/*99*/	  r3.w = -r2.w + 0.200000;
/*100*/	  r2.w = r1.w * r3.w + r2.w;
/*101*/	  r11.xyz = (-r0.xyzx + vec4(0.400000, 0.400000, 0.400000, 0.000000)).xyz;
/*102*/	  r0.xyz = (r1.wwww * r11.xyzx + r0.xyzx).xyz;
/*103*/	  r11.xyz = (-r1.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*104*/	  r1.xyz = (r1.wwww * r11.xyzx + r1.xyzx).xyz;
/*105*/	  r8.xyzw = (texture(s_snow_normals, r8.zwzz.st)).xyzw;
/*106*/	  r8.xy = (r8.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*107*/	  r8.xy = (r8.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*108*/	  r3.w = dot(vec2(r8.xyxx), vec2(r8.xyxx));
/*109*/	  r3.w = -r3.w + 1.000000;
/*110*/	  r3.w = max(r3.w, 0.000000);
/*111*/	  r8.z = sqrt(r3.w);
/*112*/	  r9.xyz = (r9.xyzx + r9.xyzx).xyz;
/*113*/	  r3.w = dot(vec2(cb1.data[0].xyxx), vec2(cb1.data[0].xyxx));
/*114*/	  r3.w = sqrt(r3.w);
/*115*/	  r8.xyz = (r9.xyzx * r3.wwww + r8.xyzx).xyz;
/*116*/	  r3.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*117*/	  r3.w = inversesqrt(r3.w);
/*118*/	  r8.xyz = (r3.wwww * r8.xyzx).xyz;
/*119*/	  r4.xyz = (r4.xyzx * r8.yyyy).xyz;
/*120*/	  r3.xyz = (r8.xxxx * r3.xyzx + r4.xyzx).xyz;
/*121*/	  r3.xyz = (r8.zzzz * r5.xyzx + r3.xyzx).xyz;
/*122*/	  r3.w = -r6.y * r0.w + 1.000000;
/*123*/	  r1.w = min(r1.w, r3.w);
/*124*/	  r3.xyz = (-r6.xyzx * r0.wwww + r3.xyzx).xyz;
/*125*/	  r3.xyz = (r1.wwww * r3.xyzx + r7.xyzx).xyz;
/*126*/	  r0.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*127*/	  r0.w = inversesqrt(r0.w);
/*128*/	  r7.xyz = (r0.wwww * r3.xyzx).xyz;
/*129*/	} else {
/*130*/	  r10.w = r2.x;
/*131*/	}
/*132*/	r3.xyz = (vsOut_T0.xyzx).xyz;
/*133*/	r3.w = 1.000000;
/*134*/	r0.w = dot(r3.xyzw, cb0.data[11].xyzw);
/*135*/	r1.w = dot(r3.xyzw, cb0.data[12].xyzw);
/*136*/	r3.x = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*137*/	r3.x = inversesqrt(r3.x);
/*138*/	r3.xyz = (r3.xxxx * r7.xyzx).xyz;
/*139*/	color3.x = r0.w / r1.w;
/*140*/	r0.w = max(abs(r3.z), abs(r3.y));
/*141*/	r0.w = max(r0.w, abs(r3.x));
/*142*/	r3.xyz = (r3.xyzx / r0.wwww).xyz;
/*143*/	r10.xyz = (r3.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*144*/	color0.xyzw = saturate(r10.xyzw);
/*145*/	r2.xyz = (sqrt(r0.xyzx)).xyz;
/*146*/	color1.xyzw = saturate(r2.xyzw);
/*147*/	color2.xyz = saturate(r1.xyzx).xyz;
/*148*/	color2.w = 0;
/*149*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*150*/	color4 = vsOut_P1;
/*151*/	return;
}
