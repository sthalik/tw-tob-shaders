//
//
// Shader Model 4
// Fragment Shader
//
// id: 2369 - fxc/glsl_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*14*/	r1.xyz = (cb3.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*16*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyz = (cb3.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyz = (cb3.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*21*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*22*/	r2.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*23*/	r2.xyzw = (texture(s_decal_dirt_map, r2.xyxx.st)).xyzw;
/*24*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*25*/	r0.w = r2.w * r3.w;
/*26*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*27*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*28*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*29*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*30*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*31*/	r4.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*32*/	r1.z = log2(r4.z);
/*33*/	r1.z = r1.z * 1.800000;
/*34*/	r1.z = exp2(r1.z);
/*35*/	r1.z = r1.z * 10.000000;
/*36*/	r1.z = min(r1.z, 1.000000);
/*37*/	r0.w = r0.w + r1.z;
/*38*/	r0.w = r0.w * 0.500000;
/*39*/	r1.y = cb0.data[26].x * 0.050000 + r1.y;
/*40*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*41*/	r1.x = saturate(r1.x * 5.000000);
/*42*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*43*/	r1.w = r4.z * 0.250000;
/*44*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*45*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*46*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*47*/	r0.w = -r4.w + 1.000000;
/*48*/	r0.w = log2(r0.w);
/*49*/	r0.w = r0.w * vsOut_T7.z;
/*50*/	r0.w = exp2(r0.w);
/*51*/	r0.w = min(r0.w, 1.000000);
/*52*/	r0.w = r0.w * vsOut_T7.z;
/*53*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*54*/	r1.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*55*/	r0.w = vsOut_T7.z + -0.025000;
/*56*/	r0.w = max(r0.w, 0.000000);
/*57*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*58*/	r0.w = -vsOut_T4.z + 1.000000;
/*59*/	r1.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*60*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*61*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*62*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*63*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*64*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*65*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*66*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*67*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*68*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*69*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*70*/	r2.xy = (r2.xyxx * r3.wwww + r1.xyxx).xy;
/*71*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*72*/	r0.w = -r0.w + 1.000000;
/*73*/	r0.w = max(r0.w, 0.000000);
/*74*/	r2.z = sqrt(r0.w);
/*75*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*76*/	r0.w = inversesqrt(r0.w);
/*77*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*78*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*81*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*82*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*85*/	r1.xyw = (r1.xxxx * r3.xyxz + r2.xyxz).xyw;
/*86*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*87*/	r0.w = inversesqrt(r0.w);
/*88*/	r2.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*89*/	r1.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*90*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*91*/	r0.w = inversesqrt(r0.w);
/*92*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*93*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*94*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*95*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*96*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*97*/	r1.w = r0.w * r3.x + 0.300000;
/*98*/	r1.w = saturate(-r1.w + 1.000000);
/*99*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*100*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*101*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*102*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*103*/	r1.w = -r0.w * r3.x + 1.000000;
/*104*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*105*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*106*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*107*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*108*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*109*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*110*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*111*/	r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*112*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*113*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*114*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*115*/	r0.w = dot(vec3(r2.xyzx), vec3(cb1.data[0].yzwy));
/*116*/	r1.w = saturate(r0.w);
/*117*/	r0.w = r0.w + r0.w;
/*118*/	r6.xyz = (r2.xyzx * -r0.wwww + cb1.data[0].yzwy).xyz;
/*119*/	r0.w = r1.w * r1.w;
/*120*/	r7.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*121*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*122*/	r1.w = inversesqrt(r1.w);
/*123*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*124*/	r1.w = saturate(dot(vec3(r7.xyzx), vec3(-cb1.data[0].yzwy)));
/*125*/	r1.w = r1.w * r1.w;
/*126*/	r1.w = r1.w * r1.w;
/*127*/	r0.w = r0.w * r1.w;
/*128*/	r0.w = r4.z * r0.w;
/*129*/	r4.yzw = (r4.yyyy * cb1.data[1].xxyz).yzw;
/*130*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb1.data[1].xxyz).yzw;
/*131*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*132*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*133*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*134*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*135*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*136*/	r0.w = dot(vec3(r6.xyzx), vec3(-r7.xyzx));
/*137*/	r0.w = max(r0.w, 0.000000);
/*138*/	r0.w = log2(r0.w);
/*139*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*140*/	r1.w = r6.x * r6.x;
/*141*/	r2.w = vsOut_T7.x * -r6.y + r6.y;
/*142*/	r2.w = vsOut_T7.y * -r2.w + r2.w;
/*143*/	r1.w = r1.w * 127.000000 + 1.600000;
/*144*/	r0.w = r0.w * r1.w;
/*145*/	r0.w = exp2(r0.w);
/*146*/	r0.w = min(r0.w, 1.000000);
/*147*/	r0.w = r0.w * r2.w;
/*148*/	r4.yzw = (r0.wwww * cb1.data[1].xxyz).yzw;
/*149*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*150*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*151*/	r0.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*152*/	r1.w = r0.w + r0.w;
/*153*/	r0.w = saturate(-r0.w + 1.000000);
/*154*/	r0.w = r0.w * r0.w;
/*155*/	r0.w = r4.x * r0.w;
/*156*/	r0.w = r0.w * 1.500000;
/*157*/	r0.w = r5.w * r0.w;
/*158*/	r4.xyz = (r2.xyzx * -r1.wwww + -r7.xyzx).xyz;
/*159*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*160*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*161*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*162*/	r1.w = inversesqrt(r1.w);
/*163*/	r4.xyz = (r1.wwww * r4.xyzx).xyz;
/*164*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*165*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*166*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*167*/	r6.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*168*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*169*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*170*/	r4.xyw = (r4.xxxx * r7.xyxz + r6.xyxz).xyw;
/*171*/	r4.xyz = (r4.zzzz * r8.xyzx + r4.xywx).xyz;
/*172*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*173*/	r1.x = inversesqrt(r1.x);
/*174*/	r1.x = r1.x * r1.y;
/*175*/	r1.x = max(r1.x, 0.000000);
/*176*/	r0.w = r0.w * r1.x;
/*177*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*178*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*179*/	r0.w = inversesqrt(r0.w);
/*180*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*181*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*182*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*183*/	r6.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*184*/	r4.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*185*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*186*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*187*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*188*/	r2.xyz = (r2.zzzz * r7.xyzx + r2.xywx).xyz;
/*189*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*190*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*191*/	r0.w = r5.z * r5.x;
/*192*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*193*/	color0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*194*/	color0.w = 1.000000;
/*195*/	color1.x = 1.000000;
/*196*/	return;
}
