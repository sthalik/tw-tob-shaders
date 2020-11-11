//
//
// Shader Model 4
// Fragment Shader
//
// id: 1998 - fxc/glsl_SM_3_0_weightedwithdecal.hlsl_PS_ps30_skin_forward_lighting_gamma_correct_LDR.glsl
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
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
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
/*45*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*46*/	r0.w = inversesqrt(r0.w);
/*47*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*48*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*49*/	r0.w = inversesqrt(r0.w);
/*50*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*51*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*54*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*55*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*56*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*57*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*58*/	r0.w = inversesqrt(r0.w);
/*59*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*60*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*61*/	r1.w = -vsOut_T4.z + 1.000000;
/*62*/	r5.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*63*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*64*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*65*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*66*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*67*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*68*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*69*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*70*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*71*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*72*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*73*/	r2.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*74*/	r2.z = inversesqrt(r2.x);
/*75*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*76*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*77*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*78*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*79*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*80*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*81*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*82*/	r2.w = r2.z * r8.x + 0.300000;
/*83*/	r2.w = saturate(-r2.w + 1.000000);
/*84*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*85*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*86*/	r3.w = -r2.z * r8.x + 1.000000;
/*87*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*88*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*89*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*90*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*91*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*92*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*93*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*94*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*95*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*96*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*97*/	r2.w = saturate(r2.z);
/*98*/	r2.w = r2.w * r2.w;
/*99*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*100*/	r3.w = r3.w * r3.w;
/*101*/	r3.w = r3.w * r3.w;
/*102*/	r2.w = r2.w * r3.w;
/*103*/	r2.w = r4.z * r2.w;
/*104*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*105*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*106*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*107*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*108*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*109*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*110*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*111*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*112*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*113*/	r2.w = inversesqrt(r2.w);
/*114*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*115*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*116*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*117*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*118*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*119*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*120*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*121*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*122*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*123*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*124*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*125*/	r2.w = r7.z * r7.x;
/*126*/	r2.y = r2.y * r2.y;
/*127*/	r2.z = r2.z + r2.z;
/*128*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*129*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*130*/	r2.z = max(r2.z, 0.000000);
/*131*/	r2.y = r2.y * 127.000000 + 1.600000;
/*132*/	r2.z = log2(r2.z);
/*133*/	r2.y = r2.z * r2.y;
/*134*/	r2.y = exp2(r2.y);
/*135*/	r2.y = min(r2.y, 1.000000);
/*136*/	r1.w = r1.w * r2.y;
/*137*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*138*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*139*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*140*/	r2.y = r1.w + r1.w;
/*141*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*142*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*143*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*144*/	r2.y = inversesqrt(r2.y);
/*145*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*146*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*147*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*148*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*149*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*150*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*151*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*152*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*153*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*154*/	r1.w = saturate(-r1.w + 1.000000);
/*155*/	r1.w = r1.w * r1.w;
/*156*/	r1.w = r4.x * r1.w;
/*157*/	r1.w = r1.w * 1.500000;
/*158*/	r1.w = r7.w * r1.w;
/*159*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*160*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*161*/	r0.w = inversesqrt(r0.w);
/*162*/	r0.w = r0.w * r1.y;
/*163*/	r0.w = max(r0.w, 0.000000);
/*164*/	r0.w = r0.w * r1.w;
/*165*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*166*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*167*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*168*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*169*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*170*/	r1.w = 1.000000;
/*171*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*172*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*173*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*174*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*175*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*176*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*177*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*178*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*179*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*180*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*181*/	if(r0.w != 0) discard;
/*182*/	r0.w = sqrt(r2.x);
/*183*/	r1.x = saturate(cb3.data[0].w)/**/;
/*184*/	r1.x = -r1.x + 1.000000;
/*185*/	r1.x = r1.x * 8.000000 + -4.000000;
/*186*/	r1.y = saturate(cb3.data[1].x)/**/;
/*187*/	r1.y = -r1.y + 1.000000;
/*188*/	r1.y = r1.y * 1000.000000;
/*189*/	r0.w = r0.w / r1.y;
/*190*/	r0.w = r0.w + r1.x;
/*191*/	r0.w = r0.w * 1.442695;
/*192*/	r0.w = exp2(r0.w);
/*193*/	r0.w = cb3.data[1].y / r0.w;
/*194*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*195*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*196*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*197*/	r1.x = r1.x + -cb3.data[1].z;
/*198*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*199*/	r1.x = saturate(r1.y * r1.x);
/*200*/	r1.y = r1.x * -2.000000 + 3.000000;
/*201*/	r1.x = r1.x * r1.x;
/*202*/	r1.x = r1.x * r1.y;
/*203*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*204*/	r1.y = sqrt(r1.y);
/*205*/	r1.z = max(cb3.data[2].z, 0.001000);
/*206*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*207*/	r1.y = r1.z * r1.y;
/*208*/	r1.y = min(r1.y, 1.000000);
/*209*/	r1.z = r1.y * -2.000000 + 3.000000;
/*210*/	r1.y = r1.y * r1.y;
/*211*/	r1.y = r1.y * r1.z;
/*212*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*213*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*214*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*215*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*216*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*217*/	r5.w = max(r5.y, 0.000000);
/*218*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*219*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*220*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*221*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*222*/	r0.w = saturate(r0.w * r1.y);
/*223*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*224*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*225*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*226*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*227*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*228*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*229*/	color0.w = 1.000000;
/*230*/	return;
}
