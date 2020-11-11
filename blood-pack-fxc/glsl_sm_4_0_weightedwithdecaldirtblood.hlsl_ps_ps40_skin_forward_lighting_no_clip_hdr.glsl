//
//
// Shader Model 4
// Fragment Shader
//
// id: 2513 - fxc/glsl_SM_4_0_weightedwithdecaldirtblood.hlsl_PS_ps40_skin_forward_lighting_no_clip_HDR.glsl
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
/*1*/	r1.xyzw = (texture(s_colour_mask_map, vsOut_T4.xyxx.st)).xyzw;
/*2*/	r2.xyz = (cb3.data[0].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*3*/	r0.xyz = (r1.xxxx * r2.xyzx + r0.xyzx).xyz;
/*4*/	r2.xyz = (cb3.data[1].xyzx * r0.xyzx + -r0.xyzx).xyz;
/*5*/	r0.xyz = (r1.yyyy * r2.xyzx + r0.xyzx).xyz;
/*6*/	r1.xyw = (cb3.data[2].xyxz * r0.xyxz + -r0.xyxz).xyw;
/*7*/	r0.xyz = (r1.zzzz * r1.xywx + r0.xyzx).xyz;
/*8*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*9*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*10*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*11*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*12*/	r0.w = -r0.w + 1.000000;
/*13*/	r0.w = max(r0.w, 0.000000);
/*14*/	r1.z = sqrt(r0.w);
/*15*/	r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).yxzw;
/*16*/	r2.zw = (-cb2.data[3].xxxy + cb2.data[3].zzzw).zw;
/*17*/	r3.xy = (vsOut_T1.xyxx + -cb2.data[3].xyxx).xy;
/*18*/	r3.xy = (r3.xyxx / r2.zwzz).xy;
/*19*/	r2.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r3.xxxy, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).zw;
/*20*/	r4.xy = (uintBitsToFloat(uvec4(greaterThanEqual(vec4(1.000000, 1.000000, 0.000000, 0.000000), r3.xyxx)) * 0xffffffffu)).xy;
/*21*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.z) & floatBitsToUint(r4.x));
/*22*/	r0.w = uintBitsToFloat(floatBitsToUint(r2.w) & floatBitsToUint(r0.w));
/*23*/	r0.w = uintBitsToFloat(floatBitsToUint(r4.y) & floatBitsToUint(r0.w));
/*24*/	r3.z = vsOut_T6.z;
/*25*/	r4.xyzw = (texture(s_decal_diffuse, r3.xyzx.stp)).xyzw;
/*26*/	r3.xyzw = (texture(s_decal_normal, r3.xyzx.stp)).xyzw;
/*27*/	if(floatBitsToUint(r0.w) != 0u) {
/*28*/	  r2.zw = (r3.wwwy + vec4(0.000000, 0.000000, 0.001961, 0.001961)).zw;
/*29*/	  r3.xy = (r2.zwzz * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*30*/	  r0.w = dot(vec2(r3.xyxx), vec2(r3.xyxx));
/*31*/	  r0.w = -r0.w + 1.000000;
/*32*/	  r0.w = max(r0.w, 0.000000);
/*33*/	  r3.z = sqrt(r0.w);
/*34*/	  r5.xyzw = (texture(s_decal_mask, vsOut_T1.xyxx.st)).xyzw;
/*35*/	  r6.xyzw = r4.xyzw * r5.wwww;
/*36*/	  r0.w = r2.x * r6.w;
/*37*/	  r2.x = r0.w * -0.500000 + r2.x;
/*38*/	  r0.w = -r4.w * r5.w + 1.000000;
/*39*/	  r0.xyz = (r0.wwww * r0.xyzx + r6.xyzx).xyz;
/*40*/	  r3.xyz = (-r1.xyzx + r3.xyzx).xyz;
/*41*/	  r1.xyz = (r6.wwww * r3.xyzx + r1.xyzx).xyz;
/*42*/	}
/*43*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*44*/	r2.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*45*/	r4.xyzw = (texture(s_decal_dirt_map, r2.zwzz.st)).xyzw;
/*46*/	r2.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*47*/	r0.w = r3.w * r4.w;
/*48*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*49*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*50*/	r1.xy = (r2.zwzz * r3.wwww + r1.xyxx).xy;
/*51*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*52*/	r0.w = inversesqrt(r0.w);
/*53*/	r1.xyz = (r0.wwww * r1.xyzx).xyz;
/*54*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*55*/	if(r0.w != 0) discard;
/*56*/	r2.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*57*/	r2.zw = (r2.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*58*/	r3.xyzw = (texture(s_decal_blood_map, r2.zwzz.st)).xyzw;
/*59*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*60*/	r0.w = saturate(-r0.w + r3.w);
/*61*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*62*/	if(floatBitsToUint(r0.w) != 0u) {
/*63*/	  r0.w = -r3.w + 1.000000;
/*64*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*65*/	  r0.w = -r0.w + 1.000000;
/*66*/	  r0.w = -r0.w * r0.w + 1.000000;
/*67*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*68*/	  r3.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*69*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*70*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*71*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*72*/	  r4.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r3.xzzx).xyz;
/*73*/	  r0.xyz = (r0.wwww * r4.xyzx + r3.xyzx).xyz;
/*74*/	  r2.xy = (vec4(0.020000, 0.800000, 0, 0)).xy;
/*75*/	}
/*76*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*77*/	r0.w = inversesqrt(r0.w);
/*78*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*79*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*80*/	r0.w = inversesqrt(r0.w);
/*81*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*82*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*83*/	r0.w = inversesqrt(r0.w);
/*84*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*85*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*86*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*87*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*88*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*89*/	r0.w = inversesqrt(r0.w);
/*90*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*91*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*92*/	r1.w = -vsOut_T4.z + 1.000000;
/*93*/	r5.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*94*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*95*/	r1.w = vsOut_T7.x * -r2.x + r2.x;
/*96*/	r2.xzw = (r0.xxyz * vec4(5.000000, 0.000000, 5.000000, 5.000000) + vec4(0.200000, 0.000000, 0.200000, 0.200000)).xzw;
/*97*/	r2.xzw = (-r0.xxyz + r2.xxzw).xzw;
/*98*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.xzwx + r0.xyzx).xyz;
/*99*/	r2.x = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*100*/	r2.xzw = (-r0.xxyz + r2.xxxx).xzw;
/*101*/	r0.xyz = (vsOut_T7.yyyy * r2.xzwx + r0.xyzx).xyz;
/*102*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*103*/	r2.xzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).xzw;
/*104*/	r3.w = dot(vec3(r2.xzwx), vec3(r2.xzwx));
/*105*/	r3.w = inversesqrt(r3.w);
/*106*/	r2.xzw = (r2.xxzw * r3.wwww).xzw;
/*107*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*108*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*109*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*110*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*111*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*112*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*113*/	r4.w = r3.w * r6.x + 0.300000;
/*114*/	r4.w = saturate(-r4.w + 1.000000);
/*115*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*116*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*117*/	r7.w = -r3.w * r6.x + 1.000000;
/*118*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*119*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*120*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*121*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*122*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*123*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*124*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*125*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*126*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*127*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*128*/	r4.w = saturate(r3.w);
/*129*/	r4.w = r4.w * r4.w;
/*130*/	r6.w = saturate(dot(vec3(r2.xzwx), vec3(-cb1.data[0].yzwy)));
/*131*/	r6.w = r6.w * r6.w;
/*132*/	r6.w = r6.w * r6.w;
/*133*/	r4.w = r4.w * r6.w;
/*134*/	r4.z = r4.z * r4.w;
/*135*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*136*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*137*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*138*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*139*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*140*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*141*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*142*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*143*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*144*/	r6.w = inversesqrt(r6.w);
/*145*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*146*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*147*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*148*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*149*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*150*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*151*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*152*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*153*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*154*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*155*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*156*/	r5.y = r5.z * r5.x;
/*157*/	r2.y = r2.y * r2.y;
/*158*/	r3.w = r3.w + r3.w;
/*159*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*160*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.xzwx));
/*161*/	r3.w = max(r3.w, 0.000000);
/*162*/	r2.y = r2.y * 127.000000 + 1.600000;
/*163*/	r3.w = log2(r3.w);
/*164*/	r2.y = r2.y * r3.w;
/*165*/	r2.y = exp2(r2.y);
/*166*/	r2.y = min(r2.y, 1.000000);
/*167*/	r1.w = r1.w * r2.y;
/*168*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*169*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*170*/	r1.w = dot(vec3(-r2.xzwx), vec3(r3.xyzx));
/*171*/	r2.y = r1.w + r1.w;
/*172*/	r2.xyz = (r3.xyzx * -r2.yyyy + -r2.xzwx).xyz;
/*173*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*174*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*175*/	r2.w = inversesqrt(r2.w);
/*176*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*177*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*178*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*179*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*180*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*181*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*182*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*183*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*184*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*185*/	r1.w = saturate(-r1.w + 1.000000);
/*186*/	r1.w = r1.w * r1.w;
/*187*/	r1.w = r4.x * r1.w;
/*188*/	r1.w = r1.w * 1.500000;
/*189*/	r1.w = r5.w * r1.w;
/*190*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*191*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*192*/	r0.w = inversesqrt(r0.w);
/*193*/	r0.w = r0.w * r1.y;
/*194*/	r0.w = max(r0.w, 0.000000);
/*195*/	r0.w = r0.w * r1.w;
/*196*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*197*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*198*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*199*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*200*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*201*/	r0.w = 1.000000;
/*202*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*203*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*204*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*205*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*206*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*207*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*208*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*209*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*210*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*211*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*212*/	if(r0.x != 0) discard;
/*213*/	color0.w = 1.000000;
/*214*/	color1.x = 1.000000;
/*215*/	return;
}
