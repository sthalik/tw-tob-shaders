//
//
// Shader Model 4
// Fragment Shader
//
// id: 2509 - fxc/glsl_SM_3_0_weightedwithdecaldirtblood.hlsl_PS_ps30_skin_forward_lighting_noclip_no_faction_colour_gamma_correct_LDR.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;

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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r1.z = sqrt(r0.w);
/*8*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*9*/	r2.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*10*/	r3.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*11*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*12*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*13*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*14*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*15*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*16*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*17*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*18*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*19*/	if(floatBitsToUint(r0.w) != 0u) {
/*20*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*21*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*22*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*23*/	  r0.w = -r0.w + 1.000000;
/*24*/	  r0.w = max(r0.w, 0.000000);
/*25*/	  r4.z = sqrt(r0.w);
/*26*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*27*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*28*/	  r0.w = r2.x * r6.w;
/*29*/	  r2.x = r0.w * -0.500000 + r2.x;
/*30*/	  r0.w = -r3.w * r5.w + 1.000000;
/*31*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*32*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*33*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*34*/	}
/*35*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*36*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*37*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*38*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*39*/	r0.w = r3.w * r4.w;
/*40*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*41*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*42*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*43*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*46*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*47*/	if(r0.w != 0) discard;
/*48*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*49*/	r2.zw = (r2.zzzw * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*50*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*51*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*52*/	r0.w = saturate(-r0.w + r3.w);
/*53*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*54*/	if(floatBitsToUint(r0.w) != 0u) {
/*55*/	  r0.w = -r3.w + 1.000000;
/*56*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*57*/	  r0.w = -r0.w + 1.000000;
/*58*/	  r0.w = -r0.w * r0.w + 1.000000;
/*59*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*60*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*61*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*62*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*63*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*64*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*65*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*66*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*67*/	}
/*68*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*69*/	r0.w = inversesqrt(r0.w);
/*70*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*71*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*72*/	r0.w = inversesqrt(r0.w);
/*73*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*74*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*75*/	r0.w = inversesqrt(r0.w);
/*76*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*77*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*78*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*79*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*80*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*81*/	r0.w = inversesqrt(r0.w);
/*82*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*83*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*84*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*85*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*86*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*87*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*88*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*89*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*90*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*91*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*92*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*93*/	r2.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*94*/	r2.z = inversesqrt(r2.x);
/*95*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*96*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*97*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*98*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*99*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*100*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*101*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*102*/	r2.w = r2.z * r8.x + 0.300000;
/*103*/	r2.w = saturate(-r2.w + 1.000000);
/*104*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*105*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*106*/	r3.w = -r2.z * r8.x + 1.000000;
/*107*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*108*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*109*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*110*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*111*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*112*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*113*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*114*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*115*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*116*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*117*/	r2.w = saturate(r2.z);
/*118*/	r2.w = r2.w * r2.w;
/*119*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*120*/	r3.w = r3.w * r3.w;
/*121*/	r3.w = r3.w * r3.w;
/*122*/	r2.w = r2.w * r3.w;
/*123*/	r2.w = r4.z * r2.w;
/*124*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*125*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*126*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*127*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*128*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*129*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*130*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*131*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*132*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*133*/	r2.w = inversesqrt(r2.w);
/*134*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*135*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*136*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*137*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*138*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*139*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*140*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*141*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*142*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*143*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*144*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*145*/	r2.w = r7.z * r7.x;
/*146*/	r2.y = r2.y * r2.y;
/*147*/	r2.z = r2.z + r2.z;
/*148*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*149*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*150*/	r2.z = max(r2.z, 0.000000);
/*151*/	r2.y = r2.y * 127.000000 + 1.600000;
/*152*/	r2.z = log2(r2.z);
/*153*/	r2.y = r2.z * r2.y;
/*154*/	r2.y = exp2(r2.y);
/*155*/	r2.y = min(r2.y, 1.000000);
/*156*/	r1.w = r1.w * r2.y;
/*157*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*158*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*159*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*160*/	r2.y = r1.w + r1.w;
/*161*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*162*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*163*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*164*/	r2.y = inversesqrt(r2.y);
/*165*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*166*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*167*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*168*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*169*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*170*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*171*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*172*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*173*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*174*/	r1.w = saturate(-r1.w + 1.000000);
/*175*/	r1.w = r1.w * r1.w;
/*176*/	r1.w = r4.x * r1.w;
/*177*/	r1.w = r1.w * 1.500000;
/*178*/	r1.w = r7.w * r1.w;
/*179*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*180*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*181*/	r0.w = inversesqrt(r0.w);
/*182*/	r0.w = r0.w * r1.y;
/*183*/	r0.w = max(r0.w, 0.000000);
/*184*/	r0.w = r0.w * r1.w;
/*185*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*186*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*187*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*188*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*189*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*190*/	r1.w = 1.000000;
/*191*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*192*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*193*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*194*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*195*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*196*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*197*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*198*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*199*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*200*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*201*/	if(r0.w != 0) discard;
/*202*/	r0.w = sqrt(r2.x);
/*203*/	r1.x = saturate(cb3.data[0].w)/**/;
/*204*/	r1.x = -r1.x + 1.000000;
/*205*/	r1.x = r1.x * 8.000000 + -4.000000;
/*206*/	r1.y = saturate(cb3.data[1].x)/**/;
/*207*/	r1.y = -r1.y + 1.000000;
/*208*/	r1.y = r1.y * 1000.000000;
/*209*/	r0.w = r0.w / r1.y;
/*210*/	r0.w = r0.w + r1.x;
/*211*/	r0.w = r0.w * 1.442695;
/*212*/	r0.w = exp2(r0.w);
/*213*/	r0.w = cb3.data[1].y / r0.w;
/*214*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*215*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*216*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*217*/	r1.x = r1.x + -cb3.data[1].z;
/*218*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*219*/	r1.x = saturate(r1.y * r1.x);
/*220*/	r1.y = r1.x * -2.000000 + 3.000000;
/*221*/	r1.x = r1.x * r1.x;
/*222*/	r1.x = r1.x * r1.y;
/*223*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*224*/	r1.y = sqrt(r1.y);
/*225*/	r1.z = max(cb3.data[2].z, 0.001000);
/*226*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*227*/	r1.y = r1.z * r1.y;
/*228*/	r1.y = min(r1.y, 1.000000);
/*229*/	r1.z = r1.y * -2.000000 + 3.000000;
/*230*/	r1.y = r1.y * r1.y;
/*231*/	r1.y = r1.y * r1.z;
/*232*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*233*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*234*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*235*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*236*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*237*/	r5.w = max(r5.y, 0.000000);
/*238*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*239*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*240*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*241*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*242*/	r0.w = saturate(r0.w * r1.y);
/*243*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*244*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*245*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*246*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*247*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*248*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*249*/	color0.w = 1.000000;
/*250*/	return;
}
