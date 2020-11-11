//
//
// Shader Model 4
// Fragment Shader
//
// id: 2301 - fxc/glsl_SM_4_0_weightedwithdirtblood.hlsl_PS_ps40_skin_forward_lighting_noclip_no_faction_colour_HDR.glsl
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
/*1*/	r1.xyzw = (texture(s_normal_map, vsOut_T1.zwzz.st)).xyzw;
/*2*/	r1.xy = (r1.wyww + vec4(0.001961, 0.001961, 0.000000, 0.000000)).xy;
/*3*/	r1.xy = (r1.xyxx * vec4(2.000000, 2.000000, 0.000000, 0.000000) + vec4(-1.000000, -1.000000, 0.000000, 0.000000)).xy;
/*4*/	r0.w = dot(vec2(r1.xyxx), vec2(r1.xyxx));
/*5*/	r0.w = -r0.w + 1.000000;
/*6*/	r0.w = max(r0.w, 0.000000);
/*7*/	r2.z = sqrt(r0.w);
/*8*/	r3.xyzw = (texture(s_decal_dirt_mask, vsOut_T1.xyxx.st)).xyzw;
/*9*/	r1.zw = (vsOut_T1.xxxy * cb2.data[2].xxxy + vsOut_T6.xxxy).zw;
/*10*/	r4.xyzw = (texture(s_decal_dirt_map, r1.zwzz.st)).xyzw;
/*11*/	r1.zw = (r4.xxxy * vec4(0.000000, 0.000000, 2.000000, 2.000000) + vec4(0.000000, 0.000000, -1.000000, -1.000000)).zw;
/*12*/	r0.w = r3.w * r4.w;
/*13*/	r3.xyz = (-r0.xyzx + vec4(0.030000, 0.025000, 0.020000, 0.000000)).xyz;
/*14*/	r0.xyz = (r0.wwww * r3.xyzx + r0.xyzx).xyz;
/*15*/	r2.xy = (r1.zwzz * r3.wwww + r1.xyxx).xy;
/*16*/	r0.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*17*/	r0.w = inversesqrt(r0.w);
/*18*/	r1.xyz = (r0.wwww * r2.xyzx).xyz;
/*19*/	r0.w = uintBitsToFloat((vsOut_T8.x < vsOut_T8.z) ? 0xffffffffu : 0x00000000u);
/*20*/	if(r0.w != 0) discard;
/*21*/	r2.xy = (vsOut_T1.xyxx * vec4(0.750000, 0.750000, 0.000000, 0.000000)).xy;
/*22*/	r2.xy = (r2.xyxx * cb2.data[2].xyxx + vsOut_T6.xyxx).xy;
/*23*/	r2.xyzw = (texture(s_decal_blood_map, r2.xyxx.st)).xyzw;
/*24*/	r0.w = -vsOut_T4.z * 0.900000 + 1.000000;
/*25*/	r0.w = saturate(-r0.w + r2.w);
/*26*/	r0.w = uintBitsToFloat((0.000000 < r0.w) ? 0xffffffffu : 0x00000000u);
/*27*/	if(floatBitsToUint(r0.w) != 0u) {
/*28*/	  r0.w = -r2.w + 1.000000;
/*29*/	  r0.w = saturate(vsOut_T4.z * 0.900000 + -r0.w);
/*30*/	  r0.w = -r0.w + 1.000000;
/*31*/	  r0.w = -r0.w * r0.w + 1.000000;
/*32*/	  r0.w = r0.w * -0.600000 + 1.000000;
/*33*/	  r2.xyz = (r0.wwww * vec4(0.240000, 0.000000, 0.000000, 0.000000)).xyz;
/*34*/	  r0.w = saturate(dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000))));
/*35*/	  r0.w = uintBitsToFloat((r0.w < 0.225000) ? 0xffffffffu : 0x00000000u);
/*36*/	  r0.w = uintBitsToFloat(floatBitsToUint(r0.w) & uint(0x3f800000u));
/*37*/	  r3.xyz = (r0.xyzx * vec4(0.300000, 0.000000, 0.000000, 0.000000) + -r2.xzzx).xyz;
/*38*/	  r0.xyz = (r0.wwww * r3.xyzx + r2.xyzx).xyz;
/*39*/	  r2.xy = (vec4(0.800000, 0.020000, 0, 0)).xy;
/*40*/	} else {
/*41*/	  r2.xyzw = (texture(s_gloss_map, vsOut_T1.xyxx.st)).xyzw;
/*42*/	}
/*43*/	r0.w = dot(vec3(vsOut_T3.xyzx), vec3(vsOut_T3.xyzx));
/*44*/	r0.w = inversesqrt(r0.w);
/*45*/	r3.xyz = (r0.wwww * vsOut_T3.xyzx).xyz;
/*46*/	r0.w = dot(vec3(vsOut_T5.xyzx), vec3(vsOut_T5.xyzx));
/*47*/	r0.w = inversesqrt(r0.w);
/*48*/	r4.xyz = (r0.wwww * vsOut_T5.xyzx).xyz;
/*49*/	r0.w = dot(vec3(vsOut_T2.xyzx), vec3(vsOut_T2.xyzx));
/*50*/	r0.w = inversesqrt(r0.w);
/*51*/	r5.xyz = (r0.wwww * vsOut_T2.xyzx).xyz;
/*52*/	r4.xyz = (r1.yyyy * r4.xyzx).xyz;
/*53*/	r1.xyw = (r1.xxxx * r3.xyxz + r4.xyxz).xyw;
/*54*/	r1.xyz = (r1.zzzz * r5.xyzx + r1.xywx).xyz;
/*55*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*56*/	r0.w = inversesqrt(r0.w);
/*57*/	r3.xyz = (r0.wwww * r1.xyzx).xyz;
/*58*/	r4.xyzw = (texture(s_skin_mask_map, vsOut_T1.xyxx.st)).xyzw;
/*59*/	r1.w = vsOut_T7.x * -r2.y + r2.y;
/*60*/	r2.yzw = (r0.xxyz * vec4(0.000000, 5.000000, 5.000000, 5.000000) + vec4(0.000000, 0.200000, 0.200000, 0.200000)).yzw;
/*61*/	r2.yzw = (-r0.xxyz + r2.yyzw).yzw;
/*62*/	r0.xyz = saturate(vsOut_T7.xxxx * r2.yzwy + r0.xyzx).xyz;
/*63*/	r2.y = dot(vec3(r0.xyzx), vec3(vec4(0.212600, 0.715200, 0.072200, 0.000000)));
/*64*/	r2.yzw = (-r0.xxyz + r2.yyyy).yzw;
/*65*/	r0.xyz = (vsOut_T7.yyyy * r2.yzwy + r0.xyzx).xyz;
/*66*/	r1.w = vsOut_T7.y * -r1.w + r1.w;
/*67*/	r2.yzw = (vsOut_T0.xxyz + -cb0.data[0].xxyz).yzw;
/*68*/	r3.w = dot(vec3(r2.yzwy), vec3(r2.yzwy));
/*69*/	r3.w = inversesqrt(r3.w);
/*70*/	r2.yzw = (r2.yyzw * r3.wwww).yzw;
/*71*/	r3.w = uintBitsToFloat((0.000000 < cb1.data[11].x) ? 0xffffffffu : 0x00000000u);
/*72*/	r5.xyzw = mix(vec4(1.000000, 1.000000, 0.800000, 0.650000), vec4(0.004000, 360.000000, 0.600000, 1.000000), greaterThan(floatBitsToUint(r3.wwww), uvec4(0)));
/*73*/	r3.w = dot(vec3(r3.xyzx), vec3(-cb1.data[0].yzwy));
/*74*/	r6.xyz = (r3.wwww * vec4(0.800000, 0.900000, 0.300000, 0.000000) + vec4(0.300000, 0.500000, 0.300000, 0.000000)).xyz;
/*75*/	r6.xyz = saturate(r6.xyzx * vec4(0.694444, 0.694444, 0.444444, 0.000000)).xyz;
/*76*/	r7.xyz = (r6.yyyy * vec4(0.612066, 0.456263, 0.050000, 0.000000)).xyz;
/*77*/	r4.w = r3.w * r6.x + 0.300000;
/*78*/	r4.w = saturate(-r4.w + 1.000000);
/*79*/	r8.xyz = (r4.wwww * r7.xyzx).xyz;
/*80*/	r6.yzw = (r6.zzzz * vec4(0.000000, 0.320000, 0.050000, 0.006000)).yzw;
/*81*/	r7.w = -r3.w * r6.x + 1.000000;
/*82*/	r6.yzw = (r6.yyzw * r7.wwww).yzw;
/*83*/	r7.xyz = (-r7.xyzx * r4.wwww + vec4(1.000000, 1.000000, 1.000000, 0.000000)).xyz;
/*84*/	r8.xyz = (r3.wwww * r6.xxxx + r8.xyzx).xyz;
/*85*/	r6.xyz = (r6.yzwy * r7.xyzx + r8.xyzx).xyz;
/*86*/	r6.xyz = (-r3.wwww + r6.xyzx).xyz;
/*87*/	r6.xyz = saturate(r4.yyyy * r6.xyzx + r3.wwww).xyz;
/*88*/	r6.xyz = (r0.xyzx * r6.xyzx).xyz;
/*89*/	r6.xyz = (r6.xyzx * cb1.data[1].xyzx).xyz;
/*90*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*91*/	r3.w = dot(vec3(r3.xyzx), vec3(cb1.data[0].yzwy));
/*92*/	r4.w = saturate(r3.w);
/*93*/	r4.w = r4.w * r4.w;
/*94*/	r6.w = saturate(dot(vec3(r2.yzwy), vec3(-cb1.data[0].yzwy)));
/*95*/	r6.w = r6.w * r6.w;
/*96*/	r6.w = r6.w * r6.w;
/*97*/	r4.w = r4.w * r6.w;
/*98*/	r4.z = r4.z * r4.w;
/*99*/	r7.xyz = (r4.yyyy * cb1.data[1].xyzx).xyz;
/*100*/	r7.xyz = (r7.xyzx * vec4(-0.300000, -1.000000, -1.000000, 0.000000) + cb1.data[1].xyzx).xyz;
/*101*/	r7.xyz = (r5.xxxx * r7.xyzx).xyz;
/*102*/	r4.yzw = (r4.zzzz * r7.xxyz).yzw;
/*103*/	r4.yzw = (r0.xxyz * r4.yyzw).yzw;
/*104*/	r4.yzw = (r4.yyzw * vec4(0.000000, 0.900000, 0.900000, 0.900000)).yzw;
/*105*/	r4.yzw = (r6.xxyz * vec4(0.000000, 0.900000, 0.900000, 0.900000) + r4.yyzw).yzw;
/*106*/	r6.xyz = (r3.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*107*/	r6.w = dot(vec3(r6.xyzx), vec3(r6.xyzx));
/*108*/	r6.w = inversesqrt(r6.w);
/*109*/	r6.xyz = (r6.wwww * r6.xyzx).xyz;
/*110*/	r7.xyz = (uintBitsToFloat(uvec4(lessThan(r6.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*111*/	r8.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r7.xxxx), uvec4(0)))).xyz/**/;
/*112*/	r7.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r7.yyyy), uvec4(0)))).xyw/**/;
/*113*/	r9.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r7.zzzz), uvec4(0)))).xyz/**/;
/*114*/	r6.xyz = (r6.xyzx * r6.xyzx).xyz;
/*115*/	r7.xyz = (r7.xywx * r6.yyyy).xyz;
/*116*/	r6.xyw = (r6.xxxx * r8.xyxz + r7.xyxz).xyw;
/*117*/	r6.xyz = (r6.zzzz * r9.xyzx + r6.xywx).xyz;
/*118*/	r0.xyz = (r0.xyzx * r6.xyzx).xyz;
/*119*/	r0.xyz = (r5.yyyy * r0.xyzx).xyz;
/*120*/	r5.y = r5.z * r5.x;
/*121*/	r2.x = r2.x * r2.x;
/*122*/	r3.w = r3.w + r3.w;
/*123*/	r6.xyz = (r3.xyzx * -r3.wwww + cb1.data[0].yzwy).xyz;
/*124*/	r3.w = dot(vec3(r6.xyzx), vec3(-r2.yzwy));
/*125*/	r3.w = max(r3.w, 0.000000);
/*126*/	r2.x = r2.x * 127.000000 + 1.600000;
/*127*/	r3.w = log2(r3.w);
/*128*/	r2.x = r2.x * r3.w;
/*129*/	r2.x = exp2(r2.x);
/*130*/	r2.x = min(r2.x, 1.000000);
/*131*/	r1.w = r1.w * r2.x;
/*132*/	r6.xyz = (r1.wwww * cb1.data[1].xyzx).xyz;
/*133*/	r6.xyz = (r5.xxxx * r6.xyzx).xyz;
/*134*/	r1.w = dot(vec3(-r2.yzwy), vec3(r3.xyzx));
/*135*/	r2.x = r1.w + r1.w;
/*136*/	r2.xyz = (r3.xyzx * -r2.xxxx + -r2.yzwy).xyz;
/*137*/	r2.xyz = (r2.xyzx * vec4(1.000000, 4.000000, 1.000000, 0.000000)).xyz;
/*138*/	r2.w = dot(vec3(r2.xyzx), vec3(r2.xyzx));
/*139*/	r2.w = inversesqrt(r2.w);
/*140*/	r2.xyz = (r2.wwww * r2.xyzx).xyz;
/*141*/	r3.xyz = (uintBitsToFloat(uvec4(lessThan(r2.xyzx, vec4(0.000000, 0.000000, 0.000000, 0.000000))) * 0xffffffffu)).xyz;
/*142*/	r7.xyz = (mix(cb1.data[2].xyzx, cb1.data[3].xyzx, greaterThan(floatBitsToUint(r3.xxxx), uvec4(0)))).xyz/**/;
/*143*/	r3.xyw = (mix(cb1.data[4].xyxz, cb1.data[5].xyxz, greaterThan(floatBitsToUint(r3.yyyy), uvec4(0)))).xyw/**/;
/*144*/	r8.xyz = (mix(cb1.data[6].xyzx, cb1.data[7].xyzx, greaterThan(floatBitsToUint(r3.zzzz), uvec4(0)))).xyz/**/;
/*145*/	r2.xyz = (r2.xyzx * r2.xyzx).xyz;
/*146*/	r3.xyz = (r3.xywx * r2.yyyy).xyz;
/*147*/	r2.xyw = (r2.xxxx * r7.xyxz + r3.xyxz).xyw;
/*148*/	r2.xyz = (r2.zzzz * r8.xyzx + r2.xywx).xyz;
/*149*/	r1.w = saturate(-r1.w + 1.000000);
/*150*/	r1.w = r1.w * r1.w;
/*151*/	r1.w = r4.x * r1.w;
/*152*/	r1.w = r1.w * 1.500000;
/*153*/	r1.w = r5.w * r1.w;
/*154*/	r1.xyz = (r1.xyzx * r0.wwww + vec4(0.000000, 0.750000, 0.000000, 0.000000)).xyz;
/*155*/	r0.w = dot(vec3(r1.xyzx), vec3(r1.xyzx));
/*156*/	r0.w = inversesqrt(r0.w);
/*157*/	r0.w = r0.w * r1.y;
/*158*/	r0.w = max(r0.w, 0.000000);
/*159*/	r0.w = r0.w * r1.w;
/*160*/	r1.xyz = (r2.xyzx * r0.wwww).xyz;
/*161*/	r0.xyz = (r0.xyzx * r5.yyyy + r1.xyzx).xyz;
/*162*/	r1.xyz = (r6.xyzx * vec4(2.000000, 2.000000, 2.000000, 0.000000) + r4.yzwy).xyz;
/*163*/	color0.xyz = (r0.xyzx + r1.xyzx).xyz;
/*164*/	r0.xyz = (vsOut_T0.xyzx).xyz;
/*165*/	r0.w = 1.000000;
/*166*/	r1.x = dot(r0.xyzw, cb0.data[9].xyzw);
/*167*/	r1.y = dot(r0.xyzw, cb0.data[10].xyzw);
/*168*/	r0.x = dot(r0.xyzw, cb0.data[12].xyzw);
/*169*/	r0.xy = (r1.xyxx / r0.xxxx).xy;
/*170*/	r0.zw = (uintBitsToFloat(uvec4(greaterThanEqual(r0.xxxy, cb0.data[34].xxxy)) * 0xffffffffu)).zw;
/*171*/	r0.xy = (uintBitsToFloat(uvec4(greaterThanEqual(cb0.data[34].zwzz, r0.xyxx)) * 0xffffffffu)).xy;
/*172*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.x) & floatBitsToUint(r0.z));
/*173*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.w) & floatBitsToUint(r0.x));
/*174*/	r0.x = uintBitsToFloat(floatBitsToUint(r0.y) & floatBitsToUint(r0.x));
/*175*/	r0.x = uintBitsToFloat(~floatBitsToUint(r0.x));
/*176*/	if(r0.x != 0) discard;
/*177*/	color0.w = 1.000000;
/*178*/	color1.x = 1.000000;
/*179*/	return;
}
