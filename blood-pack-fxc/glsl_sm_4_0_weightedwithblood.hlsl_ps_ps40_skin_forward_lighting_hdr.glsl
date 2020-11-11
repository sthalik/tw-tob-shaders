//
//
// Shader Model 4
// Fragment Shader
//
// id: 2151 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps40_skin_forward_lighting_HDR.glsl
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
/*17*/	r0.w = sqrt(r0.w);
/*18*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*19*/	if(r1.z != 0) discard;
/*20*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*21*/	r1.zw = (r1.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*22*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*23*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*24*/	r1.z = saturate(-r1.z + r2.w);
/*25*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*26*/	if(floatBitsToUint(r1.z) != 0u) {
/*27*/	  r1.z = -r2.w + 1.000000;
/*28*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*29*/	  r1.z = -r1.z + 1.000000;
/*30*/	  r1.z = -r1.z * r1.z + 1.000000;
/*31*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*32*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*33*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*34*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*35*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*36*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*37*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*38*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*39*/	} else {
/*40*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*41*/	}
/*42*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*43*/	r1.z = inversesqrt(r1.z);
/*44*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*45*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*46*/	r1.z = inversesqrt(r1.z);
/*47*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*48*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*49*/	r1.z = inversesqrt(r1.z);
/*50*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*51*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*52*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*53*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*54*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*55*/	r0.w = inversesqrt(r0.w);
/*56*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*57*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*58*/	r1.w = -vsOut_T4.z + 1.000000;
/*59*/	r5.xyz = (vsOut_T4.zzzz * cb3.data[3].xyzx).xyz;
/*60*/	r0.xyz = (r0.xyzx * r1.wwww + r5.xyzx).xyz;
/*61*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*62*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*63*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*64*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*65*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*66*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*67*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*68*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*69*/	r2.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*70*/	r3.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*71*/	r3.w = inversesqrt(r3.w);
/*72*/	r2.yzw = (r2.yyzw * r3.wwww).yzw;
/*73*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*74*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*75*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*76*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*77*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*78*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*79*/	r4.w = r3.w * r6.x + 0.300000;
/*80*/	r4.w = saturate(-r4.w + 1.000000);
/*81*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*82*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*83*/	r7.w = -r3.w * r6.x + 1.000000;
/*84*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*85*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*86*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*87*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*88*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*89*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*90*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*91*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*92*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*93*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*94*/	r4.w = saturate(r3.w);
/*95*/	r4.w = r4.w * r4.w;
/*96*/	r6.w = saturate(dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy)));
/*97*/	r6.w = r6.w * r6.w;
/*98*/	r6.w = r6.w * r6.w;
/*99*/	r4.w = r4.w * r6.w;
/*100*/	r4.z = r4.z * r4.w;
/*101*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*102*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*103*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*104*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*105*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*106*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*107*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*108*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*109*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*110*/	r6.w = inversesqrt(r6.w);
/*111*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*112*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*113*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*114*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*115*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*116*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*117*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*118*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*119*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*120*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*121*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*122*/	r5.y = r5.z * r5.x;
/*123*/	r2.x = r2.x * r2.x;
/*124*/	r3.w = r3.w + r3.w;
/*125*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*126*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.yzwy));
/*127*/	r3.w = max(r3.w, 0.000000);
/*128*/	r2.x = r2.x * 127.000000 + 1.600000;
/*129*/	r3.w = log2(r3.w);
/*130*/	r2.x = r2.x * r3.w;
/*131*/	r2.x = exp2(r2.x);
/*132*/	r2.x = min(r2.x, 1.000000);
/*133*/	r1.w = r1.w * r2.x;
/*134*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*135*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*136*/	r1.w = dot(vec3(-r2.yzwy), vec3(r3.xyzx));
/*137*/	r2.x = r1.w + r1.w;
/*138*/	r2.xyz = (r3.xyzx * -r2.xxxx + -r2.yzwy).xyz;
/*139*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*140*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*141*/	r2.w = inversesqrt(r2.w);
/*142*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*143*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*144*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*145*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*146*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*147*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*148*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*149*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*150*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*151*/	r1.w = saturate(-r1.w + 1.000000);
/*152*/	r1.w = r1.w * r1.w;
/*153*/	r1.w = r4.x * r1.w;
/*154*/	r1.w = r1.w * 1.500000;
/*155*/	r1.w = r5.w * r1.w;
/*156*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*157*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*158*/	r0.w = inversesqrt(r0.w);
/*159*/	r0.w = r0.w * r1.y;
/*160*/	r0.w = max(r0.w, 0.000000);
/*161*/	r0.w = r0.w * r1.w;
/*162*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*163*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*164*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*165*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*166*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*167*/	r0.w = 1.000000;
/*168*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*169*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*170*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*171*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*172*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*173*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*174*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*175*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*176*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*177*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*178*/	if(r0.x != 0) discard;
/*179*/	color0.w = 1.000000;
/*180*/	color1.x = 1.000000;
/*181*/	return;
}
