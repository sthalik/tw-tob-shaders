//
//
// Shader Model 4
// Fragment Shader
//
// id: 2365 - fxc/glsl_SM_3_0_weightedwithdirtburn.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
flat in vec4 vsOut_T6;
flat in vec4 vsOut_T7;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
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
/*13*/	r0.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*14*/	r1.x = r0.x;
/*15*/	r1.y = cb1.data[26].x * 0.050000 + r0.y;
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
/*27*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.xyxx).xy;
/*28*/	r2.xyzw = (texture(s_decal_dirt_map, r2.xyxx.st)).xyzw;
/*29*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	r1.w = r2.w * r3.w;
/*31*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	r4.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*33*/	r3.xyz = (-r4.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*34*/	r3.xyz = (r1.wwww * r3.xyzx + r4.xyzx).xyz;
/*35*/	r1.w = dot(vec3(r3.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*36*/	r1.w = saturate(-r1.w * 15.000000 + 1.000000);
/*37*/	r0.y = r0.y + r1.w;
/*38*/	r0.y = r0.y * 0.500000;
/*39*/	r1.xyz = (r0.yyyy * r1.xyzx + r0.xxxx).xyz;
/*40*/	r1.xyz = (-r3.xyzx + r1.xyzx).xyz;
/*41*/	r0.x = -r0.w + 1.000000;
/*42*/	r0.x = log2(r0.x);
/*43*/	r0.x = r0.x * vsOut_T7.z;
/*44*/	r0.x = exp2(r0.x);
/*45*/	r0.x = min(r0.x, 1.000000);
/*46*/	r0.x = r0.x * vsOut_T7.z;
/*47*/	r0.xyw = (r0.xxxx * r1.xyxz + r3.xyxz).xyw;
/*48*/	r1.xyz = (r0.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xywx).xyz;
/*49*/	r0.z = vsOut_T7.z + -0.025000;
/*50*/	r0.z = max(r0.z, 0.000000);
/*51*/	r0.xyz = (r0.zzzz * r1.xyzx + r0.xywx).xyz;
/*52*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*53*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*55*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*57*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*58*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*59*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*60*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*61*/	r2.xy = (r2.xyxx * r3.wwww + r1.xyxx).xy;
/*62*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*63*/	r0.w = -r0.w + 1.000000;
/*64*/	r0.w = max(r0.w, 0.000000);
/*65*/	r2.z = sqrt(r0.w);
/*66*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*69*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*70*/	r0.w = inversesqrt(r0.w);
/*71*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*72*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*73*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*74*/	r0.w = inversesqrt(r0.w);
/*75*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*76*/	r1.xyw = (r1.xxxx * r3.xyxz + r2.xyxz).xyw;
/*77*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*78*/	r0.w = inversesqrt(r0.w);
/*79*/	r2.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*80*/	r1.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*81*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*82*/	r0.w = inversesqrt(r0.w);
/*83*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*84*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*85*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*86*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*87*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*88*/	r1.w = r0.w * r3.x + 0.300000;
/*89*/	r1.w = saturate(-r1.w + 1.000000);
/*90*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*91*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*92*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*93*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*94*/	r1.w = -r0.w * r3.x + 1.000000;
/*95*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*96*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*97*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*98*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*99*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*100*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*101*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*102*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*103*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*104*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*105*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*106*/	r0.w = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*107*/	r1.w = saturate(r0.w);
/*108*/	r0.w = r0.w + r0.w;
/*109*/	r6.xyz = (r2.xyzx * -r0.wwww + cb2.data[0].yzwy).xyz;
/*110*/	r0.w = r1.w * r1.w;
/*111*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*112*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*113*/	r2.w = inversesqrt(r1.w);
/*114*/	r1.w = sqrt(r1.w);
/*115*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*116*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*117*/	r2.w = r2.w * r2.w;
/*118*/	r2.w = r2.w * r2.w;
/*119*/	r0.w = r0.w * r2.w;
/*120*/	r0.w = r4.z * r0.w;
/*121*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*122*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*123*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*124*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*125*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*126*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*127*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*128*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*129*/	r0.w = max(r0.w, 0.000000);
/*130*/	r0.w = log2(r0.w);
/*131*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*132*/	r2.w = r6.x * r6.x;
/*133*/	r3.w = vsOut_T7.x * -r6.y + r6.y;
/*134*/	r3.w = vsOut_T7.y * -r3.w + r3.w;
/*135*/	r2.w = r2.w * 127.000000 + 1.600000;
/*136*/	r0.w = r0.w * r2.w;
/*137*/	r0.w = exp2(r0.w);
/*138*/	r0.w = min(r0.w, 1.000000);
/*139*/	r0.w = r0.w * r3.w;
/*140*/	r4.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*141*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*142*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*143*/	r0.w = dot(vec3(-r8.xyzx), vec3(r2.xyzx));
/*144*/	r2.w = r0.w + r0.w;
/*145*/	r0.w = saturate(-r0.w + 1.000000);
/*146*/	r0.w = r0.w * r0.w;
/*147*/	r0.w = r4.x * r0.w;
/*148*/	r0.w = r0.w * 1.500000;
/*149*/	r0.w = r5.w * r0.w;
/*150*/	r4.xyz = (r2.xyzx * -r2.wwww + -r8.xyzx).xyz;
/*151*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*152*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*153*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*154*/	r2.w = inversesqrt(r2.w);
/*155*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*156*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*157*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*158*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*159*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*160*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*161*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*162*/	r4.xyw = (r4.xxxx * r8.xyxz + r6.xyxz).xyw;
/*163*/	r4.xyz = (r4.zzzz * r9.xyzx + r4.xywx).xyz;
/*164*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*165*/	r1.x = inversesqrt(r1.x);
/*166*/	r1.x = r1.x * r1.y;
/*167*/	r1.x = max(r1.x, 0.000000);
/*168*/	r0.w = r0.w * r1.x;
/*169*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*170*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*171*/	r0.w = inversesqrt(r0.w);
/*172*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*173*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*174*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*175*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*176*/	r4.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*177*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*178*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*179*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*180*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*181*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*182*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*183*/	r0.w = r5.z * r5.x;
/*184*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*185*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*186*/	r7.w = max(r7.y, 0.000000);
/*187*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*188*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*189*/	r0.w = sqrt(r0.w);
/*190*/	r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*191*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*192*/	r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*193*/	r2.xyz = (-r1.xyzx * r5.xxxx + r2.xyzx).xyz;
/*194*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*195*/	r2.w = saturate(cb3.data[1].x)/**/;
/*196*/	r2.w = -r2.w + 1.000000;
/*197*/	r2.w = r2.w * 1000.000000;
/*198*/	r1.w = r1.w / r2.w;
/*199*/	r2.w = saturate(cb3.data[0].w)/**/;
/*200*/	r2.w = -r2.w + 1.000000;
/*201*/	r2.w = r2.w * 8.000000 + -4.000000;
/*202*/	r1.w = r1.w + r2.w;
/*203*/	r1.w = r1.w * 1.442695;
/*204*/	r1.w = exp2(r1.w);
/*205*/	r1.w = cb3.data[1].y / r1.w;
/*206*/	r1.w = saturate(-r1.w + cb3.data[1].y);
/*207*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*208*/	r2.w = r2.w + -cb3.data[1].z;
/*209*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*210*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*211*/	r2.w = saturate(r2.w * r3.x);
/*212*/	r3.x = r2.w * -2.000000 + 3.000000;
/*213*/	r2.w = r2.w * r2.w;
/*214*/	r2.w = r2.w * r3.x;
/*215*/	r1.w = cb3.data[2].x * r2.w + r1.w;
/*216*/	r2.w = saturate(dot(vec2(r1.wwww), vec2(cb3.data[2].yyyy)));
/*217*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*218*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*219*/	r2.x = max(cb3.data[2].z, 0.001000);
/*220*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*221*/	r0.w = r0.w * r2.x;
/*222*/	r0.w = min(r0.w, 1.000000);
/*223*/	r2.x = r0.w * -2.000000 + 3.000000;
/*224*/	r0.w = r0.w * r0.w;
/*225*/	r0.w = r0.w * r2.x;
/*226*/	r0.w = saturate(r1.w * r0.w);
/*227*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*228*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*229*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*230*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*231*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*232*/	color0.w = 1.000000;
/*233*/	return;
}
