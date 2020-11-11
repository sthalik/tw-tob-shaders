//
//
// Shader Model 4
// Fragment Shader
//
// id: 1933 - fxc/glsl_SM_3_0_weightedwithdirt.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
/*28*/	r0.w = -vsOut_T4.z + 1.000000;
/*29*/	r1.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*30*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*31*/	r1.xyz = (r0.xyzx * vec4(5.000000, 5.000000, 5.000000, 0.000000) + vec4(0.200000, 0.200000, 0.200000, 0.000000)).xyz;
/*32*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*33*/	r0.xyz = saturate(vsOut_T7.xxxx * r1.xyzx + r0.xyzx).xyz;
/*34*/	r0.w = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*35*/	r1.xyz = (-r0.xyzx + r0.wwww).xyz;
/*36*/	r0.xyz = (vsOut_T7.yyyy * r1.xyzx + r0.xyzx).xyz;
/*37*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*38*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*39*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*40*/	r2.xy = (r2.xyxx * r3.wwww + r1.xyxx).xy;
/*41*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*42*/	r0.w = -r0.w + 1.000000;
/*43*/	r0.w = max(r0.w, 0.000000);
/*44*/	r2.z = sqrt(r0.w);
/*45*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*46*/	r0.w = inversesqrt(r0.w);
/*47*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*48*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*49*/	r0.w = inversesqrt(r0.w);
/*50*/	r2.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*51*/	r2.xyz = (r1.yyyy * r2.xyzx).xyz;
/*52*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*53*/	r0.w = inversesqrt(r0.w);
/*54*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*55*/	r1.xyw = (r1.xxxx * r3.xyxz + r2.xyxz).xyw;
/*56*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r2.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*59*/	r1.xyz = (r1.zzzz * r2.xyzx + r1.xywx).xyz;
/*60*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r2.xyz = (r0.wwww * r1.xyzx).xyz;
/*63*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*64*/	r0.w = dot(vec3(r2.xyzx), vec3(-cb2.data[0].yzwy));
/*65*/	r3.xyz = (r0.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*66*/	r3.xyz = saturate(r3.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*67*/	r1.w = r0.w * r3.x + 0.300000;
/*68*/	r1.w = saturate(-r1.w + 1.000000);
/*69*/	r4.xyz = (r3.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*70*/	r5.xyz = (r1.wwww * r4.xyzx).xyz;
/*71*/	r4.xyz = (-r4.xyzx * r1.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*72*/	r5.xyz = (r0.wwww * r3.xxxx + r5.xyzx).xyz;
/*73*/	r1.w = -r0.w * r3.x + 1.000000;
/*74*/	r3.xyz = (r3.zzzz * vec4(0.320000, 0.050000, 0.006000, 0.000000)).xyz;
/*75*/	r3.xyz = (r1.wwww * r3.xyzx).xyz;
/*76*/	r3.xyz = (r3.xyzx * r4.xyzx + r5.xyzx).xyz;
/*77*/	r3.xyz = (-r0.wwww + r3.xyzx).xyz;
/*78*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*79*/	r3.xyz = saturate(r4.yyyy * r3.xyzx + r0.wwww).xyz;
/*80*/	r3.xyz = (r0.xyzx * r3.xyzx).xyz;
/*81*/	r3.xyz = (r3.xyzx * cb2.data[1].xyzx).xyz;
/*82*/	r0.w = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*83*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r0.wwww), uvec4(0)));
/*84*/	r3.xyz = (r3.xyzx * r5.xxxx).xyz;
/*85*/	r0.w = dot(vec3(r2.xyzx), vec3(cb2.data[0].yzwy));
/*86*/	r1.w = saturate(r0.w);
/*87*/	r0.w = r0.w + r0.w;
/*88*/	r6.xyz = (r2.xyzx * -r0.wwww + cb2.data[0].yzwy).xyz;
/*89*/	r0.w = r1.w * r1.w;
/*90*/	r7.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*91*/	r1.w = dot(vec3(r7.xyzx), vec3(r7.xyzx));
/*92*/	r2.w = inversesqrt(r1.w);
/*93*/	r1.w = sqrt(r1.w);
/*94*/	r8.xyz = (r2.wwww * r7.xyzx).xyz;
/*95*/	r2.w = saturate(dot(vec3(r8.xyzx), vec3(-cb2.data[0].yzwy)));
/*96*/	r2.w = r2.w * r2.w;
/*97*/	r2.w = r2.w * r2.w;
/*98*/	r0.w = r0.w * r2.w;
/*99*/	r0.w = r4.z * r0.w;
/*100*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*101*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*102*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*103*/	r4.yzw = (r0.wwww * r4.yyzw).yzw;
/*104*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*105*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*106*/	r3.xyz = (r3.xyzx * vec4(0.900000, 0.900000, 0.900000, 0.000000) + r4.yzwy).xyz;
/*107*/	r0.w = dot(vec3(r6.xyzx), vec3(-r8.xyzx));
/*108*/	r0.w = max(r0.w, 0.000000);
/*109*/	r0.w = log2(r0.w);
/*110*/	r6.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*111*/	r2.w = r6.x * r6.x;
/*112*/	r3.w = vsOut_T7.x * -r6.y + r6.y;
/*113*/	r3.w = vsOut_T7.y * -r3.w + r3.w;
/*114*/	r2.w = r2.w * 127.000000 + 1.600000;
/*115*/	r0.w = r0.w * r2.w;
/*116*/	r0.w = exp2(r0.w);
/*117*/	r0.w = min(r0.w, 1.000000);
/*118*/	r0.w = r0.w * r3.w;
/*119*/	r4.yzw = (r0.wwww * cb2.data[1].xxyz).yzw;
/*120*/	r4.yzw = (r5.xxxx * r4.yyzw).yzw;
/*121*/	r3.xyz = (r4.yzwy * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r3.xyzx).xyz;
/*122*/	r0.w = dot(vec3(-r8.xyzx), vec3(r2.xyzx));
/*123*/	r2.w = r0.w + r0.w;
/*124*/	r0.w = saturate(-r0.w + 1.000000);
/*125*/	r0.w = r0.w * r0.w;
/*126*/	r0.w = r4.x * r0.w;
/*127*/	r0.w = r0.w * 1.500000;
/*128*/	r0.w = r5.w * r0.w;
/*129*/	r4.xyz = (r2.xyzx * -r2.wwww + -r8.xyzx).xyz;
/*130*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*131*/	r4.xyz = (r4.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*132*/	r2.w = dot(vec3(r4.xyzx), vec3(r4.xyzx));
/*133*/	r2.w = inversesqrt(r2.w);
/*134*/	r4.xyz = (r2.wwww * r4.xyzx).xyz;
/*135*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r4.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*136*/	r4.xyz = (r4.xyzx * r4.xyzx).xyz;
/*137*/	r8.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*138*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*139*/	r9.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*140*/	r6.xyz = (r4.yyyy * r6.xywx).xyz;
/*141*/	r4.xyw = (r4.xxxx * r8.xyxz + r6.xyxz).xyw;
/*142*/	r4.xyz = (r4.zzzz * r9.xyzx + r4.xywx).xyz;
/*143*/	r1.x = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*144*/	r1.x = inversesqrt(r1.x);
/*145*/	r1.x = r1.x * r1.y;
/*146*/	r1.x = max(r1.x, 0.000000);
/*147*/	r0.w = r0.w * r1.x;
/*148*/	r1.xyz = (r4.xyzx * r0.wwww).xyz;
/*149*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*150*/	r0.w = inversesqrt(r0.w);
/*151*/	r2.xyz = (r0.wwww * r2.xyzx).xyz;
/*152*/	r4.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*153*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*154*/	r6.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r4.xxxx), uvec4(0)))).xyz/**/;
/*155*/	r4.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r4.yyyy), uvec4(0)))).xyw/**/;
/*156*/	r8.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r4.zzzz), uvec4(0)))).xyz/**/;
/*157*/	r4.xyz = (r2.yyyy * r4.xywx).xyz;
/*158*/	r2.xyw = (r2.xxxx * r6.xyxz + r4.xyxz).xyw;
/*159*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*160*/	r0.xyz = (r0.xyzx * r2.xyzx).xyz;
/*161*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*162*/	r0.w = r5.z * r5.x;
/*163*/	r0.xyz = (r0.xyzx * r0.wwww + r1.xyzx).xyz;
/*164*/	r0.xyz = (r3.xyzx + r0.xyzx).xyz;
/*165*/	r7.w = max(r7.y, 0.000000);
/*166*/	r2.xyzw = (texture(s_sky, r7.xwzx.stp)).xyzw;
/*167*/	r0.w = dot(vec2(r7.xzxx), vec2(r7.xzxx));
/*168*/	r0.w = sqrt(r0.w);
/*169*/	r1.xyz = (cb2.data[1].xyzx * cb3.data[0].xyzx).xyz;
/*170*/	r1.xyz = (r1.xyzx * vec4(1.500000, 1.500000, 1.500000, 0.000000)).xyz;
/*171*/	r1.xyz = (r1.xyzx * abs(cb2.data[0].zzzz)).xyz;
/*172*/	r2.xyz = (-r1.xyzx * r5.xxxx + r2.xyzx).xyz;
/*173*/	r1.xyz = (r5.xxxx * r1.xyzx).xyz;
/*174*/	r2.w = saturate(cb3.data[1].x)/**/;
/*175*/	r2.w = -r2.w + 1.000000;
/*176*/	r2.w = r2.w * 1000.000000;
/*177*/	r1.w = r1.w / r2.w;
/*178*/	r2.w = saturate(cb3.data[0].w)/**/;
/*179*/	r2.w = -r2.w + 1.000000;
/*180*/	r2.w = r2.w * 8.000000 + -4.000000;
/*181*/	r1.w = r1.w + r2.w;
/*182*/	r1.w = r1.w * 1.442695;
/*183*/	r1.w = exp2(r1.w);
/*184*/	r1.w = cb3.data[1].y / r1.w;
/*185*/	r1.w = saturate(-r1.w + cb3.data[1].y);
/*186*/	r2.w = -vsOut_T0.y + cb3.data[1].w;
/*187*/	r2.w = r2.w + -cb3.data[1].z;
/*188*/	r3.x = -cb3.data[1].z + cb3.data[1].w;
/*189*/	r3.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r3.x)).x;
/*190*/	r2.w = saturate(r2.w * r3.x);
/*191*/	r3.x = r2.w * -2.000000 + 3.000000;
/*192*/	r2.w = r2.w * r2.w;
/*193*/	r2.w = r2.w * r3.x;
/*194*/	r1.w = cb3.data[2].x * r2.w + r1.w;
/*195*/	r2.w = saturate(dot(vec2(r1.wwww), vec2(cb3.data[2].yyyy)));
/*196*/	r1.xyz = (r2.wwww * r2.xyzx + r1.xyzx).xyz;
/*197*/	r1.xyz = (-r0.xyzx + r1.xyzx).xyz;
/*198*/	r2.x = max(cb3.data[2].z, 0.001000);
/*199*/	r2.x = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r2.x)).x;
/*200*/	r0.w = r0.w * r2.x;
/*201*/	r0.w = min(r0.w, 1.000000);
/*202*/	r2.x = r0.w * -2.000000 + 3.000000;
/*203*/	r0.w = r0.w * r0.w;
/*204*/	r0.w = r0.w * r2.x;
/*205*/	r0.w = saturate(r1.w * r0.w);
/*206*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*207*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*208*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*209*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*210*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*211*/	color0.w = 1.000000;
/*212*/	return;
}
