//
//
// Shader Model 4
// Fragment Shader
//
// id: 2367 - fxc/glsl_SM_4_0_weightedwithdirtburn.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
/*17*/	r1.xyz = (cb3.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*19*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyz = (cb3.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*21*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*22*/	r1.xyz = (cb3.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*23*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*24*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*25*/	r2.xy = (vsOut_T1.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r2.xyzw = (texture(s_decal_dirt_map, r2.xyxx.st)).xyzw;
/*27*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r0.w = r2.w * r3.w;
/*29*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*31*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*32*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*33*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*34*/	r4.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*35*/	r1.z = log2(r4.z);
/*36*/	r1.z = r1.z * 1.800000;
/*37*/	r1.z = exp2(r1.z);
/*38*/	r1.z = r1.z * 10.000000;
/*39*/	r1.z = min(r1.z, 1.000000);
/*40*/	r0.w = r0.w + r1.z;
/*41*/	r0.w = r0.w * 0.500000;
/*42*/	r1.y = cb0.data[26].x * 0.050000 + r1.y;
/*43*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*44*/	r1.x = saturate(r1.x * 5.000000);
/*45*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*46*/	r1.w = r4.z * 0.250000;
/*47*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*48*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*49*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*50*/	r0.w = -r4.w + 1.000000;
/*51*/	r0.w = log2(r0.w);
/*52*/	r0.w = r0.w * vsOut_T7.z;
/*53*/	r0.w = exp2(r0.w);
/*54*/	r0.w = min(r0.w, 1.000000);
/*55*/	r0.w = r0.w * vsOut_T7.z;
/*56*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*57*/	r1.xyz = (r4.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*58*/	r0.w = vsOut_T7.z + -0.025000;
/*59*/	r0.w = max(r0.w, 0.000000);
/*60*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*61*/	r0.w = -vsOut_T4.z + 1.000000;
/*62*/	r1.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*63*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*64*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*65*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*66*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*67*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*68*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*69*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*70*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*71*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*72*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*73*/	r2.xy = (r2.xyxx * r3.wwww + r1.xyxx).xy;
/*74*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*75*/	r0.w = -r0.w + 1.000000;
/*76*/	r0.w = max(r0.w, 0.000000);
/*77*/	r2.z = sqrt(r0.w);
/*78*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*81*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*82*/	r0.w = inversesqrt(r0.w);
/*83*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*84*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*85*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*86*/	r0.w = inversesqrt(r0.w);
/*87*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*88*/	r1.xyw = (r1.xxxx * r3.xyxz + r2.xyxz).xyw;
/*89*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*90*/	r0.w = inversesqrt(r0.w);
/*91*/	r2.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*92*/	r1.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*93*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*94*/	r0.w = inversesqrt(r0.w);
/*95*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*96*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*97*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb1.data[0].yzwy));
/*98*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*99*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*100*/	r1.w = r0.w * r3.x + 0.300000;
/*101*/	r1.w = saturate(-r1.w + 1.000000);
/*102*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*103*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*104*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*105*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*106*/	r1.w = -r0.w * r3.x + 1.000000;
/*107*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*108*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*109*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*110*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*111*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*112*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*113*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*114*/	r3.xyz = (r3.xyzx * cb1.data[1].xyzx).xyz;
/*115*/	r0.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*116*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*117*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*118*/	r0.w = dot(vec3(r2.xyzx), vec3(cb1.data[0].yzwy));
/*119*/	r1.w = saturate(r0.w);
/*120*/	r0.w = r0.w + r0.w;
/*121*/	r6.xyz = (r2.xyzx * -r0.wwww + cb1.data[0].yzwy).xyz;
/*122*/	r0.w = r1.w * r1.w;
/*123*/	r7.xyz = (vsOut_T0.xyzx + -cb0.data[0].xyzx).xyz;
/*124*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*125*/	r1.w = inversesqrt(r1.w);
/*126*/	r7.xyz = (r1.wwww * r7.xyzx).xyz;
/*127*/	r1.w = saturate(dot(vec3(r7.xyzx), vec3(-cb1.data[0].yzwy)));
/*128*/	r1.w = r1.w * r1.w;
/*129*/	r1.w = r1.w * r1.w;
/*130*/	r0.w = r0.w * r1.w;
/*131*/	r0.w = r4.z * r0.w;
/*132*/	r4.yzw = (r4.yyyy * cb1.data[1].xxyz).yzw;
/*133*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb1.data[1].xxyz).yzw;
/*134*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*135*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*136*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*137*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*138*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*139*/	r0.w = dot(vec3(r6.xyzx), vec3(-r7.xyzx));
/*140*/	r0.w = max(r0.w, 0.000000);
/*141*/	r0.w = log2(r0.w);
/*142*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*143*/	r1.w = r6.x * r6.x;
/*144*/	r2.w = vsOut_T7.x * -r6.y + r6.y;
/*145*/	r2.w = vsOut_T7.y * -r2.w + r2.w;
/*146*/	r1.w = r1.w * 127.000000 + 1.600000;
/*147*/	r0.w = r0.w * r1.w;
/*148*/	r0.w = exp2(r0.w);
/*149*/	r0.w = min(r0.w, 1.000000);
/*150*/	r0.w = r0.w * r2.w;
/*151*/	r4.yzw = (r0.wwww * cb1.data[1].xxyz).yzw;
/*152*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*153*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*154*/	r0.w = dot(vec3(-r7.xyzx), vec3(r2.xyzx));
/*155*/	r1.w = r0.w + r0.w;
/*156*/	r0.w = saturate(-r0.w + 1.000000);
/*157*/	r0.w = r0.w * r0.w;
/*158*/	r0.w = r4.x * r0.w;
/*159*/	r0.w = r0.w * 1.500000;
/*160*/	r0.w = r5.w * r0.w;
/*161*/	r4.xyz = (r2.xyzx * -r1.wwww + -r7.xyzx).xyz;
/*162*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*163*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*164*/	r1.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*165*/	r1.w = inversesqrt(r1.w);
/*166*/	r4.xyz = (r1.wwww * r4.xyzx).xyz;
/*167*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*168*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*169*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*170*/	r6.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*171*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*172*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*173*/	r4.xyw = (r4.xxxx * r7.xyxz + r6.xyxz).xyw;
/*174*/	r4.xyz = (r4.zzzz * r8.xyzx + r4.xywx).xyz;
/*175*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*176*/	r1.x = inversesqrt(r1.x);
/*177*/	r1.x = r1.x * r1.y;
/*178*/	r1.x = max(r1.x, 0.000000);
/*179*/	r0.w = r0.w * r1.x;
/*180*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*181*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*182*/	r0.w = inversesqrt(r0.w);
/*183*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*184*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*185*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*186*/	r6.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*187*/	r4.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*188*/	r7.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*189*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*190*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*191*/	r2.xyz = (r2.zzzz * r7.xyzx + r2.xywx).xyz;
/*192*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*193*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*194*/	r0.w = r5.z * r5.x;
/*195*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*196*/	color0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*197*/	color0.w = 1.000000;
/*198*/	color1.x = 1.000000;
/*199*/	return;
}
