//
//
// Shader Model 4
// Fragment Shader
//
// id: 3766 - fxc/glsl_SM_4_0_WeightedCloth.hlsl_PS_ps30_gbuffer_noclip_40.glsl
//

#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : require

float saturate(float x) { return min(x < 0.f ? 0.f : x, 1.f); }
vec2 saturate(vec2 x) { return min(mix(x, vec2(0), lessThan(x, vec2(0))), vec2(1)); }
vec3 saturate(vec3 x) { return min(mix(x, vec3(0), lessThan(x, vec3(0))), vec3(1)); }
vec4 saturate(vec4 x) { return min(mix(x, vec4(0), lessThan(x, vec4(0))), vec4(1)); }

in vec4 vsOut_T0;
flat in vec4 vsOut_T9;
flat in vec4 vsOut_P1;
in vec4 vsOut_T1;
in vec4 vsOut_T2;
in vec4 vsOut_T3;
in vec4 vsOut_T4;
in vec4 vsOut_T5;
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;
layout(location = 2) out vec4 color2;
layout(location = 3) out vec4 color3;
layout(location = 4) out uint color4;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_specular_colour_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D normal0_sampler;
uniform sampler2D normal1_sampler;
uniform sampler2D s_diffuse_damage_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb1;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb2;

void main()
{
  vec4 r0;
  vec4 r1;
  vec4 r2;
  vec4 r3;
  vec4 r4;
  vec4 r5;
  vec4 r6;

/*0*/	r0.xyzw = (texture(s_diffuse_damage_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -vsOut_T9.x;
/*2*/	r0.xyz = (r0.xyzx + vec4(-1.000000, -1.000000, -1.000000, 0.000000)).xyz;
/*3*/	r0.xyz = (vsOut_T9.xxxx * r0.xyzx + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*4*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*5*/	if(r0.w != 0) discard;
/*6*/	r0.w = vsOut_T9.y * 1.700000 + -0.700000;
/*7*/	r1.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*8*/	r1.w = -r0.w + r1.w;
/*9*/	r0.w = vsOut_T9.y * 1.700000 + -r0.w;
/*10*/	r0.w = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r0.w)).w;
/*11*/	r0.w = saturate(r0.w * r1.w);
/*12*/	r1.w = uintBitsToFloat((r1.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*13*/	if(r1.w != 0) discard;
/*14*/	r2.xyzw = cb0.data[26].xxxx * vec4(1.500000, 0.200000, 0.670000, 0.800000);
/*15*/	r3.xyz = sin(vec3(r2.xyzx));
/*16*/	r1.w = r3.y * r3.x;
/*17*/	r1.w = r3.z * r1.w;
/*18*/	r1.w = r1.w * 0.500000 + 1.000000;
/*19*/	r1.w = r1.w * 0.800000 + r2.w;
/*20*/	r2.xz = (r1.wwww * vec4(0.200000, 0.000000, 0.200000, 0.000000) + vsOut_T1.xxyx).xz;
/*21*/	r3.xyzw = (texture(normal0_sampler, r2.xzxx.st)).xyzw;
/*22*/	r2.xz = (r3.wwyw + vec4(0.001961, 0.000000, 0.001961, 0.000000)).xz;
/*23*/	r3.xy = (r2.xzxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*24*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*25*/	r1.w = -r1.w + 1.000000;
/*26*/	r1.w = max(r1.w, 0.000000);
/*27*/	r3.z = sqrt(r1.w);
/*28*/	r2.xzw = (cb0.data[26].xxxx * vec4(2.500000, 0.000000, 0.300000, 0.870000)).xzw;
/*29*/	r2.xzw = sin(vec3(r2.xxzw));
/*30*/	r1.w = r2.z * r2.x;
/*31*/	r1.w = r2.w * r1.w;
/*32*/	r1.w = r1.w * 0.500000 + 1.000000;
/*33*/	r2.x = r1.w * 0.500000 + r2.y;
/*34*/	r1.w = r1.w * 0.400000;
/*35*/	r2.xy = (r2.xxxx * vec4(0.500000, 0.200000, 0.000000, 0.000000) + vsOut_T1.xyxx).xy;
/*36*/	r2.xyzw = (texture(normal1_sampler, r2.xyxx.st)).xyzw;
/*37*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*38*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r4.xy = (r1.wwww * r2.xyxx).xy;
/*40*/	r1.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*41*/	r1.w = -r1.w + 1.000000;
/*42*/	r1.w = max(r1.w, 0.000000);
/*43*/	r4.z = sqrt(r1.w);
/*44*/	r2.xyz = (r3.xyzx + r4.xyzx).xyz;
/*45*/	r1.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*48*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*49*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*50*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*51*/	r1.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*52*/	r1.w = -r1.w + 1.000000;
/*53*/	r1.w = max(r1.w, 0.000000);
/*54*/	r4.z = sqrt(r1.w);
/*55*/	r3.zw = (vsOut_T1.xxxy * cb1.data[2].xxxy + vsOut_T6.xxxy).zw;
/*56*/	r5.xyzw = (texture(s_decal_dirt_map, r3.zwzz.st)).xyzw;
/*57*/	r3.zw = (r5.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*58*/	r6.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*59*/	r4.xy = (r3.zwzz * r6.wwww + r3.xyxx).xy;
/*60*/	r1.w = r5.w * r6.w;
/*61*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*62*/	r2.w = inversesqrt(r2.w);
/*63*/	r2.xyz = (r4.xyzx * r2.wwww + r2.xyzx).xyz;
/*64*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*65*/	r2.w = inversesqrt(r2.w);
/*66*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*67*/	r2.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*68*/	r2.w = inversesqrt(r2.w);
/*69*/	r3.xyz = (r2.wwww * vsOut_T5.xyzx).xyz;
/*70*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*71*/	r2.y = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*72*/	r2.y = inversesqrt(r2.y);
/*73*/	r4.xyz = (r2.yyyy * vsOut_T3.xyzx).xyz;
/*74*/	r2.xyw = (r2.xxxx * r4.xyxz + r3.xyxz).xyw;
/*75*/	r3.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*76*/	r3.x = inversesqrt(r3.x);
/*77*/	r3.xyz = (r3.xxxx * vsOut_T2.xyzx).xyz;
/*78*/	r2.xyz = (r2.zzzz * r3.xyzx + r2.xywx).xyz;
/*79*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*80*/	r2.w = inversesqrt(r2.w);
/*81*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*82*/	r2.w = max(abs(r2.z), abs(r2.y));
/*83*/	r2.w = max(r2.w, abs(r2.x));
/*84*/	r2.xyz = (r2.xyzx / r2.wwww).xyz;
/*85*/	color0.xyz = saturate(r2.xyzx * vec4(0.500000, 0.500000, 0.500000, 0.000000) + vec4(0.500000, 0.500000, 0.500000, 0.000000)).xyz;
/*86*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*87*/	color0.w = saturate(r2.x);
/*88*/	r2.x = vsOut_T7.y * -r2.y + r2.y;
/*89*/	color1.w = saturate(vsOut_T7.x * -r2.x + r2.x);
/*90*/	r2.xyz = (uintBitsToFloat(uvec4(equal(vsOut_P1.wwww, vec4(1.000000, 2.000000, 3.000000, 0.000000))) * 0xffffffffu)).xyz;
/*91*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.xxxx), uvec4(0)))).xyz;
/*92*/	r3.xyz = (r3.xyzx + -cb2.data[0].xyzx).xyz;
/*93*/	r2.x = saturate(vsOut_P1.w);
/*94*/	r3.xyz = (r2.xxxx * r3.xyzx + cb2.data[0].xyzx).xyz;
/*95*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*96*/	r4.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*97*/	r1.xyz = (r4.xxxx * r3.xyzx + r1.xyzx).xyz;
/*98*/	r3.xyz = (mix(vec4(1.000000, 1.000000, 1.000000, 0), vsOut_P1.xyzx, greaterThan(floatBitsToUint(r2.yyyy), uvec4(0)))).xyz;
/*99*/	r2.yzw = (mix(vec4(0, 1.000000, 1.000000, 1.000000), vsOut_P1.xxyz, greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)))).yzw;
/*100*/	r2.yzw = (r2.yyzw + -cb2.data[2].xxyz).yzw;
/*101*/	r2.yzw = (r2.xxxx * r2.yyzw + cb2.data[2].xxyz).yzw;
/*102*/	r3.xyz = (r3.xyzx + -cb2.data[1].xyzx).xyz;
/*103*/	r3.xyz = (r2.xxxx * r3.xyzx + cb2.data[1].xyzx).xyz;
/*104*/	r3.xyz = (r3.xyzx * r1.xyzx + -r1.xyzx).xyz;
/*105*/	r1.xyz = (r4.yyyy * r3.xyzx + r1.xyzx).xyz;
/*106*/	r2.xyz = (r2.yzwy * r1.xyzx + -r1.xyzx).xyz;
/*107*/	r1.xyz = (r4.zzzz * r2.xyzx + r1.xyzx).xyz;
/*108*/	r2.xyz = (-r1.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*109*/	r1.xyz = (r1.wwww * r2.xyzx + r1.xyzx).xyz;
/*110*/	r2.xyz = (r0.xyzx * r1.xyzx).xyz;
/*111*/	r2.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*112*/	r2.w = saturate(-r2.w * 15.000000 + 1.000000);
/*113*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*114*/	r3.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*115*/	r3.x = log2(r3.z);
/*116*/	r3.x = r3.x * 1.800000;
/*117*/	r3.x = exp2(r3.x);
/*118*/	r3.x = r3.x * 10.000000;
/*119*/	r3.x = min(r3.x, 1.000000);
/*120*/	r2.w = r2.w + r3.x;
/*121*/	r2.w = r2.w * 0.500000;
/*122*/	r3.x = 0;
/*123*/	r3.y = cb0.data[26].x * 0.050000;
/*124*/	r3.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000) + r3.xyxx).xy;
/*125*/	r4.xyzw = (texture(s_fire_map, r3.xyxx.st)).xyzw;
/*126*/	r3.x = saturate(r4.x * 5.000000);
/*127*/	r4.xyz = (r3.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*128*/	r3.x = r3.z * 0.250000;
/*129*/	r4.xyz = (r4.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r3.xxxx).xyz;
/*130*/	r4.xyz = (r2.wwww * r4.xyzx + r3.xxxx).xyz;
/*131*/	r0.xyz = (-r1.xyzx * r0.xyzx + r4.xyzx).xyz;
/*132*/	r1.x = r0.w * -2.000000 + 3.000000;
/*133*/	r0.w = r0.w * r0.w;
/*134*/	r1.xy = (-r1.xxxx * r0.wwww + vec4(1.000000, 0.975000, 0.000000, 0.000000)).xy;
/*135*/	r0.w = -r3.w + 1.000000;
/*136*/	r0.w = log2(r0.w);
/*137*/	r0.w = r0.w * r1.x;
/*138*/	r0.w = exp2(r0.w);
/*139*/	r0.w = min(r0.w, 1.000000);
/*140*/	r0.w = r1.x * r0.w;
/*141*/	r1.x = max(r1.y, 0.000000);
/*142*/	r0.xyz = (r0.wwww * r0.xyzx + r2.xyzx).xyz;
/*143*/	r2.xyz = (r3.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*144*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*145*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*146*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*147*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*148*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*149*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*150*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*151*/	color1.xyz = saturate(sqrt(r0.xyzx)).xyz;
/*152*/	r0.xyzw = (texture(s_specular_colour_map, vsOut_T1.xyxx.st)).xyzw;
/*153*/	r1.xyz = (r1.wwww * r0.xyzx).xyz;
/*154*/	r0.xyz = (r1.xyzx * vec4(-0.990000, -0.990000, -0.990000, 0.000000) + r0.xyzx).xyz;
/*155*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*156*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*157*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*158*/	r1.x = uintBitsToFloat((cb1.data[4].y != 0.000000) ? 0xffffffffu : 0x00000000u);
/*159*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & uint(0x3c008081u));
/*160*/	color2.xyzw = saturate(r0.xyzw);
/*161*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*162*/	r0.w = 1.000000;
/*163*/	r1.x = dot(r0.xyzw, cb0.data[11].xyzw);
/*164*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*165*/	color3.x = r1.x / r0.x;
/*166*/	color3.yzw = (vec4(0, 0, 0, 0)).yzw;
/*167*/	color4 = floatBitsToUint(vsOut_T9.z);
/*168*/	return;
}
