//
//
// Shader Model 4
// Fragment Shader
//
// id: 1872 - fxc/glsl_SM_4_0_weighted.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_skin_mask_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
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
  vec4 r7;
  vec4 r8;

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*5*/	r1.w = 1.000000;
/*6*/	r2.x = dot(r1.xyzw, cb0.data[9].xyzw);
/*7*/	r2.y = dot(r1.xyzw, cb0.data[10].xyzw);
/*8*/	r0.w = dot(r1.xyzw, cb0.data[12].xyzw);
/*9*/	r1.xy = (r2.xyxx / r0.wwww).xy;
/*10*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*11*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*12*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*13*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*15*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*16*/	if(r0.w != 0) discard;
/*17*/	r1.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*19*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*21*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*22*/	r1.xyz = (cb2.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*23*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*24*/	r0.w = -vsOut_T4.z + 1.000000;
/*25*/	r1.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*26*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*27*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*28*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*29*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*30*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*31*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*32*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*33*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*36*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*37*/	r0.w = inversesqrt(r0.w);
/*38*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*39*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*40*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*41*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*42*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*43*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*44*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*45*/	r0.w = -r0.w + 1.000000;
/*46*/	r0.w = max(r0.w, 0.000000);
/*47*/	r0.w = sqrt(r0.w);
/*48*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r1.w = inversesqrt(r1.w);
/*50*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*51*/	r1.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*52*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*53*/	r0.w = inversesqrt(r0.w);
/*54*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*55*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*56*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*57*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*58*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*59*/	r1.w = r0.w * r3.x + 0.300000;
/*60*/	r1.w = saturate(-r1.w + 1.000000);
/*61*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*62*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*63*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*64*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*65*/	r1.w = -r0.w * r3.x + 1.000000;
/*66*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*67*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*68*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*69*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*70*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*71*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*72*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*73*/	r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*74*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*75*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*76*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*77*/	r0.w = dot(vec3(r2.xyzx), vec3(cb1.data[0].yzwy));
/*78*/	r1.w = saturate(r0.w);
/*79*/	r0.w = r0.w + r0.w;
/*80*/	r6.xyz = (r2.xyzx * -r0.wwww + cb1.data[0].yzwy).xyz;
/*81*/	r0.w = r1.w * r1.w;
/*82*/	r7.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*83*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*84*/	r1.w = inversesqrt(r1.w);
/*85*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*86*/	r1.w = saturate(dot(vec3(r7.xyzx), vec3(-cb1.data[0].yzwy)));
/*87*/	r1.w = r1.w * r1.w;
/*88*/	r1.w = r1.w * r1.w;
/*89*/	r0.w = r0.w * r1.w;
/*90*/	r0.w = r4.z * r0.w;
/*91*/	r4.yzw = (r4.yyyy * cb1.data[1].xxyz).yzw;
/*92*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb1.data[1].xxyz).yzw;
/*93*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*94*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*95*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*96*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*97*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*98*/	r0.w = dot(vec3(r6.xyzx), vec3(-r7.xyzx));
/*99*/	r0.w = max(r0.w, 0.000000);
/*100*/	r0.w = log2(r0.w);
/*101*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*102*/	r1.w = r6.x * r6.x;
/*103*/	r2.w = vsOut_T7.x * -r6.y + r6.y;
/*104*/	r2.w = vsOut_T7.y * -r2.w + r2.w;
/*105*/	r1.w = r1.w * 127.000000 + 1.600000;
/*106*/	r0.w = r0.w * r1.w;
/*107*/	r0.w = exp2(r0.w);
/*108*/	r0.w = min(r0.w, 1.000000);
/*109*/	r0.w = r0.w * r2.w;
/*110*/	r4.yzw = (r0.wwww * cb1.data[1].xxyz).yzw;
/*111*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*112*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*113*/	r0.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*114*/	r1.w = r0.w + r0.w;
/*115*/	r0.w = saturate(-r0.w + 1.000000);
/*116*/	r0.w = r0.w * r0.w;
/*117*/	r0.w = r4.x * r0.w;
/*118*/	r0.w = r0.w * 1.500000;
/*119*/	r0.w = r5.w * r0.w;
/*120*/	r4.xyz = (r2.xyzx * -r1.wwww + -r7.xyzx).xyz;
/*121*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*122*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*123*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*124*/	r1.w = inversesqrt(r1.w);
/*125*/	r4.xyz = (r1.wwww * r4.xyzx).xyz;
/*126*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*127*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*128*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*129*/	r6.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*130*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*131*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*132*/	r4.xyw = (r4.xxxx * r7.xyxz + r6.xyxz).xyw;
/*133*/	r4.xyz = (r4.zzzz * r8.xyzx + r4.xywx).xyz;
/*134*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*135*/	r1.x = inversesqrt(r1.x);
/*136*/	r1.x = r1.x * r1.y;
/*137*/	r1.x = max(r1.x, 0.000000);
/*138*/	r0.w = r0.w * r1.x;
/*139*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*140*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*141*/	r0.w = inversesqrt(r0.w);
/*142*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*143*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*144*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*145*/	r6.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*146*/	r4.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*147*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*148*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*149*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*150*/	r2.xyz = (r2.zzzz * r7.xyzx + r2.xywx).xyz;
/*151*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*152*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*153*/	r0.w = r5.z * r5.x;
/*154*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*155*/	color0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*156*/	color0.w = 1.000000;
/*157*/	color1.x = 1.000000;
/*158*/	return;
}
