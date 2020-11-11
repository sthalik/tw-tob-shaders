//
//
// Shader Model 4
// Fragment Shader
//
// id: 2511 - fxc/glsl_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
layout(location = 1) out vec4 color1;

uniform sampler2D s_diffuse_map;
uniform sampler2D s_colour_mask_map;
uniform sampler2DArray s_decal_normal;
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_mask;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;
uniform sampler2DArray s_decal_diffuse;

layout(std140) uniform camera_VS_PS
{
  vec4 data[36];
} cb0;
layout(std140) uniform lighting_VS_PS
{
  vec4 data[13];
} cb1;
layout(std140) uniform rigid_config_PS
{
  vec4 data[6];
} cb2;
layout(std140) uniform rigid_faction_colours
{
  vec4 data[4];
} cb3;

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
/*4*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*5*/	r2.xyz = (cb3.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*6*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*7*/	r2.xyz = (cb3.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*8*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*9*/	r1.xyw = (cb3.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*10*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*11*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*12*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*13*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*14*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*15*/	r0.w = -r0.w + 1.000000;
/*16*/	r0.w = max(r0.w, 0.000000);
/*17*/	r1.z = sqrt(r0.w);
/*18*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*19*/	r2.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*20*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*21*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*22*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*23*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*24*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*25*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*26*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*27*/	r3.z = vsOut_T6.z;
/*28*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*29*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*30*/	if(floatBitsToUint(r0.w) != 0u) {
/*31*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*32*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*33*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*34*/	  r0.w = -r0.w + 1.000000;
/*35*/	  r0.w = max(r0.w, 0.000000);
/*36*/	  r3.z = sqrt(r0.w);
/*37*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*38*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*39*/	  r0.w = r2.x * r6.w;
/*40*/	  r2.x = r0.w * -0.500000 + r2.x;
/*41*/	  r0.w = -r4.w * r5.w + 1.000000;
/*42*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*43*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*44*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*45*/	}
/*46*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*47*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*48*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*49*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*50*/	r0.w = r3.w * r4.w;
/*51*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*52*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*53*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*54*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*57*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*58*/	if(r0.w != 0) discard;
/*59*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*60*/	r2.zw = (r2.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*61*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*62*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*63*/	r0.w = saturate(-r0.w + r3.w);
/*64*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*65*/	if(floatBitsToUint(r0.w) != 0u) {
/*66*/	  r0.w = -r3.w + 1.000000;
/*67*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*68*/	  r0.w = -r0.w + 1.000000;
/*69*/	  r0.w = -r0.w * r0.w + 1.000000;
/*70*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*71*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*72*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*73*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*74*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*75*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*76*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*77*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*78*/	}
/*79*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*80*/	r0.w = inversesqrt(r0.w);
/*81*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*82*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*85*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*86*/	r0.w = inversesqrt(r0.w);
/*87*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*88*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*89*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*90*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*91*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*92*/	r0.w = inversesqrt(r0.w);
/*93*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*94*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*95*/	r1.w = -vsOut_T4.z + 1.000000;
/*96*/	r5.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*97*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*98*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*99*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*100*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*101*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*102*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*103*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*104*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*105*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*106*/	r2.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*107*/	r3.w = dot(vec3(r2.xzwx), vec3(r2.xzwx));
/*108*/	r3.w = inversesqrt(r3.w);
/*109*/	r2.xzw = (r2.xxzw * r3.wwww).xzw;
/*110*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*111*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*112*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*113*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*114*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*115*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*116*/	r4.w = r3.w * r6.x + 0.300000;
/*117*/	r4.w = saturate(-r4.w + 1.000000);
/*118*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*119*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*120*/	r7.w = -r3.w * r6.x + 1.000000;
/*121*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*122*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*123*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*124*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*125*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*126*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*127*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*128*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*129*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*130*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*131*/	r4.w = saturate(r3.w);
/*132*/	r4.w = r4.w * r4.w;
/*133*/	r6.w = saturate(dot(vec3(r2.xzwx), vec3(-cb1.data[0].yzwy)));
/*134*/	r6.w = r6.w * r6.w;
/*135*/	r6.w = r6.w * r6.w;
/*136*/	r4.w = r4.w * r6.w;
/*137*/	r4.z = r4.z * r4.w;
/*138*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*139*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*140*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*141*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*142*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*143*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*144*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*145*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*146*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*147*/	r6.w = inversesqrt(r6.w);
/*148*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*149*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*150*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*151*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*152*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*153*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*154*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*155*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*156*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*157*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*158*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*159*/	r5.y = r5.z * r5.x;
/*160*/	r2.y = r2.y * r2.y;
/*161*/	r3.w = r3.w + r3.w;
/*162*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*163*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.xzwx));
/*164*/	r3.w = max(r3.w, 0.000000);
/*165*/	r2.y = r2.y * 127.000000 + 1.600000;
/*166*/	r3.w = log2(r3.w);
/*167*/	r2.y = r2.y * r3.w;
/*168*/	r2.y = exp2(r2.y);
/*169*/	r2.y = min(r2.y, 1.000000);
/*170*/	r1.w = r1.w * r2.y;
/*171*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*172*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*173*/	r1.w = dot(vec3(-r2.xzwx), vec3(r3.xyzx));
/*174*/	r2.y = r1.w + r1.w;
/*175*/	r2.xyz = (r3.xyzx * -r2.yyyy + -r2.xzwx).xyz;
/*176*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*177*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*178*/	r2.w = inversesqrt(r2.w);
/*179*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*180*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*181*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*182*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*183*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*184*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*185*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*186*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*187*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*188*/	r1.w = saturate(-r1.w + 1.000000);
/*189*/	r1.w = r1.w * r1.w;
/*190*/	r1.w = r4.x * r1.w;
/*191*/	r1.w = r1.w * 1.500000;
/*192*/	r1.w = r5.w * r1.w;
/*193*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*194*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*195*/	r0.w = inversesqrt(r0.w);
/*196*/	r0.w = r0.w * r1.y;
/*197*/	r0.w = max(r0.w, 0.000000);
/*198*/	r0.w = r0.w * r1.w;
/*199*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*200*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*201*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*202*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*203*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*204*/	r0.w = 1.000000;
/*205*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*206*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*207*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*208*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*209*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*210*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*211*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*212*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*213*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*214*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*215*/	if(r0.x != 0) discard;
/*216*/	color0.w = 1.000000;
/*217*/	color1.x = 1.000000;
/*218*/	return;
}
