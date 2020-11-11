//
//
// Shader Model 4
// Fragment Shader
//
// id: 1874 - fxc/glsl_SM_4_0_weighted.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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

/*0*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*3*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*4*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*5*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*6*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*7*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*8*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*9*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*10*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*11*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*12*/	if(r0.x != 0) discard;
/*13*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r1.xyz = (cb2.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*16*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyz = (cb2.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyz = (cb2.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*21*/	r0.w = -vsOut_T4.z + 1.000000;
/*22*/	r1.xyz = (vsOut_T4.zzzz * cb2.data[3].xyzx).xyz;
/*23*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*24*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*25*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*26*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*27*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*28*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*29*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*30*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*31*/	r0.w = inversesqrt(r0.w);
/*32*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*33*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*34*/	r0.w = inversesqrt(r0.w);
/*35*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*36*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*37*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*38*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*39*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*40*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*41*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*42*/	r0.w = -r0.w + 1.000000;
/*43*/	r0.w = max(r0.w, 0.000000);
/*44*/	r0.w = sqrt(r0.w);
/*45*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r1.w = inversesqrt(r1.w);
/*47*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*48*/	r1.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*49*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*52*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*53*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*54*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*55*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*56*/	r1.w = r0.w * r3.x + 0.300000;
/*57*/	r1.w = saturate(-r1.w + 1.000000);
/*58*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*59*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*60*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*61*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*62*/	r1.w = -r0.w * r3.x + 1.000000;
/*63*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*64*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*65*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*66*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*67*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*68*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*69*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*70*/	r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*71*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*73*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*74*/	r0.w = dot(vec3(r2.xyzx), vec3(cb1.data[0].yzwy));
/*75*/	r1.w = saturate(r0.w);
/*76*/	r0.w = r0.w + r0.w;
/*77*/	r6.xyz = (r2.xyzx * -r0.wwww + cb1.data[0].yzwy).xyz;
/*78*/	r0.w = r1.w * r1.w;
/*79*/	r7.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*80*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*81*/	r1.w = inversesqrt(r1.w);
/*82*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*83*/	r1.w = saturate(dot(vec3(r7.xyzx), vec3(-cb1.data[0].yzwy)));
/*84*/	r1.w = r1.w * r1.w;
/*85*/	r1.w = r1.w * r1.w;
/*86*/	r0.w = r0.w * r1.w;
/*87*/	r0.w = r4.z * r0.w;
/*88*/	r4.yzw = (r4.yyyy * cb1.data[1].xxyz).yzw;
/*89*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb1.data[1].xxyz).yzw;
/*90*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*91*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*92*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*93*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*94*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*95*/	r0.w = dot(vec3(r6.xyzx), vec3(-r7.xyzx));
/*96*/	r0.w = max(r0.w, 0.000000);
/*97*/	r0.w = log2(r0.w);
/*98*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*99*/	r1.w = r6.x * r6.x;
/*100*/	r2.w = vsOut_T7.x * -r6.y + r6.y;
/*101*/	r2.w = vsOut_T7.y * -r2.w + r2.w;
/*102*/	r1.w = r1.w * 127.000000 + 1.600000;
/*103*/	r0.w = r0.w * r1.w;
/*104*/	r0.w = exp2(r0.w);
/*105*/	r0.w = min(r0.w, 1.000000);
/*106*/	r0.w = r0.w * r2.w;
/*107*/	r4.yzw = (r0.wwww * cb1.data[1].xxyz).yzw;
/*108*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*109*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*110*/	r0.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*111*/	r1.w = r0.w + r0.w;
/*112*/	r0.w = saturate(-r0.w + 1.000000);
/*113*/	r0.w = r0.w * r0.w;
/*114*/	r0.w = r4.x * r0.w;
/*115*/	r0.w = r0.w * 1.500000;
/*116*/	r0.w = r5.w * r0.w;
/*117*/	r4.xyz = (r2.xyzx * -r1.wwww + -r7.xyzx).xyz;
/*118*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*119*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*120*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*121*/	r1.w = inversesqrt(r1.w);
/*122*/	r4.xyz = (r1.wwww * r4.xyzx).xyz;
/*123*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*124*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*125*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*126*/	r6.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*127*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*128*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*129*/	r4.xyw = (r4.xxxx * r7.xyxz + r6.xyxz).xyw;
/*130*/	r4.xyz = (r4.zzzz * r8.xyzx + r4.xywx).xyz;
/*131*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*132*/	r1.x = inversesqrt(r1.x);
/*133*/	r1.x = r1.x * r1.y;
/*134*/	r1.x = max(r1.x, 0.000000);
/*135*/	r0.w = r0.w * r1.x;
/*136*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*137*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*138*/	r0.w = inversesqrt(r0.w);
/*139*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*140*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*141*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*142*/	r6.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*143*/	r4.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*144*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*145*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*146*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*147*/	r2.xyz = (r2.zzzz * r7.xyzx + r2.xywx).xyz;
/*148*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*149*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*150*/	r0.w = r5.z * r5.x;
/*151*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*152*/	color0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*153*/	color0.w = 1.000000;
/*154*/	color1.x = 1.000000;
/*155*/	return;
}
