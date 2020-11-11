//
//
// Shader Model 4
// Fragment Shader
//
// id: 1931 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_skin_forward_lighting_gamma_correct_LDR.glsl
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
/*17*/	r1.xyz = (cb5.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*18*/	r2.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*19*/	r0.xyz = (r2.xxxx * r1.xyzx + r0.xyzx).xyz;
/*20*/	r1.xyz = (cb5.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*21*/	r0.xyz = (r2.yyyy * r1.xyzx + r0.xyzx).xyz;
/*22*/	r1.xyz = (cb5.data[2].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*23*/	r0.xyz = (r2.zzzz * r1.xyzx + r0.xyzx).xyz;
/*24*/	r1.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*25*/	r2.xy = (vsOut_T1.xyxx * cb4.data[2].xyxx + vsOut_T6.xyxx).xy;
/*26*/	r2.xyzw = (texture(s_decal_dirt_map, r2.xyxx.st)).xyzw;
/*27*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*28*/	r0.w = r2.w * r3.w;
/*29*/	r2.xy = (r2.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	r0.xyz = (r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*31*/	r0.w = -vsOut_T4.z + 1.000000;
/*32*/	r1.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*33*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*34*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*35*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*36*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*37*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*38*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*39*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*40*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*41*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*42*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*43*/	r2.xy = (r2.xyxx * r3.wwww + r1.xyxx).xy;
/*44*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*45*/	r0.w = -r0.w + 1.000000;
/*46*/	r0.w = max(r0.w, 0.000000);
/*47*/	r2.z = sqrt(r0.w);
/*48*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*49*/	r0.w = inversesqrt(r0.w);
/*50*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*51*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*54*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*55*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*56*/	r0.w = inversesqrt(r0.w);
/*57*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*58*/	r1.xyw = (r1.xxxx * r3.xyxz + r2.xyxz).xyw;
/*59*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r2.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*62*/	r1.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*63*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*66*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*67*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*68*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*69*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*70*/	r1.w = r0.w * r3.x + 0.300000;
/*71*/	r1.w = saturate(-r1.w + 1.000000);
/*72*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*73*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*74*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*75*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*76*/	r1.w = -r0.w * r3.x + 1.000000;
/*77*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*78*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*79*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*80*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*81*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*82*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*83*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*84*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*85*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*86*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*87*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*88*/	r0.w = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*89*/	r1.w = saturate(r0.w);
/*90*/	r0.w = r0.w + r0.w;
/*91*/	r6.xyz = (r2.xyzx * -r0.wwww + cb2.data[0].yzwy).xyz;
/*92*/	r0.w = r1.w * r1.w;
/*93*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*94*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*95*/	r2.w = inversesqrt(r1.w);
/*96*/	r1.w = sqrt(r1.w);
/*97*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*98*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*99*/	r2.w = r2.w * r2.w;
/*100*/	r2.w = r2.w * r2.w;
/*101*/	r0.w = r0.w * r2.w;
/*102*/	r0.w = r4.z * r0.w;
/*103*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*104*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*105*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*106*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*107*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*108*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*109*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*110*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*111*/	r0.w = max(r0.w, 0.000000);
/*112*/	r0.w = log2(r0.w);
/*113*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*114*/	r2.w = r6.x * r6.x;
/*115*/	r3.w = vsOut_T7.x * -r6.y + r6.y;
/*116*/	r3.w = vsOut_T7.y * -r3.w + r3.w;
/*117*/	r2.w = r2.w * 127.000000 + 1.600000;
/*118*/	r0.w = r0.w * r2.w;
/*119*/	r0.w = exp2(r0.w);
/*120*/	r0.w = min(r0.w, 1.000000);
/*121*/	r0.w = r0.w * r3.w;
/*122*/	r4.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*123*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*124*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*125*/	r0.w = dot(vec3(-r8.xyzx), vec3(r2.xyzx));
/*126*/	r2.w = r0.w + r0.w;
/*127*/	r0.w = saturate(-r0.w + 1.000000);
/*128*/	r0.w = r0.w * r0.w;
/*129*/	r0.w = r4.x * r0.w;
/*130*/	r0.w = r0.w * 1.500000;
/*131*/	r0.w = r5.w * r0.w;
/*132*/	r4.xyz = (r2.xyzx * -r2.wwww + -r8.xyzx).xyz;
/*133*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*134*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*135*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*136*/	r2.w = inversesqrt(r2.w);
/*137*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*138*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*139*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*140*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*141*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*142*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*143*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*144*/	r4.xyw = (r4.xxxx * r8.xyxz + r6.xyxz).xyw;
/*145*/	r4.xyz = (r4.zzzz * r9.xyzx + r4.xywx).xyz;
/*146*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*147*/	r1.x = inversesqrt(r1.x);
/*148*/	r1.x = r1.x * r1.y;
/*149*/	r1.x = max(r1.x, 0.000000);
/*150*/	r0.w = r0.w * r1.x;
/*151*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*152*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*153*/	r0.w = inversesqrt(r0.w);
/*154*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*155*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*156*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*157*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*158*/	r4.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*159*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*160*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*161*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*162*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*163*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*164*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*165*/	r0.w = r5.z * r5.x;
/*166*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*167*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*168*/	r7.w = max(r7.y, 0.000000);
/*169*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*170*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*171*/	r0.w = sqrt(r0.w);
/*172*/	r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*173*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*174*/	r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*175*/	r2.xyz = (-r1.xyzx * r5.xxxx + r2.xyzx).xyz;
/*176*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*177*/	r2.w = saturate(cb3.data[1].x)/**/;
/*178*/	r2.w = -r2.w + 1.000000;
/*179*/	r2.w = r2.w * 1000.000000;
/*180*/	r1.w = r1.w / r2.w;
/*181*/	r2.w = saturate(cb3.data[0].w)/**/;
/*182*/	r2.w = -r2.w + 1.000000;
/*183*/	r2.w = r2.w * 8.000000 + -4.000000;
/*184*/	r1.w = r1.w + r2.w;
/*185*/	r1.w = r1.w * 1.442695;
/*186*/	r1.w = exp2(r1.w);
/*187*/	r1.w = cb3.data[1].y / r1.w;
/*188*/	r1.w = saturate(-r1.w + cb3.data[1].y);
/*189*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*190*/	r2.w = r2.w + -cb3.data[1].z;
/*191*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*192*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*193*/	r2.w = saturate(r2.w * r3.x);
/*194*/	r3.x = r2.w * -2.000000 + 3.000000;
/*195*/	r2.w = r2.w * r2.w;
/*196*/	r2.w = r2.w * r3.x;
/*197*/	r1.w = cb3.data[2].x * r2.w + r1.w;
/*198*/	r2.w = saturate(dot(vec2(r1.wwww), vec2(cb3.data[2].yyyy)));
/*199*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*200*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*201*/	r2.x = max(cb3.data[2].z, 0.001000);
/*202*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*203*/	r0.w = r0.w * r2.x;
/*204*/	r0.w = min(r0.w, 1.000000);
/*205*/	r2.x = r0.w * -2.000000 + 3.000000;
/*206*/	r0.w = r0.w * r0.w;
/*207*/	r0.w = r0.w * r2.x;
/*208*/	r0.w = saturate(r1.w * r0.w);
/*209*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*210*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*211*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*212*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*213*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*214*/	color0.w = 1.000000;
/*215*/	return;
}
