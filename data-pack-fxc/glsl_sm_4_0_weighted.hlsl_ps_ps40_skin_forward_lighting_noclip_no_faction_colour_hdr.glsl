//
//
// Shader Model 4
// Fragment Shader
//
// id: 1878 - fxc/glsl_SM_4_0_weighted.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*13*/	r0.x = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*14*/	r0.x = inversesqrt(r0.x);
/*15*/	r0.xyz = (r0.xxxx * vsOut_T3.xyzx).xyz;
/*16*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*17*/	r0.w = inversesqrt(r0.w);
/*18*/	r1.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*19*/	r2.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*20*/	r2.xy = (r2.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*21*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	r1.xyz = (r1.xyzx * r2.yyyy).xyz;
/*23*/	r0.xyz = (r2.xxxx * r0.xyzx + r1.xyzx).xyz;
/*24*/	r0.w = dot(vec2(r2.xyxx), vec2(r2.xyxx));
/*25*/	r0.w = -r0.w + 1.000000;
/*26*/	r0.w = max(r0.w, 0.000000);
/*27*/	r0.w = sqrt(r0.w);
/*28*/	r1.x = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*29*/	r1.x = inversesqrt(r1.x);
/*30*/	r1.xyz = (r1.xxxx * vsOut_T2.xyzx).xyz;
/*31*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*32*/	r0.w = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*33*/	r0.w = inversesqrt(r0.w);
/*34*/	r1.xyz = (r0.wwww * r0.xyzx).xyz;
/*35*/	r0.xyz = (r0.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*36*/	r0.w = dot(vec3(r1.xyzx), vec3(-cb1.data[0].yzwy));
/*37*/	r2.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*38*/	r2.xyz = saturate(r2.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*39*/	r1.w = r0.w * r2.x + 0.300000;
/*40*/	r1.w = saturate(-r1.w + 1.000000);
/*41*/	r3.xyz = (r2.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*42*/	r4.xyz = (r1.wwww * r3.xyzx).xyz;
/*43*/	r3.xyz = (-r3.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*44*/	r4.xyz = (r0.wwww * r2.xxxx + r4.xyzx).xyz;
/*45*/	r1.w = -r0.w * r2.x + 1.000000;
/*46*/	r2.xyz = (r2.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*47*/	r2.xyz = (r1.wwww * r2.xyzx).xyz;
/*48*/	r2.xyz = (r2.xyzx * r3.xyzx + r4.xyzx).xyz;
/*49*/	r2.xyz = (-r0.wwww + r2.xyzx).xyz;
/*50*/	r3.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*51*/	r2.xyz = saturate(r3.yyyy * r2.xyzx + r0.wwww).xyz;
/*52*/	r4.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*53*/	r5.xyz = (r4.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*54*/	r5.xyz = (-r4.xyzx + r5.xyzx).xyz;
/*55*/	r4.xyz = saturate(vsOut_T7.xxxx * r5.xyzx + r4.xyzx).xyz;
/*56*/	r0.w = dot(vec3(r4.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*57*/	r5.xyz = (-r4.xyzx + r0.wwww).xyz;
/*58*/	r4.xyz = (vsOut_T7.yyyy * r5.xyzx + r4.xyzx).xyz;
/*59*/	r2.xyz = (r2.xyzx * r4.xyzx).xyz;
/*60*/	r2.xyz = (r2.xyzx * cb1.data[1].xyzx).xyz;
/*61*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*62*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*63*/	r2.xyz = (r2.xyzx * r5.xxxx).xyz;
/*64*/	r0.w = dot(vec3(r1.xyzx), vec3(cb1.data[0].yzwy));
/*65*/	r1.w = saturate(r0.w);
/*66*/	r0.w = r0.w + r0.w;
/*67*/	r6.xyz = (r1.xyzx * -r0.wwww + cb1.data[0].yzwy).xyz;
/*68*/	r0.w = r1.w * r1.w;
/*69*/	r7.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*70*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*71*/	r1.w = inversesqrt(r1.w);
/*72*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*73*/	r1.w = saturate(dot(vec3(r7.xyzx), vec3(-cb1.data[0].yzwy)));
/*74*/	r1.w = r1.w * r1.w;
/*75*/	r1.w = r1.w * r1.w;
/*76*/	r0.w = r0.w * r1.w;
/*77*/	r0.w = r3.z * r0.w;
/*78*/	r3.yzw = (r3.yyyy * cb1.data[1].xxyz).yzw;
/*79*/	r3.yzw = (r3.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb1.data[1].xxyz).yzw;
/*80*/	r3.yzw = (r5.xxxx * r3.yyzw).yzw;
/*81*/	r3.yzw = (r0.wwww * r3.yyzw).yzw;
/*82*/	r3.yzw = (r3.yyzw * r4.xxyz).yzw;
/*83*/	r3.yzw = (r3.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*84*/	r2.xyz = (r2.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r3.yzwy).xyz;
/*85*/	r0.w = dot(vec3(r6.xyzx), vec3(-r7.xyzx));
/*86*/	r0.w = max(r0.w, 0.000000);
/*87*/	r0.w = log2(r0.w);
/*88*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*89*/	r1.w = r6.x * r6.x;
/*90*/	r2.w = vsOut_T7.x * -r6.y + r6.y;
/*91*/	r2.w = vsOut_T7.y * -r2.w + r2.w;
/*92*/	r1.w = r1.w * 127.000000 + 1.600000;
/*93*/	r0.w = r0.w * r1.w;
/*94*/	r0.w = exp2(r0.w);
/*95*/	r0.w = min(r0.w, 1.000000);
/*96*/	r0.w = r0.w * r2.w;
/*97*/	r3.yzw = (r0.wwww * cb1.data[1].xxyz).yzw;
/*98*/	r3.yzw = (r5.xxxx * r3.yyzw).yzw;
/*99*/	r2.xyz = (r3.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r2.xyzx).xyz;
/*100*/	r0.w = dot(vec3(-r7.xyzx), vec3(r1.xyzx));
/*101*/	r1.w = r0.w + r0.w;
/*102*/	r0.w = saturate(-r0.w + 1.000000);
/*103*/	r0.w = r0.w * r0.w;
/*104*/	r0.w = r3.x * r0.w;
/*105*/	r0.w = r0.w * 1.500000;
/*106*/	r0.w = r5.w * r0.w;
/*107*/	r3.xyz = (r1.xyzx * -r1.wwww + -r7.xyzx).xyz;
/*108*/	r1.xyz = (r1.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*109*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*110*/	r1.w = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*111*/	r1.w = inversesqrt(r1.w);
/*112*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*113*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*114*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*115*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*116*/	r6.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*117*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*118*/	r6.xyz = (r3.yyyy * r6.xywx).xyz;
/*119*/	r3.xyw = (r3.xxxx * r7.xyxz + r6.xyxz).xyw;
/*120*/	r3.xyz = (r3.zzzz * r8.xyzx + r3.xywx).xyz;
/*121*/	r0.x = dot(vec3(r0.xyzx), vec3(r0.xyzx));
/*122*/	r0.x = inversesqrt(r0.x);
/*123*/	r0.x = r0.x * r0.y;
/*124*/	r0.x = max(r0.x, 0.000000);
/*125*/	r0.x = r0.x * r0.w;
/*126*/	r0.xyz = (r3.xyzx * r0.xxxx).xyz;
/*127*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*128*/	r0.w = inversesqrt(r0.w);
/*129*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*130*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r1.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*131*/	r1.xyz = (r1.xyzx * r1.xyzx).xyz;
/*132*/	r6.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*133*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*134*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*135*/	r3.xyz = (r1.yyyy * r3.xywx).xyz;
/*136*/	r1.xyw = (r1.xxxx * r6.xyxz + r3.xyxz).xyw;
/*137*/	r1.xyz = (r1.zzzz * r7.xyzx + r1.xywx).xyz;
/*138*/	r1.xyz = (r1.xyzx * r4.xyzx).xyz;
/*139*/	r1.xyz = (r5.yyyy * r1.xyzx).xyz;
/*140*/	r0.w = r5.z * r5.x;
/*141*/	r0.xyz = (r1.xyzx * r0.wwww + r0.xyzx).xyz;
/*142*/	color0.xyz = (r2.xyzx + r0.xyzx).xyz;
/*143*/	color0.w = 1.000000;
/*144*/	color1.x = 1.000000;
/*145*/	return;
}
