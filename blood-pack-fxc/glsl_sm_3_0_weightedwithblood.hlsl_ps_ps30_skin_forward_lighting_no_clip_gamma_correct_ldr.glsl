//
//
// Shader Model 4
// Fragment Shader
//
// id: 2145 - fxc/glsl_SM_3_0_weightedwithblood.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_blood_map;
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb5.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb5.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb5.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*9*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*11*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r0.w = sqrt(r0.w);
/*15*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*16*/	if(r1.z != 0) discard;
/*17*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*18*/	r1.zw = (r1.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*19*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*20*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*21*/	r1.z = saturate(-r1.z + r2.w);
/*22*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*23*/	if(floatBitsToUint(r1.z) != 0u) {
/*24*/	  r1.z = -r2.w + 1.000000;
/*25*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*26*/	  r1.z = -r1.z + 1.000000;
/*27*/	  r1.z = -r1.z * r1.z + 1.000000;
/*28*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*29*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*30*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*31*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*32*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*33*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*34*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*35*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*36*/	} else {
/*37*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*38*/	}
/*39*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*40*/	r1.z = inversesqrt(r1.z);
/*41*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*42*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*43*/	r1.z = inversesqrt(r1.z);
/*44*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*45*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*46*/	r1.z = inversesqrt(r1.z);
/*47*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*48*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*49*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*50*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*51*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*54*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*55*/	r1.w = -vsOut_T4.z + 1.000000;
/*56*/	r5.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*57*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*58*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*59*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*60*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*61*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*62*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*63*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*64*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*65*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*66*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*67*/	r2.y = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*68*/	r2.z = inversesqrt(r2.y);
/*69*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*70*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*71*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*72*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*73*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*74*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*75*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*76*/	r2.w = r2.z * r8.x + 0.300000;
/*77*/	r2.w = saturate(-r2.w + 1.000000);
/*78*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*79*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*80*/	r3.w = -r2.z * r8.x + 1.000000;
/*81*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*82*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*83*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*84*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*85*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*86*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*87*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*88*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*89*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*90*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*91*/	r2.w = saturate(r2.z);
/*92*/	r2.w = r2.w * r2.w;
/*93*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*94*/	r3.w = r3.w * r3.w;
/*95*/	r3.w = r3.w * r3.w;
/*96*/	r2.w = r2.w * r3.w;
/*97*/	r2.w = r4.z * r2.w;
/*98*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*99*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*100*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*101*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*102*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*103*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*104*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*105*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*106*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*107*/	r2.w = inversesqrt(r2.w);
/*108*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*109*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*110*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*111*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*112*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*113*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*114*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*115*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*116*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*117*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*118*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*119*/	r2.w = r7.z * r7.x;
/*120*/	r2.x = r2.x * r2.x;
/*121*/	r2.z = r2.z + r2.z;
/*122*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*123*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*124*/	r2.z = max(r2.z, 0.000000);
/*125*/	r2.x = r2.x * 127.000000 + 1.600000;
/*126*/	r2.z = log2(r2.z);
/*127*/	r2.x = r2.z * r2.x;
/*128*/	r2.x = exp2(r2.x);
/*129*/	r2.x = min(r2.x, 1.000000);
/*130*/	r1.w = r1.w * r2.x;
/*131*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*132*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*133*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*134*/	r2.x = r1.w + r1.w;
/*135*/	r3.xyz = (r3.xyzx * -r2.xxxx + -r6.xyzx).xyz;
/*136*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*137*/	r2.x = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*138*/	r2.x = inversesqrt(r2.x);
/*139*/	r3.xyz = (r2.xxxx * r3.xyzx).xyz;
/*140*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*141*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*142*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*143*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*144*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*145*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*146*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*147*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*148*/	r1.w = saturate(-r1.w + 1.000000);
/*149*/	r1.w = r1.w * r1.w;
/*150*/	r1.w = r4.x * r1.w;
/*151*/	r1.w = r1.w * 1.500000;
/*152*/	r1.w = r7.w * r1.w;
/*153*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*154*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*155*/	r0.w = inversesqrt(r0.w);
/*156*/	r0.w = r0.w * r1.y;
/*157*/	r0.w = max(r0.w, 0.000000);
/*158*/	r0.w = r0.w * r1.w;
/*159*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*160*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*161*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*162*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*163*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*164*/	r1.w = 1.000000;
/*165*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*166*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*167*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*168*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*169*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*170*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*171*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*172*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*173*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*174*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*175*/	if(r0.w != 0) discard;
/*176*/	r0.w = sqrt(r2.y);
/*177*/	r1.x = saturate(cb3.data[0].w)/**/;
/*178*/	r1.x = -r1.x + 1.000000;
/*179*/	r1.x = r1.x * 8.000000 + -4.000000;
/*180*/	r1.y = saturate(cb3.data[1].x)/**/;
/*181*/	r1.y = -r1.y + 1.000000;
/*182*/	r1.y = r1.y * 1000.000000;
/*183*/	r0.w = r0.w / r1.y;
/*184*/	r0.w = r0.w + r1.x;
/*185*/	r0.w = r0.w * 1.442695;
/*186*/	r0.w = exp2(r0.w);
/*187*/	r0.w = cb3.data[1].y / r0.w;
/*188*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*189*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*190*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*191*/	r1.x = r1.x + -cb3.data[1].z;
/*192*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*193*/	r1.x = saturate(r1.y * r1.x);
/*194*/	r1.y = r1.x * -2.000000 + 3.000000;
/*195*/	r1.x = r1.x * r1.x;
/*196*/	r1.x = r1.x * r1.y;
/*197*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*198*/	r1.y = sqrt(r1.y);
/*199*/	r1.z = max(cb3.data[2].z, 0.001000);
/*200*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*201*/	r1.y = r1.z * r1.y;
/*202*/	r1.y = min(r1.y, 1.000000);
/*203*/	r1.z = r1.y * -2.000000 + 3.000000;
/*204*/	r1.y = r1.y * r1.y;
/*205*/	r1.y = r1.y * r1.z;
/*206*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*207*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*208*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*209*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*210*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*211*/	r5.w = max(r5.y, 0.000000);
/*212*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*213*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*214*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*215*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*216*/	r0.w = saturate(r0.w * r1.y);
/*217*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*218*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*219*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*220*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*221*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*222*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*223*/	color0.w = 1.000000;
/*224*/	return;
}
