//
//
// Shader Model 4
// Fragment Shader
//
// id: 2361 - fxc/glsl_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_fire_map;
uniform sampler2D s_skin_mask_map;
uniform samplerCube s_sky;

layout(std140) uniform colorimetry_VS_PS
{
  vec4 data[2];
} cb0;
layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb1;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb2;
layout(std140) uniform fog_VS_PS
{
  vec4 data[4];
} cb3;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb4;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb5;

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
  vec4 r9;

/*0*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*1*/	r0.w = 1.000000;
/*2*/	r1.x = dot(r0.xyzw, cb1.data[9].xyzw);
/*3*/	r1.y = dot(r0.xyzw, cb1.data[10].xyzw);
/*4*/	r0.x = dot(r0.xyzw, cb1.data[12].xyzw);
/*5*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*6*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*7*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*8*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*9*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*10*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*11*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*12*/	if(r0.x != 0) discard;
/*13*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*14*/	r1.xyz = (cb5.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*15*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*16*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*17*/	r1.xyz = (cb5.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*19*/	r1.xyz = (cb5.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*20*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*21*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*22*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.xyxx).xy;
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
/*39*/	r1.y = cb1.data[26].x * 0.050000 + r1.y;
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
/*59*/	r1.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
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
/*94*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
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
/*111*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*112*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*113*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*114*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*115*/	r0.w = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*116*/	r1.w = saturate(r0.w);
/*117*/	r0.w = r0.w + r0.w;
/*118*/	r6.xyz = (r2.xyzx * -r0.wwww + cb2.data[0].yzwy).xyz;
/*119*/	r0.w = r1.w * r1.w;
/*120*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*121*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*122*/	r2.w = inversesqrt(r1.w);
/*123*/	r1.w = sqrt(r1.w);
/*124*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*125*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*126*/	r2.w = r2.w * r2.w;
/*127*/	r2.w = r2.w * r2.w;
/*128*/	r0.w = r0.w * r2.w;
/*129*/	r0.w = r4.z * r0.w;
/*130*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*131*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*132*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*133*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*134*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*135*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*136*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*137*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*138*/	r0.w = max(r0.w, 0.000000);
/*139*/	r0.w = log2(r0.w);
/*140*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*141*/	r2.w = r6.x * r6.x;
/*142*/	r3.w = vsOut_T7.x * -r6.y + r6.y;
/*143*/	r3.w = vsOut_T7.y * -r3.w + r3.w;
/*144*/	r2.w = r2.w * 127.000000 + 1.600000;
/*145*/	r0.w = r0.w * r2.w;
/*146*/	r0.w = exp2(r0.w);
/*147*/	r0.w = min(r0.w, 1.000000);
/*148*/	r0.w = r0.w * r3.w;
/*149*/	r4.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*150*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*151*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*152*/	r0.w = dot(vec3(-r8.xyzx), vec3(r2.xyzx));
/*153*/	r2.w = r0.w + r0.w;
/*154*/	r0.w = saturate(-r0.w + 1.000000);
/*155*/	r0.w = r0.w * r0.w;
/*156*/	r0.w = r4.x * r0.w;
/*157*/	r0.w = r0.w * 1.500000;
/*158*/	r0.w = r5.w * r0.w;
/*159*/	r4.xyz = (r2.xyzx * -r2.wwww + -r8.xyzx).xyz;
/*160*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*161*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*162*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*163*/	r2.w = inversesqrt(r2.w);
/*164*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*165*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*166*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*167*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*168*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*169*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*170*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*171*/	r4.xyw = (r4.xxxx * r8.xyxz + r6.xyxz).xyw;
/*172*/	r4.xyz = (r4.zzzz * r9.xyzx + r4.xywx).xyz;
/*173*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*174*/	r1.x = inversesqrt(r1.x);
/*175*/	r1.x = r1.x * r1.y;
/*176*/	r1.x = max(r1.x, 0.000000);
/*177*/	r0.w = r0.w * r1.x;
/*178*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*179*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*180*/	r0.w = inversesqrt(r0.w);
/*181*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*182*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*183*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*184*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*185*/	r4.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*186*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*187*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*188*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*189*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*190*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*191*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*192*/	r0.w = r5.z * r5.x;
/*193*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*194*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*195*/	r7.w = max(r7.y, 0.000000);
/*196*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*197*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*198*/	r0.w = sqrt(r0.w);
/*199*/	r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*200*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*201*/	r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*202*/	r2.xyz = (-r1.xyzx * r5.xxxx + r2.xyzx).xyz;
/*203*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*204*/	r2.w = saturate(cb3.data[1].x)/**/;
/*205*/	r2.w = -r2.w + 1.000000;
/*206*/	r2.w = r2.w * 1000.000000;
/*207*/	r1.w = r1.w / r2.w;
/*208*/	r2.w = saturate(cb3.data[0].w)/**/;
/*209*/	r2.w = -r2.w + 1.000000;
/*210*/	r2.w = r2.w * 8.000000 + -4.000000;
/*211*/	r1.w = r1.w + r2.w;
/*212*/	r1.w = r1.w * 1.442695;
/*213*/	r1.w = exp2(r1.w);
/*214*/	r1.w = cb3.data[1].y / r1.w;
/*215*/	r1.w = saturate(-r1.w + cb3.data[1].y);
/*216*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*217*/	r2.w = r2.w + -cb3.data[1].z;
/*218*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*219*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*220*/	r2.w = saturate(r2.w * r3.x);
/*221*/	r3.x = r2.w * -2.000000 + 3.000000;
/*222*/	r2.w = r2.w * r2.w;
/*223*/	r2.w = r2.w * r3.x;
/*224*/	r1.w = cb3.data[2].x * r2.w + r1.w;
/*225*/	r2.w = saturate(dot(vec2(r1.wwww), vec2(cb3.data[2].yyyy)));
/*226*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*227*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*228*/	r2.x = max(cb3.data[2].z, 0.001000);
/*229*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*230*/	r0.w = r0.w * r2.x;
/*231*/	r0.w = min(r0.w, 1.000000);
/*232*/	r2.x = r0.w * -2.000000 + 3.000000;
/*233*/	r0.w = r0.w * r0.w;
/*234*/	r0.w = r0.w * r2.x;
/*235*/	r0.w = saturate(r1.w * r0.w);
/*236*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*237*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*238*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*239*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*240*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*241*/	color0.w = 1.000000;
/*242*/	return;
}
