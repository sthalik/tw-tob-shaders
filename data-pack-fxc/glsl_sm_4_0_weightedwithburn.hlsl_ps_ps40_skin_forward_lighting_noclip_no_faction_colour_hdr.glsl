//
//
// Shader Model 4
// Fragment Shader
//
// id: 2229 - fxc/glsl_SM_4_0_weightedwithburn.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
in vec4 vsOut_T5;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_skin_mask_map;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;

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
/*13*/	r0.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*14*/	r1.x = r0.x;
/*15*/	r1.y = cb0.data[26].x * 0.050000 + r0.y;
/*16*/	r0.xyzw = (texture(s_fire_map, r0.xyxx.st)).xyzw;
/*17*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*18*/	r0.x = saturate(r1.x * 5.000000);
/*19*/	r1.xyz = (r0.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*20*/	r0.x = r0.z * 0.250000;
/*21*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r0.xxxx).xyz;
/*22*/	r0.y = log2(r0.z);
/*23*/	r0.y = r0.y * 1.800000;
/*24*/	r0.y = exp2(r0.y);
/*25*/	r0.y = r0.y * 10.000000;
/*26*/	r0.y = min(r0.y, 1.000000);
/*27*/	r2.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r1.w = dot(vec3(r2.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*29*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*30*/	r0.y = r0.y + r1.w;
/*31*/	r0.y = r0.y * 0.500000;
/*32*/	r1.xyz = (r0.yyyy * r1.xyzx + r0.xxxx).xyz;
/*33*/	r1.xyz = (-r2.xyzx + r1.xyzx).xyz;
/*34*/	r0.x = -r0.w + 1.000000;
/*35*/	r0.x = log2(r0.x);
/*36*/	r0.x = r0.x * vsOut_T7.z;
/*37*/	r0.x = exp2(r0.x);
/*38*/	r0.x = min(r0.x, 1.000000);
/*39*/	r0.x = r0.x * vsOut_T7.z;
/*40*/	r0.xyw = (r0.xxxx * r1.xyxz + r2.xyxz).xyw;
/*41*/	r1.xyz = (r0.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*42*/	r0.z = vsOut_T7.z + -0.025000;
/*43*/	r0.z = max(r0.z, 0.000000);
/*44*/	r0.xyz = (r0.zzzz * r1.xyzx + r0.xywx).xyz;
/*45*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*46*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*47*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*48*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*49*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*50*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*51*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*54*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*57*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*58*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*59*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*60*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*61*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*62*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*63*/	r0.w = -r0.w + 1.000000;
/*64*/	r0.w = max(r0.w, 0.000000);
/*65*/	r0.w = sqrt(r0.w);
/*66*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r1.w = inversesqrt(r1.w);
/*68*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r1.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*70*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*71*/	r0.w = inversesqrt(r0.w);
/*72*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*73*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*74*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*75*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*76*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*77*/	r1.w = r0.w * r3.x + 0.300000;
/*78*/	r1.w = saturate(-r1.w + 1.000000);
/*79*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*80*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*81*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*82*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*83*/	r1.w = -r0.w * r3.x + 1.000000;
/*84*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*85*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*86*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*87*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*88*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*89*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*90*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*91*/	r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*92*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*93*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*94*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*95*/	r0.w = dot(vec3(r2.xyzx), vec3(cb1.data[0].yzwy));
/*96*/	r1.w = saturate(r0.w);
/*97*/	r0.w = r0.w + r0.w;
/*98*/	r6.xyz = (r2.xyzx * -r0.wwww + cb1.data[0].yzwy).xyz;
/*99*/	r0.w = r1.w * r1.w;
/*100*/	r7.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*101*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*102*/	r1.w = inversesqrt(r1.w);
/*103*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*104*/	r1.w = saturate(dot(vec3(r7.xyzx), vec3(-cb1.data[0].yzwy)));
/*105*/	r1.w = r1.w * r1.w;
/*106*/	r1.w = r1.w * r1.w;
/*107*/	r0.w = r0.w * r1.w;
/*108*/	r0.w = r4.z * r0.w;
/*109*/	r4.yzw = (r4.yyyy * cb1.data[1].xxyz).yzw;
/*110*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb1.data[1].xxyz).yzw;
/*111*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*112*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*113*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*114*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*115*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*116*/	r0.w = dot(vec3(r6.xyzx), vec3(-r7.xyzx));
/*117*/	r0.w = max(r0.w, 0.000000);
/*118*/	r0.w = log2(r0.w);
/*119*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*120*/	r1.w = r6.x * r6.x;
/*121*/	r2.w = vsOut_T7.x * -r6.y + r6.y;
/*122*/	r2.w = vsOut_T7.y * -r2.w + r2.w;
/*123*/	r1.w = r1.w * 127.000000 + 1.600000;
/*124*/	r0.w = r0.w * r1.w;
/*125*/	r0.w = exp2(r0.w);
/*126*/	r0.w = min(r0.w, 1.000000);
/*127*/	r0.w = r0.w * r2.w;
/*128*/	r4.yzw = (r0.wwww * cb1.data[1].xxyz).yzw;
/*129*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*130*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*131*/	r0.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*132*/	r1.w = r0.w + r0.w;
/*133*/	r0.w = saturate(-r0.w + 1.000000);
/*134*/	r0.w = r0.w * r0.w;
/*135*/	r0.w = r4.x * r0.w;
/*136*/	r0.w = r0.w * 1.500000;
/*137*/	r0.w = r5.w * r0.w;
/*138*/	r4.xyz = (r2.xyzx * -r1.wwww + -r7.xyzx).xyz;
/*139*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*140*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*141*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*142*/	r1.w = inversesqrt(r1.w);
/*143*/	r4.xyz = (r1.wwww * r4.xyzx).xyz;
/*144*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*145*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*146*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*147*/	r6.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*148*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*149*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*150*/	r4.xyw = (r4.xxxx * r7.xyxz + r6.xyxz).xyw;
/*151*/	r4.xyz = (r4.zzzz * r8.xyzx + r4.xywx).xyz;
/*152*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*153*/	r1.x = inversesqrt(r1.x);
/*154*/	r1.x = r1.x * r1.y;
/*155*/	r1.x = max(r1.x, 0.000000);
/*156*/	r0.w = r0.w * r1.x;
/*157*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*158*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*159*/	r0.w = inversesqrt(r0.w);
/*160*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*161*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*162*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*163*/	r6.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*164*/	r4.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*165*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*166*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*167*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*168*/	r2.xyz = (r2.zzzz * r7.xyzx + r2.xywx).xyz;
/*169*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*170*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*171*/	r0.w = r5.z * r5.x;
/*172*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*173*/	color0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*174*/	color0.w = 1.000000;
/*175*/	color1.x = 1.000000;
/*176*/	return;
}
