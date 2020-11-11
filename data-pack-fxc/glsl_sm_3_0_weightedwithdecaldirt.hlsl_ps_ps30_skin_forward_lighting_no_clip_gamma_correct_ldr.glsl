//
//
// Shader Model 4
// Fragment Shader
//
// id: 2067 - fxc/glsl_SM_3_0_weightedwithdecaldirt.hlsl_PS_ps30_skin_forward_lighting_no_clip_gamma_correct_LDR.glsl
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
uniform samplerCube s_sky;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_diffuse;
uniform sampler2D s_decal_normal;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
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
/*14*/	r1.z = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*16*/	r2.zw = (-cb4.data[3].xxxy + cb4.data[3].zzzw).zw;
/*17*/	r3.xy = (vsOut_T1.xyxx + -cb4.data[3].xyxx).xy;
/*18*/	r2.zw = (r3.xxxy / r2.zzzw).zw;
/*19*/	r3.xy = (uintBitsToFloat(uvec4(greaterThanEqual(r2.zwzz, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xy;
/*20*/	r3.zw = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(0.000000, 0.000000, 1.000000, 1.000000), r2.zzzw)) * 0xffffffffu)).zw;
/*21*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.z) & floatBitsToUint(r3.x));
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.y) & floatBitsToUint(r0.w));
/*23*/	r0.w = uintBitsToFloat(floatBitsToUint(r3.w) & floatBitsToUint(r0.w));
/*24*/	r3.xyzw = (texture(s_decal_diffuse, r2.zwzz.st)).xyzw;
/*25*/	r4.xyzw = (texture(s_decal_normal, r2.zwzz.st)).xyzw;
/*26*/	if(floatBitsToUint(r0.w) != 0u) {
/*27*/	  r2.zw = (r4.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*28*/	  r4.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*29*/	  r0.w = dot(vec2(r4.xyxx), vec2(r4.xyxx));
/*30*/	  r0.w = -r0.w + 1.000000;
/*31*/	  r0.w = max(r0.w, 0.000000);
/*32*/	  r4.z = sqrt(r0.w);
/*33*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*34*/	  r6.xyzw = r3.xyzw * r5.wwww;
/*35*/	  r0.w = r2.x * r6.w;
/*36*/	  r2.x = r0.w * -0.500000 + r2.x;
/*37*/	  r0.w = -r3.w * r5.w + 1.000000;
/*38*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*39*/	  r3.xyz = (-r1.xyzx + r4.xyzx).xyz;
/*40*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*41*/	}
/*42*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*43*/	r2.zw = (vsOut_T1.xxxy * cb4.data[2].xxxy + vsOut_T6.xxxy).zw;
/*44*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*45*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*46*/	r0.w = r3.w * r4.w;
/*47*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*48*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*49*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*50*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*51*/	r0.w = inversesqrt(r0.w);
/*52*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*53*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*54*/	r0.w = inversesqrt(r0.w);
/*55*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*56*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*57*/	r0.w = inversesqrt(r0.w);
/*58*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*59*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*60*/	r0.w = inversesqrt(r0.w);
/*61*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*62*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*63*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*64*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*65*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*66*/	r0.w = inversesqrt(r0.w);
/*67*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*68*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*69*/	r1.w = -vsOut_T4.z + 1.000000;
/*70*/	r5.xyz = (vsOut_T4.zzzz * cb5.data[3].xyzx).xyz;
/*71*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*72*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*73*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*74*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*75*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*76*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*78*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*79*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*80*/	r5.xyz = (vsOut_T0.xyzx + -cb1.data[0].xyzx).xyz;
/*81*/	r2.x = dot(vec3(r5.xyzx), vec3(r5.xyzx));
/*82*/	r2.z = inversesqrt(r2.x);
/*83*/	r6.xyz = (r2.zzzz * r5.xyzx).xyz;
/*84*/	r2.z = uintBitsToFloat((0.000000 < cb2.data[11].x) ? 0xffffffffu : 0x00000000u);
/*85*/	r7.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r2.zzzz), uvec4(0)));
/*86*/	r2.z = dot(vec3(r3.xyzx), vec3(-cb2.data[0].yzwy));
/*87*/	r8.xyz = (r2.zzzz * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*88*/	r8.xyz = saturate(r8.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*89*/	r9.xyz = (r8.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*90*/	r2.w = r2.z * r8.x + 0.300000;
/*91*/	r2.w = saturate(-r2.w + 1.000000);
/*92*/	r10.xyz = (r2.wwww * r9.xyzx).xyz;
/*93*/	r8.yzw = (r8.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*94*/	r3.w = -r2.z * r8.x + 1.000000;
/*95*/	r8.yzw = (r3.wwww * r8.yyzw).yzw;
/*96*/	r9.xyz = (-r9.xyzx * r2.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*97*/	r10.xyz = (r2.zzzz * r8.xxxx + r10.xyzx).xyz;
/*98*/	r8.xyz = (r8.yzwy * r9.xyzx + r10.xyzx).xyz;
/*99*/	r8.xyz = (-r2.zzzz + r8.xyzx).xyz;
/*100*/	r8.xyz = saturate(r4.yyyy * r8.xyzx + r2.zzzz).xyz;
/*101*/	r8.xyz = (r0.xyzx * r8.xyzx).xyz;
/*102*/	r8.xyz = (r8.xyzx * cb2.data[1].xyzx).xyz;
/*103*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*104*/	r2.z = dot(vec3(r3.xyzx), vec3(cb2.data[0].yzwy));
/*105*/	r2.w = saturate(r2.z);
/*106*/	r2.w = r2.w * r2.w;
/*107*/	r3.w = saturate(dot(vec3(r6.xyzx), vec3(-cb2.data[0].yzwy)));
/*108*/	r3.w = r3.w * r3.w;
/*109*/	r3.w = r3.w * r3.w;
/*110*/	r2.w = r2.w * r3.w;
/*111*/	r2.w = r4.z * r2.w;
/*112*/	r4.yzw = (r4.yyyy * cb2.data[1].xxyz).yzw;
/*113*/	r4.yzw = (r4.yyzw * vec4(0.000000, -0.300000, -1.000000, -1.000000) + cb2.data[1].xxyz).yzw;
/*114*/	r4.yzw = (r7.xxxx * r4.yyzw).yzw;
/*115*/	r4.yzw = (r2.wwww * r4.yyzw).yzw;
/*116*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*117*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*118*/	r4.yzw = (r8.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*119*/	r8.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*120*/	r2.w = dot(vec3(r8.xyzx), vec3(r8.xyzx));
/*121*/	r2.w = inversesqrt(r2.w);
/*122*/	r8.xyz = (r2.wwww * r8.xyzx).xyz;
/*123*/	r9.xyz = (uintBitsToFloat(uvec4(lessThan(r8.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*124*/	r10.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r9.xxxx), uvec4(0)))).xyz/**/;
/*125*/	r9.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r9.yyyy), uvec4(0)))).xyw/**/;
/*126*/	r11.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r9.zzzz), uvec4(0)))).xyz/**/;
/*127*/	r8.xyz = (r8.xyzx * r8.xyzx).xyz;
/*128*/	r9.xyz = (r9.xywx * r8.yyyy).xyz;
/*129*/	r8.xyw = (r8.xxxx * r10.xyxz + r9.xyxz).xyw;
/*130*/	r8.xyz = (r8.zzzz * r11.xyzx + r8.xywx).xyz;
/*131*/	r0.xyz = (r0.xyzx * r8.xyzx).xyz;
/*132*/	r0.xyz = (r7.yyyy * r0.xyzx).xyz;
/*133*/	r2.w = r7.z * r7.x;
/*134*/	r2.y = r2.y * r2.y;
/*135*/	r2.z = r2.z + r2.z;
/*136*/	r8.xyz = (r3.xyzx * -r2.zzzz + cb2.data[0].yzwy).xyz;
/*137*/	r2.z = dot(vec3(r8.xyzx), vec3(-r6.xyzx));
/*138*/	r2.z = max(r2.z, 0.000000);
/*139*/	r2.y = r2.y * 127.000000 + 1.600000;
/*140*/	r2.z = log2(r2.z);
/*141*/	r2.y = r2.z * r2.y;
/*142*/	r2.y = exp2(r2.y);
/*143*/	r2.y = min(r2.y, 1.000000);
/*144*/	r1.w = r1.w * r2.y;
/*145*/	r8.xyz = (r1.wwww * cb2.data[1].xyzx).xyz;
/*146*/	r8.xyz = (r7.xxxx * r8.xyzx).xyz;
/*147*/	r1.w = dot(vec3(-r6.xyzx), vec3(r3.xyzx));
/*148*/	r2.y = r1.w + r1.w;
/*149*/	r3.xyz = (r3.xyzx * -r2.yyyy + -r6.xyzx).xyz;
/*150*/	r3.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*151*/	r2.y = dot(vec3(r3.xyzx), vec3(r3.xyzx));
/*152*/	r2.y = inversesqrt(r2.y);
/*153*/	r3.xyz = (r2.yyyy * r3.xyzx).xyz;
/*154*/	r6.xyz = (uintBitsToFloat(uvec4(lessThan(r3.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*155*/	r9.xyz = (mix(cb2.data[2].xyzx, cb2.data[3].xyzx, greaterThan(floatBitsToUint(r6.xxxx), uvec4(0)))).xyz/**/;
/*156*/	r6.xyw = (mix(cb2.data[4].xyxz, cb2.data[5].xyxz, greaterThan(floatBitsToUint(r6.yyyy), uvec4(0)))).xyw/**/;
/*157*/	r10.xyz = (mix(cb2.data[6].xyzx, cb2.data[7].xyzx, greaterThan(floatBitsToUint(r6.zzzz), uvec4(0)))).xyz/**/;
/*158*/	r3.xyz = (r3.xyzx * r3.xyzx).xyz;
/*159*/	r6.xyz = (r6.xywx * r3.yyyy).xyz;
/*160*/	r3.xyw = (r3.xxxx * r9.xyxz + r6.xyxz).xyw;
/*161*/	r3.xyz = (r3.zzzz * r10.xyzx + r3.xywx).xyz;
/*162*/	r1.w = saturate(-r1.w + 1.000000);
/*163*/	r1.w = r1.w * r1.w;
/*164*/	r1.w = r4.x * r1.w;
/*165*/	r1.w = r1.w * 1.500000;
/*166*/	r1.w = r7.w * r1.w;
/*167*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*168*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*169*/	r0.w = inversesqrt(r0.w);
/*170*/	r0.w = r0.w * r1.y;
/*171*/	r0.w = max(r0.w, 0.000000);
/*172*/	r0.w = r0.w * r1.w;
/*173*/	r1.xyz = (r3.xyzx * r0.wwww).xyz;
/*174*/	r0.xyz = (r0.xyzx * r2.wwww + r1.xyzx).xyz;
/*175*/	r1.xyz = (r8.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*176*/	r0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*177*/	r1.xyz = (vsOut_T0.xyzx).xyz;
/*178*/	r1.w = 1.000000;
/*179*/	r3.x = dot(r1.xyzw, cb1.data[9].xyzw);
/*180*/	r3.y = dot(r1.xyzw, cb1.data[10].xyzw);
/*181*/	r0.w = dot(r1.xyzw, cb1.data[12].xyzw);
/*182*/	r1.xy = (r3.xyxx / r0.wwww).xy;
/*183*/	r1.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r1.xxxy, cb1.data[34].xxxy)) * 0xffffffffu)).zw;
/*184*/	r1.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb1.data[34].zwzz, r1.xyxx)) * 0xffffffffu)).xy;
/*185*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.x) & floatBitsToUint(r1.z));
/*186*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.w) & floatBitsToUint(r0.w));
/*187*/	r0.w = uintBitsToFloat(floatBitsToUint(r1.y) & floatBitsToUint(r0.w));
/*188*/	r0.w = uintBitsToFloat(~floatBitsToUint(r0.w));
/*189*/	if(r0.w != 0) discard;
/*190*/	r0.w = sqrt(r2.x);
/*191*/	r1.x = saturate(cb3.data[0].w)/**/;
/*192*/	r1.x = -r1.x + 1.000000;
/*193*/	r1.x = r1.x * 8.000000 + -4.000000;
/*194*/	r1.y = saturate(cb3.data[1].x)/**/;
/*195*/	r1.y = -r1.y + 1.000000;
/*196*/	r1.y = r1.y * 1000.000000;
/*197*/	r0.w = r0.w / r1.y;
/*198*/	r0.w = r0.w + r1.x;
/*199*/	r0.w = r0.w * 1.442695;
/*200*/	r0.w = exp2(r0.w);
/*201*/	r0.w = cb3.data[1].y / r0.w;
/*202*/	r0.w = saturate(-r0.w + cb3.data[1].y);
/*203*/	r1.x = -vsOut_T0.y + cb3.data[1].w;
/*204*/	r1.y = -cb3.data[1].z + cb3.data[1].w;
/*205*/	r1.x = r1.x + -cb3.data[1].z;
/*206*/	r1.y = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.y)).y;
/*207*/	r1.x = saturate(r1.y * r1.x);
/*208*/	r1.y = r1.x * -2.000000 + 3.000000;
/*209*/	r1.x = r1.x * r1.x;
/*210*/	r1.x = r1.x * r1.y;
/*211*/	r1.y = dot(vec2(r5.xzxx), vec2(r5.xzxx));
/*212*/	r1.y = sqrt(r1.y);
/*213*/	r1.z = max(cb3.data[2].z, 0.001000);
/*214*/	r1.z = (vec4(1.000000, 1.000000, 1.000000, 1.000000) / vec4(r1.z)).z;
/*215*/	r1.y = r1.z * r1.y;
/*216*/	r1.y = min(r1.y, 1.000000);
/*217*/	r1.z = r1.y * -2.000000 + 3.000000;
/*218*/	r1.y = r1.y * r1.y;
/*219*/	r1.y = r1.y * r1.z;
/*220*/	r0.w = cb3.data[2].x * r1.x + r0.w;
/*221*/	r1.xzw = (cb2.data[1].xxyz * cb3.data[0].xxyz).xzw;
/*222*/	r1.xzw = (r1.xxzw * vec4(1.500000, 0.000000, 1.500000, 1.500000)).xzw;
/*223*/	r1.xzw = (r1.xxzw * abs(cb2.data[0].zzzz)).xzw;
/*224*/	r2.xyz = (r7.xxxx * r1.xzwx).xyz;
/*225*/	r5.w = max(r5.y, 0.000000);
/*226*/	r3.xyzw = (texture(s_sky, r5.xwzx.stp)).xyzw;
/*227*/	r2.w = saturate(dot(vec2(r0.wwww), vec2(cb3.data[2].yyyy)));
/*228*/	r1.xzw = (-r1.xxzw * r7.xxxx + r3.xxyz).xzw;
/*229*/	r1.xzw = (r2.wwww * r1.xxzw + r2.xxyz).xzw;
/*230*/	r0.w = saturate(r0.w * r1.y);
/*231*/	r1.xyz = (-r0.xyzx + r1.xzwx).xyz;
/*232*/	r0.xyz = saturate(r0.wwww * r1.xyzx + r0.xyzx).xyz;
/*233*/	r0.xyz = (log2(r0.xyzx)).xyz;
/*234*/	r0.xyz = (r0.xyzx * cb0.data[0].zzzz).xyz;
/*235*/	r0.xyz = (exp2(r0.xyzx)).xyz;
/*236*/	color0.xyz = (min(r0.xyzx, vec4(1.000000, 1.000000, 1.000000, 0.000000))).xyz;
/*237*/	color0.w = 1.000000;
/*238*/	return;
}
