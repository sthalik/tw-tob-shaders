//
//
// Shader Model 4
// Fragment Shader
//
// id: 2155 - fxc/glsl_SM_4_0_weightedwithblood.hlsl_PS_ps40_skin_forward_lighting_no_faction_colour_HDR.glsl
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
/*4*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*5*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*6*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*7*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*8*/	r0.w = -r0.w + 1.000000;
/*9*/	r0.w = max(r0.w, 0.000000);
/*10*/	r0.w = sqrt(r0.w);
/*11*/	r1.z = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*12*/	if(r1.z != 0) discard;
/*13*/	r1.zw = (vsOut_T1.xxxy * vec4(0.000000, 0.000000, 0.750000, 0.750000)).zw;
/*14*/	r1.zw = (r1.zzzw * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*15*/	r2.xyzw = (texture(s_decal_blood_map, r1.zwzz.st)).xyzw;
/*16*/	r1.z = -vsOut_T4.z * 0.900000 + 1.000000;
/*17*/	r1.z = saturate(-r1.z + r2.w);
/*18*/	r1.z = uintBitsToFloat((0.000000 < r1.z) ? 0xffffffffu : 0x00000000u);
/*19*/	if(floatBitsToUint(r1.z) != 0u) {
/*20*/	  r1.z = -r2.w + 1.000000;
/*21*/	  r1.z = saturate(vsOut_T4.z * 0.900000 + -r1.z);
/*22*/	  r1.z = -r1.z + 1.000000;
/*23*/	  r1.z = -r1.z * r1.z + 1.000000;
/*24*/	  r1.z = r1.z * -0.600000 + 1.000000;
/*25*/	  r2.xyz = (r1.zzzz * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*26*/	  r1.z = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*27*/	  r1.z = uintBitsToFloat((r1.z < 0.225000) ? 0xffffffffu : 0x00000000u);
/*28*/	  r1.z = uintBitsToFloat(floatBitsToUint(r1.z) & uint(0x3f800000u));
/*29*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*30*/	  r0.xyz = (r1.zzzz * r3.xyzx + r2.xyzx).xyz;
/*31*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*32*/	} else {
/*33*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*34*/	}
/*35*/	r1.z = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*36*/	r1.z = inversesqrt(r1.z);
/*37*/	r3.xyz = (r1.zzzz * vsOut_T3.xyzx).xyz;
/*38*/	r1.z = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*39*/	r1.z = inversesqrt(r1.z);
/*40*/	r4.xyz = (r1.zzzz * vsOut_T5.xyzx).xyz;
/*41*/	r1.z = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*42*/	r1.z = inversesqrt(r1.z);
/*43*/	r5.xyz = (r1.zzzz * vsOut_T2.xyzx).xyz;
/*44*/	r1.yzw = (r1.yyyy * r4.xxyz).yzw;
/*45*/	r1.xyz = (r1.xxxx * r3.xyzx + r1.yzwy).xyz;
/*46*/	r1.xyz = (r0.wwww * r5.xyzx + r1.xyzx).xyz;
/*47*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*48*/	r0.w = inversesqrt(r0.w);
/*49*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*50*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*51*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*52*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*53*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*54*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*55*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*56*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*57*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*58*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*59*/	r2.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*60*/	r3.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*61*/	r3.w = inversesqrt(r3.w);
/*62*/	r2.yzw = (r2.yyzw * r3.wwww).yzw;
/*63*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*64*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*65*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*66*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*67*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*68*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*69*/	r4.w = r3.w * r6.x + 0.300000;
/*70*/	r4.w = saturate(-r4.w + 1.000000);
/*71*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*72*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*73*/	r7.w = -r3.w * r6.x + 1.000000;
/*74*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*75*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*76*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*77*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*78*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*79*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*80*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*81*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*82*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*83*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*84*/	r4.w = saturate(r3.w);
/*85*/	r4.w = r4.w * r4.w;
/*86*/	r6.w = saturate(dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy)));
/*87*/	r6.w = r6.w * r6.w;
/*88*/	r6.w = r6.w * r6.w;
/*89*/	r4.w = r4.w * r6.w;
/*90*/	r4.z = r4.z * r4.w;
/*91*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*92*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*93*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*94*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*95*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*96*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*97*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*98*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*99*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*100*/	r6.w = inversesqrt(r6.w);
/*101*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*102*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*103*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*104*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*105*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*106*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*107*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*108*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*109*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*110*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*111*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*112*/	r5.y = r5.z * r5.x;
/*113*/	r2.x = r2.x * r2.x;
/*114*/	r3.w = r3.w + r3.w;
/*115*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*116*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.yzwy));
/*117*/	r3.w = max(r3.w, 0.000000);
/*118*/	r2.x = r2.x * 127.000000 + 1.600000;
/*119*/	r3.w = log2(r3.w);
/*120*/	r2.x = r2.x * r3.w;
/*121*/	r2.x = exp2(r2.x);
/*122*/	r2.x = min(r2.x, 1.000000);
/*123*/	r1.w = r1.w * r2.x;
/*124*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*125*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*126*/	r1.w = dot(vec3(-r2.yzwy), vec3(r3.xyzx));
/*127*/	r2.x = r1.w + r1.w;
/*128*/	r2.xyz = (r3.xyzx * -r2.xxxx + -r2.yzwy).xyz;
/*129*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*130*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*131*/	r2.w = inversesqrt(r2.w);
/*132*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*133*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*134*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*135*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*136*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*137*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*138*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*139*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*140*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*141*/	r1.w = saturate(-r1.w + 1.000000);
/*142*/	r1.w = r1.w * r1.w;
/*143*/	r1.w = r4.x * r1.w;
/*144*/	r1.w = r1.w * 1.500000;
/*145*/	r1.w = r5.w * r1.w;
/*146*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*147*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*148*/	r0.w = inversesqrt(r0.w);
/*149*/	r0.w = r0.w * r1.y;
/*150*/	r0.w = max(r0.w, 0.000000);
/*151*/	r0.w = r0.w * r1.w;
/*152*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*153*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*154*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*155*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*156*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*157*/	r0.w = 1.000000;
/*158*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*159*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*160*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*161*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*162*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*163*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*164*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*165*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*166*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*167*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*168*/	if(r0.x != 0) discard;
/*169*/	color0.w = 1.000000;
/*170*/	color1.x = 1.000000;
/*171*/	return;
}
