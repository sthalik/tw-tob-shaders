//
//
// Shader Model 4
// Fragment Shader
//
// id: 2503 - fxc/glsl_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_skin_forward_lighting_gamma_correct_LDR.glsl
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
in vec4 vsOut_T8;

layout(location = 0) out vec4 color0;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2D s_skin_mask_map;
uniform samplerCube s_sky;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;

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
  vec4 r10;
  vec4 r11;
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
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb5.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb5.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb5.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r1.z = sqrt(r0.w);
/*18*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*19*/	r2.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*20*/	r3.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*21*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*22*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*23*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*24*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*27*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*28*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*29*/	if(floatBitsToUint(r0.w) != 0u) {
/*30*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*31*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*32*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*33*/	  r0.w = -r0.w + 1.000000;
/*34*/	  r0.w = max(r0.w, 0.000000);
/*35*/	  r4.z = sqrt(r0.w);
/*36*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*37*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*38*/	  r0.w = r2.x * r6.w;
/*39*/	  r2.x = r0.w * -0.500000 + r2.x;
/*40*/	  r0.w = -r3.w * r5.w + 1.000000;
/*41*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*42*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*43*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*44*/	}
/*45*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*46*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*47*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*48*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*49*/	r0.w = r3.w * r4.w;
/*50*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*51*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*52*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*53*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*54*/	r0.w = inversesqrt(r0.w);
/*55*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*56*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*57*/	if(r0.w != 0) discard;
/*58*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*59*/	r2.zw = (r2.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*60*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*61*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*62*/	r0.w = saturate(-r0.w + r3.w);
/*63*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*64*/	if(floatBitsToUint(r0.w) != 0u) {
/*65*/	  r0.w = -r3.w + 1.000000;
/*66*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*67*/	  r0.w = -r0.w + 1.000000;
/*68*/	  r0.w = -r0.w * r0.w + 1.000000;
/*69*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*70*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*71*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*72*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*73*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*74*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*75*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*76*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*77*/	}
/*78*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*79*/	r0.w = inversesqrt(r0.w);
/*80*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*81*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*82*/	r0.w = inversesqrt(r0.w);
/*83*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*84*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*85*/	r0.w = inversesqrt(r0.w);
/*86*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*87*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*88*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*89*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*90*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*91*/	r0.w = inversesqrt(r0.w);
/*92*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*93*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*94*/	r1.w = -vsOut_T4.z + 1.000000;
/*95*/	r5.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*96*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*97*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*98*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*99*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*100*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*101*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*102*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*103*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*104*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*105*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*106*/	r2.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*107*/	r2.z = inversesqrt(r2.x);
/*108*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*109*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*110*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*111*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*112*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*113*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*114*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*115*/	r2.w = r2.z * r8.x + 0.300000;
/*116*/	r2.w = saturate(-r2.w + 1.000000);
/*117*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*118*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*119*/	r3.w = -r2.z * r8.x + 1.000000;
/*120*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*121*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*122*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*123*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*124*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*125*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*126*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*127*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*128*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*129*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*130*/	r2.w = saturate(r2.z);
/*131*/	r2.w = r2.w * r2.w;
/*132*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*133*/	r3.w = r3.w * r3.w;
/*134*/	r3.w = r3.w * r3.w;
/*135*/	r2.w = r2.w * r3.w;
/*136*/	r2.w = r4.z * r2.w;
/*137*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*138*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*139*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*140*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*141*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*142*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*143*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*144*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*145*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*146*/	r2.w = inversesqrt(r2.w);
/*147*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*148*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*149*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*150*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*151*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*152*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*153*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*154*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*155*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*156*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*157*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*158*/	r2.w = r7.z * r7.x;
/*159*/	r2.y = r2.y * r2.y;
/*160*/	r2.z = r2.z + r2.z;
/*161*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*162*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*163*/	r2.z = max(r2.z, 0.000000);
/*164*/	r2.y = r2.y * 127.000000 + 1.600000;
/*165*/	r2.z = log2(r2.z);
/*166*/	r2.y = r2.z * r2.y;
/*167*/	r2.y = exp2(r2.y);
/*168*/	r2.y = min(r2.y, 1.000000);
/*169*/	r1.w = r1.w * r2.y;
/*170*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*171*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*172*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*173*/	r2.y = r1.w + r1.w;
/*174*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*175*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*176*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*177*/	r2.y = inversesqrt(r2.y);
/*178*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*179*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*180*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*181*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*182*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*183*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*184*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*185*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*186*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*187*/	r1.w = saturate(-r1.w + 1.000000);
/*188*/	r1.w = r1.w * r1.w;
/*189*/	r1.w = r4.x * r1.w;
/*190*/	r1.w = r1.w * 1.500000;
/*191*/	r1.w = r7.w * r1.w;
/*192*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*193*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*194*/	r0.w = inversesqrt(r0.w);
/*195*/	r0.w = r0.w * r1.y;
/*196*/	r0.w = max(r0.w, 0.000000);
/*197*/	r0.w = r0.w * r1.w;
/*198*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*199*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*200*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*201*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*202*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*203*/	r1.w = 1.000000;
/*204*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*205*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*206*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*207*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*208*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*209*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*210*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*211*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*212*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*213*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*214*/	if(r0.w != 0) discard;
/*215*/	r0.w = sqrt(r2.x);
/*216*/	r1.x = saturate(cb3.data[0].w)/**/;
/*217*/	r1.x = -r1.x + 1.000000;
/*218*/	r1.x = r1.x * 8.000000 + -4.000000;
/*219*/	r1.y = saturate(cb3.data[1].x)/**/;
/*220*/	r1.y = -r1.y + 1.000000;
/*221*/	r1.y = r1.y * 1000.000000;
/*222*/	r0.w = r0.w / r1.y;
/*223*/	r0.w = r0.w + r1.x;
/*224*/	r0.w = r0.w * 1.442695;
/*225*/	r0.w = exp2(r0.w);
/*226*/	r0.w = cb3.data[1].y / r0.w;
/*227*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*228*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*229*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*230*/	r1.x = r1.x + -cb3.data[1].z;
/*231*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*232*/	r1.x = saturate(r1.y * r1.x);
/*233*/	r1.y = r1.x * -2.000000 + 3.000000;
/*234*/	r1.x = r1.x * r1.x;
/*235*/	r1.x = r1.x * r1.y;
/*236*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*237*/	r1.y = sqrt(r1.y);
/*238*/	r1.z = max(cb3.data[2].z, 0.001000);
/*239*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*240*/	r1.y = r1.z * r1.y;
/*241*/	r1.y = min(r1.y, 1.000000);
/*242*/	r1.z = r1.y * -2.000000 + 3.000000;
/*243*/	r1.y = r1.y * r1.y;
/*244*/	r1.y = r1.y * r1.z;
/*245*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*246*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*247*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*248*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*249*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*250*/	r5.w = max(r5.y, 0.000000);
/*251*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*252*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*253*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*254*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*255*/	r0.w = saturate(r0.w * r1.y);
/*256*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*257*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*258*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*259*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*260*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*261*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*262*/	color0.w = 1.000000;
/*263*/	return;
}
