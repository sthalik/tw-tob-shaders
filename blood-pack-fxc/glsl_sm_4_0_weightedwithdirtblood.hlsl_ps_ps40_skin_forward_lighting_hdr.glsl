//
//
// Shader Model 4
// Fragment Shader
//
// id: 2295 - fxc/glsl_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
uniform sampler2D s_normal_map;
uniform sampler2D s_gloss_map;
uniform sampler2D s_decal_dirt_mask;
uniform sampler2D s_decal_dirt_map;
uniform sampler2D s_decal_blood_map;
uniform sampler2D s_skin_mask_map;

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
/*17*/	r2.z = sqrt(r0.w);
/*18*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*19*/	r1.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*20*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*21*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*22*/	r0.w = r3.w * r4.w;
/*23*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*24*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*25*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*26*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*27*/	r0.w = inversesqrt(r0.w);
/*28*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*29*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*30*/	if(r0.w != 0) discard;
/*31*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*32*/	r2.xy = (r2.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*33*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*34*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*35*/	r0.w = saturate(-r0.w + r2.w);
/*36*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*37*/	if(floatBitsToUint(r0.w) != 0u) {
/*38*/	  r0.w = -r2.w + 1.000000;
/*39*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*40*/	  r0.w = -r0.w + 1.000000;
/*41*/	  r0.w = -r0.w * r0.w + 1.000000;
/*42*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*43*/	  r2.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*44*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*45*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*46*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*47*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*48*/	  r0.xyz = (r0.wwww * r3.xyzx + r2.xyzx).xyz;
/*49*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*50*/	} else {
/*51*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*52*/	}
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
/*70*/	r5.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*71*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*72*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*73*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*74*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*75*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*76*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*77*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*78*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*79*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*80*/	r2.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*81*/	r3.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*82*/	r3.w = inversesqrt(r3.w);
/*83*/	r2.yzw = (r2.yyzw * r3.wwww).yzw;
/*84*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*85*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*86*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*87*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*88*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*89*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*90*/	r4.w = r3.w * r6.x + 0.300000;
/*91*/	r4.w = saturate(-r4.w + 1.000000);
/*92*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*93*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*94*/	r7.w = -r3.w * r6.x + 1.000000;
/*95*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*96*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*97*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*98*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*99*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*100*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*101*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*102*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*103*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*104*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*105*/	r4.w = saturate(r3.w);
/*106*/	r4.w = r4.w * r4.w;
/*107*/	r6.w = saturate(dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy)));
/*108*/	r6.w = r6.w * r6.w;
/*109*/	r6.w = r6.w * r6.w;
/*110*/	r4.w = r4.w * r6.w;
/*111*/	r4.z = r4.z * r4.w;
/*112*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*113*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*114*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*115*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*116*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*117*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*118*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*119*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*120*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*121*/	r6.w = inversesqrt(r6.w);
/*122*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*123*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*124*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*125*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*126*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*127*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*128*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*129*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*130*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*131*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*132*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*133*/	r5.y = r5.z * r5.x;
/*134*/	r2.x = r2.x * r2.x;
/*135*/	r3.w = r3.w + r3.w;
/*136*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*137*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.yzwy));
/*138*/	r3.w = max(r3.w, 0.000000);
/*139*/	r2.x = r2.x * 127.000000 + 1.600000;
/*140*/	r3.w = log2(r3.w);
/*141*/	r2.x = r2.x * r3.w;
/*142*/	r2.x = exp2(r2.x);
/*143*/	r2.x = min(r2.x, 1.000000);
/*144*/	r1.w = r1.w * r2.x;
/*145*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*146*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*147*/	r1.w = dot(vec3(-r2.yzwy), vec3(r3.xyzx));
/*148*/	r2.x = r1.w + r1.w;
/*149*/	r2.xyz = (r3.xyzx * -r2.xxxx + -r2.yzwy).xyz;
/*150*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*151*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*152*/	r2.w = inversesqrt(r2.w);
/*153*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*154*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*155*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*156*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*157*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*158*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*159*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*160*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*161*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*162*/	r1.w = saturate(-r1.w + 1.000000);
/*163*/	r1.w = r1.w * r1.w;
/*164*/	r1.w = r4.x * r1.w;
/*165*/	r1.w = r1.w * 1.500000;
/*166*/	r1.w = r5.w * r1.w;
/*167*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*168*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*169*/	r0.w = inversesqrt(r0.w);
/*170*/	r0.w = r0.w * r1.y;
/*171*/	r0.w = max(r0.w, 0.000000);
/*172*/	r0.w = r0.w * r1.w;
/*173*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*174*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*175*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*176*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*177*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*178*/	r0.w = 1.000000;
/*179*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*180*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*181*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*182*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*183*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*184*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*185*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*186*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*187*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*188*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*189*/	if(r0.x != 0) discard;
/*190*/	color0.w = 1.000000;
/*191*/	color1.x = 1.000000;
/*192*/	return;
}
