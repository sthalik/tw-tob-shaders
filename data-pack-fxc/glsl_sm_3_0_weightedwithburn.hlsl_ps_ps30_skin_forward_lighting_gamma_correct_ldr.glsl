//
//
// Shader Model 4
// Fragment Shader
//
// id: 2215 - fxc/glsl_SM_3_0_weightedwithburn.hlsl_PS_ps30_skin_forward_lighting_gamma_correct_LDR.glsl
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

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
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
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
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

/*0*/	r0.xyzw = (texture(s_diffuse_map, vsOut_T1.xyxx.st)).xyzw;
/*1*/	r0.w = r0.w + -0.501961;
/*2*/	r0.w = uintBitsToFloat((r0.w < 0.000000) ? 0xffffffffu : 0x00000000u);
/*3*/	if(r0.w != 0) discard;
/*4*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*5*/	r1.w = 1.000000;
/*6*/	r2.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*7*/	r2.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*8*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*9*/	r1.xy = (r2.xyxx / r0.wwww).xy;
/*10*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*11*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*12*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*13*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*15*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*16*/	if(r0.w != 0) discard;
/*17*/	r1.xyz = (cb4.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*19*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyz = (cb4.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*21*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*22*/	r1.xyz = (cb4.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*23*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*24*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*25*/	r0.w = saturate(-r0.w * 15.000000 + 1.000000);
/*26*/	r1.xy = (vsOut_T1.xyxx * vec4(1.200000, 1.500000, 0.000000, 0.000000)).xy;
/*27*/	r2.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*28*/	r1.z = log2(r2.z);
/*29*/	r1.z = r1.z * 1.800000;
/*30*/	r1.z = exp2(r1.z);
/*31*/	r1.z = r1.z * 10.000000;
/*32*/	r1.z = min(r1.z, 1.000000);
/*33*/	r0.w = r0.w + r1.z;
/*34*/	r0.w = r0.w * 0.500000;
/*35*/	r1.y = cb1.data[26].x * 0.050000 + r1.y;
/*36*/	r1.xyzw = (texture(s_fire_map, r1.xyxx.st)).xyzw;
/*37*/	r1.x = saturate(r1.x * 5.000000);
/*38*/	r1.xyz = (r1.xxxx * vec4(0.530000, 0.070000, -0.120000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*39*/	r1.w = r2.z * 0.250000;
/*40*/	r1.xyz = (r1.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + -r1.wwww).xyz;
/*41*/	r1.xyz = (r0.wwww * r1.xyzx + r1.wwww).xyz;
/*42*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*43*/	r0.w = -r2.w + 1.000000;
/*44*/	r0.w = log2(r0.w);
/*45*/	r0.w = r0.w * vsOut_T7.z;
/*46*/	r0.w = exp2(r0.w);
/*47*/	r0.w = min(r0.w, 1.000000);
/*48*/	r0.w = r0.w * vsOut_T7.z;
/*49*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*50*/	r1.xyz = (r2.zzzz * vec4(0.250000, 0.250000, 0.250000, 0.000000) + -r0.xyzx).xyz;
/*51*/	r0.w = vsOut_T7.z + -0.025000;
/*52*/	r0.w = max(r0.w, 0.000000);
/*53*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*54*/	r0.w = -vsOut_T4.z + 1.000000;
/*55*/	r1.xyz = (vsOut_T4.zzzz * cb4.data[3].xyzx).xyz;
/*56*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*57*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*58*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*59*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*60*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*61*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*62*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*63*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r1.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*66*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*69*/	r3.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*70*/	r3.xy = (r3.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*71*/	r3.xy = (r3.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*72*/	r2.xyz = (r2.xyzx * r3.yyyy).xyz;
/*73*/	r1.xyz = (r3.xxxx * r1.xyzx + r2.xyzx).xyz;
/*74*/	r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*75*/	r0.w = -r0.w + 1.000000;
/*76*/	r0.w = max(r0.w, 0.000000);
/*77*/	r0.w = sqrt(r0.w);
/*78*/	r1.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*79*/	r1.w = inversesqrt(r1.w);
/*80*/	r2.xyz = (r1.wwww * vsOut_T2.xyzx).xyz;
/*81*/	r1.xyz = (r0.wwww * r2.xyzx + r1.xyzx).xyz;
/*82*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*85*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*86*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*87*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*88*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*89*/	r1.w = r0.w * r3.x + 0.300000;
/*90*/	r1.w = saturate(-r1.w + 1.000000);
/*91*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*92*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*93*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*94*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*95*/	r1.w = -r0.w * r3.x + 1.000000;
/*96*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*97*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*98*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*99*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*100*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*101*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*102*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*103*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*104*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*105*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*106*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*107*/	r0.w = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*108*/	r1.w = saturate(r0.w);
/*109*/	r0.w = r0.w + r0.w;
/*110*/	r6.xyz = (r2.xyzx * -r0.wwww + cb2.data[0].yzwy).xyz;
/*111*/	r0.w = r1.w * r1.w;
/*112*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*113*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*114*/	r2.w = inversesqrt(r1.w);
/*115*/	r1.w = sqrt(r1.w);
/*116*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*117*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*118*/	r2.w = r2.w * r2.w;
/*119*/	r2.w = r2.w * r2.w;
/*120*/	r0.w = r0.w * r2.w;
/*121*/	r0.w = r4.z * r0.w;
/*122*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*123*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*124*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*125*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*126*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*127*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*128*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*129*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*130*/	r0.w = max(r0.w, 0.000000);
/*131*/	r0.w = log2(r0.w);
/*132*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*133*/	r2.w = r6.x * r6.x;
/*134*/	r3.w = vsOut_T7.x * -r6.y + r6.y;
/*135*/	r3.w = vsOut_T7.y * -r3.w + r3.w;
/*136*/	r2.w = r2.w * 127.000000 + 1.600000;
/*137*/	r0.w = r0.w * r2.w;
/*138*/	r0.w = exp2(r0.w);
/*139*/	r0.w = min(r0.w, 1.000000);
/*140*/	r0.w = r0.w * r3.w;
/*141*/	r4.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*142*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*143*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*144*/	r0.w = dot(vec3(-r8.xyzx), vec3(r2.xyzx));
/*145*/	r2.w = r0.w + r0.w;
/*146*/	r0.w = saturate(-r0.w + 1.000000);
/*147*/	r0.w = r0.w * r0.w;
/*148*/	r0.w = r4.x * r0.w;
/*149*/	r0.w = r0.w * 1.500000;
/*150*/	r0.w = r5.w * r0.w;
/*151*/	r4.xyz = (r2.xyzx * -r2.wwww + -r8.xyzx).xyz;
/*152*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*153*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*154*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*155*/	r2.w = inversesqrt(r2.w);
/*156*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*157*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*158*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*159*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*160*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*161*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*162*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*163*/	r4.xyw = (r4.xxxx * r8.xyxz + r6.xyxz).xyw;
/*164*/	r4.xyz = (r4.zzzz * r9.xyzx + r4.xywx).xyz;
/*165*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*166*/	r1.x = inversesqrt(r1.x);
/*167*/	r1.x = r1.x * r1.y;
/*168*/	r1.x = max(r1.x, 0.000000);
/*169*/	r0.w = r0.w * r1.x;
/*170*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*171*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*172*/	r0.w = inversesqrt(r0.w);
/*173*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*174*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*175*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*176*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*177*/	r4.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*178*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*179*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*180*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*181*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*182*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*183*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*184*/	r0.w = r5.z * r5.x;
/*185*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*186*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*187*/	r7.w = max(r7.y, 0.000000);
/*188*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*189*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*190*/	r0.w = sqrt(r0.w);
/*191*/	r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*192*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*193*/	r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*194*/	r2.xyz = (-r1.xyzx * r5.xxxx + r2.xyzx).xyz;
/*195*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*196*/	r2.w = saturate(cb3.data[1].x)/**/;
/*197*/	r2.w = -r2.w + 1.000000;
/*198*/	r2.w = r2.w * 1000.000000;
/*199*/	r1.w = r1.w / r2.w;
/*200*/	r2.w = saturate(cb3.data[0].w)/**/;
/*201*/	r2.w = -r2.w + 1.000000;
/*202*/	r2.w = r2.w * 8.000000 + -4.000000;
/*203*/	r1.w = r1.w + r2.w;
/*204*/	r1.w = r1.w * 1.442695;
/*205*/	r1.w = exp2(r1.w);
/*206*/	r1.w = cb3.data[1].y / r1.w;
/*207*/	r1.w = saturate(-r1.w + cb3.data[1].y);
/*208*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*209*/	r2.w = r2.w + -cb3.data[1].z;
/*210*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*211*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*212*/	r2.w = saturate(r2.w * r3.x);
/*213*/	r3.x = r2.w * -2.000000 + 3.000000;
/*214*/	r2.w = r2.w * r2.w;
/*215*/	r2.w = r2.w * r3.x;
/*216*/	r1.w = cb3.data[2].x * r2.w + r1.w;
/*217*/	r2.w = saturate(dot(vec2(r1.wwww), vec2(cb3.data[2].yyyy)));
/*218*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*219*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*220*/	r2.x = max(cb3.data[2].z, 0.001000);
/*221*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*222*/	r0.w = r0.w * r2.x;
/*223*/	r0.w = min(r0.w, 1.000000);
/*224*/	r2.x = r0.w * -2.000000 + 3.000000;
/*225*/	r0.w = r0.w * r0.w;
/*226*/	r0.w = r0.w * r2.x;
/*227*/	r0.w = saturate(r1.w * r0.w);
/*228*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*229*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*230*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*231*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*232*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*233*/	color0.w = 1.000000;
/*234*/	return;
}
