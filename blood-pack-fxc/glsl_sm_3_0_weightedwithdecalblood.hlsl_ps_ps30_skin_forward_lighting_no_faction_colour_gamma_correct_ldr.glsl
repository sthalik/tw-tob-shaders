//
//
// Shader Model 4
// Fragment Shader
//
// id: 2435 - fxc/glsl_SM_3_0_weightedwithdecalblood.hlsl_PS_ps30_skin_forward_lighting_no_faction_colour_gamma_correct_LDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r1.z = sqrt(r0.w);
/*11*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*12*/	r2.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*13*/	r3.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*14*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*15*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*16*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*17*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*18*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*19*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*20*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*21*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*22*/	if(floatBitsToUint(r0.w) != 0u) {
/*23*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*24*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*25*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*26*/	  r0.w = -r0.w + 1.000000;
/*27*/	  r0.w = max(r0.w, 0.000000);
/*28*/	  r4.z = sqrt(r0.w);
/*29*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*30*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*31*/	  r0.w = r2.x * r6.w;
/*32*/	  r2.x = r0.w * -0.500000 + r2.x;
/*33*/	  r0.w = -r3.w * r5.w + 1.000000;
/*34*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*35*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*36*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*37*/	}
/*38*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*39*/	if(r0.w != 0) discard;
/*40*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*41*/	r2.zw = (r2.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*42*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*43*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*44*/	r0.w = saturate(-r0.w + r3.w);
/*45*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*46*/	if(floatBitsToUint(r0.w) != 0u) {
/*47*/	  r0.w = -r3.w + 1.000000;
/*48*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*49*/	  r0.w = -r0.w + 1.000000;
/*50*/	  r0.w = -r0.w * r0.w + 1.000000;
/*51*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*52*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*53*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*54*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*55*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*56*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*57*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*58*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*59*/	}
/*60*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*61*/	r0.w = inversesqrt(r0.w);
/*62*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*63*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*64*/	r0.w = inversesqrt(r0.w);
/*65*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*66*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*67*/	r0.w = inversesqrt(r0.w);
/*68*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*69*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*70*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*71*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*72*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*73*/	r0.w = inversesqrt(r0.w);
/*74*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*75*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*76*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*77*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*78*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*79*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*80*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*81*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*82*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*83*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*84*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*85*/	r2.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*86*/	r2.z = inversesqrt(r2.x);
/*87*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*88*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*89*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*90*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*91*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*92*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*93*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*94*/	r2.w = r2.z * r8.x + 0.300000;
/*95*/	r2.w = saturate(-r2.w + 1.000000);
/*96*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*97*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*98*/	r3.w = -r2.z * r8.x + 1.000000;
/*99*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*100*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*101*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*102*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*103*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*104*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*105*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*106*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*107*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*108*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*109*/	r2.w = saturate(r2.z);
/*110*/	r2.w = r2.w * r2.w;
/*111*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*112*/	r3.w = r3.w * r3.w;
/*113*/	r3.w = r3.w * r3.w;
/*114*/	r2.w = r2.w * r3.w;
/*115*/	r2.w = r4.z * r2.w;
/*116*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*117*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*118*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*119*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*120*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*121*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*122*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*123*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*124*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*125*/	r2.w = inversesqrt(r2.w);
/*126*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*127*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*128*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*129*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*130*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*131*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*132*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*133*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*134*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*135*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*136*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*137*/	r2.w = r7.z * r7.x;
/*138*/	r2.y = r2.y * r2.y;
/*139*/	r2.z = r2.z + r2.z;
/*140*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*141*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*142*/	r2.z = max(r2.z, 0.000000);
/*143*/	r2.y = r2.y * 127.000000 + 1.600000;
/*144*/	r2.z = log2(r2.z);
/*145*/	r2.y = r2.z * r2.y;
/*146*/	r2.y = exp2(r2.y);
/*147*/	r2.y = min(r2.y, 1.000000);
/*148*/	r1.w = r1.w * r2.y;
/*149*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*150*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*151*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*152*/	r2.y = r1.w + r1.w;
/*153*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*154*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*155*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*156*/	r2.y = inversesqrt(r2.y);
/*157*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*158*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*159*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*160*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*161*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*162*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*163*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*164*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*165*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*166*/	r1.w = saturate(-r1.w + 1.000000);
/*167*/	r1.w = r1.w * r1.w;
/*168*/	r1.w = r4.x * r1.w;
/*169*/	r1.w = r1.w * 1.500000;
/*170*/	r1.w = r7.w * r1.w;
/*171*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*172*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*173*/	r0.w = inversesqrt(r0.w);
/*174*/	r0.w = r0.w * r1.y;
/*175*/	r0.w = max(r0.w, 0.000000);
/*176*/	r0.w = r0.w * r1.w;
/*177*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*178*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*179*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*180*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*181*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*182*/	r1.w = 1.000000;
/*183*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*184*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*185*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*186*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*187*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*188*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*189*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*190*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*191*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*192*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*193*/	if(r0.w != 0) discard;
/*194*/	r0.w = sqrt(r2.x);
/*195*/	r1.x = saturate(cb3.data[0].w)/**/;
/*196*/	r1.x = -r1.x + 1.000000;
/*197*/	r1.x = r1.x * 8.000000 + -4.000000;
/*198*/	r1.y = saturate(cb3.data[1].x)/**/;
/*199*/	r1.y = -r1.y + 1.000000;
/*200*/	r1.y = r1.y * 1000.000000;
/*201*/	r0.w = r0.w / r1.y;
/*202*/	r0.w = r0.w + r1.x;
/*203*/	r0.w = r0.w * 1.442695;
/*204*/	r0.w = exp2(r0.w);
/*205*/	r0.w = cb3.data[1].y / r0.w;
/*206*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*207*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*208*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*209*/	r1.x = r1.x + -cb3.data[1].z;
/*210*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*211*/	r1.x = saturate(r1.y * r1.x);
/*212*/	r1.y = r1.x * -2.000000 + 3.000000;
/*213*/	r1.x = r1.x * r1.x;
/*214*/	r1.x = r1.x * r1.y;
/*215*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*216*/	r1.y = sqrt(r1.y);
/*217*/	r1.z = max(cb3.data[2].z, 0.001000);
/*218*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*219*/	r1.y = r1.z * r1.y;
/*220*/	r1.y = min(r1.y, 1.000000);
/*221*/	r1.z = r1.y * -2.000000 + 3.000000;
/*222*/	r1.y = r1.y * r1.y;
/*223*/	r1.y = r1.y * r1.z;
/*224*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*225*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*226*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*227*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*228*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*229*/	r5.w = max(r5.y, 0.000000);
/*230*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*231*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*232*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*233*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*234*/	r0.w = saturate(r0.w * r1.y);
/*235*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*236*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*237*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*238*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*239*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*240*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*241*/	color0.w = 1.000000;
/*242*/	return;
}
